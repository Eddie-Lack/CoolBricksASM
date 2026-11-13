"""Check that bank 6 (the music and sound driver) can be moved: shift it, rebuild, and compare the sound.

Usage:
    python tools/sound_relocation_test.py ORIGINAL_ROM [--shift N] [--frames N]

Needs RGBDS on the PATH and PyBoy (pip install pyboy).

tools/relocation_test.py compares the screen only. This test compares what the sound driver does.
It moves the contents of bank 6, builds the ROM and runs the same session on it and on the original:

- every song is started and played for --frames frames (default 5600, longer than the longest song),
- then every sound effect is played over the song, one at a time,
- then sound effects are fired at random moments, so that they cut each other off.

The session does not press buttons. It makes the game call PlaySong and PlaySfx by changing the
program counter when the game enters UpdateSoundDriver.

Two things are recorded and must be the same for both ROMs:

1. Every write the driver makes to the sound registers and wave RAM ($FF10-$FF3F): frame, register, value.
2. The driver's variables (wSoundState, $C000-$C068) at the end of every frame. Variables that hold a
   pointer into bank 6 are expected to differ by exactly the distance the data moved.

The original data has two faults that make the sound depend on where things are (see docs/RESEARCH.md):

- NoiseInstrument_00 reads a stray pointer whose high byte is the low byte of the address of PitchSlide_00.
- Some notes are above the end of NoteFrequencies. Their frequency is read from SfxTable, and one of the
  bytes is the high byte of the address of Sfx_BatBounce.

By default the test therefore moves the bank in two parts. It inserts 3 bytes at the start of the bank and
253 more bytes before PitchSlide_00. Everything before PitchSlide_00 moves by 3 bytes and everything from
there on moves by 256 bytes, so every pointer changes but those two bytes stay the same.

--shift N inserts N bytes at the start of the bank only. The sound then differs where the two faults
play, and the test lists the registers that differ.
"""
import glob
import hashlib
import os
import random
import re
import sys
import shutil
import subprocess
import tempfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from sm83 import op  # noqa: E402

from pyboy import PyBoy  # noqa: E402

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')
BANK = 6
CODE_SIZE = 0x87B           # UpdateSoundDriver to the end of PlaySfx
STATE = 0xC000              # wSoundState
STATE_SIZE = 0x69
SONGS = 10
SOUND_EFFECTS = 30
SPLIT_LABEL = 'PitchSlide_00'
BOOT_FRAMES = 1200          # the language menu is on screen and nothing else changes the sound
STORES = {0x77: 'HL', 0x22: 'HL', 0x32: 'HL', 0x12: 'DE', 0x02: 'BC',
          0x70: 'HL', 0x71: 'HL', 0x72: 'HL', 0x73: 'HL', 0x74: 'HL', 0x75: 'HL', 0x36: 'HL'}
STORE_SOURCE = {0x70: 'B', 0x71: 'C', 0x72: 'D', 0x73: 'E', 0x74: 'H', 0x75: 'L'}


def pointer_variables():
    """Addresses of the driver's 2-byte pointer variables, read from include/ram.inc."""
    found = []
    for line in open(os.path.join(ROOT, 'include', 'ram.inc')):
        m = re.match(r'DEF\s+(w\w+Ptr)\s+EQU\s+\$([0-9a-fA-F]{4})', line)
        if m and STATE <= int(m.group(2), 16) < STATE + STATE_SIZE:
            found.append(int(m.group(2), 16))
    return found


def entry_points(rom):
    """Find PlaySong, PlaySfx and UpdateSoundDriver from the three bank 0 routines that call them."""
    data = open(rom, 'rb').read()
    calls = re.findall(rb'\x3e\x06\xea..\xcd(..)\x3e\x01\xea..', data[:0x4000], re.S)
    if len(calls) != 3:
        raise SystemExit('could not find the three calls into bank 6')
    return [c[0] | c[1] << 8 for c in calls]


def build(workdir, inserts):
    """Copy the sources to workdir, insert bytes into bank 6 and build. inserts is a list of (label or None, count).

    Returns (ROM path, {label: address}).
    """
    if os.path.exists(workdir):
        shutil.rmtree(workdir)
    shutil.copytree(ROOT, workdir, ignore=shutil.ignore_patterns('.git', '*.gbc', '*.o', '*.sym', '*.map'))
    path = glob.glob(os.path.join(workdir, 'banks', 'bank_%03d_*.asm' % BANK))[0]
    lines = open(path).read().rstrip('\n').split('\n')
    total = 0
    for label, count in inserts:
        if label:
            at = next(k for k, line in enumerate(lines) if line.startswith(label + ':'))
        else:
            at = next(k for k, line in enumerate(lines) if line.startswith('SECTION')) + 1
        lines.insert(at, '    ds %d, $00' % count)
        total += count
    # Make room: remove the same number of bytes from the unused data at the end of the bank.
    while total > 0:
        text = lines[-1].split(';')[0].strip()
        if not text.startswith('db ') or '"' in text:
            raise SystemExit('the bank does not end with plain db lines')
        values = [v.strip() for v in text[3:].split(',')]
        take = min(len(values), total)
        total -= take
        values = values[:len(values) - take]
        if values:
            lines[-1] = '    db ' + ', '.join(values)
        else:
            lines.pop()
    open(path, 'w').write('\n'.join(lines) + '\n')
    cmd = 'rgbasm -o game.o game.asm && rgblink -n game.sym -o game.gbc game.o && rgbfix -v -p 255 game.gbc'
    result = subprocess.run(cmd, shell=True, cwd=workdir, capture_output=True, text=True)
    if result.returncode:
        raise SystemExit(result.stderr[-400:])
    symbols = {}
    for line in open(os.path.join(workdir, 'game.sym')):
        m = re.match(r'([0-9a-f]{2}):([0-9a-f]{4}) (\S+)', line)
        if m and int(m.group(1), 16) == BANK:
            symbols[m.group(3)] = int(m.group(2), 16)
    return os.path.join(workdir, 'game.gbc'), symbols


def session(rom, frames, moved, pointers):
    """Run the session. Returns (register writes, per-frame hashes of the driver's variables).

    moved(address) gives the distance a bank 6 address has moved from its place in the original ROM.
    """
    play_song, play_sfx, update = entry_points(rom)
    data = open(rom, 'rb').read()
    pb = PyBoy(rom, window='null', sound_emulated=False)
    pb.set_emulation_speed(0)
    reg = pb.register_file
    mem = pb.memory
    writes = []
    states = []
    pending = []
    frame = [0]

    def get(name):
        # PyBoy has HL as one register and the others as single bytes.
        if name == 'HL':
            return reg.HL
        if name == 'H':
            return reg.HL >> 8
        if name == 'L':
            return reg.HL & 0xFF
        if len(name) == 2:
            return getattr(reg, name[0]) << 8 | getattr(reg, name[1])
        return getattr(reg, name)

    def on_update(_):
        # The game is about to run the driver. Make it call PlaySong or PlaySfx first.
        if pending:
            routine, number = pending.pop(0)
            sp = reg.SP - 2
            mem[sp] = update & 0xFF
            mem[sp + 1] = update >> 8
            reg.SP = sp
            reg.E = number
            reg.PC = routine

    def on_store(info):
        kind, arg = info
        if kind == 'io':
            target, value = 0xFF00 + arg, reg.A
        elif kind == 'abs':
            target, value = arg, reg.A
        else:
            opcode, pair, imm = arg
            target = get(pair)
            value = imm if opcode == 0x36 else get(STORE_SOURCE.get(opcode, 'A'))
        if 0xFF10 <= target <= 0xFF3F:
            writes.append((frame[0], target, value))

    # Hook every instruction in the driver that stores to memory.
    pb.hook_register(BANK, update, on_update, None)
    pc = update
    while pc < update + CODE_SIZE:
        off = BANK * 0x4000 + pc - 0x4000
        length, _, _ = op(data, off)
        opcode = data[off]
        if opcode == 0xE0:
            pb.hook_register(BANK, pc, on_store, ('io', data[off + 1]))
        elif opcode == 0xEA:
            pb.hook_register(BANK, pc, on_store, ('abs', data[off + 1] | data[off + 2] << 8))
        elif opcode in STORES and pc != update:
            pb.hook_register(BANK, pc, on_store, ('reg', (opcode, STORES[opcode], data[off + 1])))
        pc += length

    def run(n):
        for _ in range(n):
            pb.tick(1, False)
            frame[0] += 1
            state = [mem[STATE + i] for i in range(STATE_SIZE)]
            for p in pointers:
                value = state[p - STATE] | state[p - STATE + 1] << 8
                if 0x4000 <= value < 0x8000:
                    value -= moved(value)
                    state[p - STATE] = value & 0xFF
                    state[p - STATE + 1] = value >> 8
            states.append(hashlib.md5(bytes(state)).hexdigest()[:8])

    rnd = random.Random(7)
    run(BOOT_FRAMES)
    for song in range(SONGS):
        pending.append((play_song, song))
        run(frames)
        for effect in range(SOUND_EFFECTS):
            pending.append((play_sfx, effect))
            run(170)
        for _ in range(60):
            pending.append((play_sfx, rnd.randrange(SOUND_EFFECTS)))
            run(rnd.randint(1, 40))
    pb.stop(save=False)
    return writes, states


def main():
    args = sys.argv[1:]
    original = args.pop(0)
    shift, frames = None, 5600
    while args:
        flag = args.pop(0)
        if flag == '--shift':
            shift = int(args.pop(0))
        elif flag == '--frames':
            frames = int(args.pop(0))
        else:
            raise SystemExit('unknown argument %s' % flag)
    pointers = pointer_variables()
    base_writes, base_states = session(original, frames, lambda address: 0, pointers)
    print('original: %d frames, %d writes to the sound registers' % (len(base_states), len(base_writes)))
    with tempfile.TemporaryDirectory() as tmp:
        work = os.path.join(tmp, 'src')
        if shift is None:
            rom, symbols = build(work, [(None, 3), (SPLIT_LABEL, 253)])
            split = symbols[SPLIT_LABEL]
            # Pointers to the 2 bytes before a table belong to the table.
            writes, states = session(rom, frames, lambda address: 256 if address >= split - 2 else 3, pointers)
            print('moved by 3 bytes before %s and by 256 bytes from there on:' % SPLIT_LABEL)
        else:
            rom, symbols = build(work, [(None, shift)])
            writes, states = session(rom, frames, lambda address: shift, pointers)
            print('moved by %d bytes:' % shift)
    print('  %d frames, %d writes to the sound registers' % (len(states), len(writes)))
    ok = True
    if writes != base_writes:
        ok = False
        if [w[:2] for w in writes] == [w[:2] for w in base_writes]:
            bad = [(a, b) for a, b in zip(base_writes, writes) if a != b]
            registers = sorted(set(a[1] for a, b in bad))
            print('  %d writes have another value, first in frame %d. Registers: %s' % (
                len(bad), bad[0][0][0], ', '.join('$%04X' % r for r in registers)))
        else:
            k = next((i for i, (a, b) in enumerate(zip(base_writes, writes)) if a != b), min(len(writes), len(base_writes)))
            print('  register writes differ from write %d:' % k)
            for name, log in (('original', base_writes), ('moved', writes)):
                print('    %s: %s' % (name, ', '.join('frame %d $%04X=$%02X' % w for w in log[k:k + 4])))
    bad = [i for i, (a, b) in enumerate(zip(base_states, states)) if a != b]
    if bad:
        ok = False
        print('  driver variables differ from frame %d (%d of %d frames)' % (bad[0] + 1, len(bad), len(states)))
    print('bank %02X sound: %s' % (BANK, 'identical' if ok else 'DIFFERENT'))
    sys.exit(0 if ok else 1)


if __name__ == '__main__':
    main()

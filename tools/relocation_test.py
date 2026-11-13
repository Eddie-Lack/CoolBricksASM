"""Check that a bank can be moved: shift it by 3 bytes, rebuild, and compare a scripted play-through.

Usage:
    python tools/relocation_test.py ORIGINAL_ROM BANK [BANK ...]
    python tools/relocation_test.py ORIGINAL_ROM --bisect BANK
    python tools/relocation_test.py ORIGINAL_ROM --lang 2 BANK [BANK ...]
    python tools/relocation_test.py ORIGINAL_ROM --lang 4 --shift 256 10

Needs RGBDS on the PATH and PyBoy (pip install pyboy).

For each bank (hex number), the test inserts 3 bytes (see --shift) at the start of the bank, removes
the same number of bytes of padding from its end, builds the ROM and plays the same scripted session on it and on the
original. The screen is compared every 20 frames. If they differ, something still refers to an
address in that bank by number.

--bisect inserts the bytes before each label in turn and reports the last label for which the
play-through still differs. A raw pointer then targets that label's block.

--shift N moves the bank by N bytes instead of 3. The language graphics banks ($0B and $10 to $13)
need a multiple of 256, because the HDMA transfers start at the beginning of the bank's data. Those banks
end with a BankFiller block of stale bytes, and the shifted bytes are taken from it.

A language graphics bank ($0B, $10 to $13) is moved together with the other four, because the code
addresses them all with the labels of bank $0B and a bank that moved alone would be read at the wrong
place. --single moves only the bank that was named. That is expected to differ.

--lang picks the language (0 English, 1 Spanish, 2 French, 3 German, 4 Italian). The default is English.
The high score screen shows the language graphics bank, so for banks $0B and $10 to $13 use the language
that selects the bank: 0 English ($0B), 1 Spanish ($12), 2 French ($11), 3 German ($13), 4 Italian ($10).
"""
import glob
import hashlib
import os
import random
import re
import shutil
import subprocess
import sys
import tempfile

from pyboy import PyBoy

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')
SHIFT = 3

# The five language graphics banks have the same layout, and the code addresses all of them with the
# labels of bank $0B. Moving one of them alone makes the others disagree, so they are moved together.
LANGUAGE_BANKS = [0x0B, 0x10, 0x11, 0x12, 0x13]

# RAM addresses used by the session (see include/ram.inc)
PASSWORD_ENTRY = 0xDAD7
CURRENT_LEVEL = 0xCCE8
GAME_STATE = 0xFF9F
HDMA_MODE = 0xCB53          # 0 or 1 = no transfer, 3 = from bank $0C, other = from the language graphics bank
LANG_GRAPHICS_BANK = 0xDF44

# Language graphics banks seen while the high score animation was running in the last session
HDMA_BANKS = set()


class Done(Exception):
    pass


def session(rom, limit=None, language=0):
    """Play a fixed session and return a short hash of the screen every 20 frames."""
    pb = PyBoy(rom, window='null', sound_emulated=False)
    pb.set_emulation_speed(0)
    out = []
    HDMA_BANKS.clear()
    frame = [0]

    def run(n):
        for _ in range(n):
            pb.tick()
            frame[0] += 1
            if pb.memory[HDMA_MODE] not in (0, 1, 3):
                HDMA_BANKS.add(pb.memory[LANG_GRAPHICS_BANK])
            if frame[0] % 20 == 0:
                out.append(hashlib.md5(pb.screen.image.tobytes()).hexdigest()[:8])
                if limit and len(out) >= limit:
                    pb.stop(save=False)
                    raise Done()

    def press(button, hold=4, after=20):
        pb.button_press(button)
        run(hold)
        pb.button_release(button)
        run(after)

    def password(pw, first):
        if first:
            press('down')
        press('a', after=60)
        for i, ch in enumerate(pw):
            pb.memory[PASSWORD_ENTRY + i] = ord(ch)
        for _ in range(3):
            press('a')
        press('a', after=60)

    rnd = random.Random(7)
    try:
        run(1200)
        for _ in range(language):   # 0 English, 1 Spanish, 2 French, 3 German, 4 Italian
            press('down')
        press('a', after=200)       # language
        press('start', after=160)   # title
        run(900)                    # idle on the menu: high scores appear
        press('a', after=120)
        run(1500)                   # idle again: credits appear and scroll
        press('a', after=200)
        for b in ('down', 'down', 'a', 'down', 'a', 'up', 'up', 'up'):
            press(b)                # toggle music and sound effects
        password('TDNZ', True)      # lives refill on pause
        password('NCNZ', False)     # B skips the level
        password('LSPP', False)     # level 5
        press('up')
        press('up')
        press('a', after=350)
        for level in range(160):
            press('a', after=10)
            for _ in range(10):
                press(rnd.choice(['left', 'right', 'a']), hold=rnd.randint(4, 25), after=2)
            if level % 16 == 0:
                press('start', after=60)
                press('start', after=60)
            pb.memory[CURRENT_LEVEL] = min(level, 159)
            press('b', after=330)
            if pb.memory[GAME_STATE] == 9:
                press('a', after=330)
        for _ in range(8):          # ending, game over, high scores, title
            press('a', after=500)
        run(1500)
        pb.stop(save=False)
    except Done:
        pass
    return out


def labels_of(bank):
    path = glob.glob(os.path.join(ROOT, 'banks', 'bank_%03d_*.asm' % bank))[0]
    found = []
    for line in open(path):
        m = re.match(r'([A-Za-z_][A-Za-z0-9_]*)::?\s*(;.*)?$', line)
        if m and not m.group(1).startswith(('jr_', 'Jump_')):
            found.append(m.group(1))
    return found


def shift_file(workdir, bank, before_label, shift):
    """Insert shift bytes at the start of the bank's file (or before a label) and take them from its padding."""
    path = glob.glob(os.path.join(workdir, 'banks', 'bank_%03d_*.asm' % bank))[0]
    lines = open(path).read().split('\n')
    if before_label:
        at = next(k for k, line in enumerate(lines) if line.startswith(before_label + ':'))
    else:
        at = next(k for k, line in enumerate(lines) if line.startswith('SECTION')) + 1
    lines.insert(at, '    ds %d, $00' % shift)

    # Bank 0 has free space at its end. Other banks are full, so take the bytes from their padding.
    need = 0 if bank == 0 else shift
    k = len(lines) - 1
    while need > 0 and k > at:
        text = lines[k].split(';')[0].strip()
        m = re.match(r'ds (\d+), (\$[0-9a-f]+)$', text)
        if m:
            count = int(m.group(1))
            take = min(count, need)
            need -= take
            lines[k] = '    ds %d, %s' % (count - take, m.group(2)) if count - take else ''
        elif text.startswith('db ') and '"' not in text:
            values = [v.strip() for v in text[3:].split(',')]
            take = min(len(values), need)
            need -= take
            values = values[:len(values) - take]
            lines[k] = '    db ' + ', '.join(values) if values else ''
        elif text and not text.endswith(':'):
            return False
        k -= 1
    if need:
        return False
    open(path, 'w').write('\n'.join(lines))
    return True


def build_shifted(banks, workdir, before_label=None, shift=SHIFT):
    """Copy the sources to workdir with the banks shifted and build them. Returns the ROM path or None."""
    if isinstance(banks, int):
        banks = [banks]
    if os.path.exists(workdir):
        shutil.rmtree(workdir)
    shutil.copytree(ROOT, workdir, ignore=shutil.ignore_patterns('.git', '*.gbc', '*.o', '*.sym', '*.map'))
    for bank in banks:
        if not shift_file(workdir, bank, before_label, shift):
            return None
    cmd = 'rgbasm -o game.o game.asm && rgblink -o game.gbc game.o && rgbfix -v -p 255 game.gbc'
    result = subprocess.run(cmd, shell=True, cwd=workdir, capture_output=True, text=True)
    if result.returncode:
        print(result.stderr[-400:])
        return None
    return os.path.join(workdir, 'game.gbc')


def differences(base, other):
    return [i for i, (a, b) in enumerate(zip(base, other)) if a != b]


def main():
    args = sys.argv[1:]
    original = args.pop(0)
    bisect = '--bisect' in args
    language = 0
    if '--lang' in args:
        i = args.index('--lang')
        language = int(args[i + 1])
        del args[i:i + 2]
    single = '--single' in args
    shift = SHIFT
    if '--shift' in args:
        i = args.index('--shift')
        shift = int(args[i + 1])
        del args[i:i + 2]
    banks = [int(a, 16) for a in args if a not in ('--bisect', '--single')]
    base = session(original, language=language)
    shown = set(HDMA_BANKS)
    with tempfile.TemporaryDirectory() as tmp:
        work = os.path.join(tmp, 'src')
        for bank in banks:
            if bank in LANGUAGE_BANKS and bank not in shown:
                shown_text = ', '.join('%02X' % b for b in sorted(shown)) or 'none'
                print('bank %02X: not shown in language %d (the session shows bank %s), use --lang' % (bank, language, shown_text))
                continue
            group = [bank] if single or bank not in LANGUAGE_BANKS else LANGUAGE_BANKS
            rom = build_shifted(group, work, shift=shift)
            if not rom:
                print('bank %02X: could not be shifted' % bank)
                continue
            bad = differences(base, session(rom, language=language))
            if not bad:
                print('bank %02X: identical' % bank)
                continue
            print('bank %02X: differs from frame %d (%d of %d samples)' % (bank, bad[0] * 20 + 20, len(bad), len(base)))
            if not bisect:
                continue
            limit = bad[0] + 3
            labels = labels_of(bank)
            lo, hi = -1, len(labels)   # the largest index whose insertion still fails is lo
            while hi - lo > 1:
                mid = (lo + hi) // 2
                rom = build_shifted(bank, work, labels[mid], shift)
                if rom and differences(base, session(rom, limit, language)):
                    lo = mid
                else:
                    hi = mid
            print('  a raw pointer targets the block of: %s' % (labels[lo] if lo >= 0 else '(before the first label)'))


if __name__ == '__main__':
    main()

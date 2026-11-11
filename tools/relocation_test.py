"""Check that a bank can be moved: shift it by 3 bytes, rebuild, and compare a scripted play-through.

Usage:
    python tools/relocation_test.py ORIGINAL_ROM BANK [BANK ...]
    python tools/relocation_test.py ORIGINAL_ROM --bisect BANK

Needs RGBDS on the PATH and PyBoy (pip install pyboy).

For each bank (hex number), the test inserts 3 bytes at the start of the bank, removes 3 bytes
of padding from its end, builds the ROM and plays the same scripted session on it and on the
original. The screen is compared every 20 frames. If they differ, something still refers to an
address in that bank by number.

--bisect inserts the bytes before each label in turn and reports the last label for which the
play-through still differs. A raw pointer then targets that label's block.

The session uses English only, so the other language tables and banks $10-$13 are not exercised.
Bank 4 ends with an image and cannot be shortened, so it cannot be tested this way.
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

# RAM addresses used by the session (see include/ram.inc)
PASSWORD_ENTRY = 0xDAD7
CURRENT_LEVEL = 0xCCE8
GAME_STATE = 0xFF9F


class Done(Exception):
    pass


def session(rom, limit=None):
    """Play a fixed session and return a short hash of the screen every 20 frames."""
    pb = PyBoy(rom, window='null', sound_emulated=False)
    pb.set_emulation_speed(0)
    out = []
    frame = [0]

    def run(n):
        for _ in range(n):
            pb.tick()
            frame[0] += 1
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
        press('a', after=200)       # language
        press('start', after=160)   # title
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


def build_shifted(bank, workdir, before_label=None):
    """Copy the sources to workdir with the bank shifted and build them. Returns the ROM path or None."""
    if os.path.exists(workdir):
        shutil.rmtree(workdir)
    shutil.copytree(ROOT, workdir, ignore=shutil.ignore_patterns('.git', '*.gbc', '*.o', '*.sym', '*.map'))
    path = glob.glob(os.path.join(workdir, 'banks', 'bank_%03d_*.asm' % bank))[0]
    lines = open(path).read().split('\n')
    if before_label:
        at = next(k for k, line in enumerate(lines) if line.startswith(before_label + ':'))
    else:
        at = next(k for k, line in enumerate(lines) if line.startswith('SECTION')) + 1
    lines.insert(at, '    ds %d, $00' % SHIFT)

    # Bank 0 has free space at its end. Other banks are full, so take the bytes from their padding.
    need = 0 if bank == 0 else SHIFT
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
            return None
        k -= 1
    if need:
        return None
    open(path, 'w').write('\n'.join(lines))
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
    banks = [int(a, 16) for a in args if a != '--bisect']
    base = session(original)
    with tempfile.TemporaryDirectory() as tmp:
        work = os.path.join(tmp, 'src')
        for bank in banks:
            rom = build_shifted(bank, work)
            if not rom:
                print('bank %02X: could not be shifted' % bank)
                continue
            bad = differences(base, session(rom))
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
                rom = build_shifted(bank, work, labels[mid])
                if rom and differences(base, session(rom, limit)):
                    lo = mid
                else:
                    hi = mid
            print('  a raw pointer targets the block of: %s' % (labels[lo] if lo >= 0 else '(before the first label)'))


if __name__ == '__main__':
    main()

"""Measure how complete the disassembly is and write the progress badges.

Usage: python tools/progress.py

Writes docs/badges/*.svg and docs/progress.json. Every number except the two manual ones is
measured from the sources. The manual numbers (relocation tests and play-testing) are read
from docs/progress_manual.json.
"""
import glob
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gbasm import Asm  # noqa: E402

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')
CODE_FILES = ['banks/bank_000_000.asm', 'banks/bank_001_001.asm', 'banks/bank_006_006.asm',
              'banks/bank_015_00f.asm', 'src/interrupts.asm']
INSTR = re.compile(r'\s+(ld|ldh|call|jp|jr|push|pop|xor|or|and|cp|inc|dec|add|adc|sub|sbc|ret|reti|bit|set|res|halt|'
                   r'di|ei|nop|swap|rl|rr|rla|rra|rlca|rrca|rlc|rrc|sla|sra|srl|cpl|ccf|scf|daa|stop|rst)\b')
LABEL = re.compile(r'([A-Za-z_][A-Za-z0-9_]*)::?\s*(;.*)?$')
AUTO = re.compile(r'^(jr|Jump|Call)_[0-9a-f]{3}_[0-9a-f]{4}$|^[wh]Unk_[0-9a-f]+$')
SKIP = re.compile(r'^(jr|Jump)_|^\.|\.')


def read(path):
    return open(os.path.join(ROOT, path)).read().split('\n')


def routines():
    """Return (name, has_header_comment, automatic_name) for every global label that starts code."""
    out = []
    for f in CODE_FILES:
        lines = read(f)
        for i, line in enumerate(lines):
            m = LABEL.match(line)
            if not m or m.group(1).startswith('.'):
                continue
            j = i + 1
            while j < len(lines) and (not lines[j].strip() or LABEL.match(lines[j])):
                j += 1
            if j < len(lines) and INSTR.match(lines[j]) and not (m.group(1).startswith('jr_')):
                out.append((m.group(1), i > 0 and lines[i - 1].startswith(';'), bool(AUTO.match(m.group(1)))))
    return out


def ratio(n, d):
    return 100.0 * n / d if d else 100.0


def measure():
    r = routines()
    res = {}
    res['routines'] = (sum(1 for x in r if not x[2]), len(r))
    res['comments'] = (sum(1 for x in r if x[1]), len(r))

    auto_jr = named_local = 0
    for f in glob.glob(os.path.join(ROOT, 'banks', '*.asm')) + glob.glob(os.path.join(ROOT, 'src', '*.asm')):
        for line in open(f):
            if re.match(r'jr_[0-9a-f]{3}_[0-9a-f]{4}:', line):
                auto_jr += 1
            elif re.match(r'\.[A-Za-z0-9_]+:', line):
                named_local += 1
    res['locals'] = (named_local, named_local + auto_jr)

    ram = open(os.path.join(ROOT, 'include', 'ram.inc')).read()
    unk = len(re.findall(r'^DEF [wh]Unk_', ram, re.M))
    allv = len(re.findall(r'^DEF [wh][A-Za-z0-9_]+ ', ram, re.M))
    res['ram'] = (allv - unk, allv)

    pngs = {os.path.basename(p)[:-4] for p in glob.glob(os.path.join(ROOT, 'gfx', '*.png'))}
    bpps = {os.path.basename(p)[:-5] for p in glob.glob(os.path.join(ROOT, 'gfx', '*.2bpp'))}
    res['graphics'] = (len(pngs & bpps), len(bpps))

    asm = Asm(ROOT)
    asm.load('game.asm')
    asm.run()
    used = {}
    for path, num, bank, pc, size in asm.listing:
        b = bank if pc >= 0x4000 else 0
        used[b] = used.get(b, 0) + size
    first = {}
    for name, addr in asm.syms.items():
        if name not in asm.banks or SKIP.search(name) or AUTO.match(name):
            continue
        b = asm.banks[name] if addr >= 0x4000 else 0
        first[b] = min(first.get(b, 1 << 20), addr)
    unlabelled = 0
    for b, n in used.items():
        base = 0 if b == 0 else 0x4000
        if b not in first:
            unlabelled += n
        else:
            unlabelled += max(0, first[b] - base)
    total = 64 * 0x4000
    res['data'] = (total - unlabelled, total)

    manual_path = os.path.join(ROOT, 'docs', 'progress_manual.json')
    if os.path.exists(manual_path):
        m = json.load(open(manual_path))
        if 'relocation' in m:
            res['relocation'] = (len(m['relocation']['passing']), m['relocation']['total'])
        if 'playtest' in m:
            res['playtest'] = (m['playtest']['verified'], m['playtest']['total'])
    return res


LABELS = [('routines', 'Routines named'), ('locals', 'Local labels'), ('ram', 'RAM named'),
          ('data', 'Data labelled'), ('graphics', 'Graphics PNGs'), ('comments', 'Routine comments'),
          ('relocation', 'Relocation tested'), ('playtest', 'Play-tested')]


def colour(p):
    if p >= 99.995:
        return '#4c1'
    if p >= 80:
        return '#a3c51c'
    if p >= 60:
        return '#dfb317'
    if p >= 40:
        return '#fe7d37'
    return '#e05d44'


def badge(label, value, col):
    lw = int(7.6 * len(label)) + 14
    vw = int(7.6 * len(value)) + 14
    w = lw + vw
    return ('<svg xmlns="http://www.w3.org/2000/svg" width="%d" height="20" role="img" aria-label="%s: %s">'
            '<title>%s: %s</title>'
            '<linearGradient id="s" x2="0" y2="100%%"><stop offset="0" stop-color="#bbb" stop-opacity=".1"/>'
            '<stop offset="1" stop-opacity=".1"/></linearGradient>'
            '<clipPath id="r"><rect width="%d" height="20" rx="3" fill="#fff"/></clipPath>'
            '<g clip-path="url(#r)"><rect width="%d" height="20" fill="#555"/>'
            '<rect x="%d" width="%d" height="20" fill="%s"/><rect width="%d" height="20" fill="url(#s)"/></g>'
            '<g fill="#fff" text-anchor="middle" font-family="Verdana,Geneva,DejaVu Sans,sans-serif" font-size="11">'
            '<text x="%d" y="15" fill="#010101" fill-opacity=".3">%s</text><text x="%d" y="14">%s</text>'
            '<text x="%d" y="15" fill="#010101" fill-opacity=".3">%s</text><text x="%d" y="14">%s</text></g></svg>\n'
            % (w, label, value, label, value, w, lw, lw, vw, col, w,
               lw // 2, label, lw // 2, label, lw + vw // 2, value, lw + vw // 2, value))


def main():
    res = measure()
    out = os.path.join(ROOT, 'docs', 'badges')
    os.makedirs(out, exist_ok=True)
    summary = {}
    for key, label in LABELS:
        if key not in res:
            continue
        n, d = res[key]
        p = ratio(n, d)
        summary[key] = dict(done=n, total=d, percent=round(p, 2))
        with open(os.path.join(out, key + '.svg'), 'w') as f:
            f.write(badge(label, '%.2f%%' % p, colour(p)))
        print('%-18s %6d / %-8d %7.2f%%' % (label, n, d, p))
    with open(os.path.join(ROOT, 'docs', 'progress.json'), 'w') as f:
        json.dump(summary, f, indent=2)
        f.write('\n')


if __name__ == '__main__':
    main()

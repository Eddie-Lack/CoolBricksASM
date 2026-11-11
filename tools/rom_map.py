"""Write docs/ROM_MAP.md: what each part of every ROM bank holds, taken from the labels.

Usage: python tools/rom_map.py
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gbasm import Asm  # noqa: E402

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')
SKIP = re.compile(r'^(jr|Jump)_|^\.|\.')
CODE = re.compile(r'^(ld|ldh|call|jp|jr|ret|reti|push|pop|add|adc|sub|sbc|and|or|xor|cp|inc|dec|bit|set|res|rst|'
                  r'halt|stop|di|ei|nop|swap|sla|sra|srl|rl|rr|rlc|rrc|rla|rra|rlca|rrca|cpl|ccf|scf|daa)\b')


def main():
    asm = Asm(ROOT)
    asm.load('game.asm')
    asm.run()

    # What kind of line starts at each address, and how many bytes each bank uses.
    kind = {}
    used = {}
    for path, num, bank, pc, size in asm.listing:
        b = bank if pc >= 0x4000 else 0
        used[b] = used.get(b, 0) + size
    for path, num, line in asm.lines:
        pass
    line_text = {(p, n): t for p, n, t in asm.lines}
    for path, num, bank, pc, size in asm.listing:
        b = bank if pc >= 0x4000 else 0
        text = line_text[(path, num)]
        text = re.sub(r'^\.?[A-Za-z_][A-Za-z0-9_.]*::?\s*', '', text)
        word = text.split(' ')[0]
        k = 'graphics' if word.upper() == 'INCBIN' else 'code' if CODE.match(word) else 'data'
        kind.setdefault((b, pc), k)

    labels = {}
    for name, addr in asm.syms.items():
        if name not in asm.banks or SKIP.search(name):
            continue
        b = asm.banks[name] if addr >= 0x4000 else 0
        labels.setdefault(b, []).append((addr, name))

    out = ['# ROM map', '',
           'What each part of every ROM bank holds. This file is written by `tools/rom_map.py` from the labels in the sources.',
           'Runs of labels with the same prefix are shown as one row.', '']
    for b in sorted(used):
        labs = sorted(labels.get(b, []))
        end_of_bank = 0x4000 if b == 0 else 0x8000
        out.append('## Bank $%02X' % b)
        out.append('')
        if not labs:
            out.append('No labels. %d bytes of unlabelled data.' % used[b])
            out.append('')
            continue
        # Merge labels at the same address, then group runs with the same prefix and kind.
        blocks = []
        for i, (addr, name) in enumerate(labs):
            if blocks and blocks[-1]['start'] == addr:
                continue
            nxt = next((a for a, _ in labs[i + 1:] if a > addr), end_of_bank)
            blocks.append(dict(start=addr, end=nxt, name=name, kind=kind.get((b, addr), 'data')))
        rows = []
        for blk in blocks:
            prefix = re.sub(r'_?[0-9A-Fa-f]*$', '', blk['name'].rsplit('_', 1)[0]) if '_' in blk['name'] else blk['name']
            if rows and rows[-1]['prefix'] == prefix and rows[-1]['kind'] == blk['kind'] and '_' in blk['name']:
                rows[-1]['end'] = blk['end']
                rows[-1]['last'] = blk['name']
                rows[-1]['count'] += 1
            else:
                rows.append(dict(prefix=prefix, kind=blk['kind'], start=blk['start'], end=blk['end'],
                                 first=blk['name'], last=blk['name'], count=1))
        out.append('| Address | Bytes | Kind | Labels |')
        out.append('|---|---|---|---|')
        first_start = rows[0]['start']
        base = 0 if b == 0 else 0x4000
        if first_start > base:
            out.append('| `$%04X` | %d | data | (no label) |' % (base, first_start - base))
        for r in rows:
            names = '`%s`' % r['first'] if r['count'] == 1 else '`%s` to `%s` (%d labels)' % (r['first'], r['last'], r['count'])
            out.append('| `$%04X` | %d | %s | %s |' % (r['start'], r['end'] - r['start'], r['kind'], names))
        out.append('')
    out.append('Banks that are not listed have no content in the sources and are filled with zeros.')
    out.append('')
    with open(os.path.join(ROOT, 'docs', 'ROM_MAP.md'), 'w') as f:
        f.write('\n'.join(out))


if __name__ == '__main__':
    main()

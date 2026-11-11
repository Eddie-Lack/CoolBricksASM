"""A small Game Boy assembler for the subset of RGBDS syntax that the disassembly uses.

Usage: python tools/gbasm.py game.asm out.gbc [expected_md5]

It exists so the disassembly can be checked without RGBDS installed. It supports
SECTION (ROM0/ROMX with fixed address and bank), INCLUDE, INCBIN, DEF..EQU, ASSERT, db, dw, ds,
global and local labels, and the expression operators the sources need. It does not
support macros. `include/hardware.inc` is read for its DEF..EQU lines only.
Unused space is filled with 0, as rgblink does.
"""
import hashlib
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from sm83 import op  # noqa: E402

REGS = {'a', 'b', 'c', 'd', 'e', 'h', 'l', 'af', 'bc', 'de', 'hl', 'sp', 'nz', 'z', 'nc',
        '[hl]', '[bc]', '[de]', '[hl+]', '[hl-]', '[c]'}
ALIASES = {'[hli]': '[hl+]', '[hld]': '[hl-]', '[$ff00+c]': '[c]', '[_io+c]': '[c]'}
ALU_A = {'add', 'adc', 'sbc'}                  # table form "op a,x"
ALU_BARE = {'sub', 'and', 'xor', 'or', 'cp'}   # table form "op x"


def build_table():
    """Map 'mnemonic operands' keys to (opcode bytes, operand kind, length)."""
    table = {}

    def norm(text):
        text = text.replace('$ff34', '@h').replace('$1234', '@w').replace('$34', '@b')
        return text

    for o in range(256):
        if o == 0xCB:
            continue
        rom = bytes([o, 0x34, 0x12])
        length, text, _ = op(rom, 0)
        if text.startswith('db '):
            continue
        mn, _, ops = text.partition(' ')
        if mn == 'jr':
            ops = re.sub(r'\$[0-9a-f]+', '@r', ops)
            kind = 'r'
        elif mn == 'rst':
            table['rst %d' % (o & 0x38)] = (bytes([o]), '', 1)
            continue
        elif mn == 'stop':
            table['stop'] = (bytes([0x10, 0x00]), '', 2)
            continue
        else:
            ops = norm(ops)
            kind = 'h' if '@h' in ops else 'w' if '@w' in ops else 'b' if '@b' in ops else ''
        key = (mn + ' ' + re.sub(r'@.', '#', ops)).strip()
        table[key] = (bytes([o]), kind, length)
    for c in range(256):
        _, text, _ = op(bytes([0xCB, c]), 0)
        table[text] = (bytes([0xCB, c]), '', 2)
    return table


TABLE = build_table()
TOKEN = re.compile(r'\s*(\$[0-9a-fA-F]+|%[01]+|\d+|[A-Za-z_.][A-Za-z0-9_.#@]*|<<|>>|==|!=|<=|>=|&&|\|\||[-+*/%&|^~()<>!@])')


class Asm:
    def __init__(self, root):
        self.root = root
        self.syms = {}
        self.banks = {}
        self.rom = bytearray(0x100000)
        self.scope = ''
        self.lines = []
        self.defined = set()
        self.listing = []   # (file, line, bank, address, size) for each emitting line

    # --- source loading -------------------------------------------------
    def load(self, path):
        full = os.path.join(self.root, path)
        equ_only = os.path.basename(path) == 'hardware.inc'
        with open(full, encoding='utf-8', errors='replace') as f:
            for num, raw in enumerate(f, 1):
                line = self.strip_comment(raw).strip()
                if not line:
                    continue
                m = re.match(r'INCLUDE\s+"([^"]+)"', line, re.I)
                if m:
                    self.load(m.group(1))
                    continue
                if equ_only and not re.match(r'DEF\s+\w+\s+EQU\s', line, re.I):
                    continue
                self.lines.append((path, num, line))

    @staticmethod
    def strip_comment(line):
        out = []
        quote = False
        for ch in line:
            if ch == '"':
                quote = not quote
            if ch == ';' and not quote:
                break
            out.append(ch)
        return ''.join(out)

    # --- expressions ----------------------------------------------------
    def evaluate(self, text, final=True):
        pos = 0
        out = []
        text = text.strip()
        while pos < len(text):
            m = TOKEN.match(text, pos)
            if not m:
                raise ValueError('bad expression: %r' % text)
            tok = m.group(1)
            pos = m.end()
            if tok == '@':
                out.append(str(self.pc))
            elif tok[0] == '$':
                out.append(str(int(tok[1:], 16)))
            elif tok[0] == '%' and len(tok) > 1:
                out.append(str(int(tok[1:], 2)))
            elif tok[0].isdigit():
                out.append(str(int(tok)))
            elif tok[0].isalpha() or tok[0] in '_.':
                up = tok.upper()
                if up in ('LOW', 'HIGH', 'BANK'):
                    out.append('_%s' % up)
                else:
                    name = self.scope + tok if tok[0] == '.' else tok
                    out.append('_sym(%r)' % name)
            elif tok == '/':
                out.append('//')
            elif tok == '&&':
                out.append(' and ')
            elif tok == '||':
                out.append(' or ')
            elif tok == '!':
                out.append(' not ')
            else:
                out.append(tok)

        def _sym(name):
            if name in self.syms:
                return self.syms[name]
            if final:
                raise KeyError('undefined symbol %s' % name)
            return 0

        class BankOf:
            def __init__(s, asm):
                s.asm = asm

        def _bank(name_value):
            return name_value

        expr = ''.join(out)
        # BANK(sym) needs the symbol name, not its value.
        expr = re.sub(r"_BANK\(_sym\('([^']+)'\)\)", lambda mm: str(self.banks.get(mm.group(1), 0) if not final
                                                                      else self.banks[mm.group(1)]), expr)
        env = {'_sym': _sym, '_LOW': lambda v: v & 0xFF, '_HIGH': lambda v: (v >> 8) & 0xFF}
        return int(eval(expr, {'__builtins__': {}}, env))

    # --- helpers --------------------------------------------------------
    @staticmethod
    def split_args(text):
        args, cur, depth, quote = [], '', 0, False
        for ch in text:
            if ch == '"':
                quote = not quote
            if not quote:
                if ch in '([':
                    depth += 1
                if ch in ')]':
                    depth -= 1
                if ch == ',' and depth == 0:
                    args.append(cur.strip())
                    cur = ''
                    continue
            cur += ch
        if cur.strip():
            args.append(cur.strip())
        return args

    def classify(self, mn, args):
        """Return (table key, [expression strings])."""
        exprs, parts = [], []
        for i, a in enumerate(args):
            low = re.sub(r'\s+', '', a.lower())
            low = ALIASES.get(low, low)
            if mn in ('bit', 'res', 'set') and i == 0:
                parts.append(str(self.evaluate(a)))
            elif low in REGS:
                parts.append(low)
            elif low.startswith('[') and low.endswith(']'):
                parts.append('[#]')
                exprs.append(a.strip()[1:-1])
            elif low.startswith('sp+') or low.startswith('sp-'):
                parts.append('sp+#')
                exprs.append(a.strip()[2:])
            else:
                parts.append('#')
                exprs.append(a)
        if mn in ALU_A and len(parts) == 1:
            parts.insert(0, 'a')
        if mn in ALU_BARE and len(parts) == 2 and parts[0] == 'a':
            parts.pop(0)
        if mn == 'ldh' and '[c]' in parts:
            mn = 'ld'
        if mn == 'rst':
            return 'rst %d' % self.evaluate(args[0]), []
        return (mn + ' ' + ','.join(parts)).strip(), exprs

    # --- assembly -------------------------------------------------------
    def run(self):
        for final in (False, True):
            self.pass_(final)

    def pass_(self, final):
        bank, pc = 0, 0
        self.scope = ''
        for path, num, line in self.lines:
            self.pc = pc
            try:
                # Labels (one per line, optionally followed by a statement).
                m = re.match(r'(\.?[A-Za-z_][A-Za-z0-9_.]*)(::?)\s*(.*)$', line)
                if m:
                    name = m.group(1)
                    if name[0] == '.':
                        name = self.scope + name
                    else:
                        self.scope = name
                    if not final:
                        if name in self.defined:
                            raise ValueError('symbol %s is defined twice' % name)
                        self.defined.add(name)
                    self.syms[name] = pc
                    self.banks[name] = bank
                    line = m.group(3)
                    self.pc = pc
                    if not line:
                        continue
                word, _, rest = line.partition(' ')
                up = word.upper()
                if up == 'SECTION':
                    m = re.search(r'(ROM0|ROMX)\s*\[([^\]]+)\](?:\s*,\s*BANK\s*\[([^\]]+)\])?', rest, re.I)
                    pc = self.evaluate(m.group(2))
                    bank = self.evaluate(m.group(3)) if m.group(3) else 0
                    continue
                if up == 'ASSERT':
                    cond = self.split_args(rest)[0]
                    if final and not self.evaluate(cond, True):
                        raise ValueError('assertion failed: %s' % rest)
                    continue
                if up == 'DEF':
                    m = re.match(r'(\w+)\s+EQU\s+(.+)$', rest.strip(), re.I)
                    if not final:
                        if m.group(1) in self.defined:
                            raise ValueError('symbol %s is defined twice' % m.group(1))
                        self.defined.add(m.group(1))
                    self.syms[m.group(1)] = self.evaluate(m.group(2), final)
                    continue
                if up == 'DB':
                    data = bytearray()
                    for a in self.split_args(rest):
                        if a.startswith('"'):
                            data += a[1:-1].encode('latin-1')
                        else:
                            v = self.evaluate(a, final)
                            if final and not -128 <= v <= 255:
                                raise ValueError('db value %d does not fit in a byte' % v)
                            data.append(v & 0xFF)
                elif up == 'DW':
                    data = bytearray()
                    for a in self.split_args(rest):
                        v = self.evaluate(a, final) & 0xFFFF
                        data += bytes([v & 0xFF, v >> 8])
                elif up == 'DS':
                    a = self.split_args(rest)
                    data = bytearray([self.evaluate(a[1], final) & 0xFF if len(a) > 1 else 0]) * self.evaluate(a[0])
                elif up == 'INCBIN':
                    data = open(os.path.join(self.root, rest.strip().strip('"')), 'rb').read()
                else:
                    mn = word.lower()
                    key, exprs = self.classify(mn, self.split_args(rest))
                    if key not in TABLE:
                        raise ValueError('unknown instruction %r' % key)
                    code, kind, length = TABLE[key]
                    data = bytearray(code)
                    if kind:
                        v = self.evaluate(exprs[0], final)
                        if kind == 'w':
                            data += bytes([v & 0xFF, (v >> 8) & 0xFF])
                        elif kind == 'r':
                            d = v - (pc + 2)
                            if final and not -128 <= d <= 127:
                                raise ValueError('jr out of range')
                            data.append(d & 0xFF)
                        else:
                            data.append(v & 0xFF)
                    assert len(data) == length, (key, len(data), length)
                if final:
                    self.listing.append((path, num, bank, pc, len(data)))
                    off = pc if pc < 0x4000 else bank * 0x4000 + pc - 0x4000
                    if pc < 0x4000 and bank:
                        raise ValueError('ROMX address below $4000')
                    self.rom[off:off + len(data)] = data
                pc += len(data)
                if final and pc > (0x4000 if not bank else 0x8000):
                    raise ValueError('section overflows bank %x' % bank)
            except Exception as e:
                raise SystemExit('%s:%d: %s\n    %s' % (path, num, e, line))


def main():
    src, out = sys.argv[1], sys.argv[2]
    asm = Asm(os.path.dirname(os.path.abspath(src)))
    asm.load(os.path.basename(src))
    asm.run()
    with open(out, 'wb') as f:
        f.write(asm.rom)
    digest = hashlib.md5(asm.rom).hexdigest()
    print('md5', digest)
    if len(sys.argv) > 3:
        if digest != sys.argv[3]:
            raise SystemExit('MISMATCH: expected %s' % sys.argv[3])
        print('ROM matches')


if __name__ == '__main__':
    main()

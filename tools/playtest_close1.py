"""Play-test pass that closes six names the earlier passes left open (weapons, states, sound).

Run from the repository root after `make`, one emulator at a time (PyBoy installed):

    python tools/playtest_close1.py --list
    python tools/playtest_close1.py --static
    python tools/playtest_close1.py --scenario close_dmg
    python tools/playtest_close1.py --scenario close_blast_sweep
    python tools/playtest_close1.py --scenario close_grenade_count
    python tools/playtest_close1.py --scenario close_sfx_log

Item by item (what is observed, what is poked, what is proved by reading):

    2   Projectile_HitBrick on a wall cell ($0f).  --static decodes BrickLayout_Base (the walls, written last
        into every level), reads the probe bytes of the grenade frames and gives the x bound.
        close_blast_sweep throws grenades from every x of the field (POKED slot) in all three directions and
        all eleven throw powers, also over planted unbreakable bricks, and checks the cell under every blast
        corner and the range of X and Y of the flight.
    5   ColorOnly_Update (jr to itself), StateInit_ColorOnly, StateUpdate_ColorOnly.  close_dmg runs the ROM in
        Game Boy (DMG) mode: no poke, state 10 is reached by the real GBC_Check path.  --static lists every
        write of hGameState.
    8   UpdateProjectile dead load.  --static: bytes, labels, jump targets and the next writer of A.
    11  Sfx_29.  --static: every PlaySound call and the value of A at each.  close_sfx_log logs every PlaySound
        argument over a long real run.
    14  Pattern_Unused_5dfc.  --static: single definition, no pointer bytes anywhere in the ROM.
    17  GrenadeTexts index above 7.  close_grenade_count: three Grenade power-ups are caught (the falling
        power-up is a harness helper that pokes the falling slot; the pick-up code itself runs for real),
        the count is never poked, and the grenades are thrown one by one. The ball is lifted by a poke when it is low,
        so that the bat is not lost (a lost bat ends the weapon and the count is cleared at the restart).
"""
import argparse
import collections
import os
import re
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import coverage as cv  # noqa: E402
import playtest_weapons as pw  # noqa: E402  (helpers: CheckWatch, verdict, table, W, to_level_with_ball)
from sm83 import op  # noqa: E402

ROOT = cv.ROOT
CheckWatch, verdict, table, W = pw.CheckWatch, pw.verdict, pw.table, pw.W
SCENARIOS, SPECS, CHECKS = {}, {}, {}
STATE = {}


def scenario(watches, check):
    def deco(fn):
        name = fn.__name__.replace('scenario_', '')
        SCENARIOS[name], SPECS[name], CHECKS[name] = fn, watches, check
        return fn
    return deco


# --------------------------------------------------------------------------- static helpers

def read_lines(path):
    with open(os.path.join(ROOT, path), errors='replace') as f:
        return f.read().split('\n')


def asm_files():
    out = []
    for d in ('banks', 'src', 'include'):
        for fn in sorted(os.listdir(os.path.join(ROOT, d))):
            if fn.endswith(('.asm', '.inc')):
                out.append(os.path.join(d, fn))
    return out


def rom():
    with open(os.path.join(ROOT, 'game.gbc'), 'rb') as f:
        return f.read()


def off(bank, addr):
    return addr if bank == 0 else bank * 0x4000 + addr - 0x4000


def consts():
    """Numeric EQU constants of include/*.inc."""
    table_ = {}
    for fn in asm_files():
        if fn.startswith('include'):
            for line in read_lines(fn):
                m = re.match(r'\s*DEF\s+(\w+)\s+EQU\s+(\$[0-9a-fA-F]+|\d+)\s*(?:;|$)', line)
                if m:
                    v = m[2]
                    table_[m[1]] = int(v[1:], 16) if v.startswith('$') else int(v)
    return table_


def code_of(line):
    return line.split(';')[0].strip()


def trace_reg(lines, i, reg, depth=40, every=False):
    """Walk back from line i (exclusive) and return (line number, text) of the instruction that sets `reg`.
    With every=True keep walking for `depth` lines and return all `ld reg, imm` found (for a register set on several paths)."""
    found = []
    for j in range(i - 1, max(i - depth, 0), -1):
        c = code_of(lines[j])
        if re.match(r'ld %s,' % reg, c) or (reg == 'a' and c.startswith(('xor a', 'pop af', 'sub ', 'add ', 'and ', 'or '))):
            found.append((j + 1, c))
            if not every:
                return found
    return found


# --------------------------------------------------------------------------- static report

def static_all():
    data = rom()
    sym = cv.read_symtab()
    ok = True
    print('== item 14: Pattern_Unused_5dfc')
    refs = []
    for fn in asm_files():
        for n, line in enumerate(read_lines(fn), 1):
            if re.search(r'Pattern_Unused_5dfc|\$5dfc', code_of(line)):
                refs.append((fn, n, line.strip()))
    for r in refs:
        print('  source use:', r)
    verdict(len(refs) == 1 and refs[0][2] == 'Pattern_Unused_5dfc:', 'the label is mentioned once, by its own definition')
    bank, addr = sym['Pattern_Unused_5dfc']
    lo, hi = addr & 0xFF, addr >> 8
    hits = [i for i in range(len(data) - 1) if data[i] == lo and data[i + 1] == hi]
    print('  ROM offsets holding the bytes %02x %02x (little endian $%04x), whole ROM: %d' % (lo, hi, addr, len(hits)))
    ppt = sym['PatternPointers']
    ppt_off = off(*ppt)
    ppt_end = ppt_off + 2 * 128
    for h in hits:
        bnk = 0 if h < 0x4000 else h // 0x4000
        near = ' '.join('%02x' % b for b in data[max(h - 4, 0):h + 6])
        print('    offset $%06x (bank %d, $%04x)  in PatternPointers: %s   context %s'
              % (h, bnk, (h & 0x3FFF) + (0x4000 if bnk else 0), ppt_off <= h < ppt_end, near))
    in_table = [h for h in hits if ppt_off <= h < ppt_end]
    verdict(not in_table, 'no entry of PatternPointers ($%04x, 128 words) holds $5dfc' % ppt[1])
    # a pointer to the pattern would be a `dw` in bank 6 (a song order list, jump) or a `ld hl, $5dfc` (21 fc 5d) in code
    ld_hl = [h for h in hits if h and data[h - 1] in (0x21, 0x11, 0x01, 0xC3, 0xCD)]
    verdict(not ld_hl, 'no ROM byte pair $5dfc is the operand of ld rr, jp or call (%d byte pairs, none after an opcode 01/11/21/C3/CD)'
            % len(hits))
    pattern_end = off(*sym['PitchMode_00'])
    print('  Sfx_29 ends with SFX_END before the label (data before it: %s)' % ' '.join('%02x' % b for b in data[off(*sym['Pattern_Unused_5dfc']) - 4:off(*sym['Pattern_Unused_5dfc'])]))
    print('  the pattern is %d bytes, then PitchMode_00' % (pattern_end - off(*sym['Pattern_Unused_5dfc'])))

    print('\n== item 11: Sfx_29 (SFX effect 29)')
    c = consts()
    sfx = {v: k for k, v in c.items() if k.startswith('SFX_') and not k.startswith('SFX_END')}
    calls = []
    for fn in asm_files():
        lines = read_lines(fn)
        for i, line in enumerate(lines):
            code = code_of(line)
            if re.search(r'\b(call|jp|jr)\b(\s+\w+,)?\s+(PlaySound|PlaySfx)\b', code) or re.search(r'\bPlaySfx\b', code) and not code.endswith(':'):
                calls.append((fn, i, code))
    print('  %d lines call or jump to PlaySound or PlaySfx' % len(calls))
    values, loaded = collections.Counter(), []
    for fn, i, code in calls:
        lines = read_lines(fn)
        srcs = trace_reg(lines, i, 'a')
        text = ' | '.join('%d: %s' % s for s in srcs)
        m = srcs and re.match(r'ld a, (\w+)$', srcs[0][1])
        if m and (m[1] in c or m[1].startswith('$')):
            v = c[m[1]] if m[1] in c else int(m[1][1:], 16)
            values[v] += 1
        else:
            loaded.append((fn, i + 1, code, srcs))
    print('  effects requested with an immediate: %s' % sorted(values))
    for fn, n, code, srcs in loaded:
        print('  other source of A: %s:%d  %s   <- %s' % (fn, n, code, srcs))
    for fn, n, code, srcs in loaded:
        if srcs and re.match(r'ld a, b$', srcs[0][1]):
            lines = read_lines(fn)
            bs = trace_reg(lines, srcs[0][0] - 1, 'b', depth=120, every=True)
            print('    b is set to: %s' % bs)
            for _, t in bs:
                m = re.match(r'ld b, (\w+)$', t)
                if m:
                    values[c.get(m[1], -1)] += 1
    print('  all effect numbers that can reach PlaySound: %s' % sorted(values))
    verdict(29 not in values, 'no PlaySound caller can load 29 (SFX_29 is not used by any call)')
    print('  PlaySfx indexes SfxTable by E with four bytes per entry and no offset (read in bank_006_006.asm PlaySfx).')
    print('  other references to the name:')
    for fn in asm_files():
        for n, line in enumerate(read_lines(fn), 1):
            if re.search(r'\bSfx_29\b|\bSFX_29\b', code_of(line)):
                print('    %s:%d %s' % (fn, n, line.strip()))

    print('\n== item 17: writers of wGrenadeCount')
    for fn in asm_files():
        for n, line in enumerate(read_lines(fn), 1):
            if 'wGrenadeCount' in code_of(line):
                print('  %s:%d  %s' % (fn, n, line.strip()))
    print('  Powerup_Grenade adds 4 with no cap and nothing in the power-up spawn code reads wGrenadeCount,')
    print('  so a count of 12 is reached by three pick-ups; see scenario close_grenade_count.')

    print('\n== item 8: dead load in UpdateProjectile.becomeBall')
    b0, a0 = sym['UpdateProjectile.becomeBall']
    o = off(b0, a0)
    pc = o
    seq = []
    for _ in range(7):
        n, text, tgt = op(data, pc)
        seq.append((pc - o + a0, text))
        pc += n
    for a, t in seq:
        print('  $%04x  %s' % (a, t))
    dead = seq[3]
    nxt = [t for _, t in seq]
    wp4 = sym['wProjectileWork'] if 'wProjectileWork' in sym else cv.ram_symbols()['wProjectileWork']
    verdict(dead[1] == 'ld a,[$%04x]' % (wp4 + 4), 'the load at $%04x reads wProjectileWork + 4' % dead[0])
    verdict(nxt[4].startswith('ld hl,') and nxt[5] == 'ld a,[$%04x]' % cv.ram_symbols()['wBallCount'],
            'the next instructions are ld hl, wBalls and ld a, [wBallCount] (A is overwritten, ld hl does not touch A or flags)')
    labels_between = [n for n, (b, a) in sym.items() if b == b0 and dead[0] < a <= seq[5][0]]
    verdict(not labels_between, 'no label between the dead load and the overwriting load (jump targets: %s)' % labels_between)

    print('\n== item 5: every write of hGameState')
    for fn in asm_files():
        lines = read_lines(fn)
        for i, line in enumerate(lines):
            code = code_of(line)
            if re.match(r'(ld \[hGameState\], a|ldh \[hGameState\], a)', code):
                src = trace_reg(lines, i, 'a')[:2]
                print('  %s:%d  A <- %s' % (fn, i + 1, src))
                if src and src[0][1] == 'ld a, b':
                    print('      b <- %s' % trace_reg(lines, src[0][0] - 1, 'b', depth=60, every=True))
                if src and re.match(r'ld a, \$0a', src[0][1]):
                    print('      THE VALUE $0a')
    print('  GBC_Check (bank_001_001.asm) is the only place that pushes $0a (the RAM bank test fails off a GBC) and')
    print('  stores it with the popped AF.')

    print('\n== item 2: walls and the probe bytes of a flying grenade')
    layout = sym['BrickLayout_Base']
    p = off(*layout)
    cells = []
    while data[p]:
        cells += [data[p + 1]] * data[p]
        p += 2
    rows = [cells[i:i + 16] for i in range(0, len(cells), 16)]
    for r, row in enumerate(rows):
        print('  base row %2d: %s' % (r, ' '.join('%02x' % v for v in row)))
    print('  LoadLevel: RleFill(BrickLayout_Base), RleOverlay(level), then RleOverlay(BrickLayout_Base) again, so the')
    print('  non-zero cells of the base layout win in every level.')
    wall_cols = [c_ for c_ in range(16) if all(rows[r][c_] == 0x0F for r in range(1, 18))]
    print('  wall columns (rows 1 to 17): %s, row 0 all walls: %s' % (wall_cols, all(v == 0x0F for v in rows[0])))
    verdict(wall_cols == [0] + list(range(10, 16)) and all(v == 0x0F for v in rows[0]),
            'every level has walls in column 0, columns 10 to 15 and row 0 (field = columns 1 to 9, x 16 to 159)')
    gp = off(*sym['GrenadeProjectileFrames'])
    print('  GrenadeProjectileFrames probe bytes of the four frames (first 8 bytes of each): ')
    probe_sets = set()
    for fr in (0x00, 0x0d, 0x22, 0x3b):
        probe_sets.add(tuple(data[gp + fr:gp + fr + 8]))
    print('    distinct probe sets: %s' % [' '.join('%02x' % v for v in s) for s in probe_sets])
    verdict(probe_sets == {(0xFE, 0xFE, 0x06, 0x0A, 0x06, 0x06, 0x06, 0x0A)},
            'all four frames use the offsets fe fe, left probe (X-2, Y+4), right probe (X+8, Y+4)')
    print('  So an accepted X has X-2 >= 16 and X+8 <= 159 (a probe in column 0 or 10+ is a wall in rows 1 to 17),')
    print('  X is 18 to 151 and the blast corners X and X+7 stay in columns 1 to 9. The old X is put back on a bounce,')
    print('  so the invariant holds for every later frame. The scenario close_blast_sweep checks it with the real code.')


# --------------------------------------------------------------------------- item 5: DMG mode

def check_dmg(cov):
    r = STATE['dmg']
    print('  state values on the sampled frames: %s' % sorted(set(r['states'])))
    print('  PC on the sampled frames: %s' % sorted({hex(p) for p in r['pcs']}))
    print('  bytes at $7ca8 in the mapped bank: %s' % r['bytes'])
    verdict(r['hits_init'] >= 1, 'StateInit_ColorOnly was reached with no poke', r['hits_init'])
    verdict(r['hits_update'] >= 1, 'StateUpdate_ColorOnly was reached with no poke', r['hits_update'])
    verdict(set(r['states']) == {10}, 'hGameState is 10 on every sampled frame (%d samples)' % len(r['states']))
    verdict(set(r['pcs']) == {0x7CA8}, 'the program counter sits at ColorOnly_Update ($7ca8) on every sampled frame', len(r['pcs']))
    verdict(r['bytes'] == [0x18, 0xFE], 'the bytes there are $18 $fe (jr to itself)')
    verdict(r['gbc_check'] >= 1, 'GBC_Check ran (the state came from its failed RAM bank test)', r['gbc_check'])


@scenario(['StateInit_ColorOnly:hGameState', 'StateUpdate_ColorOnly:hGameState', 'GBC_Check:hGameState'], check_dmg)
def scenario_close_dmg(g):
    """Same ROM, PyBoy in DMG mode: no poke at all. Done in run_one (the emulator mode is set before the Game is built)."""
    res = STATE['dmg'] = dict(states=[], pcs=[])
    g.run(300)
    for _ in range(40):
        g.run(1)
        res['states'].append(g.mem[g.syms['hGameState']])
        res['pcs'].append(g.pb.register_file.PC)
    res['bytes'] = g.rom_bytes(1, 0x7CA8, 2)
    res['hits_init'] = g.count('StateInit_ColorOnly')
    res['hits_update'] = g.count('StateUpdate_ColorOnly')
    res['gbc_check'] = g.count('GBC_Check')


# --------------------------------------------------------------------------- item 2: blast sweep

class CellWatch(CheckWatch):
    """Projectile_HitBrick:@A,@C that also keeps the brick map cell the call looks at."""

    def __init__(self, spec, syms):
        super().__init__(spec, syms)
        self.cells = []

    def record(self, memory, frame):
        super().record(memory, frame)
        a, c = self.rows[-1][2]
        addr = self.game.syms['wBrickMap'] - 0x30 + ((a & 0xF8) << 1) + ((c & 0xF0) >> 4)
        self.cells.append((a, c, memory[addr]))


def check_blast(cov):
    r = STATE['blast']
    cells = cov.watches[0].cells
    cnt = collections.Counter(v for _, _, v in cells)
    print('  %d throws (%d with planted unbreakable bricks), %d Projectile_HitBrick calls' % (r['throws'], r['planted'], len(cells)))
    print('  cell values seen under the blast corners: %s' % dict(cnt))
    print('  corner x range %d to %d, corner y range %d to %d' % (min(c for _, c, _ in cells), max(c for _, c, _ in cells),
                                                              min(a for a, _, _ in cells), max(a for a, _, _ in cells)))
    print('  flight X range %d to %d, Y range %d to %d (over %d frames), longest flight %d frames, landings on $0e %d'
          % (r['xmin'], r['xmax'], r['ymin'], r['ymax'], r['frames'], r['longest'], r['bounces']))
    verdict(len(cells) > 500, 'many blast corners were checked', len(cells))
    verdict(0x0F not in cnt, 'no blast corner ever lay on a wall cell ($0f)', cnt.get(0x0F, 0))
    verdict(r['xmin'] >= 18 and r['xmax'] <= 151, 'the flight X stayed in 18 to 151 (the bound from the probe bytes)')
    verdict(r['ymax'] <= 171, 'the flight Y stayed at or below 171 (the side probes at Y+4 stay in map row 17 or above)')
    verdict(r['unfinished'] == 0, 'every throw ended (no slot left in flight)')


@scenario(['Projectile_HitBrick:@A,@C', 'UpdateProjectile:wProjectileWork:9'], check_blast)
def scenario_close_blast_sweep(g):
    """Poke: a grenade slot is written directly (a real throw gives the same slot, see Shots_HandleFire) so that
    every start x the bat can give (19 to 141), all 11 throw powers and the 3 directions can be tried in a short time.
    The slot is [timer, xsub, x, ysub, y, direction, $80, path lo, path hi]; timer and path come from
    GrenadeThrowTable, y is the bat's y minus 12 like Shots_HandleFire. The second half plants unbreakable bricks
    so that landings bounce ($0e) and fly on."""
    pw.to_level_with_ball(g)
    res = STATE['blast'] = dict(throws=0, planted=0, xmin=255, xmax=0, ymin=255, ymax=0, frames=0, longest=0, bounces=0, unfinished=0)
    watch = g.cov.watches[1]
    table_ = g.rom_bytes(1, g.cov.symtab['GrenadeThrowTable'][1], 44)
    entries = [(table_[4 * i], table_[4 * i + 2], table_[4 * i + 3]) for i in range(11)]
    y0 = g.peek('wBatY') - 12
    print('  bat y %d, start y %d, throw entries %s' % (g.peek('wBatY'), y0, ['%02x@%02x%02x' % (a, c, b) for a, b, c in entries]))
    for planted in (False, True):
        if planted:
            cv.plant_rows(g, 4, 9)
        for x0 in list(range(19, 142, 5)) + [141]:       # wBatX is 15 to 137, the grenade starts at wBatX + 4
            for direction in (0x00, 0x02, 0x1E):
                for timer, plo, phi in entries:
                    g.sync_poke('wBricksLeft', 200)
                    watch.rows.clear()
                    g.sync_poke('wProjectiles', timer, 0, x0, 0, y0, direction, 0x80, plo, phi)
                    n = 0
                    while n < 600:
                        g.run(4)
                        n += 4
                        if g.peek('wProjectiles') == 0 and g.peek('wGrenadeBlastTimer') == 0 and n > 8:
                            break
                    res['throws'] += 1
                    res['planted'] += planted
                    if g.peek('wProjectiles') != 0:
                        res['unfinished'] += 1
                        g.sync_poke('wProjectiles', 0)
                    prev = None
                    for _, _, vals in watch.rows:
                        v = vals[0]
                        res['xmin'] = min(res['xmin'], v[2])
                        res['xmax'] = max(res['xmax'], v[2])
                        res['ymin'] = min(res['ymin'], v[4])
                        res['ymax'] = max(res['ymax'], v[4])
                        if prev is not None and v[0] > prev and v[0] > 0x07:
                            res['bounces'] += 1      # the timer was set again by a landing on $0e
                        prev = v[0]
                    res['frames'] += len(watch.rows)
                    res['longest'] = max(res['longest'], len(watch.rows))
                    if g.state != 2:
                        pw.to_level_with_ball(g)
                        if planted:
                            cv.plant_rows(g, 4, 9)
                    # keep the bat alive and the field in shape
                    if res['throws'] % 40 == 0:
                        g.poke('wLives', 9)
                        g.run(20)


# --------------------------------------------------------------------------- item 17: grenade count

def check_count(cov):
    r = STATE['count']
    print('  count after each caught Grenade power-up: %s' % r['after_catch'])
    print('  (count after decrement, index used = A and 7) for every throw: %s' % [(a, a & 7) for a in r['throw_a']])
    verdict(r['after_catch'] and r['after_catch'][-1] > 8, 'three Grenade pick-ups gave a count above 8 with no poke of wGrenadeCount (%s)' % r['after_catch'][-1:])
    wrapped = [a for a in r['throw_a'] if a > 7]
    verdict(wrapped, 'throws with A above 7 reached showGrenadeText, so the index (A and 7) wraps: %s' % [(a, a & 7) for a in wrapped])
    verdict(r['final_count'] == 0, 'the grenades were used up by real throws')


@scenario(['Shots_HandleFire.showGrenadeText:wGrenadeCount,@A'], check_count)
def scenario_close_grenade_count(g):
    """Real play. The three Grenade power-ups are put on the bat with the harness helper (it pokes the falling slot,
    the catch and the pick-up code run for real); wGrenadeCount is never written."""
    res = STATE['count'] = dict(after_catch=[], throw_a=[])
    pw.to_level_with_ball(g)
    g.poke('wLives', 9)
    for _ in range(3):
        cv.catch_powerup(g, 15)
        res['after_catch'].append(g.peek('wGrenadeCount'))
    w = g.cov.watches[0]
    # One short press of A per grenade, when the previous grenade has finished (wGrenadeDelay 0).
    for _ in range(40):
        if g.state != 2 or g.peek('wGrenadeCount') == 0 or not g.peek('wWeaponFlag'):
            break
        for _ in range(40):                         # wait for the grenade in flight to end (wGrenadeDelay 0)
            g.play(20, launch=False)
            if g.ball(0)[0] > 100:
                g.sync_poke('wBalls+1', 40)         # poke: lift the ball so that the bat is not lost
            if g.peek('wGrenadeDelay') == 0 or g.state != 2:
                break
        g.pb.button_press('a')
        g.run(2)
        g.pb.button_release('a')
        g.run(2)
    res['final_count'] = g.peek('wGrenadeCount')
    g.log('end: count %d flag %d lives %d' % (res['final_count'], g.peek('wWeaponFlag'), g.peek('wLives')))
    res['throw_a'] = [row[2][1] for row in w.rows]


# --------------------------------------------------------------------------- item 11: PlaySound log

def check_sfx(cov):
    w = W(cov, 'PlaySound')
    seen = collections.Counter(r[2][0] for r in w.rows)
    print('  PlaySound calls %d, distinct effects %d: %s' % (len(w.rows), len(seen), sorted(seen.items())))
    verdict(w.rows, 'PlaySound was called', len(w.rows))
    verdict(29 not in seen, 'effect 29 was never requested over the run (the static scan proves it cannot be)')


@scenario(['PlaySound:@A'], check_sfx)
def scenario_close_sfx_log(g):
    """The powerups and levels scenarios of coverage.py (real input, harness-dropped power-ups); PlaySound arguments are logged."""
    cv.scenario_levels(g)
    cv.recover(g)
    cv.scenario_powerups(g)


# --------------------------------------------------------------------------- runner

def run_one(name, rom_path, frame_limit):
    import pyboy
    cov = cv.Coverage(cv.read_labels(), [])
    known = {l['name'] for l in cov.labels}
    cov.watches = []
    for s in SPECS[name]:
        if s.partition(':')[0] not in known:
            raise SystemExit('%s: %s is not a hookable code label' % (name, s))
        cov.watches.append((CellWatch if s.startswith('Projectile_HitBrick') else CheckWatch)(s, cov.syms))
    orig = pyboy.PyBoy
    if name == 'close_dmg':
        pyboy.PyBoy = lambda *a, **k: orig(*a, cgb=False, **k)
    try:
        g = cv.Game(cov, rom_path, frame_limit)
    finally:
        pyboy.PyBoy = orig
    for w in cov.watches:
        w.game = g
    start = time.time()
    try:
        SCENARIOS[name](g)
    except cv.StopScenario:
        print('scenario %s: stopped at the frame limit' % name)
    print('scenario %s: %d frames, %.1f s' % (name, g.frame, time.time() - start))
    g.close()
    CHECKS[name](cov)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--scenario', action='append', default=[])
    ap.add_argument('--rom', default=os.path.join(ROOT, 'game.gbc'))
    ap.add_argument('--frames', type=int, default=2000000)
    ap.add_argument('--static', action='store_true')
    ap.add_argument('--list', action='store_true')
    ap.add_argument('--verbose', action='store_true')
    args = ap.parse_args()
    cv.VERBOSE = args.verbose
    if args.static:
        static_all()
    elif args.list or not args.scenario:
        for n, fn in SCENARIOS.items():
            print('%-22s %s' % (n, (fn.__doc__ or '').strip().split('\n')[0]))
        return
    for s in args.scenario:
        for n in (list(SCENARIOS) if s == 'all' else [s]):
            if n not in SCENARIOS:
                raise SystemExit('unknown scenario %s (try --list)' % n)
            run_one(n, args.rom, args.frames)
    res = pw.RESULTS
    print('%d checks, %d passed, %d failed' % (len(res), sum(res), len(res) - sum(res)))
    sys.exit(0 if all(res) else 1)


if __name__ == '__main__':
    main()

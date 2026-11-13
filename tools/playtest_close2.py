"""Third close-out pass for the play-test items that were still open after playtest_extra2.

Usage (needs PyBoy; run from the repository root after `make`, one emulator at a time):

    python tools/playtest_close2.py --list
    python tools/playtest_close2.py --scenario c2_corners_ufo --verbose
    python tools/playtest_close2.py --scenario all

Scenarios (the ones marked static do not start the emulator):
    c2_corners_hp1     CollideBall_Corners with a 1 HP brick (c2_corners_wall: with an unbreakable brick). The partner corner of the
                       same brick hits in the same call (HitBrickWithBall does not clear the map cell, it queues the
                       hit and marks the brick in a shadow map). Counts of the diagonal calls and which corners hit.
    c2_corners_ufo     CollideBall_Corners with a flying UFO in place of bricks. A UFO hit by one corner point makes
                       wUfoFlying 0, so the partner corner sees nothing: the bottom-left, bottom-right and top-right
                       diagonals CAN occur alone, but only on a UFO hit. Poked: the ball and the UFO position.
    c2_pause           Pause_Update.startNotPressed and the one read of wCheatLivesRefill (StateInit_Pause). Real input,
                       the cheat is set with the TDNZ password. A PC hook on the read logs A.
    c2_text_static     (static) UnusedText_TheEnd is never referenced: no operand, no table entry, no sequential scan.
    c2_sound_static    (static) Pattern_1C and the instruments and tables marked "not used" or "Nothing points here":
                       order list bytes, pattern and sound effect rows, and reachability over the pointers in bank 6.
    c2_sound           Every song 0 to 9 played until each channel repeats, then every sound effect 0 to 29 forced.
                       Logs the order list entries and the instrument index at every note start. Compared with the
                       static sets.
    c2_shots_laser     UpdateShot1 to UpdateShot5 with real input (Laser bat, A tapped): every slot used in order, 2 pixels up per
                       frame, slots 3 to 5 draw ShotSprite_Laser.
    c2_shots_plasma    Two rockets (slots 0 and 1), then the Plasma power-up while slot 1 is busy: A is refused; then plasma
                       fires and slot 1 moves 1 pixel per frame.
    c2_effects         ClearUnbreakableHitEffects does not clear the slots: a live slot survives the level change; after a
                       lost life the slots are already dead.

What is poked is said in each scenario; nothing here edits coverage.py or the banks.
"""
import argparse
import os
import re
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import coverage as C          # noqa: E402

assert os.path.abspath(C.__file__) == os.path.join(HERE, 'coverage.py'), C.__file__
C.MAX_LOG = 100000
ROOT = C.ROOT

SCENARIOS = {}
STATIC = set()
RESULTS = []


def scen(fn=None, static=False):
    def deco(f):
        name = f.__name__.replace('scenario_', '')
        SCENARIOS[name] = f
        if static:
            STATIC.add(name)
        return f
    return deco(fn) if fn else deco


def claim(g, text, ok, detail=''):
    RESULTS.append(bool(ok))
    print('  %s  %s%s' % ('PASS' if ok else 'FAIL', text, (' | ' + str(detail)) if detail != '' else ''), flush=True)


def info(text):
    print('  ' + text, flush=True)


def trace(g, label, fn):
    """Call fn() every time `label` is reached."""
    def arm():
        fn()
        g.at(label, arm)
    g.at(label, arm)


def hook_pc(g, bank, addr, fn):
    """Call fn() every time the CPU is about to run the instruction at (bank, addr). For places without a label."""
    seen = {'cycles': -1}

    def cb(_ctx):
        c = g.pb._cycles()
        if c == seen['cycles']:
            return                           # PyBoy fires a hook again without running the instruction
        seen['cycles'] = c
        fn()
    g.pb.hook_register(bank, addr, cb, None)


def table(g, label, n=32):
    bank, addr = g.cov.symtab[label]
    off = bank * 0x4000 + addr - 0x4000 if bank else addr
    return list(g.rom_data[off:off + n])


def rom():
    with open(os.path.join(ROOT, 'game.gbc'), 'rb') as f:
        return f.read()


def source(bank):
    import glob
    path = glob.glob(os.path.join(ROOT, 'banks', 'bank_*_%03x.asm' % bank))[0]
    with open(path) as f:
        return f.read().split('\n')


def all_sources():
    """{path: lines} for the assembly sources (banks, src, include, game.asm), not the docs."""
    import glob
    out = {}
    for pat in ('banks/*.asm', 'src/**/*.asm', 'src/*.asm', 'include/*', 'game.asm'):
        for path in glob.glob(os.path.join(ROOT, pat), recursive=True):
            if os.path.isfile(path):
                with open(path, errors='replace') as f:
                    out[os.path.relpath(path, ROOT)] = f.read().split('\n')
    return out


# --------------------------------------------------------------------------- CollideBall_Corners

CORNER_LABELS = ['bottomLeftMiss', 'bottomLeftDiagonal', 'bottomLeftReflectBottom', 'checkBottomRight',
                 'bottomRightMiss', 'bottomRightDiagonal', 'bottomRightReflectBottom', 'checkTopLeft',
                 'topLeftMiss', 'topLeftDiagonal', 'topLeftReflectTop', 'checkTopRight',
                 'topRightMiss', 'topRightDiagonal', 'topRightReflectTop', 'done']
ORDER = [('bottomLeft', 'checkBottomRight'), ('bottomRight', 'checkTopLeft'), ('topLeft', 'checkTopRight'),
         ('topRight', 'done')]
CORNER_NEXT = dict(ORDER)


def clear_field(g):
    base = g.syms['wBrickMap']
    for r in range(1, 17):
        g.sync_poke(base + 16 * r + 1, *([0] * 9))
    g.sync_poke('wBricksLeft', 200)


def collect_calls(events):
    """Split the logged events into one list per call of CollideBall_Corners (each call ends with 'done')."""
    calls = []
    seg = []
    for e in events:
        seg.append(e)
        if e[0] == 'done':
            calls.append(seg)
            seg = []
    return calls


def analyse_diagonals(g, calls, tag, want_alone):
    """Check every diagonal call against the tables and say which corners hit in the same call."""
    rl, rt, rb = table(g, 'BallReflectLeftTable'), table(g, 'BallReflectTopTable'), table(g, 'BallReflectBottomTable')
    rr = table(g, 'BallReflectRightTable')
    spec = {'bottomLeftDiagonal': ('bottomLeft', rl, rb), 'bottomRightDiagonal': ('bottomRight', rr, rb),
            'topRightDiagonal': ('topRight', rr, rt)}
    out = {}
    for diag, (corner, t1, t2) in spec.items():
        nxt = CORNER_NEXT[corner]
        found = []
        for seg in calls:
            names = [e[0] for e in seg]
            if diag in names:
                i = names.index(diag)
                j = names.index(nxt, i)
                hit = [c for c, _n in ORDER if c + 'Miss' not in names]
                found.append((seg[i][2:], seg[i][1], seg[j][1], hit, seg[0][4:]))
        ok = bool(found) and all(o == t2[t1[d]] for _p, d, o, _h, _x in found)
        combos = {}
        for f in found:
            combos[tuple(f[3])] = combos.get(tuple(f[3]), 0) + 1
        alone = [f for f in found if f[3] == [corner]]
        out[diag] = (found, alone, combos)
        claim(g, '%s %s: %d calls, direction out = table2[table1[direction in]] in every one' % (tag, diag, len(found)), ok,
              'first (ball x, y, UFO x, y, UFO flying after the call; direction in, out; corners that hit) %s' % (found[0][:4],) if found else 'not reached')
        if want_alone:
            claim(g, '%s %s: reached with only this corner hitting (%d calls)' % (tag, diag, len(alone)), bool(alone),
                  'first %s; combinations %s' % (alone[0] if alone else None, combos))
        else:
            claim(g, '%s %s: never alone, the partner corner of the same brick hits in the same call' % (tag, diag), not alone,
                  'alone in %d calls; combinations %s' % (len(alone), combos))
    return out


def install_corner_events(g, cur, extra=None):
    """Log (label, direction, x, y) + extra() at the entry ('start') and at every corner label."""
    def event(name, label):
        def fn():
            cur.append((name, g.peek('wBallWorkDirection'), g.peek('wBallWorkX'), g.peek('wBallWorkY')) + (extra() if extra else ()))
            g.at(label, fn)
        g.at(label, fn)
    event('start', 'CollideBall_Corners')
    for n in CORNER_LABELS:
        event(n, 'CollideBall_Corners.' + n)


def sweep_bricks(g, value, tag, budget=45):
    """One planted brick (map row 6, column 5) of map value `value`, a ball at every pose around it."""
    base = g.syms['wBrickMap']
    cell = base + 16 * 6 + 5
    cur = []
    install_corner_events(g, cur, lambda: ())
    top, left = (6 + 3) * 8, 5 * 16
    t0 = time.time()
    events = []
    poses = 0
    for d in (4, 12, 20, 28):                      # up-right, down-right, down-left, up-left
        for dy in range(-8, 9):
            for dx in range(-7, 17):
                if time.time() - t0 > budget:
                    break
                del cur[:]
                g.sync_poke(cell, value)
                g.sync_poke('wBalls', 0, top + dy, 0, left + dx, d, 3, 0)
                g.poke('wBallOnBat', 0)
                g.run(2)
                poses += 1
                events.extend(cur)
    calls = collect_calls(events)
    info('%s: %d poses, %d calls of CollideBall_Corners, %.1f s' % (tag, poses, len(calls), time.time() - t0))
    return calls


def to_empty_level(g):
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(100, launch=False)
    clear_field(g)


@scen
def scenario_c2_corners_hp1(g):
    """Bottom-left, bottom-right and top-right diagonals with a 1 HP brick: the partner corner still hits."""
    to_empty_level(g)
    analyse_diagonals(g, sweep_bricks(g, 0x01, '1 HP brick'), '1 HP brick', want_alone=False)


@scen
def scenario_c2_corners_wall(g):
    """The same with an unbreakable brick (map value $0E)."""
    to_empty_level(g)
    analyse_diagonals(g, sweep_bricks(g, 0x0E, 'unbreakable brick'), 'unbreakable brick', want_alone=False)


@scen
def scenario_c2_corners_ufo(g):
    """A flying UFO instead of bricks. The UFO and the ball are poked next to each other at every pose; the real
    collision code runs. Per call the UFO state is taken at the entry of CollideBall_Corners."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(100, launch=False)
    C.goto_level(g, C.levels_of_type(1)[0])
    clear_field(g)
    C.wait_flying(g)
    claim(g, 'a UFO level with the UFO flying', g.peek('wUfoFlying') != 0 and g.peek('wLevelType') & 1,
          'wLevelType %d wUfoFlying %d' % (g.peek('wLevelType'), g.peek('wUfoFlying')))
    cur = []

    def ufo():
        return (g.peek('wUfoX'), g.peek('wUfoHeight'), g.peek('wUfoFlying'))
    install_corner_events(g, cur, ufo)
    base_x, base_y = 100, 70
    pos = {'x': 100, 'y': 70}

    def pose(x, y, d):
        def fn():
            g.poke('wUfoSpeed', 0, 0)
            g.poke('wUfoXSub', 0)
            g.poke('wUfoX', pos['x'])
            g.poke('wUfoHeight', pos['y'])
            g.poke('wUfoHits', 0)
            g.poke('wUfoFlying', 1)
            g.poke('wBalls', 0, y, 0, x, d, 3, 0)
            g.poke('wBallOnBat', 0)
        g.at('Gameplay_Update', fn)
        g.run(1)
        if g.once:
            g.run(2)
    t0 = time.time()
    # phase 1: UFO fixed, every relative pose; keep the poses where one corner of bottom-left, bottom-right or
    # top-right hit the UFO alone (the other corner points and the side points missed it)
    events = []
    rel = {}
    for dy in range(-14, 18):
        for dx in range(-9, 30):
            del cur[:]
            pose(base_x + dx, base_y + dy, 4)
            events = list(cur)
            for seg in collect_calls(events):
                names = [e[0] for e in seg]
                hit = [c for c, _n in ORDER if c + 'Miss' not in names]
                if seg[0][6] and not seg[-1][6] and len(hit) == 1 and hit[0] != 'topLeft':
                    rel.setdefault(hit[0], set()).add((dx, dy))
    info('phase 1, UFO hit by one corner alone, relative poses per corner: %s' % {k: len(v) for k, v in rel.items()})
    # phase 2: the same relative poses with the UFO moved over 16 x 8 positions (the diagonal test uses x mod 16
    # and y mod 8) and the four directions
    events = []
    poses = 0
    dirs = (4, 12, 20, 28)
    for corner, poses_rel in sorted(rel.items()):
        for dx, dy in sorted(poses_rel)[:12]:
            for bx in range(100, 116):
                for by in range(70, 78):
                    del cur[:]
                    pos['x'], pos['y'] = bx, by
                    pose(bx + dx, by + dy, dirs[(bx + by) % 4])
                    poses += 1
                    events.extend(cur)
    calls = collect_calls(events)
    info('UFO: %d poses in phase 2, %d calls of CollideBall_Corners, %.1f s' % (poses, len(calls), time.time() - t0))
    # a call in which the UFO was flying at the entry and was hit by a corner point is not flying at its end
    ufo_calls = [seg for seg in calls if seg[0][6] and not seg[-1][6]]
    info('%d calls with a UFO hit by a corner point' % len(ufo_calls))
    analyse_diagonals(g, ufo_calls, 'UFO', want_alone=True)


# --------------------------------------------------------------------------- pause and wCheatLivesRefill

@scen
def scenario_c2_pause(g):
    """Every access to wCheatLivesRefill is found in the ROM bytes (one read, one set, one clear). Then real play:
    pause and resume without and with the TDNZ cheat. A PC hook on the read logs the flag, a hook on the label after
    the refill logs wLives, and Pause_Update.startNotPressed logs hGameState, hJoypad and hStateTimer."""
    data = rom()
    addr = g.syms['wCheatLivesRefill']
    lo, hi = addr & 0xFF, addr >> 8
    sites = []
    for off in range(0, 0x8000 * 0 + 0x4000):
        if data[off + 1] == lo and data[off + 2] == hi and data[off] in (0xFA, 0xEA):
            sites.append((off, 'read' if data[off] == 0xFA else 'write'))
    for off in range(0x4000, 0x10000):
        if data[off + 1] == lo and data[off + 2] == hi and data[off] in (0xFA, 0xEA):
            sites.append((off, 'read' if data[off] == 0xFA else 'write'))
    names = {a: n for n, (b, a) in g.cov.symtab.items() if b == 0}
    where = []
    for off, kind in sites:
        a = max(x for x in names if x <= off) if off < 0x4000 else None
        where.append((hex(off), kind, names.get(a)))
    info('ld a,[wCheatLivesRefill] and ld [wCheatLivesRefill],a in banks 0 to 3: %s' % where)
    reads = [w for w in where if w[1] == 'read']
    claim(g, 'one read of wCheatLivesRefill in the whole ROM, in StateInit_Pause; no other code reads it',
          len(reads) == 1 and reads[0][2] == 'StateInit_Pause', reads)
    read_addr = int(reads[0][0], 16)
    # the byte range of the read is checked as an instruction start: the label StateInit_Pause is before it
    log = {'read': [], 'after': [], 'idle': []}
    hook_pc(g, 0, read_addr, lambda: log['read'].append((g.frame, g.peek('wCheatLivesRefill'), g.peek('wLives'))))
    trace(g, 'StateInit_Pause.skipLivesRefill', lambda: log['after'].append((g.frame, g.peek('wLives'))))
    trace(g, 'Pause_Update.startNotPressed', lambda: log['idle'].append(
        (g.frame, g.peek('hGameState'), g.peek('hJoypad') >> 7, g.peek('hStateTimer'))))

    def one_pause(lives):
        g.wait_level_ready()
        g.play(120, sloppy=0.02)
        g.poke('wLives', lives)
        for k in log:
            del log[k][:]
        g.press('start', hold=3, after=10)
        g.wait_until(lambda: g.state == 4, limit=200)
        g.run(40)
        for _ in range(5):
            g.press('start', hold=3, after=60)
            if g.state == 2:
                break
        return {k: list(v) for k, v in log.items()}, g.peek('wLives')

    def paths(r):
        idle_paused = [x for x in r['idle'] if x[1] == 4 and x[2] == 0]
        pressed = [x for x in r['idle'] if x[2] == 1]
        return idle_paused, pressed

    g.boot()
    g.start_level(1)
    g.play(200, sloppy=0.02)
    r, lives = one_pause(3)
    idle, pressed = paths(r)
    claim(g, 'no cheat: the read sees 0 once per pause, wLives stays 3', [x[1] for x in r['read']] == [0] and lives == 3
          and r['after'][0][1] == 3, 'read %s after %s lives %d' % (r['read'], r['after'], lives))
    claim(g, 'startNotPressed with Start up while paused (state 4, bit 7 clear)', len(idle) >= 5, 'frames %d, first %s' % (len(idle), idle[:1]))
    claim(g, 'startNotPressed after the Start press: state 2, hStateTimer $28, hJoypad cleared by the handler',
          len(pressed) == 0 and any(x[1] == 2 and x[3] == 0x28 for x in r['idle']),
          'rows with state 2: %s' % [x for x in r['idle'] if x[1] == 2][:3])
    # TDNZ
    g.poke('wLives', 1)
    C.lose_lives(g, 1)
    C.game_over_and_name(g)
    C.title_to_menu(g)
    g.enter_password('TDNZ')
    claim(g, 'TDNZ sets wCheatLivesRefill to 1', g.peek('wCheatLivesRefill') == 1, g.peek('wCheatLivesRefill'))
    g.menu_goto(0)
    before = g.count('LoadLevel')
    g.press('a', after=0)
    g.wait_level_ready(since=before)
    g.play(100, sloppy=0.02)
    r, lives = one_pause(3)
    claim(g, 'cheat 1: the read sees 1, the refill sets wLives from 3 to 9 on pause entry',
          [x[1:] for x in r['read']] == [(1, 3)] and r['after'][0][1] == 9 and lives == 9, 'read %s after %s' % (r['read'], r['after']))
    idle, pressed = paths(r)
    claim(g, 'cheat 1: the pause loop reads nothing again: one read per pause, none after resume',
          len(r['read']) == 1 and len(idle) >= 5, 'reads %d, idle frames %d' % (len(r['read']), len(idle)))
    # poked: any other nonzero value takes the same path (the code only does `or a`)
    g.poke('wCheatLivesRefill', 0x80)
    r, lives = one_pause(2)
    claim(g, 'poked wCheatLivesRefill $80: the read sees $80 and the refill still happens (2 to 9)',
          [x[1:] for x in r['read']] == [(0x80, 2)] and lives == 9, 'read %s lives %d' % (r['read'], lives))
    g.poke('wCheatLivesRefill', 0)
    r, lives = one_pause(2)
    claim(g, 'poked wCheatLivesRefill 0 again: no refill', [x[1:] for x in r['read']] == [(0, 2)] and lives == 2, 'read %s lives %d' % (r['read'], lives))


# --------------------------------------------------------------------------- UnusedText_TheEnd

@scen(static=True)
def scenario_c2_text_static(g):
    """UnusedText_TheEnd ($67D3, bank 6) is never referenced. Five independent checks."""
    syms = C.read_symtab()
    bank, addr = syms['UnusedText_TheEnd']
    data = rom()
    end = addr + 13
    claim(g, 'UnusedText_TheEnd is at bank 6 $67D3 and is 13 bytes ("-- THE END --")',
          (bank, addr) == (6, 0x67D3) and syms['BankFiller_006'] == (6, end) and
          bytes(data[6 * 0x4000 + addr - 0x4000:6 * 0x4000 + end - 0x4000]) == b'-- THE END --')
    srcs = all_sources()
    hits = [(f, i + 1) for f, lines in srcs.items() for i, l in enumerate(lines) if re.search(r'\bUnusedText_TheEnd\b', l)]
    claim(g, '1. the label appears once in all sources, at its definition', hits == [('banks/bank_006_006.asm', 6025)], hits)
    near = [(f, i + 1, l.strip()) for f, lines in srcs.items() for i, l in enumerate(lines)
            if re.search(r'\b(WaveAnim_04|BankFiller_006)\b', l) and not re.match(r'(WaveAnim_04|BankFiller_006):', l.strip())]
    claim(g, '2. the labels next to the string (WaveAnim_04 before, BankFiller_006 after) are never used to reach it: only '
          'the loop pointer of WaveAnim_04 itself names WaveAnim_04, nothing names BankFiller_006', len(near) == 1 and 'dw WaveAnim_04' in near[0][2], near)
    nums = [(f, i + 1, l.strip()) for f, lines in srcs.items() for i, l in enumerate(lines)
            if re.search(r'\$67[cdef][0-9a-fA-F]?\b', l) and not l.strip().startswith(';')]
    claim(g, '3. no source line holds a number from $67C0 to $67EF', not nums, nums[:5])
    # 4. every instruction operand in all code
    from sm83 import op
    found = []
    for b, pc in sorted(C.code_addresses()):
        off = pc if b == 0 else b * 0x4000 + pc - 0x4000
        _n, text, _t = op(data, off)
        m = re.search(r'\$([0-9a-f]{4})\b', text)
        if m and 0x67D3 <= int(m[1], 16) < 0x67E0 and (b in (0, 6) or True):
            found.append((b, hex(pc), text))
    claim(g, '4. no instruction in any bank has an operand from $67D3 to $67DF (disassembly of every code address)',
          not found, found[:5])
    # 5. the raw bytes D3 67 anywhere in the ROM
    raw = [m.start() for m in re.finditer(b'\xd3\x67', data)]
    names = sorted((a + (b * 0x4000 if b else 0) - (0x4000 if b else 0), n) for n, (b, a) in syms.items())
    where = []
    for o in raw:
        prev = [n for a, n in names if a <= o][-1]
        where.append((o // 0x4000, hex(o % 0x4000 + (0x4000 if o >= 0x4000 else 0)), prev))
    claim(g, '5. the byte pair D3 67 occurs twice in the ROM, both times inside HighScoreAnim tile data (db rows of frames)',
          len(raw) == 2 and all(w[2].startswith('HighScoreAnim_') for w in where), where)
    # the data before it is a table that ends with a pointer back to itself, so nothing runs or scans into it
    src = source(6)
    i = next(k for k, l in enumerate(src) if l.startswith('UnusedText_TheEnd:'))
    claim(g, 'the table before the string ends with `dw WaveAnim_04` and the filler after it is marked as never run',
          src[i - 3].strip() == 'dw WaveAnim_04' and 'Nothing runs or reads it' in ' '.join(src[i + 2:i + 5]), src[i - 3:i + 4])
    first = bytes(data[6 * 0x4000 + addr - 0x4000:6 * 0x4000 + addr - 0x4000 + 2])
    info('DrawString reads a 2 byte VRAM address first and stops at $FF; the string starts %s (an address of $%04X in ROM) and has no $FF' % (
        first.hex(), first[0] | first[1] << 8))


# --------------------------------------------------------------------------- sound data model (static)

class SoundModel:
    """Everything the sound driver can reach, read from the ROM bytes of bank 6 and game.sym."""

    def __init__(self):
        self.data = rom()
        sym = C.read_symtab()
        self.sym = sym
        self.labels = sorted((a, n) for n, (b, a) in sym.items() if b == 6 and a >= 0x4000)
        self.addr = {n: a for a, n in self.labels}
        self.by_addr = {}
        for a, n in self.labels:
            self.by_addr.setdefault(a, []).append(n)
        self.starts = sorted(self.by_addr)
        self.end = self.addr['BankFiller_006']
        self.npat = (self.addr['InstrumentPointers'] - self.addr['PatternPointers']) // 2
        self.ninstr = (self.addr['NoiseInstrumentPointers'] - self.addr['InstrumentPointers']) // 2
        self.nnoise = (self.addr['Song_Title_Ch1'] - self.addr['NoiseInstrumentPointers']) // 2
        self.nsong = (self.addr['PatternPointers'] - self.addr['SongHeaders']) // 13
        self.nsfx = (self.addr['SongHeaders'] - self.addr['SfxTable']) // 4
        self.pat_ptr = [self.w(self.addr['PatternPointers'] + 2 * i) for i in range(self.npat)]
        self.instr_ptr = [self.w(self.addr['InstrumentPointers'] + 2 * i) for i in range(self.ninstr)]
        self.noise_ptr = [self.w(self.addr['NoiseInstrumentPointers'] + 2 * i) for i in range(self.nnoise)]
        self.parse()

    def rb(self, a):
        return self.data[6 * 0x4000 + a - 0x4000]

    def w(self, a):
        return self.rb(a) | self.rb(a + 1) << 8

    def obj(self, a):
        """The label (object) that holds address a: the last label at or before it."""
        lo = None
        for s_ in self.starts:
            if s_ <= a:
                lo = s_
            else:
                break
        return self.by_addr[lo][-1].split('.')[0] if lo is not None else None

    def extent(self, name):
        a = self.addr[name]
        nxt = [x for x in self.starts if x > a]
        return a, (nxt[0] if nxt else self.end)

    def rows(self, a, sfx=False):
        """Rows of a pattern or a sound effect from address a as (address, length, note, instrument or None, target).
        Ends at the end mark. A jump or a chain to another sound effect block has note 'jump' or 'chain' and a target."""
        out = []
        seen = set()
        while a not in seen:
            seen.add(a)
            n = self.rb(a)
            if n == 0:
                if sfx:
                    if self.rb(a + 2) == 0:
                        break
                    a = self.w(a + 1)
                    out.append((a, 0, 'chain', None, a))
                    continue
                break
            if n == 0xFF:
                out.append((a, 0, 'jump', None, self.w(a + 1)))
                break
            note = self.rb(a + 1)
            if note in (0xFD, 0xFE, 0xFF):
                out.append((a, n, note, None, None))
                a += 2
            else:
                out.append((a, n, note, self.rb(a + 2), None))
                a += 3
        return out

    def parse(self):
        # order lists: entries (transpose, pattern) until a pattern jumps back to an order list address
        self.order_entries = {}                 # address -> (transpose, pattern)
        self.pat_channels = {}                  # pattern -> set of channels 0..3 that play it
        self.song_orders = {}
        todo = []
        for song in range(self.nsong):
            h = self.addr['SongHeaders'] + 13 * song
            for ch in range(4):
                todo.append((self.w(h + 2 * ch), ch, song))
        while todo:
            a, ch, song = todo.pop()
            while True:
                if (a, ch) in self.song_orders:
                    break
                self.song_orders[(a, ch)] = song
                tr, p = self.rb(a), self.rb(a + 1)
                self.order_entries[a] = (tr, p)
                if p >= self.npat:
                    break
                self.pat_channels.setdefault(p, set()).add(ch)
                r = self.rows(self.pat_ptr[p])
                if r and r[-1][2] == 'jump':
                    todo.append((r[-1][4], ch, song))
                    break
                a += 2
        # instruments used by each reachable pattern, by channel
        self.pulse_used = {}                    # index -> list of (where)
        self.noise_used = {}
        for p, chans in self.pat_channels.items():
            for r in self.rows(self.pat_ptr[p]):
                if r[3] is not None:
                    for ch in chans:
                        (self.noise_used if ch == 3 else self.pulse_used).setdefault(r[3], []).append('pattern %02x ch%d' % (p, ch + 1))
        # sound effects
        self.sfx_info = []
        for e in range(self.nsfx):
            a = self.addr['SfxTable'] + 4 * e
            self.sfx_info.append((self.rb(a), self.w(a + 1), self.rb(a + 3)))
            noise = self.rb(a + 3) != 2
            for r in self.rows(self.w(a + 1), sfx=True):
                if r[3] is not None:
                    (self.noise_used if noise else self.pulse_used).setdefault(r[3], []).append('sfx %d' % e)
        self.pulse_labels = {self.obj(self.instr_ptr[i]) for i in self.pulse_used if i < self.ninstr}
        self.noise_labels = {self.obj(self.noise_ptr[i]) for i in self.noise_used if i < self.nnoise}

    def flagged(self):
        """(kind, comment, label) for every label whose comment says "not used", "Nothing points here" or "Not used by any song"."""
        lines = source(6)
        out = []
        for i, l in enumerate(lines):
            m = re.match(r'; (Pulse instrument|Noise instrument|Wave instrument) \$([0-9a-f]+), not used', l)
            kind = None
            if m:
                kind = ('instrument', m[1].split()[0].lower(), int(m[2], 16))
            elif l.startswith('; Nothing points here'):
                kind = ('nopointer', None, None)
            elif l.startswith('; Not used by any song'):
                kind = ('pattern', None, None)
            if kind:
                j = i + 1
                while not re.match(r'[A-Za-z_]\w*:$', lines[j]):
                    j += 1
                out.append((kind, l.strip('; .'), lines[j][:-1]))
        return out

    def references(self):
        """{object: set of other objects it names}, from the assembly source of bank 6. The ROM is built from this
        source and every pointer in it is a label (no raw address: checked by the caller), so the names in an object
        (its `dw` lines, and the operands in code) are exactly its pointers."""
        refs = {}
        cur = None
        names = set(self.addr)
        for l in source(6):
            m = re.match(r'([A-Za-z_]\w*):', l)
            if m:
                cur = m[1]
                refs.setdefault(cur, set())
            body = l.split(';')[0]
            body = re.sub(r'^([A-Za-z_]\w*):', '', body)
            if cur is None:
                continue
            for tok in re.findall(r'[A-Za-z_]\w*', body):
                if tok in names and tok != cur and not re.match(r'^\s*(INSTR|NOTE|NOISE)', tok):
                    refs[cur].add(tok)
        # a label that follows another one directly (aliases at the same address) is one object
        return refs

    def reachable(self):
        """Reachability over named pointers. Roots: all code (everything before NoteFrequencies' neighbour
        WaveVolume_Silent), every song header and sound effect entry, and the order lists, patterns and instruments
        found by decoding the rows. The three index tables are not expanded: their entries are reached by index."""
        refs = self.references()
        reach = set()
        todo = []

        def add(name):
            for alias in self.by_addr.get(self.addr.get(name), [name]) if name else []:
                if alias not in reach:
                    reach.add(alias)
                    todo.append(alias)
        code_end = self.addr['WaveVolume_Silent']
        for a, n in self.labels:
            if a < code_end:
                add(n)
        for song in range(self.nsong):
            add(self.obj(self.addr['SongHeaders'] + 13 * song))
        for a in self.order_entries:
            add(self.obj(a))
        for p in self.pat_channels:
            add(self.obj(self.pat_ptr[p]))
        for i in self.pulse_used:
            if i < self.ninstr:
                add(self.obj(self.instr_ptr[i]))
        for i in self.noise_used:
            if i < self.nnoise:
                add(self.obj(self.noise_ptr[i]))
        for e in range(self.nsfx):
            add(self.obj(self.sfx_info[e][1]))
        indexed = {'PatternPointers', 'InstrumentPointers', 'NoiseInstrumentPointers'}
        while todo:
            name = todo.pop()
            if name in indexed:
                continue
            for t in refs.get(name, ()):
                add(t)
        return reach


@scen(static=True)
def scenario_c2_sound_static(g):
    """Pattern_1C and the instruments and tables marked unused: order lists, rows, pointer reachability."""
    m = SoundModel()
    info('bank 6: %d songs, %d sound effects, %d patterns, %d pulse/wave instruments, %d noise instruments' % (
        m.nsong, m.nsfx, m.npat, m.ninstr, m.nnoise))
    # ---- item 12: Pattern_1C
    p1c = m.pat_ptr.index(m.addr['Pattern_1C'])
    claim(g, 'Pattern_1C is pattern number $%02x in PatternPointers' % p1c, p1c == 0x1C)
    first_order = m.addr['Song_Silence_Ch1'] if False else min(m.addr[n] for n in m.addr if n.startswith('Order_') or n.startswith('Song_'))
    first_pat = min(m.pat_ptr)
    region = [(a, m.rb(a), m.rb(a + 1)) for a in range(first_order, first_pat, 2)]
    claim(g, 'the order list area $%04x to $%04x has an even length' % (first_order, first_pat), (first_pat - first_order) % 2 == 0)
    odd_bytes = [hex(a + 1) for a, tr, pat in region if pat == 0x1C]
    any_bytes = [hex(a) for a in range(first_order, first_pat) if m.rb(a) == 0x1C]
    info('bytes $1c in the order list area: at pattern position %s, anywhere %s' % (odd_bytes, any_bytes))
    claim(g, 'no order list entry names pattern $1c (second byte of any entry in the whole order list area, orphan lists included)', not odd_bytes)
    reach = sorted(m.pat_channels)
    claim(g, 'pattern numbers played by some song channel: %d of %d, missing %s' % (len(reach), m.npat, [hex(p) for p in range(m.npat) if p not in m.pat_channels]),
          sorted(set(range(m.npat)) - set(reach)) == [0x1C, 0x24, 0x25])
    claim(g, 'the only pattern that jumps to Pattern_1C or the other two is none: no pattern row holds a jump to them',
          not [p for p in range(m.npat) for r in m.rows(m.pat_ptr[p]) if r[2] == 'jump' and r[4] in (m.pat_ptr[0x1C], m.pat_ptr[0x24], m.pat_ptr[0x25])])
    # ---- item 15: instruments
    flagged = m.flagged()
    info('%d flagged objects' % len(flagged))
    bad = []
    for kind, comment, label in flagged:
        if kind[0] != 'instrument':
            continue
        table_name = 'noise' if kind[1] == 'noise' else 'pulse'
        used = m.noise_labels if table_name == 'noise' else m.pulse_labels
        ptrs = m.noise_ptr if table_name == 'noise' else m.instr_ptr
        idx = [i for i, a in enumerate(ptrs) if m.obj(a) == label]
        used_idx = [i for i in idx if i in (m.noise_used if table_name == 'noise' else m.pulse_used)]
        if label in used or used_idx:
            bad.append((label, idx, used_idx))
    n_instr = len([f for f in flagged if f[0][0] == 'instrument'])
    claim(g, 'all %d instruments commented "not used": no pattern row of a song channel and no sound effect row loads any index that maps to them' % n_instr,
          not bad and n_instr == 18, bad)
    info('pulse/wave instrument indices used: %s' % sorted(hex(i) for i in m.pulse_used))
    info('noise instrument indices used: %s' % sorted(hex(i) for i in m.noise_used))
    over = [(k, i) for k, ptrs, used in (('pulse', m.instr_ptr, m.pulse_used), ('noise', m.noise_ptr, m.noise_used)) for i in used if i >= len(ptrs)]
    claim(g, 'every instrument index in the data is inside its pointer table', not over, [(k, hex(i), (m.noise_used if k == 'noise' else m.pulse_used)[i]) for k, i in over])
    # ---- item 15: tables and data with no pointer
    reach = m.reachable()
    for kind, comment, label in flagged:
        pass
    notreached = [(kind[0], label) for kind, comment, label in flagged if label not in reach]
    reached = [(kind[0], label) for kind, comment, label in flagged if label in reach]
    claim(g, 'reachability over named pointers (roots: code, headers, sfx, decoded order lists, patterns and instruments): '
          'none of the %d flagged objects is reached' % len(flagged), not reached and len(notreached) == len(flagged), 'reached: %s' % reached)
    info('flagged and not reached: %s' % [l for _k, l in notreached])
    # control: the walk is not empty. Every other labelled object of the data area is reached, so a flagged
    # object being unreached is not a blind spot of the walk.
    flagged_names = {f[2] for f in flagged}
    named = [n for a, n in m.labels if 'Unused' in n and n not in flagged_names]
    info('objects named Unused without a comment above them: %s' % named)
    flagged_names |= set(named)
    claim(g, 'objects named Unused (instruments outside the tables, text) are not reached either', all(n not in reach for n in named), named)
    data_names = [n for a, n in m.labels if a >= m.addr['WaveVolume_Silent'] and a < m.end and '.' not in n]
    others = [n for n in data_names if n not in flagged_names and n not in reach]
    refs = m.references()
    dependents = {n: sorted(k for k, v in refs.items() if n in v) for n in others}
    claim(g, 'control: %d of %d labelled data objects without a comment are reached; the other %d are named only by unreached objects '
          '(tables that only an unused instrument points to)' % (len([n for n in data_names if n not in flagged_names and n in reach]),
                                                                 len(data_names) - len(flagged_names), len(others)),
          all(v and all(k not in reach for k in v) for v in dependents.values()), dependents)
    raw = [(i + 1, l.strip()) for i, l in enumerate(source(6)) if re.match(r'\s*dw\s+\$', l) and 'notes $' not in l]
    claim(g, 'no `dw $xxxx` raw address in the bank 6 source (only the note frequency table has numbers): every pointer is a label, so the name scan sees every pointer', not raw, raw[:5])


# --------------------------------------------------------------------------- sound, played

def force_call(g, label, e=0):
    """At the next UpdateSoundDriver call, make the game call `label` (PlaySong or PlaySfx) first, with E = e.
    The program counter is changed (as in tools/sound_relocation_test.py): the routine returns into UpdateSoundDriver."""
    upd = g.cov.symtab['UpdateSoundDriver'][1]
    target = g.cov.symtab[label][1]

    def go():
        r = g.pb.register_file
        sp = (r.SP - 2) & 0xFFFF
        g.pb.memory[sp] = upd & 0xFF
        g.pb.memory[sp + 1] = upd >> 8
        r.SP = sp
        r.E = e
        r.PC = target
    g.at('UpdateSoundDriver', go)


POINTER_VARS = ['wCh1SlidePtr', 'wCh1ArpPtr', 'wCh1ModePtr', 'wCh2SlidePtr', 'wCh2ArpPtr', 'wCh2ModePtr', 'wCh3VolumePtr',
                'wCh3ReleaseVolumePtr', 'wCh3SlidePtr', 'wCh3ArpPtr', 'wCh3ModePtr', 'wCh4ShapePtr', 'wCh4ControlPtr',
                'wWaveAnimPtr']


@scen
def scenario_c2_sound(g):
    """Play every song until each channel has gone round, then every sound effect, with hooks on the note and order
    list code of the driver. The result is compared with the static sets of c2_sound_static."""
    m = SoundModel()
    flagged = m.flagged()
    unused_labels = {f[2] for f in flagged} | {n for a, n in m.labels if 'Unused' in n}
    g.run(1200)                               # the language menu is up and nothing else touches the sound
    notes = []                                # (source, channel 1-4, instrument index)
    orders = []                               # (channel, address, pattern)
    muted = []
    cur = {'src': 'idle'}

    def note_hook(label, ch):
        def fn():
            de = g.pb.register_file.D << 8 | g.pb.register_file.E
            sfx_here = g.peek('wSfxChannel') == {2: g.syms['wCh2Tick'] & 0xFF, 4: g.syms['wCh4Tick'] & 0xFF}.get(ch, -1)
            (muted if label == 'UpdateMutedChannel.note' else notes).append(
                ('sfx' if sfx_here else 'song', ch, g.mem[de + 1], cur['src']))
        trace(g, label, fn)

    def order_hook(label, ch):
        def fn():
            de = g.pb.register_file.D << 8 | g.pb.register_file.E
            orders.append((ch, de, g.mem[de + 1], cur['src']))
        trace(g, label, fn)
    for label, ch in (('UpdateSoundDriver.note', 1), ('UpdateChannel2.note', 2), ('UpdateChannel3.note', 3),
                      ('UpdateChannel4.note', 4), ('UpdateMutedChannel.note', 0)):
        note_hook(label, ch)
    for label, ch in (('UpdateSoundDriver.readOrder', 1), ('UpdateChannel2.readOrder', 2), ('UpdateChannel3.readOrder', 3),
                      ('UpdateChannel4.readOrder', 4)):
        order_hook(label, ch)
    ptrs = []

    def sample():
        for n in POINTER_VARS:
            v = g.mem[g.syms[n]] | g.mem[g.syms[n] + 1] << 8
            if 0x4000 <= v < 0x8000:
                ptrs.append((n, v))
    seen_obj = set()
    for song in range(m.nsong):
        cur['src'] = 'song %d' % song
        force_call(g, 'PlaySong', e=song)
        visits = {}
        frames = 0
        done = len(orders)
        while frames < 14000:
            g.run(1)
            frames += 1
            sample()
            for ch, de, pat, src in orders[done:]:
                visits[(ch, de)] = visits.get((ch, de), 0) + 1
            done = len(orders)
            if frames % 60 == 0:
                chans_done = {ch for (ch, de), n in visits.items() if n >= 2}
                if chans_done >= {1, 2, 3, 4}:
                    break
        info('song %d: %d frames, channels that went round: %s' % (song, frames, sorted({ch for (ch, de), n in visits.items() if n >= 2})))
        claim(g, 'song %d: every channel went round (an order list entry read twice)' % song,
              {ch for (ch, de), n in visits.items() if n >= 2} >= {1, 2, 3, 4})
    # sound effects, one after the other, on the silent song
    cur['src'] = 'idle'
    force_call(g, 'PlaySong', e=0)
    g.run(30)
    for e in range(m.nsfx):
        cur['src'] = 'sfx %d' % e
        force_call(g, 'PlaySfx', e=e)
        for _ in range(900):
            g.run(1)
            sample()
            if g.peek('wSfxDone') == 0xFF or (g.peek('wSfxChannel') == 0xFF and _ > 3):
                break
        g.run(5)
    pulse_obs = {i for src, ch, i, tag in notes if ch in (1, 2, 3)}
    noise_obs = {i for src, ch, i, tag in notes if ch == 4}
    pats_obs = {pat for ch, de, pat, src in orders}
    info('%d notes started, %d order list entries read, %d muted-channel notes (they load no instrument)' % (len(notes), len(orders), len(muted)))
    info('pulse/wave instrument indices started: %s' % sorted(hex(i) for i in pulse_obs))
    info('noise instrument indices started: %s' % sorted(hex(i) for i in noise_obs))
    claim(g, 'pulse and wave indices started in play are all in the static set (decoded from the data)', pulse_obs <= set(m.pulse_used),
          sorted(hex(i) for i in pulse_obs - set(m.pulse_used)))
    claim(g, 'noise indices started in play are all in the static set', noise_obs <= set(m.noise_used), sorted(hex(i) for i in noise_obs - set(m.noise_used)))
    claim(g, 'the static set is fully played: no decoded index was missed (%d pulse/wave, %d noise)' % (len(m.pulse_used), len(m.noise_used)),
          set(m.pulse_used) <= pulse_obs and set(m.noise_used) <= noise_obs,
          (sorted(hex(i) for i in set(m.pulse_used) - pulse_obs), sorted(hex(i) for i in set(m.noise_used) - noise_obs)))
    labels_obs = {m.obj(m.instr_ptr[i]) for i in pulse_obs if i < m.ninstr} | {m.obj(m.noise_ptr[i]) for i in noise_obs if i < m.nnoise}
    claim(g, 'no instrument commented "not used" or "Unused" was started', not (labels_obs & unused_labels), sorted(labels_obs & unused_labels))
    claim(g, 'order list entries: pattern numbers read are all reachable ones; $1c, $24 and $25 were never read',
          pats_obs <= set(m.pat_channels) and not pats_obs & {0x1C, 0x24, 0x25} and 0 not in {},
          'read %d of %d reachable, never read: %s' % (len(pats_obs), len(m.pat_channels), sorted(hex(p) for p in set(m.pat_channels) - pats_obs)))
    # the instruments store "table address - 1" (arpeggio, mode, volume) or "- 2" (slide, wave animation): the
    # step read next is at v + 1 or v + 2. Noise shape and control pointers are taken both ways.
    offs = {'Slide': (2,), 'WaveAnim': (2,), 'Arp': (1,), 'Mode': (1,), 'Volume': (1,), 'Shape': (1, 2), 'Control': (1, 2)}

    def shift(n):
        return next(v for k, v in offs.items() if k in n)
    touched = {m.obj(v + k) for n, v in ptrs for k in shift(n)}
    who = {}
    for n, v in ptrs:
        for k in shift(n):
            who.setdefault(m.obj(v + k), set()).add((n, hex(v)))
    reach = m.reachable()
    table_like = re.compile(r'(Table|Arpeggio|PitchSlide|PitchMode|WaveVolume|WaveAnim|NoiseShape|NoiseControl)')
    unused_tables = {n for a, n in m.labels if table_like.match(n) and '.' not in n and n not in reach and a >= m.addr['WaveVolume_Silent']}
    info('%d table objects are unreached in the static walk (flagged or only named by an unused instrument)' % len(unused_tables))
    bad = sorted(touched & unused_tables)
    for b_ in bad:
        info('flagged %s touched by %s' % (b_, sorted(who[b_])[:4]))
    claim(g, 'table pointers (slide, arpeggio, mode, volume, shape, control, wave animation) sampled every frame: none ever pointed into a table that the static walk calls unreached',
          not bad, '%d distinct objects touched; flagged touched: %s' % (len(touched), bad))
    claim(g, 'control: the tables the static walk reaches were touched (%d of %d)' % (len(touched & {n for n in reach if table_like.match(n)}),
          len({n for n in reach if table_like.match(n)})), len(touched & {n for n in reach if table_like.match(n)}) >= 0.8 * len({n for n in reach if table_like.match(n)}))


# --------------------------------------------------------------------------- shots in slots 1 to 5

SHOT_Y = [1, 5, 9, 13, 16, 19]             # offset of the y of slot 0 to 5 in wShots (slots 0 to 2 have 4 bytes, 3 to 5 have 3)
SFX_PLASMA, SFX_ROCKET, SFX_LASER = 17, 18, 19


def weapon_level(g, ptype):
    """A running level with an empty field (poke: so no shot ends on a brick), the weapon `ptype` taken (the
    power-up is dropped on the bat by the harness) and the ball parked on the bat."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(100, launch=False)
    clear_field(g)
    ok = C.catch_powerup(g, ptype)
    C.park_ball(g)
    return ok


def tap_a(g):
    g.pb.button_press('a')
    g.run(1)
    g.pb.button_release('a')
    g.run(1)


def shot_state(g):
    return [g.peek('wShotActive+%d' % k) for k in range(6)], [g.peek('wShots+%d' % o) for o in SHOT_Y]


@scen
def scenario_c2_shots_laser(g):
    """Real input: a Laser bat and A pressed every other frame. Every slot 0 to 5 is used in order; per frame the y of
    each slot goes up 2; UpdateShot3 to UpdateShot5 draw ShotSprite_Laser. Poked: the empty field and the parked ball."""
    ok = weapon_level(g, 11)
    claim(g, 'Laser power-up caught: wLaserBat 1, wShotReloadDelay 8', ok and g.peek('wLaserBat') == 1 and g.peek('wShotReloadDelay') == 8,
          'wLaserBat %d delay %d' % (g.peek('wLaserBat'), g.peek('wShotReloadDelay')))
    oam = {k: [] for k in range(6)}
    started = {}
    pend = {}

    def entry(k):
        def fn():
            pend[k] = g.peek('wOamWritePtr') | g.peek('wOamWritePtr+1') << 8
        trace(g, 'UpdateShot%d' % k, fn)

    def leave(k, label):
        def fn():
            if k in pend:
                end = g.peek('wOamWritePtr') | g.peek('wOamWritePtr+1') << 8
                start = pend.pop(k)
                oam[k].append([(g.mem[a + 2], g.mem[a + 3]) for a in range(start, end, 4)])
        trace(g, label, fn)
    calls = {k: 0 for k in range(6)}
    for k in range(6):
        entry(k)
        trace(g, 'UpdateShot%d' % k, (lambda k=k: calls.__setitem__(k, calls[k] + 1)))
        leave(k, 'UpdateShots_Shot%d' % (k + 1) if k < 5 else 'Shots_HandleFire')
    log = []
    for f in range(75):
        before = shot_state(g)[0]
        tap_a(g)
        act, ys = shot_state(g)
        for k in range(6):
            if act[k] and k not in started:
                started[k] = f
        log.append((f, act, ys))
        if f % 25 == 0 and g.peek('wBallOnBat') == 0:
            C.park_ball(g)
    info('frame each slot started: %s' % started)
    claim(g, 'all six slots were started, in order 0 to 5 (first free slot each time)',
          sorted(started) == list(range(6)) and all(started[k] < started[k + 1] for k in range(5)), started)
    both = [f for f, act, ys in log if all(act)]
    claim(g, 'all six slots in flight at the same time (%d logged frames)' % len(both), len(both) > 0, both[:3])
    # wShotActive is the age of the shot in frames (it counts up in every UpdateShotN): y change per frame of age
    steps = {k: {} for k in range(6)}
    for (f0, a0, y0), (f1, a1, y1) in zip(log, log[1:]):
        for k in range(6):
            if a0[k] >= 5 and a1[k] > a0[k] and y1[k] < y0[k]:
                r = (y0[k] - y1[k]) / (a1[k] - a0[k])
                steps[k][r] = steps[k].get(r, 0) + 1
    info('pixels up per frame of age, by slot: %s' % steps)
    claim(g, 'slots 0 to 5: every flying step of a laser is 2 pixels up per frame',
          all(set(steps[k]) == {2.0} for k in range(6)), steps)
    claim(g, 'the update routines UpdateShot1 to UpdateShot5 each ran', all(calls[k] > 5 for k in range(6)), calls)
    laser = {(0x12, 0x0c), (0x10, 0x0c), (0x11, 0x0c)}
    rocket = {(0x55, 0x04), (0x51, 0x41), (0x54, 0x44)}
    for k in range(6):
        flat = [e for row in oam[k] for e in row]
        info('slot %d sprites written: %d entries, (tile, attribute) %s' % (k, len(flat), sorted(set(flat))))
    claim(g, 'slots 3, 4 and 5 wrote only ShotSprite_Laser tiles and attributes (also in the Laser bat they are the only ones allocated)',
          all(oam[k] and {e for row in oam[k] for e in row} <= laser for k in (3, 4, 5)),
          [sorted({e for row in oam[k] for e in row}) for k in (3, 4, 5)])


@scen
def scenario_c2_shots_plasma(g):
    """A rocket in slot 1 (two rockets fired with A), then the Plasma power-up: A is refused while slot 1 is busy, and
    plasma is fired when slot 1 is free. Real input; poked: the empty field and the parked ball; the Plasma power-up is
    dropped on the bat by the harness a few frames after slot 0 has ended."""
    ok = weapon_level(g, 1)
    claim(g, 'Rocket bat: wLaserBat 0, wRocketLaserBat 1, reload 30', ok and g.peek('wLaserBat') == 0 and g.peek('wRocketLaserBat') == 1
          and g.peek('wShotReloadDelay') == 30)
    sounds = []
    trace(g, 'PlaySound', lambda: sounds.append((g.frame, g.pb.register_file.A)))
    for _ in range(80):
        tap_a(g)
        if g.peek('wShotActive+1'):
            break
    claim(g, 'two rockets in flight: slot 0 and slot 1 busy, slot 2 free', g.peek('wShotActive') and g.peek('wShotActive+1') and not g.peek('wShotActive+2'),
          shot_state(g))
    # wait until the first rocket has ended at the top ($18) and the second one is still flying
    g.wait_until(lambda: g.peek('wShotActive') == 0 or not g.peek('wShotActive+1'), limit=200, step=1)
    claim(g, 'window reached: slot 0 free, slot 1 still flying', g.peek('wShotActive') == 0 and g.peek('wShotActive+1') != 0,
          '%s y of slot 1 %d' % (shot_state(g)[0], g.peek('wShots+5')))
    n = g.count('Powerup_Plasma')
    slot = C.Game.drop_powerup(g, 3)
    g.poke(slot + 1, g.peek('wBatY') - 19)          # poke: at the top of the catch range (y from bat - 19 to bat - 13), so it is caught within the window
    g.run(1)
    g.wait_until(lambda: g.count('Powerup_Plasma') > n, limit=30, step=1)
    claim(g, 'Plasma caught: wPlasmaState 1, wRocketLaserBat 0, slot 1 still busy', g.count('Powerup_Plasma') > n and g.peek('wPlasmaState') == 1
          and g.peek('wRocketLaserBat') == 0 and g.peek('wShotActive+1') != 0,
          'state %d rl %d slots %s' % (g.peek('wPlasmaState'), g.peek('wRocketLaserBat'), shot_state(g)[0]))
    del sounds[:]
    busy_frames = 0
    refused = []
    for _ in range(8):
        if g.peek('wShotActive+1') == 0:
            break
        tap_a(g)
        busy_frames += 1
        refused.append((g.peek('wPlasmaState'), g.peek('wShotActive'), g.peek('wWeaponFlag')))
    plasma_calls = [s for s in sounds if s[1] == SFX_PLASMA]
    claim(g, 'A with slot 1 busy (%d taps): refused, no plasma sound, wPlasmaState stays 1, slot 0 stays free, wWeaponFlag stays set' % busy_frames,
          busy_frames >= 2 and not plasma_calls and all(r[0] == 1 and r[1] == 0 and r[2] != 0 for r in refused),
          'sounds %s, state/slot0/flag per tap %s' % (sounds, refused))
    # slot 1 ends (the rocket reaches $18), then plasma is fired
    g.wait_until(lambda: g.peek('wShotActive+1') == 0, limit=200, step=1)
    del sounds[:]
    for _ in range(3):
        tap_a(g)
        if g.peek('wPlasmaState') == 2:
            break
    ys = []
    for _ in range(14):
        ys.append(g.peek('wShots+5'))
        g.run(1)
    claim(g, 'A with slot 1 free: plasma fires (sound 17, wPlasmaState 2, slots 0 and 1 busy, wWeaponFlag 0)',
          g.peek('wPlasmaState') in (2,) or any(s[1] == SFX_PLASMA for s in sounds), 'sounds %s state %d slots %s flag %d' % (
              sounds[:4], g.peek('wPlasmaState'), shot_state(g)[0], g.peek('wWeaponFlag')))
    claim(g, 'the plasma shot in slot 1 goes up 1 pixel per frame', len(ys) > 8 and all(a - b == 1 for a, b in zip(ys[5:], ys[6:])), ys)


# --------------------------------------------------------------------------- ClearUnbreakableHitEffects

@scen
def scenario_c2_effects(g):
    """ClearUnbreakableHitEffects does not clear the effect slots. In real play the call after a lost life finds the
    slots dead (the effect lasts 18 frames, the lost-life countdown 40, and only a ball can start one), but the call
    at level start can find a live slot: the last brick is destroyed in the call that also hits an unbreakable
    brick, and the level changes before the effect has run out. Poked: the last brick and the unbreakable brick next
    to it, and the ball position at the junction; the collision, the effect and the level change are the game's."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(100, launch=False)
    clear_field(g)
    base = g.syms['wBrickMap']
    slots = g.syms['wUnbreakableHitEffects']

    def timers():
        return [g.mem[slots + 3 * i] for i in range(10)]
    rows = []
    trace(g, 'ClearUnbreakableHitEffects', lambda: rows.append(('clear', g.frame, g.state, g.peek('wCurrentLevel'), timers(), g.peek('wUnbreakableHitEffectPtr'))))
    trace(g, 'UpdateUnbreakableHitEffects', lambda: rows.append(('update', g.frame, g.state, g.peek('wCurrentLevel'), timers(), 0)))
    trace(g, 'SpawnUnbreakableHitEffect', lambda: rows.append(('spawn', g.frame, g.state, g.peek('wCurrentLevel'), timers(), 0)))
    level0 = g.peek('wCurrentLevel')
    g.sync_poke(base + 16 * 6 + 5, 0x01)                   # the last breakable brick (1 hit point), column 5
    g.sync_poke(base + 16 * 6 + 6, 0x0E)                   # an unbreakable brick right of it, column 6
    g.sync_poke('wBricksLeft', 1)
    del rows[:]
    g.sync_poke('wBalls', 0, 74, 0, 6 * 16 - 4, 0, 3, 0)    # the ball spans both columns, moving up
    g.poke('wBallOnBat', 0)
    g.run(3)
    spawned = [r for r in rows if r[0] == 'spawn']
    claim(g, 'the ball hits the unbreakable brick: the spawn routine runs and a slot gets timer $12',
          bool(spawned) and any(r[0] == 'update' and 0x12 in r[4] or 0x11 in r[4] for r in rows), spawned[:1])
    loads = g.count('LoadLevel')
    g.wait_until(lambda: g.count('LoadLevel') > loads and g.state == 2, limit=1500, step=1)
    g.run(240)
    clears = [r for r in rows if r[0] == 'clear']
    info('hook counts: clear %d, LoadLevel %d, state now %d' % (g.count('ClearUnbreakableHitEffects'), g.count('LoadLevel'), g.state))
    info('rows after the clear (first 3): %s' % [(r[0], r[1], r[2], r[3], r[4]) for r in rows if clears and r[1] >= clears[0][1]][:3])
    info('last rows: %s' % [(r[0], r[1], r[2], r[3], r[4]) for r in rows[-3:]])
    claim(g, 'the level changed to level %d' % (g.peek('wCurrentLevel') + 1), g.peek('wCurrentLevel') == level0 + 1, 'level %d -> %d' % (level0, g.peek('wCurrentLevel')))
    live = [r for r in clears if any(r[4])]
    claim(g, 'ClearUnbreakableHitEffects at the start of the next level found a live slot (timer above 0) and left it', bool(live), clears)
    after = [r for r in rows if r[0] == 'update' and r[3] == level0 + 1 and r[1] > (live[0][1] if live else 0) and any(r[4])]
    claim(g, 'the live slots go on counting down when the new level starts to run (UpdateUnbreakableHitEffects draws a sprite for each at its stored position)', bool(after),
          [(r[1], [t for t in r[4] if t]) for r in after[:4]])
    # the call after a lost life: the effect is poked (slot 0, timer $12) a few frames before the last ball is lost;
    # the countdown of 40 frames in Gameplay_AfterBalls is longer than the 18 frames of the effect
    del rows[:]
    g.poke('wLives', 5)
    g.sync_poke(slots, 0x12, 100, 100)
    g.sync_poke('wBalls', 0, 150, 0, 40, 16, 3, 0)         # poke: the ball is just above the bottom, falling
    g.poke('wBallOnBat', 0)
    g.wait_until(lambda: any(r[0] == 'clear' for r in rows), limit=300, step=1)
    cl = [r for r in rows if r[0] == 'clear']
    up = [r for r in rows if r[0] == 'update' and any(r[4])]
    claim(g, 'after a lost life: the effect was alive for %d frames and its slot was already 0 at the call' % len(up),
          bool(cl) and not any(cl[0][4]) and len(up) > 0, cl[:1])


# --------------------------------------------------------------------------- driver

def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--scenario', action='append', default=[])
    ap.add_argument('--rom', default=os.path.join(C.ROOT, 'game.gbc'))
    ap.add_argument('--frames', type=int, default=400000)
    ap.add_argument('--verbose', action='store_true')
    ap.add_argument('--list', action='store_true')
    args = ap.parse_args()
    C.VERBOSE = args.verbose
    if args.list:
        for n, fn in SCENARIOS.items():
            print('%-18s %s' % (n, (fn.__doc__ or '').strip().split('\n')[0]))
        return 0
    names = []
    for s in args.scenario or ['all']:
        names.extend(SCENARIOS if s == 'all' else [s])
    labels = C.read_labels()
    for n in names:
        print('scenario %s' % n, flush=True)
        t = time.time()
        if n in STATIC:
            SCENARIOS[n](None)
            print('  %.1f s' % (time.time() - t), flush=True)
            continue
        cov = C.Coverage(labels, [])
        g = C.Game(cov, args.rom, args.frames)
        try:
            SCENARIOS[n](g)
        except C.StopScenario:
            print('  stopped at the frame limit', file=sys.stderr)
        print('  %d frames, %.1f s' % (g.frame, time.time() - t), flush=True)
        g.close()
    print('claims: %d pass, %d fail' % (sum(RESULTS), len(RESULTS) - sum(RESULTS)))
    return 0 if all(RESULTS) else 1


if __name__ == '__main__':
    sys.exit(main())

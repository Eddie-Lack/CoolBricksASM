"""Second extra play-test pass: the items a critic found still reachable after playtest_core, _enemies, _weapons,
_powerups, _menus and _sound.

Usage (needs PyBoy; run from the repository root after `make`, one emulator at a time):

    python tools/playtest_extra2.py --list
    python tools/playtest_extra2.py --scenario x2_ending_buttons --verbose
    python tools/playtest_extra2.py --scenario all

Scenarios (each deterministic, under about 60 s):
    x2_ending_buttons   Ending_Update: A, B, Select and Start each alone leave state 13 (state 2, hStateTimer $28,
                        one PlaySound call); Right alone does not. Real input; the ending is reached by poking
                        wCurrentLevel to 158 and finishing two levels (as coverage.py does).
    x2_corners          CollideBall_Corners bottom-left, top-right and bottom-right diagonals. A ball is poked next to
                        one planted unbreakable brick (every pose in a grid) and the diagonal labels are hooked.
                        The result of each diagonal is compared with BallReflect*Table, and the other corner outcomes
                        of the same call are logged to show which diagonals can only happen together with another
                        corner hit of the same brick (a brick is 16 x 8 and the ball points are 5 pixels apart).
    x2_triple_nudge     wBallWorkFlags $80 on ball slots 1 and 2 with a real Triple ball (power-up caught). Poked:
                        the flags and positions of the balls.
    x2_ufo_palette      Level 89 (wLevelType 2, wBlobPalette 1): the blob sprites in OAM carry the table attribute + 1 (the "UFO" name in the critic list is the blob here).

What is poked is said in each scenario; nothing here edits coverage.py.
"""
import argparse
import io
import os
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import coverage as C          # noqa: E402

assert os.path.abspath(C.__file__) == os.path.join(HERE, 'coverage.py'), C.__file__
C.MAX_LOG = 100000

SCENARIOS = {}
RESULTS = []


def scen(fn):
    SCENARIOS[fn.__name__.replace('scenario_', '')] = fn
    return fn


def claim(g, text, ok, detail=''):
    RESULTS.append(bool(ok))
    print('  %s  %s%s' % ('PASS' if ok else 'FAIL', text, (' | ' + str(detail)) if detail != '' else ''), flush=True)


def trace(g, label, fn):
    def arm():
        fn()
        g.at(label, arm)
    g.at(label, arm)


def table(g, label, n=32):
    bank, addr = g.cov.symtab[label]
    off = bank * 0x4000 + addr - 0x4000 if bank else addr
    return list(g.rom_data[off:off + n])


# --------------------------------------------------------------------------- Ending_Update buttons

def reach_ending(g):
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(100, launch=False)
    g.poke('wCurrentLevel', 158)
    C.finish_to_next(g)
    g.poke('wLives', 9)
    g.finish_level(2)
    g.wait_until(lambda: g.state == 13, limit=600)
    g.wait_until(lambda: g.count('Ending_Update') > 0, limit=600)     # the handler starts about 60 frames after the state changes
    g.run(20)


@scen
def scenario_x2_ending_buttons(g):
    """Ending_Update with Right (control), A, B, Select and Start, each alone. One state snapshot, restored for each."""
    reach_ending(g)
    claim(g, 'the ending screen (state 13) was reached by real play', g.state == 13, 'state %d' % g.state)
    calls = []
    trace(g, 'PlaySound', lambda: calls.append((g.frame, g.pb.register_file.A, g.state)))
    snap = io.BytesIO()
    g.pb.save_state(snap)
    for button in ('right', 'a', 'b', 'select', 'start'):
        snap.seek(0)
        g.pb.load_state(snap)
        n = len(calls)
        g.pb.button_press(button)
        g.run(6)
        g.pb.button_release(button)
        g.run(4)
        left = g.state == 2
        timer = g.peek('hStateTimer')
        g.log('%s: state %d timer %d, PlaySound calls %s' % (button, g.state, timer, calls[n:]))
        if button == 'right':
            claim(g, 'Right alone does not leave the ending', g.state == 13, 'state %d' % g.state)
        else:
            claim(g, '%s alone leaves state 13 for state 2 and plays one sound' % button.capitalize(),
                  left and len(calls) - n == 1, 'state %d, hStateTimer %d, PlaySound calls %d (A=%s)' % (
                      g.state, timer, len(calls) - n, [hex(c[1]) for c in calls[n:]]))


# --------------------------------------------------------------------------- CollideBall_Corners diagonals

CORNER_LABELS = ['bottomLeftMiss', 'bottomLeftDiagonal', 'bottomLeftReflectBottom', 'checkBottomRight',
                 'bottomRightMiss', 'bottomRightDiagonal', 'bottomRightReflectBottom', 'checkTopLeft',
                 'topLeftMiss', 'topLeftDiagonal', 'topLeftReflectTop', 'checkTopRight',
                 'topRightMiss', 'topRightDiagonal', 'topRightReflectTop', 'done']


@scen
def scenario_x2_corners(g):
    """Poke a ball at every pose around one planted unbreakable brick (map row 6, column 5) and log the sequence of
    CollideBall_Corners labels with the direction at each. A pose is (x, y, direction); speed 3, flags 0."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(100, launch=False)
    base = g.syms['wBrickMap']
    for r in range(1, 17):
        g.sync_poke(base + 16 * r + 1, *([0] * 9))
    g.sync_poke('wBricksLeft', 200)
    g.sync_poke(base + 16 * 6 + 5, 0x0E)
    g.runs = []
    cur = []

    def event(name):
        def fn():
            cur.append((name, g.peek('wBallWorkDirection'), g.peek('wBallWorkX'), g.peek('wBallWorkY')))
            g.at('CollideBall_Corners.' + name, fn)
        g.at('CollideBall_Corners.' + name, fn)
    for n in CORNER_LABELS:
        event(n)
    g.at('CollideBall_Corners', lambda: None)
    top, left = (6 + 3) * 8, 5 * 16
    t0 = time.time()
    poses = 0
    for d in (4, 12, 20, 28):                      # up-right, down-right, down-left, up-left
        for dy in range(-8, 9):
            for dx in range(-7, 17):
                if time.time() - t0 > 50:
                    break
                del cur[:]
                g.sync_poke('wBalls', 0, top + dy, 0, left + dx, d, 3, 0)
                g.poke('wBallOnBat', 0)
                g.run(2)
                poses += 1
                if cur:
                    g.runs.append(((d, left + dx, top + dy), list(cur)))
    g.log('%d poses, %d with a corner call, %.1f s' % (poses, len(g.runs), time.time() - t0))
    rl, rt, rb = table(g, 'BallReflectLeftTable'), table(g, 'BallReflectTopTable'), table(g, 'BallReflectBottomTable')
    rr = table(g, 'BallReflectRightTable')
    # one entry per call of CollideBall_Corners: the events of a pose end with 'done' at every call
    calls = []
    for pose, ev in g.runs:
        seg = []
        for e in ev:
            seg.append(e)
            if e[0] == 'done':
                calls.append((pose, seg))
                seg = []
    g.log('%d calls of CollideBall_Corners' % len(calls))
    order = [('bottomLeft', 'checkBottomRight'), ('bottomRight', 'checkTopLeft'), ('topLeft', 'checkTopRight'), ('topRight', 'done')]
    spec = {'bottomLeftDiagonal': ('bottomLeft', rl, rb), 'bottomRightDiagonal': ('bottomRight', rr, rb),
            'topRightDiagonal': ('topRight', rr, rt)}
    for diag, (corner, t1, t2) in spec.items():
        nxt = dict(order)[corner]
        found = []
        for pose, seg in calls:
            names = [e[0] for e in seg]
            if diag in names:
                i = names.index(diag)
                j = names.index(nxt, i)
                hit = [c for c, _n in order if c + 'Miss' not in names]
                found.append((pose, seg[i][1], seg[j][1], hit))
        ok = bool(found) and all(out == t2[t1[din]] for _, din, out, _h in found)
        claim(g, '%s: %d calls, direction out = table2[table1[direction in]] in every one' % (diag, len(found)), ok,
              'first (pose, in, out, corners hit) %s' % (found[0],) if found else 'not reached')
        alone = [f for f in found if f[3] == [corner]]
        together = {}
        for f in found:
            together[tuple(f[3])] = together.get(tuple(f[3]), 0) + 1
        claim(g, '%s: never alone in this grid of poses (the partner corner of the same brick hits in the same call)' % diag, not alone,
              'this corner alone in %d calls; combinations %s' % (len(alone), together))


# --------------------------------------------------------------------------- Triple ball and the nudge

@scen
def scenario_x2_triple_nudge(g):
    """With a real Triple ball: poke wBallWorkFlags to $80 on slot 1, then slot 2, in free flight, and see that only
    that ball turns one step."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    ok = C.catch_powerup(g, 9)
    g.play(400, launch=False, until=lambda: g.peek('wBallCount') == 3)
    g.play(30, launch=False)
    claim(g, 'Triple ball caught and three balls in play', ok and g.peek('wBallCount') == 3,
          'wBallCount %d, balls %s' % (g.peek('wBallCount'), [g.ball(i) for i in range(3)]))
    base = g.syms['wBrickMap']
    for r in range(1, 17):
        g.sync_poke(base + 16 * r + 1, *([0] * 9))
    g.sync_poke('wBricksLeft', 200)
    rows = []
    trace(g, 'UpdateBall_Move.lookupVelocity',
          lambda: rows.append((g.frame, g.peek('wBallWorkFlags'), g.peek('wBallWorkDirection'), g.peek('wBallWorkY'), g.peek('wBallWorkX'))))
    # three balls in free flight, far apart; directions 12, 13+... chosen so that d + 1 is not a multiple of 8
    free = [(100, 0, 40, 12), (100, 0, 100, 13), (100, 0, 140, 14)]
    for target in (1, 2, 0):
        data = []
        for i, (y, _z, x, d) in enumerate(free):
            data += [0, y, 0, x, d, 3, 0x80 if i == target else 0]
        del rows[:]
        pf = []

        def do_poke(data=data):
            pf.append(len(rows))                   # rows logged from here on belong to the poked balls
            g.poke('wBalls', *data)
            g.poke('wBallOnBat', 0)
        g.at('Gameplay_Update', do_poke)
        g.wait_until(lambda: pf, limit=10, step=1)
        g.run(1)
        rows[:] = rows[pf[0]:]
        after = [g.ball(i) for i in range(3)]
        g.log('target %d: lookups %s after %s' % (target, rows, after))
        first = []
        for i, (_y, _z, x, _d) in enumerate(free):         # the first lookup of each ball, told apart by its x
            first.append(next((r for r in rows if abs(r[4] - x) <= 3 and 99 <= r[3] <= 103), (0, -1, -1, 0, 0)))
        want = [((d + 1) & 0x1F) for (_y, _z, _x, d) in free]
        claim(g, 'flags $80 on slot %d: that ball is turned one direction step, flags cleared, the others keep direction and flags' % target,
              len(first) == 3 and all(
                  (r[2] == want[i] and r[1] == 0) if i == target else (r[2] == free[i][3] and r[1] == 0)
                  for i, r in enumerate(first)),
              'lookup rows (flags, dir) %s, expected dir %s' % ([(r[1], r[2]) for r in first], [want[i] if i == target else free[i][3] for i in range(3)]))


# --------------------------------------------------------------------------- blob palette, level 89

@scen
def scenario_x2_ufo_palette(g):
    """Level 89: the level type byte is $12: blob level (bit 1), wBlobPalette 1; the blob sprite attributes in OAM
    are the BlobSprites attributes + 1."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    C.goto_level(g, 89)
    g.play(200)
    claim(g, 'level 89: wLevelType 2 and wBlobPalette 1', g.peek('wLevelType') == 2 and g.peek('wBlobPalette') == 1,
          'level %d wLevelType %d wBlobPalette %d' % (g.peek('wCurrentLevel') + 1, g.peek('wLevelType'), g.peek('wBlobPalette')))
    bank, base = g.cov.symtab['BlobSprites']
    attrs = {g.rom_data[bank * 0x4000 + base - 0x4000 + 3 + 4 * i] for i in range(32)}
    oam = []

    def grab():
        end = g.peek('wOamWritePtr') | g.peek('wOamWritePtr+1') << 8
        oam.append([g.mem[end - 16 + 4 * i + 3] for i in range(4)])
    trace(g, 'UpdateEnemyPath', grab)
    g.play(200, launch=False)
    flat = [a for row in oam for a in row]
    claim(g, 'blob OAM attributes are the table attributes + 1', bool(flat) and {a - 1 for a in flat} <= attrs | {0, 8},
          'OAM %s table %s' % (sorted(set(flat)), sorted(attrs)))


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
        cov = C.Coverage(labels, [])
        g = C.Game(cov, args.rom, args.frames)
        print('scenario %s' % n, flush=True)
        t = time.time()
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

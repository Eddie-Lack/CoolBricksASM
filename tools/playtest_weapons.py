"""Second play-test pass for the weapon code: cases the first pass did not reach.

Uses the harness in tools/coverage.py (which is not changed). Run from the repository root after `make`:

    python tools/playtest_weapons.py --list
    python tools/playtest_weapons.py --scenario plasma_bricks
    python tools/playtest_weapons.py --scenario all --verbose

Every scenario hooks some labels, records variables and registers each time they are reached (a
register is written @A, @HL and so on) and then checks a claim at every hit. The result is a list of
PASS and FAIL lines with the number of hits behind each. Scenarios take 15 to 60 s and are deterministic.

What is played and what is poked (the pokes are marked in the scenario code):
    plasma_bricks   Real input: plasma and rocket shots fired at bricks planted above the bat.
    interplay       Real input; the power-ups are dropped onto the bat with the harness helper.
    grenade_charge  Real input: A held for 5 to 150 frames, left or right pressed on release. The count
                    of grenades is topped up by poking wGrenadeCount.
    shot_cooldown   Real input; bricks are planted, wBricksLeft is raised.
    ufo_shots       A UFO level. Shots and the UFO are placed on top of each other by poking (as in the
                    enemies scenario), also with plasma active and with another shot in flight.
    blast_on_wall   A grenade slot is poked so that it lands with its blast corners on walls.
    unbreakable_ring  Real input; the ball hits planted unbreakable bricks more than ten times.
    levels_watch    The levels scenario of coverage.py with watches on the unbreakable top row and fireworks.
"""
import argparse
import collections
import os
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import coverage as cv  # noqa: E402  (tools/coverage.py)

ROOT = cv.ROOT
REGS = ('A', 'B', 'C', 'D', 'E', 'H', 'L', 'HL', 'BC', 'DE')


def reg(rf, name):
    """A register of the emulator; PyBoy only offers A and the pairs here, so H, L, B, C, D and E come from the pairs."""
    if hasattr(rf, name):
        return getattr(rf, name)
    pair = {'B': 'BC', 'C': 'BC', 'D': 'DE', 'E': 'DE', 'H': 'HL', 'L': 'HL'}[name]
    v = getattr(rf, pair)
    return v >> 8 if name in 'BDH' else v & 0xFF


class CheckWatch(cv.Watch):
    """A watch that also reads registers (@A, @HL, ...) and keeps every record in order."""
    seq = 0

    def __init__(self, spec, syms):
        label, _, rest = spec.partition(':')
        items = [i.strip() for i in rest.split(',') if i.strip()]
        self.regs = [i[1:] for i in items if i.startswith('@')]
        names = [i for i in items if not i.startswith('@')]
        super().__init__(label + ':' + ','.join(names), syms)
        for r in self.regs:
            assert r in REGS, r
        self.game = None
        self.rows = []                      # (seq, frame, tuple of values: variables first, then registers)

    def record(self, memory, frame):
        super().record(memory, frame)
        values = []
        for name, addr, size in self.vars:
            values.append(memory[addr] if size == 1 else tuple(memory[addr + i] for i in range(size)))
        rf = self.game.pb.register_file
        for r in self.regs:
            values.append(reg(rf, r))
        CheckWatch.seq += 1
        self.rows.append((CheckWatch.seq, frame, tuple(values)))

    def names(self):
        return [v[0] for v in self.vars] + ['@' + r for r in self.regs]


SCENARIOS = {}
SPECS = {}
CHECKS = {}
RESULTS = []


def scenario(watches, check):
    def deco(fn):
        name = fn.__name__.replace('scenario_', '')
        SCENARIOS[name] = fn
        SPECS[name] = watches
        CHECKS[name] = check
        return fn
    return deco


def verdict(ok, text, n=None):
    ok = bool(ok)
    RESULTS.append(ok)
    print('  %s  %s%s' % ('PASS' if ok else 'FAIL', text, '' if n is None else '  (%d hits)' % n))


def table(w, limit=14):
    """Print the distinct value tuples of a watch with their counts."""
    cnt = collections.Counter(r[2] for r in w.rows)
    print('  watch %s  [%s]  %d hits' % (w.label, ', '.join(w.names()), len(w.rows)))
    for vals, n in sorted(cnt.items(), key=lambda kv: -kv[1])[:limit]:
        print('      %6d x %s' % (n, vals))
    if len(cnt) > limit:
        print('      ... %d more distinct tuples' % (len(cnt) - limit))


def W(cov, label):
    return next(w for w in cov.watches if w.label == label)


def rows(cov, label):
    return W(cov, label).rows


# --------------------------------------------------------------------------- helpers

def to_level_with_ball(g):
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(200)


def column_of(x):
    return (x & 0xF0) >> 4


def plant_column(g, col, hps, first_row=3, step=3):
    """Put bricks with the given hit points into column `col`, `step` rows apart, and clear the rest of the
    column. (Poke: the real level has other bricks there.)"""
    base = g.syms['wBrickMap']
    for r in range(1, 17):
        g.sync_poke(base + 16 * r + col, 0)
    for i, hp in enumerate(hps):
        g.sync_poke(base + 16 * (first_row + step * i) + col, hp)
    g.sync_poke('wBricksLeft', 200)


def bat_shot_columns(g):
    """The columns of the two plasma shots (x = bat - 4 and bat + 12, plus 4 for the brick lookup)."""
    bx = g.bat_x()
    return column_of(bx - 4 + 4), column_of(bx + 12 + 4)


def flight_steps(rows_, y_i=0, age_i=1, kind_i=None):
    """From consecutive records of the 'moving up' label of one slot: {kind: set of y steps per frame}.
    A record is (y before the move, age, kind); two records one frame apart with ages one apart belong together."""
    steps = collections.defaultdict(collections.Counter)
    for (s1, f1, v1), (s2, f2, v2) in zip(rows_, rows_[1:]):
        if f2 == f1 + 1 and v2[age_i] == v1[age_i] + 1:
            steps[v1[kind_i] if kind_i is not None else 0][v1[y_i] - v2[y_i]] += 1
    return steps


# --------------------------------------------------------------------------- plasma_bricks

def check_plasma_bricks(cov):
    entry = rows(cov, 'HitBrickWithShot')
    plasma = rows(cov, 'HitBrickWithShot.checkPlasma')
    store = rows(cov, 'HitBrickWithBall.storeHitPtr')
    table(W(cov, 'HitBrickWithShot'))
    table(W(cov, 'HitBrickWithShot.checkPlasma'))
    table(W(cov, 'HitBrickWithBall.storeHitPtr'))
    # pair every call with the .checkPlasma and .storeHitPtr records that follow it
    pairs = []
    for i, (seq, frame, vals) in enumerate(entry):
        nxt = entry[i + 1][0] if i + 1 < len(entry) else 1 << 60
        p = [r for r in plasma if seq < r[0] < nxt]
        s = [r for r in store if seq < r[0] < nxt]
        if p:
            pairs.append((vals, p[0][2], s[0][2] if s else None))
    p2 = [(e, p, s) for e, p, s in pairs if p[1] == 2]
    p0 = [(e, p, s) for e, p, s in pairs if p[1] == 0]
    verdict(len(p2) > 0, 'HitBrickWithShot ran with wPlasmaState 2', len(p2))
    verdict(len(p0) > 0, 'HitBrickWithShot ran with wPlasmaState 0 (rocket)', len(p0))
    # entry: (@A, @HL); checkPlasma: (wHitNewValue, wPlasmaState)
    verdict(all(p[0] == (1 if (e[0] & 15) >= 2 else 0) for e, p, s in p2),
            'plasma: wHitNewValue is 1 for a brick with 2 or more hit points and 0 for a brick with 1', len(p2))
    verdict(all(p[0] == (e[0] & 15) - 1 for e, p, s in p0), 'rocket: wHitNewValue is the hit points minus 1', len(p0))
    hp_seen = sorted({e[0] & 15 for e, p, s in p2})
    print('  plasma hit points seen: %s' % hp_seen)
    verdict({1, 2, 3, 4} <= set(hp_seen), 'plasma hit bricks of 1, 2, 3 and 4 hit points', len(p2))
    # storeHitPtr: (wHitEffectX, wPlasmaShotX)
    sp2 = [s for e, p, s in p2 if s]
    sp0 = [s for e, p, s in p0 if s]
    verdict(sp2 and all(s[0] == s[1] and s[0] != 0 for s in sp2), 'plasma: wHitEffectX = wPlasmaShotX (not 0)', len(sp2))
    verdict(sp0 and all(s[0] == 0 for s in sp0), 'rocket: wHitEffectX = 0', len(sp0))
    t = rows(cov, 'UpdateShot0.removeShot')
    table(W(cov, 'UpdateShot0.removeShot'))
    verdict(len(t) > 0, 'UpdateShot0.removeShot ran', len(t))
    up = rows(cov, 'UpdateShot0.moveShotUp')
    st = flight_steps(up, 0, 1, 2)
    print('  y step per frame by wPlasmaState: %s' % {k: dict(v) for k, v in st.items()})
    verdict(st.get(2) and set(st[2]) == {1}, 'plasma shot (wPlasmaState 2) moves up 1 pixel per frame', sum(st.get(2, {}).values()))
    verdict(st.get(0) and set(st[0]) == {1}, 'rocket (wPlasmaState 0) moves up 1 pixel per frame', sum(st.get(0, {}).values()))
    verdict(all(r[2][1] >= 5 for r in up), 'moveShotUp only from age 5 on (ages 1 to 4 draw the flash at the bat)', len(up))


@scenario(['HitBrickWithShot:@A,@HL', 'HitBrickWithShot.checkPlasma:wHitNewValue,wPlasmaState',
           'HitBrickWithBall.storeHitPtr:wHitEffectX,wPlasmaShotX',
           'UpdateShot0.removeShot:wPlasmaState,wShotActive:6',
           'UpdateShot0.moveShotUp:wShots+1,wShotActive,wPlasmaState'], check_plasma_bricks)
def scenario_plasma_bricks(g):
    """Plasma shots (and rockets for contrast) flying up a column of bricks of 1 to 4 hit points."""
    to_level_with_ball(g)
    for hps in ((3, 2, 1, 4), (4, 3, 2, 1), (1, 2, 3, 4)):
        cv.catch_powerup(g, 3)                                  # plasma bat
        c0, c1 = bat_shot_columns(g)
        plant_column(g, c0, hps)                                # poke: bricks above the left shot
        plant_column(g, c1, hps)                                # and above the right shot
        g.play(200, tap=30, steer='', launch=False)             # A pressed: the plasma shot goes up
        g.log('plasma round: state %d' % g.peek('wPlasmaState'))
    cv.catch_powerup(g, 1)                                      # rocket bat
    c0, c1 = bat_shot_columns(g)
    plant_column(g, column_of(g.bat_x() + 8), (4, 3, 2, 1))
    g.play(500, tap=16, steer='', launch=False)


# --------------------------------------------------------------------------- interplay

INTERPLAY_LOG = []
INTERPLAY_FIRED = [0]


def state_row(g):
    names = ('wWeaponFlag', 'wRocketLaserBat', 'wLaserBat', 'wPlasmaState', 'wGrenadeCount', 'wShotReloadDelay',
             'wBatWidth', 'wBatX', 'wStunActive', 'wReverseActive', 'wBallSticks')
    return {n: g.peek(n) for n in names}


def check_interplay(cov):
    for tag, before, after in INTERPLAY_LOG:
        print('  %-24s %s' % (tag, list(after.values())))
    print('  columns: %s' % list(INTERPLAY_LOG[0][2].keys()))
    by = {t: (b, a) for t, b, a in INTERPLAY_LOG}

    def ok(tag, cond, text):
        verdict(cond(by[tag][0], by[tag][1]), '%s: %s' % (tag, text))

    ok('rocket', lambda b, a: a['wWeaponFlag'] == 1 and a['wRocketLaserBat'] == 1 and a['wLaserBat'] == 0
       and a['wShotReloadDelay'] == 30 and a['wGrenadeCount'] == 0, 'flag 1, rocket bat, reload 30, no grenades')
    ok('laser', lambda b, a: a['wLaserBat'] == 1 and a['wShotReloadDelay'] == 8 and a['wRocketLaserBat'] == 1,
       'laser bat, reload 8')
    ok('grenade after laser', lambda b, a: a['wGrenadeCount'] == 4 and a['wRocketLaserBat'] == 0 and a['wLaserBat'] == 0
       and a['wWeaponFlag'] == 1, 'laser and rocket state cleared, 4 grenades')
    ok('second grenade', lambda b, a: a['wGrenadeCount'] == 8, 'the grenades add up to 8')
    ok('laser after grenades', lambda b, a: a['wGrenadeCount'] == 0 and a['wLaserBat'] == 1, 'grenades cleared')
    ok('plasma', lambda b, a: a['wPlasmaState'] == 1 and a['wRocketLaserBat'] == 0 and a['wLaserBat'] == 0
       and a['wGrenadeCount'] == 0 and a['wWeaponFlag'] == 1, 'plasma bat clears the other weapons')
    ok('rocket after plasma', lambda b, a: b['wPlasmaState'] == 1 and a['wPlasmaState'] == 0 and a['wRocketLaserBat'] == 1,
       'plasma bat ended by Powerup_WeaponCommon')
    ok('grenade after plasma', lambda b, a: b['wPlasmaState'] == 1 and a['wPlasmaState'] == 0, 'plasma bat ended too')
    ok('milk with rocket', lambda b, a: b['wWeaponFlag'] == 1 and a['wWeaponFlag'] == 0 and a['wBatWidth'] == 0x28
       and a['wRocketLaserBat'] == 1, 'weapon flag cleared, wide bat, rocket bat flag left set')
    ok('rocket with wide bat', lambda b, a: b['wBatWidth'] == 0x28 and a['wBatWidth'] == 0x20 and a['wWeaponFlag'] == 1,
       'wide bat shrinks to $20')
    ent = rows(cov, 'Powerup_WeaponCommon.clearBatEffects')
    end = rows(cov, 'PowerupCollected')
    table(W(cov, 'Powerup_WeaponCommon.clearBatEffects'))
    wide = []
    for seq, frame, v in ent:
        if v[0] == 0x28:
            nxt = [r for r in end if r[0] > seq]
            wide.append((v, nxt[0][2] if nxt else None))
    verdict(wide and all(n and n[0] == 0x20 and n[1] == v[1] + 4 for v, n in wide),
            'Powerup_WeaponCommon with a wide bat: wBatWidth $28 -> $20 and wBatX + 4', len(wide))
    ok('poison with rocket', lambda b, a: a['wWeaponFlag'] == 0 and a['wStunActive'] == 3 and a['wRocketLaserBat'] == 1,
       'weapon flag cleared, stun on')
    ok('rocket after poison', lambda b, a: b['wStunActive'] != 0 and a['wStunActive'] == 0 and a['wWeaponFlag'] == 1,
       'stun cleared by the weapon')
    ok('reverse with rocket', lambda b, a: a['wWeaponFlag'] == 0 and a['wReverseActive'] == 0x50, 'flag cleared, reverse on')
    ok('rocket after reverse', lambda b, a: b['wReverseActive'] != 0 and a['wReverseActive'] == 0 and a['wWeaponFlag'] == 1,
       'reverse cleared by the weapon')
    ok('magnet with rocket', lambda b, a: a['wWeaponFlag'] == 0 and a['wBallSticks'] == 1, 'flag cleared, ball sticks')
    ok('rocket after magnet', lambda b, a: a['wBallSticks'] == 0 and a['wWeaponFlag'] == 1, 'sticky cleared by the weapon')
    ok('poison with plasma', lambda b, a: b['wPlasmaState'] == 1 and a['wWeaponFlag'] == 0 and a['wPlasmaState'] == 1,
       'weapon flag cleared but wPlasmaState stays 1')
    ok('milk after poison', lambda b, a: b['wStunActive'] == 3 and a['wStunActive'] == 0 and a['wBatWidth'] == 0x28, 'stun cleared')
    ok('milk after reverse', lambda b, a: b['wReverseActive'] != 0 and a['wReverseActive'] == 0, 'reverse cleared')
    ok('milk after magnet', lambda b, a: b['wBallSticks'] == 1 and a['wBallSticks'] == 0, 'sticky cleared')
    for name in ('poison', 'reverse', 'magnet'):
        ok('wide bat then ' + name, lambda b, a: b['wBatWidth'] == 0x28 and a['wBatWidth'] == 0x20 and a['wBatX'] == b['wBatX'] + 4,
           'the wide bat shrinks to $20 and wBatX + 4')
    verdict(INTERPLAY_FIRED[0] == 0, 'with wWeaponFlag 0 and a plasma bat A fired no shot (shots seen: %d)' % INTERPLAY_FIRED[0])


@scenario(['Powerup_WeaponCommon.clearBatEffects:wBatWidth,wBatX', 'PowerupCollected:wBatWidth,wBatX'], check_interplay)
def scenario_interplay(g):
    """Weapon power-ups on top of each other and with Poison, Reverse, Magnet and Milk."""
    INTERPLAY_LOG.clear()
    INTERPLAY_FIRED[0] = 0
    to_level_with_ball(g)

    def take(tag, ptype):
        # the bot does not press A (it would throw grenades and fire shots), so a pick-up never meets a shot in flight
        cv.recover(g)
        handler = 'Powerup_' + cv.POWERUPS[ptype]
        n = g.count(handler)
        before = state_row(g)
        ok = False
        for _ in range(3):
            if g.state != 2:
                break
            cv.park_ball(g)                                          # poke: the ball rests on the bat (A is never pressed)
            g.sync_poke('wFallingPowerups', *([0] * 96))             # poke: no other power-up is falling
            g.play(10, launch=False, steer='')
            g.drop_powerup(ptype)
            g.play(200, launch=False, steer='', until=lambda: g.count(handler) > n or g.state != 2)
            ok = g.count(handler) > n
            if ok:
                break
        g.play(5, launch=False, steer='')
        INTERPLAY_LOG.append((tag, before, state_row(g)))
        g.log('%s caught %s' % (tag, ok))
    take('rocket', 1)
    take('laser', 11)
    take('grenade after laser', 15)
    take('second grenade', 15)
    take('laser after grenades', 11)
    take('plasma', 3)
    take('rocket after plasma', 1)
    take('plasma', 3)
    take('grenade after plasma', 15)
    take('rocket', 1)
    take('milk with rocket', 5)
    take('rocket with wide bat', 1)
    take('poison with rocket', 4)
    take('rocket after poison', 1)
    take('reverse with rocket', 12)
    take('rocket after reverse', 1)
    take('magnet with rocket', 8)
    take('rocket after magnet', 1)
    take('plasma', 3)
    take('poison with plasma', 4)
    for name, ptype in (('poison', 4), ('reverse', 12), ('magnet', 8)):
        take('milk before ' + name, 5)
        take('wide bat then ' + name, ptype)
    for name, ptype in (('poison', 4), ('reverse', 12), ('magnet', 8)):
        take(name + ' before milk', ptype)
        take('milk after ' + name, 5)
    # A pressed with the weapon flag 0: nothing may be fired
    g.sync_poke('wShotActive', 0, 0, 0, 0, 0, 0)
    seen = 0
    for _ in range(24):
        g.play(5, tap=10, launch=False)
        seen += sum(g.peek('wShotActive+%d' % i) != 0 for i in range(6))
    INTERPLAY_FIRED[0] = seen


# --------------------------------------------------------------------------- grenade_charge

BAT_MOVE = {}


def check_grenade_charge(cov):
    ds = W(cov, 'Shots_HandleFire.directionSet')
    sp = W(cov, 'SpawnProjectile')
    table(ds)
    table(sp, limit=16)
    # directionSet: (hJoypad, @L)
    bad = [r for r in ds.rows if not ((r[2][1] == 0x1E and r[2][0] & 1 and not r[2][0] & 2)
                                      or (r[2][1] == 0x02 and r[2][0] & 2)
                                      or (r[2][1] == 0 and not r[2][0] & 3))]
    verdict(not bad and ds.rows, 'direction L is $1e with right held, $02 with left held, 0 with neither (left wins)', len(ds.rows))
    both = [r for r in ds.rows if r[2][0] & 3 == 3]
    verdict(both and all(r[2][1] == 2 for r in both), 'left and right held together: direction $02 (left wins)', len(both))
    dirs = {r[2][1] for r in ds.rows}
    verdict(dirs == {0, 2, 0x1E}, 'all three directions thrown: %s' % sorted(dirs))
    # SpawnProjectile from a grenade: (@A, @H); first words of GrenadeThrowTable
    gr = [r for r in sp.rows if r[2][1] == 0x80]
    firsts = sorted({r[2][0] for r in gr})
    want = [0x21, 0x28, 0x30, 0x38, 0x40, 0x48, 0x50, 0x58, 0x60, 0x68, 0x70]
    print('  grenade flight times seen: %s' % [hex(a) for a in firsts])
    verdict(firsts == want, 'all 11 entries of GrenadeThrowTable were used', len(gr))
    hf = rows(cov, 'Shots_HandleFire')
    table(W(cov, 'Shots_HandleFire'), limit=12)
    top = max(r[2][1] for r in hf)
    verdict(top == 10, 'the high byte of wGrenadePower reaches 10 at most (max %d)' % top, len(hf))
    # the flights: group UpdateProjectile records by projectile (the timer falls inside one flight)
    up = rows(cov, 'UpdateProjectile')
    flights = []
    last = None
    for seq, frame, v in up:
        w = v[0]
        if w[8] & 0x80 == 0:
            continue
        if last is None or w[0] > last or w[2] is None:
            flights.append([w])
        else:
            flights[-1].append(w)
        last = w[0]
    by_dir = collections.defaultdict(list)
    for f in flights:
        k = min(len(f) - 1, 10)
        by_dir[f[0][7]].append(f[k][2] - f[0][2])      # the first 10 frames, before any wall bounce
    for d, dx in sorted(by_dir.items()):
        print('  grenade direction %d: x change over the first 10 frames %s' % (d, dx))
    verdict(by_dir.get(2) and all(d > 0 for d in by_dir[2]),
            'left held (hJoypad bit 1, direction $02): the grenade flies to the RIGHT (x grows)', len(by_dir.get(2, [])))
    verdict(by_dir.get(0x1E) and all(d < 0 for d in by_dir[0x1E]),
            'right held (hJoypad bit 0, direction $1e): the grenade flies to the LEFT (x falls)', len(by_dir.get(0x1E, [])))
    print('  bat movement with the button held for 12 frames: %s' % BAT_MOVE)
    verdict(all(d <= 0 for d in BAT_MOVE['left']) and min(BAT_MOVE['left']) < 0 and all(d >= 0 for d in BAT_MOVE['right']) and max(BAT_MOVE['right']) > 0,
            'the same buttons move the bat the right way (left held: wBatX falls, right held: wBatX grows)')
    verdict(by_dir.get(0) and all(abs(d) <= 1 for d in by_dir[0]), 'direction 0 flies straight up (x about unchanged)', len(by_dir.get(0, [])))


@scenario(['Shots_HandleFire:wWeaponFlag,wGrenadePower+1', 'Shots_HandleFire.directionSet:hJoypad,@L',
           'SpawnProjectile:@A,@H', 'UpdateProjectile:wProjectileWork:9'], check_grenade_charge)
def scenario_grenade_charge(g):
    """Grenades of every throw power, thrown left, right and straight."""
    BAT_MOVE.clear()
    to_level_with_ball(g)
    cv.catch_powerup(g, 15)
    charges = list(range(5, 105, 5)) + [150, 33, 34, 36, 73, 75, 77]
    dirs = ['', 'left', 'right', 'both']
    for n, frames in enumerate(charges):
        g.play(300, launch=False, until=lambda: g.peek('wGrenadeDelay') == 0 or g.state != 2)
        if g.state != 2:
            break
        if g.peek('wGrenadeCount') == 0 or not g.peek('wWeaponFlag'):
            g.poke('wGrenadeCount', 4)                         # poke: more grenades after a lost life
            g.poke('wWeaponFlag', 1)
            g.poke('wLives', 9)
        d = dirs[n % 4]
        g.pb.button_press('a')                                 # A held for exactly `frames` frames
        g.run(frames)
        g.pb.button_release('a')
        held = ['left', 'right'] if d == 'both' else ([d] if d else [])
        for b in held:
            g.pb.button_press(b)                               # the direction is held when A is released
        g.run(4)
        for b in held:
            g.pb.button_release(b)
    g.play(300, launch=False, until=lambda: g.peek('wGrenadeDelay') == 0 or g.state != 2)
    for d in ('left', 'right', 'left', 'right'):               # which way do the buttons move the bat
        g.run(40)
        x0 = g.bat_x()
        g.hold([d], 12)
        BAT_MOVE.setdefault(d, []).append(g.bat_x() - x0)


# --------------------------------------------------------------------------- shot_cooldown

def mash(g, frames):
    """Press and release A every frame: a shot leaves as soon as the cooldown is over (every 31 or 32 frames)."""
    for _ in range(frames // 2):
        g.pb.button_press('a')
        g.run(1)
        g.pb.button_release('a')
        g.run(1)


def check_shot_cooldown(cov):
    ent = rows(cov, 'Shots_FireRocketOrLaser')
    fire0 = rows(cov, 'Shots_FireRocketOrLaser.fireSlot0')
    table(W(cov, 'Shots_FireRocketOrLaser'), limit=10)
    # (wShotCooldown, wShotActive:6, wLaserBat)
    stale = [r for r in ent if r[2][0] > 0 and r[2][1] == (0,) * 6]
    verdict(not stale, 'never a cooldown above 0 with all six shots ended (the last shot to end clears wShotCooldown)', len(ent))
    after = {}
    for seq, frame, vals in ent:
        after.setdefault(frame, vals)
    quick = [f for seq, f, v in fire0 if after.get(f + 1) and after[f + 1][1] == (0,) * 6]
    verdict(len(quick) > 0, 'shot hit the brick next to the bat in the frame after firing: cooldown 0 at the next frame, not 29',
            len(quick))
    for f in quick[:3]:
        print('      fired at frame %d, next frame: %s' % (f, after[f + 1]))
    t3 = rows(cov, 'Shots_FireRocketOrLaser.tryLaserSlot3')
    table(W(cov, 'Shots_FireRocketOrLaser.tryLaserSlot3'))
    rocket = [r for r in t3 if r[2][1] == 0]
    verdict(len(rocket) > 0 and all(all(r[2][0][i] for i in range(3)) for r in rocket),
            'tryLaserSlot3 with a Rocket bat only with slots 0, 1 and 2 all in flight (it then returns)', len(rocket))
    laser = [r for r in t3 if r[2][1] == 1]
    verdict(len(laser) > 0, 'tryLaserSlot3 with a Laser bat', len(laser))
    print('  moveShotUp records by wShots+3: %s' % dict(collections.Counter(r[2][2] for r in rows(cov, 'UpdateShot0.moveShotUp'))))
    up = rows(cov, 'UpdateShot0.moveShotUp')
    st = flight_steps(up, 0, 1, 2)
    print('  y step per frame by laser flag (wShots+3): %s' % {k: dict(v) for k, v in st.items()})
    verdict(st.get(0) and set(st[0]) == {1} and st.get(1) and set(st[1]) == {2},
            'slot 0 moves up 1 pixel per frame for a rocket and 2 for a laser', sum(sum(v.values()) for v in st.values()))
    rm = rows(cov, 'UpdateShot0.removeShot')
    print('  y of slot 0 when removeShot ran: %s' % sorted(collections.Counter(r[2][0] for r in rm).items()))
    verdict(any(r[2][0] == 0x18 for r in rm) and any(r[2][0] != 0x18 for r in rm),
            'slot 0 ends at the top of the field (y = $18) or earlier on a brick', len(rm))
    # wFireLatch: set to the reload delay when a shot leaves; cleared only with A up and the cooldown over
    co = W(cov, 'Shots_FireRocketOrLaser.cooldownOver')
    table(co, limit=8)
    # (wShotCooldown, wFireLatch, hJoypad, wShotReloadDelay): at this label the cooldown is 0
    verdict(all(r[2][0] == 0 for r in co.rows), 'cooldownOver is only reached with wShotCooldown 0', len(co.rows))
    verdict(all(r[2][1] in (0, 30, 8) for r in co.rows), 'wFireLatch is 0 or a reload delay (30 or 8), never 1', len(co.rows))
    nxt = {}
    for seq, frame, v in co.rows:
        nxt[frame] = v
    cleared = [(v, nxt[f + 1]) for seq, f, v in co.rows if f + 1 in nxt and v[1] != 0 and nxt[f + 1][1] == 0]
    verdict(cleared and all(not v[2] & 0x10 or not n[2] & 0x10 for v, n in cleared),
            'the latch goes from nonzero to 0 only after a frame with A not held', len(cleared))


@scenario(['Shots_FireRocketOrLaser:wShotCooldown,wShotActive:6,wLaserBat',
           'Shots_FireRocketOrLaser.fireSlot0:wShotCooldown',
           'Shots_FireRocketOrLaser.tryLaserSlot3:wShotActive:6,wLaserBat',
           'UpdateShot0.moveShotUp:wShots+1,wShotActive,wShots+3',
           'UpdateShot0.removeShot:wShots+1,wShotActive',
           'Shots_FireRocketOrLaser.cooldownOver:wShotCooldown,wFireLatch,hJoypad,wShotReloadDelay'], check_shot_cooldown)
def scenario_shot_cooldown(g):
    """Rocket shots into a brick right next to the bat, and a rocket bat with three shots in flight."""
    to_level_with_ball(g)
    cv.catch_powerup(g, 1)
    base = g.syms['wBrickMap']
    col = column_of(g.bat_x() + 4 + 4)
    cell = base + 16 * 14 + col
    for hp in (4, 4, 4):
        g.sync_poke(cell, hp)                                    # poke: a brick in the row of the bat
        g.sync_poke('wBricksLeft', 200)
        g.play(120, tap=6, steer='', launch=False, until=lambda: g.mem[cell] == 0)
    g.sync_poke(cell, 0)
    for r in range(1, 17):                                       # poke: an empty field, so that no shot ends early
        g.sync_poke(base + 16 * r + 1, *([0] * 9))
    g.sync_poke('wBricksLeft', 200)
    for _ in range(4):                                           # three rockets in flight, a fourth press
        if not g.peek('wWeaponFlag'):                            # a lost ball takes the weapon: take it again
            cv.catch_powerup(g, 1)
        cv.park_ball(g)
        mash(g, 110)
    g.sync_poke('wShotActive', 0, 0, 0, 0, 0, 0)                 # poke: no rocket left in flight, so slot 0 fires a laser
    for _ in range(3):
        cv.catch_powerup(g, 11)
        cv.park_ball(g)
        mash(g, 110)


# --------------------------------------------------------------------------- ufo_shots

def check_ufo_shots(cov):
    for slot in range(6):
        table(W(cov, 'UpdateUfo.shot%dHitUfo' % slot), limit=6)
    # rows: (wShotActive:6, wPlasmaState, wShotCooldown, wUfoFlying)
    for slot in range(6):
        r = rows(cov, 'UpdateUfo.shot%dHitUfo' % slot)
        plain = [x for x in r if x[2][1] == 0 and x[2][2] == 0]
        verdict(plain and all(x[2][0][slot] == 0 and x[2][3] == 0 for x in plain),
                'slot %d hit the UFO: its wShotActive byte is cleared and wUfoFlying is 0 (plain shot)' % slot, len(plain))
    pl = [x for s in range(2) for x in rows(cov, 'UpdateUfo.shot%dHitUfo' % s) if x[2][1] != 0]
    verdict(pl and all(x[2][0][0] or x[2][0][1] for x in pl) and all(x[2][3] == 0 for x in pl),
            'plasma state set: the shot slot byte is left alone, wUfoFlying 0', len(pl))
    busy = [(s, x) for s in range(6) for x in rows(cov, 'UpdateUfo.shot%dHitUfo' % s)
            if x[2][1] == 0 and x[2][2] != 0]
    verdict(busy and all(x[2][0][s] == 0 and any(x[2][0]) and x[2][2] == 20 for s, x in busy),
            'another shot still in flight: the hit slot is cleared and wShotCooldown (20) is not reset', len(busy))
    for s in range(1, 6):
        n = len(rows(cov, 'UpdateUfo.checkShot%d' % s))
        verdict(n > 0, 'UpdateUfo.checkShot%d ran' % s, n)


@scenario(['UpdateUfo.shot%dHitUfo:wShotActive:6,wPlasmaState,wShotCooldown,wUfoFlying' % s for s in range(6)]
          + ['UpdateUfo.checkShot%d:wShotActive:6' % s for s in range(1, 6)], check_ufo_shots)
def scenario_ufo_shots(g):
    """On a UFO level: a shot from each slot hits the UFO plainly, with plasma active and with another shot in flight."""
    ufo_levels = cv.levels_of_type(1)
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    cv.goto_level(g, ufo_levels[0])
    g.play(100)
    cv.park_ball(g)
    for rep in range(3):
        for slot in range(6):
            g.poke('wUfoHits', 0)
            g.poke('wShotCooldown', 0)
            if rep == 1:
                g.poke('wPlasmaState', 2)                            # poke: plasma state with a plain shot
            elif rep == 2:
                other = 5 if slot != 5 else 3
                g.poke('wShotCooldown', 20)
                g.sync_poke('wShots+%d' % (18 if other == 5 else 12), 200, 0x60)   # a shot at x 200, over a wall column
                g.sync_poke('wShotActive+%d' % other, 9)
            cv.shot_hits_ufo(g, slot)
            g.poke('wPlasmaState', 0)
            g.poke('wUfoHits', 0)
            g.sync_poke('wShotActive', 0, 0, 0, 0, 0, 0)
            g.play(20, launch=False)


# --------------------------------------------------------------------------- blast_on_wall

BLAST_LOG = []
BLAST_RESULT = {}


def check_blast_on_wall(cov):
    table(W(cov, 'Projectile_HitBrick'), limit=10)
    for line in BLAST_LOG:
        print('  ' + line)
    verdict(BLAST_RESULT.get('hit_called', 0) > 0, 'Projectile_HitBrick was called for blast corners on wall cells ($0f)',
            BLAST_RESULT.get('hit_called', 0))
    ch = BLAST_RESULT.get('changed')
    print('  changed cells (row, before, after): %s' % ch)
    verdict(ch and all(b == 0x0F and a == 0x0E for r, b, a in ch),
            'the blast turned the wall cell under its corners from $0f into $0e (an unbreakable brick), it was not skipped', len(ch or []))


@scenario(['Projectile_HitBrick:@A,@C', 'HitBrickWithBall:@A'], check_blast_on_wall)
def scenario_blast_on_wall(g):
    """A grenade slot is poked to land with its four blast corners on wall cells (column 0).

    The flight timer is 1 so the slot lands on the next update. Poke: in play a grenade bounces off walls
    while it flies, so this only tests what the blast does with a wall cell ($0f)."""
    BLAST_LOG.clear()
    BLAST_RESULT.clear()
    to_level_with_ball(g)
    base = g.syms['wBrickMap']
    before = [g.mem[base + 16 * r] for r in range(1, 17)]
    h0 = g.count('Projectile_HitBrick')
    g.sync_poke('wBricksLeft', 200)
    # slot: timer, xsub, x, ysub, y, direction, flag (grenade), path lo, path hi
    g.sync_poke('wProjectiles', 1, 0, 4, 0, 0x50, 0, 0x80, 0x00, 0x4E)
    g.run(120)
    after = [g.mem[base + 16 * r] for r in range(1, 17)]
    BLAST_RESULT['hit_called'] = g.count('Projectile_HitBrick') - h0
    BLAST_LOG.append('column 0 of the brick map, rows 1 to 16, before: %s' % before)
    BLAST_LOG.append('column 0 of the brick map, rows 1 to 16, after:  %s' % after)
    BLAST_RESULT['changed'] = [(r + 1, b, a) for r, (b, a) in enumerate(zip(before, after)) if b != a]
    BLAST_LOG.append('wGrenadeBlastTimer now %d, game state %d' % (g.peek('wGrenadeBlastTimer'), g.state))
    g.play(200)


# --------------------------------------------------------------------------- unbreakable_ring

def check_ring(cov):
    w = W(cov, 'SpawnUnbreakableHitEffect')
    table(w, limit=14)
    start = cov.syms['wUnbreakableHitEffects']
    addr = [r[2][0][0] | r[2][0][1] << 8 for r in w.rows]
    verdict(len(addr) > 12, 'more than 12 unbreakable hit effects were spawned', len(addr))
    wraps = [i for i, (a, b) in enumerate(zip(addr, addr[1:])) if b - a != 3]
    verdict(all(addr[i + 1] == start for i in wraps) and wraps,
            'the slot pointer moves 3 bytes per effect and goes back to the first slot (wrapped %d times)' % len(wraps))
    verdict(wraps and all(addr[i] == start + 27 for i in wraps), 'the wrap comes after the 10th slot (offset +27)')


@scenario(['SpawnUnbreakableHitEffect:wUnbreakableHitEffectPtr:2'], check_ring)
def scenario_unbreakable_ring(g):
    """The ball bouncing between unbreakable bricks: the ring of ten effect slots wraps."""
    to_level_with_ball(g)
    cv.plant_rows(g, 4, 9)
    g.play(1500)


# --------------------------------------------------------------------------- levels_watch

def check_levels_watch(cov):
    top = W(cov, 'SetUpBricks_Cell.unbreakableTopRow')
    drawn = W(cov, 'SetUpBricks_Cell.unbreakableDrawn')
    fw = W(cov, 'Firework_Fly.storeRocketFrame')
    table(top)
    table(drawn, limit=6)
    table(fw, limit=6)
    # (@B, @C): B = rows left (16 for the first row), C = cells left in the row (9 for the first cell)
    verdict(top.rows and all(r[2][0] == 16 for r in top.rows), 'unbreakableTopRow only with B = 16 (the top brick row)', len(top.rows))
    verdict(drawn.rows and any(r[2][0] != 16 for r in drawn.rows) and any(r[2][0] == 16 for r in drawn.rows),
            'unbreakableDrawn is reached from the top row and from other rows (it is the common end)', len(drawn.rows))
    verdict(any(r[2][0] == 0 for r in fw.rows) and any(r[2][0] != 0 for r in fw.rows) and all(0 <= r[2][1] <= 7 for r in fw.rows),
            'storeRocketFrame is reached both by the jump (wFireworkTick not 0) and by falling through (tick 0), with a frame number 0 to 7',
            len(fw.rows))


@scenario(['SetUpBricks_Cell.unbreakableTopRow:@B,@C', 'SetUpBricks_Cell.unbreakableDrawn:@B,@C',
           'Firework_Fly.storeRocketFrame:wFireworkTick,wFireworkWork+11'], check_levels_watch)
def scenario_levels_watch(g):
    """The levels scenario of coverage.py (level 96 has an unbreakable top row; level password screens have fireworks)."""
    cv.scenario_levels(g)


# --------------------------------------------------------------------------- runner

def run_one(name, rom, frame_limit):
    cov = cv.Coverage(cv.read_labels(), [])
    known = {l['name'] for l in cov.labels}
    for s in SPECS[name]:
        label = s.partition(':')[0]
        if label not in known:
            raise SystemExit('%s: %s is not a hookable code label' % (name, label))
    cov.watches = [CheckWatch(s, cov.syms) for s in SPECS[name]]
    g = cv.Game(cov, rom, frame_limit)
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
    ap.add_argument('--frames', type=int, default=400000)
    ap.add_argument('--list', action='store_true')
    ap.add_argument('--verbose', action='store_true')
    args = ap.parse_args()
    cv.VERBOSE = args.verbose
    if args.list or not args.scenario:
        for n, fn in SCENARIOS.items():
            print('%-18s %s' % (n, (fn.__doc__ or '').strip().split('\n')[0]))
        return
    names = []
    for s in args.scenario:
        names.extend(SCENARIOS if s == 'all' else [s])
    for n in names:
        if n not in SCENARIOS:
            raise SystemExit('unknown scenario %s (try --list)' % n)
    for n in names:
        run_one(n, args.rom, args.frames)
    print('%d checks, %d passed, %d failed' % (len(RESULTS), sum(RESULTS), len(RESULTS) - sum(RESULTS)))
    sys.exit(0 if all(RESULTS) else 1)


if __name__ == '__main__':
    main()

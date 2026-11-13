"""Third play-test pass, part 1: shot slots 1 to 5, the grenade blast on a wall, ClearUnbreakableHitEffects,
the plasma refusal and wBlobThrowCount at a landing.

Uses the harness in tools/coverage.py (not changed). Run from the repository root after `make`, one emulator
at a time:

    python tools/playtest_extra1.py --list
    python tools/playtest_extra1.py --scenario shot_slots
    python tools/playtest_extra1.py --scenario all

Hooks go on labels, or on an address inside a routine ("Label+N instructions") for code that has no label
of its own. Every scenario prints CLAIM lines (PASS or FAIL) with what was seen. Scenarios take 10 to 60 s
and are deterministic. What is played and what is poked is said in each scenario's docstring.

    shot_slots        Poked: shots placed in slots 1 to 5 (a player cannot choose a slot), an empty brick field.
    blast_on_wall     Real input: grenades thrown with the bat at the left wall; then the poked landing.
    clear_unbreakable Poked: the effect slots are filled with long-lived entries before the clear is reached.
    plasma_busy       Real input for slot 0 busy (rocket in flight, then plasma picked up); poke for slot 1 only.
    blob_throw_count  Real catches and throws by the blob (the ball is placed in the blob as coverage.py does).
"""
import argparse
import collections
import os
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import coverage as cv  # noqa: E402
from sm83 import op  # noqa: E402

ROOT = cv.ROOT
CLAIMS = []


def claim(text, ok, detail=''):
    CLAIMS.append(bool(ok))
    print('CLAIM %s %s%s' % ('PASS' if ok else 'FAIL', text, ('  (' + detail + ')') if detail else ''), flush=True)


def reg(rf, name):
    if hasattr(rf, name):
        return getattr(rf, name)
    pair = {'B': 'BC', 'C': 'BC', 'D': 'DE', 'E': 'DE', 'H': 'HL', 'L': 'HL'}[name]
    v = getattr(rf, pair)
    return v >> 8 if name in 'BDH' else v & 0xFF


class CheckWatch(cv.Watch):
    """A watch that also reads registers (@A, @HL, ...) and keeps every record in order."""

    def __init__(self, spec, syms):
        label, _, rest = spec.partition(':')
        items = [i.strip() for i in rest.split(',') if i.strip()]
        self.regs = [i[1:] for i in items if i.startswith('@')]
        super().__init__(label + ':' + ','.join(i for i in items if not i.startswith('@')), syms)
        self.game = None
        self.rows = []                      # (frame, tuple: variables first, then registers)

    def record(self, memory, frame):
        super().record(memory, frame)
        values = []
        for name, addr, size in self.vars:
            values.append(memory[addr] if size == 1 else tuple(memory[addr + i] for i in range(size)))
        rf = self.game.pb.register_file
        for r in self.regs:
            values.append(reg(rf, r))
        self.rows.append((frame, tuple(values)))


def insn_addr(label, n, symtab, rom):
    """Address of the n-th instruction (0 = the label itself) after a label, read from the ROM bytes."""
    bank, addr = symtab[label]
    for _ in range(n):
        offset = addr if bank == 0 else bank * 0x4000 + addr - 0x4000
        addr += op(rom, offset)[0]
    return bank, addr


def rows(cov, label):
    return next(w for w in cov.watches if w.label == label).rows


# --------------------------------------------------------------------------- helpers

def to_level_with_ball(g):
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(200)


def empty_field(g):
    """Poke: no bricks in the playing field (columns 1 to 9), so nothing stops a shot."""
    base = g.syms['wBrickMap']
    for r in range(1, 17):
        g.sync_poke(base + 16 * r + 1, *([0] * 9))
    g.sync_poke('wBricksLeft', 200)


# --------------------------------------------------------------------------- 6. UpdateShot1 to 5

SLOT_OFFSET = {0: 0, 1: 4, 2: 8, 3: 12, 4: 15, 5: 18}    # start of each slot in wShots (x, y, y when fired, [laser flag])
STEPS = {}


def check_shot_slots(cov):
    for slot in range(1, 6):
        for kind in ('rocket', 'laser', 'plasma'):
            if (slot, kind) not in STEPS:
                continue
            ys = STEPS[(slot, kind)]
            deltas = [a - b for a, b in zip(ys, ys[1:])]
            want = 2 if kind == 'laser' or slot >= 3 else 1
            claim('slot %d %s: y falls %d per frame' % (slot, kind, want), set(deltas) == {want} and len(deltas) >= 10,
                  'y %s' % ys[:6])
    for slot, label in ((1, 'UpdateShot1.flying'), (2, 'UpdateShot2.flying'), (3, 'UpdateShot3.flying'),
                        (4, 'UpdateShot4.flying'), (5, 'UpdateShot5.flying')):
        n = len(rows(cov, label))
        claim('%s ran for the poked slot %d' % (label, slot), n > 0, '%d hits' % n)
    # slot 0 for comparison (it is measured by the weapons pass: 1 for rocket and plasma, 2 for laser)
    for kind in ('rocket', 'laser'):
        ys = STEPS[(0, kind)]
        deltas = [a - b for a, b in zip(ys, ys[1:])]
        claim('slot 0 %s (control): y falls %d per frame' % (kind, 2 if kind == 'laser' else 1),
              set(deltas) == {2 if kind == 'laser' else 1})


def scenario_shot_slots(g):
    """Poke: a shot in flight (age 5, y $80) in one slot at a time, an empty field, the ball parked on the bat.

    Slot 3 to 5 have no laser flag (laser only); slots 0 to 2 have one at +3. The y is read after each frame.
    Plasma (wPlasmaState 2) is only handled by slots 0 and 1."""
    STEPS.clear()
    to_level_with_ball(g)
    cv.park_ball(g)
    empty_field(g)
    cases = [(0, 'rocket'), (0, 'laser')]
    for slot in range(1, 6):
        cases += [(slot, 'rocket'), (slot, 'laser')] if slot < 3 else [(slot, 'laser')]
    cases += [(1, 'plasma')]
    for slot, kind in cases:
        g.sync_poke('wShotActive', 0, 0, 0, 0, 0, 0)
        g.poke('wPlasmaState', 2 if kind == 'plasma' else 0)
        off = SLOT_OFFSET[slot]
        x = 24 + 16 * slot
        values = [x, 0x80, 0x80]
        if slot < 3:
            values.append(1 if kind == 'laser' else 0)
        g.sync_poke('wShots+%d' % off, *values)
        g.sync_poke('wShotActive+%d' % slot, 5)            # one frame later it is 6, so it flies
        ys = [0x80, g.peek('wShots+%d' % (off + 1))]
        for _ in range(12):
            g.run(1)
            ys.append(g.peek('wShots+%d' % (off + 1)))
        STEPS[(slot, kind)] = ys[1:]                        # ys[0] is the poked y; the first frame after it does not move the shot
        print('  slot %d %-6s y: %s' % (slot, kind, ys))
    g.sync_poke('wShotActive', 0, 0, 0, 0, 0, 0)
    g.poke('wPlasmaState', 0)


# --------------------------------------------------------------------------- 7. grenade blast on a wall

BLAST = {}


def check_blast_on_wall(cov):
    hits = rows(cov, 'Projectile_HitBrick')
    land = rows(cov, 'blast_start')
    cut = BLAST['poke_frame']
    real = [(fr, a, c) for fr, (a, c) in hits if fr < cut]
    print('  brick map row 8, cells 0 to 15: %s' % BLAST['row'])
    print('  Projectile_HitBrick calls: %d real, %d poked; grenade landings: %d' % (len(real), len(hits) - len(real), len(land)))
    for line in BLAST['log']:
        print('  ' + line)
    claim('real throws landed (blast started)', len(land) >= 8, '%d landings' % len(land))
    xs = sorted({c for fr, a, c in real})
    print('  real corner x values seen: %s' % xs)
    wall_cols = {i for i, v in enumerate(BLAST['row']) if v == 0x0F}
    claim('the walls are the brick map columns %s' % sorted(wall_cols), wall_cols == {0} | set(range(10, 16)) or wall_cols == {0, 10, 11, 12, 13, 14, 15} or 0 in wall_cols)
    on_wall = [(fr, a, c) for fr, a, c in real if (c >> 4) in wall_cols]
    claim('REAL play: no blast corner reached a wall cell (observation, not a proof; the flight bounces off $0f cells first)',
          len(on_wall) == 0 and len(real) >= 40,
          '%d of %d corner calls; real landings x %d to %d' % (len(on_wall), len(real), min(xs), max(xs)))
    ch = BLAST['changed']
    claim('POKED landing at x 4: the wall cell under the corner turns from $0f into $0e (not skipped)',
          ch and all(b == 0x0F and a == 0x0E for r, b, a in ch), 'changed %s' % (ch,))


def scenario_blast_on_wall(g):
    """Real input: the bat is held against the left wall, then against the right wall, and grenades are
    thrown (charge 5 to 150 frames, right button = thrown to the left, left button = thrown to the right,
    none = straight up) to see whether a real throw ever lands with a blast corner on a wall cell.
    Poked: the field is emptied (so no brick changes the flight), the grenade count is topped up, and at
    the end one grenade slot is poked to land at x 4 (the weapons pass did the same)."""
    BLAST.clear()
    BLAST['log'] = []
    to_level_with_ball(g)
    cv.catch_powerup(g, 15)
    base = g.syms['wBrickMap']
    for r in range(1, 17):                                   # poke: an empty field
        g.sync_poke(base + 16 * r + 1, *([0] * 9))
    g.sync_poke('wBricksLeft', 200)
    BLAST['row'] = [g.mem[base + 16 * 8 + c] for c in range(16)]
    charges = [(5, 'right'), (20, 'right'), (40, 'right'), (5, 'left'), (60, 'right'), (10, ''), (100, 'right'),
               (30, 'right'), (150, 'right'), (15, 'right'), (50, 'right'), (8, 'right')]
    n0 = g.count('blast_start')
    for side in ('left', 'right'):
        for frames, d in charges:
            if side == 'right':
                d = {'right': 'left', 'left': 'right', '': ''}[d]
            g.poke('wLives', 9)
            if g.state != 2:
                BLAST['log'].append('state %d, lives %d: level left' % (g.state, g.peek('wLives')))
                cv.recover(g)
                cv.catch_powerup(g, 15)
            if g.peek('wGrenadeCount') == 0 or not g.peek('wWeaponFlag'):
                g.poke('wGrenadeCount', 4)                   # poke: more grenades
                g.poke('wWeaponFlag', 1)
            g.hold([side], 90)                               # real: the bat goes to the wall
            g.pb.button_press('a')
            g.run(frames)
            g.pb.button_release('a')
            if d:
                g.pb.button_press(d)
            g.run(4)
            if d:
                g.pb.button_release(d)
            g.run(1)
            g.play(70, launch=False, steer='')
            BLAST['log'].append('bat at the %s wall, charge %d, button %-5s: bat x %d, blast x %d, blasts so far %d' % (
                side, frames, d, g.bat_x(), g.peek('wGrenadeBlastX'), g.count('blast_start') - n0))
    BLAST['poke_frame'] = g.frame
    before = [g.mem[base + 16 * r] for r in range(1, 17)]
    g.sync_poke('wBricksLeft', 200)
    g.sync_poke('wProjectiles', 1, 0, 4, 0, 0x50, 0, 0x80, 0x00, 0x4E)     # poke: lands this frame at x 4
    g.run(60)
    after = [g.mem[base + 16 * r] for r in range(1, 17)]
    BLAST['changed'] = [(r + 1, b, a) for r, (b, a) in enumerate(zip(before, after)) if b != a]
    BLAST['log'].append('poked landing at x 4: column 0 before %s after %s' % (before, after))


# --------------------------------------------------------------------------- 8. ClearUnbreakableHitEffects

CLEAR = {}


def check_clear_unbreakable(cov):
    ent = rows(cov, 'ClearUnbreakableHitEffects')
    ret = rows(cov, 'clear_ret')
    claim('ClearUnbreakableHitEffects ran (entry %d, return %d)' % (len(ent), len(ret)), len(ent) > 0 and len(ent) == len(ret))
    start = cov.syms['wUnbreakableHitEffects']
    for i, ((f1, e), (f2, r)) in enumerate(zip(ent, ret)):
        print('  call %d frame %d  slots before %s' % (i, f1, e[0]))
        print('              slots after  %s  ptr %04x end %02x' % (r[0], r[1][0] | r[1][1] << 8, r[2]))
    stale = [(e, r) for (f1, e), (f2, r) in zip(ent, ret) if any(e[0][0::3])]
    claim('the clear was reached with live effect slots (counter byte not 0) at least once', len(stale) > 0, '%d of %d calls' % (len(stale), len(ent)))
    claim('the slot bytes are the same before and after the clear (it does not clear them)',
          stale and all(e[0] == r[0] for e, r in stale), '%d calls' % len(stale))
    claim('after the clear the pointer is the first slot and the byte after the ten slots is $ff',
          all((r[1][0] | r[1][1] << 8) == start and r[2] == 0xFF for (f, e), (f2, r) in zip(ent, ret)), '%d calls' % len(ent))
    print('  real spawns before the poke: %s' % CLEAR.get('spawns'))
    claim('real hits on unbreakable bricks filled slots (ptr moved)', CLEAR.get('spawns', 0) >= 3)


def scenario_clear_unbreakable(g):
    """Real input: the ball hits planted unbreakable bricks (the slots fill). Poked: the ten slots are filled
    with long-lived entries ($f0 frames left; a real effect lasts 18 frames, shorter than a lost life) before
    a life is lost (real) and before a level is finished (real), the two places that call the clear."""
    CLEAR.clear()
    to_level_with_ball(g)
    s0 = g.count('SpawnUnbreakableHitEffect')
    cv.plant_rows(g, 4, 9)
    g.play(600)
    CLEAR['spawns'] = g.count('SpawnUnbreakableHitEffect') - s0
    base = g.syms['wBrickMap']
    for r in range(4, 10):                                  # poke: take the unbreakable rows away again
        g.sync_poke(base + 16 * r + 1, *([0] * 9))
    g.sync_poke('wBricksLeft', 200)
    slots = []
    for i in range(10):
        slots += [0xF0 + i, 40 + 8 * i, 60 + 8 * i]
    g.sync_poke('wUnbreakableHitEffects', *slots)            # poke
    cv.lose_lives(g, 1)                                     # real: the ball is missed, the clear runs when the life is lost
    # second place: the level start
    slots = []
    for i in range(10):
        slots += [0xF0 + i, 40 + 8 * i, 60 + 8 * i]
    g.sync_poke('wUnbreakableHitEffects', *slots)            # poke
    cv.finish_to_next(g)                                    # real: the level is finished and the next one loaded


# --------------------------------------------------------------------------- 9. plasma refused while slot 0 or 1 is busy

PLASMA = {}


def check_plasma_busy(cov):
    ent = rows(cov, 'Shots_FireRocketLaserPlasma')
    fire = rows(cov, 'plasma_fire')
    snd = [(f, v[0]) for f, v in rows(cov, 'PlaySound') if v[0] == 17]
    print('  entries %d, plasma fired %d, plasma sounds %d' % (len(ent), len(fire), len(snd)))
    for line in PLASMA['log']:
        print('  ' + line)
    claim('slot 0 busy (real rocket in flight, plasma bat, A pressed): refused, no plasma shot', PLASMA['slot0_state'] == 1 and PLASMA['slot0_busy'],
          str(PLASMA['slot0']))
    claim('slot 1 busy only (poked): refused, no plasma shot', PLASMA['slot1_state'] == 1 and PLASMA['slot1_busy'], str(PLASMA['slot1']))
    claim('both slots free (control): plasma fires (wPlasmaState 2, wWeaponFlag 0)', PLASMA['free_state'] == 2 and PLASMA['free_flag'] == 0,
          str(PLASMA['free']))
    claim('the plasma instruction ran only for the free case', len(fire) == 1, '%d times' % len(fire))
    claim('SFX 17 (plasma shot) played once (the free case)', len(snd) == 1, '%s' % snd)


def scenario_plasma_busy(g):
    """Real input: a rocket is fired, a plasma bat is picked up while it flies, A is pressed (slot 0 busy).
    Poked: slot 1 busy alone (a player cannot keep slot 1 alone busy). Control: A with slots free."""
    PLASMA['log'] = []
    to_level_with_ball(g)
    cv.catch_powerup(g, 1)                                  # rocket
    empty_field(g)
    cv.park_ball(g)
    g.play(10, launch=False, steer='')
    g.pb.button_press('a')
    g.run(3)
    g.pb.button_release('a')
    g.run(3)
    PLASMA['log'].append('rocket fired: wShotActive %s' % [g.peek('wShotActive+%d' % i) for i in range(6)])
    # the plasma power-up falls onto the bat while the rocket flies
    cv.recover(g)
    g.drop_powerup(3)
    g.play(60, launch=False, steer='', until=lambda: g.peek('wPlasmaState') == 1)
    act = [g.peek('wShotActive+%d' % i) for i in range(6)]
    PLASMA['log'].append('plasma bat taken: wPlasmaState %d, wWeaponFlag %d, wRocketLaserBat %d, wShotActive %s'
                         % (g.peek('wPlasmaState'), g.peek('wWeaponFlag'), g.peek('wRocketLaserBat'), act))
    snap = None
    if g.peek('wPlasmaState') == 1 and act[0]:
        g.pb.button_press('a')
        g.run(3)
        snap = (g.peek('wPlasmaState'), g.peek('wWeaponFlag'), [g.peek('wShotActive+%d' % i) for i in range(6)])
        g.pb.button_release('a')
        g.run(2)
    else:
        PLASMA['log'].append('the plasma pick-up cleared the rocket (not the case wanted)')
    PLASMA['slot0'] = snap
    PLASMA['slot0_state'] = snap and snap[0]
    PLASMA['slot0_busy'] = bool(snap) and snap[1] == 1 and snap[2][0] != 0
    # slot 1 only (poke)
    g.sync_poke('wShotActive', 0, 0, 0, 0, 0, 0)
    g.run(20)
    g.sync_poke('wShots+4', 60, 0x70, 0x70, 0)
    g.sync_poke('wShotActive+1', 3)
    g.poke('wPlasmaState', 1)
    g.poke('wWeaponFlag', 1)
    g.poke('wRocketLaserBat', 0)
    g.pb.button_press('a')
    g.run(3)
    snap = (g.peek('wPlasmaState'), g.peek('wWeaponFlag'), [g.peek('wShotActive+%d' % i) for i in range(6)])
    g.pb.button_release('a')
    g.run(2)
    PLASMA['slot1'] = snap
    PLASMA['slot1_state'] = snap[0]
    PLASMA['slot1_busy'] = snap[1] == 1 and snap[2][0] == 0 and snap[2][1] != 0
    # control: nothing in flight
    g.sync_poke('wShotActive', 0, 0, 0, 0, 0, 0)
    g.run(20)
    g.poke('wPlasmaState', 1)
    g.poke('wWeaponFlag', 1)
    g.poke('wRocketLaserBat', 0)
    g.pb.button_press('a')
    g.run(3)
    snap = (g.peek('wPlasmaState'), g.peek('wWeaponFlag'), [g.peek('wShotActive+%d' % i) for i in range(6)])
    g.pb.button_release('a')
    g.run(2)
    PLASMA['free'] = snap
    PLASMA['free_state'] = snap[0]
    PLASMA['free_flag'] = snap[1]


# --------------------------------------------------------------------------- 10. wBlobThrowCount decrement

def check_blob_throw_count(cov):
    before = rows(cov, 'UpdateProjectile.becomeBall')
    after = rows(cov, 'becomeBall_after_dec')
    print('  becomeBall entries (wBlobThrowCount, flags): %s' % [(f, v) for f, v in before])
    print('  after the decrement:                         %s' % [(f, v) for f, v in after])
    claim('becomeBall ran with real catches (%d times)' % len(before), len(before) >= 2)
    claim('wBlobThrowCount drops by exactly 1 in becomeBall',
          len(before) == len(after) and all(a[1][0] == b[1][0] - 1 for a, b in zip(after, before)),
          '%s' % [(b[1][0], a[1][0]) for a, b in zip(after, before)])
    claim('both a count of 1 (to 0) and a count of 2 (to 1) were seen',
          {b[1][0] for b in before} >= {1, 2}, 'before values %s' % sorted({b[1][0] for b in before}))
    claim('the count is 0 again after the last landing', BLOB['final'] == 0, 'final %s' % BLOB['final'])


BLOB = {}


def scenario_blob_throw_count(g):
    """Blob level. Real: the blob catches and throws, the bat catches Triple ball so that a second ball can be given to the blob.
    Poked: a ball is placed inside the blob (as coverage.py does) once, and a second one while the first
    throw is in the air, so that the count reaches 2."""
    BLOB.clear()
    level = cv.levels_of_type(2)[0]
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    cv.goto_level(g, level)
    g.play(200)
    cv.catch_powerup(g, 9)                                  # Triple ball: more than one ball in play
    g.play(40)

    def blob_ball(slot):
        g.sync_poke(g.syms['wBalls'] + 7 * slot, 0, g.peek('wBlobY') + 6, 0, g.peek('wBlobX') + 6, 1, 3, 0)
        g.poke('wBallOnBat', 0)

    for rnd in range(4):
        if g.peek('wBallCount') < 2:
            cv.catch_powerup(g, 9)
            g.play(40)
        blob_ball(0)
        g.play(120, until=lambda: g.state != 2 or (g.peek('wBlobThrowing') == 0 and g.peek('wProjectiles') != 0
                                                    and g.peek('wBlobThrowCount') >= 1))
        alive = [i for i in range(3) if g.ball(i)[4] != 0xFF and g.ball(i)[3] != 0]
        if rnd % 2 == 0 and alive and g.peek('wProjectiles') != 0:
            blob_ball(alive[0])
        g.play(260, until=lambda: g.state != 2 or not g.peek('wBlobThrowCount'))
        if g.state != 2:
            break
    BLOB['final'] = g.peek('wBlobThrowCount')


# --------------------------------------------------------------------------- runner

# name: (function, watch specs, extra hooks [(name, label, instructions after the label)], check)
SCENARIOS = {
    'shot_slots': (scenario_shot_slots,
                   ['UpdateShot%d.flying:wShots' % s for s in range(1, 6)], [], check_shot_slots),
    'blast_on_wall': (scenario_blast_on_wall,
                      ['Projectile_HitBrick:@A,@C', 'blast_start:wGrenadeBlastX'],
                      [('blast_start', 'UpdateProjectile', 'ld a,$34')], check_blast_on_wall),
    'clear_unbreakable': (scenario_clear_unbreakable,
                          ['ClearUnbreakableHitEffects:wUnbreakableHitEffects:30',
                           'clear_ret:wUnbreakableHitEffects:30,wUnbreakableHitEffectPtr:2,wUnbreakableHitEffectsEnd'],
                          [('clear_ret', 'ClearUnbreakableHitEffects', 'ret')], check_clear_unbreakable),
    'plasma_busy': (scenario_plasma_busy,
                    ['Shots_FireRocketLaserPlasma:wPlasmaState', 'plasma_fire:wPlasmaState', 'PlaySound:@A'],
                    [('plasma_fire', 'Shots_FireRocketLaserPlasma', 'ld a,$02')], check_plasma_busy),
    'blob_throw_count': (scenario_blob_throw_count,
                         ['UpdateProjectile.becomeBall:wBlobThrowCount,wProjectileWork+8',
                          'becomeBall_after_dec:wBlobThrowCount'],
                         [('becomeBall_after_dec', 'UpdateProjectile.becomeBall', 3)], check_blob_throw_count),
}


def make_labels(extras, rom):
    labels = cv.read_labels()
    symtab = cv.read_symtab()
    added = {}
    for name, label, where in extras:
        if isinstance(where, str):
            bank, addr = symtab[label]
            n = 0
            while True:
                offset = addr if bank == 0 else bank * 0x4000 + addr - 0x4000
                length, text, _t = op(rom, offset)
                if text == where or (where == 'ret' and text.startswith('ret')):
                    break
                addr += length
                n += 1
                assert n < 200
        else:
            bank, addr = insn_addr(label, where, symtab, rom)
        labels.append(dict(name=name, bank=bank, addr=addr, routine=name))
        added[name] = (bank, addr)
    return labels, added


def run_one(name, rom_path, frame_limit):
    fn, specs, extras, check = SCENARIOS[name]
    rom = open(rom_path, 'rb').read()
    labels, added = make_labels(extras, rom)
    cov = cv.Coverage(labels, [])
    cov.symtab.update(added)
    known = {l['name'] for l in labels}
    for s in specs:
        if s.partition(':')[0] not in known:
            raise SystemExit('%s: %s is not a hookable code label' % (name, s.partition(':')[0]))
    cov.watches = [CheckWatch(s, cov.syms) for s in specs]
    print('== %s' % name, flush=True)
    g = cv.Game(cov, rom_path, frame_limit)
    for w in cov.watches:
        w.game = g
    start = time.time()
    try:
        fn(g)
    except cv.StopScenario:
        print('stopped at the frame limit')
    print('scenario %s: %d frames, %.1f s' % (name, g.frame, time.time() - start))
    g.close()
    check(cov)


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
        for n, (fn, _w, _e, _c) in SCENARIOS.items():
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
    print('%d claims, %d passed, %d failed' % (len(CLAIMS), sum(CLAIMS), len(CLAIMS) - sum(CLAIMS)))
    sys.exit(0 if all(CLAIMS) else 1)


if __name__ == '__main__':
    main()

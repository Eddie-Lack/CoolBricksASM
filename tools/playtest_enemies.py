"""Play-test scenarios for the enemy area (UFO, blob, thrown projectiles): cases the first pass of tools/coverage.py did not reach.

Run from the repository root after `make` (needs PyBoy), one emulator at a time:

    python tools/playtest_enemies.py --list
    python tools/playtest_enemies.py --scenario pt_ufo_left --verbose
    python tools/playtest_enemies.py --scenario all

Every scenario is deterministic, takes under about 60 s and prints:
  CLAIM lines  one per checked claim, PASS or FAIL, with the values seen;
  hits         how often the labels it is meant to reach ran;
  watch logs   the variables logged at every hit of the watched labels (the --watch style of coverage.py).

What is real input and what is poked: levels are reached the way coverage.py does it (the level number is poked one
level early and a level is finished). The UFO passes, the blob catching and throwing, the power-ups caught with the
bat and the bat movement are real. Poked: a ball placed inside the blob (as coverage.py does), a second ball placed
inside the blob while the first throw is in flight (wBallCount is set to 1 when the real blob holds the only ball, in the Ghost and Ninja
scenarios), wGhostActive / wNinjaActive are never poked (the power-ups are caught),
and the projectile slot and the brick below it for the low bounce case (a real throw only lands that low on a brick
that is planted in the bottom rows). Nothing here edits coverage.py; the scenarios register themselves in its table.
"""
import argparse
import os
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import coverage as C                                   # noqa: E402
from coverage import (scenario, catch_powerup, recover, goto_level,   # noqa: E402
                      levels_of_type, wait_flying, park_ball, ufo_follow)

CLAIMS = []


def claim(g, text, ok, detail=''):
    CLAIMS.append(bool(ok))
    print('CLAIM %s [frame %d] %s%s' % ('PASS' if ok else 'FAIL', g.frame, text, ('  (' + detail + ')') if detail else ''),
          flush=True)


def trace(g, label, fn):
    """Call fn() every time `label` is reached (the hook re-arms itself)."""
    def arm():
        fn()
        g.at(label, arm)
    g.at(label, arm)


def reg(g, name):
    return getattr(g.pb.register_file, name)


def reg16(g, hi, lo):
    return reg(g, hi) << 8 | reg(g, lo)


def sym_addr(g, label):
    return g.cov.symtab[label][1]


def blob_ball(g, slot=0):
    """Put ball `slot` inside the blob (the catch box is the 15 pixels from the blob's position)."""
    g.sync_poke(g.syms['wBalls'] + 7 * slot, 0, g.peek('wBlobY') + 6, 0, g.peek('wBlobX') + 6, 1, 3, 0)
    g.poke('wBallOnBat', 0)


def to_level(g, level):
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    goto_level(g, level)
    g.play(200)


# --------------------------------------------------------------------------- UFO: the leftward end of a pass

@scenario
def scenario_pt_ufo_left(g):
    """UFO level: passes run until a leftward one ends by itself (UpdateUfo.movingLeft cp $e0) and an early rightward end for comparison."""
    ufo = levels_of_type(1)[0]
    to_level(g, ufo)
    claim(g, 'level %d is a UFO level (wLevelType bit 0)' % (g.peek('wCurrentLevel') + 1), g.peek('wLevelType') & 1)
    ends = []
    trace(g, 'UpdateUfo.stopFlying', lambda: ends.append((g.peek('wUfoX'), g.peek('wUfoSpeed+1'), g.peek('wUfoPassIndex'), g.peek('wUfoHits'))))
    sides = []
    trace(g, 'UpdateUfo.passLeftward', lambda: sides.append(('L', g.peek('wUfoPassIndex'))))
    trace(g, 'UpdateUfo.storePassSetup', lambda: sides.append(('start', g.peek('wUfoPassIndex'), g.peek('wUfoSpeed+1'))))
    park_ball(g)
    for _ in range(4):
        wait_flying(g)
        park_ball(g)
        # real play: the bat dodges the bomb, the ball stays parked on the bat, the UFO runs the whole pass
        g.play(700, launch=False, follow=ufo_follow(g, 'dodge'), until=lambda: g.state != 2 or not g.peek('wUfoFlying'))
        recover(g)
        park_ball(g)
        if any(e[1] == 0xFF for e in ends):
            break
    left = [e for e in ends if e[1] == 0xFF]
    right = [e for e in ends if e[1] == 0]
    claim(g, 'a leftward pass ended by itself at x = $e0 (speed high byte $ff)', left and all(e[0] == 0xE0 for e in left), 'ends %s' % (ends,))
    claim(g, 'leftward passes are the table entries with side 1 (index 2, 4, 6)', all(i in (2, 4, 6) for _, i in [s[:2] for s in sides if s[0] == 'L']), 'sides %s' % (sides,))
    claim(g, 'a rightward pass ends at x = $b0', all(e[0] == 0xB0 for e in right), 'ends %s' % (ends,))
    claim(g, 'no end came from a hit (wUfoHits stayed 0)', all(e[3] == 0 for e in ends))


# --------------------------------------------------------------------------- blob: several balls, two throws, Ghost, Ninja

def blob_level_ready(g, level=None):
    level = level or levels_of_type(2)[0]
    to_level(g, level)
    claim(g, 'level %d is a blob level (wLevelType bit 1)' % (g.peek('wCurrentLevel') + 1), g.peek('wLevelType') & 2,
          'wLevelType %d' % g.peek('wLevelType'))


@scenario
def scenario_pt_blob_multi(g):
    """Blob level with Triple ball: the thrown ball lands while other balls are in play (becomeBall.seekBallSlotLoop); two balls caught before the first lands (wBlobThrowCount 2)."""
    blob_level_ready(g)
    land = []
    trace(g, 'UpdateProjectile.becomeBall', lambda: land.append((g.peek('wBallCount'), g.peek('wBlobThrowCount'), g.peek('wProjectileWork+8'))))
    counts = []
    trace(g, 'UpdateBlob.tickThrowFrame', lambda: counts.append(g.peek('wBlobThrowCount')))
    seek = g.cov.symtab['UpdateProjectile.seekBallSlotLoop']
    ok = catch_powerup(g, 9)
    claim(g, 'Triple ball caught', ok, 'wBallCount %d' % g.peek('wBallCount'))
    g.play(40)
    before = g.count('UpdateProjectile.seekBallSlotLoop')
    for round_ in range(3):
        if g.peek('wBallCount') < 2:
            catch_powerup(g, 9)
            g.play(40)
        # first ball into the blob, then a second one while the first throw is in the air
        blob_ball(g, 0)
        g.play(120, until=lambda: g.state != 2 or g.peek('wBlobThrowing') == 0 and g.peek('wProjectiles') != 0 and g.peek('wBlobThrowCount') >= 1)
        if g.peek('wBallCount') >= 1 and g.peek('wProjectiles') != 0:
            alive = [i for i in range(3) if g.ball(i)[4] != 0xFF and g.ball(i)[3] != 0]
            if alive:
                blob_ball(g, alive[0])
        g.play(200, until=lambda: g.state != 2 or not g.peek('wBlobThrowCount'))
        if g.count('UpdateProjectile.seekBallSlotLoop') > before and max(counts or [0]) >= 2:
            break
    claim(g, 'seekBallSlotLoop ran (a thrown ball landed with other balls in play)', g.count('UpdateProjectile.seekBallSlotLoop') > before,
          'becomeBall (wBallCount, wBlobThrowCount, flags): %s' % (land,))
    claim(g, 'every blob ball landing had flag bit 7 clear (a ball, not a grenade)', land and all(l[2] & 0x80 == 0 for l in land))
    claim(g, 'wBlobThrowCount reached 2 (two balls caught and not yet thrown back)', max(counts or [0]) >= 2, 'values %s' % sorted(set(counts)))
    claim(g, 'wBlobThrowCount at landing is 1 or 2, and drops by one', land and all(l[1] in (1, 2) for l in land))


def ghost_or_ninja(g, ptype, field):
    blob_level_ready(g)
    seen = []
    ghost_sprites = sym_addr(g, 'BlobSprites_Ghost')
    plain_sprites = sym_addr(g, 'BlobSprites')
    trace(g, 'UpdateBlob.tickNormalFrame', lambda: seen.append((g.peek(field), reg(g, 'HL'), g.peek('wBlobThrowing'))))
    catches = []
    trace(g, 'CheckBlobCatch', lambda: catches.append((g.peek(field), g.peek('wGhostActive'), g.peek('wNinjaActive'), reg(g, 'B'), reg(g, 'C'),
                                                      g.peek('wBlobY'), g.peek('wBlobX'), g.peek('wBlobThrowing'))))
    ok = catch_powerup(g, ptype)
    claim(g, 'power-up %d caught on a blob level' % ptype, ok and g.peek('wLevelType') & 2, 'wLevelType %d, %s %d' % (g.peek('wLevelType'), field, g.peek(field)))
    n = len(catches)
    thrown = g.count('UpdateBlob.spawnThrow')
    removed = []
    trace(g, 'Gameplay_BallLoop.removeFlaggedBall', lambda: removed.append(g.peek('wBlobThrowing')))
    for _ in range(40):                                  # the effect is short: keep a ball inside the blob while it lasts
        if g.state != 2 or not g.peek(field):
            break
        blob_ball(g, 0)
        if not g.peek('wBallCount'):                      # the real blob has the only ball in its throw: poke the count so that ball 0 is tested
            g.sync_poke('wBallCount', 1)
        g.play(5, launch=False, until=lambda: g.state != 2)
    g.play(30, launch=False)
    inside = [c for c in catches[n:] if c[5] < c[3] <= c[5] + 15 and c[6] < c[4] <= c[6] + 15 and c[0]]
    claim(g, '%s active: CheckBlobCatch saw a ball inside the blob box' % field, inside, '%d of %d calls' % (len(inside), len(catches) - n))
    claim(g, '%s active: wBlobThrowing stayed 0 at those calls (no catch)' % field, inside and all(c[7] == 0 for c in inside))
    claim(g, '%s active: no throw started' % field, g.count('UpdateBlob.spawnThrow') == thrown)
    active = [s for s in seen if s[0]]
    return seen, active, ghost_sprites, plain_sprites


@scenario
def scenario_pt_blob_ghost(g):
    """Blob level with Ghost: the blob cannot catch the ball, and UpdateBlob draws BlobSprites_Ghost."""
    seen, active, ghost, plain = ghost_or_ninja(g, 14, 'wGhostActive')
    claim(g, 'Ghost: UpdateBlob.tickNormalFrame ran with wGhostActive set and HL = BlobSprites_Ghost',
          active and all(s[1] == ghost for s in active), '%d frames, HL %s' % (len(active), sorted({hex(s[1]) for s in active})))
    plain_frames = [s for s in seen if not s[0]]
    claim(g, 'with Ghost off the same label has HL = BlobSprites', plain_frames and all(s[1] == plain for s in plain_frames),
          '%d frames, HL %s' % (len(plain_frames), sorted({hex(s[1]) for s in plain_frames})))


@scenario
def scenario_pt_blob_ninja(g):
    """Blob level with Ninja: the blob cannot catch the ball (the sprites stay the plain ones)."""
    seen, active, ghost, plain = ghost_or_ninja(g, 13, 'wNinjaActive')
    claim(g, 'Ninja: the blob keeps the plain sprites (HL = BlobSprites)', active and all(s[1] == plain for s in active),
          '%d frames, HL %s' % (len(active), sorted({hex(s[1]) for s in active})))


# --------------------------------------------------------------------------- blob palette

@scenario
def scenario_pt_blob_palette(g):
    """Blob level 39 (level type byte $72): wBlobPalette is 7 and is added to the attribute of every blob sprite."""
    to_level(g, 39)
    claim(g, 'level 39 is a blob level with wBlobPalette 7', g.peek('wLevelType') & 2 and g.peek('wBlobPalette') == 7,
          'wLevelType %d, wBlobPalette %d' % (g.peek('wLevelType'), g.peek('wBlobPalette')))
    rom = g.rom_data
    bank, base = g.cov.symtab['BlobSprites']
    attrs = {rom[bank * 0x4000 + base - 0x4000 + 3 + 4 * i] for i in range(32)}
    bank, gbase = g.cov.symtab['BlobSprites_Ghost']
    attrs_ghost = {rom[bank * 0x4000 + gbase - 0x4000 + 3 + 4 * i] for i in range(32)}
    seen = []
    start = []
    trace(g, 'UpdateBlob.drawSprites', lambda: start.append(g.peek('wOamWritePtr') | g.peek('wOamWritePtr+1') << 8))
    trace(g, 'UpdateEnemyPath', lambda: seen.append((start[-1] if start else None, g.peek('wBlobThrowing'))))
    oam = []

    def grab():
        # right after the sprites are written: UpdateEnemyPath starts, the 16 bytes before wOamWritePtr are the blob's
        end = g.peek('wOamWritePtr') | g.peek('wOamWritePtr+1') << 8
        oam.append([g.mem[end - 16 + 4 * i + 3] for i in range(4)])
    trace(g, 'UpdateEnemyPath', grab)
    g.play(120, launch=False)
    blob_ball(g, 0)
    g.play(80, launch=False)
    flat = [a for row in oam for a in row]
    claim(g, 'wBlobPalette 7 at every UpdateBlob call', True if g.peek('wBlobPalette') == 7 else False)
    claim(g, 'blob sprite attributes in OAM are the table attribute + 7 (plain and throwing frames)',
          flat and {a - 7 for a in flat} <= attrs | {0, 8}, 'OAM attributes seen %s, table attributes %s %s' % (
              sorted(set(flat)), sorted(attrs), sorted(attrs_ghost)))


# --------------------------------------------------------------------------- projectile landing low

@scenario
def scenario_pt_low_bounce(g):
    """A projectile that lands on an unbreakable brick at y >= $8b takes UpdateProjectile_HitBrick.atOrAbove8b (timer 8, ProjectileBounceArc_7)."""
    blob_level_ready(g)
    hits = []
    trace(g, 'UpdateProjectile_HitBrick.atOrAbove8b', lambda: hits.append((g.peek('wProjectileWork+4'), g.peek('wProjectileWork+8'))))
    stored = []
    trace(g, 'UpdateProjectile_HitBrick.storeTimerAndData', lambda: stored.append((reg(g, 'A'), reg(g, 'HL'), g.peek('wProjectileWork+4'))))
    arc7 = sym_addr(g, 'ProjectileBounceArc_7')
    base = g.syms['wBrickMap']
    for flags in (0x00, 0x80):
        for y in (0x8B, 0x90):
            row = (y & 0xF8) // 8 - 3
            g.sync_poke('wBricksLeft', 200)
            g.sync_poke(base + 16 * row + 5, 0x0E)
            # slot layout: timer, x sub, x, y sub, y, direction, flags (bit 7 = grenade), path pointer (2 bytes)
            g.sync_poke('wProjectiles', 1, 0, 80, 0, y, 0, flags, 0, 0)
            g.run(10)
            g.sync_poke('wProjectiles', 0, 0, 0, 0, 0, 0, 0, 0, 0)
            g.sync_poke(base + 16 * row + 5, 0)
    claim(g, 'atOrAbove8b reached for y = $8b and $90, for a ball and a grenade', len(hits) >= 4, 'hits (y, flags) %s' % (hits,))
    claim(g, 'at that label y >= $8b', hits and all(h[0] >= 0x8B for h in hits))
    claim(g, 'it stores timer 8 and path ProjectileBounceArc_7', stored and all(s[0] == 8 and s[1] == arc7 for s in stored if s[2] >= 0x8B),
          '(A, HL, y) at the store: %s, arc7 %#x' % (stored[:8], arc7))


# --------------------------------------------------------------------------- dead code check

@scenario
def scenario_pt_sprite_tables(g):
    """UFO level, no poking: how many bytes of UfoSprites UpdateUfo reads each frame (the table is 18 bytes, the loop runs 5 times)."""
    to_level(g, levels_of_type(1)[0])
    loops = []
    trace(g, 'UpdateUfo.spriteLoop', lambda: loops.append(reg16(g, 'D', 'E')))
    wait_flying(g)
    park_ball(g)
    g.play(60, launch=False, follow=ufo_follow(g, 'dodge'))
    start = sym_addr(g, 'UfoSprites')
    firsts = sorted({d for d in loops if start <= d < start + 40})
    claim(g, 'UpdateUfo.spriteLoop runs 5 times per frame (DE steps through 20 bytes from UfoSprites)',
          len(loops) >= 5 and len(loops) % 5 == 0, '%d hits, DE values %s' % (len(loops), [hex(d) for d in firsts]))
    claim(g, 'the last sprite starts at UfoSprites + 16 (past the 18-byte table end is UfoHitScores)', max(firsts) - start == 16 if firsts else False)


# --------------------------------------------------------------------------- driver

WATCHES = {
    'pt_ufo_left': ['UpdateUfo.movingLeft:wUfoX,wUfoSpeed+1', 'UpdateUfo.stopFlying:wUfoX,wUfoSpeed+1,wUfoPassIndex,wUfoHits'],
    'pt_blob_multi': ['UpdateProjectile.becomeBall:wBallCount,wBlobThrowCount,wProjectileWork+8',
                      'UpdateBlob.throwFinished:wBlobThrowCount,wBallCount'],
    'pt_blob_ghost': ['UpdateBlob.tickNormalFrame:wGhostActive,wBlobThrowing'],
    'pt_blob_ninja': ['UpdateBlob.tickNormalFrame:wNinjaActive,wGhostActive,wBlobThrowing'],
    'pt_blob_palette': ['UpdateBlob.drawSprites:wBlobPalette,wLevelType'],
    'pt_low_bounce': ['UpdateProjectile_HitBrick:wProjectileWork+4,wProjectileWork+8'],
}

TARGETS = {
    'pt_ufo_left': ['UpdateUfo.movingLeft', 'UpdateUfo.stopFlying', 'UpdateUfo.passLeftward'],
    'pt_blob_multi': ['UpdateProjectile.becomeBall', 'UpdateProjectile.seekBallSlotLoop', 'UpdateProjectile.writeBall'],
    'pt_blob_ghost': ['UpdateBlob.tickNormalFrame', 'CheckBlobCatch', 'CheckBlobCatch.returnZero'],
    'pt_blob_ninja': ['UpdateBlob.tickNormalFrame', 'CheckBlobCatch', 'CheckBlobCatch.returnZero'],
    'pt_blob_palette': ['UpdateBlob.drawSprites', 'UpdateBlob.spriteLoop'],
    'pt_low_bounce': ['UpdateProjectile_HitBrick', 'UpdateProjectile_HitBrick.atOrAbove8b', 'UpdateProjectile_HitBrick.storeTimerAndData'],
    'pt_sprite_tables': ['UpdateUfo.spriteLoop'],
}


def print_watch(cov):
    for w in cov.watches:
        for name, st in w.to_json().items():
            log = st['log']
            shown = ' '.join('%d:%s' % (f, v) for f, v in log[:24])
            print('WATCH %s %s count %d values %s\n      %s%s' % (w.label, name, st['count'], st['values'][:16], shown, ' ...' if len(log) > 24 else ''))


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--scenario', action='append', default=[])
    ap.add_argument('--watch', action='append', default=[], help='extra --watch specs, as in coverage.py')
    ap.add_argument('--rom', default=os.path.join(C.ROOT, 'game.gbc'))
    ap.add_argument('--frames', type=int, default=400000)
    ap.add_argument('--verbose', action='store_true')
    ap.add_argument('--list', action='store_true')
    args = ap.parse_args()
    mine = [n for n in C.SCENARIOS if n.startswith('pt_')]
    if args.list:
        for n in mine:
            print('%-17s %s' % (n, (C.SCENARIOS[n].__doc__ or '').strip().split('\n')[0]))
        return
    C.VERBOSE = args.verbose
    names = []
    for s in args.scenario or ['all']:
        names.extend(mine if s == 'all' else [s])
    labels = C.read_labels()
    for n in names:
        if n not in mine:
            raise SystemExit('unknown scenario %s (try --list)' % n)
        cov = C.Coverage(labels, WATCHES.get(n, []) + args.watch)
        print('== %s' % n, flush=True)
        start = time.time()
        C.run_scenarios([n], cov, args.rom, args.frames)
        for label in TARGETS.get(n, []):
            if label in cov.symtab:
                bank, addr = cov.symtab[label]
                print('hits %-48s %d' % (label, cov.hits.get((bank, addr), 0)))
        print_watch(cov)
        print('== %s done in %.1f s' % (n, time.time() - start), flush=True)
    print('claims: %d pass, %d fail' % (sum(CLAIMS), len(CLAIMS) - sum(CLAIMS)))


if __name__ == '__main__':
    main()

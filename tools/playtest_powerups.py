"""Play-test scenarios for the power-up area: cases the first pass of tools/coverage.py did not reach.

Run from the repository root after `make` (needs PyBoy), one emulator at a time:

    python tools/playtest_powerups.py --list
    python tools/playtest_powerups.py --scenario pt_rules --verbose
    python tools/playtest_powerups.py --scenario all

Every scenario is deterministic, takes under about 60 s and prints:
  CLAIM lines  one per checked claim, PASS or FAIL, with the values seen;
  hits         how often the labels it is meant to reach ran;
  watch logs   the variables logged at every hit of the watched labels (the --watch style of coverage.py).

What is poked (everything else is real input): a random brick roll is made by writing hFrameCounter at
the start of SpawnPowerup (the roll is that counter and 15, so it is otherwise a matter of luck); bricks and
power-up ids are poked into the brick map as in coverage.py; the ball is placed under a brick or in the UFO
or the blob; wLives, wCurrentLevel, hStateTimer and the falling power-up slots are poked where a scenario says so.
Nothing here edits coverage.py; the scenarios register themselves in its table.
"""
import argparse
import os
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import coverage as C                                   # noqa: E402
from coverage import (scenario, catch_powerup, spawn_from_brick, recover, lose_lives, goto_level,   # noqa: E402
                      title_to_menu, game_over_and_name, pause_resume, leave_ending, POWERUPS)

CLAIMS = []


def claim(g, text, ok, detail=''):
    CLAIMS.append(bool(ok))
    print('CLAIM %s [frame %d] %s%s' % ('PASS' if ok else 'FAIL', g.frame, text, ('  (' + detail + ')') if detail else ''),
          flush=True)


def clear_slots(g):
    base = g.syms['wFallingPowerups']
    for i in range(8):
        g.mem[base + 12 * i] = 0


# --------------------------------------------------------------------------- brick drop rules

def drop_with_roll(g, power_id, roll=None):
    """Make a real brick drop power-up `power_id` with the random roll forced to `roll` (the low 4 bits of
    hFrameCounter are written when SpawnPowerup runs for that brick). Returns (type, state at the spawn)."""
    seen = {}
    sym = g.cov.symtab['SpawnPowerup']

    def arm():
        if g.peek('wHitPowerupId') and g.peek('wHitBrickValue') == 1:
            if roll is not None:
                g.poke('hFrameCounter', roll)
            seen.update(flag=g.peek('wWeaponFlag'), balls=g.peek('wBallCount'), ltype=g.peek('wLevelType'),
                        pid=g.peek('wHitPowerupId'))
        else:
            g.at('SpawnPowerup', arm)
    g.once.pop(sym, None)
    g.at('SpawnPowerup', arm)
    slot = spawn_from_brick(g, power_id)
    g.once.pop(sym, None)
    if slot is None or not seen:
        return None, seen
    kind = g.mem[slot + 3]
    g.mem[slot] = 0                                      # drop it again, so that it is not caught
    return kind, seen


@scenario
def scenario_pt_rules(g):
    """Drop rules of SpawnPowerup: fixed Clock with no weapon, random rolls of 6 and 9, with and without a weapon / several balls."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(200)
    kind, s = drop_with_roll(g, 0x12)
    claim(g, 'fixed Clock brick (id 18) with wWeaponFlag 0 drops a Clock (6)', kind == 6 and s.get('flag') == 0, 'type %s %s' % (kind, s))
    kind, s = drop_with_roll(g, 0x11, 6)
    claim(g, 'random brick rolling 6, no weapon: becomes Slowball (0)', kind == 0 and s.get('flag') == 0, 'type %s %s' % (kind, s))
    kind, s = drop_with_roll(g, 0x11, 9)
    claim(g, 'random brick rolling 9, one ball: Triple ball (9)', kind == 9 and s.get('balls') == 1, 'type %s %s' % (kind, s))
    kind, s = drop_with_roll(g, 0x11, 3)
    claim(g, 'random brick rolling 3 passes through (3)', kind == 3, 'type %s %s' % (kind, s))
    catch_powerup(g, 1)                                  # Rocket: wWeaponFlag is 1
    kind, s = drop_with_roll(g, 0x11, 6)
    claim(g, 'random brick rolling 6, weapon flag 1: stays a Clock (6)', kind == 6 and s.get('flag') == 1, 'type %s %s' % (kind, s))
    kind, s = drop_with_roll(g, 0x12)
    claim(g, 'fixed Clock brick with weapon flag 1: Clock (6)', kind == 6 and s.get('flag') == 1, 'type %s %s' % (kind, s))
    catch_powerup(g, 9)                                  # Triple ball, then wait for the split
    g.play(400, until=lambda: g.peek('wBallCount') >= 2)
    kind, s = drop_with_roll(g, 0x11, 9)
    claim(g, 'random brick rolling 9 with 2 or more balls: becomes Slowball (0)', kind == 0 and s.get('balls', 0) >= 2, 'type %s %s' % (kind, s))
    clear_slots(g)


@scenario
def scenario_pt_blob(g):
    """A blob level: the random roll is shifted by 3 (wLevelType bit 1), and a ball caught by the blob is flagged for removal."""
    blob = C.levels_of_type(2)[0]
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    goto_level(g, blob)
    g.play(300)
    g.wait_until(lambda: g.peek('wBlobThrowing') == 0 and g.peek('wBallCount') == 1 and not g.peek('wBallOnBat'), limit=900)
    claim(g, 'level %d is a blob level (wLevelType bit 1)' % (g.peek('wCurrentLevel') + 1), g.peek('wLevelType') & 2, 'wLevelType %d' % g.peek('wLevelType'))
    # the blob catches a ball put into it: wRemoveBall is set by CheckBlobCatch, Gameplay_BallLoop drops the ball
    lives = g.peek('wLives')
    removed = g.count('Gameplay_BallLoop.removeFlaggedBall')
    g.sync_poke('wBalls', 0, g.peek('wBlobY') + 6, 0, g.peek('wBlobX') + 6, 1, 3, 0)
    g.poke('wBallOnBat', 0)
    g.play(300, until=lambda: g.count('Gameplay_BallLoop.removeFlaggedBall') > removed or g.state != 2)
    claim(g, 'blob catch runs Gameplay_BallLoop.removeFlaggedBall', g.count('Gameplay_BallLoop.removeFlaggedBall') > removed)
    claim(g, 'wRemoveBall is cleared again by removeFlaggedBall', g.peek('wRemoveBall') == 0, 'wRemoveBall %d' % g.peek('wRemoveBall'))
    claim(g, 'the blob holds the ball (wBlobThrowing) and no life is lost', g.peek('wBlobThrowing') == 1 and g.peek('wLives') == lives,
          'throwing %d lives %d balls %d' % (g.peek('wBlobThrowing'), g.peek('wLives'), g.peek('wBallCount')))
    g.play(500)                                          # the blob throws it back
    recover(g)
    g.poke('wWeaponFlag', 0)
    def drop(power_id, roll):
        for _ in range(4):                               # the blob may take the ball: try again
            kind, s = drop_with_roll(g, power_id, roll)
            if kind is not None:
                break
            g.play(200)
        return kind, s
    for roll, want, text in ((0x0C, 9, '12 - 3 = 9: Triple ball with one ball'),
                             (0x09, 0, '9 - 3 = 6: Clock without a weapon becomes Slowball'),
                             (0x02, 15, '2 - 3 wraps to 15: Grenade')):
        g.play(60)
        kind, s = drop(0x11, roll)
        ok = kind == want and bool(s.get('ltype', 0) & 2)
        if want == 9:
            ok = ok and s.get('balls') == 1
        claim(g, 'blob level, random roll %d: %s' % (roll, text), ok, 'type %s %s' % (kind, s))
        clear_slots(g)


# --------------------------------------------------------------------------- weapon flag

@scenario
def scenario_pt_weaponflag(g):
    """wWeaponFlag is 1 after a weapon and is cleared by Poison, Milk, Magnet, Reverse, the plasma shot, the last grenade,
    a lost life and loading the next level."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(200)
    for t in (4, 5, 8, 12):                              # Poison, Milk, Magnet, Reverse
        catch_powerup(g, 1)
        before = {}
        g.at('Powerup_' + POWERUPS[t], lambda: before.update(flag=g.peek('wWeaponFlag')))
        catch_powerup(g, t)
        claim(g, '%s clears wWeaponFlag' % POWERUPS[t], before.get('flag') == 1 and g.peek('wWeaponFlag') == 0,
              'flag %s at pick-up, %d after' % (before.get('flag'), g.peek('wWeaponFlag')))
        g.play(100)
    atpick = {}
    g.at('PowerupCollected', lambda: atpick.update(flag=g.peek('wWeaponFlag'), plasma=g.peek('wPlasmaState')))
    catch_powerup(g, 3)                                  # plasma: the first shot clears the flag
    claim(g, 'Plasma sets wWeaponFlag (read when the pick-up ends)', atpick.get('flag') == 1 and atpick.get('plasma') == 1, 'at pick-up %s' % atpick)
    g.play(200, tap=30, until=lambda: g.peek('wWeaponFlag') == 0)
    claim(g, 'the plasma shot clears wWeaponFlag', g.peek('wWeaponFlag') == 0 and g.peek('wPlasmaState') == 2, 'plasma state %d' % g.peek('wPlasmaState'))
    catch_powerup(g, 15)                                 # grenades: flag stays until the last one is thrown
    claim(g, 'Grenade sets wWeaponFlag with 4 grenades', g.peek('wWeaponFlag') == 1 and g.peek('wGrenadeCount') == 4)
    seen = []
    for _ in range(14):
        if not g.peek('wGrenadeCount'):
            break
        g.play(30, launch=False, buttons=('a',))
        g.play(4, launch=False)
        seen.append((g.peek('wGrenadeCount'), g.peek('wWeaponFlag')))
        g.play(40, launch=False)
    claim(g, 'flag stays 1 while grenades are left, then 0 when the last one is thrown',
          bool(seen) and all(f == (1 if c else 0) for c, f in seen) and seen[-1] == (0, 0) and len({c for c, f in seen}) == 4,
          'count,flag after each release: %s' % seen)
    catch_powerup(g, 11)                                 # a lost life
    claim(g, 'Laser sets wWeaponFlag', g.peek('wWeaponFlag') == 1)
    lose_lives(g, 1)
    claim(g, 'a lost life clears wWeaponFlag', g.peek('wWeaponFlag') == 0, 'flag %d lives %d' % (g.peek('wWeaponFlag'), g.peek('wLives')))
    recover(g)
    catch_powerup(g, 1)                                  # next level: LoadLevel calls ResetShots
    level = g.peek('wCurrentLevel')
    g.finish_level(2)
    g.run(60)
    if g.state == 9:
        g.run(500)
        g.press('a', after=100)
    g.wait_level_ready()
    claim(g, 'loading the next level (ResetShots) clears wWeaponFlag', g.peek('wCurrentLevel') != level and g.peek('wWeaponFlag') == 0,
          'level %d -> %d flag %d' % (level + 1, g.peek('wCurrentLevel') + 1, g.peek('wWeaponFlag')))


# --------------------------------------------------------------------------- antigravity

@scenario
def scenario_pt_antigravity(g):
    """Pepper (Antigravity) cancelled by Slowball, Clock, Triple ball and Ninja: wAntigravityCancel is set and endAntigravity runs."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(200)
    for t in (0, 6, 9, 13):
        catch_powerup(g, 7)
        claim(g, 'Pepper on (wAntigravityActive holds the timer start $a0, not 1)', g.peek('wAntigravityActive') == 0xA0 and g.peek('wBallEffectTimer') > 100,
              'active %d timer %d' % (g.peek('wAntigravityActive'), g.peek('wBallEffectTimer')))
        ends = g.count('Gameplay_AntigravitySteering.endAntigravity')
        cancel = {}
        g.at('Powerup_' + POWERUPS[t], lambda: cancel.update(active=g.peek('wAntigravityActive')))
        g.at('Gameplay_AntigravitySteering.endAntigravity', lambda: cancel.update(flag=g.peek('wAntigravityCancel')))
        catch_powerup(g, t)
        g.play(60, launch=False)
        claim(g, '%s while Antigravity runs: wAntigravityCancel is set (a copy of wAntigravityActive, $a0) at endAntigravity' % POWERUPS[t],
              cancel.get('active') == 0xA0 and cancel.get('flag') == 0xA0
              and g.count('Gameplay_AntigravitySteering.endAntigravity') == ends + 1,
              'active at pick-up %s, cancel at end %s, ends %d' % (cancel.get('active'), cancel.get('flag'),
                                                                   g.count('Gameplay_AntigravitySteering.endAntigravity') - ends))
        claim(g, '... and Antigravity is off, the cancel flag cleared', g.peek('wAntigravityActive') == 0 and g.peek('wAntigravityCancel') == 0)
        g.play(500, sloppy=0.01)
        recover(g)


# --------------------------------------------------------------------------- Smiley

def drop_on_bat(g, ptype):
    """Put a falling power-up right on the bat so that it is caught in the next frame."""
    base = g.syms['wFallingPowerups']
    slot = next(base + 12 * i for i in range(8) if g.mem[base + 12 * i] == 0)
    bank, table = g.cov.symtab['PowerupSprites']
    lo, hi = g.rom_bytes(bank, table + 2 * ptype, 2)
    tiles = g.rom_bytes(bank, lo | hi << 8, 8)
    g.sync_poke(slot, 1, g.peek('wBatY') - 14, g.bat_x() + 8, ptype, *tiles)


@scenario
def scenario_pt_smiley(g):
    """Smiley caught while hStateTimer is not 0 (just after the last brick): the level number goes up twice (the brick skip)."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(200)
    # real sequence: the last brick is hit, and a Smiley is caught within the 15 frames that follow
    before = g.count('Powerup_Smiley')
    level = g.peek('wCurrentLevel')
    g.thin_bricks(1)
    row, col = g.lowest_brick()
    seen = {}
    g.at('Powerup_Smiley', lambda: seen.update(timer=g.peek('hStateTimer'), level=g.peek('wCurrentLevel'), state=g.state))
    base = g.syms['wBrickMap']
    g.shoot_brick(row, col)
    g.play(200, launch=False, until=lambda: g.mem[base + 16 * row + col] == 0 or g.state != 2)
    drop_on_bat(g, 2)
    g.run(3)
    g.play(60, launch=False)
    claim(g, 'Smiley was caught while hStateTimer was not 0 (the last brick had just gone)',
          g.count('Powerup_Smiley') > before and seen.get('timer', 0) != 0, 'seen at pick-up %s' % seen)
    claim(g, 'the level number went up twice: %d -> %d' % (level, g.peek('wCurrentLevel')),
          seen.get('level') == level + 1 and g.peek('wCurrentLevel') == level + 2, 'at pick-up %s, now %d' % (seen.get('level'), g.peek('wCurrentLevel')))
    g.wait_level_ready()
    claim(g, 'the level that loads is level %d (one was skipped)' % (level + 3), g.peek('wCurrentLevel') == level + 2 and g.state == 2)
    # forced: hStateTimer poked to 7 in a running level, then a Smiley
    recover(g)
    g.play(200)
    level = g.peek('wCurrentLevel')
    seen.clear()
    before = g.count('Powerup_Smiley')
    g.at('Powerup_Smiley', lambda: seen.update(timer=g.peek('hStateTimer'), level=g.peek('wCurrentLevel')))
    g.sync_poke('hStateTimer', 7)
    drop_on_bat(g, 2)
    g.run(4)
    claim(g, 'poked hStateTimer 7 (a few frames pass before the catch): Smiley still advances the level (no timer check)',
          g.count('Powerup_Smiley') > before and 0 < seen.get('timer', 0) <= 7 and g.peek('wCurrentLevel') == level + 1,
          'seen %s, level %d -> %d' % (seen, level, g.peek('wCurrentLevel')))
    g.run(100)
    # Smiley as the fourth level since a password: the password screen (state 9); at level 160: the ending (state 13)
    for since, lvl, want_state, want_level, text in ((4, None, 9, 1, 'wLevelsSincePassword 4: password screen (state 9)'),
                                                     (0, 159, 13, 0, 'level 160: ending (state 13), level number wraps to 0')):
        recover(g)
        g.play(100)
        if lvl is not None:
            g.poke('wCurrentLevel', lvl)
        g.poke('wLevelsSincePassword', since)
        level = g.peek('wCurrentLevel')
        before = g.count('Powerup_Smiley')
        drop_on_bat(g, 2)
        g.run(4)
        claim(g, 'Smiley with ' + text, g.count('Powerup_Smiley') > before and g.state == want_state
              and (want_level == 0 and g.peek('wCurrentLevel') == 0 or want_level == 1 and g.peek('wCurrentLevel') == level + 1),
              'state %d level %d -> %d' % (g.state, level, g.peek('wCurrentLevel')))
        g.run(40)


# --------------------------------------------------------------------------- lives, pause, ending, level skip

@scenario
def scenario_pt_gameover(g):
    """Pause without the TDNZ cheat leaves the lives alone; losing the last life ends the game (state 3)."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 3)
    g.play(200)
    n = g.count('StateInit_Pause')
    pause_resume(g)
    claim(g, 'pause without TDNZ: StateInit_Pause runs, lives stay 3',
          g.count('StateInit_Pause') > n and g.peek('wLives') == 3 and g.peek('wCheatLivesRefill') == 0,
          'lives %d cheat %d' % (g.peek('wLives'), g.peek('wCheatLivesRefill')))
    g.poke('wLives', 1)
    g.wait_until(lambda: g.state == 2 and g.peek('wBallCount') >= 1, limit=300)
    g.play(3000, miss=True, until=lambda: g.state != 2)
    claim(g, 'the last life lost: wLives 0, game state 3, no livesRemain', g.state == 3 and g.peek('wLives') == 0,
          'state %d lives %d timer %d lifeLostTimer %d' % (g.state, g.peek('wLives'), g.peek('hStateTimer'), g.peek('hLifeLostTimer')))
    game_over_and_name(g)
    title_to_menu(g)


@scenario
def scenario_pt_cheats(g):
    """TDNZ refills lives to 9 on pause; B skips a level with NCNZ (setNextState, storeLevel); the ending sets wLives to 1."""
    g.boot()
    g.enter_password('TDNZ')
    g.enter_password('NCNZ')
    g.start_level(1)
    g.poke('wLives', 3)
    g.play(100)
    claim(g, 'cheat flags set: refill %d, skip %d' % (g.peek('wCheatLivesRefill'), g.peek('wCheatLevelSkip')),
          g.peek('wCheatLivesRefill') == 1 and g.peek('wCheatLevelSkip') == 1)
    n = g.count('StateInit_Pause')
    pause_resume(g)
    claim(g, 'pause with TDNZ: StateInit_Pause sets wLives to 9', g.count('StateInit_Pause') > n and g.peek('wLives') == 9, 'lives %d' % g.peek('wLives'))
    for target in (None, 'ending'):
        g.play(60, launch=False)
        level = g.peek('wCurrentLevel')
        if target:
            g.poke('wCurrentLevel', 159)
            level = 159
            g.poke('wLives', 5)
        n1, n2 = g.count('Gameplay_Update.setNextState'), g.count('Gameplay_Update.storeLevel')
        g.pb.button_press('b')
        g.wait_until(lambda: g.peek('wCurrentLevel') != level or g.state != 2, limit=100, step=1)
        g.pb.button_release('b')
        g.run(5)
        if not target:
            claim(g, 'B with NCNZ: setNextState and storeLevel run, level %d -> %d' % (level + 1, g.peek('wCurrentLevel') + 1),
                  g.count('Gameplay_Update.setNextState') > n1 and g.count('Gameplay_Update.storeLevel') > n2
                  and g.peek('wCurrentLevel') == level + 1 and 0 < g.peek('hStateTimer') <= 0x0f, 'state %d timer %d' % (g.state, g.peek('hStateTimer')))
            g.wait_level_ready()
        else:
            g.wait_until(lambda: g.state == 13, limit=200)
            claim(g, 'B on level 160: ending (state 13), level number wraps to 0, storeLevel still runs',
                  g.state == 13 and g.peek('wCurrentLevel') == 0 and g.count('Gameplay_Update.storeLevel') > n2,
                  'state %d level %d' % (g.state, g.peek('wCurrentLevel')))
            g.run(60)
            claim(g, 'StateInit_Ending: wLives 1, wLevelsSincePassword 0, wEndingSeen non-zero',
                  g.count('StateInit_Ending') >= 1 and g.peek('wLives') == 1 and g.peek('wLevelsSincePassword') == 0 and g.peek('wEndingSeen') != 0,
                  'lives %d since %d seen %d' % (g.peek('wLives'), g.peek('wLevelsSincePassword'), g.peek('wEndingSeen')))
    leave_ending(g)


# --------------------------------------------------------------------------- effects

@scenario
def scenario_pt_effects(g):
    """A ball hitting an unbreakable brick (SpawnUnbreakableHitEffect, ring of 10 slots) and the UFO hit effect (setZeroSpeed)."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(200)
    base = g.syms['wBrickMap']
    row = 6
    col = max(1, min(9, (g.bat_x() + 8) // 16))
    n = g.count('SpawnUnbreakableHitEffect')
    seen = []
    for i in range(13):                                  # 13 hits: the ring of 10 slots wraps
        g.sync_poke(base + 16 * row + col, 0x0E)
        g.sync_poke('wBalls', 0, row * 8 + 44, 0, col * 16 + 4, 0, 3, 0)
        g.poke('wBallOnBat', 0)
        before = g.count('SpawnUnbreakableHitEffect')
        g.play(60, launch=False, until=lambda: g.count('SpawnUnbreakableHitEffect') > before)
        seen.append((g.peek('wUnbreakableHitEffectPtr') | g.peek('wUnbreakableHitEffectPtr+1') << 8) - g.addr('wUnbreakableHitEffects'))
        g.play(20, launch=False)
    claim(g, 'unbreakable hit effect: 13 ball hits start 13 effects', g.count('SpawnUnbreakableHitEffect') - n == 13,
          'hits %d' % (g.count('SpawnUnbreakableHitEffect') - n))
    claim(g, 'slot pointer steps by 3 and wraps to the first slot after 10', seen[:11] == [3, 6, 9, 12, 15, 18, 21, 24, 27, 0, 3], 'offsets %s' % seen)
    # UFO level: hits show a score effect that stays still (speed 0)
    ufo = C.levels_of_type(1)[0]
    goto_level(g, ufo)
    g.play(100)
    zero = g.count('SpawnPickupEffect.setZeroSpeed')
    effects = g.syms['wPickupEffects']
    for _ in range(4):
        C.wait_flying(g)
        if g.peek('wUfoFlying'):
            g.sync_poke('wBalls', 0, g.peek('wUfoHeight') + 6, 0, g.peek('wUfoX') + 8, 1, 3, 0)
            g.poke('wBallOnBat', 0)
            g.play(30, launch=False, until=lambda: g.count('SpawnPickupEffect.setZeroSpeed') > zero)
        if g.count('SpawnPickupEffect.setZeroSpeed') > zero:
            break
        g.play(60)
    claim(g, 'UFO hit: SpawnPickupEffect.setZeroSpeed runs (e = 1)', g.count('SpawnPickupEffect.setZeroSpeed') > zero)
    slots = [tuple(g.mem[effects + 7 * i + k] for k in range(7)) for i in range(4)]
    claim(g, 'the effect has speed bytes 0, 0 (a power-up pick-up has $80, $ff)', any(s[0] and s[1] == 0 and s[2] == 0 for s in slots), 'slots %s' % slots)
    C.park_ball(g)
    g.play(60)


# --------------------------------------------------------------------------- driver

WATCHES = {
    'pt_rules': ['SpawnPowerup.noCarry:wHitPowerupId,wHitBrickValue,wBallCount,wWeaponFlag,hFrameCounter,wLevelType'],
    'pt_blob': ['Gameplay_BallLoop.removeFlaggedBall:wRemoveBall,wBallCount,wBlobThrowing,wLives',
                'SpawnPowerup.noCarry:wHitPowerupId,wBallCount,wWeaponFlag,hFrameCounter,wLevelType'],
    'pt_weaponflag': ['Powerup_Poison:wWeaponFlag', 'Powerup_Milk:wWeaponFlag', 'Powerup_Magnet:wWeaponFlag', 'Powerup_Reverse:wWeaponFlag'],
    'pt_antigravity': ['Gameplay_AntigravitySteering.endAntigravity:wAntigravityCancel,wAntigravityActive,wBallEffectTimer,wBallCount'],
    'pt_smiley': ['Powerup_Smiley.setGameState:hStateTimer,wCurrentLevel,hGameState,wBricksLeft'],
    'pt_gameover': ['StateInit_Pause:wLives,wCheatLivesRefill'],
    'pt_cheats': ['StateInit_Pause:wLives,wCheatLivesRefill', 'Gameplay_Update.setNextState:wCurrentLevel,wLevelsSincePassword,wEndingSeen',
                  'StateInit_Ending:wLives,wLevelsSincePassword,wEndingSeen'],
    'pt_effects': ['SpawnUnbreakableHitEffect:wUnbreakableHitEffectPtr:2,wUnbreakableHitSpawned',
                   'HitBrickAtBall.countSolidHit:wUnbreakableHitSpawned',
                   'SpawnPickupEffect.setZeroSpeed:wUfoHits'],
}

TARGETS = {
    'pt_rules': ['SpawnPowerup', 'SpawnPowerup.checkType9', 'SpawnPowerup.type9Resolved', 'SpawnPowerup.checkType6', 'SpawnPowerup.type6Resolved',
                 'SpawnPowerup.checkType17', 'SpawnPowerup.subtractOffset'],
    'pt_blob': ['SpawnPowerup.subtractOffset', 'Gameplay_BallLoop.removeFlaggedBall', 'Gameplay_BallLoop.decrementBallCount'],
    'pt_weaponflag': ['Powerup_Poison', 'Powerup_Milk', 'Powerup_Magnet', 'Powerup_Reverse', 'Shots_HandleFire.fireReleased', 'ResetShots'],
    'pt_antigravity': ['Gameplay_AntigravitySteering.endAntigravity', 'Powerup_Slowball', 'Powerup_Clock', 'Powerup_TripleBall', 'Powerup_Ninja'],
    'pt_smiley': ['Powerup_Smiley', 'Powerup_Smiley.setGameState', 'Powerup_Smiley.storeLevel'],
    'pt_gameover': ['StateInit_Pause', 'StateInit_Pause.skipLivesRefill', 'Gameplay_BallLoop.livesRemain', 'Gameplay_BallLoop.lastBallLost'],
    'pt_cheats': ['StateInit_Pause', 'Gameplay_Update.setNextState', 'Gameplay_Update.storeLevel', 'StateInit_Ending'],
    'pt_effects': ['SpawnUnbreakableHitEffect', 'SpawnUnbreakableHitEffect.saveSlotPtr', 'SpawnPickupEffect.setZeroSpeed'],
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
            print('%-15s %s' % (n, (C.SCENARIOS[n].__doc__ or '').strip().split('\n')[0]))
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

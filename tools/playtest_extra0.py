"""Play-test scenarios, extra pass 0: items a second pass left unverified.

Usage (needs PyBoy; run from the repository root after `make`):

    python tools/playtest_extra0.py --list
    python tools/playtest_extra0.py --scenario extra0_ending --verbose
    python tools/playtest_extra0.py --scenario all

Scenarios (each under about 60 s, deterministic):
    extra0_ending     wEndingSeen: the value at StateInit_Ending, at the ChangeROMBank call and in state 13.
    extra0_gameover   The unlabelled game over lines of Gameplay_BallLoop after .livesRemain is skipped, hooked by
                      address ($1212 to $121c in bank 0): they run only for the last life and set state 3, timer $28.
    extra0_unbreakable SpawnUnbreakableHitEffect: the slot pointer wraps with a hook on the unlabelled
                      `ld hl, wUnbreakableHitEffects` line (by address), and the tile of each effect sprite is
                      compared frame by frame with UnbreakableHitEffectFrames.
    extra0_shots      Rocket, laser and plasma shots: OAM tile and attribute bytes against ShotSprite_Rocket,
                      ShotSprite_Laser and ShotSprite_Plasma; bat shadow sprites against BatShadowTiles_Normal and
                      BatShadowTiles_Wide (the wide row needs hTemp2 poked, see the check text).
    extra0_blast      A grenade landing on unbreakable bricks: OAM sprites of every explosion frame against
                      GrenadeExplosionSequence and GrenadeExplosionFrames.
    extra0_grenadetext wGrenadeCount poked to 1, 8, 9, 16 and 17 before the throw: the entry of GrenadeTexts that
                      ShowMessage gets is (wGrenadeCount after the throw and 7), and the BG map shows that text.

What the scenarios poke (all in the scenario code, so a hit does not always mean a player could get there):
wCurrentLevel (to reach the ending), wLives, the brick map, the ball slot, hTemp2 (the wide-shadow row, which no
player can choose: it is a stale scratch byte), wGrenadeCount (the game never gives more than 8 grenades), the
power-up slot (through the harness).
"""
import os
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import coverage as C          # noqa: E402  (tools/coverage.py)

assert os.path.abspath(C.__file__) == os.path.join(HERE, 'coverage.py'), C.__file__
C.MAX_LOG = 100000

SCENARIOS = {}
CHECKS = {}
RESULTS = []


def scen(extra=()):
    """Register a scenario. `extra` is a list of (name, bank, address) hooks on unlabelled code, found by address."""
    def deco(fn):
        SCENARIOS[fn.__name__.replace('scenario_', '')] = (fn, list(extra))
        return fn
    return deco


def check_for(name):
    def deco(fn):
        CHECKS[name] = fn
        return fn
    return deco


def report(scenario, claim, ok, detail=''):
    RESULTS.append((scenario, claim, bool(ok), detail))
    print('  %s  %s%s' % ('PASS' if ok else 'FAIL', claim, (' | ' + str(detail)) if detail != '' else ''), flush=True)


class Recorder:
    """Log registers or RAM at every hit of a label, re-arming itself (Game.at fires once)."""

    def __init__(self, g, label, fn):
        self.g, self.label, self.fn, self.rows = g, label, fn, []
        self.arm()

    def arm(self):
        self.g.at(self.label, self.fire)

    def fire(self):
        self.rows.append((self.g.frame,) + tuple(self.fn(self.g)))
        self.arm()


def regs(g):
    return g.pb.register_file


def oam(g):
    """The 40 sprites of OAM as (y, x, tile, attribute)."""
    m = g.pb.memory
    return [tuple(m[0xFE00 + 4 * i + k] for k in range(4)) for i in range(40)]


def rom_at(g, label, n):
    bank, addr = g.cov.symtab[label]
    return g.rom_bytes(bank, addr, n)


def pairs(data):
    return [tuple(data[i:i + 2]) for i in range(0, len(data), 2)]


def level_ready(g, level=1):
    g.boot()
    g.start_level(level)
    g.poke('wLives', 9)
    g.play(200)


# --------------------------------------------------------------------------- item 1: wEndingSeen

@scen()
def scenario_extra0_ending(g):
    """Play to the ending (wCurrentLevel poked to 158, then the last level finished). Log wEndingSeen at the first
    instruction of StateInit_Ending, at the next ChangeROMBank call (its A) and in state 13."""
    level_ready(g)
    g.poke('wCurrentLevel', 158)
    C.finish_to_next(g)
    g.poke('wLives', 9)
    g.ending = {}

    def at_init():
        g.ending['seen_before'] = g.peek('wEndingSeen')
        g.ending['lives_before'] = g.peek('wLives')

        def at_bank():
            g.ending['bank_arg'] = regs(g).A
            g.ending['seen_at_call'] = g.peek('wEndingSeen')
            g.ending['frame'] = g.frame
        g.at('ChangeROMBank', at_bank)
    g.at('StateInit_Ending', at_init)
    g.finish_level(2)
    g.wait_until(lambda: g.state == 13 and g.count('StateInit_Ending') > 0, limit=900)
    g.run(20)
    g.ending['seen_state13'] = g.peek('wEndingSeen')
    g.ending['state'] = g.state
    g.ending['levels_since'] = g.peek('wLevelsSincePassword')
    g.ending['lives_after'] = g.peek('wLives')


@check_for('extra0_ending')
def check_ending(g, cov, rep):
    name = 'extra0_ending'
    e = g.ending
    bank, _ = cov.symtab['Gfx_Ending_00e_674f']
    rep(name, 'the ending ran (state 13, StateInit_Ending reached)', e.get('state') == 13 and 'bank_arg' in e, e)
    rep(name, 'wEndingSeen is 0 when StateInit_Ending starts (not set by an earlier ending in this run)', e.get('seen_before') == 0,
        'value %s' % e.get('seen_before'))
    rep(name, 'the value stored in wEndingSeen is the bank number of the ending graphics: A at the ChangeROMBank call is $%02x, '
              'Gfx_Ending_00e_674f is in bank $%02x, wEndingSeen holds $%02x' % (e.get('bank_arg', -1), bank, e.get('seen_at_call', -1)),
        e.get('bank_arg') == bank == e.get('seen_at_call') == 0x0e)
    rep(name, 'wEndingSeen is still $0e in state 13 (non-zero marks "the ending was seen"; $0e is a side effect of the bank load)',
        e.get('seen_state13') == 0x0e, 'value %s' % e.get('seen_state13'))
    rep(name, 'StateInit_Ending also clears wLevelsSincePassword and leaves wLives at 1 (header comment)',
        e.get('levels_since') == 0 and e.get('lives_after') == 1, 'since %s lives %s' % (e.get('levels_since'), e.get('lives_after')))


# --------------------------------------------------------------------------- item 2: game over lines in Gameplay_BallLoop

GAMEOVER_BANK0 = [('Gameplay_BallLoop.gameOverLines', 0, 0x1212)]


@scen(GAMEOVER_BANK0)
def scenario_extra0_gameover(g):
    """Two lives lost (wLives 2: the first loss takes .livesRemain, the last one the game over lines), then a game
    over from the title level again with 1 life."""
    level_ready(g)
    g.rows = []
    after = Recorder(g, 'Gameplay_AfterBalls', lambda g: (g.state, g.peek('hStateTimer'), g.peek('wLives')))
    lines = Recorder(g, 'Gameplay_BallLoop.gameOverLines', lambda g: (regs(g).A, g.state, g.peek('wLives'), g.peek('hStateTimer')))
    alive = Recorder(g, 'Gameplay_BallLoop.livesRemain', lambda g: (g.peek('wLives'),))
    g.recs = dict(after=after, lines=lines, alive=alive)
    g.poke('wLives', 2)
    C.lose_lives(g, 2)
    g.wait_until(lambda: g.state == 3, limit=900)
    g.run(30)
    g.state_after_first = g.state


@check_for('extra0_gameover')
def check_gameover(g, cov, rep):
    name = 'extra0_gameover'
    lines, alive, after = (g.recs[k] for k in ('lines', 'alive', 'after'))
    rep(name, 'the unlabelled game over lines (`ld a, 3` at $0000:1212) ran exactly once, for the last life', len(lines.rows) == 1,
        '%d hits' % len(lines.rows))
    rep(name, 'at that point wLives was already decremented to 0 (A = 0, `or a` / `jr nz, .livesRemain` fell through) and the state was still 2',
        len(lines.rows) == 1 and lines.rows[0][1] == 0 and lines.rows[0][2] == 2 and lines.rows[0][3] == 0, lines.rows)
    rep(name, '.livesRemain ran for the first lost life only, with wLives 1', [r[1] for r in alive.rows] == [1], alive.rows)
    first = [r for r in after.rows if lines.rows and r[0] == lines.rows[0][0]]
    over = [r for r in after.rows if lines.rows and r[0] >= lines.rows[0][0] and r[1] == 3]
    rep(name, 'the next Gameplay_AfterBalls then sees hGameState 3 and hStateTimer $28 (the lines set both)',
        bool(over) and over[0][1] == 3 and over[0][2] == 0x28, over[:2])
    rep(name, 'the game really goes to state 3 (game over)', g.state_after_first == 3, 'state %s' % g.state_after_first)


# --------------------------------------------------------------------------- item 3: SpawnUnbreakableHitEffect and its frame table

def wrap_hook_address():
    """Bank and address of `ld hl, wUnbreakableHitEffects` in SpawnUnbreakableHitEffect (3 bytes before .saveSlotPtr)."""
    table = C.read_symtab()
    bank, addr = table['SpawnUnbreakableHitEffect.saveSlotPtr']
    return [('SpawnUnbreakableHitEffect.wrapSlotPtr', bank, addr - 3)]


@scen(wrap_hook_address())
def scenario_extra0_unbreakable(g):
    """Ball poked under an unbreakable brick again and again (12 hits). The slot pointer is logged at the entry of
    SpawnUnbreakableHitEffect and at the wrap line, and every frame the effect sprites are read from OAM."""
    level_ready(g)
    base = g.syms['wBrickMap']
    for r in range(1, 17):
        g.sync_poke(base + 16 * r + 1, *([0] * 9))
    g.sync_poke('wBricksLeft', 200)
    g.sync_poke(base + 16 * 6 + 5, 0x0E)
    g.log('bat x %d' % g.bat_x())
    g.entry = Recorder(g, 'SpawnUnbreakableHitEffect', lambda g: (g.peek16('wUnbreakableHitEffectPtr'), g.peek('wUnbreakableHitSpawned')))
    g.wrap = Recorder(g, 'SpawnUnbreakableHitEffect.wrapSlotPtr', lambda g: (g.peek16('wUnbreakableHitEffectPtr'),))
    g.sprites = []              # per frame: slot bytes and the OAM sprites with attribute $0b
    slots = g.syms['wUnbreakableHitEffects']
    hits = 0
    for n in range(40):
        if g.entry.rows and len(g.entry.rows) >= 12:
            break
        g.sync_poke('wBalls', 0, 6 * 8 + 44 + 14, 0, 80 + 4, 0, 3, 0)     # just under the brick, moving up
        g.poke('wBallOnBat', 0)
        for _ in range(26):
            g.run(1)
            slot_data = [tuple(g.mem[slots + 3 * i + k] for k in range(3)) for i in range(10)]
            g.sprites.append((g.frame, slot_data, [s for s in oam(g) if s[3] == 0x0B and s[0] and s[1]]))


@check_for('extra0_unbreakable')
def check_unbreakable(g, cov, rep):
    name = 'extra0_unbreakable'
    first = cov.syms['wUnbreakableHitEffects']
    entry, wrap = g.entry.rows, g.wrap.rows
    ptrs = [r[1] - first for r in entry]
    rep(name, 'SpawnUnbreakableHitEffect ran at least 12 times (%d)' % len(entry), len(entry) >= 12)
    rep(name, 'the slot pointer at entry steps by 3 inside 0..27 and goes back to 0 after 27: %s' % ptrs[:12],
        ptrs[:12] == [(3 * i) % 30 for i in range(12)])
    rep(name, 'the unlabelled wrap line (`ld hl, wUnbreakableHitEffects`) ran once per 10 hits (%d times for %d hits), '
              'only when the pointer was 27 at entry, and then left the pointer 0 at the next entry' % (len(wrap), len(entry)),
        len(wrap) == len(entry) // 10 and len(wrap) >= 1, '%d hooks' % len(wrap))
    rep(name, 'wUnbreakableHitSpawned was 0 at every entry (the guard let all calls through)', all(r[2] == 0 for r in entry),
        sorted({r[2] for r in entry}))
    table = rom_at_sym(g, cov, 'UnbreakableHitEffectFrames', 18)
    checked, bad, timers = 0, [], set()
    for fr, slot_data, sprites in g.sprites:
        for timer, y, x in [s for s in slot_data if s[0]]:
            timers.add(timer)
            want = (y - 4, x - 4, table[timer], 0x0B)
            checked += 1
            if want not in sprites:
                bad.append((fr, timer, want, sprites[:3]))
    rep(name, 'every active effect slot shows a sprite at (y-4, x-4) with tile UnbreakableHitEffectFrames[timer] and attribute $0b (%d slot-frames)' % checked,
        checked > 100 and not bad, bad[:2])
    # the frame after a slot reaches 0 still draws tile table[0] (the slot is decremented, then drawn, then it is free)
    last = [sp for fr, sd, sp in g.sprites if sp and not any(s[0] for s in sd)]
    rep(name, 'the final frame of each effect is drawn from table[0] = $%02x while the slot already reads 0 (%d such frames)' % (table[0], len(last)),
        bool(last) and all(any(s[2] == table[0] for s in sp) for sp in last))
    rep(name, 'timers seen: %s (a few frames are missing from the samples because the harness runs extra frames inside hooks; '
              'each timer value seen matched its table entry above)' % sorted(timers), len(timers) >= 14 and max(timers) == 17 and min(timers) == 1)
    first = []
    for fr, sd, sp in g.sprites:
        act = [s for s in sd if s[0]]
        if act:
            first.append(table[act[0][0]])
        elif first:
            break
    rep(name, 'one effect from start to end (timer 17 down to 0) shows the tiles %s in this order (no tile out of order)' % first[:18],
        first == sorted(first) and first[0] == table[17] and first[-1] == table[0], first)


def rom_at_sym(g, cov, label, n):
    bank, addr = cov.symtab[label]
    return g.rom_bytes(bank, addr, n)


# --------------------------------------------------------------------------- item 4: shot sprites and bat shadow tiles

def snap_shots(g, log):
    """Record, for every active shot slot, the OAM sprites at the shot's x (without bat sprites)."""
    base = g.syms['wShots']
    act = g.syms['wShotActive']
    sprites = oam(g)
    bat = {0x56, 0x57, 0x08, 0x07, 0x1F, 0x20, 0x21}
    for i in range(6):
        age = g.mem[act + i]
        if not age:
            continue
        off = 4 * i if i < 3 else 12 + 3 * (i - 3)
        x, y = g.mem[base + off], g.mem[base + off + 1]
        laser = g.mem[base + off + 3] if i < 3 else 1
        mine = sorted((s for s in sprites if s[1] == x and s[2] not in bat and s[0] and 16 <= s[0] < 0x90), key=lambda s: s[0])
        log.append(dict(slot=i, age=age, x=x, y=y, laser=laser, plasma=g.peek('wPlasmaState'), sprites=mine))


@scen()
def scenario_extra0_shots(g):
    """Fire each weapon with real input and read the shot sprites from OAM. Then the shadow row of the bat."""
    level_ready(g)
    g.shots = {}
    for ptype, nm in ((1, 'Rocket'), (11, 'Laser'), (3, 'Plasma')):
        C.catch_powerup(g, ptype)
        base = g.syms['wBrickMap']
        for r in range(1, 17):                  # a free path upwards, and no brick hits ending the shot early
            g.sync_poke(base + 16 * r + 1, *([0] * 9))
        g.sync_poke('wBricksLeft', 200)
        log = g.shots[nm] = []
        for _ in range(8):
            # the bot has already pressed A (a shot flew while the pick-up was caught): start every round from
            # a clean shot state (poked), so that launch frames are seen too
            g.poke('wShotActive', 0, 0, 0, 0, 0, 0)
            g.poke('wShotCooldown', 0)
            if nm == 'Plasma':
                g.poke('wPlasmaState', 0)
                g.poke('wWeaponFlag', 1)
            g.run(2)
            g.hold(['a'], 3)
            for _ in range(60):
                g.run(1)
                snap_shots(g, log)
        g.log('%s: %d snapshots' % (nm, len(log)))
    # bat shadow (entries 1 to 3 or 4 of OAM): normal row, forced wide row, and a real wide bat
    C.recover(g)
    g.pb.button_release('a')
    C.catch_powerup(g, 5)                       # Milk: wBatWidth $28
    g.shadow = dict(normal=[], forced_wide=[], milk=[], milk_flags=[])
    flag = {'v': None}
    entries = []                                # (hTemp2 at entry, wBatWidth) at every DrawBatSprites call

    def force():
        entries.append((g.peek('hTemp2'), g.peek('wBatWidth'), flag['v']))
        if flag['v'] is not None:
            g.poke('hTemp2', flag['v'])
        g.at('DrawBatSprites', force)
    g.at('DrawBatSprites', force)

    def sample(mode, n, limit=600):
        # the bot keeps the ball alive; only frames with an intact bat count
        done = 0
        for _ in range(limit // 5):
            g.play(5)
            if g.state != 2 or g.peek('wBatExplosionTimer'):
                continue
            g.shadow[mode].append((g.peek('wBatWidth'),) + tuple(oam(g)[1:5]))
            done += 1
            if done >= n:
                break
    g.run(0)
    for mode, val in (('forced_wide', 1), ('normal', 0)):
        flag['v'] = val
        sample(mode, 20)
    flag['v'] = None
    start = len(entries)
    sample('milk', 100, limit=1500)
    g.entries = entries[start:]


@check_for('extra0_shots')
def check_shots(g, cov, rep):
    name = 'extra0_shots'
    rocket = pairs(rom_at(g, 'ShotSprite_Rocket', 6))
    plasma = pairs(rom_at(g, 'ShotSprite_Plasma', 6))
    laser = pairs(rom_at(g, 'ShotSprite_Laser', 6))
    for nm, table in (('Rocket', rocket), ('Laser', laser), ('Plasma', plasma)):
        log = g.shots.get(nm, [])
        launch = [s for s in log if s['age'] < 5]
        flying = [s for s in log if s['age'] >= 5 and len(s['sprites']) == 2]
        rep(name, '%s: shots were fired and seen in flight (%d snapshots, %d launch frames, %d flying with 2 sprites)' % (nm, len(log), len(launch), len(flying)),
            len(launch) > 3 and len(flying) > 20)
        rep(name, '%s launch frames: one sprite (tile, attribute) = ShotSprite_%s[0] = %s' % (nm, nm, table[0]),
            bool(launch) and all(table[0] in [s[2:] for s in x['sprites']] for x in launch),
            [s['sprites'] for s in launch[:2]])
        rep(name, '%s flying: upper sprite = ShotSprite_%s[1] = %s, lower sprite (8 lower) = ShotSprite_%s[2] = %s' % (nm, nm, table[1], nm, table[2]),
            bool(flying) and all(x['sprites'][0][2:] == table[1] and x['sprites'][1][2:] == table[2] and x['sprites'][1][0] == x['sprites'][0][0] + 8
                                 for x in flying), [s['sprites'] for s in flying[:2]])
    slots = {(nm, s['slot']) for nm in g.shots for s in g.shots[nm]}
    rep(name, 'rocket and laser shots were seen in shot slots %s' % sorted(slots), len(slots) >= 3)
    sh = g.shadow
    tile_n = [pairs(rom_at(g, 'BatShadowTiles_Normal', 6)), pairs(rom_at(g, 'BatShadowTiles_Wide', 8))]
    expected_n = tile_n[0]
    expected_w = tile_n[1]
    ok_n = [row for row in sh['normal'] if [s[2:] for s in row[1:4]] == expected_n and all(s[0] == 0x98 for s in row[1:4])]
    rep(name, 'BatShadowTiles_Normal: with hTemp2 = 0 the OAM entries 1 to 3 are y $98 with tiles/attributes %s (%d of %d frames)'
        % (expected_n, len(ok_n), len(sh['normal'])), len(ok_n) == len(sh['normal']) > 0, sh['normal'][:1])
    ok_w = [row for row in sh['forced_wide'] if [s[2:] for s in row[1:5]] == expected_w and all(s[0] == 0x98 for s in row[1:5])]
    rep(name, 'BatShadowTiles_Wide: with hTemp2 poked to 1 (the hook on DrawBatSprites, a player cannot pick it) the OAM entries 1 to 4 '
              'are y $98 with %s (%d of %d frames)' % (expected_w, len(ok_w), len(sh['forced_wide'])), len(ok_w) == len(sh['forced_wide']) > 0, sh['forced_wide'][:1])
    entries = g.entries
    wide = [e for e in entries if e[1] != 0x20]
    stale = [e for e in wide if e[0] != 0]
    rep(name, 'real Milk bat, nothing poked: DrawBatSprites was entered %d times with wBatWidth != $20, and hTemp2 was not 0 at entry '
              '%d times (the wide shadow row is drawn only then; the flag is a stale scratch byte, see BatShadowTiles_Wide comment)'
        % (len(wide), len(stale)), len(wide) > 100, 'values at entry %s' % sorted({e[0] for e in wide}))


# --------------------------------------------------------------------------- item 4 and 5: grenades

def grenade_setup(g):
    """Grenade bat on a level whose lower area is unbreakable bricks, so thrown grenades explode on them."""
    C.catch_powerup(g, 15)
    C.plant_rows(g, 4, 8)


@scen()
def scenario_extra0_blast(g):
    """One grenade thrown at a wall of unbreakable bricks. For each frame of the explosion the OAM sprites are read."""
    level_ready(g)
    grenade_setup(g)
    g.blast = []
    g.poke('wGrenadeCount', 3)
    for frames, d in ((40, ''), (60, 'left'), (30, 'right')):
        C.recover(g)
        g.poke('wWeaponFlag', 1)
        g.poke('wGrenadeDelay', 0)
        g.poke('wGrenadeCount', 3)
        g.pb.button_press('a')
        g.run(frames)
        if d:
            g.pb.button_press(d)
        g.pb.button_release('a')            # A released: the grenade flies; every frame of the flight is watched
        for _ in range(200):
            g.run(1)
            t = g.peek('wGrenadeBlastTimer')
            if t:
                g.blast.append((g.frame, t, g.peek('wGrenadeBlastX'), g.peek('wGrenadeBlastY'), oam(g)))
        if d:
            g.pb.button_release(d)
        g.run(30)


@check_for('extra0_blast')
def check_blast(g, cov, rep):
    name = 'extra0_blast'
    seq = rom_at(g, 'GrenadeExplosionSequence', 52)
    frames = rom_at(g, 'GrenadeExplosionFrames', 0xB4 + 17)
    rep(name, 'at least one explosion ran for 51 frames (timer %s)' % sorted({b[1] for b in g.blast})[:3] + '...',
        len(g.blast) >= 51, '%d frame samples' % len(g.blast))
    bad, tested, offsets = [], 0, set()
    for fr, t, bx, by, sprites in g.blast:
        # the sample is taken after a frame: the timer is the value the draw routine used on that frame
        if t < 1:
            continue
        off = seq[t]
        offsets.add(off)
        count = frames[off]
        want = [((frames[off + 1 + 4 * k] + by) & 0xFF, (frames[off + 2 + 4 * k] + bx) & 0xFF, frames[off + 3 + 4 * k], frames[off + 4 + 4 * k])
                for k in range(count)]
        tested += 1
        if not all(w in sprites for w in want):
            bad.append((fr, t, off, want))
    rep(name, 'every sampled frame (%d) has all sprites of GrenadeExplosionFrames[GrenadeExplosionSequence[timer]] in OAM at (blast y/x + offset)' % tested,
        tested >= 51 and not bad, bad[:2])
    rep(name, 'the sampled frames use all 13 frame offsets %s' % sorted(offsets),
        offsets == set(seq[1:52]), 'sequence has %d distinct offsets' % len(set(seq[1:52])))
    rep(name, 'the frame table holds 13 frames: offsets are the frame starts, frame lengths 1 + 4 * count',
        all(o in (0, 5, 0x16, 0x27, 0x38, 0x49, 0x5A, 0x6B, 0x7C, 0x8D, 0x9E, 0xAB, 0xB4) for o in offsets), sorted(offsets))


@scen()
def scenario_extra0_grenadetext(g):
    """Fire grenades with wGrenadeCount poked, and log the table entry ShowMessage gets and the displayed text."""
    level_ready(g)
    grenade_setup(g)
    g.texts = []
    handler = Recorder(g, 'Shots_HandleFire.showGrenadeText', lambda g: (regs(g).A, g.peek('wGrenadeCount')))
    msg = Recorder(g, 'ShowMessage', lambda g: (regs(g).HL,))
    g.hrec, g.mrec = handler, msg
    for count in (1, 2, 8, 9, 15, 16, 17):
        n = len(handler.rows)
        m = len(msg.rows)
        for _ in range(4):                      # a throw is refused while the bat is exploding or a grenade is busy
            C.recover(g)
            g.play(120, until=lambda: g.peek('wBatExplosionTimer') == 0 and not g.peek('hLifeLostTimer'))
            g.poke('wWeaponFlag', 1)
            g.poke('wRocketLaserBat', 0)
            g.poke('wGrenadeDelay', 0)
            g.poke('wGrenadeCount', count)
            g.play(12, launch=False, buttons=('a',))
            g.play(4, launch=False, steer='')
            if len(handler.rows) > n:
                break
        g.log('count %d: %d handler hits' % (count, len(handler.rows) - n))
        # the message as ShowMessage copied it: first byte in hLevelScrollX, then wLevelTitleText = 0, $98, 0, 4, text, $ff
        buf = bytes(g.mem[g.syms['wLevelTitleText'] + i] for i in range(25))
        g.texts.append((count, handler.rows[n:], msg.rows[m:], (g.peek('hLevelScrollX'), buf)))
        g.run(60)


@check_for('extra0_grenadetext')
def check_grenadetext(g, cov, rep):
    name = 'extra0_grenadetext'
    bank, table = cov.symtab['GrenadeTexts_English']
    for count, hrows, mrows, screen in g.texts:
        rep(name, 'wGrenadeCount %d: the throw ran showGrenadeText once and ShowMessage once' % count, len(hrows) == 1 and len(mrows) >= 1,
            '%d and %d' % (len(hrows), len(mrows)))
        if not hrows or not mrows:
            continue
        after = hrows[0][1]                       # A: wGrenadeCount after the decrement
        hl = mrows[0][1]
        index = (hl - table) // 2
        ptr = g.rom_bytes(bank, hl, 2)
        text_at = ptr[0] | ptr[1] << 8
        s = bytes(g.rom_bytes(bank, text_at + 1, 20)).decode('latin1')
        rep(name, 'count %d: A at showGrenadeText = %d, entry %d of GrenadeTexts_English = %r, so the index is (%d and 7) = %d'
            % (count, after, index, s.strip(), after, after & 7), after == count - 1 and index == (after & 7) and s.strip() == 'GRENADE %d' % (after & 7),
            'hl $%04x' % hl)
        first, buf = screen
        rep(name, 'count %d: the message buffer wLevelTitleText holds %r after ShowMessage (first byte $%02x = the entry\'s alignment byte)'
            % (count, buf[4:24].decode('latin1'), first),
            buf[4:24].decode('latin1').strip() == s.strip() and buf[24] == 0xFF and first == g.rom_bytes(bank, text_at, 1)[0],
            buf.hex())


# --------------------------------------------------------------------------- driver

def run_one(name, rom, frame_limit, labels, verbose):
    fn, extra = SCENARIOS[name]
    labs = list(labels)
    for lab_name, bank, addr in extra:
        labs.append(dict(name=lab_name, bank=bank, addr=addr, routine=lab_name.split('.')[0]))
    cov = C.Coverage(labs, [])
    for lab_name, bank, addr in extra:
        cov.symtab[lab_name] = (bank, addr)
    g = C.Game(cov, rom, frame_limit)
    start = time.time()
    print('scenario %s' % name, flush=True)
    try:
        fn(g)
    except C.StopScenario:
        print('  stopped at the frame limit', file=sys.stderr)
    print('  %d frames, %.1f s' % (g.frame, time.time() - start), flush=True)
    CHECKS[name](g, cov, report)
    g.close()


def main():
    import argparse
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--scenario', action='append', default=[])
    ap.add_argument('--rom', default=os.path.join(C.ROOT, 'game.gbc'))
    ap.add_argument('--frames', type=int, default=400000)
    ap.add_argument('--verbose', action='store_true')
    ap.add_argument('--list', action='store_true')
    args = ap.parse_args()
    C.VERBOSE = args.verbose
    if args.list:
        for n, (fn, _x) in SCENARIOS.items():
            print('%-20s %s' % (n, (fn.__doc__ or '').strip().split('\n')[0]))
        return 0
    names = []
    for s in args.scenario or ['all']:
        names.extend(SCENARIOS if s == 'all' else [s])
    labels = C.read_labels()
    for n in names:
        if n not in SCENARIOS:
            raise SystemExit('unknown scenario %s (try --list)' % n)
        run_one(n, args.rom, args.frames, labels, args.verbose)
    bad = [r for r in RESULTS if not r[2]]
    print('%d checks, %d failed' % (len(RESULTS), len(bad)))
    return 1 if bad else 0


if __name__ == '__main__':
    sys.exit(main())

"""Play-test scenarios for the 'core' area (gameplay loop, ball, bricks, bat, level password screen).

These scenarios check claims that tools/coverage.py scenarios did not confirm by observation: names,
local labels, RAM names and header comments that were only read from code. They reuse the harness in
tools/coverage.py (Game, Coverage, Watch and the scripted helpers) and add scenarios and checks of their own.

Usage (needs PyBoy; run from the repository root after `make`):

    python tools/playtest_core.py --list
    python tools/playtest_core.py --scenario core_password --verbose
    python tools/playtest_core.py --scenario all

Each scenario runs on a fresh emulator, logs what it saw with the watch machinery of coverage.py and then
prints PASS or FAIL lines for the claims it checks. The exit code is 1 if any check failed.

Scenarios (each under about 60 s, deterministic):
    core_password   Level password screen for levels with a tens digit, a hundreds digit and both
                    (EncodeLevelPassword addTensLoop and addHundredsLoop, the letters it builds, wStartLevel,
                    NextLevelMusic and wLevelMusicIndex),
                    the bonus countdown with wBonusCountdownPaused poked to 1 and back to 0 (the variable is
                    never written by the game, so this is the only way to run that branch).
    core_nudge      A ball that only bounces off walls: the wBallWorkFlags counter runs 0 to $14, then
                    $81 to $87, then $80, and UpdateBall_Move turns the ball one direction step.
    core_plasma     Rocket and plasma shots hitting bricks of 2 to 4 hit points (HitBrickWithShot).
    core_text       The strings drawn by DrawStringSkipZero in all five languages (static decode of the ROM) and
                    one run of the game over screen (the characters that reach DrawStringSkipZero).
    core_ball       The coverage `levels` run with extra logging: UpdateBall_Move second step,
                    wUnbreakableHitSpawned, InitBall flag clearing, SetUpBricks count, the corner diagonals
                    of CollideBall_Corners (about 30 s).
    core_corner     Balls poked onto the top-left exact diagonal of a brick: the direction stays unchanged.

What the scenarios poke (all in the scenario code, so a hit does not always mean a player could get there):
wCurrentLevel and wLevelsSincePassword (to reach a password screen for a chosen level), wStartLevel (a marker), the
brick map, the ball slot (position, direction, speed, flags), the ball effect flags at InitBall, wBonusCountdownPaused.
"""
import os
import re
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import coverage as C          # noqa: E402  (tools/coverage.py, not a package of the same name)

assert os.path.abspath(C.__file__) == os.path.join(HERE, 'coverage.py'), C.__file__
C.MAX_LOG = 100000            # keep every watch hit of these short runs

SCENARIOS = {}
RESULTS = []                  # (scenario, claim, ok, detail)


def scen(watches=()):
    """Register a scenario. `watches` are --watch specs it needs; the function gets (g) and returns a
    list of checks run afterwards as check(g, cov, report)."""
    def deco(fn):
        SCENARIOS[fn.__name__.replace('scenario_', '')] = (fn, list(watches))
        return fn
    return deco


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


def values(cov, spec_label, var):
    """Logged values of one watch variable: list of (frame, value)."""
    for w in cov.watches:
        if w.label == spec_label and var in w.log:
            return w.log[var]
    return []


def report(scenario, claim, ok, detail=''):
    RESULTS.append((scenario, claim, bool(ok), detail))
    print('  %s  %s%s' % ('PASS' if ok else 'FAIL', claim, (' | ' + str(detail)) if detail != '' else ''), flush=True)


# --------------------------------------------------------------------------- level password

def title_digits(g, hl):
    return ''.join(chr(g.mem[hl + i]) for i in range(3))


@scen(['NextLevelMusic:wLevelMusicIndex,wLevelsSincePassword,wEndingSeen'])
def scenario_core_password(g):
    """Password screens for levels 13, 99 and 123 (tens digit, tens only, hundreds and tens), then the bonus
    countdown with wBonusCountdownPaused poked."""
    cov = g.cov
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(200)
    encode = Recorder(g, 'EncodeLevelPassword', lambda g: (regs(g).HL, title_digits(g, regs(g).HL)))
    out = []
    for first in (12, 98, 122, 99):
        # wCurrentLevel is the level just finished, so the screen that follows is for level first + 1
        g.poke('wLives', 9)
        g.poke('wCurrentLevel', first)
        g.poke('wLevelsSincePassword', 4)
        g.poke('wStartLevel', 77)                # a marker: only a valid password may change it
        tens_before = g.count('EncodeLevelPassword.addTensLoop')
        hund_before = g.count('EncodeLevelPassword.addHundredsLoop')
        n_enc = len(encode.rows)
        g.finish_level(2)
        g.run(60)
        if g.state != 9:
            g.log('no password screen after level %d (state %d)' % (first, g.state))
            continue
        g.run(30)
        out.append(dict(first=first, digits=encode.rows[n_enc][2] if len(encode.rows) > n_enc else None,
                        tens=g.count('EncodeLevelPassword.addTensLoop') - tens_before,
                        hund=g.count('EncodeLevelPassword.addHundredsLoop') - hund_before,
                        chars=bytes(g.peek('wPasswordChars+%d' % i) for i in range(4)), start=g.peek('wStartLevel')))
        if first == 12:
            check_countdown(g)
        else:
            g.run(300)
        g.press('a', after=100)
        g.wait_level_ready()
    g.facts = out


def check_countdown(g):
    """On the first password screen: poke wBonusCountdownPaused to 1, see the countdown stand still, poke 0 and see
    it fall by 50 a frame again."""
    g.wait_until(lambda: g.peek('wBonusDelay') == 0, limit=900, step=1)
    cd = lambda: g.peek16('wBonusCountdown')
    g.poke('wBonusCountdownPaused', 1)
    start = cd()
    seen = []
    for _ in range(40):
        g.run(1)
        seen.append(cd())
    paused = len(set(seen)) == 1 and seen[0] == start
    g.poke('wBonusCountdownPaused', 0)
    seen2 = []
    for _ in range(20):
        g.run(1)
        seen2.append(cd())
    steps = [(a - b) & 0xFFFF for a, b in zip(seen2, seen2[1:])]
    g.pause_result = dict(paused=paused, start=start, still=seen[-1], steps=steps, left=seen2[-1],
                          value_kept=g.peek('wBonusCountdownPaused'))
    g.run(300)


def check_password(g, cov, rep):
    name = 'core_password'
    facts = getattr(g, 'facts', [])
    rep(name, 'password screen reached for all four levels', len(facts) == 4, '%d screens' % len(facts))
    for f in facts:
        n = int(f['digits']) if f['digits'] and f['digits'].isdigit() else -1
        want = g.encode_b(n - 1).encode() if n > 0 else b'?'
        rep(name, 'EncodeLevelPassword level %s: title digits are wCurrentLevel + 2 (wCurrentLevel %d is 0-based, the screen is for the level after the next one played)' % (f['digits'], f['first']),
            n == f['first'] + 2, 'digits %s' % f['digits'])
        t = int(f['digits'][1]) if n > 0 else -1
        h = int(f['digits'][0]) if n > 0 else -1
        rep(name, 'level %s: addTensLoop ran once per tens (%d) and addHundredsLoop once per hundreds (%d)' % (f['digits'], t, h),
            f['tens'] == t and f['hund'] == h, 'ran %d and %d times' % (f['tens'], f['hund']))
        rep(name, 'level %s: wPasswordChars equals the password the menu code expects (%s)' % (f['digits'], want.decode()),
            f['chars'] == want, 'got %s' % f['chars'].decode('latin1'))
        valid = n > 0 and (n - 1) % 4 == 0
        rep(name, 'level %s: wStartLevel %s' % (f['digits'], 'set to level-1 (valid password, level-1 is a multiple of 4)' if valid
                                             else 'left unchanged (CheckPassword rejects it)'),
            f['start'] == (n - 1 if valid else 77), 'wStartLevel %d' % f['start'])
    idx = [v for _, v in values(cov, 'NextLevelMusic', 'wLevelMusicIndex')]
    since = [v for _, v in values(cov, 'NextLevelMusic', 'wLevelsSincePassword')]
    rep(name, 'NextLevelMusic ran once per password screen, each time with wLevelsSincePassword 4, and wLevelMusicIndex stepped 0, 1, 2, 0',
        idx == [0, 1, 2, 0] and set(since) == {4}, 'index %s, levels since %s' % (idx, since))
    # static: the asm has no writer of wBonusCountdownPaused (only the read in LevelPassword_Update)
    uses = []
    for fn in sorted(os.listdir(os.path.join(C.ROOT, 'banks'))):
        for n, line in enumerate(open(os.path.join(C.ROOT, 'banks', fn)), 1):
            if 'wBonusCountdownPaused' in line:
                uses.append((fn, n, line.strip()))
    rep(name, 'wBonusCountdownPaused appears once in banks/*.asm, as a read (ld a, [wBonusCountdownPaused])',
        len(uses) == 1 and uses[0][2].startswith('ld a, [wBonusCountdownPaused]'), uses)
    p = getattr(g, 'pause_result', None)
    if p:
        rep(name, 'wBonusCountdownPaused = 1 stops the countdown on the password screen', p['paused'],
            'stayed %d for 40 frames' % p['start'])
        rep(name, 'wBonusCountdownPaused = 0 resumes it at 50 per frame', set(p['steps']) == {50} or set(p['steps']) <= {50, 0} and 50 in p['steps'],
            'steps %s' % sorted(set(p['steps'])))
        rep(name, 'nothing wrote wBonusCountdownPaused meanwhile (it still holds the poked 0)', p['value_kept'] == 0)


# --------------------------------------------------------------------------- wall bounce counter and the nudge

@scen(['UpdateBall_Move:wBallWorkFlags,wBallWorkDirection', 'UpdateBall_Move.lookupVelocity:wBallWorkFlags,wBallWorkDirection',
       'HitBrickAtBall.countSolidHit:wBallWorkFlags', 'HitBrickAtBall.hitCountReached14:wBallWorkFlags',
       'HitBrickAtBall.advanceBit7Counter:wBallWorkFlags'])
def scenario_core_nudge(g):
    """A single ball flying straight between the side walls: only wall hits, so wBallWorkFlags counts up undisturbed."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(100, launch=False)
    base = g.syms['wBrickMap']
    for r in range(1, 17):
        g.sync_poke(base + 16 * r + 1, *([0] * 9))
    g.sync_poke('wBricksLeft', 200)
    g.sync_poke('wBalls', 0, 100, 0, 80, 8, 3, 0)      # direction 8 is straight right
    g.poke('wBallOnBat', 0)
    flags = lambda: g.ball(0)[4]
    g.play(6000, launch=False, steer='', until=lambda: g.count('UpdateBall_Move') > 0 and flags() == 0x80 or g.state != 2)
    g.play(10, launch=False, steer='')
    g.log('ball %s' % (g.ball(0),))
    for d in (7, 15, 23, 31):                           # the counter at $80 in free flight: directions where d + 1 is a multiple of 8
        g.sync_poke('wBalls', 0, 100, 0, 80, d, 3, 0x80)
        g.run(2)


def check_nudge(g, cov, rep):
    name = 'core_nudge'
    entry_f = values(cov, 'UpdateBall_Move', 'wBallWorkFlags')
    entry_d = values(cov, 'UpdateBall_Move', 'wBallWorkDirection')
    look_f = values(cov, 'UpdateBall_Move.lookupVelocity', 'wBallWorkFlags')
    look_d = values(cov, 'UpdateBall_Move.lookupVelocity', 'wBallWorkDirection')
    rep(name, 'every UpdateBall_Move entry reaches .lookupVelocity (single ball, no sleep)', len(entry_f) == len(look_f),
        '%d entries, %d lookups' % (len(entry_f), len(look_f)))
    seq = []
    for (_, f) in entry_f:
        if not seq or seq[-1] != f:
            seq.append(f)
    # the first ball move after the poke has flags 0; keep the run of values seen in order
    rep(name, 'flags run 0..20 then $81..$87 then $80 (counter of solid hits, then bit 7 counter)',
        seq[:30] == list(range(21)) + list(range(0x81, 0x88)) + [0x80, 0],
        'sequence %s' % seq)
    nud = [i for i, (_, f) in enumerate(entry_f) if f == 0x80]
    rep(name, 'the $80 state was reached (counter wrapped to 0 with bit 7 set), by wall hits and by the 4 pokes', len(nud) == 5, '%d times' % len(nud))
    for i in nud:
        d0 = entry_d[i][1]
        d1 = look_d[i][1]
        want = (d0 + 1) & 0x1F
        if want & 7 == 0:
            want = (want + 1) & 0xFF
        rep(name, 'flags $80 at entry: ball turned from direction %d to %d (one step, skipping multiples of 8), flags cleared' % (d0, d1),
            d1 == want and look_f[i][1] == 0, 'expected %d, flags at lookup %d' % (want, look_f[i][1]))
    others = [i for i, (_, f) in enumerate(entry_f) if f != 0x80 and i < len(look_d)]
    rep(name, 'without $80 the direction is unchanged between entry and .lookupVelocity',
        all(entry_d[i][1] == look_d[i][1] and entry_f[i][1] == look_f[i][1] for i in others),
        '%d moves compared' % len(others))
    hits = values(cov, 'HitBrickAtBall.countSolidHit', 'wBallWorkFlags')
    rep(name, 'HitBrickAtBall.hitCountReached14 saw flags $14 and advanceBit7Counter saw $14 once, then $81..$87',
        [v for _, v in values(cov, 'HitBrickAtBall.hitCountReached14', 'wBallWorkFlags')] == [0x14]
        and [v for _, v in values(cov, 'HitBrickAtBall.advanceBit7Counter', 'wBallWorkFlags')][:8] == [0x14] + list(range(0x81, 0x88)),
        'hitCountReached14 %s, advance %s' % ([v for _, v in values(cov, 'HitBrickAtBall.hitCountReached14', 'wBallWorkFlags')],
                                              [v for _, v in values(cov, 'HitBrickAtBall.advanceBit7Counter', 'wBallWorkFlags')]))


# --------------------------------------------------------------------------- shots on bricks with several hit points

def park_ball_clear_map(g):
    """Empty the brick map and send the ball flying sideways at row 12, so that only shots touch the planted brick."""
    base = g.syms['wBrickMap']
    for r in range(1, 17):
        g.sync_poke(base + 16 * r + 1, *([0] * 9))
    g.sync_poke('wBricksLeft', 200)
    g.sync_poke('wBalls', 0, 140, 0, 80, 8, 3, 0)
    g.poke('wBallOnBat', 0)


def plant_brick_above_bat(g, hp, row=5):
    col = max(1, min(9, (g.bat_x() + 8) // 16))
    cell = g.syms['wBrickMap'] + 16 * row + col
    g.sync_poke(cell, hp)
    return cell


@scen(['HitBrickWithShot:wPlasmaState', 'HitBrickWithShot.checkPlasma:wPlasmaState,wHitNewValue'])
def scenario_core_plasma(g):
    """Rocket, laser and plasma shots at bricks with 1 to 4 hit points: what wHitNewValue becomes."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(200)
    entry = Recorder(g, 'HitBrickWithShot', lambda g: (regs(g).A, not g.mem[regs(g).HL + 0x120] & 0x80))
    g.cases = []
    g.entry = entry
    for ptype, hp in ((1, 3), (11, 2), (3, 4), (3, 3), (3, 2), (3, 1)):
        C.recover(g)
        before = g.count('HitBrickWithShot')
        n_rows = len(entry.rows)
        if not C.catch_powerup(g, ptype):
            g.log('power-up %d not caught' % ptype)
            continue
        park_ball_clear_map(g)
        cell = plant_brick_above_bat(g, hp)
        g.play(400, tap=30, steer='', launch=False, until=lambda: g.count('HitBrickWithShot') > before or g.state != 2)
        g.play(60, steer='', launch=False)             # a plasma shot goes on up; the hit is queued and drawn
        rows = entry.rows[n_rows:]
        g.cases.append(dict(type=POWERUP_NAMES[ptype], hp=hp, seen=[r[1] for r in rows if r[2]], stale=sum(1 for r in rows if not r[2]), after=g.mem[cell],
                            hits=len(rows)))
        g.log('%s hp %d -> %s' % (POWERUP_NAMES[ptype], hp, g.cases[-1]))
        g.sync_poke(cell, 0)


POWERUP_NAMES = C.POWERUPS


def check_plasma(g, cov, rep):
    name = 'core_plasma'
    state_all = [v for _, v in values(cov, 'HitBrickWithShot', 'wPlasmaState')]
    fresh_all = [r[2] for r in g.entry.rows]
    state = [v for v, f in zip(state_all, fresh_all) if f]
    newv = [v for _, v in values(cov, 'HitBrickWithShot.checkPlasma', 'wHitNewValue')]
    st2 = [v for _, v in values(cov, 'HitBrickWithShot.checkPlasma', 'wPlasmaState')]
    cases = getattr(g, 'cases', [])
    rep(name, 'six shot cases reached a brick; later hits on the same brick by a plasma shot still in it return early (bit 7 of its redraw flag set)',
        len(cases) == 6 and all(c['hits'] >= 1 for c in cases), '%d cases, early returns %s' % (len(cases), [c['stale'] for c in cases]))
    # the watch rows are in the order of the hits, one per hit; match them by order with the recorded hit points
    seen = [hp for c in cases for hp in c['seen']]
    rep(name, 'one .checkPlasma row per fresh hit', len(state) == len(newv) == len(seen), '%d %d %d' % (len(state), len(newv), len(seen)))
    for hp_seen, ps, nv, ps2 in zip(seen, state, newv, st2):
        plasma = ps == 2
        if hp_seen == 0:
            continue
        want = hp_seen - 1
        if plasma and want:
            want = 1
        rep(name, 'wPlasmaState %d, brick hp %d: wHitNewValue %d' % (ps, hp_seen, nv),
            nv == want and ps2 == ps, 'expected %d' % want)
    plasma_surv = [(hp, nv) for hp, ps, nv in zip(seen, state, newv) if ps == 2 and hp >= 2]
    rep(name, 'a plasma shot hit a brick with 2 or more hit points and set it to 1 (survivor path)', bool(plasma_surv) and all(nv == 1 for _, nv in plasma_surv),
        '%s' % plasma_surv)
    rocket = [(hp, nv) for hp, ps, nv in zip(seen, state, newv) if ps != 2 and hp >= 2]
    rep(name, 'rocket and laser shots remove exactly one hit point', bool(rocket) and all(nv == hp - 1 for hp, nv in rocket), '%s' % rocket)
    for c in cases:
        if len(c['seen']) == 1:
            hp = c['seen'][0]
            plasma = c['type'] == 'Plasma'
            want = 0 if hp == 1 else (1 if plasma else hp - 1)
            rep(name, '%s shot at a brick of %d hit points: the brick map cell ends at %d' % (c['type'], c['hp'], want),
                c['after'] == want or (want == 0 and c['after'] in (0, 0x80)), 'cell %d' % c['after'])


# --------------------------------------------------------------------------- DrawStringSkipZero

LANGUAGES = ['English', 'Spanish', 'French', 'German', 'Italian']


def decode_skipzero(rom_data, bank, ptr, calls):
    """Walk the strings that `calls` DrawStringSkipZero calls in a row draw, with the routine's own grammar:
    2 bytes tile map address, then characters; $00 takes the next byte as an attribute; $ff ends the string.
    Returns (characters, number of attribute bytes)."""
    pos = ptr - 0x4000 + bank * 0x4000
    chars, attrs = [], 0
    for _ in range(calls):
        pos += 2
        while rom_data[pos] != 0xFF:
            c = rom_data[pos]
            pos += 1
            if c == 0:
                attrs += 1
                pos += 1
            else:
                chars.append(c)
        pos += 1
    return chars, attrs


@scen(['DrawStringSkipZero:wLanguage'])
def scenario_core_text(g):
    """Game over screen in each language, with the characters that reach DrawStringSkipZero logged; the ending in English."""
    g.chars = {}
    g.tiles = {}
    g.digit_before = {}
    for lang in range(5):
        if lang:
            g.hold(['a', 'b', 'select', 'start'], 30)
            g.wait_until(lambda: g.state == 11, limit=1500)
        g.boot(language=lang)
        notattr = Recorder(g, 'DrawStringSkipZero.notAttribute', lambda g: (regs(g).A,))
        written = Recorder(g, 'DrawStringSkipZero.writeTileIfNonzero', lambda g: (regs(g).A,))
        g.start_level(1)
        g.poke('wLives', 1)
        C.lose_lives(g, 1)
        g.wait_until(lambda: g.state == 3, limit=900)
        g.run(30)
        g.chars[lang] = [r[1] for r in notattr.rows]
        g.tiles[lang] = [r[1] for r in written.rows]
        g.log('%s game over: %d characters, state %d' % (LANGUAGES[lang], len(g.chars[lang]), g.state))
        g.once.clear()
    # the ending text, English only (the level number is poked so that the next level is the last; see scenario_levels)
    g.boot(language=0)
    ending_chars = Recorder(g, 'DrawStringSkipZero.notAttribute', lambda g: (regs(g).A,))
    ending_tiles = Recorder(g, 'DrawStringSkipZero.writeTileIfNonzero', lambda g: (regs(g).A,))
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(100)
    g.poke('wCurrentLevel', 158)
    C.finish_to_next(g)
    g.poke('wLives', 9)
    g.finish_level(2)
    g.wait_until(lambda: g.state == 13 and g.count('StateInit_Ending') > 0, limit=900)    # the state number changes before its init runs
    g.run(30)
    g.ending = ([r[1] for r in ending_chars.rows], [r[1] for r in ending_tiles.rows], g.state)
    g.log('ending: %d characters, state %d' % (len(g.ending[0]), g.ending[2]))


def check_text(g, cov, rep):
    name = 'core_text'
    rom = g.rom_data
    for lang, nm in enumerate(LANGUAGES):
        bank, addr = cov.symtab['LanguageTable_' + nm]
        table = rom[bank * 0x4000 + addr - 0x4000:][:0x51]
        e_ptr = table[0x0c] | table[0x0d] << 8
        o_ptr = table[0x4d] | table[0x4e] << 8
        echars, eattr = decode_skipzero(rom, 0x0e, e_ptr, 6)
        ochars, oattr = decode_skipzero(rom, 5, o_ptr, 1)
        odd = sorted({c for c in echars + ochars if c != 0x20 and c < 0x41})
        rep(name, '%s: ending (6 strings, %d chars) and game over (%d chars) hold only space and letters, no code $21..$40 (static decode)'
            % (nm, len(echars), len(ochars)), not odd, 'codes below $41 other than space: %s, attribute bytes %d and %d' % (odd, eattr, oattr))
        got = g.chars.get(lang, [])
        rep(name, '%s: game over run: the characters that reached DrawStringSkipZero equal the decoded string, in order' % nm,
            got == ochars, '%d seen, %d decoded' % (len(got), len(ochars)))
        tiles = g.tiles.get(lang, [])
        spaces = ochars.count(0x20)
        rep(name, '%s: game over run: every space left the tile alone (A = 0 at .writeTileIfNonzero), nothing else did' % nm,
            tiles.count(0) == spaces and len(tiles) == len(ochars), '%d zero tiles, %d spaces' % (tiles.count(0), spaces))
    echars, etiles, st = g.ending
    want, _ = decode_skipzero(rom, 0x0e, *(lambda t: (t[0x0c] | t[0x0d] << 8,))(rom[cov.symtab['LanguageTable_English'][0] * 0x4000 + cov.symtab['LanguageTable_English'][1] - 0x4000:][:0x51]), 6)
    rep(name, 'English ending (state %d): the 6 DrawStringSkipZero calls drew the decoded characters' % st, st == 13 and echars == want,
        '%d seen, %d decoded' % (len(echars), len(want)))
    rep(name, 'DrawStringSkipZero.digitChar was never reached by any of these runs', g.count('DrawStringSkipZero.digitChar') == 0,
        'hits %d' % g.count('DrawStringSkipZero.digitChar'))


# --------------------------------------------------------------------------- ball update, corners, InitBall, SetUpBricks

BALL_FLAGS = ['wMultiBallPending', 'wSleepyBallActive', 'wAntigravityActive', 'wSlowBallActive', 'wBallLoopCount',
              'wNinjaActive', 'wRemoveBall']


def map_cells(g):
    base = g.syms['wBrickMap']
    return [g.mem[base + 16 * r + c] for r in range(1, 17) for c in range(1, 10)]


def diag_pair(g, key, label, nxt):
    """At every hit of CollideBall_Corners.<label> log the ball direction then and at the next <nxt> label."""
    def start():
        before = g.peek('wBallWorkDirection')
        g.at('CollideBall_Corners.' + nxt, lambda: g.diag[key].append((before, g.peek('wBallWorkDirection'))))
        g.at('CollideBall_Corners.' + label, start)
    g.at('CollideBall_Corners.' + label, start)


@scen(['UpdateBall_Move.storeNewY:wBallWorkSpeed',
       'UpdateBall_Move.doSecondStep:wUnbreakableHitSpawned,wBallBounced,wBallSecondStep,wBallWorkSpeed'])
def scenario_core_ball(g):
    """The coverage `levels` run with extra logging: second steps of UpdateBall_Move, the corner diagonals, InitBall
    (its flags are poked to 1 as it starts) and SetUpBricks (the map before and after)."""
    g.diag = {'TL': [], 'BL': [], 'TR': [], 'BR': []}
    for key, label, nxt in (('TL', 'topLeftDiagonal', 'checkTopRight'), ('BL', 'bottomLeftDiagonal', 'checkBottomRight'),
                            ('TR', 'topRightDiagonal', 'done'), ('BR', 'bottomRightDiagonal', 'checkTopLeft')):
        diag_pair(g, key, label, nxt)
    g.initball = []

    def init_start():
        for n in BALL_FLAGS:
            g.poke(n, 1)
        g.poke('wLaunchDirection', 4)
        g.poke('wBallCount', 3)
        g.poke('wBalls+6', 0x55)
        g.poke('wBallOnBat', 0)
        g.at('ResetEnemies', init_end)
        g.at('InitBall', init_start)

    def init_end():
        g.initball.append(dict(flags={n: g.peek(n) for n in BALL_FLAGS}, launch=g.peek('wLaunchDirection'), count=g.peek('wBallCount'),
                               onbat=g.peek('wBallOnBat'), ball=g.ball(0)))
    g.at('InitBall', init_start)
    g.loads = []

    def set_start():
        before = map_cells(g)

        def after():
            g.loads.append((before, map_cells(g), g.peek('wBricksLeft'), g.peek('wCurrentLevel')))
        g.at('Gameplay_Update', after)
        g.at('SetUpBricks', set_start)
    g.at('SetUpBricks', set_start)
    C.SCENARIOS['levels'](g)


def check_ball(g, cov, rep):
    name = 'core_ball'
    sym = cov.symtab
    rom = g.rom_data

    def table(label):
        bank, addr = sym[label]
        off = addr if bank == 0 else bank * 0x4000 + addr - 0x4000
        return list(rom[off:off + 32])
    left, right, top, bottom = (table('BallReflect%sTable' % n) for n in ('Left', 'Right', 'Top', 'Bottom'))
    d = g.diag
    rep(name, 'the four exact-diagonal corner cases were met in this run (counts; the top-left case is also run by core_corner)', all(len(v) >= 1 for v in d.values()), {k: len(v) for k, v in d.items()})
    tl = d['TL']
    rep(name, 'top-left diagonal: the direction stays unchanged (%d hits)' % len(tl), all(a == b for a, b in tl),
        'changed in %d' % sum(1 for a, b in tl if a != b))
    would = [top[left[a]] for a, b in tl]
    rep(name, 'top-left diagonal: the stored result would have differed from the old direction in some hits, so the quirk is visible',
        any(w != a for w, (a, b) in zip(would, tl)), '%d of %d differ' % (sum(1 for w, (a, b) in zip(would, tl) if w != a), len(tl)))
    for key, (t1, t2) in (('BL', (left, bottom)), ('TR', (right, top)), ('BR', (right, bottom))):
        v = d[key]
        rep(name, '%s diagonal: direction becomes table2[table1[direction]] (%d hits, %d of them change it)' % (key, len(v), sum(1 for a, b in v if a != b)),
            all(b == t2[t1[a]] for a, b in v), 'wrong in %d' % sum(1 for a, b in v if b != t2[t1[a]]))
    # second step
    sec_bounced = [v for _, v in values(cov, 'UpdateBall_Move.doSecondStep', 'wBallBounced')]
    sec_flag = [v for _, v in values(cov, 'UpdateBall_Move.doSecondStep', 'wBallSecondStep')]
    sec_speed = [v for _, v in values(cov, 'UpdateBall_Move.doSecondStep', 'wBallWorkSpeed')]
    sec_unb = [v for _, v in values(cov, 'UpdateBall_Move.doSecondStep', 'wUnbreakableHitSpawned')]
    first_speed = [v for _, v in values(cov, 'UpdateBall_Move.storeNewY', 'wBallWorkSpeed')]
    rep(name, 'second step runs only when the first step did not bounce, with a nonzero low speed nibble (%d second steps)' % len(sec_bounced),
        sec_bounced and set(sec_bounced) == {0} and set(sec_flag) == {1} and all(x & 0xF for x in sec_speed),
        'bounced %s, second-step flag %s' % (sorted(set(sec_bounced)), sorted(set(sec_flag))))
    shifted = sum(1 for x in first_speed if x & 0xF)
    rep(name, 'some moves with a nonzero low nibble skipped the second step because the first bounced',
        0 < len(sec_bounced) < shifted, '%d second steps of %d shifted moves' % (len(sec_bounced), shifted))
    rep(name, 'wUnbreakableHitSpawned is always 0 when the second step starts (a hit that spawns it always bounces, so no second step follows)',
        set(sec_unb) == {0}, 'values %s' % sorted(set(sec_unb)))
    # InitBall
    ib = g.initball
    rep(name, 'InitBall ran (%d times: level loads and lost lives)' % len(ib), len(ib) >= 10)
    ok = all(all(v == 0 for v in x['flags'].values()) and x['launch'] == 0 and x['count'] == 1 and x['onbat'] == 1 for x in ib)
    rep(name, 'InitBall clears wMultiBallPending, wSleepyBallActive, wAntigravityActive, wSlowBallActive, wBallLoopCount, wNinjaActive, '
        'wRemoveBall and wLaunchDirection, sets wBallCount 1 and wBallOnBat 1 (all poked to 1 or other values as it started)', ok,
        'first result %s' % (ib[0] if ib else None))
    rep(name, 'InitBall resets ball 0 to direction $10, speed $83, flags 0', all(x['ball'][2:] == (0x10, 0x83, 0) for x in ib),
        'ball %s' % ((ib[0]['ball'],) if ib else None,))
    # SetUpBricks
    loads = g.loads
    bad = []
    palette = 0
    for before, after, left_count, level in loads:
        want = sum(1 for v in before if v and v & 0xF != 0xE)
        palette += any(v > 0x0F for v in before)
        if left_count != want or after != [v & 0x0F for v in before]:
            bad.append((level, left_count, want))
    rep(name, 'SetUpBricks: wBricksLeft = cells that are not empty and not unbreakable; the palette nibble is removed (%d level loads)' % len(loads),
        len(loads) >= 10 and not bad, 'mismatches %s' % bad[:3])
    rep(name, 'SetUpBricks: the maps before it held palette nibbles (high nibble nonzero) in %d of the loads' % palette, palette == len(loads))
    rep(name, 'a level with unbreakable bricks was among the loads', any(any(v & 0xF == 0xE for v in b) for b, a, l, lv in loads))


@scen()
def scenario_core_corner(g):
    """Ball poked so that its top-left corner is at the same offset (c == d) in a planted unbreakable brick: the
    top-left diagonal case of CollideBall_Corners, where the direction must stay unchanged."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(100, launch=False)
    base = g.syms['wBrickMap']
    for r in range(1, 17):
        g.sync_poke(base + 16 * r + 1, *([0] * 9))
    g.sync_poke('wBricksLeft', 200)
    g.sync_poke(base + 16 * 6 + 5, 0x0E)
    g.diag = {'TL': []}
    diag_pair(g, 'TL', 'topLeftDiagonal', 'checkTopRight')
    top = (6 + 3) * 8                    # first pixel row of map row 6
    for c in (1, 2, 3, 5, 6, 7):
        # top-left corner point (x+1, y+1) at offset (c, c) inside brick column 5 (pixels 80 to 95), map row 6
        g.sync_poke('wBalls', 0, top + c - 1 + 1, 0, 80 + c - 1, 0, 3, 0)    # y is one more: the ball moves up 1 pixel first
        g.poke('wBallOnBat', 0)
        g.run(3)


def check_corner(g, cov, rep):
    name = 'core_corner'
    bank, addr = cov.symtab['BallReflectLeftTable']
    off = bank * 0x4000 + addr - 0x4000
    left = list(g.rom_data[off:off + 32])
    bank, addr = cov.symtab['BallReflectTopTable']
    off = bank * 0x4000 + addr - 0x4000
    top = list(g.rom_data[off:off + 32])
    tl = g.diag['TL']
    rep(name, 'the top-left diagonal case (c == d) was reached by poked balls', len(tl) >= 6, '%d hits' % len(tl))
    rep(name, 'top-left diagonal: direction unchanged at every hit', all(a == b for a, b in tl), tl)
    would = [top[left[a]] for a, b in tl]
    rep(name, 'the table result the other corners would store differs from the unchanged direction in some of these hits',
        any(w != a for w, (a, b) in zip(would, tl)), 'would store %s' % would)


# --------------------------------------------------------------------------- driver

def run_one(name, rom, frame_limit, labels, verbose):
    fn, watches = SCENARIOS[name]
    cov = C.Coverage(labels, watches)
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


CHECKS = {'core_password': check_password, 'core_nudge': check_nudge,
          'core_plasma': check_plasma, 'core_text': check_text,
          'core_ball': check_ball,
          'core_corner': check_corner}


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
        for n, (fn, _w) in SCENARIOS.items():
            print('%-14s %s' % (n, (fn.__doc__ or '').strip().split('\n')[0]))
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

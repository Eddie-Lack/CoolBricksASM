"""Close-out play-test pass 0: the last unconfirmed names of the weapons, ball, enemies, rom, sound, menus and
powerups areas.

Usage (needs PyBoy; run from the repository root after `make`, one emulator at a time):

    python tools/playtest_close0.py --list
    python tools/playtest_close0.py --scenario c0_wide_shadow --verbose
    python tools/playtest_close0.py --scenario all

Scenarios (each deterministic):
    c0_wide_shadow    BatShadowTiles_Wide. hTemp2 is a scratch byte; it is not 0 on entry to DrawBatSprites only
                      in a frame in which Gameplay_UpdateBalls removed a ball and other balls stay. Static: every
                      writer of hTemp2. Observed: a real Milk bat (wBatWidth $28) with a Triple ball, balls lost one by one;
                      the OAM row after DrawBatSprites is compared with the table bytes. Poked: hTemp2 = 1 at entry.
    c0_unbreakable    wUnbreakableHitSpawned: code-read proof that a spawn always bounces and a bounce skips the second
                      step (every CollideBallPoint caller, the tail of HitBrickAtBall), plus a play run with
                      unbreakable bricks that logs the flag after the first CollideBall and at the second step.
    c0_blob_ninja     CheckBlobCatch early exit for Ninja (the first `ret nz`, no label): PC hook by address.
    c0_blob_ghost     CheckBlobCatch early exit for Ghost (the second `ret nz`, no label): PC hook by address.
    c0_sound          Pattern_24 and Pattern_25 (no order list holds $24 or $25: static dump, plus a log of every
                      pattern fetch of every song) and BankFiller_006 (only a definition; the whole sound sequence is
                      run on the ROM and on a copy whose bank 6 filler is overwritten, the machine state is compared
                      every frame; a control copy with a read pattern changed shows that the comparison can fail).
    c0_menus          wStartLevel, wMenuItemColours, wMenuDownHeld, wMenuUpHeld, wMenuIdleTimer and
                      HighScores_NameEntry (the former HighScores_Leave.nameEntryInput) with real input.
    c0_powerups       The Triple ball split (UpdateBall_Split), Antigravity steering, the Poison stun
                      (Gameplay_UpdateStun) and the wBallWorkFlags values on ball slots 1 and 2 of a real Triple ball.

What is poked (stated again where it happens): c0_wide_shadow: hTemp2 in the poked check, wBatWidth never; c0_menus:
wCurrentLevel and wLevelsSincePassword (to reach the password screen), wStartLevel as a marker; c0_powerups: the
brick map (cleared, as in playtest_extra2) so that the balls only meet walls, and dropped power-ups (the
harness puts them above the bat and the bat catches them); c0_blob_*: a ball put into the blob, the lives.
"""
import argparse
import os
import re
import sys
import time
import zlib

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import coverage as C          # noqa: E402
import playtest_sound as S    # noqa: E402  (force_call and helpers)

assert os.path.abspath(C.__file__) == os.path.join(HERE, 'coverage.py'), C.__file__
C.MAX_LOG = 100000

ROOT = C.ROOT
SCENARIOS = {}
RESULTS = []
EXTRA_LABELS = []             # (name, bank, address, routine) hooked by address; filled by hook_at_address()


def scen(fn):
    SCENARIOS[fn.__name__.replace('scenario_', '')] = fn
    return fn


def claim(text, ok, detail=''):
    RESULTS.append(bool(ok))
    print('  %s  %s%s' % ('PASS' if ok else 'FAIL', text, (' | ' + str(detail)) if detail != '' else ''), flush=True)


def note(text):
    print('  note  %s' % text, flush=True)


def trace(g, label, fn):
    """Call fn() every time `label` is reached (the hook re-arms itself)."""
    def arm():
        fn()
        g.at(label, arm)
    g.at(label, arm)


def reg(g, name):
    return getattr(g.pb.register_file, name)


def banks_text():
    """{file name: [lines]} of banks/*.asm."""
    out = {}
    d = os.path.join(ROOT, 'banks')
    for fn in sorted(os.listdir(d)):
        out[fn] = open(os.path.join(d, fn)).read().split('\n')
    return out


def sym_bytes(g, label, n):
    bank, addr = g.cov.symtab[label]
    return g.rom_bytes(bank, addr, n)


def rom_offset(bank, addr):
    return addr if bank == 0 else bank * 0x4000 + addr - 0x4000


def rom_label_bytes(rom, bank, addr, n):
    o = rom_offset(bank, addr)
    return list(rom[o:o + n])


def hook_at_address(name, bank, addr, routine):
    """Register an unlabelled address as a hookable label (call before the Game is made)."""
    EXTRA_LABELS.append(dict(name=name, bank=bank, addr=addr, routine=routine))


def make_game(rom, frames):
    labels = C.read_labels() + EXTRA_LABELS
    cov = C.Coverage(labels, [])
    for lab in EXTRA_LABELS:
        cov.symtab[lab['name']] = (lab['bank'], lab['addr'])
    return C.Game(cov, rom, frames)


def find_calls(rom, label_addr):
    """ROM offsets (bank 0) of every `call label` in bank 0 code."""
    out = []
    for a in range(0, 0x4000 - 2):
        if rom[a] == 0xCD and (rom[a + 1] | rom[a + 2] << 8) == label_addr:
            out.append(a)
    return out


def sym(name):
    return C.read_symtab()[name]


# --------------------------------------------------------------------------- item 1: BatShadowTiles_Wide

def _static_htemp2_writers():
    out = []
    for fn, lines in banks_text().items():
        for n, l in enumerate(lines, 1):
            s = l.split(';')[0].strip()
            if re.search(r'\[(hTemp2|\$ff90|\$90)\]', s) and re.match(r'ldh? \[', s):
                out.append((fn, n, s))
    return out


# DrawBatSprites is called at two places of bank 0: once per frame from the gameplay loop and once from level set-up
_rom0 = open(os.path.join(ROOT, 'game.gbc'), 'rb').read()
_dbs = sym('DrawBatSprites')[1]
for _i, _a in enumerate(find_calls(_rom0, _dbs)):
    hook_at_address('c0.afterDrawBatSprites%d' % _i, 0, _a + 3, 'Gameplay_Update')
hook_at_address('c0.ninjaRet', 0, sym('CheckBlobCatch')[1] + 9, 'CheckBlobCatch')
hook_at_address('c0.ghostRet', 0, sym('CheckBlobCatch')[1] + 14, 'CheckBlobCatch')
_sec = sym('UpdateBall_Move.storeNewY')[1]
_call = next(a for a in range(_sec, _sec + 40) if _rom0[a] == 0xCD and (_rom0[a + 1] | _rom0[a + 2] << 8) == sym('CollideBall')[1])
hook_at_address('c0.afterFirstCollide', 0, _call + 3, 'UpdateBall_Move')


@scen
def scenario_c0_wide_shadow(g):
    """BatShadowTiles_Wide: static writers of hTemp2, then a Milk bat with a Triple ball and lost balls."""
    # ---- static: every writer of hTemp2
    writers = _static_htemp2_writers()
    note('writers of hTemp2: %s' % writers)
    claim('hTemp2 is written in 5 places only: Gameplay_UpdateBalls (clear, count removed balls), ProcessBrickHitQueue (count down '
          'from $0c) and DrawBatSprites (width flag)', len(writers) == 5, '%d writers' % len(writers))
    # ---- code-read: the order of a frame is UpdateBalls -> DrawBatSprites -> ProcessBrickHitQueue
    bank0 = banks_text()['bank_000_000.asm']
    txt = '\n'.join(bank0)
    i_draw = txt.index('call DrawBatSprites')
    i_queue = txt.index('call ProcessBrickHitQueue', i_draw)
    claim('in the frame loop `call DrawBatSprites` comes before `call ProcessBrickHitQueue`, which ends with hTemp2 = 0 '
          '(it counts $0c down to 0), so hTemp2 at the next entry is set by Gameplay_UpdateBalls', i_queue > i_draw)

    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(120)
    bank1, shadow_wide = sym('BatShadowTiles_Wide')
    n_norm = sym('BatShadowTiles_Normal')
    normal = rom_label_bytes(g.rom_data, n_norm[0], n_norm[1], 6)
    wide = rom_label_bytes(g.rom_data, bank1, shadow_wide, 8)
    rows = []
    cur = {}

    def entry():
        cur.clear()
        cur.update(frame=g.frame, h=g.peek('hTemp2'), width=g.peek('wBatWidth'), balls=g.peek('wBallCount'),
                   removed=g.count('Gameplay_BallLoop.markSlotRemoved'), expl=g.peek('wBatExplosionTimer'))
        g.at('DrawBatSprites', entry)

    def after():
        o = g.syms['wOamBuffer'] + 4
        sprites = [tuple(g.mem[o + 4 * i + k] for k in range(4)) for i in range(5)]
        row = [s for s in sprites if s[0] == 0x98]
        cur['row'] = [b for s in row for b in (s[2], s[3])]
        cur['prev_removed'] = rows[-1]['removed'] if rows else 0
        rows.append(dict(cur))
        g.at('c0.afterDrawBatSprites0', after)
    g.at('DrawBatSprites', entry)
    g.at('c0.afterDrawBatSprites0', after)

    # ---- observed: real Milk bat and Triple ball, then lose the balls
    start = len(rows)
    for rnd in range(6):
        C.catch_powerup(g, 5)                         # Milk: wBatWidth $28
        C.catch_powerup(g, 9)                         # Triple ball
        g.play(60, launch=False)
        if g.peek('wBatWidth') != 0x28 or g.peek('wBallCount') < 2:
            continue
        g.play(1500, miss=True, until=lambda: g.state != 2 or g.peek('wBallCount') <= 1)
        wide_removed = [r for r in rows if r['width'] == 0x28 and r['h'] != 0 and not r['expl']]
        if wide_removed:
            break
    nonzero = [r for r in rows if r['h'] != 0]
    note('DrawBatSprites entries %d, with hTemp2 != 0: %d, with a wide bat and hTemp2 != 0: %d'
         % (len(rows), len(nonzero), len([r for r in nonzero if r['width'] == 0x28])))
    claim('hTemp2 at entry is 0 in every frame with a real wide bat (wBatWidth $28) unless a ball was removed in that frame',
          all(r['h'] == 0 for r in rows if r['width'] == 0x28 and r['removed'] == r['prev_removed']),
          '%d wide-bat entries' % len([r for r in rows if r['width'] == 0x28]))
    claim('hTemp2 at entry is not 0 only when Gameplay_BallLoop.markSlotRemoved ran since the previous entry',
          all(r['removed'] > r['prev_removed'] for r in nonzero if r['frame'] > rows[1]['frame']),
          [r for r in nonzero if r['removed'] <= r['prev_removed']][:3])
    for r in rows:
        r['want'] = wide if r['h'] else normal
    # the OAM row is compared only for frames in which the bat is drawn (no explosion)
    drawn = [r for r in rows if not r['expl'] and r.get('row')]
    claim('the lower shadow row in OAM equals BatShadowTiles_Normal when hTemp2 is 0 and BatShadowTiles_Wide when it is not (%d frames, %d wide)'
          % (len(drawn), len([r for r in drawn if r['h']])),
          all(r['row'] == r['want'] for r in drawn),
          [(r['frame'], r['h'], r['row']) for r in drawn if r['row'] != r['want']][:2])
    hit_wide = [r for r in drawn if r['h'] and r['width'] == 0x28]
    if hit_wide:
        claim('OBSERVED: a real Milk bat drew the four-sprite row in a frame in which a ball was removed', True,
              'frames %s' % [r['frame'] for r in hit_wide][:5])
    else:
        note('a real wide bat never met a ball removal here; the poke check below is the only OAM proof for width $28')
    # ---- poked: hTemp2 = 1 at entry with the wide bat, and hTemp2 = 0 (the usual value)
    g.run(10)
    if g.state != 2:
        g.boot()
        g.start_level(1)
        g.poke('wLives', 9)
    for _ in range(3):
        C.catch_powerup(g, 5)
        g.play(30, launch=False)
        if g.peek('wBatWidth') == 0x28:
            break
    width = g.peek('wBatWidth')
    results = {}
    for value in (1, 0):
        n = len(rows)
        g.at('DrawBatSprites', lambda v=value: g.poke('hTemp2', v))
        g.wait_until(lambda: len(rows) > n, limit=10, step=1)
        results[value] = rows[n]['row'] if len(rows) > n else None
    claim('POKED hTemp2 = 1 at entry (wBatWidth $%02x): the OAM row is BatShadowTiles_Wide' % width,
          results[1] == wide, '%s vs %s' % (results[1], wide))
    claim('hTemp2 = 0 at entry: the OAM row is BatShadowTiles_Normal', results[0] == normal, '%s vs %s' % (results[0], normal))


# --------------------------------------------------------------------------- item 4: wUnbreakableHitSpawned

@scen
def scenario_c0_unbreakable(g):
    """Proof by reading plus a run: a spawn always bounces, a bounce skips the second step."""
    lines = banks_text()['bank_000_000.asm']
    txt = '\n'.join(l.split(';')[0].rstrip() for l in lines)
    # every caller of CollideBallPoint tests Z then C and sets wBallBounced right away
    calls = [m.start() for m in re.finditer(r'call CollideBallPoint', txt)]
    ok = 0
    for p in calls:
        seg = [x.strip() for x in txt[p:].split('\n')[1:7] if x.strip()]
        if (re.match(r'(jr z, \.\w+|ret z)', seg[0]) and re.match(r'(jr c, \.\w+|ret c)', seg[1])
                and seg[2] == 'ld a, $01' and seg[3] == 'ld [wBallBounced], a'):
            ok += 1
    claim('all %d calls of CollideBallPoint leave on Z or C (a miss) and otherwise set wBallBounced = 1 at once' % len(calls),
          ok == len(calls) == 10, '%d of %d match' % (ok, len(calls)))
    callers = len(re.findall(r'call CollideBall\b', txt))
    claim('CollideBallPoint is the only way into HitBrickAtBall (jp/jr from it), and CollideBall is called only by UpdateBall_Move (twice)',
          len(re.findall(r'(jp|jr|call) (nc, |c, |z, |nz, )?HitBrickAtBall', txt)) >= 6 and callers == 2,
          '%d calls of CollideBall' % callers)
    all_txt = '\n'.join('\n'.join(l.split(';')[0] for l in v) for v in banks_text().values())
    writes = re.findall(r'ld \[wUnbreakableHitSpawned\], a', all_txt)
    claim('wUnbreakableHitSpawned is written twice in all of banks/: cleared once in UpdateBall_Move before the first CollideBall, set to 1 in SpawnUnbreakableHitEffect',
          len(writes) == 2)
    brick = txt[txt.index('.brickIs0e:'):txt.index('.countSolidHit:')]
    tail = txt[txt.index('.playSound4ReturnNz:'):txt.index('\nBatBounceLookup:')] if '.playSound4ReturnNz:' in txt else ''
    ends = re.findall(r'ld a, \$01\s+or a\s+ret', tail)
    claim('`call z, SpawnUnbreakableHitEffect` is followed by .countSolidHit, which ends in `ld a, $01 / or a / ret` (NZ and NC = a bounce for the caller)',
          'call z, SpawnUnbreakableHitEffect' in brick and len(ends) == 1)
    body = txt[txt.index('UpdateBall_Move.storeNewY:') if 'UpdateBall_Move.storeNewY:' in txt else txt.index('.storeNewY:'):txt.index('\nCollideBall:')]
    claim('UpdateBall_Move: after the first CollideBall the second step runs only if wBallBounced is 0 (`add sp, $04 / ret` otherwise), and .doSecondStep does not touch the flag',
          'call CollideBall\n    ld a, [wBallSecondStep]\n    or a\n    ret z\n\n    ld a, [wBallBounced]\n    or a\n    jr z, .doSecondStep\n\n    add sp, $04\n    ret' in body
          and 'wUnbreakableHitSpawned' not in body[body.index('.doSecondStep:'):])
    # ---- observed: unbreakable bricks, real bounces
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(100)
    base = g.syms['wBrickMap']
    for r in range(3, 17):
        g.sync_poke(base + 16 * r + 1, *([0x0E if r == 5 else 0] * 9))
    g.sync_poke('wBricksLeft', 200)
    seconds, spawns, firsts = [], [], []
    trace(g, 'SpawnUnbreakableHitEffect', lambda: spawns.append(g.peek('wUnbreakableHitSpawned')))
    trace(g, 'UpdateBall_Move.doSecondStep', lambda: seconds.append(g.peek('wUnbreakableHitSpawned')))
    # after the first CollideBall: whenever the flag is 1 the ball must have bounced
    trace(g, 'c0.afterFirstCollide', lambda: firsts.append((g.peek('wUnbreakableHitSpawned'), g.peek('wBallBounced'))))
    g.play(2500, until=lambda: g.state != 2)
    spawned = [f for f in firsts if f[0]]
    claim('after the first CollideBall of a ball update the flag was 1 in %d updates and wBallBounced was 1 in all of them (%d updates seen)'
          % (len(spawned), len(firsts)), spawned and all(f[1] == 1 for f in spawned))
    claim('wUnbreakableHitSpawned was 0 at every entry of SpawnUnbreakableHitEffect (%d spawns)' % len(spawns), spawns and set(spawns) == {0})
    claim('wUnbreakableHitSpawned was 0 at every second step (%d second steps): no run can tell "clears" from "does not clear"' % len(seconds),
          len(seconds) > 100 and set(seconds) == {0})


# --------------------------------------------------------------------------- item 7: CheckBlobCatch early exits

def blob_early_exit(g, ptype, field, which):
    E = __import__('playtest_enemies')
    level = C.levels_of_type(2)[0]
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    C.goto_level(g, level)
    g.play(200)
    claim('level %d is a blob level (wLevelType bit 1)' % (g.peek('wCurrentLevel') + 1), g.peek('wLevelType') & 2)
    rows = []
    trace(g, 'c0.ninjaRet', lambda: rows.append(('ninja', g.frame, reg(g, 'A'), g.peek('wBlobActive'), g.peek('wNinjaActive'), g.peek('wGhostActive'), g.peek('wBlobThrowing'))))
    trace(g, 'c0.ghostRet', lambda: rows.append(('ghost', g.frame, reg(g, 'A'), g.peek('wBlobActive'), g.peek('wNinjaActive'), g.peek('wGhostActive'), g.peek('wBlobThrowing'))))
    calls = []
    trace(g, 'CheckBlobCatch', lambda: calls.append((g.peek('wNinjaActive'), g.peek('wGhostActive'))))
    ok = C.catch_powerup(g, ptype)
    claim('power-up %d caught on a blob level, %s set' % (ptype, field), ok and g.peek(field) != 0, '%s %d' % (field, g.peek(field)))
    mark = len(rows)
    ncalls = len(calls)
    thrown = g.count('UpdateBlob.spawnThrow')
    ret_nz = [0x31a4, 0x31a9][which == 'ghost']
    data = g.rom_bytes(0, ret_nz, 1)
    claim('the byte at the hooked address $%04x is $c0 (ret nz)' % ret_nz, data == [0xC0], data)
    for _ in range(60):
        if g.state != 2 or not g.peek(field):
            break
        E.blob_ball(g, 0)
        if not g.peek('wBallCount'):
            g.sync_poke('wBallCount', 1)                  # poke: so that ball slot 0 is tested
        g.play(5, launch=False, until=lambda: g.state != 2)
    mine = [r for r in rows[mark:] if r[0] == which and r[3] and r[2] != 0]
    other = [r for r in rows[mark:] if r[0] != which]
    claim('%s active: the `ret nz` for %s was reached with A != 0 (taken) %d times' % (field, which, len(mine)), len(mine) >= 1,
          '%d calls of CheckBlobCatch' % (len(calls) - ncalls))
    claim('%s active: wBlobThrowing was 0 at every one of those hits and no throw started' % field,
          all(r[6] == 0 for r in mine) and g.count('UpdateBlob.spawnThrow') == thrown)
    if which == 'ninja':
        claim('Ninja active: the Ghost `ret nz` was not reached (the Ninja exit comes first)', not [r for r in other if r[0] == 'ghost' and r[4]],
              '%d Ghost-line hits' % len(other))
    else:
        reached = [r for r in other if r[0] == 'ninja' and r[5]]
        claim('Ghost active (Ninja off): the Ninja `ret nz` was reached with A == 0 (not taken) before the Ghost exit', len(reached) >= 1 and all(r[2] == 0 for r in reached),
              '%d hits' % len(reached))


@scen
def scenario_c0_blob_ninja(g):
    """CheckBlobCatch with Ninja: the first `ret nz`."""
    blob_early_exit(g, 13, 'wNinjaActive', 'ninja')


@scen
def scenario_c0_blob_ghost(g):
    """CheckBlobCatch with Ghost: the second `ret nz`."""
    blob_early_exit(g, 14, 'wGhostActive', 'ghost')


# --------------------------------------------------------------------------- items 10 and 13: sound

def parse_sound(rom):
    """Follow the song headers, order lists and pattern jumps in the ROM (bank 6).
    Returns (per-song reachable patterns, all order list addresses, pattern table size, pattern address list)."""
    syms = S.sym_list(6)
    byname = {n: a for a, n in syms}

    def rb(a):
        return rom[6 * 0x4000 + a - 0x4000]

    def w(a):
        return rb(a) | rb(a + 1) << 8
    table = byname['PatternPointers']
    npat = (min(a for a, _ in syms if a > table) - table) // 2

    def pattern_end(a):
        while True:
            n = rb(a)
            if n == 0x00:
                return None
            if n == 0xFF:
                return w(a + 1)
            a += 2 if rb(a + 1) in (0xFD, 0xFE, 0xFF) else 3
    songs = sorted((a, n) for a, n in syms if n.startswith('SongHeader_'))
    per_song = {}
    lists = {}
    for si, (hdr, name) in enumerate(songs):
        used = set()
        todo = [w(hdr + 2 * ch) for ch in range(4)]
        seen = set()
        while todo:
            a = todo.pop()
            while a not in seen:
                seen.add(a)
                p = rb(a + 1)
                if p >= npat:
                    break
                used.add(p)
                lists.setdefault(a, set()).add(p)
                t = pattern_end(w(table + 2 * p))
                if t is not None:
                    todo.append(t)
                    break
                a += 2
        per_song[si] = used
    return per_song, lists, npat, songs


@scen
def scenario_c0_sound(g):
    """Pattern_24 / Pattern_25 and BankFiller_006."""
    rom = g.rom_data
    per_song, lists, npat, songs = parse_sound(rom)
    allused = set().union(*per_song.values())
    missing = [p for p in range(npat) if p not in allused]
    note('songs %d, patterns in the table %d, reachable %d' % (len(songs), npat, len(allused)))
    note('order list entries (list address -> pattern numbers) hold: %s' % sorted(allused))
    claim('STATIC: no order list reachable from a song header holds pattern $24 or $25', 0x24 not in allused and 0x25 not in allused)
    claim('STATIC: the patterns no song reaches are exactly $1c, $24 and $25 ($1c already has its own "Not used by any song" comment)', missing == [0x1C, 0x24, 0x25], 'unreachable %s' % [hex(p) for p in missing])
    syms = S.sym_list(6)
    p24 = next(a for a, n in syms if n == 'Pattern_24')
    p25 = next(a for a, n in syms if n == 'Pattern_25')
    ptab = next(a for a, n in syms if n == 'PatternPointers')
    word = lambda a: rom[6 * 0x4000 + a - 0x4000] | rom[6 * 0x4000 + a - 0x4000 + 1] << 8
    claim('STATIC: PatternPointers holds the addresses of Pattern_24 and Pattern_25 at entries $24 and $25',
          word(ptab + 0x48) == p24 and word(ptab + 0x4a) == p25)
    refs = []
    for fn, lines in banks_text().items():
        for n, l in enumerate(lines, 1):
            if re.search(r'\bPattern_2[45]\b', l.split(';')[0]):
                refs.append((fn, n))
    claim('STATIC: the labels Pattern_24 and Pattern_25 appear in banks/ only as their two definitions and in one PatternPointers line (%s)' % refs,
          len(refs) == 3)
    # ---- the fetch sites: `ld e, a / ld d, $00 / ld hl, PatternPointers` in bank 6
    b6 = rom[6 * 0x4000: 7 * 0x4000]
    pat = bytes([0x5F, 0x16, 0x00, 0x21, ptab & 0xFF, ptab >> 8])
    sites = [m.start() + 0x4000 + 3 for m in re.finditer(re.escape(pat), bytes(b6))]
    claim('the pattern table is read at 5 places in bank 6 (the four channels and the muted channel of a sound effect)', len(sites) == 5, [hex(s) for s in sites])
    return sites, per_song, lists


def sound_sequence(g, sites=None, frames_per_song=None, collect=None, digest=None):
    """Force every song and then every sound effect. Optionally log the pattern fetches (E at each fetch site) and a
    per-frame digest of the machine state."""
    S.boot_quick(g)
    nsong = 10
    frames_per_song = frames_per_song or int(os.environ.get('SND_SONG_FRAMES', '5600'))
    mem = g.pb.memory

    def tick(tag):
        g.run(1)
        if digest is not None:
            d = zlib.crc32(bytes(mem[0xC000:0xE000]))
            d = zlib.crc32(bytes(mem[0xFE00:0xFEA0]), d)
            d = zlib.crc32(bytes(mem[0xFF00:0xFFFF]), d)
            digest.append(d)
    for song in range(nsong):
        if collect is not None:
            collect['song'] = song
        S.force_call(g, 'PlaySong', e=song)
        for i in range(frames_per_song):
            tick(song)
            if song == 0 and i in (700, 1500, 2300):          # a sound effect over the song: the muted channel keeps reading rows
                S.force_call(g, 'PlaySfx', e=(i // 800) + 1)
    for sfx in range(30):
        if collect is not None:
            collect['song'] = 100 + sfx
        S.force_call(g, 'PlaySfx', e=sfx)
        for _ in range(150):
            tick(sfx)


def pattern_fetch_scenario(g, sites, per_song):
    collect = {'song': -1}
    fetched = {}

    def make(k):
        def fn():
            e = reg(g, 'E')
            fetched.setdefault(e, set()).add(collect['song'])
            fetched.setdefault(('site', k), set()).add(0)
            g.at('c0.fetch%d' % k, fn)
        return fn
    for k in range(len(sites)):
        g.at('c0.fetch%d' % k, make(k))
    sound_sequence(g, collect=collect)
    return fetched


def _register_fetch_labels():
    data = _rom0
    ptab = next(a for a, n in S.sym_list(6) if n == 'PatternPointers')
    b6 = data[6 * 0x4000: 7 * 0x4000]
    pat = bytes([0x5F, 0x16, 0x00, 0x21, ptab & 0xFF, ptab >> 8])
    for k, m in enumerate(re.finditer(re.escape(pat), b6)):
        hook_at_address('c0.fetch%d' % k, 6, m.start() + 0x4000 + 3, 'UpdateSoundDriver')


_register_fetch_labels()


@scen
def scenario_c0_sound_patterns(g):
    """Pattern fetch log of every song and effect; $24 and $25 never fetched."""
    sites, per_song, lists = SCENARIOS['c0_sound'](g)
    fetched = pattern_fetch_scenario(g, sites, per_song)
    pats = {k: v for k, v in fetched.items() if isinstance(k, int)}
    site_hits = sorted(k[1] for k in fetched if isinstance(k, tuple))
    note('fetch sites reached: %s; distinct patterns fetched: %d' % (site_hits, len(pats)))
    allused = set().union(*per_song.values())
    claim('OBSERVED: no fetch of pattern $24 or $25 in any song or effect run (%d patterns fetched)' % len(pats),
          0x24 not in pats and 0x25 not in pats and len(pats) > 40)
    claim('OBSERVED: every pattern fetched is one the static scan reached', set(pats) <= allused, sorted(set(pats) - allused))
    never = sorted(allused - set(pats))
    note('statically reachable but not fetched in this run: %s' % [hex(p) for p in never])
    claim('OBSERVED: the four channel sites were reached', {0, 1, 2, 3} <= set(site_hits), site_hits)


def run_digest(rom, label, frames):
    g = make_game(rom, 10 ** 9)
    d = []
    try:
        sound_sequence(g, digest=d, frames_per_song=frames)
    finally:
        g.close()
    note('%s: %d frames, digest %08x' % (label, len(d), zlib.crc32(b''.join(x.to_bytes(4, 'little') for x in d))))
    return d


@scen
def scenario_c0_filler(g):
    """BankFiller_006: the same sound run on the ROM, a copy with the filler overwritten, and a control."""
    rom_path = g.rom_path if hasattr(g, 'rom_path') else os.path.join(ROOT, 'game.gbc')
    data = bytearray(open(rom_path, 'rb').read())
    bank, lo = sym('BankFiller_006')
    claim('BankFiller_006 is the last label of bank 6 ($%04x to $7fff, %d bytes)' % (lo, 0x8000 - lo), bank == 6 and lo < 0x8000)
    all_txt = '\n'.join('\n'.join(l.split(';')[0] for l in v) for v in banks_text().values())
    claim('STATIC: BankFiller_006 appears once in banks/ (its definition) and nowhere in include/ or tools/',
          len(re.findall(r'\bBankFiller_006\b', all_txt)) == 1)
    names = [n for a, n in S.sym_list(6) if a >= lo]
    claim('STATIC: it is the only symbol in bank 6 at or above $%04x, so no code or table can name an address inside it' % lo, names == ['BankFiller_006'], names)
    g.close()
    frames = int(os.environ.get('SND_SONG_FRAMES', '5600'))
    base = run_digest(rom_path, 'original', frames)
    off = rom_offset(6, lo)
    poison = bytearray(data)
    poison[off:6 * 0x4000 + 0x4000] = bytes([0xA5]) * (6 * 0x4000 + 0x4000 - off)
    tmp = os.path.join(os.environ.get('TMPDIR', '/tmp'), 'c0_poison.gbc')
    open(tmp, 'wb').write(poison)
    p = run_digest(tmp, 'filler overwritten with $a5', frames)
    claim('OBSERVED: with the %d filler bytes overwritten, the machine state (WRAM, OAM, I/O, HRAM) matches the original on all %d frames of every song and effect'
          % (0x8000 - lo, len(base)), p == base, 'first difference at frame %s' % next((i for i, (a, b) in enumerate(zip(base, p)) if a != b), None))
    ptab = next(a for a, n in S.sym_list(6) if n == 'Pattern_00')
    ctrl = bytearray(data)
    o = rom_offset(6, ptab)
    ctrl[o:o + 4] = bytes([0x01, 0x30, 0x01, 0x30])
    open(tmp, 'wb').write(ctrl)
    c = run_digest(tmp, 'control: Pattern_00 changed', frames)
    claim('CONTROL: changing four bytes of Pattern_00 (read by song 0) does change the digest, so the comparison can fail',
          c != base)
    try:
        os.remove(tmp)
    except OSError:
        pass


# --------------------------------------------------------------------------- item 16: menus

def sample(g, names, frames):
    out = []
    for _ in range(frames):
        g.run(1)
        out.append(tuple(g.peek(n) for n in names))
    return out


@scen
def scenario_c0_menus(g):
    """Main menu variables and the high score name entry, with real input."""
    g.boot(0)
    colours = lambda: [g.peek('wMenuItemColours+%d' % i) for i in range(5)]
    claim('wStartLevel is 0 after the boot (no START entry yet)', g.peek('wStartLevel') == 0, g.peek('wStartLevel'))
    g.run(5)
    claim('wMenuItemColours at cursor 0 with wStartLevel 0 is [4, 0, 1, 1, 1] (the START nnn item is hidden = 0)', colours() == [4, 0, 1, 1, 1], colours())
    # down and up held
    for key, button, name in (('Down', 'down', 'wMenuDownHeld'), ('Up', 'up', 'wMenuUpHeld')):
        g.menu_goto(0)
        g.run(10)
        cur0 = g.peek('wMenuCursor')
        timer_before = g.peek('wMenuIdleTimer')
        g.pb.button_press(button)
        s = sample(g, [name, 'wMenuCursor', 'wMenuIdleTimer'], 20)
        g.pb.button_release(button)
        s2 = sample(g, [name], 6)
        step = {v[1] for v in s}
        claim('%s: %s is 1 while %s is held and 0 after it is released' % (name, name, button), all(v[0] == 1 for v in s[2:]) and all(v[0] == 0 for v in s2[2:]), '%s then %s' % (s[-1], s2[-1]))
        claim('%s: the cursor moved once only while held (cursor %d -> %s)' % (name, cur0, sorted(step)), len(step) == 2 and cur0 in step, sorted(step))
        claim('wMenuIdleTimer is reset to $fd by a button on the menu (%d before the press, %d..%d while it is held)' % (timer_before, min(v[2] for v in s[3:]), max(v[2] for v in s)),
              timer_before < 0xFC and all(v[2] in (0xFC, 0xFD) for v in s[3:]), s[:5])
    # idle countdown: one step per two frames
    g.menu_goto(0)
    g.press('left', hold=2, after=6)
    t = sample(g, ['wMenuIdleTimer'], 60)
    steps = [a[0] - b[0] for a, b in zip(t, t[1:]) if a != b]
    changes = sum(1 for a, b in zip(t, t[1:]) if a != b)
    claim('wMenuIdleTimer falls by 1 every second frame while idle (%d changes in 59 frames, steps %s)' % (changes, sorted(set(steps))),
          28 <= changes <= 31 and set(steps) == {1}, t[-1])
    # password entry: colours and held flags and timer $fb
    g.menu_goto(2)
    g.press('a', hold=3, after=30)
    claim('during the password entry wMenuItemColours is [0, 0, 1, 0, 0] (all items except the third hidden)', colours() == [0, 0, 1, 0, 0], colours())
    g.pb.button_press('up')
    s = sample(g, ['wMenuUpHeld', 'wMenuIdleTimer'], 12)
    g.pb.button_release('up')
    s2 = sample(g, ['wMenuUpHeld', 'wMenuDownHeld'], 6)
    claim('password entry: wMenuUpHeld is 1 while up is held, 0 after; wMenuIdleTimer is $fb after a button', all(v[0] == 1 for v in s[2:]) and s2[-1][0] == 0 and s[-1][1] == 0xFB, '%s %s' % (s[-1], s2[-1]))
    g.pb.button_press('down')
    s = sample(g, ['wMenuDownHeld'], 12)
    g.pb.button_release('down')
    s2 = sample(g, ['wMenuDownHeld'], 6)
    claim('password entry: wMenuDownHeld is 1 while down is held, 0 after', all(v[0] == 1 for v in s[2:]) and s2[-1][0] == 0)
    # leave the entry by typing a full invalid password, then a valid one (level 5)
    for letters, valid, level in ((Game_pw(g, 2), False, 2), (Game_pw(g, 5), True, 5)):
        before = g.peek('wStartLevel')
        if g.peek('wPasswordEntryActive') == 0:
            g.menu_goto(2)
            g.press('a', hold=3, after=30)
        g.poke('wPasswordEntry', *[ord(c) for c in letters])     # poke: the letters (typing is covered by coverage.py)
        g.poke('wPasswordCursor', 3)
        g.press('a', hold=3, after=60)                      # one A on the fourth letter submits
        after = g.peek('wStartLevel')
        claim('level %d password: wStartLevel %s (%d -> %d), wPasswordEntryActive back to 0' % (level, 'set to 0-based level %d' % (level - 1) if valid else 'left unchanged', before, after),
              (after == level - 1) if valid else (after == before) and g.peek('wPasswordEntryActive') == 0)
        if valid:
            g.menu_goto(0)
            g.run(10)
            claim('with wStartLevel %d the START item shows: wMenuItemColours at cursor 0 is [4, 1, 1, 1, 1]' % after, colours() == [4, 1, 1, 1, 1], colours())
    g.menu_goto(1)
    before = g.count('LoadLevel')
    g.press('a', hold=3, after=0)
    g.wait_level_ready(since=before)
    claim('START nnn (cursor 1, wStartLevel 4) loads level 5 (wCurrentLevel 4)', g.peek('wCurrentLevel') == 4, g.peek('wCurrentLevel'))
    # wStartLevel on the level password screen (EncodeLevelPassword): poked wCurrentLevel and wLevelsSincePassword to get there fast,
    # wStartLevel = 77 as a marker; only a valid password (level - 1 a multiple of 4) may change it
    for first, valid in ((12, False), (99, True)):
        g.poke('wLives', 9)
        g.poke('wCurrentLevel', first)
        g.poke('wLevelsSincePassword', 4)
        g.poke('wStartLevel', 77)
        g.finish_level(2)
        g.run(60)
        reached = g.state == 9
        g.run(30)
        got = g.peek('wStartLevel')
        claim('password screen after wCurrentLevel %d: wStartLevel %s (marker 77 -> %d)' % (first, 'set to %d (the 0-based level of the screen)' % (first + 1) if valid else 'left unchanged', got),
              reached and got == (first + 1 if valid else 77), 'state %d' % g.state)
        g.run(300)
        g.press('a', after=100)
        g.wait_level_ready()
    # name entry: play to get a score on the table, then lose the last life and type a name
    n_entry, n_leave = [], []
    trace(g, 'HighScores_NameEntry', lambda: n_entry.append((g.peek('wMenuIdleTimer'), g.peek('wNameEntryAddress') | g.peek('wNameEntryAddress+1') << 8, g.peek('wNameEntryCursor'))))
    trace(g, 'HighScores_Leave', lambda: n_leave.append((g.frame, g.peek('hGameState'), g.peek('wNameEntryCursor'), len(n_entry))))
    g.poke('wLives', 9)
    g.play(1200)
    g.poke('wLives', 1)
    C.lose_lives(g, 1)
    C.game_over_and_name(g)
    claim('HighScores_NameEntry was reached %d times, always with wMenuIdleTimer $ff and wNameEntryAddress != 0' % len(n_entry),
          n_entry and all(r[0] == 0xFF and r[1] != 0 for r in n_entry), sorted(set(n_entry))[:3])
    from_entry = [r for r in n_leave if r[3] > 0 and r[1] == 7]
    claim('HighScores_Leave ran from the name entry when the cursor moved past the last letter (hGameState 7 on entry, cursor %s)' % [r[2] for r in from_entry[:2]],
          len(from_entry) >= 1, n_leave[:4])
    # idle timer to 0 on the menu -> high scores or credits (state 7 or 8), timer then $fe
    C.title_to_menu(g)
    start = g.frame
    g.run(2)
    g.wait_until(lambda: g.state in (7, 8) or g.frame - start > 1400, limit=1500, step=1)
    claim('left idle, the menu timer reaches 0 and the high score or credits screen appears (state %d after %d frames, wMenuIdleTimer $%02x)'
          % (g.state, g.frame - start, g.peek('wMenuIdleTimer')), g.state in (7, 8) and 480 <= g.frame - start <= 560, g.state)


def Game_pw(g, level):
    return g.level_password(level)


# --------------------------------------------------------------------------- item 19: powerups

@scen
def scenario_c0_powerups(g):
    """Triple ball split, Antigravity steering, Poison stun and real wBallWorkFlags on slots 1 and 2."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(150)
    hits0 = {n: g.count(n) for n in ('UpdateBall_Split', 'UpdateBall_Split.seekNewBallSlot', 'Gameplay_AntigravitySteering', 'Gameplay_UpdateStun', 'Gameplay_UpdateStun.skipSound')}
    # ---- Poison: stun
    stun = []
    trace(g, 'Gameplay_UpdateStun.skipSound', lambda: stun.append((g.peek('wStunActive'), g.peek('wBatEffectTimer'), g.peek('wStunWobble'))))
    ok = C.catch_powerup(g, 4)
    g.play(300, launch=False, until=lambda: g.state != 2)
    claim('Poison caught: wStunActive was set and wBatEffectTimer counted down; Gameplay_UpdateStun.skipSound ran %d times' % len(stun),
          ok and len(stun) > 10 and all(s[0] for s in stun) and min(s[1] for s in stun) < max(s[1] for s in stun) and {s[2] for s in stun} <= {0, 3, 0xFD},
          'timer %d..%d wobble %s' % (min(s[1] for s in stun), max(s[1] for s in stun), sorted({s[2] for s in stun})))
    # ---- Antigravity (Pepper): left/right steer every ball
    g.play(60, launch=True)
    steer = []
    trace(g, 'Gameplay_AntigravitySteering.setBallDirections', lambda: steer.append((reg(g, 'B'), g.peek('hJoypad') & 3, g.peek('wBallCount'))))
    ok = C.catch_powerup(g, 7)
    claim('Pepper caught, wAntigravityActive set', ok and g.peek('wAntigravityActive') != 0, g.peek('wAntigravityActive'))
    dirs = []
    for button, want in (('left', 0x1C), ('right', 0x04)):
        g.pb.button_press(button)
        g.run(20)
        dirs.append((button, [g.ball(i)[2] for i in range(3) if g.ball(i)[4] != 0xFF and g.ball(i)[3] != 0]))
        g.pb.button_release(button)
        g.run(2)
    left = [s for s in steer if s[1] & 2]
    right = [s for s in steer if s[1] & 1 and not s[1] & 2]
    claim('Antigravity: B (the direction) is $1c while left is held and $04 while only right is held at setBallDirections (%d and %d hits)' % (len(left), len(right)),
          left and right and all(s[0] == 0x1C for s in left) and all(s[0] == 0x04 for s in right))
    claim('Antigravity: gameplay_AntigravitySteering ran every frame it was active (%d hits since the start)' % (g.count('Gameplay_AntigravitySteering') - hits0['Gameplay_AntigravitySteering']),
          g.count('Gameplay_AntigravitySteering') > hits0['Gameplay_AntigravitySteering'] + 20)
    # ---- Triple ball: split
    C.recover(g)
    g.play(200)
    splits = []
    pend = []
    trace(g, 'UpdateBall_Split', lambda: pend.append(g.peek('wMultiBallPending')))
    trace(g, 'UpdateBall_Split.seekNewBallSlot', lambda: splits.append((g.frame, g.peek('wBallWorkDirection'), g.peek('wMultiBallPending'), g.peek('wBallLoopCount'))))
    ok = C.catch_powerup(g, 9)
    g.play(60, launch=False)
    claim('Triple ball caught: UpdateBall_Split ran the split once (seekNewBallSlot hits %d) and wBallCount became 3' % len(splits), ok and len(splits) >= 1 and g.peek('wBallCount') == 3,
          g.peek('wBallCount'))
    claim('UpdateBall_Split ran %d times; wMultiBallPending was not 0 at %d of them and the split body (seekNewBallSlot) ran exactly then'
          % (len(pend), len([p for p in pend if p])), len(pend) > 100 and len([p for p in pend if p]) == len(splits) >= 1, sorted(set(pend)))
    # ---- real wBallWorkFlags on slots 1 and 2: balls only meet walls
    base = g.syms['wBrickMap']
    for r in range(1, 17):
        g.sync_poke(base + 16 * r + 1, *([0] * 9))
    g.sync_poke('wBricksLeft', 200)
    snap = []
    flags_seen = {1: {}, 2: {}}
    lookups = []
    trace(g, 'Gameplay_UpdateBalls', lambda: snap.append([tuple(g.mem[g.syms['wBalls'] + 7 * i + k] for k in range(7)) for i in range(3)]))

    def look():
        # slot of the ball being updated: the snapshot slot with the same position bytes
        cur = (g.peek('wBallWorkYSub'), g.peek('wBallWorkY'), g.peek('wBallWorkXSub'), g.peek('wBallWorkX'))
        if not snap:
            return
        for i, b in enumerate(snap[-1][:max(1, g.peek('wBallCount'))]):
            if b[:4] == cur:
                lookups.append((g.frame, i, g.peek('wBallWorkFlags'), g.peek('wBallWorkDirection')))
                return
    trace(g, 'UpdateBall_Move.lookupVelocity', look)
    for frame in range(2500):
        if g.state != 2:
            break
        if g.peek('wBallCount') < 3:
            C.catch_powerup(g, 9)
            for r in range(1, 17):
                g.sync_poke(base + 16 * r + 1, *([0] * 9))
            g.sync_poke('wBricksLeft', 200)
        g.play(5, launch=False)
        for i in (1, 2):
            f = g.ball(i)[4]
            if f != 0xFF:
                flags_seen[i][f] = flags_seen[i].get(f, 0) + 1
    real = {i: sorted(v) for i, v in flags_seen.items()}
    note('wBallWorkFlags values seen on slot 1: %s, slot 2: %s' % (real[1], real[2]))
    note('lookupVelocity rows: %d, on slots 1/2 with flags != 0: %d' % (len(lookups), len([l for l in lookups if l[1] in (1, 2) and l[2]])))
    nz = {i: [f for f in real[i] if f] for i in (1, 2)}
    claim('OBSERVED: a nonzero wBallWorkFlags from real play (not poked) appeared on ball slot 1 or 2 (slot 1 %s, slot 2 %s)' % (nz[1][:4], nz[2][:4]),
          bool(nz[1] or nz[2]))
    top = max([l[2] for l in lookups if l[1] in (1, 2)] or [0])
    claim('OBSERVED: the real flag counter on slots 1 and 2 reached %d at lookupVelocity (wall hits counted per ball), %d lookups on those slots' % (top, len([l for l in lookups if l[1] in (1, 2)])),
          top >= 3)
    nudge_rows = [l for l in lookups if l[1] in (1, 2) and l[2] & 0x80]
    note('lookupVelocity with bit 7 of the flags on slot 1 or 2 from real play: %d times; the bit 7 nudge on those slots stays poke-only (x2_triple_nudge)' % len(nudge_rows))


# --------------------------------------------------------------------------- driver

def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--scenario', action='append', default=[])
    ap.add_argument('--rom', default=os.path.join(ROOT, 'game.gbc'))
    ap.add_argument('--frames', type=int, default=600000)
    ap.add_argument('--verbose', action='store_true')
    ap.add_argument('--list', action='store_true')
    args = ap.parse_args()
    C.VERBOSE = args.verbose
    if args.list:
        for n, fn in SCENARIOS.items():
            print('%-20s %s' % (n, (fn.__doc__ or '').strip().split('\n')[0]))
        return 0
    names = []
    for s in args.scenario or ['all']:
        names.extend([n for n in SCENARIOS if n not in ('c0_sound',)] if s == 'all' else [s])
    for n in names:
        g = make_game(args.rom, args.frames)
        g.rom_path = args.rom
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

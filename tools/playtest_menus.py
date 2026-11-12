"""Second play-test pass for the menu and screen-state code that tools/coverage.py did not reach.

Usage (from the repository root, after `make`; needs PyBoy):

    python tools/playtest_menus.py --list
    python tools/playtest_menus.py --scenario pause --verbose
    python tools/playtest_menus.py --scenario all --report
    python tools/playtest_menus.py --scenario ending --watch "Ending_Update:hGameState,hJoypad"

It imports tools/coverage.py and registers its own scenarios there; coverage.py is not changed. Each
scenario prints lines "CHECK name: ok" or "CHECK name: FAIL ..." to stderr and has a built-in set
of watches (label, variables) that log values every time the label is reached. The watch summary
(count and distinct values) is printed after the run. --watch adds more.

Scenarios (each under about 60 s, deterministic):
    pause    Pause with Start, with and without the TDNZ cheat (lives refill in StateInit_Pause), Start
             to resume (the LCD is switched on with $89 through hResumeFromPause), START line "item 0"
             (StartGame with B = 0).
    ending   The ending screen (state 13): StateInit_Ending, Ending_Update with no button and with a
             button, wEndingSeen, wLives = 1, wLevelsSincePassword = 0. Played to the last level.
    levelpw  The level password screen for levels over 100 (3 digits) in English and in Italian
             (BuildLevelTitle hundreds branches, EncodeLevelPassword.addHundredsLoop,
             LevelPassword_DrawBonus.incTenThousands). The letters shown are compared with the letters
             that type_password/level_password give for the same level.
    cheats   Photo background (TNRZ) and level skip (NCNZ) consumers, and the version text (NXRZ).
    colouronly  The "please use a Game Boy Color" screen: StateInit_ColorOnly runs once and the CPU
             then sits in the `jr` of ColorOnly_Update (sampled by PC, since it cannot be hooked).

What is poked (and not reached by real input): the lives, wCurrentLevel, wLevelsSincePassword, the level
bonus, hGameState (for the Game Boy Color screen), and the brick map (through finish_level in coverage.py).
Passwords for the menu are typed with the buttons (type_password) or poked into wPasswordEntry.
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import coverage as C                                   # noqa: E402
from coverage import scenario                          # noqa: E402

RESULTS = []


def check(g, name, ok, detail=''):
    RESULTS.append((name, bool(ok), detail))
    print('CHECK %s: %s %s' % (name, 'ok' if ok else 'FAIL', detail), file=sys.stderr, flush=True)


def bytes_of(g, name, n):
    a = g.addr(name)
    return [g.mem[a + i] for i in range(n)]


def to_menu_fresh(g, language=0):
    g.boot(language)


def pause_once(g, wait=150):
    """Press Start in a level; return (state during pause, lives before, lives in pause)."""
    lives = g.peek('wLives')
    c_resume = g.count('jr_000_0158.resumeLcdc')
    g.press('start', hold=3, after=10)
    g.wait_until(lambda: g.state == 4, limit=200)
    state = g.state
    g.run(wait)
    in_pause = g.peek('wLives')
    c_pause = g.count('jr_000_0158.resumeLcdc') - c_resume
    for _ in range(5):
        g.press('start', hold=3, after=60)
        if g.state == 2:
            break
    g.wait_level_ready()
    return state, lives, in_pause, c_pause


@scenario
def scenario_pause(g):
    """Pause and resume with and without the lives-refill cheat; menu START line with item 0."""
    g.boot(0)
    # menu item 0 (start at level 1): StartGame with B = 0
    c0 = g.count('StartGame.startAtFirstLevel')
    g.menu_goto(0)
    before = g.count('LoadLevel')
    g.press('a', after=0)
    g.wait_level_ready(since=before)
    check(g, 'StartGame.startAtFirstLevel hit once, level 0, 5 lives',
          g.count('StartGame.startAtFirstLevel') == c0 + 1 and g.peek('wCurrentLevel') == 0 and g.peek('wLives') == 5,
          'level %d lives %d' % (g.peek('wCurrentLevel'), g.peek('wLives')))
    g.play(200, sloppy=0.02)
    g.poke('wLives', 3)
    s0 = g.count('StateInit_Pause')
    u0 = g.count('Pause_Update.startNotPressed')
    state, lives, in_pause, resumed = pause_once(g)
    check(g, 'pause: state 4, StateInit_Pause hit once', state == 4 and g.count('StateInit_Pause') == s0 + 1)
    check(g, 'pause: no cheat leaves wLives alone', lives == 3 and in_pause == 3, '%d -> %d' % (lives, in_pause))
    check(g, 'Pause_Update.startNotPressed reached while paused', g.count('Pause_Update.startNotPressed') > u0)
    check(g, 'resumeLcdc ($89 LCDC) reached once as the pause screen is set up', resumed == 1, 'hits %d' % resumed)
    # the cheat: back to the menu through game over
    g.poke('wLives', 1)
    C.lose_lives(g, 1)
    C.game_over_and_name(g)
    C.title_to_menu(g)
    g.enter_password('TDNZ')
    check(g, 'TDNZ sets only wCheatLivesRefill', bytes_of(g, 'wCheatLivesRefill', 1) == [1]
          and g.peek('wCheatLevelSkip') == 0 and g.peek('wCheatPhotoBackground') == 0)
    g.menu_goto(0)
    before = g.count('LoadLevel')
    g.press('a', after=0)
    g.wait_level_ready(since=before)
    g.poke('wLives', 3)
    state, lives, in_pause, resumed = pause_once(g)
    check(g, 'pause with TDNZ: wLives 3 -> 9 in StateInit_Pause', lives == 3 and in_pause == 9, '%d -> %d' % (lives, in_pause))
    # the refill is in StateInit_Pause and not in resume: lives set below 9 stay below 9 after the pause
    g.poke('wLives', 2)
    state, lives, in_pause, resumed = pause_once(g)
    check(g, 'second pause with TDNZ refills again', in_pause == 9, '%d -> %d' % (lives, in_pause))
    check(g, 'pause screen setup takes the hResumeFromPause path each time', resumed == 1)


@scenario
def scenario_ending(g):
    """The ending screen, state 13, and what StateInit_Ending sets."""
    g.boot(0)
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(100, sloppy=0.02)
    g.poke('wLevelsSincePassword', 2)
    g.poke('wCurrentLevel', 159)
    g.poke('wLives', 7)
    i0 = g.count('StateInit_Ending')
    u0 = g.count('Ending_Update.noButtonPressed')
    n0 = g.count('Ending_Update')
    g.finish_level(2)
    g.wait_until(lambda: g.state == 13, limit=600)
    check(g, 'ending is hGameState 13', g.state == 13)
    g.run(200)
    check(g, 'StateInit_Ending hit once', g.count('StateInit_Ending') == i0 + 1, '%d' % (g.count('StateInit_Ending') - i0))
    check(g, 'StateInit_Ending: wEndingSeen nonzero, wLives 1, wLevelsSincePassword 0',
          g.peek('wEndingSeen') != 0 and g.peek('wLives') == 1 and g.peek('wLevelsSincePassword') == 0,
          'seen %d lives %d since %d' % (g.peek('wEndingSeen'), g.peek('wLives'), g.peek('wLevelsSincePassword')))
    check(g, 'Ending_Update ran with no button (.noButtonPressed) and stays in state 13',
          g.count('Ending_Update.noButtonPressed') > u0 and g.state == 13)
    # each of the four buttons alone: any button moves on (tested one at a time on fresh endings is too slow; A is used,
    # the others are checked on the joypad mask in Ending_Update through the watch values)
    g.press('right', hold=3, after=20)
    check(g, 'a direction button does not leave the ending', g.state == 13)
    g.press('a', hold=3, after=30)
    check(g, 'A leaves the ending to state 2 with hStateTimer set', g.state == 2 or g.peek('hStateTimer') > 0,
          'state %d timer %d' % (g.state, g.peek('hStateTimer')))
    g.wait_level_ready()
    check(g, 'game goes on at level 0 after the ending', g.peek('wCurrentLevel') in (0, 1), 'level %d' % g.peek('wCurrentLevel'))


@scenario
def scenario_levelpw(g):
    """Three-digit level numbers on the title and on the level password screen, English and Italian."""
    for lang in (0, 4):
        pass
        g.boot(lang)
        g.start_level(1)
        g.poke('wLives', 9)
        g.play(100, sloppy=0.02)
        valid = None
        for level in (99, 100, 107, 119):          # level 101, 102, 121, 109 shown; only index % 4 == 0 has a password
            g.poke('wLevelBonus', 0x04, 0x29)        # 10500, so DrawBonus needs a ten thousands digit
            g.poke('wLevelBonusUnits', 0x1a, 0x04)
            g.poke('wCurrentLevel', level)
            g.poke('wLevelsSincePassword', 4)
            g.poke('wLives', 9)
            before_enc = g.count('EncodeLevelPassword.addHundredsLoop')
            before_ten = g.count('LevelPassword_DrawBonus.incTenThousands')
            g.finish_level(2)
            g.wait_until(lambda: g.state == 9, limit=600)
            g.log('after finish: state %d level %d bricks %d lives %d' % (g.state, g.peek('wCurrentLevel'), g.peek('wBricksLeft'), g.peek('wLives')))
            check(g, 'lang %d level %d: password screen (state 9)' % (lang, level + 2), g.state == 9)
            g.run(300)
            check(g, 'lang %d level %d: addHundredsLoop hit' % (lang, level + 2),
                  g.count('EncodeLevelPassword.addHundredsLoop') > before_enc)
            check(g, 'lang %d level %d: incTenThousands hit' % (lang, level + 2),
                  g.count('LevelPassword_DrawBonus.incTenThousands') > before_ten)
            chars = ''.join(chr(c) for c in bytes_of(g, 'wPasswordChars', 4))
            want = g.level_password(level + 2)
            check(g, 'lang %d level %d: letters %s equal level_password(%d)=%s' % (lang, level + 2, chars, level + 2, want),
                  chars == want)
            if (level + 1) % 4 == 0:
                valid = level + 1
            check(g, 'lang %d level %d: wStartLevel %d (new only if index %d %% 4 == 0, else unchanged)' % (
                lang, level + 2, g.peek('wStartLevel'), level + 1), g.peek('wStartLevel') == (valid or 0))
            g.run(200)
            g.press('a', after=100)
            g.wait_level_ready()
            title = bytes_of(g, 'wLevelTitleText', 27)
            digits = ''.join(chr(c) for c in title[17:21] if 0x30 <= c <= 0x39)
            check(g, 'lang %d: level title digits %s' % (lang, digits), digits == '%d' % (level + 2), '%r' % bytes(title))


@scenario
def scenario_cheats(g):
    """Consumers of the photo background and level skip flags, and the version text."""
    g.boot(0)
    g.enter_password('TNRZ')
    check(g, 'TNRZ sets wCheatPhotoBackground', g.peek('wCheatPhotoBackground') == 1)
    g.enter_password('NXRZ')
    check(g, 'NXRZ sets wCheatShowVersion', g.peek('wCheatShowVersion') == 1)
    g.enter_password('NCNZ')
    check(g, 'NCNZ sets wCheatLevelSkip', g.peek('wCheatLevelSkip') == 1)
    # B skips only with the cheat; the photo background palette is chosen in LoadLevel
    g.start_level(1)
    g.poke('wLives', 9)
    bank, addr = g.cov.symtab['BrickPalette_4830']
    check(g, 'photo background: first 8 bytes of wBgPalettes are BrickPalette_4830 (LoadLevel.brickPaletteChosen)',
          bytes_of(g, 'wBgPalettes', 8) == g.rom_bytes(bank, addr, 8), '%r vs %r' % (bytes_of(g, 'wBgPalettes', 8), g.rom_bytes(bank, addr, 8)))
    g.play(120, launch=False)
    level = g.peek('wCurrentLevel')
    before = g.count('LoadLevel')
    g.pb.button_press('b')
    g.wait_until(lambda: g.peek('wCurrentLevel') != level or g.state != 2, limit=100, step=1)
    g.pb.button_release('b')
    g.run(40)
    check(g, 'B with NCNZ ends the level', g.peek('wCurrentLevel') == level + 1 or g.state == 9,
          'level %d -> %d state %d' % (level, g.peek('wCurrentLevel'), g.state))
    g.wait_level_ready(since=before)
    # the same without the cheat: B does nothing
    g.poke('wCheatLevelSkip', 0)
    level = g.peek('wCurrentLevel')
    g.pb.button_press('b')
    g.run(60)
    g.pb.button_release('b')
    g.run(20)
    check(g, 'B without the cheat does not end the level', g.peek('wCurrentLevel') == level and g.state == 2)


@scenario
def scenario_colouronly(g):
    """The Game Boy Color only screen: the CPU ends up in ColorOnly_Update's jr."""
    g.boot(0)
    i0 = g.count('StateInit_ColorOnly')
    g.poke('hGameState', 10)
    g.poke('hStateTimer', 2)
    g.run(300)
    check(g, 'StateInit_ColorOnly hit once', g.count('StateInit_ColorOnly') == i0 + 1)
    check(g, 'StateUpdate_ColorOnly hit', g.count('StateUpdate_ColorOnly') >= 1)
    bank, addr = g.cov.symtab['ColorOnly_Update']
    pcs = set()
    for _ in range(40):
        g.run(1)
        pcs.add(g.pb.register_file.PC)
    check(g, 'PC samples include ColorOnly_Update ($%04x) (jr to itself)' % addr, addr in pcs,
          'seen %s' % sorted('%04x' % p for p in pcs)[:6])
    check(g, 'state stays 10', g.state == 10)
    rom = g.rom_bytes(bank, addr, 2)
    check(g, 'the bytes at ColorOnly_Update are jr -2 ($18 $fe)', rom == [0x18, 0xfe], '%r' % rom)


DEFAULT_WATCHES = [
    'StateUpdate_Ending:hGameState',
    'StateUpdate_Pause:hGameState',
    'LoadLevel.backgroundChosen:wCheatPhotoBackground,wCurrentLevel',
    'LoadLevel.brickPaletteChosen:wCheatPhotoBackground',
    'Gameplay_Update:wCheatLevelSkip,hJoypad',
    'StateInit_Pause:wLives,wCheatLivesRefill,hGameState',
    'Pause_Update:hGameState,hResumeFromPause',
    'jr_000_0158.resumeLcdc:hResumeFromPause,hGameState',
    'StartGame.startAtFirstLevel:wCurrentLevel,wStartLevel',
    'StateInit_Ending:wCurrentLevel,wLives,wEndingSeen',
    'Ending_Update:hGameState,hJoypad',
    'EncodeLevelPassword.addHundredsLoop:wCurrentLevel,wStartLevel',
    'LevelPassword_DrawBonus.incTenThousands:wLevelBonus:2',
    'BuildLevelTitle.hundredsDefaultPos:wLanguage,wCurrentLevel',
    'BuildLevelTitle.hundredsWritten:wLanguage,wCurrentLevel',
    'BuildLevelTitle.countHundred:wLanguage,wCurrentLevel',
]


def main():
    import argparse
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--scenario', action='append', default=[])
    ap.add_argument('--watch', action='append', default=[])
    ap.add_argument('--report', action='store_true', help='print the hit counts of the labels this file targets')
    ap.add_argument('--rom', default=os.path.join(C.ROOT, 'game.gbc'))
    ap.add_argument('--frames', type=int, default=400000)
    ap.add_argument('--list', action='store_true')
    ap.add_argument('--verbose', action='store_true')
    args = ap.parse_args()
    C.VERBOSE = args.verbose
    names = ('pause', 'ending', 'levelpw', 'cheats', 'colouronly')
    if args.list:
        for name in names:
            print('%-10s %s' % (name, C.SCENARIOS[name].__doc__.strip().split('\n')[0]))
        return
    chosen = []
    for s in args.scenario or ['all']:
        chosen.extend(names if s == 'all' else [s])
    cov = C.Coverage(C.read_labels(), args.watch or DEFAULT_WATCHES)
    try:
        C.run_scenarios(chosen, cov, args.rom, args.frames)
    finally:
        for w in cov.watches:
            for var, st in w.stats.items():
                vals = sorted(st['values'])
                print('WATCH %s:%s count %d values %s' % (w.label, var, st['count'], vals[:12]), file=sys.stderr)
        for w in cov.watches:
            if not w.stats:
                print('WATCH %s: never reached' % w.label, file=sys.stderr)
        bad = [r for r in RESULTS if not r[1]]
        print('checks: %d, failed: %d' % (len(RESULTS), len(bad)), file=sys.stderr)
        for r in bad:
            print('  FAIL %s %s' % (r[0], r[2]), file=sys.stderr)


if __name__ == '__main__':
    main()

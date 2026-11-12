"""Play-test scenarios for the sound names and comments that the first pass left unconfirmed.

Usage (from the repository root, after `make`, PyBoy installed, one emulator at a time):

    python tools/playtest_sound.py --list
    python tools/playtest_sound.py --static
    python tools/playtest_sound.py --scenario snd_gameover --verbose
    python tools/playtest_sound.py --scenario snd_clock --verbose
    python tools/playtest_sound.py --scenario snd_patterns --verbose
    python tools/playtest_sound.py --scenario snd_unused --verbose

It reuses tools/coverage.py (all its options work). Scenarios and what they check:

    snd_gameover   StateInit_GameOver: the game over song is started when wSfxOff is 0 and is not started
                   when wSfxOff is 1 (switched with the buttons in the menu), whatever wMusicOff is.
                   Real input except that the lives are poked to 1 to save time.
    snd_clock      UpdateBall.effectTimerNot18: the Clock (Sleepy ball) wake-up sound, asked for twice
                   (two consecutive frames with wBallEffectTimer = $18). The Clock is
                   dropped onto the bat with the harness (a poked falling power-up), the rest is played.
                   Logs every PlaySfx call with the value of wBallEffectTimer.
    snd_patterns   The songs are forced one after another (the program counter is changed when the game
                   enters UpdateSoundDriver, as in tools/sound_relocation_test.py) and the pattern
                   pointers of the four channels are sampled every frame. Reports the patterns read.
    snd_unused     Effect 29 is forced: it plays only when forced (see --static for the callers).

--static does not run the emulator. It scans the assembly for every call of PlaySound and reports the
effect numbers that can be requested, and follows the song headers, order lists and pattern jumps in the
ROM to list the patterns no song can reach.
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import coverage as C                                            # noqa: E402
from coverage import scenario, title_to_menu, lose_lives, catch_powerup   # noqa: E402

ROOT = C.ROOT


# --------------------------------------------------------------------------- helpers

def sym_list(bank):
    out = []
    for line in open(os.path.join(ROOT, 'game.sym')):
        m = re.match(r'([0-9a-f]{2}):([0-9a-f]{4}) (\S+)$', line.strip())
        if m and int(m[1], 16) == bank:
            out.append((int(m[2], 16), m[3]))
    return sorted(out)


def force_call(g, label, e=0):
    """At the next UpdateSoundDriver call, make the game call `label` (PlaySong or PlaySfx) first,
    with E = e. The routine returns into UpdateSoundDriver."""
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


def boot_quick(g):
    g.run(1200)                      # the language menu is up and nothing else touches the sound


# --------------------------------------------------------------------------- snd_gameover

def gameover_case(g, sfx_off, music_off):
    """From the main menu: set the switches with buttons, start level 1, lose the last life.
    Returns (wSfxOff, wMusicOff at StateInit_GameOver, E of every PlaySong in the next 40 frames)."""
    for item, want in ((3, music_off), (4, sfx_off)):
        key = 'wMusicOff' if item == 3 else 'wSfxOff'
        g.menu_goto(item)
        for _ in range(3):
            if g.peek(key) == want:
                break
            g.press('a', hold=3, after=30)
        assert g.peek(key) == want, 'could not set %s' % key
    g.start_level(1)
    g.poke('wLives', 1)
    seen = {}
    started = []

    def arm_song():
        started.append(g.pb.register_file.E)
        g.at('PlaySong', arm_song)

    def at_init():
        seen['sfx'] = g.peek('wSfxOff')
        seen['music'] = g.peek('wMusicOff')
        seen['frame'] = g.frame
        g.at('PlaySong', arm_song)
    g.at('StateInit_GameOver', at_init)
    lose_lives(g, 1, limit=3000)
    g.wait_until(lambda: 'frame' in seen, limit=1500)
    g.run(40)
    return seen.get('sfx'), seen.get('music'), list(started)


@scenario
def snd_gameover(g):
    """Game over song with the sound effects switch on and off (wSfxOff gates it, not wMusicOff)."""
    g.boot()
    results = []
    for sfx_off, music_off in ((1, 0), (0, 0), (1, 1), (0, 1)):
        if g.state != 1:
            title_to_menu(g)
        r = gameover_case(g, sfx_off, music_off)
        results.append(((sfx_off, music_off), r))
        g.log('wSfxOff=%d wMusicOff=%d -> at init sfx=%s music=%s, PlaySong E values %s' % ((sfx_off, music_off) + r))
        C.game_over_and_name(g)
        title_to_menu(g)
    ok = True
    for (sfx_off, music_off), (s, m, started) in results:
        expect_song = (sfx_off == 0)
        got_song = 7 in started
        if s != sfx_off or m != music_off or expect_song != got_song:
            ok = False
        print('SND_GAMEOVER wSfxOff=%d wMusicOff=%d song7_started=%s expected=%s songs=%s' % (
            sfx_off, music_off, got_song, expect_song, started))
    print('SND_GAMEOVER %s' % ('claim holds in all 4 cases' if ok else 'MISMATCH'))


# --------------------------------------------------------------------------- snd_clock

@scenario
def snd_clock(g):
    """Clock (Sleepy ball): the wake-up sound is asked for on the 2 frames in which wBallEffectTimer is $18."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(200)
    calls = []

    def arm():
        r = g.pb.register_file
        calls.append((g.frame, r.E, g.peek('wBallEffectTimer'), g.peek('wSleepyBallActive')))
        g.at('PlaySfx', arm)
    g.at('PlaySfx', arm)
    caught = catch_powerup(g, 6)
    g.play(700, sloppy=0.0)
    wake = [c for c in calls if c[1] == 22]
    others = [c for c in calls if c[1] != 22 and c[3]]
    print('SND_CLOCK caught=%s timer_now=%d sleepy_now=%d' % (caught, g.peek('wBallEffectTimer'), g.peek('wSleepyBallActive')))
    print('SND_CLOCK wake-up calls (frame, E, wBallEffectTimer, wSleepyBallActive): %s' % wake)
    print('SND_CLOCK other effects while asleep: %d (E values %s)' % (len(others), sorted({c[1] for c in others})))
    print('SND_CLOCK UpdateBall.effectTimerNot18 hits: %d' % g.count('UpdateBall.effectTimerNot18'))
    # wBallEffectTimer counts down once every 2 frames, so it is $18 for 2 frames and the sound is asked for twice
    ok = len(wake) == 2 and all(c[2] == 0x18 and c[3] != 0 for c in wake) and wake[1][0] == wake[0][0] + 1
    print('SND_CLOCK %s' % ('claim holds' if ok else 'MISMATCH'))


# --------------------------------------------------------------------------- snd_patterns

@scenario
def snd_patterns(g):
    """Force every song and sample the pattern pointers; report the patterns that were read."""
    boot_quick(g)
    syms = sym_list(6)
    allsyms = [a for a, _ in syms]
    ends = {}
    for a, n in syms:
        if n.startswith('Pattern_'):
            ends[n] = (a, min(x for x in allsyms if x > a))
    ptrs = [g.syms[n] for n in ('wCh1PatternPtr', 'wCh2PatternPtr', 'wCh3PatternPtr', 'wCh4PatternPtr')]
    read = {}
    frames_per_song = int(os.environ.get('SND_SONG_FRAMES', '5600'))
    for song in range(10):
        force_call(g, 'PlaySong', e=song)
        for _ in range(frames_per_song):
            g.run(1)
            for p in ptrs:
                v = g.mem[p] | g.mem[p + 1] << 8
                if 0x4000 <= v < 0x8000:
                    for n, (lo, hi) in ends.items():
                        if lo < v <= hi:
                            read.setdefault(n, set()).add(song)
        g.log('song %d done, %d patterns so far' % (song, len(read)))
    never = sorted(n for n in ends if n not in read)
    print('SND_PATTERNS frames per song %d' % frames_per_song)
    print('SND_PATTERNS read: %d of %d patterns' % (len(read), len(ends)))
    print('SND_PATTERNS never read: %s' % never)


# --------------------------------------------------------------------------- snd_unused

@scenario
def snd_unused(g):
    """Effect 29 plays only when forced: force it and see which channel it takes."""
    boot_quick(g)
    seen = []
    g.run(100)
    force_call(g, 'PlaySfx', e=29)
    for _ in range(200):
        g.run(1)
        seen.append((g.mem[g.syms['wSfxChannel']], g.mem[g.syms['wSfxChannel'] + 1]))
    print('SND_UNUSED effect 29 forced: wSfxChannel values seen %s' % sorted(set(seen)))


# --------------------------------------------------------------------------- static scan

def static_scan():
    import glob
    consts = {}
    for line in open(os.path.join(ROOT, 'include', 'sound.inc')):
        m = re.match(r'DEF (SFX_\w+)\s+EQU (\d+)', line)
        if m:
            consts[m[1]] = int(m[2])
    loaded = {}
    dynamic = []
    for f in sorted(glob.glob(os.path.join(ROOT, 'banks', '*.asm'))):
        lines = open(f).read().split('\n')
        for i, l in enumerate(lines):
            if re.search(r'\b(call|jp)\s+PlaySound\b', l):
                j = i - 1
                while j > 0 and not re.match(r'\s*(ld a,|xor a)', lines[j]):
                    j -= 1
                src = lines[j].strip()
                m = re.match(r'ld a, (SFX_\w+)', src)
                if m:
                    loaded.setdefault(consts[m[1]], []).append(m[1])
                elif src == 'xor a':
                    loaded.setdefault(0, []).append('xor a')
                else:
                    dynamic.append((os.path.basename(f), i + 1, src))
    print('STATIC effects requested by a call of PlaySound: %s' % sorted(loaded))
    print('STATIC effects never requested: %s' % [n for n in range(30) if n not in loaded])
    print('STATIC calls that load A from a register: %s' % dynamic)
    reach_patterns()


def reach_patterns():
    data = open(os.path.join(ROOT, 'game.gbc'), 'rb').read()
    syms = sym_list(6)
    byname = {n: a for a, n in syms}

    def rb(addr):
        return data[6 * 0x4000 + addr - 0x4000]

    def w(addr):
        return rb(addr) | rb(addr + 1) << 8
    pat_table = byname['PatternPointers']
    npat = (min(a for a, _ in syms if a > pat_table) - pat_table) // 2
    patterns, orders, todo = set(), set(), []

    def pattern_end(a):
        """Parse a pattern: its jump target (an order list address) or None if it ends with 00."""
        while True:
            n = rb(a)
            if n == 0x00:
                return None
            if n == 0xFF:
                return w(a + 1)
            a += 2 if rb(a + 1) in (0xFD, 0xFE, 0xFF) else 3
    for name, hdr in byname.items():
        if name.startswith('SongHeader_'):
            for ch in range(4):
                todo.append(w(hdr + 2 * ch))
    # An order list entry is (transpose, pattern); a transpose of $ff is an ordinary value. The list
    # goes on entry by entry until a pattern ends with a jump, which goes to another order list.
    while todo:
        a = todo.pop()
        while a not in orders:
            orders.add(a)
            p = rb(a + 1)
            if p >= npat:
                break
            patterns.add(p)
            t = pattern_end(w(pat_table + 2 * p))
            if t is not None:
                todo.append(t)
                break
            a += 2
    names = {p: [n for a, n in syms if a == w(pat_table + 2 * p) and n.startswith('Pattern_')] for p in range(npat)}
    print('STATIC patterns in the table: %d, reachable from the song headers: %d' % (npat, len(patterns)))
    print('STATIC unreachable pattern numbers: %s' % [(p, names[p]) for p in range(npat) if p not in patterns])
    print('STATIC labelled data after the pattern table: ordered check uses npat=%d' % npat)


if __name__ == '__main__':
    if '--static' in sys.argv:
        static_scan()
    else:
        C.main()

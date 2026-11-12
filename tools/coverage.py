"""Coverage and watch harness: play the game in PyBoy and see which labels run.

A label name makes a claim about the code ("UpdateUfoBomb", "SpawnPowerup.checkType9"). This tool lets
you check the claim by running the game. It hooks every label that sits on code, counts how often each
one is reached and can log RAM variables every time a label is reached.

Usage (needs PyBoy; run from the repository root after `make`, which builds game.gbc and game.sym):

    python tools/coverage.py --list
    python tools/coverage.py --scenario enemies --report
    python tools/coverage.py --scenario all --out coverage.json --report
    python tools/coverage.py --scenario powerups --watch "SpawnPowerup:wBallCount,wFallingPowerups:12"
    python tools/coverage.py --scenario weapons --watch "Shots_FireRocketOrLaser.fireSlot0:wShots:4" --verbose

Options:
    --scenario NAME   levels, powerups, weapons, enemies, menus or all (repeat the option for several).
                      A scenario is a scripted, repeatable play session. `all` runs every scenario,
                      each on a fresh emulator, and adds the counts together.
    --watch SPEC      "Label:var,var,..." Every time Label is reached, the listed variables are read
                      and logged. Label is a name from game.sym, global or `Routine.local`. A variable is
                      a name from include/ram.inc, a hex address like $c200, `name+N` for N bytes past a
                      name, or `name:N` for N bytes read together as a list (`wFallingPowerups:12` is one
                      12-byte slot). Repeat --watch for more labels. For each variable you get the first
                      2000 values in order with the frame number, plus the count, the smallest, the
                      largest and the set of distinct values (at most 64 are kept).
    --out FILE        Write JSON: {"labels": {name: {hits, bank, addr}}, "watches": {...}}.
    --report          Print the coverage per bank, the routines that were never reached and the
                      labels never hit inside routines that were reached ("partial": a local label
                      that never runs although its routine does).
    --merge FILE      Add the hit counts of an earlier --out file (to combine separate runs).
    --verbose         Print progress messages from the scenarios.
    --rom FILE        ROM to play (default game.gbc in the repository root).
    --frames N        Stop a scenario after N emulated frames (a safety limit, default 400000).
    --list            List the scenarios and exit.

Scenarios (each takes 20 to 35 seconds, about 140 seconds for all; they are deterministic):
    levels    Plays levels with a bot that follows the ball and launches it, with random bat moves, bat
              and wall bounces, lost lives, pause and resume, finishing levels 1 to 5 (the level
              password screen after level 4, with a bonus over 10000 and a three-digit level), game
              over with the high score name entry, the cheats TDNZ and NCNZ, skipping levels with B,
              the ending (twice: skipped from level 160 and played to the last brick), the game that
              goes on after the ending, a level with an unbreakable top row, bricks broken in every
              arrangement of neighbours.
    powerups  All 16 power-ups dropped onto the bat and left to run out; the drop rules in SpawnPowerup
              (random brick, fixed Clock, Clock with and without a weapon, Triple ball with one and
              with several balls) with real bricks; effects on top of each other (Triple ball with
              2 and 3 balls, Ninja with several balls and with shots, Pepper and Magnet, Ghost twice,
              Reverse with Poison, Milk with Poison, Extra life at 9 lives) and Smiley.
    weapons   Rocket, laser, plasma and grenade: shots from every slot, shots hitting bricks and
              unbreakable bricks, charged grenades thrown left, right and straight, grenades and
              blob balls landing on unbreakable bricks at every height, the weapon lost with a life.
    enemies   A UFO level (level 8): bombs that hit the bat and bombs that miss, five ball hits, hits
              from every shot slot, a pass that ends by itself. A blob level (level 6): the blob
              catching and throwing the ball, Ghost and Ninja preventing the catch, several balls,
              random power-up bricks, the last ball held by the blob.
    menus     All five languages (and the ends of the language list), the music and sound switches,
              the cursor up and around, the high score and credits screens that come up by
              themselves, passwords typed with the buttons (the vowels are skipped, B goes back),
              invalid passwords, the four cheat passwords, a three-digit level password, the
              photo background cheat, the version cheat, the level password screen with
              fireworks, and the "please use a Game Boy Color" screen.

What the scenarios poke (all in the scenario code): the password letters; wLives; the brick map (to
leave a few bricks, to plant unbreakable bricks, to set up a brick with a power-up); the ball (to
place it under a brick, in the UFO or in the blob); a falling power-up slot; shots and projectile slots;
the level number (only 1, 5, 9, ... have passwords, so other levels are reached by setting the level
number and finishing the level before); the score and bonus; hGameState for the Game Boy
Color screen. So a label being hit does not always mean a player could get there the same way.

What counts as hookable: every label of game.sym in ROM banks 0, 1, 6 and $0F on a line of code, as
tools/gbasm.py classifies it (the rule tools/rom_map.py uses), plus the targets of calls and jumps in
code (ShowMessage is written as `db $01` but is `ld bc,$0014`). Labels in front of data are skipped.
Several labels at one address share one hook and one count. Left out because they cannot be hooked:
  - RasterHandler_* and RasterNextLines: copied to RAM and run there (PyBoy hooks by patching the
    ROM bytes, so the copy would carry the patch);
  - RST_08 and RST_30: labels in the middle of an instruction in the vector area;
  - ColorOnly_Update: `jr` to itself, an endless loop that PyBoy cannot step out of.
A label on a HALT is hooked on the next byte (a hook on HALT stalls PyBoy).

Things to know when reading the numbers:
  - Reads and writes of $D000 to $DFFF always use WRAM bank 1. The game switches banks, and PyBoy shows
    whichever is switched in, so plain reads can return the wrong bank.
  - PyBoy can fire a hook again and again without running the instruction when the frame ends in
    that very step. The harness notices (the cycle counter has not moved) and runs one extra frame
    with temporary hooks, so the emulator carries on. Such repeats are not counted. The number is printed
    after each scenario. An extra frame is emulated each time.
  - Hits are counted when the instruction is reached, not when it finishes.
  - The harness stops with a message if the emulator stops making progress.
"""
import argparse
import json
import os
import random
import re
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))
CODE_BANKS = (0, 1, 6, 15)
MAX_LOG = 2000
VERBOSE = False
MAX_DISTINCT = 64

CODE = re.compile(r'^(ld|ldh|call|jp|jr|ret|reti|push|pop|add|adc|sub|sbc|and|or|xor|cp|inc|dec|bit|set|res|rst|'
                  r'halt|stop|di|ei|nop|swap|sla|sra|srl|rl|rr|rlc|rrc|rla|rra|rlca|rrca|cpl|ccf|scf|daa)\b')


# --------------------------------------------------------------------------- labels

def code_addresses():
    """Return the set of (bank, address) where a line of code starts, as the checking assembler sees it."""
    from gbasm import Asm
    asm = Asm(ROOT)
    asm.load('game.asm')
    asm.run()
    text = {(p, n): t for p, n, t in asm.lines}
    found = set()
    for path, num, bank, pc, size in asm.listing:
        b = bank if pc >= 0x4000 else 0
        line = re.sub(r'^\.?[A-Za-z_][A-Za-z0-9_.]*::?\s*', '', text[(path, num)]).strip()
        word = re.split(r'\s', line)[0] if line else ''
        if CODE.match(word):
            found.add((b, pc))
    # A table written as `db` can hide real code (`ShowMessage` is `db $01` followed by `inc d`,
    # which is `ld bc,$0014`). The target of a call, jp or jr in code is code too.
    with open(os.path.join(ROOT, 'game.gbc'), 'rb') as f:
        data = f.read()
    from sm83 import op
    for b, pc in list(found):
        offset = pc if b == 0 else b * 0x4000 + pc - 0x4000
        _n, textual, _t = op(data, offset)
        m = re.match(r'(call|jp|jr)( \w+,)? \$([0-9a-f]+)$', textual)
        if m:
            target = int(m[3], 16)
            if target < 0x4000 or b:
                found.add((0 if target < 0x4000 else b, target))
    return found


def read_labels():
    """Return a list of dicts {name, bank, addr, routine} for every hookable label, in address order."""
    code = code_addresses()
    labels = []
    with open(os.path.join(ROOT, 'game.sym')) as f:
        for line in f:
            m = re.match(r'([0-9a-f]{2}):([0-9a-f]{4}) (\S+)$', line.strip())
            if not m:
                continue
            bank, addr, name = int(m[1], 16), int(m[2], 16), m[3]
            if bank not in CODE_BANKS or (bank, addr) not in code:
                continue
            labels.append(dict(name=name, bank=bank, addr=addr))
    labels.sort(key=lambda x: (x['bank'], x['addr']))
    # The routine a label belongs to: the name before the dot, and for jr_/Jump_ names the
    # last ordinary global label before it.
    current = None
    for lab in labels:
        head = lab['name'].split('.')[0]
        if re.match(r'(jr|Jump)_', head):
            lab['routine'] = current or head
        else:
            current = head
            lab['routine'] = head
    # Code that is copied to RAM and runs there cannot be hooked: PyBoy patches the ROM bytes,
    # so the copy would contain the patch. (RasterNextLines is a table of per-line values.)
    # A `jr` to itself (ColorOnly_Update) is an endless loop. PyBoy steps over a hook one instruction
    # at a time and would never leave it.
    from sm83 import op
    with open(os.path.join(ROOT, 'game.gbc'), 'rb') as f:
        data = f.read()
    loops = set()
    for lab in labels:
        offset = lab['addr'] if lab['bank'] == 0 else lab['bank'] * 0x4000 + lab['addr'] - 0x4000
        if op(data, offset)[1] == 'jr $%x' % lab['addr']:
            loops.add(lab['name'])
    # RST_08 and RST_30 are labels in the middle of an instruction (overlapping code in the vector
    # area: `ld bc,$0014` and `ld a,$ff` contain them), so a hook there would patch an operand.
    return [lab for lab in labels if not lab['routine'].startswith('RasterHandler_')
            and lab['routine'] != 'RasterNextLines' and lab['name'] not in ('RST_08', 'RST_30')
            and lab['name'] not in loops]


def read_symtab():
    """Every name in game.sym: {name: (bank, address)}."""
    table = {}
    with open(os.path.join(ROOT, 'game.sym')) as f:
        for line in f:
            m = re.match(r'([0-9a-f]{2}):([0-9a-f]{4}) (\S+)$', line.strip())
            if m:
                table[m[3]] = (int(m[1], 16), int(m[2], 16))
    return table


def ram_symbols():
    """Names from include/ram.inc and hardware names: {name: address}."""
    syms = {}
    for fn in ('include/ram.inc',):
        with open(os.path.join(ROOT, fn)) as f:
            for line in f:
                m = re.match(r'\s*DEF\s+(\w+)\s+EQU\s+\$([0-9a-fA-F]+)', line)
                if m:
                    syms[m[1]] = int(m[2], 16)
    return syms


# --------------------------------------------------------------------------- watches

class Watch:
    """One "Label:var,var" request."""

    def __init__(self, spec, syms):
        label, _, rest = spec.partition(':')
        self.label = label.strip()
        self.vars = []
        for item in rest.split(','):
            item = item.strip()
            if not item:
                continue
            size = 1
            if ':' in item:
                item, _, n = item.rpartition(':')
                size = int(n)
            offset = 0
            if '+' in item:
                item, _, o = item.partition('+')
                offset = int(o, 0)
            if item.startswith('$'):
                addr = int(item[1:], 16)
            else:
                if item not in syms:
                    raise SystemExit('unknown variable %s (not in include/ram.inc)' % item)
                addr = syms[item]
            label_text = item + ('+%d' % offset if offset else '') + (':%d' % size if size > 1 else '')
            self.vars.append((label_text, addr + offset, size))
        self.log = {}
        self.stats = {}

    def record(self, memory, frame):
        for name, addr, size in self.vars:
            value = memory[addr] if size == 1 else tuple(memory[addr + i] for i in range(size))
            log = self.log.setdefault(name, [])
            if len(log) < MAX_LOG:
                log.append((frame, value))
            st = self.stats.setdefault(name, dict(count=0, min=value, max=value, values=set()))
            st['count'] += 1
            if value < st['min']:
                st['min'] = value
            if value > st['max']:
                st['max'] = value
            if len(st['values']) < MAX_DISTINCT:
                st['values'].add(value)

    def to_json(self):
        out = {}
        for name, st in self.stats.items():
            out[name] = dict(count=st['count'], min=st['min'], max=st['max'],
                             values=sorted(st['values']), log=self.log[name])
        return out


# --------------------------------------------------------------------------- the session

class StopScenario(Exception):
    pass


class Coverage:
    """Hit counts for all labels; survives several emulator runs."""

    def __init__(self, labels, watch_specs):
        self.labels = labels
        self.hits = {}                      # (bank, addr) -> count
        self.by_addr = {}
        for lab in labels:
            self.by_addr.setdefault((lab['bank'], lab['addr']), []).append(lab)
        self.syms = ram_symbols()
        self.symtab = read_symtab()
        self.watches = [Watch(s, self.syms) for s in watch_specs]
        for w in self.watches:
            if not any(l['name'] == w.label for l in labels):
                raise SystemExit('--watch: %s is not a hookable code label' % w.label)

    def merge(self, path):
        data = json.load(open(path))
        for name, info in data['labels'].items():
            key = (info['bank'], info['addr'])
            if key in self.by_addr:
                self.hits[key] = self.hits.get(key, 0) + info['hits']

    def label_hits(self, lab):
        return self.hits.get((lab['bank'], lab['addr']), 0)


class Memory:
    """Memory access that always sees WRAM bank 1 at $D000-$DFFF.

    The game switches the WRAM bank (SVBK) now and then, and PyBoy shows whichever bank is
    switched in at that moment, so a plain read could return bytes of another bank."""

    def __init__(self, memory):
        self.m = memory

    def __getitem__(self, addr):
        if 0xD000 <= addr < 0xE000:
            old = self.m[0xFF70] & 7
            self.m[0xFF70] = 1
            value = self.m[addr]
            self.m[0xFF70] = old
            return value
        return self.m[addr]

    def __setitem__(self, addr, value):
        if 0xD000 <= addr < 0xE000:
            old = self.m[0xFF70] & 7
            self.m[0xFF70] = 1
            self.m[addr] = value
            self.m[0xFF70] = old
        else:
            self.m[addr] = value


class Game:
    """A PyBoy session with hooks installed and helpers for scripted play."""

    def __init__(self, cov, rom, frame_limit):
        from pyboy import PyBoy
        self.cov = cov
        self.pb = PyBoy(rom, window='null', sound_emulated=False)
        self.pb.set_emulation_speed(0)
        self.mem = Memory(self.pb.memory)
        self.frame = 0
        self.once = {}
        self.last_hit = ()
        self.last_cycles = -1
        self.last_bank = 0
        self.leftover_hooks = 0
        self.dead_checks = 0
        self.last_frame_counter = -1
        self.unstuck = 0
        self.closed = False
        self.frame_limit = frame_limit
        self.rnd = random.Random(7)
        self.start_watchdog()
        self.syms = cov.syms
        watches = {}
        for w in cov.watches:
            watches.setdefault(w.label, []).append(w)
        with open(rom, 'rb') as f:
            data = self.rom_data = f.read()
        self.hook_at = {}        # (bank, address) -> owner keys counted when that address is reached
        for key in cov.by_addr:
            self.hook_at.setdefault(self._hook_address(key, data), []).append(key)
        for (bank, addr), owners in sorted(self.hook_at.items()):
            watchers = [w for key in owners for l in cov.by_addr[key] for w in watches.get(l['name'], [])]
            self.pb.hook_register(bank, addr, self._hit, (tuple(owners), watchers, bank))

    def _hook_address(self, key, data):
        """Where to put the hook for a label. A hook on a HALT instruction stalls PyBoy, so a
        label on HALT is hooked on the byte after it, which runs when the CPU wakes up."""
        bank, addr = key
        offset = addr if bank == 0 else bank * 0x4000 + addr - 0x4000
        return (bank, addr + 1) if data[offset] == 0x76 else (bank, addr)

    def _hit(self, ctx):
        owners = ctx[0]
        cycles = self.pb._cycles()
        if owners is self.last_hit and cycles == self.last_cycles:
            # No time has passed since the last hit of this hook: PyBoy fired it again without
            # running the instruction. Do not count it; get the emulator moving.
            self.unstick()
            return
        self.last_hit = owners
        self.last_cycles = cycles
        self.last_bank = ctx[2]
        hits = self.cov.hits
        for key in owners:
            hits[key] = hits.get(key, 0) + 1
        for w in ctx[1]:
            w.record(self.mem, self.frame)
        if self.once:
            for key in owners:
                for fn in self.once.pop(key, ()):
                    fn()

    def _dummy(self, ctx):
        """A temporary hook put in by unstick(). It only has to be a breakpoint."""
        cycles = self.pb._cycles()
        if ctx is self.last_hit and cycles == self.last_cycles:
            self.unstick()
            return
        self.last_hit = ctx
        self.last_cycles = cycles
        self.last_bank = ctx[0]

    def mapped_bank(self):
        """The ROM bank that is switched in at $4000 right now (found by comparing the bytes)."""
        window = [self.mem[0x4000 + i] for i in range(0x100)]
        banks = list(CODE_BANKS[1:]) + [b for b in range(1, len(self.rom_data) // 0x4000) if b not in CODE_BANKS]
        for bank in banks:
            rom = self.rom_data[bank * 0x4000: bank * 0x4000 + 0x100]
            if all(a == b or a == 0xDB for a, b in zip(window, rom)):
                return bank
        return 1

    def unstick(self):
        """Run the CPU past the hooked instruction.

        PyBoy single-steps over a hook, but when the frame ends in that very step it does
        nothing and keeps firing the hook. A nested tick() starts a new frame. The step then
        needs a breakpoint on the next instruction too (without one PyBoy takes its illegal
        opcode path and freezes the CPU), so temporary hooks go on every place the instruction
        can continue at: the next instruction, a jump or call target, a return address and
        the interrupt vectors.
        """
        from sm83 import op
        r = self.pb.register_file
        pc = r.PC
        bank = self.last_bank if pc >= 0x4000 else 0
        offset = pc if pc < 0x4000 else bank * 0x4000 + pc - 0x4000
        length, text, _t = op(self.rom_data, offset)
        succ = {pc + length, 0x40, 0x48, 0x50, 0x58, 0x60}
        m = re.search(r'\$([0-9a-f]+)', text)
        if m and re.match(r'(jr|jp|call|rst)', text):
            succ.add(int(m[1], 16))
        if text == 'jp hl':
            succ.add(r.HL)
        if text.startswith('ret'):
            sp = r.SP
            succ.add(self.mem[sp] | self.mem[(sp + 1) & 0xFFFF] << 8)
        mapped = self.mapped_bank() if any(a >= 0x4000 for a in succ) else 0
        added = []
        for a in succ:
            b = 0 if a < 0x4000 else mapped
            if (b, a) in self.hook_at:
                continue                         # a real hook is there; it is a breakpoint, or is the one being stepped
            try:
                self.pb.hook_register(b, a, self._dummy, (b, a))
                added.append((b, a))
            except ValueError:
                pass                             # there is a hook here already
        self.pb.tick()
        self.frame += 1
        for b, a in added:
            try:
                self.pb.hook_deregister(b, a)
            except ValueError:
                self.leftover_hooks += 1
        self.unstuck += 1

    # --- time and input
    def run(self, n):
        for _ in range(n):
            self.pb.tick()
            self.frame += 1
            if self.frame % 100 == 0:
                self.check_alive()
        if self.frame >= self.frame_limit:
            raise StopScenario()

    def check_alive(self):
        """Stop if the game itself has stopped (the frame counter in the VBlank handler stands still)."""
        if self.state != 2:                      # only the level screen is known to count frames
            self.dead_checks = 0
            return
        counter = self.mem[self.syms['hFrameCounter']]
        if counter == self.last_frame_counter:
            self.dead_checks += 1
            if self.dead_checks >= 5:
                raise RuntimeError('the game stopped running at frame %d (state %d); the emulator froze' % (self.frame, self.state))
        else:
            self.dead_checks = 0
        self.last_frame_counter = counter

    def press(self, button, hold=4, after=20):
        self.pb.button_press(button)
        self.run(hold)
        self.pb.button_release(button)
        self.run(after)

    def hold(self, buttons, frames):
        """Hold one or several buttons for some frames."""
        for b in buttons:
            self.pb.button_press(b)
        self.run(frames)
        for b in buttons:
            self.pb.button_release(b)

    def wait_until(self, test, limit=3000, step=5):
        """Run until test() is true. Returns whether it became true within `limit` frames."""
        for _ in range(0, limit, step):
            if test():
                return True
            self.run(step)
        return test()

    # --- memory
    def addr(self, name):
        if isinstance(name, int):
            return name
        if '+' in name:
            n, _, o = name.partition('+')
            return self.syms[n] + int(o, 0)
        return self.syms[name]

    def peek(self, name):
        return self.mem[self.addr(name)]

    def at(self, label, fn):
        """Call fn() the next time the label is reached (inside the emulator, at that instruction)."""
        self.once.setdefault(self.cov.symtab[label], []).append(fn)

    def sync_poke(self, name, *values):
        """Poke at the start of the next game logic update (Gameplay_Update), not at a random point of the frame.

        The game logic copies ball data to work variables and back, so a poke between those steps would be lost."""
        self.at('Gameplay_Update', lambda: self.poke(name, *values))
        self.run(1)
        if self.once:
            self.run(2)

    def peek16(self, name):
        a = self.addr(name)
        return self.mem[a] | self.mem[a + 1] << 8

    def poke(self, name, *values):
        a = self.addr(name)
        for i, v in enumerate(values):
            self.mem[a + i] = v & 0xFF

    @property
    def state(self):
        return self.mem[self.syms['hGameState']]

    # --- menus
    LETTERS = 'RXLNGKHBJSPTZCFD'

    @classmethod
    def level_password(cls, level):
        """The 4 letters of the password for a 1-based level number, or a cheat (see docs/RESEARCH.md)."""
        return cls.encode_b(level - 1)

    @classmethod
    def encode_b(cls, b):
        ror = lambda v, n: ((v >> n) | (v << (8 - n))) & 0xFF
        x = ror(b ^ 0x55, 3)
        y = ror(((0xFD - b) & 0xFF) ^ 0xAA, 1)
        c = [x >> 4, y & 15, x & 15, y >> 4]
        return ''.join(cls.LETTERS[i] for i in c)

    def boot(self, language=0):
        """Power on (or soft reset with A+B+Select+Start when already running), choose a language and
        leave the copyright and title screens. Ends in the main menu."""
        if self.frame:
            self.hold(['a', 'b', 'select', 'start'], 30)
            self.wait_until(lambda: self.state == 11, limit=1500)
        else:
            self.run(1200)
        self.run(150)               # the language screen ignores the buttons for a moment
        for _ in range(12):         # 0 English, 1 Spanish, 2 French, 3 German, 4 Italian
            now = self.peek('wLanguage')
            if now == language:
                break
            self.press('down' if now < language else 'up', hold=4, after=12)
        if language in (0, 4):      # one press past the end of the list does nothing
            self.press('up' if language == 0 else 'down', hold=4, after=12)
        self.press('a', after=200)       # language -> title picture
        title_to_menu(self)

    def settle_menu(self):
        """Wait until the main menu has slid in and takes input."""
        self.wait_until(lambda: self.state == 1, limit=1500)
        self.run(40)             # the scroll value is set a little after the state changes
        self.wait_until(lambda: self.state == 1 and self.peek('hMenuScrollY') == 0, limit=1500)
        self.run(10)

    def menu_goto(self, item):
        """Move the menu cursor to item 0 start, 1 start at password level, 2 password, 3 music, 4 sfx."""
        for _ in range(6):
            if self.peek('wMenuCursor') == item:
                return
            self.press('down', hold=3, after=6)

    def enter_password(self, letters, submit=True):
        """Open the password entry from the main menu and type letters (poked into wPasswordEntry)."""
        self.menu_goto(2)
        self.press('a', after=30)
        self.poke('wPasswordEntry', *[ord(ch) for ch in letters])
        if submit:
            for _ in range(4):
                self.press('a', hold=3, after=10)
            self.run(40)

    def start_level(self, level, lives=None):
        """From the main menu: enter the password of a 1-based level and start there."""
        if level > 1:
            self.enter_password(self.level_password(level))
            self.menu_goto(1)
        else:
            self.menu_goto(0)
        before = self.count('LoadLevel')
        self.press('a', after=0)
        self.wait_level_ready(since=before)
        if lives is not None:
            self.poke('wLives', lives)

    def count(self, label):
        """How often a label has been reached so far (all scenarios of this run)."""
        bank, addr = self.cov.symtab[label]
        return self.cov.hits.get((bank, addr), 0)

    def wait_level_ready(self, limit=900, since=None):
        """Wait until a level is playable (state 2, the level loaded, the start countdown over).

        `since` is the value of count('LoadLevel') from before the level change; without it any loaded level counts.
        """
        def ready():
            return (self.state == 2 and self.peek('hStateTimer') == 0 and self.peek('wBricksLeft') > 0
                    and (since is None or self.count('LoadLevel') > since))
        self.wait_until(ready, limit)
        for _ in range(100):                     # the level sweeps in first; wait for the game logic to run
            before = self.count('Gameplay_Update')
            self.run(5)
            if self.count('Gameplay_Update') > before + 3:
                break
        self.run(5)

    # --- playing
    def ball(self, i=0):
        """(y, x, direction, speed, flags) of ball slot i."""
        a = self.syms['wBalls'] + 7 * i
        m = self.mem
        return m[a + 1], m[a + 3], m[a + 4], m[a + 5], m[a + 6]

    def balls_alive(self):
        return [i for i in range(3) if self.ball(i)[4] != 0xFF and self.ball(i)[3] != 0]

    def bat_x(self):
        return self.peek('wBatX')

    def play(self, frames, miss=False, launch=True, buttons=(), sloppy=0.0, until=None, tap=None, steer=None, follow=None):
        """Play with a simple bot for some frames.

        The bot moves the bat under the lowest ball (or away from it with miss=True), presses A
        to launch, and every now and then does something random with `sloppy` as the chance
        per 20 frames. Extra `buttons` are held the whole time. `tap` presses A for `tap` frames,
        then releases it for `tap` frames, over and over (rocket and laser shots need a new press).
        `steer` ('left', 'right' or '') overrides the bot's bat movement. `follow` is a function that
        returns the x the middle of the bat should go to (or None), for chasing a bomb or the UFO.
        Returns the frames played. `until` is a function that ends the session when it returns true.
        """
        done = 0
        held = set()
        while done < frames:
            if self.state != 2:
                break
            target = None
            low = -1
            for i in range(3):
                y, x, d, sp, fl = self.ball(i)
                if fl != 0xFF and sp != 0 and y > low and y < 0xA0:
                    low, target = y, x
            bx = self.bat_x()
            width = self.peek('wBatWidth') or 0x20
            want = set()
            # a falling power-up close to the bat takes priority over the ball
            pu = self.syms['wFallingPowerups']
            for i in range(8):
                if self.mem[pu + 12 * i] and self.mem[pu + 12 * i + 1] > 96:
                    target = self.mem[pu + 12 * i + 2] + 4
                    low = 255
                    self.aim = 0
                    break
            if target is not None:
                centre = bx + width // 2
                if low < 70:
                    self.aim = self.rnd.randint(-width // 3, width // 3)
                off = getattr(self, 'aim', 0)
                goal = target + 4 + off + (100 if miss and target < 80 else (-100 if miss else 0))
                if goal > centre + 3:
                    want.add('right')
                elif goal < centre - 3:
                    want.add('left')
            if follow is not None:
                goal = follow()
                if goal is not None:
                    want.discard('left')
                    want.discard('right')
                    centre = bx + width // 2
                    if goal > centre + 3:
                        want.add('right')
                    elif goal < centre - 3:
                        want.add('left')
            if steer is not None:
                want.discard('left')
                want.discard('right')
                if steer:
                    want.add(steer)
            if tap:
                if (done // tap) % 2 == 0:
                    want.add('a')
            elif launch and self.rnd.random() < 0.3:
                want.add('a')
            for b in buttons:
                want.add(b)
            if sloppy and self.rnd.random() < sloppy:
                want.add(self.rnd.choice(['left', 'right', 'a', 'a']))
            for b in want - held:
                self.pb.button_press(b)
            for b in held - want:
                self.pb.button_release(b)
            held = want
            self.run(5)
            done += 5
            if until and until():
                break
        for b in held:
            self.pb.button_release(b)
        return done

    def rom_bytes(self, bank, addr, n):
        offset = addr if bank == 0 else bank * 0x4000 + addr - 0x4000
        return list(self.rom_data[offset:offset + n])

    def drop_powerup(self, ptype, dx=0):
        """Put a falling power-up of type 0 to 15 above the bat so that it is caught. Returns the slot address."""
        base = self.syms['wFallingPowerups']
        slot = next((base + 12 * i for i in range(8) if self.mem[base + 12 * i] == 0), None)
        if slot is None:
            return None
        bank, table = self.cov.symtab['PowerupSprites']
        lo, hi = self.rom_bytes(bank, table + 2 * ptype, 2)
        tiles = self.rom_bytes(bank, lo | hi << 8, 8)
        y = max(self.peek('wBatY') - 40, 16)
        self.sync_poke(slot, 1, y, (self.bat_x() + dx) & 0xFF, ptype, *tiles)
        return slot

    def log(self, text):
        if VERBOSE:
            print('  [%7d] state %2d  %s' % (self.frame, self.state, text), file=sys.stderr, flush=True)

    def thin_bricks(self, keep=2):
        """Remove all but `keep` breakable bricks (the lowest ones, which the ball reaches soonest)."""
        base = self.syms['wBrickMap']
        cells = [i for i in range(18 * 16) if 1 <= self.mem[base + i] <= 4]
        cells.sort(reverse=True)
        for n, i in enumerate(cells):
            if n < keep:
                self.mem[base + i] = 1
            else:
                self.mem[base + i] = 0
        self.poke('wBricksLeft', min(keep, len(cells)))
        return min(keep, len(cells))

    def lowest_brick(self):
        """(row, column) of the lowest breakable brick, or None."""
        base = self.syms['wBrickMap']
        for r in range(17, 0, -1):
            for c in range(1, 10):
                if 1 <= self.mem[base + 16 * r + c] <= 4:
                    return r, c
        return None

    def shoot_brick(self, row, col):
        """Put the ball under a brick (which must have nothing below it), moving up."""
        self.sync_poke('wBalls', 0, row * 8 + 44, 0, col * 16 + 4, 0, 3, 0)
        self.poke('wBallOnBat', 0)

    def finish_level(self, keep=2, limit=2500, natural=False):
        """Finish the current level: remove all but `keep` bricks and hit the rest with the ball.
        With natural=True the bot plays on its own until they are gone."""
        level = self.peek('wCurrentLevel')
        self.thin_bricks(keep)
        done = 0
        while done < limit and self.state == 2 and self.peek('wCurrentLevel') == level:
            brick = None if natural else self.lowest_brick()
            if brick:
                self.shoot_brick(*brick)
                done += self.play(40, launch=False)
            else:
                done += self.play(200, launch=True)
        return self.peek('wCurrentLevel') != level

    def screenshot(self, path):
        self.pb.screen.image.save(path)

    def start_watchdog(self, seconds=40):
        """Stop the program with a message if the emulator makes no progress (PyBoy can loop forever on a hook)."""
        import threading

        def watch():
            seen = -1
            while True:
                time.sleep(seconds)
                if self.closed:
                    return
                if self.frame == seen:
                    names = [l['name'] for k in self.last_hit if k in self.cov.by_addr for l in self.cov.by_addr[k]]
                    regs = self.pb.register_file
                    print('no progress for %d s at frame %d, state %d, PC %04x SP %04x, last hook: %s'
                          % (seconds, self.frame, self.state, regs.PC, regs.SP, names), file=sys.stderr, flush=True)
                    os._exit(3)
                seen = self.frame
        threading.Thread(target=watch, daemon=True).start()

    def close(self):
        self.closed = True
        self.pb.stop(save=False)


# --------------------------------------------------------------------------- scenarios

SCENARIOS = {}


def scenario(fn):
    SCENARIOS[fn.__name__.replace('scenario_', '')] = fn
    return fn


def lose_lives(g, count=1, limit=3000):
    """Play with the bot steering away from the ball until `count` lives are lost (or the game ends)."""
    target = g.peek('wLives') - count
    g.play(limit, miss=True, until=lambda: g.peek('wLives') <= target or g.state != 2)
    g.run(120)


def finish_to_next(g, keep=2):
    """Finish the current level and wait for the next one (or a screen between levels)."""
    before = g.count('LoadLevel')
    g.finish_level(keep)
    g.run(60)
    if g.state == 2:
        g.wait_level_ready(since=before)


def type_name(g, letters):
    """High score name entry: up/down change the letter, A or right moves on."""
    for i, ch in enumerate(letters):
        for _ in range(8):
            g.press('up', hold=3, after=4)
        g.press('a', hold=3, after=6)


def game_over_and_name(g, name_ups=(2, 1, 3)):
    """After the last life is lost: leave the game over screen, type a high score name if the score
    is on the table, and go on until the title picture or the menu."""
    g.wait_until(lambda: g.state == 3, limit=600)
    g.run(300)
    typed = False
    for _ in range(14):
        if g.state in (1, 5):
            break
        if g.state == 7 and not typed and (g.peek('wNameEntryAddress') or g.peek('wNameEntryAddress+1')):
            typed = True
            for n in name_ups:
                for _ in range(n):
                    g.press('up', hold=3, after=6)
                g.press('down', hold=3, after=6)
                g.press('a', hold=3, after=10)
            g.press('b', hold=3, after=10)       # one step back
            for _ in range(8):
                g.press('right', hold=3, after=10)
                if g.state != 7:
                    break
        else:
            g.press('a', hold=3, after=150)


def title_to_menu(g):
    for _ in range(8):
        if g.state == 1:
            break
        g.run(150)
        g.press('start', after=100)
    g.settle_menu()


def leave_ending(g):
    """Read the ending text (A moves on) and go on to the game that continues afterwards."""
    for _ in range(12):
        if g.state != 13:
            break
        g.run(400)
        g.press('a', hold=3, after=100)
    g.wait_until(lambda: g.state == 2, limit=3000)
    g.wait_level_ready()
    g.poke('wLives', 9)


def pause_resume(g, wait=150):
    """Pause with Start, wait on the pause screen, resume with Start."""
    g.press('start', hold=3, after=10)
    g.wait_until(lambda: g.state == 4, limit=200)
    g.run(wait)
    for _ in range(5):
        g.press('start', hold=3, after=60)
        if g.state == 2:
            break
    g.wait_level_ready()


@scenario
def scenario_levels(g):
    """Normal play: bricks, walls, bat, lost lives, pause, password screen, high score, level skip, both endings."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.log('level 1')
    g.play(2500, sloppy=0.03)                    # random bat movement and launches
    pause_resume(g)
    g.play(1500, sloppy=0.05)
    g.poke('wLives', 3)
    lose_lives(g, 2)                             # lose two lives (the bat explodes, the ball restarts)
    g.poke('wLives', 5)
    for _ in range(5):                           # levels 1 to 4 and on to 5 (password screen after level 4)
        g.play(600, sloppy=0.02)
        finish_to_next(g)
        g.log('level now %d' % g.peek('wCurrentLevel'))
        if g.state == 9:
            g.run(500)
            g.press('a', after=100)
            g.wait_level_ready()
    g.play(600, sloppy=0.02)
    # the next password screen: a bonus over 10000 and a level number over 100 (three digits)
    g.poke('wLevelBonus', 0x04, 0x29)
    g.poke('wLevelBonusUnits', 0x1a, 0x04)
    g.poke('wCurrentLevel', 100)
    for _ in range(5):
        g.poke('wLives', 9)
        finish_to_next(g)
        if g.state == 9:
            g.log('password screen at level %d' % (g.peek('wCurrentLevel') + 1))
            g.run(700)
            g.press('a', after=100)
            g.wait_level_ready()
            break
    goto_level(g, 96)                            # a level with unbreakable bricks in the top row
    g.play(300, sloppy=0.02)
    redraw_cases(g)                              # bricks breaking in every arrangement
    g.poke('wLives', 5)
    # a high score: raise the score, then lose every life
    g.poke('wScoreDigits', 0, 9, 9, 9, 9, 9)
    g.poke('wLives', 1)
    lose_lives(g, 1)
    game_over_and_name(g)
    g.log('after name entry')
    title_to_menu(g)
    # cheats: lives refill when pausing, level skip with B, the ending from level 160
    g.enter_password('TDNZ')
    g.enter_password('NCNZ')
    g.start_level(1)
    g.log('cheat game at level %d, flags %s' % (g.peek('wCurrentLevel'), [g.peek('wCheatLivesRefill'), g.peek('wCheatLevelSkip')]))
    pause_resume(g)                              # pause: lives go back to 9
    for _ in range(4):
        g.play(60, launch=False)
        before = g.count('LoadLevel')
        level = g.peek('wCurrentLevel')
        g.pb.button_press('b')                   # B ends the level while the NCNZ cheat is on
        g.wait_until(lambda: g.peek('wCurrentLevel') != level or g.state != 2, limit=100, step=1)
        g.pb.button_release('b')
        g.run(40)
        g.log('skipped to level %d state %d' % (g.peek('wCurrentLevel'), g.state))
        if g.state == 9:
            g.run(1200)                          # fireworks
            g.press('a', after=100)
        g.wait_level_ready(since=before)
    g.poke('wCurrentLevel', 159)
    g.pb.button_press('b')                       # skipping level 160: the ending
    g.wait_until(lambda: g.state != 2, limit=100, step=1)
    g.pb.button_release('b')
    g.log('ending (skip) state %d' % g.state)
    leave_ending(g)
    # the ending, played out: set the level number so that the next level is the last, then finish it
    g.poke('wLives', 9)
    g.poke('wCurrentLevel', 158)
    finish_to_next(g)
    g.log('last level %d' % g.peek('wCurrentLevel'))
    g.poke('wLives', 9)
    g.finish_level(2)
    g.log('ending (played) state %d' % g.state)
    leave_ending(g)
    for _ in range(5):                           # after the ending: no password screens any more
        g.poke('wLives', 9)
        finish_to_next(g)
        g.log('after the ending: level %d state %d' % (g.peek('wCurrentLevel'), g.state))
    g.poke('wLives', 1)
    lose_lives(g, 1)
    game_over_and_name(g)
    title_to_menu(g)
    g.run(300)


POWERUPS = ['Slowball', 'Rocket', 'Smiley', 'Plasma', 'Poison', 'Milk', 'Clock', 'Pepper', 'Magnet',
            'TripleBall', 'ExtraLife', 'Laser', 'Reverse', 'Ninja', 'Ghost', 'Grenade']


def recover(g):
    """Get back to a playable level after something ended it (a Smiley, a lost game)."""
    for _ in range(6):
        if g.state == 9:                         # level password screen
            g.run(500)
            g.press('a', after=100)
        elif g.state in (3, 7):                  # game over, high scores
            game_over_and_name(g)
        elif g.state in (5, 1, 13, 4):
            if g.state == 4:
                g.press('start', after=40)
            else:
                title_to_menu(g)
                g.start_level(1)
        elif g.state == 2:
            if g.peek('hStateTimer') or not g.peek('wBricksLeft'):
                g.wait_level_ready()
            g.poke('wLives', 9)
            return
        else:
            g.run(100)
    g.poke('wLives', 9)


def catch_powerup(g, ptype, dx=0, limit=400, tries=3):
    """Drop power-up `ptype` (0 to 15) onto the bat. Returns whether its pick-up handler ran."""
    handler = 'Powerup_' + POWERUPS[ptype]
    recover(g)
    before = g.count(handler)
    for _ in range(tries):
        # wait until the bat is whole and a ball is in play (a lost life leaves a gap)
        g.play(600, until=lambda: g.peek('wBallCount') >= 1 and g.peek('wBatExplosionTimer') == 0 and not g.peek('hLifeLostTimer'))
        g.drop_powerup(ptype, dx)
        g.play(limit, until=lambda: g.count(handler) > before or g.state != 2)
        if g.count(handler) > before or g.state != 2:
            break
    g.log('power-up %d %s caught: %s' % (ptype, POWERUPS[ptype], g.count(handler) > before))
    return g.count(handler) > before


def fresh_level(g, level=1, lives=9):
    """Start `level` from the main menu if needed. Leaves a running level with `lives` lives."""
    if g.state != 2:
        title_to_menu(g)
        g.start_level(level)
    g.poke('wLives', lives)


def spawn_from_brick(g, power_id, hp=2, col=None, weapon=None):
    """Make a real brick drop power-up `power_id` (type + 1, $11 random, $12 clock) by hitting it with the ball.

    Pokes the brick (hit points `hp`) and its power-up entry, puts the ball just under it moving up and
    returns the slot address of the new power-up, or None."""
    recover(g)
    base = g.syms['wBrickMap']
    row = max((r for r in range(1, 18) if any(1 <= g.mem[base + 16 * r + c] <= 4 for c in range(1, 10))), default=1)
    if col is None:
        col = max(1, min(9, (g.bat_x() + 8) // 16))
    cell = base + 16 * row + col
    slots = g.syms['wFallingPowerups']
    old = {slots + 12 * i for i in range(8) if g.mem[slots + 12 * i]}
    g.sync_poke(g.syms['wPowerupMap'] + 16 * row + col, power_id)
    g.sync_poke(cell, hp)
    g.sync_poke('wBalls', 0, row * 8 + 44, 0, col * 16 + 4, 0, 3, 0)
    g.poke('wBallOnBat', 0)
    def new_slots():
        return [slots + 12 * i for i in range(8) if g.mem[slots + 12 * i] and slots + 12 * i not in old]
    g.play(150, launch=False, until=lambda: g.mem[cell] < hp)
    g.play(40, launch=False, until=new_slots)
    return (new_slots() or [None])[0]


def settle(g, frames=300):
    """Let the bot play a while with a full set of lives."""
    g.poke('wLives', 9)
    g.play(frames, sloppy=0.005)


@scenario
def scenario_powerups(g):
    """All 16 power-ups caught and left to run out, the drop rules and combinations of effects."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(200)
    # 1. every power-up on its own, then wait for its timer to run out
    for t in range(16):
        if t == 2:
            continue                             # Smiley ends the level, done last
        catch_powerup(g, t)
        g.play(900, sloppy=0.005)
        g.poke('wLives', 9)
        if g.state != 2:
            break
    # 2. drop rules in SpawnPowerup, with real bricks hit by the ball
    for pid in (0x11, 0x11, 0x11, 0x12):         # random (frame-counter dependent) and fixed Clock
        spawn_from_brick(g, pid)
        g.play(120)
    settle(g, 100)
    spawn_from_brick(g, 7)                       # Clock brick without a weapon: becomes a Slowball
    g.play(150)
    catch_powerup(g, 1)                          # Rocket: the weapon flag is on
    spawn_from_brick(g, 7)                       # Clock brick with a weapon: stays a Clock
    g.play(250)
    catch_powerup(g, 15)                         # Grenade, then a Clock catch with a weapon
    catch_powerup(g, 6)
    g.play(600, tap=9)
    spawn_from_brick(g, 10)                      # Triple ball brick with one ball: stays
    g.play(150)
    catch_powerup(g, 9)                          # three balls now
    spawn_from_brick(g, 10)                      # Triple ball brick with several balls: becomes a Slowball
    g.play(150)
    # 3. effects on top of each other
    catch_powerup(g, 9)                          # Triple ball while three balls are in play
    g.play(400, sloppy=0.01)
    catch_powerup(g, 9)
    catch_powerup(g, 13)                         # Ninja with several balls
    g.play(500)
    catch_powerup(g, 11)                         # Laser bat, then Ninja: shots from every slot
    catch_powerup(g, 13)
    g.play(900, tap=9)
    catch_powerup(g, 1)                          # Rocket bat with Ninja
    catch_powerup(g, 13)
    g.play(600, tap=15)
    catch_powerup(g, 7)                          # Pepper (antigravity) then Magnet
    catch_powerup(g, 8)
    g.play(500, sloppy=0.02)
    catch_powerup(g, 7)                          # Pepper again while it runs: ends early
    catch_powerup(g, 7)
    catch_powerup(g, 14)                         # Ghost
    catch_powerup(g, 14)                         # Ghost again
    catch_powerup(g, 12)                         # Reverse, then Poison
    catch_powerup(g, 4)
    g.play(700, sloppy=0.02)
    catch_powerup(g, 5)                          # Milk (big bat), then Poison
    catch_powerup(g, 4)
    g.play(500)
    catch_powerup(g, 6)                          # Clock with no weapon (a Slowball in the brick rule, a Clock here)
    catch_powerup(g, 3)                          # Plasma
    g.play(400, tap=20)
    catch_powerup(g, 10)                         # Extra life
    g.poke('wLives', 9)
    catch_powerup(g, 10)                         # Extra life at 9 lives: bonus score instead
    # 4. Smiley ends the level
    catch_powerup(g, 2)
    g.run(200)
    g.log('state after Smiley: %d' % g.state)

def plant_unbreakable(g, row=8):
    """Put an unbreakable brick ($0E) above the bat, so that a shot flying up hits it."""
    col = max(1, min(9, (g.bat_x() + 8) // 16))
    g.sync_poke(g.syms['wBrickMap'] + 16 * row + col, 0x0E)


def plant_rows(g, first, last, hp=0x0E):
    """Clear the lower part of the brick map and fill rows first to last with unbreakable bricks ($0E),
    which are the only bricks a thrown grenade or ball bounces off. The brick counter is raised so that the level goes on."""
    base = g.syms['wBrickMap']
    for r in range(3, 17):
        g.sync_poke(base + 16 * r + 1, *([hp if first <= r <= last else 0] * 9))
    g.sync_poke('wBricksLeft', 200)


def redraw_cases(g, rows=(1, 8), cols=(1, 5, 9)):
    """Break one brick in every arrangement of its neighbours (below, below right, above, above left),
    next to the walls and in the open. A broken brick redraws its tiles according to those neighbours."""
    base = g.syms['wBrickMap']
    for row in rows:
        for col in cols:
            for mask in range(16):
                if g.state != 2:
                    return
                for r in range(max(row - 2, 1), row + 2):        # clear the area around the brick
                    for c in range(max(col - 1, 1), min(col + 1, 9) + 1):
                        g.sync_poke(base + 16 * r + c, 0)
                for bit, (dr, dc) in enumerate(((1, 0), (1, 1), (-1, 0), (-1, -1))):
                    if mask & (1 << bit) and 1 <= col + dc <= 9 and row + dr >= 1:
                        g.sync_poke(base + 16 * (row + dr) + col + dc, 4)
                cell = base + 16 * row + col
                g.sync_poke('wBricksLeft', 100)
                for direction, dy in ((0, 40), (16, 30), (8, 36), (24, 36)):   # the ball may bounce off a neighbour first
                    g.sync_poke(cell, 1)
                    g.sync_poke('wBalls', 0, row * 8 + dy, 0, col * 16 + 4, direction, 3, 0)
                    g.poke('wBallOnBat', 0)
                    g.play(40, launch=False, until=lambda: g.mem[cell] == 0)
                    if g.mem[cell] == 0:
                        break


def projectile_lands(g, y, flags, x=80):
    """Put a projectile (a grenade has bit 7 of its flags set, a ball thrown by the blob has not) that
    lands this frame at (x, y) on an unbreakable brick, so that it bounces off it."""
    row = (y & 0xF8) // 8 - 3
    g.sync_poke(g.syms['wBrickMap'] + 16 * row + (x >> 4), 0x0E)
    g.sync_poke('wProjectiles', 1, 0, x, 0, y, 0, flags, 0, 0)
    g.run(8)


def throw_grenades(g, charges):
    """Charge and throw one grenade per entry: (frames of charging, direction 'left', 'right' or '')."""
    for frames, direction in charges:
        if g.state != 2 or not g.peek('wGrenadeCount'):
            break
        g.play(frames, launch=False, buttons=('a',))       # A held: the throw power grows
        g.play(4, launch=False, steer=direction)           # A released: the grenade flies
        g.play(60, launch=False)


@scenario
def scenario_weapons(g):
    """Rocket, laser, plasma and grenade: firing, shots hitting bricks and unbreakable bricks, running out."""
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    g.play(200)
    # rocket: up to three shots in flight, a new press for each
    catch_powerup(g, 1)
    g.play(500, tap=16)
    plant_unbreakable(g)
    g.play(500, tap=16)
    g.play(200, tap=40)
    # laser: up to six shots in flight
    catch_powerup(g, 11)
    g.play(600, tap=5)
    plant_unbreakable(g)
    g.play(600, tap=5)
    g.play(300, tap=12)
    g.play(200, buttons=('a',))                           # A held: one shot only
    # plasma: one shot that passes through bricks, back to a plain bat afterwards
    for _ in range(3):
        catch_powerup(g, 3)
        g.play(300, tap=30)
        plant_unbreakable(g, 3)
        g.play(200, tap=30)
    # grenades: short and long charges, left, right and straight
    catch_powerup(g, 15)
    throw_grenades(g, [(10, ''), (60, 'left'), (120, 'right'), (30, 'right'), (90, ''), (5, 'left'),
                       (100, 'left'), (45, 'right'), (75, ''), (20, '')])
    # the grenade count is spent: the bat is plain again; a second set, used up with the ball in play
    catch_powerup(g, 15)
    throw_grenades(g, [(40, 'right')] * 9)
    # grenades landing on bricks at different heights
    for first in range(3, 15, 2):
        catch_powerup(g, 15)
        plant_rows(g, first, first + 3)
        throw_grenades(g, [(8 + 8 * first, ''), (20 + 5 * first, 'left'), (50, 'right'), (25, '')])
        g.poke('wGrenadeCount', 0)
    # grenades and thrown balls landing on an unbreakable brick at every height
    for y in (0x60, 0x6F, 0x74, 0x79, 0x7E, 0x83, 0x88, 0x90):
        for flags in (0x80, 0x00):
            projectile_lands(g, y, flags)
    # weapons while a life is lost: the flag is cleared
    catch_powerup(g, 11)
    lose_lives(g, 1)
    g.play(400)


def levels_of_type(bit):
    """1-based numbers of the levels whose type has `bit` set (1 = UFO, 2 = blob), read from the level table."""
    rom = open(os.path.join(ROOT, 'game.gbc'), 'rb').read()

    def off(bank, addr):
        return bank * 0x4000 + addr - 0x4000 if addr >= 0x4000 else addr
    found = []
    for level in range(160):
        entry = off(5, 0x4000) + 8 * level
        header = off(5, rom[entry + 2] | rom[entry + 3] << 8)
        if rom[header + 4] & bit:
            found.append(level + 1)
    return found


def goto_level(g, level):
    """From a running level: continue on the 1-based `level`. (Passwords only exist for levels 1, 5, 9, ...,
    so the level number is poked one level early and the current level is finished.)"""
    before = g.count('LoadLevel')
    g.poke('wCurrentLevel', max(level - 2, 0))
    g.log('goto_level %d: level %d, state %d, lives %d, bricks %d, %s' % (level, g.peek('wCurrentLevel'), g.state, g.peek('wLives'), g.peek('wBricksLeft'), [g.peek(n) for n in ('wBatWidth','wReverseActive','wStunActive','wAntigravityActive','wSleepyBallActive','wNinjaActive','wGhostActive','wBallSticks','wWeaponFlag','wBallCount','wLevelType','wUfoHits')]))
    g.finish_level(2)
    g.log('finished: level %d, state %d, lives %d' % (g.peek('wCurrentLevel'), g.state, g.peek('wLives')))
    g.run(60)
    if g.state == 9:
        g.run(400)
        g.press('a', after=100)
    g.wait_level_ready(since=before)
    g.poke('wLives', 9)


def start_fresh(g, level):
    """Return to the main menu (after a game over, or on a new game) and start `level`."""
    title_to_menu(g)
    g.start_level(1)
    g.poke('wLives', 9)
    if level > 1:
        goto_level(g, level)


def wait_flying(g, limit=1500):
    """Bring the UFO on soon: shorten its wait time and play until it flies."""
    g.sync_poke('wUfoWaitTimer', 1)
    g.play(limit, until=lambda: g.peek('wUfoFlying') != 0 or g.state != 2)


def shot_hits_ufo(g, slot):
    """Place the UFO and a shot in slot 0 to 5 on top of each other (the shot slots are checked one by one).

    Slots 0 to 2 have 4 bytes in wShots (x, y, y when fired, laser flag). Slots 3 to 5 have 3 bytes (no flag),
    so slot 3 is at +12, slot 4 at +15 and slot 5 at +18."""
    height = g.peek('wUfoHeight')
    shots = g.syms['wShots']
    g.sync_poke('wUfoSpeed', 0x80, 0)
    g.sync_poke('wUfoXSub', 0)
    g.sync_poke('wUfoX', 2 if slot >= 4 else 60)
    g.sync_poke('wUfoFlying', 1)
    if slot == 5:
        g.sync_poke(shots + 18, 10, height + 8)      # slot 5: x and y
    elif slot == 4:
        g.sync_poke(shots + 15, 1)
        g.sync_poke(shots + 16, height + 8)
    else:
        g.sync_poke(shots + 4 * slot, 64, height + 8, height + 8, 0)
    g.sync_poke('wShotActive+%d' % slot, 1)
    g.run(6)


def park_ball(g):
    """Put a single ball back on the bat (a ball poked into the UFO can end up stuck at the edge)."""
    g.sync_poke('wBalls', 0, 137, 0, g.bat_x() + 4, 16, 0x83, 0)
    g.sync_poke('wBallOnBat', 1)
    g.sync_poke('wBallCount', 1)


def finish_pass(g):
    """Move the flying UFO to the edge where its pass ends, so that it stops flying by itself."""
    if g.peek('wUfoFlying'):
        moving_right = g.peek('wUfoSpeed+1') == 0
        park_ball(g)
        g.sync_poke('wUfoX', 0xAE if moving_right else 0xE2)
        g.play(30, launch=False)


def ufo_follow(g, mode):
    """A function for play(follow=...): put the bat under the UFO's bomb ('hit'), away from it ('dodge')
    or under the UFO ('ufo')."""
    def goal():
        if mode == 'ufo':
            return g.peek('wUfoX') + 12 if g.peek('wUfoFlying') else None
        if not g.peek('wUfoBombActive'):
            return None
        x = g.peek('wUfoBombX') + 12
        return x if mode == 'hit' else (x + 70 if x < 90 else x - 70)
    return goal


@scenario
def scenario_enemies(g):
    """A UFO level (bombs hitting and missing the bat, five ball hits, shots) and a blob level (catch, throw, Ghost, Ninja)."""
    ufo_levels, blob_levels = levels_of_type(1), levels_of_type(2)
    g.boot()
    g.start_level(1)
    g.poke('wLives', 9)
    goto_level(g, ufo_levels[0])
    g.play(100)
    g.log('UFO level %d, type %d' % (g.peek('wCurrentLevel') + 1, g.peek('wLevelType')))
    # bombs: one that hits the bat, one that falls past it
    for mode in ('hit', 'hit', 'dodge', 'hit', 'dodge'):
        wait_flying(g)
        g.play(500, follow=ufo_follow(g, mode), until=lambda: g.state != 2 or not g.peek('wUfoFlying') and not g.peek('wUfoBombActive'))
        g.play(150, follow=ufo_follow(g, mode))
        recover(g)
    # five hits with the ball: put the ball into the UFO
    for _ in range(6):
        wait_flying(g)
        if g.peek('wUfoFlying'):
            g.sync_poke('wBalls', 0, g.peek('wUfoHeight') + 6, 0, g.peek('wUfoX') + 8, 1, 3, 0)
            g.poke('wBallOnBat', 0)
            g.play(30, launch=False)
        g.play(60)
    park_ball(g)
    g.log('UFO hits %d' % g.peek('wUfoHits'))
    # let one pass end by itself
    g.poke('wUfoHits', 0)
    wait_flying(g)
    finish_pass(g)
    wait_flying(g)
    g.play(900, follow=ufo_follow(g, 'dodge'))
    # shots against the UFO
    g.poke('wUfoHits', 0)
    catch_powerup(g, 11)                         # laser
    for _ in range(3):
        wait_flying(g)
        g.play(400, follow=ufo_follow(g, 'ufo'), tap=5, until=lambda: g.state != 2 or not g.peek('wUfoFlying'))
    g.poke('wUfoHits', 0)
    for slot in range(6):                        # a shot from each of the six slots hits the UFO
        shot_hits_ufo(g, slot)
        g.poke('wUfoHits', 0)
        g.play(30)
    g.poke('wUfoHits', 0)
    catch_powerup(g, 1)                          # rocket
    for _ in range(3):
        wait_flying(g)
        g.play(400, follow=ufo_follow(g, 'ufo'), tap=16, until=lambda: g.state != 2 or not g.peek('wUfoFlying'))
    g.poke('wUfoHits', 0)
    catch_powerup(g, 3)                          # plasma
    wait_flying(g)
    g.play(400, follow=ufo_follow(g, 'ufo'), tap=30, until=lambda: g.state != 2 or not g.peek('wUfoFlying'))
    for pid in (0x11, 0x11):                     # random power-up bricks on a UFO level
        spawn_from_brick(g, pid)
        g.play(100)
    # a blob level
    g.poke('wScoreDigits', 0, 0, 0, 0, 0, 1)
    g.poke('wLives', 1)
    lose_lives(g, 1)
    g.log('lost the game: lives %d' % g.peek('wLives'))
    game_over_and_name(g)
    g.log('name entered')
    start_fresh(g, blob_levels[0])
    g.log('blob start: lives %d' % g.peek('wLives'))
    g.play(300)
    g.log('blob level %d, type %d, blob at %d,%d active %d' % (
        g.peek('wCurrentLevel') + 1, g.peek('wLevelType'), g.peek('wBlobY'), g.peek('wBlobX'), g.peek('wBlobActive')))
    for first in (None, 9, 11, 7, 13, 10, 14, 12, 8):   # the blob catches a ball and throws it back (onto bricks, too)
        if first:
            plant_rows(g, first, first + 3)
        g.sync_poke('wBalls', 0, g.peek('wBlobY') + 6, 0, g.peek('wBlobX') + 6, 1, 3, 0)
        g.poke('wBallOnBat', 0)
        g.play(500, until=lambda: g.state != 2)
    catch_powerup(g, 9)                          # several balls: the blob's throw lands among them
    for _ in range(2):
        g.sync_poke('wBalls', 0, g.peek('wBlobY') + 6, 0, g.peek('wBlobX') + 6, 1, 3, 0)
        g.poke('wBallOnBat', 0)
        g.play(500, until=lambda: g.state != 2)
    for ptype in (14, 13):                       # Ghost and Ninja: the blob cannot catch the ball
        catch_powerup(g, ptype)
        for _ in range(3):
            g.sync_poke('wBalls', 0, g.peek('wBlobY') + 6, 0, g.peek('wBlobX') + 6, 1, 3, 0)
            g.poke('wBallOnBat', 0)
            g.play(60)
        g.play(500)
    for pid in (0x11, 0x11, 0x11):               # random power-up bricks on a blob level
        spawn_from_brick(g, pid)
        g.play(100)
    # the blob holds the last ball: no life is lost
    g.sync_poke('wBalls', 0, g.peek('wBlobY') + 6, 0, g.peek('wBlobX') + 6, 1, 3, 0)
    g.play(900, miss=True)
    recover(g)


def type_password(g, letters, back_once=True):
    """Open the password entry and type letters with the buttons: up and down change the letter (vowels
    are skipped), A moves on, B moves back. The fourth A submits."""
    g.menu_goto(2)
    g.press('a', after=30)
    for i, ch in enumerate(letters):
        if i == 1 and back_once:
            g.press('b', hold=3, after=8)        # back to the first letter and forward again
            g.press('a', hold=3, after=8)
        button = 'up' if i % 2 == 0 else 'down'
        for _ in range(30):
            if g.peek('wPasswordEntry+%d' % i) == ord(ch):
                break
            g.press(button, hold=3, after=5)
        g.press('a', hold=3, after=8)
    g.run(60)


def toggle_sound(g):
    """Music and sound effects off and on again, with A, with right and with left. Also moves the
    cursor up, around the top (up from the first entry goes to the last) and without wrapping."""
    for item in (3, 4):
        g.menu_goto(item)
        g.press('a', hold=3, after=30)
        g.press('right', hold=3, after=30)
        g.press('left', hold=3, after=30)
        g.press('b', hold=3, after=30)
    g.menu_goto(0)
    g.press('up', hold=3, after=20)              # wraps to the last entry
    g.press('up', hold=3, after=20)
    g.press('up', hold=3, after=20)


def attract_screens(g):
    """Leave the menu alone: the high score table and then the credits come up by themselves."""
    seen = []
    for _ in range(5000):
        g.run(5)
        if g.state not in seen:
            seen.append(g.state)
        if 8 in seen and g.state == 1:
            break
    g.log('idle screens seen: %s' % seen)
    g.settle_menu()


@scenario
def scenario_menus(g):
    """The menus: five languages, music and sound switches, attract screens, passwords and cheats."""
    for lang in range(5):
        g.boot(lang)
        g.log('language %d' % lang)
        toggle_sound(g)
        if lang in (0, 3):
            attract_screens(g)
        if lang == 1:                            # a language chosen again after going back with up
            pass
    # passwords, English
    g.boot(0)
    type_password(g, 'BBBB')                     # not a password
    g.log('invalid password: start level %d' % g.peek('wStartLevel'))
    type_password(g, 'LSPP')                     # level 5
    g.log('level 5 password: start level %d' % g.peek('wStartLevel'))
    g.enter_password('ZZZZ')                     # more invalid ones, by poking
    g.enter_password('RRRR')
    for pw in ('TDNZ', 'NCNZ', 'TNRZ', 'NXRZ'):
        g.enter_password(pw)
        g.log('%s: cheats %s' % (pw, [g.peek(n) for n in ('wCheatLivesRefill', 'wCheatLevelSkip', 'wCheatPhotoBackground', 'wCheatShowVersion')]))
    g.enter_password(g.level_password(101))      # a three-digit level number on the START line
    g.press('up', hold=3, after=20)
    g.press('up', hold=3, after=20)
    g.press('down', hold=3, after=20)
    g.enter_password(g.level_password(9))        # a level password again: the START line moves
    g.menu_goto(1)
    # start from the password level with the photo background cheat, skip four levels to the password screen
    before = g.count('LoadLevel')
    g.press('a', after=0)
    g.wait_level_ready(since=before)
    for _ in range(4):
        level = g.peek('wCurrentLevel')
        g.pb.button_press('b')
        g.wait_until(lambda: g.peek('wCurrentLevel') != level or g.state != 2, limit=100, step=1)
        g.pb.button_release('b')
        g.run(40)
        if g.state == 9:
            break
        g.wait_level_ready(since=before)
        before = g.count('LoadLevel')
    g.log('level password screen: state %d' % g.state)
    g.run(1500)                                  # fireworks
    g.press('a', after=100)
    g.press('start', after=60)
    g.run(300)
    # game over from here, back to the menu with the version cheat
    g.wait_level_ready()
    g.poke('wLives', 1)
    lose_lives(g, 1)
    game_over_and_name(g)
    title_to_menu(g)
    g.run(600)
    # the "please use a Game Boy Color" screen belongs to the original Game Boy; here it can only be forced
    g.poke('hGameState', 10)
    g.poke('hStateTimer', 2)                     # the frame loop then ends and the new state starts
    g.run(300)

# --------------------------------------------------------------------------- report

def summarize(cov):
    """Return per-bank totals and the never-hit labels grouped by routine."""
    banks = {}
    routines = {}
    for lab in cov.labels:
        hit = cov.label_hits(lab) > 0
        b = banks.setdefault(lab['bank'], [0, 0])
        b[1] += 1
        b[0] += hit
        routines.setdefault((lab['bank'], lab['routine']), []).append((lab, hit))
    return banks, routines


def print_report(cov, out=sys.stdout):
    banks, routines = summarize(cov)
    total_hit = sum(b[0] for b in banks.values())
    total = sum(b[1] for b in banks.values())
    print('Coverage: %d of %d labels hit (%.1f%%)' % (total_hit, total, 100.0 * total_hit / max(total, 1)), file=out)
    for bank in sorted(banks):
        h, n = banks[bank]
        print('  bank $%02X: %d of %d (%.1f%%)' % (bank, h, n, 100.0 * h / max(n, 1)), file=out)
    never = []
    partial = []
    for (bank, name), items in routines.items():
        missed = [l for l, hit in items if not hit]
        if not missed:
            continue
        if len(missed) == len(items):
            never.append((bank, items[0][0]['addr'], name, missed))
        else:
            partial.append((bank, items[0][0]['addr'], name, missed, len(items)))
    print('', file=out)
    print('Routines never reached (%d):' % len(never), file=out)
    for bank, addr, name, missed in sorted(never):
        extra = '' if len(missed) == 1 else ' (+%d local labels)' % (len(missed) - 1)
        print('  %02X:%04X %s%s' % (bank, addr, name, extra), file=out)
    print('', file=out)
    print('Routines reached but with labels never hit (%d):' % len(partial), file=out)
    for bank, addr, name, missed, count in sorted(partial):
        names = ', '.join(l['name'].split('.', 1)[1] if '.' in l['name'] else l['name'] for l in missed)
        print('  %02X:%04X %s: %d of %d never hit: %s' % (bank, addr, name, len(missed), count, names), file=out)


def to_json(cov):
    labels = {}
    for lab in cov.labels:
        labels[lab['name']] = dict(hits=cov.label_hits(lab), bank=lab['bank'], addr=lab['addr'])
    watches = {w.label + ':' + ','.join(v[0] for v in w.vars): w.to_json() for w in cov.watches}
    return dict(labels=labels, watches=watches)


# --------------------------------------------------------------------------- CLI

def run_scenarios(names, cov, rom, frame_limit, verbose=True):
    for name in names:
        fn = SCENARIOS[name]
        game = Game(cov, rom, frame_limit)
        start = time.time()
        try:
            fn(game)
        except StopScenario:
            print('scenario %s: stopped at the frame limit' % name, file=sys.stderr)
        before = len(cov.hits)
        if verbose:
            print('scenario %-9s %7d frames, %5.1f s, %d labels hit so far (%d hook repeats skipped)' % (
                name, game.frame, time.time() - start, len(cov.hits), game.unstuck), file=sys.stderr)
        game.close()


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--scenario', action='append', default=[])
    ap.add_argument('--watch', action='append', default=[])
    ap.add_argument('--out')
    ap.add_argument('--report', action='store_true')
    ap.add_argument('--merge', action='append', default=[])
    ap.add_argument('--rom', default=os.path.join(ROOT, 'game.gbc'))
    ap.add_argument('--frames', type=int, default=400000)
    ap.add_argument('--list', action='store_true')
    ap.add_argument('--verbose', action='store_true', help='print progress messages from the scenarios')
    args = ap.parse_args()
    global VERBOSE
    VERBOSE = args.verbose
    if args.list:
        for name, fn in SCENARIOS.items():
            print('%-9s %s' % (name, (fn.__doc__ or '').strip().split('\n')[0]))
        print('%-9s run every scenario, each on a fresh emulator, and add up the counts' % 'all')
        return
    cov = Coverage(read_labels(), args.watch)
    for path in args.merge:
        cov.merge(path)
    names = []
    for s in args.scenario:
        names.extend(list(SCENARIOS) if s == 'all' else [s])
    for n in names:
        if n not in SCENARIOS:
            raise SystemExit('unknown scenario %s (try --list)' % n)
    run_scenarios(names, cov, args.rom, args.frames)
    if args.out:
        with open(args.out, 'w') as f:
            json.dump(to_json(cov), f, indent=1)
    if args.report or not (args.out or names):
        print_report(cov)


if __name__ == '__main__':
    main()

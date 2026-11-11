# Cool Bricks disassembly notes

ROM: *Cool Bricks (Europe) (En,Fr,De,Es,It).gbc*, title `COOLBRICKS`, game code `BOGP`, MBC5, 1 MiB. Addresses are written `bank:address`. Bank 0 is always mapped. The game switches banks by writing to `$2100`.

## Passwords

The password alphabet is at `02:4000` (`RXLNGKHBJSPTZCFD`). Each letter stands for its position in that string, 0 to 15. The check routine is `00:09FA`.

Let the four letters have values `c0 c1 c2 c3`. The routine builds two bytes:

- `X = c0 << 4 | c2`
- `Y = c3 << 4 | c1`

Then it computes:

- `b = rotate_left(X, 3) XOR $55`
- `a = rotate_left(Y, 1) XOR $AA`

The password is valid when `(a + b) & $FF == $FD` and `b` is a multiple of 4.

- `b < $A0`: `b` is the 0-based start level. It is stored in `$CCBA`.
- `b = $C8, $CC, $D0, $D4`: these set the cheat flags `$DB51` to `$DB54`.
- Any other `b`: rejected.

`tools/pw.py` encodes and decodes passwords.

## Cheat flags

| Password | Flag | Used at | Effect |
|---|---|---|---|
| `TDNZ` | `$DB51` | `00:39E1` | Sets lives (`$D8AC`) to 9 when the pause screen opens. |
| `NCNZ` | `$DB52` | `00:0F30` | B button (`$FF8A` bit 5) ends the level. |
| `TNRZ` | `$DB53` | `00:0B40`, `00:0B78` | Loads the background picture at `05:48EA` with the palette at `05:4830` instead of the level's own. The picture is a photo of four people, probably the development team. |
| `NXRZ` | `$DB54` | `00:2077` | Draws the string at `0E:4000` (`VER 23 02`) at `$98A6` on the title menu. |

The routine at `00:3A57` clears all four flags. Holding A+B+Select+Start resets the game (`01:7C5D`). That is the standard soft reset, not a cheat.

## Level data

The level table is at `05:4000`, 8 bytes per level for 160 levels. The load routine is `00:0B2A`.

| Bytes | Meaning |
|---|---|
| 0–1 | Pointer to the background picture in bank 5 |
| 2–3 | Pointer to a 6-byte header in bank 5 (see below) |
| 4–5 | Pointer to the brick layout in bank 8 |
| 6–7 | Pointer to the power-up map in bank `$0C` |

The 6-byte header holds two graphics pointers, then the level flags:

- Byte 4, low nibble, goes to `$DC35`: 1 = UFO level, 2 = Blob level.
- Byte 4, high nibble, goes to `$DC36`.
- Byte 5 goes to `$DC27`, the UFO flight height.

Brick layouts are in bank 8. They are run-length encoded as (count, value) pairs that end with 0. They unpack to `$CCEA`. The power-up map unpacks to `$CE0A` with the same layout. Both maps use 16 bytes per row. Column 0 and columns 10–15 are wall (`$0F`), and columns 1–9 are the 9 bricks.

Brick values:

| Value | Meaning |
|---|---|
| 0 | Empty |
| 1–4 | Hit points |
| `$0E` | Unbreakable |
| `$0F` | Wall |

Power-up ids:

| Id | Power-up |
|---|---|
| 0 | None |
| 1–16 | Power-up type (id − 1), see the table below |
| `$11` | Random |
| `$12` | Fixed Clock |

Bit 7 of a power-up entry is set while its brick is being processed.

## Power-up types

| Type | Name | Icon tiles | Pick-up handler (bank 1) | In-game text |
|---|---|---|---|---|
| 0 | Slowball | `01:7746` | `51D4` | SLOW BALL |
| 1 | Rocket | `01:774E` | `520A` | ROCKET BAT |
| 2 | Smiley | `01:7756` | `5256` | none: runs the level-complete code |
| 3 | Plasma | `01:775E` | `5289` | PLASMA BAT |
| 4 | Poison | `01:7766` | `52A0` | STUN BAT |
| 5 | Milk | `01:776E` | `52D5` | BIG BAT |
| 6 | Clock | `01:7776` | `5309` | SLEEPY BALL |
| 7 | Pepper | `01:777E` | `532D` | ANTIGRAVITY BALL |
| 8 | Magnet | `01:7786` | `5348` | MAGNETIC BAT |
| 9 | Triple ball | `01:778E` | `5378` | MULTI BALL |
| 10 | Extra life | `01:7796` | `539C` | EXTRA LIFE |
| 11 | Laser | `01:779E` | `53B5` | LAZER BAT |
| 12 | Reverse | `01:77A6` | `53C8` | REVERSE BAT |
| 13 | Ninja | `01:77AE` | `53F9` | NINJA UP |
| 14 | Ghost | `01:77B6` | `5423` | GHOST UP |
| 15 | Grenade | `01:77BE` | `5435` | GRENADE BAT |

The icon table is `01:7726`: one pointer per type to 4 (tile, attribute) pairs, in the order top-left, top-right, bottom-right, bottom-left. The handler jump table is `01:76E6`.

## When a power-up drops

1. A ball hit calls `00:1A3A`. A rocket, laser, grenade or plasma shot calls `00:1A0B`. Both subtract 1 from the brick and queue the result at `$D8BC`.
   - While a plasma shot is in flight (`$DC47 = 2`), `00:1A0B` subtracts a second point if the brick is not yet at 0.
   - While Ninja is active (`$D76E ≠ 0`), `00:1A3A` sets any brick that is not at 0 to `$D76E` (1). It then returns without a bounce, so the ball passes through.
2. The queue routine `00:1ED8` copies the power-up id to `$DB6E` and the new brick value to `$DB6F`, then calls `01:5034`.
3. `01:5034` returns at once unless the id is not 0 and the new brick value is exactly 1. Otherwise it fills a free falling-object slot at `$DB71` (8 slots of 12 bytes). On the way it changes the type:
   - Type `$10` (Random): `type = (frame counter $FF8C − d) & 15`. `d` is 3 on Blob levels and 0 otherwise. `$FF8C` goes up by 1 every frame in the VBlank handler.
   - Type 9 (Triple ball) becomes type 0 (Slowball) when `$D77C`, the number of balls in play, is 2 or more.
   - Type 6 (Clock) becomes type 0 (Slowball) when the weapon flag `$DC3D` is 0. See [The weapon flag](#the-weapon-flag).
   - Type `$11` becomes type 6. This is checked after the Clock rule, so id `$12` always drops a Clock.

## The weapon flag

`$DC3D` is the only power-up state, apart from the ball count, that changes which power-up a brick drops. It only affects Clock bricks (id 7). The routine at `01:5034` is the only place that changes a brick's power-up type.

| Event | Code | `$DC3D` |
|---|---|---|
| Pick up Rocket | `01:520A` → `01:523B` | 1 |
| Pick up Laser | `01:53B5` → `01:523B` | 1 |
| Pick up Grenade | `01:5435` → `01:523B` | 1 |
| Pick up Plasma | `01:5289` → `01:523B` | 1 |
| Pick up Poison | `01:52B1` | 0 |
| Pick up Milk | `01:52F4` | 0 |
| Pick up Magnet | `01:5354` | 0 |
| Pick up Reverse | `01:53D7` | 0 |
| Fire a plasma shot | `00:32F6` | 0 |
| Last grenade used (`$DC48` reaches 0) | `00:327C` | 0 |
| Last ball falls (life lost) | `00:1200` | 0 |
| An enemy hits the bat (life lost) | `00:3145` | 0 |
| Level start | `00:31DB` | 0 |

`$DC45` is the reload delay between rocket or laser shots, not an ammunition count. Rockets and lasers therefore never run out and keep the flag on.

These results were confirmed in the emulator:

- Each power-up was collected with the flag at 0 and at 1. Rocket, Plasma, Laser and Grenade set it. Poison, Milk, Magnet and Reverse cleared it. The rest left it unchanged.
- Losing a life cleared it.
- Hits on a Clock brick and a Triple ball brick were injected through the brick queue at `$D8BC`:
  - The Clock brick dropped a Clock with the flag on and a Slowball with it off.
  - The Triple ball brick dropped a Triple ball with 1 ball in play and a Slowball with 2 or 3.
- A Random brick was hit on each of the 16 frame phases, with the flag off. It gave every type once, except that the Clock phase gave a second Slowball.

Levels affected:

- Clock bricks: 4, 11, 24, 29, 32, 34, 35, 43, 64, 114
- Triple ball bricks: 4, 5, 6, 9, 13, 16, 17, 22, 30, 31, 34, 44, 46, 48, 49, 50, 51, 56, 62, 63, 66, 68, 69, 70, 74, 75, 76, 82, 86, 88, 91, 97, 98, 104, 106, 107, 110, 117, 123, 124, 127, 130, 132, 134, 137, 141, 149, 154, 157
- Random bricks (both rules apply to the result): 33, 53, 72, 87, 103, 140

## Game states

`hGameState` (`$FF9F`) selects the current screen. `RunStateInit` and `RunStateUpdate` (bank 1) jump through `StateInitHandlers` and `StateUpdateHandlers`. The values below were read in the emulator on each screen.

| Value | Screen |
|---|---|
| 0 | Copyright screen at power-on |
| 1 | Main menu and password entry |
| 2 | Playing a level |
| 3 | Game over |
| 4 | Pause |
| 5 | Title picture |
| 6 | "Developed by" logos |
| 7 | Entered for one frame between game over and the title. Not understood yet |
| 8 | Not seen yet |
| 9 | Password screen after every fourth level |
| 10 | Not seen yet |
| 11 | Language selection |
| 12 | SCi logo |
| 13 | Ending text after level 160 |

The value changes when the old screen starts to fade out, so the old screen stays visible for a short time afterwards.

## Useful RAM

| Address | Meaning |
|---|---|
| `$CCBA` | Start level from the password (0-based) |
| `$CCE8` | Current level (0-based) |
| `$D8AC` | Lives |
| `$D77C` | Balls in play |
| `$DAD7`–`$DADA` | Letters on the password screen (ASCII) |
| `$DC35` | Level type: 1 = UFO, 2 = Blob |
| `$DB71` | Falling power-ups, 8 × 12 bytes: active, y, x, type, 4 × (tile, attribute) |

## Other findings

- Level 160 spells "GG" in bricks.
- The ending text says "Congratulations, you have mastered Cool Bricks. Now try with just one life" (bank `$0E`, around `0E:6465`).
- The default high-score names are CLIVE, ANDY, MARCUS, RACHEL and VICKY (`02:4045`).
- Level 33 has two unbreakable bricks with the power-up id `$29`. They can never drop anything.

## Check against the community savestates

The community savestates (VisualBoyAdvance `.sgm`, one per level) were compared with `data/levels.json` using `tools/check_savestates.py`.

- Every state is on the level its file name says.
- Each state was saved before its level's maps were loaded, so the maps in state N+1 belong to level N. They match the extracted data exactly for 152 of the 159 levels that can be checked.
- In the other 7 states (2, 21, 29, 49, 87, 89 and 100), the save happened partway through loading the next level, so the maps hold a mix of two levels. For level 1, the state holds level 1 after some bricks were broken. None of these differences points to an error in the extracted data.
- In all 160 states the cheat flags `$DB51` and `$DB52` are set and the others are clear. The last password typed is `TDNZ`. So the states use `TDNZ` and `NCNZ`.

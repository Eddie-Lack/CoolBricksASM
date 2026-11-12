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

### The encoder

`EncodeLevelPassword` (`00:0974`) is the reverse of the check. It reads a 3-digit level number, builds `X` and `Y` from `b = level - 1`, and writes the four letters to `wPasswordChars`. It then calls `CheckPassword` on its own result, so `wStartLevel` is set as a side effect. The level password screen uses it.

The four cheat passwords are what the encoder would produce for levels 201, 205, 209 and 213 (`b` = `$C8`, `$CC`, `$D0`, `$D4`). `CheckPassword` tests for these values before its range check.

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

`hGameState` (`$FF9F`) selects the current screen. `RunStateInit` and `RunStateUpdate` (bank 1) jump through `StateInitHandlers` and `StateUpdateHandlers`. The values below were read in the emulator on each screen. States 7 and 8 were confirmed by forcing the value, and state 10 by running the ROM as an original Game Boy.

| Value | Screen |
|---|---|
| 0 | Copyright screen at power-on |
| 1 | Main menu and password entry |
| 2 | Playing a level |
| 3 | Game over |
| 4 | Pause |
| 5 | Title picture |
| 6 | "Developed by" logos |
| 7 | High score table, shown after game over |
| 8 | Credits |
| 9 | Password screen after every fourth level |
| 10 | "Please use a Game Boy Color" screen, shown on older consoles |
| 11 | Language selection |
| 12 | SCi logo |
| 13 | Ending text after level 160 |

The value changes when the old screen starts to fade out, so the old screen stays visible for a short time afterwards.

## Languages and text

`wLanguage` (`$DEFC`) holds the chosen language: 0 English, 1 Spanish, 2 French, 3 German, 4 Italian. When the language is confirmed, the code at `01:6B40` copies that language's table (`$51` bytes, `LanguageTable_*` in bank 1) to `wLangTable` (`$DF01`).

The table holds:

- 7 pointers to menu and ending strings in bank `$0E`
- 15 pointers to power-up messages in bank `$0E`
- pointers to the HUD, level title, high-score and "latest score" strings in bank 1
- a pointer to the level password screen strings in bank `$0C` and to the game over string in bank 5
- tile map addresses and a few single bytes that are not understood yet
- the number of the bank that holds the language's graphics: `$0B` English, `$12` Spanish, `$11` French, `$13` German, `$10` Italian

A string for `DrawString` is a 2-byte tile map address, then characters, and ends with `$FF`. A `$00` byte is followed by an attribute byte. A power-up message is 21 bytes: a horizontal scroll value and 20 characters. The scroll value is 0 or 4 and shifts the top row by half a tile, which centres texts of odd or even length. `ShowMessage` stores it in `hLevelScrollX`.

## Gameplay update

`Gameplay_Update` (`00:0F30`) runs once per frame while a level is played. Its parts are labelled in this order:

1. The level skip cheat (B button with `wCheatLevelSkip`).
2. `Gameplay_UpdateStun`: Poison shakes the bat by 3 pixels left and right until `wBatEffectTimer` runs out.
3. `Gameplay_MoveBat`: reads left and right from `hJoypad`. Reverse swaps the two bits first. The step size comes from `BatSpeedTable`, so the bat speeds up while a direction is held. The bat's X stays between `$17` and `$AA` minus its width.
4. `Gameplay_AntigravitySteering`: while Pepper is active, left and right set the direction of every ball (`$1C` and `$04`; no button gives 0). When `wBallEffectTimer` ends, the balls get fixed directions again.
5. `Gameplay_LaunchBall`: A launches a ball that sticks to the bat. The launch direction depends on which half of the screen the bat is in. Multi ball also goes through here.
6. `Gameplay_UpdateBalls`: copies each 7-byte ball from `wBalls` to `wBallWork`, calls `UpdateBall` and stores it back. A ball whose Y reaches `$A0` is removed.
   - When the last ball is lost, the bat explodes, `wWeaponFlag` is cleared and a life is taken.
   - With no lives left the state changes to game over. Otherwise `hLifeLostTimer` counts to `$28` and `RestartAfterLifeLost` runs.
7. `Gameplay_AfterBalls`: `UpdateFallingPowerups`, `UpdateEnemies` (UFO or blob), `UpdateShots`, `UpdatePickupEffects`, `UpdateBrickBreakEffects`, `UpdateUnbreakableHitEffects`, `DrawBatSprites`, `UpdateBatTiles` and `ProcessBrickHitQueue`.
8. `Gameplay_CheckPause`: Start changes the state to pause.

## Ball movement and collision

A ball has a position with a fraction byte for each axis, a direction from 0 to `$1F`, a speed byte and a flags byte.

- **Movement** (`UpdateBall_Move`): the ball moves by the X and Y velocity of its direction in `BallVelocityTable`. If the low nibble of the speed byte is n > 0, a second step of 1/2^n of that velocity follows in the same frame, unless the first step bounced. A sleeping ball (Clock) does not move.
- **Collision** (`CollideBall`): the ball is 8 × 8 pixels. The middle of each side is tested first, in the order left, right, bottom, top. Then the four corners are tested. At a corner, the pixel offsets inside the brick decide between a horizontal and a vertical bounce. An exact diagonal hit does both.
- **Each test point** (`CollideBallPoint`): a ball that moves down is tested against the bat first. Otherwise the point is looked up in `wBrickMap`.
- **Bounces** change the direction through four 32-byte tables (`BallReflectLeftTable` and so on). A hit on the bat sets direction and speed from the hit position (`BatBounceLookup`).
- **Multi ball** (`UpdateBall_Split`) adds two balls at the same position, one direction step to each side of the original.
- **Antigravity** tests only the two top corners after the side tests.

One of the four corner cases has a mistake in the original code. For an exact diagonal hit on the top-left corner, the new direction is calculated but not stored, so the ball keeps its direction.

## Enemies

`UpdateEnemies` runs `UpdateUfo` on UFO levels and `UpdateBlob` on blob levels. `UpdateProjectiles` runs on every level.

- **UFO:** `UfoPassTable` gives a wait time and a side for each of 8 passes. The UFO then crosses the screen at the height `wUfoHeight`, moving half a pixel per frame. At an X position taken from the frame counter it drops a bomb (`UpdateUfoBomb`). A bomb that hits the bat costs a life. A ball that touches the UFO (`CheckUfoHit`) ends that pass and scores 100, 150, 200, 250 and 500 points for the first to fifth hit (`UfoHitScores`). After the fifth hit the UFO does not come back. The hit count is reset at level start and after a lost life (`ResetEnemies`).
- **Blob:** the blob is a 15-byte object that follows path data (`UpdateEnemyPath`). `CheckBlobCatch` runs for every ball test point. A ball that touches the blob is removed and the blob starts its throw animation. It then throws the ball back as a projectile (`SpawnProjectile`), and the projectile turns into a ball again when it lands. `wBlobThrowCount` counts balls the blob is holding, so losing the last ball on screen does not cost a life while it is not 0.
- **Ghost and Ninja:** the blob cannot catch the ball while `wGhostActive` or `wNinjaActive` is set. Ghost lasts until `wGhostTimer` runs out.
- **Projectiles:** `wProjectiles` has 4 slots of 9 bytes. Grenades use the same slots.

## Weapons

`UpdateShots` updates six shot slots (`wShotActive`), then `Shots_HandleFire` reads the A button.

- **Grenade:** holding A raises `wGrenadePower` up to a limit. Releasing A throws the grenade, takes one from `wGrenadeCount` and shows the "GRENADE n" message from `GrenadeTexts_*`. Left or right held at that moment sets the throw direction. Using the last grenade clears `wWeaponFlag`.
- **Rocket and Laser:** `wRocketLaserBat` is 1 and `wLaserBat` picks the type. Each shot needs a new press of A (`wFireLatch`) and the cooldown `wShotCooldown` must have run out.
  - Rocket: cooldown 30 frames, at most 3 on screen (slots 0 to 2), 1 pixel per frame.
  - Laser: cooldown 8 frames, at most 6 on screen (slots 0 to 5), 2 pixels per frame.
  - A shot starts at the bat and flies straight up. It ends at the top of the playfield, on an unbreakable brick, or on the first brick it hits.
- **Shot slots differ.** Slots 0 and 1 hit bricks with `HitBrickWithShot`. Slots 2 to 5 use `HitBrickWithBall`, the ball's routine. So while Ninja is active, a shot from slots 2 to 5 sets a brick to 1 hit point as the ball would, and a shot from slots 0 and 1 removes 1 hit point as usual. This was confirmed in the emulator for slots 0 to 3: with Ninja active, a shot from slot 2 or 3 took a 4-hit-point brick straight to 1 and released its power-up, and a shot from slot 0 or 1 took it to 3.
- **Plasma:** A fires when no shot is in flight. Firing sets `wPlasmaState` to 2 and clears `wWeaponFlag`. The plasma shot uses slot 0 and passes through the bricks it hits.

## Score and effects

`AddScore` (bank 1) adds B units to the six score digits in `wScoreDigits`. One unit is 10 points on screen.

| Event | Units | Points |
|---|---|---|
| Brick hit | 1 | 10 |
| Power-up collected | `$0A` | 100 |
| Smiley, or Extra life at 9 lives | `$32` | 500 |

The password screen after every fourth level adds a bonus: 2000 points the first time and 500 more at each later screen (`wLevelBonus`). `StartGame` resets it.

Three small effect lists are updated every frame in bank 1:

- `wBrickBreakEffects` (14 slots), started by `SpawnBrickBreakEffect` when a plasma shot destroys a brick. The effect appears at the X of the shot (`wPlasmaShotX`). Bricks destroyed in any other way start no effect
- `wPickupEffects` (4 slots), started by `SpawnPickupEffect` where a power-up is collected
- `wUnbreakableHitEffects` (10 slots), started by `SpawnUnbreakableHitEffect` when the ball hits an unbreakable brick

## Main menu and password entry

`MainMenu_Update` (`00:20FA`) has two modes.

- **Navigation** (`MainMenu_Navigate`): `wMenuCursor` selects one of 5 items: start, start at the password level, enter password, music and sound effects. The second item is hidden until a level password has been entered. A, B, Select or Start on either start item calls `StartGame`, which sets 5 lives, clears the score and sets the level.
- **Password entry** (`MainMenu_PasswordEntry`): up and down change the letter at `wPasswordCursor`. The letters run from B to Z without the vowels, so 21 letters can be typed, but only the 16 in `PasswordAlphabet` are valid. A, Start or right moves to the next letter and B, Select or left moves back. Moving past the fourth letter calls `SubmitPassword`.

- **Idle:** `wMenuIdleTimer` is reset by any button and counts down every second frame. After about 8 seconds without input the menu changes to the high score table, and the next time to the credits (`wAttractToggle`). A button returns to the menu.

`hJoypad` bits: 0 = right, 1 = left, 2 = up, 3 = down, 4 = A, 5 = B, 6 = Select, 7 = Start.

## Ball power-ups replace each other

Slowball, Clock, Pepper, Ninja and Triple ball are "ball" power-ups. The pick-up handler of each one clears the flags of the other four (`wSlowBallActive`, `wSleepyBallActive`, `wAntigravityActive` and `wNinjaActive`), so only one of these effects is active at a time.

- Picking up any of the five ends Ninja, unless it is Ninja itself.
- Picking up Clock, Pepper, Ninja or Triple ball ends Slowball.
- Slowball clears the low nibble of every ball's speed at once, which removes the second movement step. While `wSlowBallActive` is set, bat hits use the slower half of `BatBounceTable`.

Bat power-ups (Rocket, Plasma, Laser, Grenade, Poison, Milk, Magnet, Reverse) do not touch these flags.

## How long timed power-ups last

Measured in the emulator on level 4, from the pick-up until the flag cleared.

| Power-up | Frames | Seconds |
|---|---|---|
| Pepper (Antigravity) | 159 | 2.7 |
| Poison (Stun) | 230 | 3.9 |
| Reverse | 230 | 3.9 |
| Ninja | 314 | 5.3 |
| Clock (Sleepy ball) | 318 | 5.3 |
| Ghost | 2038 | 34.1 |

Slowball, Milk, Magnet and the weapon bats have no timer. They last until another power-up replaces them or a life is lost.

## The brick skip

Two routines end a level, and each adds 1 to `wCurrentLevel`:

- `CountBrickDestroyed` (`00:1B14`), when `wBricksLeft` reaches 0. It only acts while `hStateTimer` is 0, and it sets `hStateTimer` to `$0F`.
- `Powerup_Smiley` (`01:5256`). It does not check `hStateTimer`.

Gameplay keeps running while `hStateTimer` counts down. If a Smiley is caught in that time, the level number goes up a second time and the next level is skipped.

Within a frame, falling power-ups are handled before the brick queue. A Smiley caught in the same frame as the last brick therefore ends the level first, and `CountBrickDestroyed` then does nothing.

Measured in the emulator, with the last brick breaking on frame 0:

| Smiley caught on frame | Levels advanced |
|---|---|
| −4 to 0 | 1 |
| 1 to 14 | 2 |
| later | 1 (the Smiley is gone when the next level starts) |

So the Smiley has to be caught 1 to 14 frames after the last brick breaks, a window of about a quarter of a second. The Smiley must already be falling, so its own brick cannot be the last one destroyed.

Special cases, also tested in the emulator:

- **On level 159** the skip goes straight to the ending. Level 160 is never played.
- **On level 160** the skip cancels the ending. The game continues at level 2.
- **On a level that is followed by the password screen** the skip also skips that screen.

## Screen effects

- **Brick shadows.** Every brick casts a shadow on the two background tiles below it. Shadow tiles use attribute `$0A` and lit tiles use `$08`. When a brick breaks, `GetBrickNeighbourMask` checks which neighbours remain. `BrickRedrawHandlers` then picks one of 16 cases that restore the background from `wBackgroundTilemap` with the correct shadows.
- **Brick sweep.** `SweepBricks` runs once when a level appears. A sweep crosses the bricks along 22 diagonals and swaps some brick tiles for 3 frames per diagonal. `BrickSweepLengths` gives the number of cells on each diagonal.
- **VBlank tile writes.** Gameplay code never writes to the tilemap directly. It queues changes in `wVBlankTileWrites` (tiles) and `wVBlankAttrWrites` (attributes), and the VBlank handler copies them to the screen.
- **Raster effects.** `SetUpRasterEffect` (bank `$0F`) copies one of three LCD STAT handlers to RAM at `wStatJump`. The handler runs on every screen line. It writes that line's colours and horizontal scroll, then patches its own operands with the next record of `wRasterTable`. `hPaletteMode` selects the handler: mode 1 changes two sprite colours and one background colour per line, modes 2 and 4 change four background colours, and mode 3 changes one sprite colour.
- **Fireworks.** The level password screen shows three fireworks (`UpdateFireworks`). Each rocket follows a launch script, flies until its fuse runs out, and bursts into 10 sparks. The sparks follow the paths in `LevelPasswordCurves`. `UpdateTwinkles` animates 11 twinkling stars on the same screen.
- **Title letters.** `TitleScreen_SlideLetters` slides the six title letters in from the right as sprites, one after the other. When a letter arrives, `TitleScreen_VBlank` draws it on the background. All six letters share one list of steps (`TitleLetterPath_1`); each later letter starts 3 bytes further in.
- **Logo sway.** On the level password screen the LCD STAT handler changes the horizontal scroll at three screen lines (`wScrollSplits`). `LogoSwaySteps` moves the first and third part in opposite directions.
- **Level title.** When a level starts, the top row shows the level title and blinks. `wLevelTitleTimer` counts down, and then the row shows the score again.
- **Frame shine.** `BrickShineAnimation` (bank 9) is a loop of 108 frames of 36 bytes. A frame is 12 records of (tile map address low, high, tile number). `FlushBrickRedraw` copies one frame per game frame to the VBlank tile write buffer, so only tile numbers in VRAM bank 0 change. It animates the metal frame around the playfield, not the bricks. Two lamps in the top bar swap tiles every 9 frames. A light runs along the slots on the left and right walls and takes 18 frames per pass. The cross piece on each wall cycles through six tiles. The byte `$FF` after frame 107 restarts the loop.
- **High score title.** Banks `$0B` (English), `$12` (Spanish), `$11` (French), `$13` (German) and `$10` (Italian) each hold 18 frames of 864 bytes (`HighScoreAnim_<Language>_NN`): the "HIGH SCORE" title spinning around its vertical axis, 54 tiles per frame (18 by 3). `StartHdmaTransfer` copies one frame to VRAM at `$9260` with HDMA. `HighScores_AdvanceAnim` steps to the next frame every third VBlank. The tile map (`$7CC0`) holds the tile numbers `$00` to `$35`. The attribute map (`$7CF6`) is 54 zeros. All five banks have the same layout, and the code uses the English labels for every language. The first 864 bytes of bank `$0C` are an all-zero blank frame (`HighScoreAnim_Blank`). It is copied with HDMA mode 3 to clear the title while the sprites slide off.
- **High score screen.** `HighScores_AdvanceAnim` steps the "HIGH SCORE" animation every third frame. `HighScores_SlideSprites` slides the four rows of sprites in and out, and rows alternate direction.

## Music and sound driver

Bank 6 holds the sound driver (`06:4000`–`06:487A`) and all song and sound effect data (up to `06:67D2`). After that come the unused text "-- THE END --" and a stale copy of bank 5 (`BankFiller_006`). Nothing reads them. Bank 0 reaches the driver through three small routines that switch to bank 6 and back:

| Bank 0 | Bank 6 | Meaning |
|---|---|---|
| `UpdateSound` | `UpdateSoundDriver` | Runs once per frame. |
| `PlayMusic`, `StartSong` | `PlaySong` | Starts song `E`. `PlayMusic` does nothing while music is turned off. |
| `PlaySound` | `PlaySfx` | Plays sound effect `A`. Does nothing while sound effects are turned off. |

The driver is a small tracker player. A tracker stores music as short blocks of notes (patterns) and a list that says in which order the patterns play (an order list).

### The four channels

The Game Boy has four sound channels and the driver gives each one its own track.

- Channels 1 and 2 are pulse channels. They use the same code and the same instruments.
- Channel 3 is the wave channel. It plays a 32-step waveform from wave RAM.
- Channel 4 is the noise channel.

Each channel has a block of variables in RAM (`wCh1Tick` at `$C000`, `wCh2Tick` at `$C017`, `wCh3Tick` at `$C02E`, `wCh4Tick` at `$C046`). `include/ram.inc` lists every field.

### The update, once per frame

`UpdateSoundDriver` is one long routine. Its parts run in a fixed order and fall into each other: channel 1, channel 2, channel 3, channel 4, the muted channel and the wave animation.

Each channel part does one of two things.

1. **Timing.** `wChNTick` counts frames. When it reaches 0 it starts again from `wSongTempo` and one *row step* has passed. `wChNRows` counts row steps. When it reaches 0 the channel reads its next row.
2. **Effects.** On every other frame the channel steps its instrument tables and writes the result to the sound registers (`Channel1Effects` and so on).

When a row starts a new note, the effects are skipped for that frame. The note is therefore heard one frame later.

### Songs

`PlaySong` reads a 13-byte header from `SongHeaders`:

| Bytes | Meaning |
|---|---|
| 0–7 | Four pointers, one order list per channel |
| 8 | Tempo: frames per row step (6, 7 or 8) |
| 9–10 | Pointer to the wave animation |
| 11–12 | Pointer to the 16-byte waveform that is copied to wave RAM |

There are 10 songs:

| Song | Label | Used for |
|---|---|---|
| 0 | `Song_Silence` | Stops the music. Each channel plays one silent note and holds it |
| 1 | `Song_Title` | Title screen |
| 2, 3, 4 | `Song_Level1` to `Song_Level3` | Levels. `wLevelMusicIndex` picks one and steps when the password screen appears |
| 5 | `Song_MainMenu` | Main menu |
| 6 | `Song_HighScores` | High scores. Same as song 5 with another channel 2 |
| 7 | `Song_GameOver` | Game over. Plays once |
| 8 | `Song_Ending` | Ending |
| 9 | `Song_Credits` | Credits |

An **order list** is a row of 2-byte entries: transpose, pattern number. The transpose value is added to every note of the pattern, so one pattern can be played in several keys. `PatternPointers` turns the pattern number into an address. There are 128 patterns, and songs share them.

An order list has no end mark. The last pattern of a track ends with a jump instead. Songs that loop jump back to the start of their order list. Songs that play once jump to `Order_Silence`, which repeats a pattern that only holds (`Pattern_1B`) for ever.

### Patterns

A **pattern** is a list of rows. Every row starts with its length in row steps. Then comes one of these:

| Bytes after the length | Constant | Meaning |
|---|---|---|
| `$FF` | `ROW_HOLD` | Nothing changes. The note goes on, or the channel stays silent |
| `$FE` | `ROW_RELEASE` | The note is released. The channel gets the release envelope of its instrument |
| `$FD` | `ROW_RETRIGGER` | The note starts again with the same instrument. Channel 3 does not know this command |
| note, instrument | | A new note. The note number is 0 to 71. The instrument is an index into `InstrumentPointers`, or into `NoiseInstrumentPointers` on channel 4 |

Where the next length would be, two values are special:

- `$00` (`PATTERN_END`): the pattern is over. The channel reads the next order list entry.
- `$FF` (`PATTERN_JUMP`): a pointer to an order list entry follows. The channel continues there.

Notes use scientific pitch notation. Note 0 is C2 at 65.4 Hz, and `NoteFrequencies` holds the register value of 72 notes (6 octaves). It follows equal temperament with A4 at 440 Hz, within about 5 cents up to B5 and within about 25 cents above it. `include/sound.inc` has `NOTE_C2` to `NOTE_B7`, with `s` for sharp. Pattern rows use these names and the `INSTR_*` and `NOISE_INSTR_*` constants. Noise rows keep the note byte as hex, because the driver ignores it. With a waveform of one cycle, the wave channel sounds one octave lower for the same value.

### Instruments

An instrument is a short record that points to *tables*. A table changes one value of the sound over time, one step per entry. All tables share one layout:

- An entry is a length in frames followed by the value (1 or 2 bytes).
- A length of 0 (`TABLE_END`) is followed by a pointer to the entry that comes next. This makes loops. A table that should stop points to a last entry that loops to itself.

An instrument does not point to the first entry itself but to the byte or two bytes before it, because the driver first steps forward and then reads. The sources write these pointers as `Arpeggio_05 - 1` or `PitchSlide_03 - 2`.

A pulse instrument (channels 1 and 2) is 9 bytes:

| Bytes | Meaning |
|---|---|
| 0 | Duty, written to `NR11`/`NR21` every frame |
| 1 | Volume envelope for the start of a note (`NR12`/`NR22`) |
| 2 | Volume envelope after a release |
| 3–4 | Arpeggio table: a number of semitones added to the note. Fast steps sound like a chord |
| 5–6 | Pitch slide table: a 16-bit amount added to the *pitch offset* on every frame. Up and down steps make vibrato |
| 7–8 | Pitch mode table, see below |

The pitch mode says how the frequency is built on that frame:

- Mode 0: the pitch offset alone. The note number is ignored. This is used for drum-like sounds and sweeps.
- Mode 1: the frequency of note + arpeggio from `NoteFrequencies`. The pitch offset is ignored.
- Mode 2: the frequency of note + arpeggio, plus the pitch offset.

A wave instrument (channel 3) is 10 bytes: five table pointers. The first two are volume tables for `NR32`, one for the note and one for after a release. The wave channel has no volume envelope of its own, so the table makes one. The other three are the arpeggio, pitch slide and pitch mode tables.

A noise instrument (channel 4) is 7 bytes: the length value for `NR41`, the two envelopes, and two tables. The values of the first table go to `NR43` (the noise shape) and the values of the second to `NR44`.

### Wave animation

The song header points to a waveform and to a wave animation. The animation is a table with 3-byte entries: length in frames, low byte of a wave RAM address (`$30` to `$3F`), value. Every step writes one byte of the waveform, so the tone colour changes slowly while the song plays. For the write the driver switches the wave channel off and on again and restarts the note (`UpdateWaveAnim`).

### Sound effects

`SfxTable` has 30 entries of 4 bytes: priority, pointer to the data, channel. Channel 2 means pulse channel 2. Any other value (the table uses 3) means the noise channel.

A sound effect *takes over* its channel:

- The channel reads its rows from the sound effect data (`wSfxPtr`) instead of the song. The rows have the same format as pattern rows. One row step is always 4 frames, and notes are not transposed.
- The data ends with `$00` and two more bytes. If the second of these is 0, the effect is over. If not, the two bytes are a pointer to more data. No sound effect in the ROM uses this.
- Meanwhile `UpdateMutedChannel` keeps reading the song rows of that channel without making a sound. When the effect ends, the song is at the right place and the channel joins in again with its next note.

Only one sound effect plays at a time. `PlaySfx` ignores a new effect when its priority is lower than the priority of the effect that plays (`wSfxPriority`). An equal or higher priority cuts the old effect off. `PlaySong` also stops the sound effect.

The game plays these sound effects. `include/sound.inc` has the constants (`SFX_BAT_BOUNCE` and so on).

| # | Name | Played when |
|---|---|---|
| 0 | `Sfx_Silence` | At start-up, in `FrameLoop` and after a lost life. It is one silent note with priority 127, so it stops any other effect. |
| 1 | `Sfx_BatBounce` | The ball hits the bat. |
| 2 | `Sfx_BrickHit` | A brick is hit. |
| 3 | `Sfx_BrickBroken` | A brick breaks. |
| 4 | `Sfx_WallBounce` | The ball or a projectile hits a wall or an unbreakable brick. |
| 5 | `Sfx_PowerupSpawn` | A brick drops a power-up. |
| 6 | `Sfx_BallSticks` | The sticky bat catches the ball. |
| 7 | `Sfx_BallLaunch` | A launches the ball from the bat. |
| 8 | `Sfx_PowerupCollected` | The bat catches a power-up. |
| 9 | `Sfx_BlobBallBounce` | A ball thrown by the blob lands on an unbreakable brick. |
| 10 | `Sfx_BatDestroyed` | The last ball is lost, or a UFO bomb hits the bat. |
| 11 | `Sfx_GrenadeBlast` | A grenade explodes. |
| 12 | `Sfx_GrenadeBounce` | A grenade lands on an unbreakable brick. |
| 13 | `Sfx_BlobCatch` | The blob catches the ball. |
| 14 | `Sfx_BlobThrow` | The blob throws the ball back. |
| 15 | `Sfx_BatStunned` | The bat shakes while stunned (Poison). |
| 16 | `Sfx_GrenadeThrow` | A grenade is thrown. |
| 17 | `Sfx_PlasmaShot` | Plasma is fired. |
| 18 | `Sfx_RocketShot` | A rocket is fired. `Shots_FireRocketOrLaser` computes the number. It is 18 without the Laser and 19 with it. |
| 19 | `Sfx_LaserShot` | A laser is fired. |
| 20 | `Sfx_UfoBomb` | The UFO drops a bomb. |
| 21 | `Sfx_UfoHit` | The ball or a shot hits the UFO. |
| 22 | `Sfx_BallWakesUp` | The sleeping ball (Clock) wakes up. |
| 23 | `Sfx_AntigravityEnd` | Antigravity ends. |
| 24 | `Sfx_GhostEnd` | Ghost ends. |
| 25 | `Sfx_MenuMove` | A menu cursor or value changes. |
| 26 | `Sfx_MenuSelect` | A menu choice or a screen is confirmed. |
| 27 | `Sfx_FireworkSpark` | A firework spark starts. |
| 28 | `Sfx_FireworkBurst` | A firework rocket bursts. |
| 29 | `Sfx_29` | Nothing plays it. |

The numbers were checked by logging each call and its caller during scripted play. Effects 25, 27 and 28 were not reached in the emulator and are named from the code. Effect 10 was seen for the lost ball only.

### Faults in the original data

The data has small faults. They are part of the ROM, so the disassembly keeps them.

- **Stray noise pointer.** `NoiseInstrument_00` is the silent noise instrument. Its `NR43` table pointer points to a pitch slide table (`PitchSlide_00`), which has 3-byte entries. The noise code reads 2-byte entries. After 255 frames it takes the end mark and the low byte of the real loop pointer as a pointer: `$1C00`, in the code of bank 0. From then on it writes bytes from bank 0 to `NR43`. The envelope is 0, so nothing is heard. This happens in normal play, for example while `Song_Silence` plays.
- **Notes above the table.** Note number + transpose + arpeggio can be more than 71. The frequency is then read from `SfxTable`, which follows `NoteFrequencies`. Sound effect 22 does this: its instrument adds 15 semitones to note 60 for one frame.
- **Missing end mark.** `PitchSlide_19` (instrument `$13`) has its loop pointer but no end mark before it. If a note with this instrument lasts longer than 257 frames, the driver reads the pointer and the next instrument as slide entries.
- **Jumps in sound effects.** The `$FF` jump command does not work in sound effect data: it would write to the variables of the song channel. No sound effect uses it.
- **Transpose on noise.** Channel 4 adds the transpose value to the note and then throws the result away.

These faults matter for moving the data. The first one makes the sound depend on the low byte of the address of `PitchSlide_00`. The second makes it depend on the high byte of the address of `Sfx_BatBounce`. See the relocation notes in the README.

### What is not used

No song or sound effect reaches 3 patterns, 15 pulse and wave instruments, 3 noise instruments and 22 tables or waveforms. Four more instruments are not in the pointer tables at all, and three short pieces of order list, pattern and sound effect data have no pointer to them. The sources mark them with "not used" or "Nothing points here". They are still written with labels, so they move with the rest.

## Useful RAM

| Address | Meaning |
|---|---|
| `$CCBA` | Start level from the password (0-based) |
| `$CCE8` | Current level (0-based) |
| `$D8AC` | Lives |
| `$D77C` | Balls in play |
| `$DAD7`–`$DADA` | Letters on the password screen (ASCII) |
| `$DC35` | Level type (`wLevelType`): bit 0 = UFO, bit 1 = blob |
| `$DC36` | `wBlobPalette`: the high nibble of the level type byte, added to the attributes of the blob's sprites |
| `$DB71` | Falling power-ups, 8 × 12 bytes: active, y, x, type, 4 × (tile, attribute) |
| `$C000`–`$C068` | Sound driver variables (`wSoundState`) |

## Other findings

- Level 160 spells "GG" in bricks.
- The ending text says "Congratulations, you have mastered Cool Bricks. Now try with just one life" (bank `$0E`, around `0E:6465`).
- The default high-score names are CLIVE, ANDY, MARCUS, RACHEL and VICKY (`02:4045`).
- The ending sets `wEndingSeen`. While it is set, no level password screen appears. `StartGame` clears it.
- The main menu has five hidden sprites that spell B, O, I, N, G. `UpdateMenuSparkles` draws them from `BoingLetterSprites` and moves them with `BoingLetterBobSteps`. They start below the visible screen (`BoingLetterStartPositions`) and never come into view.
- The end of many banks is stale filler, not code or data. Each tail was compared byte by byte with its source, and each is a `BankFiller_<bank>` block.
  - Bank 1 from `$7CAA` is a copy of the last 854 bytes of bank 0.
  - Banks 2 to `$0D` end with a copy of the last 164 bytes of bank 0, from `$7F5C`. This includes 78 trailing zeros.
  - Bank `$0B` is stale from `$7E3C`: zeros, a 0/1 byte table and then the copy of bank 0.
  - Banks `$10` to `$13` are stale from `$7D2C`: 364 bytes of credits text that equal bank `$0F`, then 360 bytes that equal the end of bank `$0E`.
  - Banks `$0F` to `$20` end with a copy of the last 360 bytes of bank `$0E`, from `$7E98`.
  - Banks `$14` to `$1F` are 12 identical stale 16 KB buffers. Bank `$20` is a copy of bank `$13`. Banks `$21` to `$3F` are all zero.
  - Bank 9 after `$4F30` and bank 6 after `$67E0` are stale copies of bank 8 and bank 5.
  - Nothing points into any of these tails. Overwriting them with `$AA` and playing a full session in each language changed no screen.
- Some variables are written and never read: `wMessageUnused`, `wLevelPasswordUnused`, and the two bytes at `wBlob + 13`. `wBonusCountdownPaused` is read but never written.
- Level 33 has two unbreakable bricks with the power-up id `$29`. They can never drop anything.

## Check against the community savestates

The community savestates (VisualBoyAdvance `.sgm`, one per level) were compared with `data/levels.json` using `tools/check_savestates.py`.

- Every state is on the level its file name says.
- Each state was saved before its level's maps were loaded, so the maps in state N+1 belong to level N. They match the extracted data exactly for 152 of the 159 levels that can be checked.
- In the other 7 states (2, 21, 29, 49, 87, 89 and 100), the save happened partway through loading the next level, so the maps hold a mix of two levels. For level 1, the state holds level 1 after some bricks were broken. None of these differences points to an error in the extracted data.
- In all 160 states the cheat flags `$DB51` and `$DB52` are set and the others are clear. The last password typed is `TDNZ`. So the states use `TDNZ` and `NCNZ`.

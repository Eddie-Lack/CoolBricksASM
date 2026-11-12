# Cool Bricks disassembly

A disassembly of *Cool Bricks* (Game Boy Color, 2000). It assembles to a ROM that is identical to the original (MD5 `5a7673f1e61cd707bdc880ff76396a3d`).

This is a fork of [RoddyDev/CoolBricksASM](https://github.com/RoddyDev/CoolBricksASM), which produced the matching build, the extracted graphics and the first labels in the music driver.

## Progress

![Routines named](docs/badges/routines.svg) ![Local labels](docs/badges/locals.svg) ![RAM named](docs/badges/ram.svg) ![Data labelled](docs/badges/data.svg) ![Graphics PNGs](docs/badges/graphics.svg) ![Routine comments](docs/badges/comments.svg) ![Relocation tested](docs/badges/relocation.svg)

What each badge measures (`python tools/progress.py` recalculates them from the sources):

| Badge | Measures |
|---|---|
| Routines named | Routines (labels that start code) that have a real name, not one made from an address. |
| Local labels | `jr` targets that have a name for their purpose, not an address. |
| RAM named | Variables in `include/ram.inc` that have a real name, not `wUnk_` or `hUnk_`. |
| Data labelled | Bytes of the 1 MiB ROM that sit under a label. Bytes before the first label of a bank, and banks with no label, count as unlabelled. |
| Graphics PNGs | `.2bpp` files in `gfx/` that have a PNG. |
| Routine comments | Routines that have a header comment. |
| Relocation tested | Banks `$00`–`$13` that pass the relocation test. Bank 4 can't be tested. The number is kept by hand in `docs/progress_manual.json`. |

## Status

The game's code, RAM, level data, text and music driver are fully disassembled and named. The main work left is the graphics-heavy language banks and some tidying.

| Area | Status |
|---|---|
| Matching build | Done. `make` and `make check` both reproduce the original ROM. |
| Code and data separated | Done. |
| Routine and jump names | Done. No automatic labels are left. |
| RAM variables | Done. 382 names and no placeholders. |
| Pointer tables | Done. Every pointer is a label in the banks that pass the relocation tests. |
| Level data and text | Done. |
| Music and sound driver | Done. Rows and sound effects are still plain numbers (see below). |
| Graphics files | Done. All 47 `.2bpp` files have a PNG. |
| Relocation tests | Mostly done. See [Checks](#checks). |
| Routine comments | Partly done. About 4 in 10 of the 280 routines in banks 0, 1 and `$0F` have a header comment. |
| Language graphics banks (`$10`–`$13`) | Not done. The data has no labels. |
| Bank 9 (brick shine animation) | Not done. It is one 16 KB block. |

## Building

With [RGBDS](https://rgbds.gbdev.io) 0.8.0 and GNU make:

```sh
make
```

This builds `game.gbc` and compares its MD5 with the original ROM. `Makefile.windows` is the original Windows cmd version (`make -f Makefile.windows`).

Without RGBDS, the checking assembler builds the ROM and compares its MD5:

```sh
make check
```

`tools/gbasm.py` supports only the syntax these sources use. It has no macros.

## Completed

1. **Code and data are separated.** The code was traced from the reset vector, the interrupt vectors, the game state tables and the jump tables. Everything the trace does not reach is `db`/`ds`.
   - Bank 0 is almost all code.
   - Bank 1 is part code, part tables, text and palettes.
   - Bank 6 holds the music driver (`$4000`–`$487A`) and its data.
   - Bank `$0F` holds a few interrupt handlers (`$4000`–`$4213`) and data.
   - All other banks are data.
2. **Everything in the code has a name.** Every subroutine and `jp` target has a global label. Every `jr` target is a local label named for what the code does, for example `QueueBrickHit.findFreeSlot`. The names were proposed and then checked against the code in a second pass.
3. **All RAM has names.** `include/ram.inc` names every variable the code uses, with a comment. Code in banks 0, 1, 6 and `$0F` contains no raw RAM addresses. The state values are listed there too.
4. **Pointer tables use labels.**
   - `LevelTable` (bank 5) points to `Background_*`, `LevelHeader_*`, `BrickLayout_Level*` (bank 8) and `PowerupMap_Level*` (bank `$0C`).
   - Bank 1 has `PowerupHandlers`, `PowerupSprites`, `StateInitHandlers`, `StateUpdateHandlers` and `BrickRedrawHandlers`.
   - Calls from bank 0 into banks 1, 6 and `$0F` use labels where the bank is known.
   - Bank 6 has `SongHeaders`, `SfxTable`, `PatternPointers`, `InstrumentPointers` and `NoiseInstrumentPointers`. Every pointer inside the song, instrument and sound effect data is a label too.
5. **Level data is structured.** Brick layouts and power-up maps are (count, value) pairs, one labelled block per level. Tile maps are one screen row per line and named `Tilemap_<screen>`. Graphics blocks are named `Gfx_<screen>`. `docs/ROM_MAP.md` lists what every part of each bank holds, and `python tools/rom_map.py` rebuilds it.
6. **Text is readable.** The five language tables in bank 1 (`LanguageTable_English` and so on) point to labelled strings. 106 strings and the 75 power-up messages are written as text. The credits lists in bank `$0F` are text too.
7. **The music driver is documented.** It is named, commented and described in [docs/RESEARCH.md](docs/RESEARCH.md). Songs, patterns, instruments, tables, waveforms and sound effects have labels.
8. **Graphics have PNGs.** Tile data is in `gfx/*.2bpp`, and each file has a PNG that converts back to the identical `.2bpp` file with `rgbgfx`. Some images are loaded in two parts but stored as one file.
9. **The game logic is written up.** [docs/RESEARCH.md](docs/RESEARCH.md) covers passwords, cheats, level data, power-ups, ball and enemy behaviour, screen effects and the music driver.

## Checks

The sources build to the matching ROM with RGBDS 0.8.0 (`make`) with no warnings under `rgbasm -Wall`, and with `tools/gbasm.py` (`make check`).

`tools/relocation_test.py` moves a bank by 3 bytes, rebuilds, and compares a scripted play-through with the original. The play-through covers the menus, the high score and credits screens that appear when the menu idles, every level load, pause, the password screens, the ending and game over. It compares the screen, not sound.

- **English.** Banks 0, 1, 2, 3, 5, 7, 8, 9, `$0A`, `$0C`, `$0D`, `$0E` and `$0F` pass. Bank 6 passes too.
- **Other languages.** In Spanish, French, German and Italian, banks 0, 1, 5, `$0C` and `$0E` pass. These hold the language tables and text. Bank `$0F` (credits) also passes in French.
- **Sound.** `tools/sound_relocation_test.py` plays all 10 songs and all 30 sound effects. It records every write to the sound registers and the driver's variables in every frame. With bank 6 moved in two parts (3 bytes at the start, 256 bytes from `PitchSlide_00` on), the sound is identical.
- **Not tested.** Bank 4 ends with an image and can't be shortened. Banks `$0B` and `$10`–`$13` can't be moved by a few bytes (see below).

## Remaining work

1. **Language graphics banks `$10`–`$13`.** Each holds the same kind of data as bank `$0B`: the "HIGH SCORE" animation frames, tile maps and graphics for one language (`$12` Spanish, `$11` French, `$13` German, `$10` Italian). Bank `$0B` (English) is labelled. The others are not. Bank `$10` has a label, `IsThisTheOne`, carried over from the original repository.
2. **Bank 9.** It is one 16 KB block labelled `BrickShineAnimation`. The animation frames inside it are not split up or described.
3. **Small unlabelled blocks.** `docs/ROM_MAP.md` shows them: 864 bytes at the start of bank `$0C` and 374 bytes at the start of bank `$10`.
4. **Comments.** About 6 in 10 routines in banks 0, 1 and `$0F` have a name but no header comment.
5. **Play-testing the names.** The names were checked against the code, not against every play situation. A few may still be slightly off.
6. **Music data.** Sound effects have numbers (`Sfx_00` to `Sfx_29`), not names. Instrument and table labels are numbered by address. Pattern rows are plain `db` and `dw` lines with no note names, because `tools/gbasm.py` has no macros.
7. **Filler at the end of banks.** The end of bank 1 (from `$7CAA`) is a stale copy of bank 0 and is stored as plain bytes (`BankFiller_001`). Banks 2 to `$0D` and `$0F` to `$20` end with similar copies that are still part of their last data block. Bank 6 has leftover data from `$67D3` (`LeftoverData_006_67d3`). Banks `$14`–`$1F` are 12 copies of one bank, bank `$20` is a copy of bank `$13`, and banks `$21`–`$3F` are empty.
8. **Relocation tests in other languages.** Banks 2, 3, 7, 8, 9, `$0A` and `$0D` are tested in English only.
9. **Upstream.** No pull request has been opened against RoddyDev/CoolBricksASM.

## Limits that can't be fixed

These come from the original ROM and can't be removed without changing it.

- **HDMA alignment.** The "HIGH SCORE" animation is sent with HDMA, which needs a source address that is a multiple of 16. The language graphics banks must keep that alignment. An `ASSERT` checks it for bank `$0B`.
- **Two sound data faults.** They tie the sound to two address bytes, so a plain shift of bank 6 isn't identical. With 3 bytes, the values written to `NR43` by the silent noise instrument change. With 256 bytes, the pitch of a few single frames of sound effect 22 changes. [docs/RESEARCH.md](docs/RESEARCH.md) explains both. The first fault reads its `NR43` values from bank 0, so moving code in bank 0 changes those silent writes too.


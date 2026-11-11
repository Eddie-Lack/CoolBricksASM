# Cool Bricks disassembly

A work-in-progress disassembly of *Cool Bricks* (Game Boy Color, 2000). It assembles to a ROM that is identical to the original (MD5 `5a7673f1e61cd707bdc880ff76396a3d`).

This is a fork of [RoddyDev/CoolBricksASM](https://github.com/RoddyDev/CoolBricksASM), which produced the matching build, the extracted graphics and the first labels in the music driver.

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

The sources build to the matching ROM with RGBDS 0.8.0 (`make`), with no warnings under `rgbasm -Wall`, and with `tools/gbasm.py` (`make check`). All 41 PNG files convert back to identical `.2bpp` files with `rgbgfx`.

## What has been done since the fork

1. **Code and data are separated.** The code was traced from the reset vector, the interrupt vectors, the game state tables and the jump tables. Everything the trace does not reach is now `db`/`ds`.
   - Bank 0 is almost all code.
   - Bank 1 is part code, part tables, text and palettes.
   - Bank 6 holds the music driver (`$4000`–`$487A`) and its data.
   - Bank `$0F` holds a few interrupt handlers (`$4000`–`$4213`) and data.
   - All other banks are data.
2. **RAM has names.** `include/ram.inc` names the variables that are understood so far. Code in banks 0, 1, 6 and `$0F` uses the names.
3. **Known routines have names and comments.** Examples: `CheckPassword`, `LoadLevel`, `HitBrickWithBall`, `SpawnPowerup` and the 16 `Powerup_*` pick-up handlers.
   - The handlers of the 14 game states are named `StateInit_*` and `StateUpdate_*`. `include/ram.inc` lists the state values.
4. **Pointer tables use labels.**
   - `LevelTable` (bank 5) points to `Background_*`, `LevelHeader_*`, `BrickLayout_Level*` (bank 8) and `PowerupMap_Level*` (bank `$0C`).
   - Bank 1 has `PowerupHandlers`, `PowerupSprites`, `StateInitHandlers`, `StateUpdateHandlers` and `BrickRedrawHandlers`.
   - Calls from bank 0 into banks 1, 6 and `$0F` use labels where the bank is known.
5. **Level data is structured.** Brick layouts and power-up maps are written as (count, value) pairs, one labelled block per level.
   - Tile maps are written one screen row per line and named `Tilemap_<screen>`. Graphics blocks are named `Gfx_<screen>`.
   - `docs/ROM_MAP.md` lists what every part of each bank holds. `python tools/rom_map.py` rebuilds it.
6. **Text is readable.** The five language tables in bank 1 (`LanguageTable_English` and so on) point to labelled strings. 106 strings and the 75 power-up messages are written as text. The credits lists in bank `$0F` are text too.

## What is left

- **Names inside routines.** Every subroutine and every `jp` target in banks 0, 1 and `$0F` has a name. About 710 `jr_` labels inside routines are still automatic.
- **RAM.** `include/ram.inc` has 251 real names. Another 108 variables have placeholder names (`wUnk_xxxx`, `hUnk_xxxx`). Code in banks 0 and 1 no longer contains raw work RAM addresses.
- **Relocation.** `tools/relocation_test.py` shifts a bank by 3 bytes, rebuilds, and compares a scripted play-through with the original. The session covers the menus, the high score and credits screens that appear when the menu idles, every level load, pause, the password screens, the ending and game over.
  - In English, banks 0, 1, 2, 3, 5, 7, 8, 9, `$0A`, `$0C`, `$0D`, `$0E` and `$0F` pass.
  - In Spanish, French, German and Italian, banks 0, 1, 5, `$0C` and `$0E` pass. These hold the language tables and text. Bank `$0F` (credits) also passes in French.
  - The language graphics banks (`$0B`, `$10`–`$13`) share one layout and must stay identical in structure. They cannot be shifted by a few bytes: the "HIGH SCORE" animation is sent with HDMA and must stay 16-byte aligned. An `ASSERT` checks this for bank `$0B`.
  - Bank 6 (music) fails. Its data has pointers that are still numbers.
  - Bank 4 ends with an image and cannot be tested this way.
  - Only the screen is compared, not sound.
- **Graphics.** Tile data is in `gfx/*.2bpp`. Six newer files have no PNG yet. Some images are loaded in two parts but stored as one file.
- **Music.** Bank 6 holds the music driver and its data. Only the first routines are labelled.
- **Unlabelled data.** `docs/ROM_MAP.md` shows the blocks with no meaningful name yet. Banks `$0B` and `$10`–`$13` (language graphics) and bank 9 are the largest.
- **Filler.** Banks `$14`–`$1F` are 12 copies of one bank, bank `$20` is a copy of bank `$13`, and banks `$21`–`$3F` are empty.

The game's logic is described in [docs/RESEARCH.md](docs/RESEARCH.md).

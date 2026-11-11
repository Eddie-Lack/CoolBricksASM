# Cool Bricks disassembly

A work-in-progress disassembly of *Cool Bricks* (Game Boy Color, 2000). It assembles to a ROM that is identical to the original (MD5 `5a7673f1e61cd707bdc880ff76396a3d`).

This is a fork of [RoddyDev/CoolBricksASM](https://github.com/RoddyDev/CoolBricksASM), which produced the matching build, the extracted graphics and the first labels in the music driver.

## Building

With [RGBDS](https://rgbds.gbdev.io) 0.8.0:

```sh
rgbasm -o game.o game.asm
rgblink -n game.sym -m game.map -o game.gbc game.o
rgbfix -v -p 255 game.gbc
```

The `Makefile` does the same but uses Windows commands.

Without RGBDS, the checking assembler builds the ROM and compares its MD5:

```sh
python tools/gbasm.py game.asm game.gbc 5a7673f1e61cd707bdc880ff76396a3d
```

`tools/gbasm.py` supports only the syntax these sources use. It has no macros. The changes below were checked with it, not with RGBDS.

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
6. **Text is readable.** The five language tables in bank 1 (`LanguageTable_English` and so on) point to labelled strings. 106 strings and the 75 power-up messages are written as text.

## What is left

- Most routines still have automatic names (`Call_000_xxxx`). Ball physics, the UFO and blob enemies, scoring and the menus are not traced yet.
- Most data is still unlabelled `db`: palettes, tile maps, background pictures, music, and the text that the language tables do not point to (credits, high-score names).
- Pointers inside code (`ld hl, $4630`) and inside unstructured data are still numbers. The ROM cannot be rearranged safely until they are labels.
- Banks `$0B` and `$10`–`$13` hold the graphics of the five languages. The bank number comes from the language table (`wLangGraphicsBank`). Their contents are still unlabelled.
- Banks `$14`–`$1F` are 12 copies of one bank, bank `$20` is a copy of bank `$13`, and banks `$21`–`$3F` are empty.
- A few fragments at the end of bank 1 (`$7CAA` onwards) are unreachable leftovers of bank 0 code.

The game's logic is described in [docs/RESEARCH.md](docs/RESEARCH.md).

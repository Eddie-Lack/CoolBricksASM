; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "src/interrupts.asm"

INCLUDE "src/header.asm"

SECTION "FIXED BANK ROM", ROM0[$0150]
; Entry point after the header. Sets the stack and checks the hardware.
; Then loops: waits for VBlank, turns the LCD off, resets the sound, runs RunStateInit, installs the interrupt
; handlers, turns the LCD on and runs RunStateUpdate. When that returns, the loop starts again.
ProgramStart:
    di                      ; disable interrupts
    ld hl, wStackTop            ; setup stack pointer
    ld sp, hl
    call GBC_Check          ; Do a RAM Check to check if the ROM is being booted on the correct hardware

    jr_000_0158:
    .WaitForVBlank:
    ldh a, [rLY]            ; Check current rendering line
    cp $90                  ; Wait until VBlank (Line 144)
    jr c, .WaitForVBlank    ; If carry is set, that means (rLY - $90) < 0, did not reach VBlank. Do another loop.

    xor a                   ; Zero out A register
    ldh [rLCDC], a          ; Turn off LCD

    ; CAUTION!
    ; Stopping LCD operation (Bit 7 from 1 to 0) may be performed during VBlank ONLY.
    ; Disabling the display outside of the VBlank period may damage the hardware by burning in a black horizontal line.
    ; This appears to be a serious issue. Nintendo is reported to reject any games not following this rule.

    ld e, $00
    call StartSong
    xor a
    call PlaySound
    call UpdateSound
    call UpdateSound
    call UpdateSound
    call UpdateSound
    ld a, [hResumeFromPause]
    or a
    jr nz, .skipOamClear

    ld a, $28
    ld hl, wOamBuffer
    call ClearOamEntries

.skipOamClear:
    call RunStateInit
    call InstallInterruptHandlers
    ld a, [hResumeFromPause]
    or a
    jr nz, .resumeLcdc

    ld a, [wLcdcFlags]
    ld b, a
    ld a, $83
    or b
    jr .enableLcd

.resumeLcdc:
    ld a, $89

.enableLcd:
    ldh [rLCDC], a
    ei
    call RunStateUpdate
    di
    jr jr_000_0158

; ClearRAM routine
; This fills parts of RAM to value set in register A
; Parameters: A = Value to fill RAM with; BC = Amount of RAM to fill; HL = RAM Address to start filling
ClearRAM:
    ; Initial setup
    inc b
    inc c
    jr .DecreaseValues

.StoreValue:
    ld [hl+], a

.DecreaseValues:
    dec c
    jr nz, .StoreValue

    dec b
    jr nz, .StoreValue

    ret

; DataTransfer routine
; This transfer data from anywhere to RAM.
; Parameters: BC = Data Length
;             DE = Destination
;             HL = Data Source
DataTransfer:
    ld a, [hl+]             ; Read data from source
    ld [de], a              ; Store data to destination
    inc de                  ; Increase destination index
    dec bc                  ; Decrease data length
    ld a, b                 ; Check if remaining data length is zero
    or c
    jr nz, DataTransfer     ; Go back if it's not zero.
    ret                     ; return

; Clear the tile map at HL in both VRAM banks.
ClearTileMap:
    push hl
    xor a
    ldh [rVBK], a
    ld b, a

.clearBank0Loop:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec b
    jr nz, .clearBank0Loop

    pop hl
    ld a, $01
    ldh [rVBK], a
    xor a
    ld b, a

.clearBank1Loop:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec b
    jr nz, .clearBank1Loop

    ret

    ; TODO: Document this function

; Copy a rectangle of B x C tiles from HL to the tile map at DE.
CopyTilemapRect:
    ld [hTemp], a

.copyRowLoop:
    push bc
    push de
    ld a, [hTemp]
    ld c, a

.copyTileLoop:
    ld a, [hl+]
    add c
    ld [de], a
    inc de
    dec b
    jr nz, .copyTileLoop

    pop de
    ld a, $20
    add e
    jr nc, .noCarry

    inc d

.noCarry:
    ld e, a
    pop bc
    dec c
    jr nz, .copyRowLoop

    ret

; Fill a rectangle of B x C tiles at HL with D.
FillTilemapRect:
    push bc
    push hl

.fillTileLoop:
    ld a, d
    ld [hl], a
    inc hl
    dec b
    jr nz, .fillTileLoop

    pop hl
    ld a, $20
    add l
    jr nc, .noCarry

    inc h

.noCarry:
    ld l, a
    pop bc
    dec c
    jr nz, FillTilemapRect

    ret

; ChangeROMBank function
; As the name says, this changes the bank in ROM1 ($4000-7FFF)
; Parameters: A = ROM Bank
ChangeROMBank:
    ld [ROM_BANK], a
    ret

LoadOAMCode:
    ; setup variables
    ld bc, hOamDmaRoutine            ; this is supposed to be C = 80, this is gonna write to HRAM.
    ld b, $0a               ; Data length
    ld hl, .OAMCode    ; Data source

    .loop:
        ld a, [hl+]             ; Read data
        ld [_IO+c], a           ; Move data to HRAM
        inc c                   ; Increase index
        dec b                   ; Decrease left counter
        jr nz, .loop            ; If there's data left to transfer, jump back to loop.
        ret                     ; return

    .OAMCode:
        ; this is OAM DMA code. This is copied to HRAM so it's executed during VBlank.
        db $3e, $c2, $e0, $46, $3e, $28, $3d, $20, $fd, $c9
        ; The code is translated to this:
        ; ld a, $c2                 ; transfer sprite data from $c2xx to OAM
        ; ldh [rDMA], a
        ; ld a, $28                 ; Do a small loop because the CPU cannot access ROM while DMA transfer is happening.
        ; .DMALoop:
        ; dec a
        ; jr nz, .DMALoop
        ; ret

; Reads the D-pad and the buttons from rP1 and stores them in hJoypad.
; Bits 0 to 3 are right, left, up, down. Bits 4 to 7 are A, B, Select, Start. A set bit means held.
ReadJoypad:
    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    swap a
    ld e, a
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    or e
    swap a
    ld [hJoypad], a
    ret

; Write the VBlank and LCD STAT jump stubs to RAM from hVBlankHandler and hStatHandler.
InstallInterruptHandlers:
    ld a, $c3
    ld [hVBlankJump], a
    ld a, $c3
    ld [wStatJump], a
    ld a, [hVBlankHandler]
    ld [hVBlankJump + 1], a
    ld a, [hVBlankHandler + 1]
    ld [hVBlankJump + 2], a
    ld a, [hStatHandler]
    ld [wStatJump + 1], a
    ld a, [hStatHandler + 1]
    ld [wStatJump + 2], a
    ld a, $0f
    ld [ROM_BANK], a
    ld a, [hPaletteMode]
    or a
    call nz, SetUpRasterEffect
    ld a, $01
    ld [ROM_BANK], a
    ld a, $40
    ldh [rSTAT], a
    ld a, [hLycStart]
    ldh [rLYC], a
    ld a, [hInterruptEnable]
    ldh [rIE], a
    ld hl, wRasterTable
    ld a, l
    ld [wRasterPtr], a
    ld a, h
    ld [wRasterPtr + 1], a
    ret

; LCD STAT handler used for the scroll split effect.
; Reads the next SCX value and the next LYC line from wScrollSplitPtr, applies them and advances the pointer.
Stat_Default:
    push af
    push hl
    ld a, [wScrollSplitPtr]
    ld l, a
    ld a, [wScrollSplitPtr + 1]
    ld h, a
    ld a, [hl+]
    ldh [rSCX], a
    ld a, [hl+]
    ldh [rLYC], a
    ld a, l
    ld [wScrollSplitPtr], a
    ld a, h
    ld [wScrollSplitPtr + 1], a
    pop hl
    pop af
    reti

VBlank:
    ; save register contents to stack
    push af
    push hl
    push de
    push bc
    ldh a, [rSVBK]
    ld h, a
    push hl
    xor a
    ldh [rSVBK], a
    call TitleScreen_VBlank
    call hOamDmaRoutine
    call LevelPassword_VBlank
    ld hl, wRasterTable
    ld a, l
    ld [wRasterPtr], a
    ld a, h
    ld [wRasterPtr + 1], a
    ld a, $01
    ld [hVBlankDone], a
    pop hl
    ld a, h
    ldh [rSVBK], a
    pop bc
    pop de
    pop hl
    pop af
    reti

; VBlank handler while a level is played. Starts the OAM DMA.
; Shows the level title with blinking while wLevelTitleTimer runs, otherwise draws the score and lives.
; Then flushes the queued tile and attribute writes, resets wRasterPtr, sets hVBlankDone and counts hFrameCounter.
VBlank_InGame:
    push af
    push bc
    push de
    push hl
    call hOamDmaRoutine
    xor a
    ldh [rVBK], a
    ld a, [wLevelTitleTimer]
    or a
    jr z, .drawScoreAndLives

    cp $ff
    jr nz, .titleTimerRunning

    dec a
    ld [wLevelTitleTimer], a
    ld hl, $9800
    ld bc, $0014
    xor a
    call ClearRAM

    jr .flushTileWrites

.titleTimerRunning:
    dec a
    ld [wLevelTitleTimer], a
    jr nz, .titleStillShowing

    ld a, [wLangTextHud]
    ld l, a
    ld a, [wLangTextHud + 1]
    ld h, a
    call DrawString
    jr .drawScoreAndLives

.titleStillShowing:
    ld b, a
    ld a, [wLevelTitleBlink]
    and $01
    jr z, .blinkPhaseEven

    ld a, b
    and $0f
    jr nz, .drawAlternateText

    ld hl, wLevelTitleBlink
    inc [hl]

.drawAlternateText:
    ld hl, Text_LevelTitleBlank
    call DrawString
    jr .flushTileWrites

.blinkPhaseEven:
    ld a, b
    and $3f
    jr nz, .drawLevelTitle

    ld hl, wLevelTitleBlink
    inc [hl]

.drawLevelTitle:
    ld hl, wLevelTitleText
    call DrawString
    ld a, [hLevelScrollX]
    ldh [rSCX], a
    jr .flushTileWrites

.drawScoreAndLives:
    ld hl, wScoreDigits + 1
    ld de, $9806
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    ld a, [wLives]
    inc a
    ld [$9813], a

.flushTileWrites:
    ld a, [wBrickRedrawCount]
    or a
    jr z, .flushAttrWrites

    ld b, a
    ld hl, wVBlankTileWrites

.tileWriteLoop:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld [de], a
    dec b
    jr nz, .tileWriteLoop

.flushAttrWrites:
    ld a, [wVBlankAttrWriteCount]
    or a
    jr z, .finish

    ld c, a
    ld a, $01
    ldh [rVBK], a
    ld hl, wVBlankAttrWrites

.attrWriteLoop:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a

    ld a, [hl+]

    ld [de], a
    dec c
    jr nz, .attrWriteLoop

.finish:
    ld hl, wRasterTable
    ld a, l
    ld [wRasterPtr], a
    ld a, h
    ld [wRasterPtr + 1], a
    ld a, $01
    ld [hVBlankDone], a
    ld hl, hFrameCounter
    inc [hl]
    pop hl
    pop de
    pop bc
    pop af
    reti

; VBlank handler for the menu screens. Starts the OAM DMA and the HDMA transfer and resets wRasterPtr.
; Applies hMenuScrollY and, at some scroll positions, copies a tile map strip. At rest it draws the menu item
; colours, then the password letters or the start level digits and the music and sound On or Off text.
; If wHighScoresVBlankFlag is set, it jumps to VBlankMenus_BlinkRow instead.
VBlankMenus:
    push af
    push hl
    push de
    push bc
    call hOamDmaRoutine
    ld hl, wRasterTable
    ld a, l
    ld [wRasterPtr], a
    ld a, h
    ld [wRasterPtr + 1], a
    call StartHdmaTransfer
    ld a, $01
    ldh [rVBK], a
    ld a, [wHighScoresVBlankFlag]
    or a
    jp nz, VBlankMenus_BlinkRow

    ld a, [hMenuScrollY]
    ldh [rSCY], a
    cp $88
    jr z, .paintMenuColours

    or a
    jr z, .paintMenuColours

    cp $68
    jr nz, .checkScrollY60

    ld a, $02
    call ChangeROMBank
    xor a
    ld de, $9800
    ld hl, Tilemap_VBlankMenus_002_6d74
    ld b, $14
    ld c, $04
    call CopyTilemapRect
    ld a, $01
    call ChangeROMBank

.checkScrollY60:
    cp $60
    jp nz, VBlankMenus_Done

    xor a
    ldh [rVBK], a
    ld a, $02
    call ChangeROMBank
    ld a, $25
    ld de, $9800
    ld hl, Tilemap_VBlankMenus_002_6c0c
    ld b, $14
    ld c, $04
    call CopyTilemapRect
    ld a, $01
    call ChangeROMBank
    jp VBlankMenus_Done

.paintMenuColours:
    ld hl, $98c4
    ld a, [wMenuItemColours]
    ld b, $0a

.colourRow0Loop:
    ld [hl+], a
    dec b
    jr nz, .colourRow0Loop

    ld hl, $98e3
    ld a, [wMenuItemColours + 1]
    ld b, $0d

.colourRow1Loop:
    ld [hl+], a
    dec b
    jr nz, .colourRow1Loop

    ld hl, $9923
    ld a, [wMenuItemColours + 2]
    ld b, $0e

.colourRow2Loop:
    ld [hl+], a
    dec b
    jr nz, .colourRow2Loop

    ld hl, $9964
    ld a, [wMenuItemColours + 3]
    ld b, $0c

.colourRow3Loop:
    ld [hl+], a
    dec b
    jr nz, .colourRow3Loop

    ld hl, $9984
    ld a, [wMenuItemColours + 4]
    ld b, $0b

.colourRow4Loop:
    ld [hl+], a
    dec b
    jr nz, .colourRow4Loop

    ld a, [wPasswordEntryActive]
    or a
    jr z, .noPasswordEntry

    ld a, [wPasswordLetterColours]
    ld [$9968], a
    ld a, [wPasswordLetterColours + 1]
    ld [$9969], a
    ld a, [wPasswordLetterColours + 2]

    ld [$996a], a
    ld a, [wPasswordLetterColours + 3]
    ld [$996b], a
    xor a
    ldh [rVBK], a
    ld a, [wPasswordEntry]
    sub $36
    ld [$9968], a
    ld a, [wPasswordEntry + 1]
    sub $36
    ld [$9969], a
    ld a, [wPasswordEntry + 2]
    sub $36
    ld [$996a], a
    ld a, [wPasswordEntry + 3]

    sub $36
    ld [$996b], a
    jr VBlankMenus_Done

.noPasswordEntry:
    xor a
    ldh [rVBK], a
    ld a, [wLangStartLevelDigitsAddress]
    ld l, a
    ld a, [wLangStartLevelDigitsAddress + 1]
    ld h, a
    ld a, [wStartLevelText]
    sub $2f
    ld [hl+], a
    ld a, [wStartLevelText + 1]
    sub $2f
    ld [hl+], a
    ld a, [wStartLevelText + 2]
    sub $2f
    ld [hl], a
    ld de, wLangOffTiles
    ld a, [wMusicOff]
    or a
    jr nz, .drawMusicSetting

    ld de, wLangOnTiles

.drawMusicSetting:
    ld a, [wLangTable + $38]
    ld l, a
    ld a, [wLangTable + $39]
    ld h, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld de, wLangOffTiles
    ld a, [wSfxOff]
    or a
    jr nz, .drawSfxSetting

    ld de, wLangOnTiles

.drawSfxSetting:
    ld a, [wLangTable + $3a]
    ld l, a
    ld a, [wLangTable + $3b]
    ld h, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, wPasswordSlotTiles
    ld a, [hl+]
    ld [$9968], a
    ld a, [hl+]
    ld [$9969], a
    ld a, [hl+]
    ld [$996a], a
    ld a, [hl]
    ld [$996b], a

; Common exit of the menu VBlank handlers.
; Sets hVBlankDone, increments hFrameCounter, restores the registers and returns from the interrupt.
VBlankMenus_Done:
    ld a, $01
    ld [hVBlankDone], a
    ld hl, hFrameCounter
    inc [hl]
    pop bc
    pop de
    pop hl
    pop af
    reti

; High score part of the menu VBlank handler. Counts down wBlinkTimer and, when it ends,
; switches the colour of the blinking row. If wNameEntryAddress is set, it copies the name in wNameEntry
; and its colours to the tile map there. When wNameEntryDone is set it writes the final name and clears that address.
VBlankMenus_BlinkRow:
    ld a, [wBlinkTimer]
    dec a
    ld [wBlinkTimer], a
    jr nz, .drawNameEntry

    ld a, [wLangLatestBlinkWidth]
    ld b, a
    ld a, [wBlinkPhase]
    or a
    jr z, .phaseWasZero

    xor a
    ld [wBlinkPhase], a
    ld a, $28
    ld [wBlinkTimer], a
    ld a, $04
    jr .fillBlinkRow

.phaseWasZero:
    ld a, $0f
    ld [wBlinkTimer], a
    ld [wBlinkPhase], a
    ld a, $02

.fillBlinkRow:
    ld hl, $9a01

.fillBlinkRowLoop:
    ld [hl+], a
    dec b
    jr nz, .fillBlinkRowLoop

.drawNameEntry:
    ld a, [wNameEntryAddress]
    ld l, a
    ld a, [wNameEntryAddress + 1]
    ld h, a
    or l
    jr z, VBlankMenus_Done

    ld de, wNameEntry
    ld b, $07

.copyNameLoop:
    ld a, [de]
    cp $5b
    jr nz, .storeNameChar

    ld a, $20

.storeNameChar:
    inc de
    ld [hl+], a
    dec b
    jr nz, .copyNameLoop

    ld de, $ffec
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    add $07
    ld l, a
    push hl
    ld a, [wNameEntryDone]
    or a
    jr nz, .finishNameEntry

    ld de, wNameEntryColours
    ld b, $07

.copyAttrLoop:
    ld a, [de]
    inc de
    ld [hl+], a
    dec b
    jr nz, .copyAttrLoop

    pop hl
    xor a
    ldh [rVBK], a
    ld de, wNameEntry
    ld b, $07

.writeTilesLoop:
    ld a, [de]
    sub $36
    inc de
    ld [hl+], a
    dec b
    jr nz, .writeTilesLoop

    jp VBlankMenus_Done

.finishNameEntry:
    xor a
    ld [wNameEntryAddress], a
    ld [wNameEntryAddress + 1], a
    ld a, $84
    ld b, $07

.fillAttrLoop:
    ld [hl+], a
    dec b
    jr nz, .fillAttrLoop

    pop hl
    xor a
    ldh [rVBK], a
    ld de, wNameEntry
    ld b, $07

.writeFinalTilesLoop:
    ld a, [de]
    sub $36
    cp $25
    jr nz, .storeFinalTile

    xor a

.storeFinalTile:
    inc de
    ld [hl+], a
    dec b
    jr nz, .writeFinalTilesLoop

    jp VBlankMenus_Done

; VBlank handler for the credits screen. Resets wRasterPtr and starts the OAM DMA.
; Calls UpdateCreditsScroll on every second frame (wCreditsFrameToggle), then sets hVBlankDone.
VBlank_Credits:
    push af
    push hl
    push de
    push bc
    ldh a, [rSVBK]
    push af
    xor a
    ldh [rSVBK], a
    ld hl, wRasterTable
    ld a, l
    ld [wRasterPtr], a
    ld a, h
    ld [wRasterPtr + 1], a
    call hOamDmaRoutine
    ld a, [wCreditsFrameToggle]
    xor $01
    ld [wCreditsFrameToggle], a
    call z, UpdateCreditsScroll
    ld a, $01
    ld [hVBlankDone], a
    pop af
    ldh [rSVBK], a
    pop bc
    pop de
    pop hl
    pop af
    reti

; Sets up the high score screen: music, palettes, VBlank handler, graphics, tilemaps and the score table.
; Also resets the name entry fields and prepares wHdmaSource and the animation pointer for the animated title.
StateInit_HighScores:
    ld e, $06
    call PlayMusic
    ld a, $04
    ld [wLcdcFlags], a
    ld hl, VBlankMenus
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    ld a, $03
    ld [hPaletteMode], a
    xor a
    ld [hLycStart], a
    ld a, $01
    ld [hInterruptEnable], a
    ld a, $fc
    ldh [rSCX], a
    ld de, Palettes_HighScores
    call LoadPalettes
    ld hl, $9800
    call ClearTileMap
    ld a, $02
    call ChangeROMBank

    ; Load high score screen graphics
    xor a                                   ; Select VRAM Bank 0
    ldh [rVBK], a
    ld hl, HighScoresTextureData            ; Data source
    ld de, $9000                            ; Destination (VRAM)
    ld bc, $05c0                            ; Data Length
    call DataTransfer                       ; Start data transfer
    ld hl, HighScoresTextureData + $5c0
    ld de, $8000
    ld bc, $0400
    call DataTransfer
    call DrawHighScoreTable
    ld a, $0b
    call ChangeROMBank
    ld hl, Gfx_HighScores_00b_7d2c
    ld de, $8b40
    ld bc, $0090
    call DataTransfer
    ld a, [wLangGraphicsBank]
    call ChangeROMBank
    ld a, $26
    ld de, $9800
    ld hl, Tilemap_HighScores_00b_7cc0
    ld b, $12
    ld c, $03
    call CopyTilemapRect
    ld a, $01
    ld [wHdmaMode], a
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, Tilemap_HighScores_00b_7cf6
    ld b, $12
    ld c, $03
    call CopyTilemapRect
    ld a, $02
    ld [wHighScoresVBlankFlag], a
    call ChangeROMBank
    ld a, $01
    ld [wHighScoresVBlankFlag], a
    call ChangeROMBank
    call HighScores_InitSprites
    call HighScores_MoveSprites
    ld a, $81
    ld [wNameEntryColours], a
    xor a
    ld [wLevelSweepPending], a
    ld [wNameEntryDone], a
    ld [wNameEntryCursor], a
    ld a, $41
    ld [wNameEntry], a
    ld a, $5b
    ld [wNameEntry + 1], a
    ld [wNameEntry + 2], a
    ld [wNameEntry + 3], a
    ld [wNameEntry + 4], a
    ld [wNameEntry + 5], a
    ld [wNameEntry + 6], a
    ld a, $84
    ld [wNameEntryColours + 1], a
    ld [wNameEntryColours + 2], a
    ld [wNameEntryColours + 3], a
    ld [wNameEntryColours + 4], a
    ld [wNameEntryColours + 5], a
    ld [wNameEntryColours + 6], a
    ; Start address of the first animation frame, low byte then high byte.
    ; The frames are sent with HDMA, which needs source addresses that are multiples of 16.
    ASSERT LOW(HighScoreAnim_00b_4000) == 0, "the high score animation must start at an address ending in $00"
    xor a
    ld [wHdmaSource], a
    ld a, HIGH(HighScoreAnim_00b_4000)
    ld [wHdmaSource + 1], a
    ld hl, HighScoreAnimFrames_Second
    ld a, l
    ld [wHighScoreAnimPtr], a
    ld a, h
    ld [wHighScoreAnimPtr + 1], a
    xor a
    ld [wBlinkPhase], a
    ld a, $04
    ld [wBlinkTimer], a
    ret

; Called once per frame while the high score screen is shown. Advances the animation and moves the sprites.
; Counts down wMenuIdleTimer every fourth frame and leaves the screen at 0, or when a button is pressed.
; When the timer is $FF and a name is being entered, it handles name entry input instead.
HighScores_Update:
    call HighScores_AdvanceAnim
    call HighScores_MoveSprites
    ld a, [wMenuIdleTimer]
    cp $ff
    jr z, .idleTimerDisabled

    ld a, [wHighScoresIdleTick]
    inc a
    and $03
    ld [wHighScoresIdleTick], a
    jr nz, .checkButtons

    ld a, [wMenuIdleTimer]
    dec a
    ld [wMenuIdleTimer], a
    jr z, HighScores_Leave

    jr .checkButtons

.idleTimerDisabled:
    ld a, [wNameEntryAddress]
    ld l, a
    ld a, [wNameEntryAddress + 1]
    ld h, a
    or l
    jr nz, HighScores_Leave.nameEntryInput

.checkButtons:
    ld a, [hJoypad]
    and $f0
    or a
    jr z, HighScores_Leave.done

; Ends the high score screen by setting hGameState to wHighScoresNextState and wNameEntryDone to 1.
; Does nothing unless hGameState is $07. Starts hStateTimer and plays a sound.
; Also reached when the name entry cursor moves past the last letter.
HighScores_Leave:
    ld a, [hGameState]
    cp $07
    ret nz

    ld a, [wHighScoresNextState]
    ld [hGameState], a
    ld a, $01
    ld [wNameEntryDone], a
    ld a, $1e
    ld [hStateTimer], a
    ld a, $1a
    call PlaySound

.done:
    ret

.nameEntryInput:
    ld a, [hJoypad]
    ld b, a
    ld a, [wNameEntryCursor]
    or a
    jr nz, .checkCursor1

    ld hl, wNameEntry
    jr .checkPrevLetter

.checkCursor1:
    cp $01
    jr nz, .checkCursor2

    ld hl, wNameEntry + 1
    jr .checkPrevLetter

.checkCursor2:
    cp $02
    jr nz, .checkCursor3

    ld hl, wNameEntry + 2
    jr .checkPrevLetter

.checkCursor3:
    cp $03
    jr nz, .checkCursor4

    ld hl, wNameEntry + 3
    jr .checkPrevLetter

.checkCursor4:
    cp $04
    jr nz, .checkCursor5

    ld hl, wNameEntry + 4
    jr .checkPrevLetter

.checkCursor5:
    cp $05
    jr nz, .checkCursor6

    ld hl, wNameEntry + 5
    jr .checkPrevLetter

.checkCursor6:
    cp $06
    jr nz, .checkPrevLetter

    ld hl, wNameEntry + 6

.checkPrevLetter:
    bit 3, b
    jr z, .prevLetterReleased

    ld a, [wNameEntryDownHeld]
    or a
    jr nz, .checkNextLetter

    inc a
    ld [wNameEntryDownHeld], a
    ld a, $19
    call PlaySound
    push hl
    pop hl
    ld a, [hl]
    dec a
    cp $40
    jr nz, .storePrevLetter

    add $1b

.storePrevLetter:
    ld [hl], a
    jr .checkNextLetter

.prevLetterReleased:
    xor a
    ld [wNameEntryDownHeld], a

.checkNextLetter:
    bit 2, b
    jr z, .nextLetterReleased

    ld a, [wNameEntryUpHeld]
    or a
    jr nz, .checkCursorMove

    inc a
    ld [wNameEntryUpHeld], a
    ld a, $19
    call PlaySound
    push hl
    pop hl
    ld a, [hl]
    inc a
    cp $5c
    jr nz, .storeNextLetter

    sub $1b

.storeNextLetter:
    ld [hl], a
    jr .checkCursorMove

.nextLetterReleased:
    xor a
    ld [wNameEntryUpHeld], a

.checkCursorMove:
    ld a, b
    and $f3
    or a
    jp z, HighScores_ButtonsReleased

    ld a, [wNameEntryButtonHeld]
    or a
    ret nz

    ld a, $19
    call PlaySound
    ld a, $01
    ld [wNameEntryButtonHeld], a
    ld a, [wNameEntryCursor]
    bit 4, b
    jr z, .checkBit5CursorBack

    inc a

.checkBit5CursorBack:
    bit 5, b
    jr z, .checkBit7CursorForward

    or a
    jr z, .checkBit7CursorForward

    dec a

.checkBit7CursorForward:
    bit 7, b
    jr z, .checkBit6CursorBack

    inc a

.checkBit6CursorBack:
    bit 6, b
    jr z, .checkBit0CursorForward

    or a
    jr z, .checkBit0CursorForward

    dec a

.checkBit0CursorForward:
    bit 0, b
    jr z, .checkBit1CursorBack

    inc a

.checkBit1CursorBack:
    bit 1, b
    jr z, .storeCursor

    or a
    jr z, .storeCursor

    dec a

.storeCursor:
    ld [wNameEntryCursor], a
    or a
    jr nz, .checkMarkCursor1

    ld a, $81
    ld [wNameEntryColours], a
    ld a, $84
    ld [wNameEntryColours + 1], a
    ret

.checkMarkCursor1:
    cp $01
    jr nz, .checkMarkCursor2

    ld a, $81

    ld [wNameEntryColours + 1], a
    ld a, $84
    ld [wNameEntryColours], a
    ld [wNameEntryColours + 2], a
    ret

.checkMarkCursor2:
    cp $02
    jr nz, .checkMarkCursor3

    ld a, $84
    ld [wNameEntryColours + 1], a
    ld [wNameEntryColours + 3], a
    ld a, $81
    ld [wNameEntryColours + 2], a
    ret

.checkMarkCursor3:
    cp $03
    jr nz, .checkMarkCursor4

    ld a, $84
    ld [wNameEntryColours + 2], a
    ld [wNameEntryColours + 4], a
    ld a, $81
    ld [wNameEntryColours + 3], a
    ret

.checkMarkCursor4:
    cp $04
    jr nz, .checkMarkCursor5

    ld a, $84
    ld [wNameEntryColours + 3], a
    ld [wNameEntryColours + 5], a
    ld a, $81
    ld [wNameEntryColours + 4], a
    ret

.checkMarkCursor5:
    cp $05
    jr nz, .checkMarkCursor6

    ld a, $84
    ld [wNameEntryColours + 4], a
    ld [wNameEntryColours + 6], a
    ld a, $81
    ld [wNameEntryColours + 5], a
    ret

.checkMarkCursor6:
    cp $06
    jp nz, HighScores_Leave

    ld a, $84
    ld [wNameEntryColours + 5], a
    ld a, $81
    ld [wNameEntryColours + 6], a
    ret

; Called during name entry when none of the cursor buttons are held.
; Clears wNameEntryButtonHeld so the next press moves the cursor again.
HighScores_ButtonsReleased:
    xor a
    ld [wNameEntryButtonHeld], a
    ret

; Copies the default high score data from ROM bank 2 into wHighScoreTable, then switches back to ROM bank 1.
; Called once at start-up.
LoadHighScores:
    ld a, $02                               ; Load ROM Bank 2
    ld [ROM_BANK], a
    ld hl, HighScoreScreenDataHeader        ; Data Source
    ld de, wHighScoreTable                            ; Destination
    ld bc, $0010                            ; Data Length
    call DataTransfer
    ld bc, $0018                            ; Data Length
    call DataTransfer
    ld hl, HighScoreScreenData              ; Data Source
    ld bc, $0133                            ; Data Length
    call DataTransfer
    ld a, $01                               ; Switch ROM1 to Bank 1

    call ChangeROMBank
    ret

; Draws the 13 strings stored at wHighScoreTable, one after another.
; Called while setting up the high score screen.
DrawHighScoreTable:
    ld hl, wHighScoreTable
    call DrawString
    call DrawString
    call DrawString
    call DrawString
    call DrawString
    call DrawString
    call DrawString
    call DrawString
    call DrawString
    call DrawString
    call DrawString
    call DrawString
    call DrawString
    ret

; Turn the score digits into characters for the score display.
BuildScoreText:
    ld hl, wScoreDigits + 1
    ld de, wScoreText
    ld b, $05

.digitToCharLoop:
    ld a, [hl+]
    add $2f
    ld [de], a
    inc de
    dec b
    jr nz, .digitToCharLoop

    call BuildLevelTitle
    xor a
    ld [wNameEntryAddress], a
    ld [wNameEntryAddress + 1], a
    ld hl, wHighScoreTable + $2c
    ld b, $0a

.compareEntryLoop:
    push hl
    ld de, wScoreText
    ld c, $05

.compareDigitLoop:
    ld a, [de]
    cp [hl]
    jr c, .nextEntry

    jr nz, .scoreIsHigher

    inc hl
    inc de
    dec c
    jr nz, .compareDigitLoop

.nextEntry:
    pop hl
    ld de, $001c
    add hl, de
    dec b
    jr nz, .compareEntryLoop

    ret

.scoreIsHigher:
    dec b
    jr z, .insertScore

    push bc
    ld hl, wHighScoreTable + $123
    ld de, wHighScoreTable + $13f

.shiftEntryLoop:
    ld c, $1a

.shiftByteLoop:
    ld a, [hl-]
    ld [de], a
    dec de
    dec c
    jr nz, .shiftByteLoop

    dec hl
    dec hl
    dec de
    dec de
    dec b
    jr nz, .shiftEntryLoop

    pop bc

.insertScore:
    pop hl
    ld de, wScoreText
    ld c, $05

.copyScoreLoop:
    ld a, [de]
    ld [hl+], a
    inc de
    dec c
    jr nz, .copyScoreLoop

    inc hl

    inc hl
    inc hl
    inc hl
    ld a, l
    ld [wNameEntryAddress], a
    ld a, h
    ld [wNameEntryAddress + 1], a
    ld a, $41
    ld [hl+], a
    ld a, $5b
    ld a, $42
    ld [hl+], a
    ld a, $43
    ld [hl+], a
    ld a, $44
    ld [hl+], a
    ld a, $45
    ld [hl+], a
    ld a, $46
    ld [hl+], a
    ld a, $47
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    inc hl
    ld de, wLevelTitleText + 17
    ld a, [wLanguage]
    cp $04
    jr nz, .copyLevelChars

    ld de, wLevelTitleText + 18

.copyLevelChars:
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, b
    cp $09
    ret nz

    ld de, wPasswordChars
    ld hl, wLevelPasswordChars
    ld bc, $0004
    call DataTransfer
    ret

; Build the password of the level whose 3-digit number is at HL and write its 4 letters to wPasswordChars.
; Also calls CheckPassword on the result, which sets wStartLevel.
EncodeLevelPassword:
    ld a, $02
    call ChangeROMBank
    ld b, $00
    ld a, [hl+]
    sub $30
    jr z, .parseTens

    ld c, a
    ld a, b

.addHundredsLoop:
    add $64
    dec c
    jr nz, .addHundredsLoop

    ld b, a

.parseTens:
    ld a, [hl+]
    sub $30
    jr z, .parseUnits

    ld c, a
    ld a, b

.addTensLoop:
    add $0a
    dec c
    jr nz, .addTensLoop

    ld b, a

.parseUnits:
    ld a, [hl+]
    sub $30
    add b
    dec a
    ld b, a
    xor $55
    rrca
    rrca
    rrca
    ld [wPasswordByteX], a
    ld a, $fd
    sub b
    xor $aa
    rrca
    ld [wPasswordByteY], a
    ld de, wPasswordChars
    ld a, [wPasswordByteX]
    swap a
    and $0f
    ld hl, PasswordAlphabet
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [de], a
    inc de
    ld a, [wPasswordByteY]
    and $0f
    ld hl, PasswordAlphabet
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [de], a
    inc de
    ld a, [wPasswordByteX]
    and $0f
    ld hl, PasswordAlphabet
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [de], a
    inc de
    ld a, [wPasswordByteY]
    swap a
    and $0f
    ld hl, PasswordAlphabet
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [de], a
    ld de, wPasswordChars
    call CheckPassword
    ld a, $01
    call ChangeROMBank
    ret

; Decode the 4 letters at DE.
; A level password stores the 0-based level in wStartLevel and returns NZ.
; A cheat password sets its flag and returns Z. An invalid password returns Z.
CheckPassword:
    ld a, [de]

    ld hl, PasswordAlphabet
    ld c, $00
    ld b, $10

.findChar1Loop:
    cp [hl]
    jr z, .char1Found

    inc hl
    inc c
    dec b
    jr nz, .findChar1Loop

    ret

.char1Found:
    ld a, c
    swap a
    ld [wPasswordByteX], a
    inc de
    ld a, [de]
    ld hl, PasswordAlphabet
    ld c, $00
    ld b, $10

.findChar2Loop:
    cp [hl]
    jr z, .char2Found

    inc hl
    inc c
    dec b
    jr nz, .findChar2Loop

    ret

.char2Found:
    ld a, c
    ld [wPasswordByteY], a
    inc de
    ld a, [de]
    ld hl, PasswordAlphabet
    ld c, $00
    ld b, $10

.findChar3Loop:
    cp [hl]
    jr z, .char3Found

    inc hl
    inc c
    dec b
    jr nz, .findChar3Loop

    ret

.char3Found:
    ld a, [wPasswordByteX]
    or c
    ld [wPasswordByteX], a
    inc de
    ld a, [de]
    ld hl, PasswordAlphabet
    ld c, $00
    ld b, $10

.findChar4Loop:
    cp [hl]
    jr z, .char4Found

    inc hl
    inc c
    dec b
    jr nz, .findChar4Loop

    ret

.char4Found:
    swap c
    ld a, [wPasswordByteY]
    or c
    ld [wPasswordByteY], a
    ld a, [wPasswordByteX]
    rlca
    rlca
    rlca

    xor $55
    ld b, a
    ld a, [wPasswordByteY]
    rlca
    xor $aa
    add b
    cp $fd
    jr nz, .returnZero

    ld a, b
    and $03
    jr nz, .returnZero

    ld a, b
    cp $c8
    jr nz, .checkLevelSkipCheat

    ld a, $01
    ld [wCheatLivesRefill], a
    jr .returnZero

.checkLevelSkipCheat:
    cp $cc
    jr nz, .checkPhotoBgCheat

    ld a, $01
    ld [wCheatLevelSkip], a
    jr .returnZero

.checkPhotoBgCheat:
    cp $d0
    jr nz, .checkShowVersionCheat

    ld a, $01
    ld [wCheatPhotoBackground], a
    jr .returnZero

.checkShowVersionCheat:
    cp $d4

    jr nz, .checkLevelNumber

    ld a, $01
    ld [wCheatShowVersion], a
    jr .returnZero

.checkLevelNumber:
    cp $a0
    jr nc, .returnZero

    ld [wStartLevel], a
    or a
    ret

.returnZero:
    xor a
    ret

; Copies 864 bytes of animation graphics to VRAM bank 0 at $9260 with HDMA. Does nothing when wHdmaMode is 0 or 1.
; Mode 3 reads from $4000 in ROM bank $0C. Other modes read from wHdmaSource in the language graphics bank.
; Called from the VBlank handler of the menu screens.
StartHdmaTransfer:
    ld a, [wHdmaMode]
    or a
    ret z

    cp $01
    ret z

    cp $03
    jr z, .mode3FixedSource

    ld a, [wLangGraphicsBank]
    ld [ROM_BANK], a
    ld a, [wHdmaSource + 1]
    ldh [rHDMA1], a
    ld a, [wHdmaSource]
    ldh [rHDMA2], a
    jr .setDestAndStart

.mode3FixedSource:
    ld a, $0c
    ld [ROM_BANK], a
    ld a, $40
    ldh [rHDMA1], a
    xor a
    ldh [rHDMA2], a

.setDestAndStart:
    xor a
    ldh [rVBK], a
    ld a, $92
    ldh [rHDMA3], a
    ld a, $60
    ldh [rHDMA4], a
    ld a, $35
    ldh [rHDMA5], a
    ld a, $01
    ld [ROM_BANK], a
    ret

; Play song 2, 3 or 4 according to wLevelMusicIndex.
PlayLevelMusic:
    ld a, [wLevelMusicIndex]
    or a
    jr nz, .checkIndex1

    ld e, $02

.checkIndex1:
    cp $01
    jr nz, .checkIndex2

    ld e, $03

.checkIndex2:
    cp $02
    jr nz, .playSong

    ld e, $04

.playSong:
    call PlayMusic
    ret

; Game state 2: load the graphics, brick layout and power-up map of wCurrentLevel.
LoadLevel:
    call PlayLevelMusic
    ld a, $00
    ld [wLcdcFlags], a
    ld hl, VBlank_InGame
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    ld a, $01
    ld [hPaletteMode], a
    ld a, $08
    ld [hLycStart], a
    ld a, $03
    ld [hInterruptEnable], a
    ld a, $94
    ld [wRasterObjPaletteIndex], a
    ld a, [wCurrentLevel]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld de, LevelTable
    add hl, de
    ld a, $05
    call ChangeROMBank
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [wCheatPhotoBackground]
    or a
    jr z, .backgroundChosen

    ld de, Background_48ea

.backgroundChosen:
    push de
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, d
    ld l, e
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    push hl
    ld h, d
    ld l, e
    push bc
    ld a, $01
    call ChangeROMBank
    ld de, wBgPalettes
    ld bc, $0040
    call DataTransfer
    ld hl, LevelSpritePalettes
    ld de, wObjPalettes
    ld bc, $0040
    call DataTransfer
    pop hl
    ld a, [wCheatPhotoBackground]
    or a
    jr z, .brickPaletteChosen

    ld hl, BrickPalette_4830

.brickPaletteChosen:
    ld de, wBgPalettes
    ld bc, $0008
    call DataTransfer
    ld de, wBgPalettes + $10
    ld bc, $0008
    call DataTransfer
    ld de, wBgPalettes
    call LoadPalettes
    ld a, $05
    call ChangeROMBank
    pop hl
    ld a, [hl+]
    ld b, a
    swap a
    and $0f
    ld [wBlobPalette], a
    ld a, b
    and $0f
    ld [wLevelType], a
    ld a, [hl]
    ld [wUfoHeight], a
    ld a, $01
    call ChangeROMBank
    ld a, [hResumeFromPause]
    or a
    jp nz, LoadLevel_SkipTilemap

    ld hl, $9800
    call ClearTileMap
    ld a, $08
    call ChangeROMBank
    ld de, BrickLayout_Base
    ld hl, wBrickMap
    call RleFill
    pop hl
    ld a, $05
    call ChangeROMBank
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld a, $08
    call ChangeROMBank
    ld hl, wBrickMap
    call RleOverlay
    ld de, BrickLayout_Base
    ld hl, wBrickMap
    call RleOverlay
    pop hl
    ld a, $05
    call ChangeROMBank
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, $0c
    call ChangeROMBank
    ld hl, wPowerupMap

    call RleFill
    ld a, $01
    call ChangeROMBank
    xor a
    ld [wLevelPasswordReady], a
    ld a, [wLevelsSincePassword]
    inc a
    ld [wLevelsSincePassword], a
    call InitBat
    call InitBall
    call ResetEnemies
    call ResetShots
    call ClearFallingPowerups
    call ClearBrickBreakEffects
    call ClearPickupEffects
    call ClearBrickHitQueue
    call ClearUnbreakableHitEffects
    xor a
    ld [wBrickRedrawCount], a
    ld [wVBlankAttrWriteCount], a
    ld [wBatTilesDrawn], a
    ld [hLifeLostTimer], a
    jr LoadLevel_SkipTilemap.drawAttrMapUnlessResuming

; Second half of level loading. HL = level data pointer, taken from the stack.
; Draws the attribute map unless hResumeFromPause is set, then loads the level graphics into VRAM.
; On a fresh start it also draws the borders, title and bricks, and copies the screen to wLevelTilemapCopy.
LoadLevel_SkipTilemap:
    pop hl

.drawAttrMapUnlessResuming:
    ld a, [hResumeFromPause]
    or a
    jr nz, .loadLevelGraphics

    ld a, $01
    ld [wLevelSweepPending], a
    ldh [rVBK], a
    ld a, $03
    call ChangeROMBank
    ld hl, Tilemap_Level_003_4000
    ld a, $00
    ld de, $9841
    ld b, $12
    ld c, $10
    call CopyTilemapRect
    ld a, $01
    call ChangeROMBank
    ld hl, $9840
    ld b, $01
    ld c, $0f
    ld d, $21
    call FillTilemapRect
    ld hl, $9853
    ld c, $0f
    ld d, $01
    call FillTilemapRect
    ld hl, $9a20
    ld c, $01
    ld d, $a1
    call FillTilemapRect
    ld hl, $9a33
    ld c, $01
    ld d, $81
    call FillTilemapRect
    ld hl, $9820
    ld c, b
    ld b, $14
    call FillTilemapRect

.loadLevelGraphics:
    xor a
    ldh [rVBK], a
    ld a, $02
    call ChangeROMBank
    ld hl, Gfx_Level_002_4b2c
    ld de, $8000
    ld bc, $07f0
    call DataTransfer
    ld hl, Gfx_Level_002_5dec
    ld de, $9000
    ld bc, $0250
    call DataTransfer
    ld hl, Gfx_Level_002_594c
    ld de, $9250
    ld bc, $04a0
    call DataTransfer
    ld a, $0b
    call ChangeROMBank
    ld hl, Gfx_HighScores_00b_7d2c
    ld de, $96f0
    ld bc, $0110
    call DataTransfer
    ld a, $01
    call ChangeROMBank
    pop hl
    ld a, $05
    call ChangeROMBank
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    call ChangeROMBank
    push hl
    ld h, d
    ld l, e
    ld a, $01
    ldh [rVBK], a
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld de, $8800
    ld bc, $0800
    call DataTransfer
    ld a, $02
    call ChangeROMBank
    ld hl, Gfx_Level_002_531c
    ld de, $8000
    ld bc, $0630
    call DataTransfer
    xor a
    ldh [rVBK], a
    ld a, $01
    call ChangeROMBank
    ld a, [hResumeFromPause]
    or a
    jp nz, LoadLevel_ResumeDone

    ld a, $25
    ld de, $9840
    ld hl, Tilemap_Level_001_748b
    ld b, $01
    ld c, $10
    call CopyTilemapRect
    ld a, $25
    ld de, $9853
    ld hl, Tilemap_Level_001_748b
    ld b, $01
    ld c, $10
    call CopyTilemapRect
    ld a, $25
    ld de, $9820
    ld hl, Tilemap_Level_001_7477
    ld b, $14
    ld c, $01
    call CopyTilemapRect
    pop hl
    ld a, $05
    call ChangeROMBank
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    call ChangeROMBank
    ld h, d
    ld l, e
    ld a, $00
    ld de, $9841
    ld b, $12
    ld c, $10
    push hl
    call CopyTilemapRect
    pop hl
    ld a, $00
    ld de, wBackgroundTilemap + $41

    ld b, $12
    ld c, $10
    call CopyTilemapRect
    ld a, $01
    call ChangeROMBank
    ld hl, $9800
    ld bc, $0014
    xor a
    call ClearRAM
    call BuildLevelTitle
    ld hl, wLevelTitleText
    call DrawString
    xor a
    ld [wLevelTitleBlink], a
    dec a
    ld [wLevelTitleTimer], a
    ld a, $04
    ld [hLevelScrollX], a
    call SetUpBricks
    xor a
    ldh [rVBK], a
    ld hl, $9800
    ld de, wLevelTilemapCopy
    ld bc, $0400
    call DataTransfer
    call InitBatSprites
    ret

; Ends level loading when the game is resuming from pause.
; Drops the saved level data pointer and clears hResumeFromPause. The level title and bricks are not redrawn.
LoadLevel_ResumeDone:
    pop hl
    xor a
    ld [hResumeFromPause], a
    ret

; Unpack (count, value) pairs from DE to HL until a count of 0.
RleFill:
    ld a, [de]
    or a
    ret z

    ld b, a
    inc de
    ld a, [de]
    inc de

.fillRunLoop:
    ld [hl+], a
    dec b
    jr nz, .fillRunLoop

    jr RleFill

; Like RleFill, but a value of 0 skips count bytes instead of writing them.
RleOverlay:
    ld a, [de]
    or a
    ret z

    ld b, a
    inc de
    ld a, [de]
    inc de
    or a
    jr z, .skipRunLoop

.writeRunLoop:
    ld [hl+], a
    dec b
    jr nz, .writeRunLoop

    jr RleOverlay

.skipRunLoop:
    inc hl
    dec b
    jr nz, .skipRunLoop

    jr RleOverlay

; Copy the "LEVEL nnn" string of the current language and write the level number into it.
BuildLevelTitle:
    ld a, [wLangTextLevelTitle]
    ld l, a
    ld a, [wLangTextLevelTitle + 1]
    ld h, a
    ld de, wLevelTitleText
    ld bc, $001b
    call DataTransfer
    ld a, [wCurrentLevel]
    inc a
    ld c, $00

.hundredsLoop:
    ld b, a
    sub $64
    jr nc, .countHundred

    ld a, c
    or a
    jr z, .startTens

    add $30
    ld d, a
    ld a, [wLanguage]
    cp $04
    jr nz, .hundredsDefaultPos

    ld a, d
    ld [wLevelTitleText + 18], a
    jr .hundredsWritten

.hundredsDefaultPos:
    ld a, d
    ld [wLevelTitleText + 17], a

.hundredsWritten:
    ld a, b
    or a
    ret z

.startTens:
    ld a, b
    ld c, $00

.tensLoop:
    ld b, a
    sub $0a
    jr nc, .countTen

    ld a, c
    or a
    jr z, .writeUnits

    add $30
    ld d, a
    ld a, [wLanguage]
    cp $04
    jr nz, .tensDefaultPos

    ld a, d
    ld [wLevelTitleText + 19], a
    jr .tensWritten

.tensDefaultPos:
    ld a, d
    ld [wLevelTitleText + 18], a

.tensWritten:
    ld a, b
    or a
    ret z

.writeUnits:
    ld a, b
    add $30
    ld d, a
    ld a, [wLanguage]
    cp $04
    jr nz, .unitsDefaultPos

    ld a, d
    ld [wLevelTitleText + 20], a
    jr .done

.unitsDefaultPos:
    ld a, d
    ld [wLevelTitleText + 19], a

.done:
    ret

.countTen:
    inc c
    jr .tensLoop

.countHundred:
    inc c
    jr .hundredsLoop

; Draw the string at HL: a 2-byte tile map address, then characters up to $ff.
DrawString:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    jr .nextChar

.writeTile:
    ld [de], a
    ld a, $01
    ldh [rVBK], a
    ld a, b
    ld [de], a
    inc de
    xor a
    ldh [rVBK], a

.nextChar:
    ld a, [hl+]
    cp $ff
    ret z

    or a
    jr nz, .notAttribute

    ld a, [hl+]
    ld b, a
    jr .nextChar

.notAttribute:
    cp $20
    jr nz, .notSpace

    xor a
    jr .writeTile

.notSpace:
    cp $41
    jr c, .digitChar

    sub $36
    jr .writeTile

.digitChar:
    sub $2f
    jr .writeTile

    ret

; Like DrawString, but a zero character leaves the tile as it is.
DrawStringSkipZero:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    jr .nextChar

.writeTileIfNonzero:
    or a
    jr z, .advance

    ld [de], a
    ld a, $01
    ldh [rVBK], a
    ld a, b
    ld [de], a

.advance:
    inc de
    xor a
    ldh [rVBK], a

.nextChar:
    ld a, [hl+]
    cp $ff
    ret z

    or a
    jr nz, .notAttribute

    ld a, [hl+]
    ld b, a
    jr .nextChar

.notAttribute:
    cp $20
    jr nz, .notSpace

    xor a
    jr .writeTileIfNonzero

.notSpace:
    cp $41
    jr c, .digitChar

    sub $36
    jr .writeTileIfNonzero

.digitChar:
    sub $2f
    jr .writeTileIfNonzero

    ret

; Centre the bat, reset its width and make the ball stick to it.
InitBat:
    ld a, $50
    ld [wBatX], a
    ld hl, BatSpeedTable
    ld a, l
    ld [wBatSpeedPtr], a
    ld a, h
    ld [wBatSpeedPtr + 1], a
    xor a
    ld [wBatMovingRight], a
    ld [wBatMovingLeft], a
    ld [wStunWobble], a
    ld [wStunActive], a
    ld [wReverseActive], a
    ld [wBatExplosionTimer], a
    ld a, $01
    ld [wBallSticks], a
    ld a, $20
    ld [wBatWidth], a
    ret

; Sets up a single ball resting on the middle of the bat.
; Sets wBallCount to 1, places the ball from wBatX and wBatWidth, and sets wBallOnBat.
; Clears the ball effect flags such as wMultiBallPending, wSleepyBallActive and wAntigravityActive.
InitBall:
    ld a, $01
    ld [wBallCount], a
    ld a, $89
    ld [wBalls + 1], a
    ld a, [wBatWidth]
    srl a
    ld b, a
    ld a, [wBatX]
    sub $0c
    add b
    ld [wBalls + 3], a
    ld a, $10
    ld [wBalls + 4], a
    ld a, $83
    ld [wBalls + 5], a
    xor a
    ld [wBalls], a
    ld [wBalls + 2], a
    ld [wBalls + 6], a
    xor a
    ld [wMultiBallPending], a
    ld [wSleepyBallActive], a
    ld [wLaunchDirection], a
    ld [wAntigravityActive], a
    ld [wSlowBallActive], a
    ld [wBallLoopCount], a
    ld [wNinjaActive], a
    ld [wRemoveBall], a
    inc a
    ld [wBallOnBat], a

    ret

; Per-frame gameplay update. Starts with the level skip cheat (B button).
Gameplay_Update:
    ld a, [wCheatLevelSkip]
    or a
    jr z, Gameplay_UpdateStun

    ld a, [hJoypad]
    bit 5, a
    jr z, Gameplay_UpdateStun

    ld a, [hStateTimer]
    or a
    jr nz, Gameplay_UpdateStun

    ld a, [hLifeLostTimer]
    or a
    jr nz, Gameplay_UpdateStun

    ld b, $02
    ld a, [wLevelsSincePassword]
    cp $04
    jr nz, .setNextState

    call NextLevelMusic
    ld a, [wEndingSeen]
    or a
    jr nz, .setNextState

    ld b, $09

.setNextState:
    ld a, b
    ld [hGameState], a
    ld a, $0f
    ld [hStateTimer], a
    ld a, [wCurrentLevel]
    inc a
    cp $a0
    jr c, .storeLevel

    ld a, $0d
    ld [hGameState], a
    xor a

.storeLevel:
    ld [wCurrentLevel], a

; Stun (Poison): shake the bat until wBatEffectTimer runs out.
Gameplay_UpdateStun:
    ld a, [wStunActive]
    or a
    jr z, Gameplay_MoveBat

    ld a, [wBatEffectTimer]
    and $07
    jr nz, .skipSound

    ld a, $0f
    call PlaySound

.skipSound:
    xor a
    ld [wStunWobbleNow], a
    ld a, [wBatEffectTick]
    inc a
    ld [wBatEffectTick], a
    and $03
    jr nz, Gameplay_MoveBat

    ld a, [wStunWobble]
    cp $fd
    jr nz, .wobbleNotMinus3

    ld a, $03
    jr .storeWobble

.wobbleNotMinus3:
    cp $03
    jr nz, .storeWobble

    ld a, $fd

.storeWobble:
    ld [wStunWobble], a
    ld [wStunWobbleNow], a
    ld a, [wBatEffectTimer]
    dec a
    ld [wBatEffectTimer], a
    jr nz, Gameplay_MoveBat

    ld [wStunActive], a
    ld [wStunWobble], a

; Move the bat. Left and right are swapped while Reverse is active.
; The speed comes from BatSpeedTable, so the bat accelerates while a direction is held.
Gameplay_MoveBat:
    xor a
    ld [wBatDeltaX], a
    ld a, [wBatSpeedPtr]
    ld l, a
    ld a, [wBatSpeedPtr + 1]
    ld h, a
    ld a, [hJoypad]
    ld c, a
    ld a, [wReverseActive]
    or a
    jr z, .resolveDirection

    ld a, c
    and $02
    sra a
    ld b, a
    ld a, c
    and $01
    sla a
    ld d, a
    ld a, c
    and $fc
    or b
    or d
    ld c, a
    ld [hJoypad], a
    ld a, [wBatEffectTick]
    inc a
    ld [wBatEffectTick], a
    and $03
    jr nz, .resolveDirection

    ld a, [wBatEffectTimer]
    dec a
    ld [wBatEffectTimer], a
    or a
    jr nz, .resolveDirection

    ld [wReverseActive], a

.resolveDirection:
    ld a, [hLastDirection]
    ld b, a
    ld a, c
    and $03
    cp $03
    jr nz, .rememberDirection

    xor b
    jr .checkRightPressed

.rememberDirection:
    ld [hLastDirection], a

.checkRightPressed:
    bit 0, a
    jr z, Gameplay_MoveBat_Right.checkLeftPressed

    ld a, [wBatMovingLeft]
    or a
    jp nz, Gameplay_MoveBat_Left

; Moves the bat one step to the right. HL = pointer into the bat speed table, moved to the next faster entry.
; Sets wBatMovingRight, saves HL in wBatSpeedPtr and adds the speed and wStunWobble to wBatX.
; Stops at the right edge of the playfield and stores the move in wBatDeltaX.
Gameplay_MoveBat_Right:
    inc hl
    ld a, [hl]
    or a

    jr nz, .haveRightSpeed

    dec hl
    ld a, [hl]

.haveRightSpeed:
    ld b, a
    ld a, $ff
    ld [wBatMovingRight], a

.applyRightMove:
    ld a, l
    ld [wBatSpeedPtr], a
    ld a, h
    ld [wBatSpeedPtr + 1], a
    ld a, [wStunWobble]
    add b
    ld b, a
    ld a, [wBatWidth]
    ld d, a
    ld a, [wBatX]
    add d
    add b
    cp $aa
    jr c, .rightEdgeOk

    sub $aa
    sub b
    cpl
    ld b, a

.rightEdgeOk:
    ld a, [wBatX]
    add b
    ld [wBatX], a
    ld a, b
    cpl
    inc a
    ld [wBatDeltaX], a
    jr Gameplay_AntigravitySteering

.checkLeftPressed:
    bit 1, a
    jr z, .noDirectionPressed

    ld a, [wBatMovingRight]
    or a
    jr nz, .slowDownRight

.accelerateLeft:
    inc hl
    ld a, [hl]
    or a
    jr nz, .haveLeftSpeed

    dec hl
    ld a, [hl]

.haveLeftSpeed:
    ld b, a
    ld a, $01
    ld [wBatMovingLeft], a

.applyLeftMove:
    ld a, l
    ld [wBatSpeedPtr], a
    ld a, h
    ld [wBatSpeedPtr + 1], a
    ld a, [wStunWobble]
    add b
    ld b, a
    ld a, [wBatX]
    sub b
    cp $17
    jr nc, .leftEdgeOk

    sub $17
    cpl
    sub b
    cpl
    ld b, a

.leftEdgeOk:
    ld a, [wBatX]
    sub b
    ld [wBatX], a
    ld a, b

    ld [wBatDeltaX], a
    jr Gameplay_AntigravitySteering

.noDirectionPressed:
    ld a, [wBatMovingRight]
    or a
    jr z, .checkMovingLeft

.slowDownRight:
    dec hl
    ld b, [hl]
    ld a, b
    or a
    jr nz, .applyRightMove

    ld [wBatMovingRight], a
    ld a, [hJoypad]
    bit 1, a
    jr nz, .accelerateLeft

    jr Gameplay_MoveBat_Left.applyStunWobble

.checkMovingLeft:
    ld a, [wBatMovingLeft]
    or a
    jr z, Gameplay_MoveBat_Left.applyStunWobble

; Slows the bat down while it is still moving left and left is not held.
; HL = pointer into the bat speed table, moved to the previous slower entry. A nonzero speed still moves the bat left.
; At zero it clears wBatMovingLeft, then moves right if right is held, otherwise it applies the stun wobble.
Gameplay_MoveBat_Left:
    dec hl
    ld b, [hl]
    ld a, b
    or a
    jr nz, Gameplay_MoveBat_Right.applyLeftMove

    ld [wBatMovingLeft], a
    ld a, [hJoypad]
    bit 0, a
    jp nz, Gameplay_MoveBat_Right

.applyStunWobble:
    ld a, [wStunActive]
    or a
    jr z, Gameplay_AntigravitySteering

    ld a, [wStunWobbleNow]
    ld b, a
    ld a, [wBatX]
    add b
    ld [wBatX], a

; Antigravity (Pepper): left and right steer every ball until wBallEffectTimer runs out.
Gameplay_AntigravitySteering:
    ld a, [wAntigravityCancel]
    or a
    jr nz, .endAntigravity

    ld a, [wAntigravityActive]
    or a
    jr z, Gameplay_LaunchBall

    ld a, [wBallEffectTimer]
    dec a
    ld [wBallEffectTimer], a
    jr z, .endAntigravity

    ld a, [wBallCount]
    or a
    jr z, Gameplay_LaunchBall

    ld c, a
    ld b, $00
    ld a, [hJoypad]
    bit 0, a
    jr z, .checkLeftHeld

    ld b, $04

.checkLeftHeld:
    bit 1, a
    jr z, .setBallDirections

    ld b, $1c

.setBallDirections:
    ld hl, wBalls + 4
    ld de, $0007

.steerBallLoop:
    ld [hl], b
    add hl, de
    dec c
    jr nz, .steerBallLoop

    jr Gameplay_LaunchBall

.endAntigravity:
    xor a
    ld [wAntigravityCancel], a
    ld [wAntigravityActive], a
    ld a, [wBallCount]
    or a
    jr z, Gameplay_LaunchBall

    ld b, a
    ld de, $0006
    ld a, $02
    ld hl, wBalls + 4

.resetBallLoop:
    ld [hl+], a
    inc a
    res 7, [hl]
    add hl, de
    dec b
    jr nz, .resetBallLoop

    ld a, $17
    call PlaySound

; Launch the ball from the bat with A, or split it when Multi ball was picked up.
Gameplay_LaunchBall:
    ld a, [wMultiBallPending]
    or a
    jr nz, .chooseLaunchDirection

    ld a, [wBallSticks]
    or a
    jr z, Gameplay_UpdateBalls

    ld a, [wSleepyBallActive]
    or a
    jr nz, Gameplay_UpdateBalls

    ld a, [hJoypad]
    bit 4, a
    jr z, Gameplay_UpdateBalls

.chooseLaunchDirection:
    ld a, [wBallOnBat]
    or a
    jr z, .ballNotOnBat

    ld a, [wBatWidth]
    srl a
    ld b, a
    ld a, [wBatX]
    sub $08
    add b
    ld c, $01
    cp $58
    jr c, .sideChosen

    ld c, $1f

.sideChosen:
    ld a, c
    jr .storeLaunchDirection

.ballNotOnBat:
    ld a, $04

.storeLaunchDirection:
    ld [wLaunchDirection], a

; Update every ball in wBalls. A ball below the screen is removed.
; Losing the last ball costs a life.
Gameplay_UpdateBalls:
    call UpdateBatExplosion
    ld a, [wBallCount]
    or a
    jp z, Gameplay_AfterBalls

    ld [wBallLoopCount], a
    ld b, a
    ld hl, wBalls
    ld de, wRemovedBallPtrs
    xor a
    ld [hTemp2], a

; Loop body that updates one ball per pass, with B = balls left to process and HL = ball in wBalls.
; Copies the ball into the wBallWork variables and calls UpdateBall.
; A ball flagged by wRemoveBall or below the screen is dropped, and losing the last ball costs a life.
Gameplay_BallLoop:
    push bc
    push hl
    push de
    ld a, [hl+]
    ld [wBallWorkYSub], a
    ld a, [hl+]
    ld [wBallWorkY], a
    ld a, [hl+]
    ld [wBallWorkXSub], a
    ld a, [hl+]
    ld [wBallWorkX], a
    ld a, [hl+]
    ld [wBallWorkDirection], a
    ld a, [hl+]
    ld [wBallWorkSpeed], a
    ld a, [hl+]
    ld [wBallWorkFlags], a
    call UpdateBall
    pop de
    pop hl
    ld a, [wRemoveBall]
    or a
    jr nz, .removeFlaggedBall

    ld a, [wBallWorkY]
    ld b, a
    cp $a0
    jp c, Gameplay_StoreBall

    pop bc
    ld a, [wBallCount]
    cp $01
    jr nz, .decrementBallCount

    dec a
    ld [wBallCount], a
    ld c, a
    ld a, [wBlobThrowCount]
    or a
    jr z, .lastBallLost

    ld a, c
    or a
    jp z, Gameplay_AfterBalls

.lastBallLost:
    ld a, [wBatExplosionTimer]
    or a
    jp nz, Gameplay_AfterBalls

    ld a, [hStateTimer]
    or a
    jp nz, Gameplay_AfterBalls

    ld a, $28
    ld [wBatExplosionTimer], a
    ld a, [wBatY]
    sub $08
    ld [wBatExplosionY], a
    ld b, $f8
    ld a, [wBatWidth]
    cp $20
    jr z, .explosionOffsetSet

    ld b, $fc

.explosionOffsetSet:
    ld a, [wBatX]
    add b
    ld [wBatExplosionX], a
    xor a

    ld [wWeaponFlag], a
    ld a, $0a
    call PlaySound
    ld a, [wLives]
    dec a
    ld [wLives], a
    or a
    jr nz, .livesRemain

    ld a, $03
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    jp Gameplay_AfterBalls

.livesRemain:
    ld a, $01
    ld [hLifeLostTimer], a
    jp Gameplay_AfterBalls

.removeFlaggedBall:
    pop bc
    xor a
    ld [wRemoveBall], a
    ld a, [wBallCount]

.decrementBallCount:
    dec a
    ld [wBallCount], a
    ld a, b
    cp $01
    jr z, Gameplay_StoreBall.nextBall

    ld a, l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, l
    add $06
    ld l, a
    jr nc, .markSlotRemoved

    inc h

.markSlotRemoved:
    ld a, $ff
    ld [hl+], a
    ld a, [hTemp2]
    inc a
    ld [hTemp2], a
    jr Gameplay_StoreBall.nextBall

; Writes the updated ball from the wBallWork variables back into wBalls.
; Then moves on to the next ball. After the last ball, it moves balls into the slots of removed balls.
Gameplay_StoreBall:
    ld a, [wBallWorkYSub]
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [wBallWorkXSub]
    ld [hl+], a
    ld a, [wBallWorkX]
    ld [hl+], a
    ld a, [wBallWorkDirection]
    ld [hl+], a
    ld a, [wBallWorkSpeed]
    ld [hl+], a
    ld a, [wBallWorkFlags]
    ld [hl+], a
    pop bc

.nextBall:
    dec b
    jp nz, Gameplay_BallLoop

    ld a, [wBallLoopCount]
    or a
    jr nz, .compactBalls

    ld de, $000e
    add hl, de

.compactBalls:
    ld a, [hTemp2]
    or a
    jr z, Gameplay_AfterBalls

    ld de, wRemovedBallPtrs
    ld b, a
    dec hl

.fillHoleLoop:
    push bc

.skipRemovedBall:
    ld a, [hl]
    cp $ff
    jr nz, .copyBallToHole

    ld bc, $fff9
    add hl, bc
    jr .skipRemovedBall

.copyBallToHole:
    ld bc, $fffa
    add hl, bc
    ld a, [de]
    inc de
    ld c, a
    ld a, [de]
    inc de
    ld b, a
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    ld bc, $fff8
    add hl, bc
    pop bc
    dec b
    jr nz, .fillHoleLoop

; Update power-ups, enemies, shots and the brick queue, restart after a lost life, and check for pause.
Gameplay_AfterBalls:
    xor a
    ld [wLaunchDirection], a
    ld a, [wBallOnBat]
    or a
    jr z, .updateObjects

    ld a, [hJoypad]
    bit 4, a
    jr z, .updateObjects

    xor a
    ld [wBallSticks], a
    ld [wBallOnBat], a
    ld a, $07
    call PlaySound

.updateObjects:
    call UpdateFallingPowerups
    call UpdateEnemies
    call UpdateShots
    call UpdatePickupEffects
    call UpdateBrickBreakEffects
    call UpdateUnbreakableHitEffects
    call DrawBatSprites
    xor a
    ld [wVBlankAttrWriteCount], a
    ld [wBrickRedrawCount], a
    call UpdateBatTiles
    call ProcessBrickHitQueue
    call FlushBrickRedraw
    ld a, [hLifeLostTimer]
    or a
    jr z, Gameplay_CheckPause

    inc a
    ld [hLifeLostTimer], a
    cp $28
    ret nz

    xor a
    ld [hLifeLostTimer], a
    ld e, $00
    call StartSong
    xor a
    call PlaySound
    call UpdateSound
    call UpdateSound
    call RestartAfterLifeLost

; Runs at the end of each gameplay frame.
; If Start is pressed and hStateTimer is 0, it switches hGameState to the pause state.
; It sets hResumeFromPause, plays the pause sound and waits about 30 frames.
Gameplay_CheckPause:
    ld a, [hJoypad]
    bit 7, a
    ret z

    ld a, [hStateTimer]
    or a
    ret nz

    ld a, $04
    ld [hGameState], a
    ld a, $01
    ld [hStateTimer], a
    ld [hResumeFromPause], a
    ld a, $1a
    call PlaySound
    ld a, $1e

.pauseDelayLoop:
    push af
    call WaitVBlank
    call UpdateSound
    pop af
    dec a
    jr nz, .pauseDelayLoop

    ret

; Called when the life lost timer expires, so the player can try again.
; Does nothing while hStateTimer is nonzero. Otherwise it fades out, resets bat, ball, enemies,
; shots and effects, redraws the bricks and bat, then fades in and restarts the level music.
RestartAfterLifeLost:
    ld a, [hStateTimer]
    or a
    ret nz

    ld b, $01
    xor a
    ld [wOamUsed], a
    ld [hJoypad], a
    call FadePalettes
    call InitBatSprites
    call InitBat
    call InitBall
    xor a
    ld [wVBlankAttrWriteCount], a
    ld [wBrickRedrawCount], a
    inc a
    ld [wLevelTitleTimer], a
    call MarkBrickHitQueue
    call UpdateBatTiles
    call ProcessBrickHitQueue
    call FlushBrickRedraw
    call ResetShots
    call ResetEnemies
    call ClearFallingPowerups
    call ClearBrickBreakEffects
    call ClearPickupEffects
    call ClearUnbreakableHitEffects
    xor a
    ld [wOamUsed], a
    ld de, wExtraSprites
    ld a, e
    ld [wOamWritePtr], a
    ld a, d
    ld [wOamWritePtr + 1], a
    ld a, $27
    ld [wOamUsedLastFrame], a
    call DrawBatSprites
    ld b, $ff
    ld a, $20
    call FadePalettes
    call PlayLevelMusic
    ret

; Update the ball in wBallWork: sleeping, sticking to the bat, launching, splitting and moving.
UpdateBall:
    ld a, [wSleepyBallActive]
    or a
    jr z, .checkSticking

    ld a, [wBallEffectTimer]
    cp $18
    jr nz, .effectTimerNot18

    ld a, $16
    call PlaySound
    jr .checkSticking

.effectTimerNot18:
    jr c, .checkSticking

    ld a, [wBallEffectTick]
    and $1f
    ld d, $00
    cp $10
    jr c, .gotSleepFrame

    ld d, $02

.gotSleepFrame:
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld a, [wBallWorkY]
    sub $08
    cp $1e
    jr nc, .spriteYSet

    add $0e

.spriteYSet:
    ld b, a
    ld [hl+], a
    ld a, [wBallWorkX]
    add $04
    cp $90
    jr c, .spriteXClamped

    ld a, $90

.spriteXClamped:
    ld c, a
    ld [hl+], a
    ld a, $4a
    add d
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, c
    add $08
    ld [hl+], a
    ld a, $4b
    add d
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    add $02
    ld [wOamUsed], a

.checkSticking:
    ld a, [wBatExplosionTimer]
    or a
    jp nz, UpdateBall_Move

    ld a, [wBallSticks]
    or a
    jp z, UpdateBall_Split

    ld a, [wBallWorkSpeed]
    bit 7, a
    jr nz, .ballOnBat

    ld a, [wBallWorkX]
    add $04
    ld c, a
    ld a, [wBallWorkY]
    add $08
    ld b, a
    ld a, [wBatY]
    sub $08
    cp b
    jr nc, UpdateBall_Split

    add $04
    cp b
    jr c, UpdateBall_Split

    ld a, [wBatX]
    cp c
    jr nc, UpdateBall_Split

    add $0f
    cp c
    jr c, UpdateBall_Split

    ld a, $06
    call PlaySound

.ballOnBat:
    ld a, [wLaunchDirection]
    or a
    jr z, .noLaunch

    cp $04
    jr nz, .launchInDirection

    ld a, [wBatX]
    sub $08
    ld b, a
    ld a, [wBallWorkX]
    add $04
    sub b
    call BatBounceLookup
    ld a, [hl]
    ld b, a
    ld a, [wBallWorkSpeed]
    and $70
    or b
    ld [wBallWorkSpeed], a
    jr UpdateBall_Split

.launchInDirection:
    ld [wBallWorkDirection], a
    ld a, [wBallWorkSpeed]
    res 7, a
    ld [wBallWorkSpeed], a
    jr UpdateBall_Split

.noLaunch:
    ld a, [wBallWorkDirection]
    cp $17
    jr nc, UpdateBall_Split

    cp $09
    jr c, UpdateBall_Split

    ld a, [wBatDeltaX]
    ld b, a
    ld a, [wBallWorkX]
    sub b
    ld [wBallWorkX], a
    ld a, [wBallWorkSpeed]
    set 7, a
    ld [wBallWorkSpeed], a
    ret

; Multi ball: add two balls at the same position, one direction step to each side.
UpdateBall_Split:
    ld a, [wMultiBallPending]
    or a
    jr z, UpdateBall_Move

    xor a
    ld [wMultiBallPending], a
    ld a, [wBallLoopCount]
    ld b, a
    ld hl, wBalls
    ld de, $0007

.seekNewBallSlot:
    add hl, de
    dec a
    jr nz, .seekNewBallSlot

    ld [wBallLoopCount], a
    ld a, b
    add $02
    ld [wBallCount], a
    ld a, [wBallWorkDirection]
    ld c, a
    ld a, [wBallWorkYSub]
    ld [hl+], a
    ld a, [wBallWorkY]
    ld [hl+], a
    ld a, [wBallWorkXSub]
    ld [hl+], a
    ld a, [wBallWorkX]
    ld [hl+], a
    ld a, c
    dec a
    and $1f
    or a
    jr nz, .decDirTest10

    dec a
    and $1f

.decDirTest10:
    cp $10
    jr nz, .storeDecDir

    dec a
    and $1f

.storeDecDir:
    ld [hl+], a
    ld a, [wBallWorkSpeed]
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [wBallWorkYSub]
    ld [hl+], a
    ld a, [wBallWorkY]
    ld [hl+], a
    ld a, [wBallWorkXSub]
    ld [hl+], a
    ld a, [wBallWorkX]
    ld [hl+], a
    ld a, c
    inc a
    and $1f
    or a
    jr nz, .incDirTest10

    inc a
    and $1f

.incDirTest10:
    cp $10
    jr nz, .storeIncDir

    inc a
    and $1f

.storeIncDir:
    ld [hl+], a
    ld a, [wBallWorkSpeed]
    ld [hl+], a
    xor a
    ld [hl+], a
    ret

; Move the ball by its entry in BallVelocityTable and test for collisions.
; When the low nibble of the speed is n > 0, a second step of 1/2^n of the velocity follows, unless the first step bounced.
UpdateBall_Move:
    ld a, [wSleepyBallActive]
    or a
    ret nz

    ld a, [wBallWorkFlags]
    bit 7, a
    jr z, .lookupVelocity

    res 7, a
    or a
    set 7, a
    ld [wBallWorkFlags], a
    jr nz, .lookupVelocity

    xor a
    ld [wBallWorkFlags], a
    ld a, [wBallWorkDirection]
    inc a
    and $1f
    ld [wBallWorkDirection], a
    and $07
    jr nz, .lookupVelocity

    ld a, [wBallWorkDirection]
    inc a
    ld [wBallWorkDirection], a

.lookupVelocity:
    ld a, [wBallWorkDirection]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    ld de, BallVelocityTable
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    xor a
    ld [wBallSecondStep], a
    ld [wBallBounced], a
    ld a, [wBallWorkXSub]
    ld [wBallOldXSub], a
    ld l, a
    ld a, [wBallWorkX]
    ld [wBallOldX], a
    ld h, a
    add hl, bc
    ld a, [wBallWorkSpeed]
    and $0f
    or a
    jr z, .storeNewX

.shiftXVelocityLoop:
    sra b
    rr c
    dec a
    jr nz, .shiftXVelocityLoop

    push bc

.storeNewX:
    ld a, l
    ld [wBallWorkXSub], a
    ld a, h
    ld [wBallWorkX], a
    ld a, [wBallWorkYSub]
    ld [wBallOldYSub], a
    ld l, a
    ld a, [wBallWorkY]
    ld [wBallOldY], a
    ld h, a
    add hl, de
    ld a, [wBallWorkSpeed]
    and $0f
    or a
    jr z, .storeNewY

.shiftYVelocityLoop:
    sra d
    rr e
    dec a
    jr nz, .shiftYVelocityLoop

    push de
    ld a, $01
    ld [wBallSecondStep], a

.storeNewY:
    ld a, l
    ld [wBallWorkYSub], a
    ld a, h
    ld [wBallWorkY], a
    xor a
    ld [wUnbreakableHitSpawned], a
    call CollideBall
    ld a, [wBallSecondStep]
    or a
    ret z

    ld a, [wBallBounced]
    or a
    jr z, .doSecondStep

    add sp, $04
    ret

.doSecondStep:
    pop de
    ld a, [wBallWorkYSub]
    ld l, a
    ld a, [wBallWorkY]
    ld h, a
    add hl, de
    ld a, l
    ld [wBallWorkYSub], a
    ld a, h
    ld [wBallWorkY], a
    pop bc
    ld a, [wBallWorkXSub]
    ld l, a
    ld a, [wBallWorkX]
    ld h, a
    add hl, bc
    ld a, l
    ld [wBallWorkXSub], a
    ld a, h
    ld [wBallWorkX], a
    call CollideBall
    ret

; Test the ball (8 x 8 pixels) against the bat and the bricks.
; First the middle of each side: left, right, bottom, top. Then the four corners,
; where the pixel offsets inside the brick decide between a horizontal and a vertical bounce.
; While Antigravity is active only the two top corners are tested.
CollideBall:
    ld a, [wBallWorkX]
    ld c, a
    ld a, [wBallWorkY]
    add $04
    call CollideBallPoint
    jr z, .checkRightSide

    jr c, .checkRightSide

    ld a, $01
    ld [wBallBounced], a
    call ReflectBallLeft

.checkRightSide:
    ld a, [wBallWorkX]
    add $07
    ld c, a
    ld a, [wBallWorkY]
    add $04
    call CollideBallPoint
    jr z, .checkBottomSide

    jr c, .checkBottomSide

    ld a, $01
    ld [wBallBounced], a
    call ReflectBallRight

.checkBottomSide:
    ld a, [wBallWorkX]
    add $04
    ld c, a
    ld a, [wBallWorkY]
    add $07
    call CollideBallPoint
    jr z, .checkTopSide

    jr c, .checkTopSide

    ld a, $01
    ld [wBallBounced], a
    call ReflectBallBottom

.checkTopSide:
    ld a, [wBallWorkX]
    add $04
    ld c, a
    ld a, [wBallWorkY]
    call CollideBallPoint
    jr z, .checkAntigravity

    jr c, .checkAntigravity

    ld a, $01
    ld [wBallBounced], a
    call ReflectBallTop

.checkAntigravity:
    ld a, [wAntigravityActive]
    or a
    jr z, CollideBall_Corners

    ld a, [wBallWorkX]
    ld c, a
    ld a, [wBallWorkY]
    call CollideBallPoint
    jr z, .checkTopRightCorner

    jr c, .checkTopRightCorner

    ld a, $01
    ld [wBallBounced], a
    call ReflectBallTop

.checkTopRightCorner:
    ld a, [wBallWorkX]
    add $07
    ld c, a
    ld a, [wBallWorkY]
    call CollideBallPoint
    ret z

    ret c

    ld a, $01
    ld [wBallBounced], a
    call ReflectBallTop
    ret

; Tests four corner points of the ball against the bricks with CollideBallPoint. Runs after the side checks, unless Antigravity is active.
; On a hit it sets wBallBounced. The position inside the tile decides if the ball is reflected left or right, or top or bottom.
; An exact diagonal hit uses both reflect tables, except at the top left corner, where the direction stays unchanged.
CollideBall_Corners:
    ld a, [wBallWorkX]
    inc a
    ld c, a
    push bc
    ld a, [wBallWorkY]
    add $06
    push af
    call CollideBallPoint
    jr z, .bottomLeftMiss

    jr c, .bottomLeftMiss

    ld a, $01
    ld [wBallBounced], a
    pop af
    pop bc
    and $07
    ld d, a
    ld a, $07
    sub d
    ld d, a
    ld a, c
    and $0f
    cp d
    jr z, .bottomLeftDiagonal

    jr nc, .bottomLeftReflectBottom

    call ReflectBallLeft
    jr .checkBottomRight

.bottomLeftReflectBottom:
    call ReflectBallBottom
    jr .checkBottomRight

.bottomLeftDiagonal:
    ld a, [wBallWorkDirection]
    ld l, a
    ld h, $00
    ld de, BallReflectLeftTable
    add hl, de
    ld l, [hl]
    ld h, $00
    ld de, BallReflectBottomTable
    add hl, de
    ld a, [hl]
    ld [wBallWorkDirection], a
    jr .checkBottomRight

.bottomLeftMiss:
    add sp, $04

.checkBottomRight:
    ld a, [wBallWorkX]
    add $06
    ld c, a
    push bc
    ld a, [wBallWorkY]
    add $06
    push af
    call CollideBallPoint
    jr z, .bottomRightMiss

    jr c, .bottomRightMiss

    ld a, $01
    ld [wBallBounced], a
    pop af
    pop bc
    and $07
    ld d, a
    ld a, $07
    sub d
    ld d, a
    ld a, c
    and $0f
    ld e, a
    ld a, $0f
    sub e
    cp d
    jr z, .bottomRightDiagonal

    jr nc, .bottomRightReflectBottom

    call ReflectBallRight
    jr .checkTopLeft

.bottomRightReflectBottom:
    call ReflectBallBottom
    jr .checkTopLeft

.bottomRightDiagonal:
    ld a, [wBallWorkDirection]
    ld l, a
    ld h, $00
    ld de, BallReflectRightTable
    add hl, de
    ld l, [hl]
    ld h, $00
    ld de, BallReflectBottomTable
    add hl, de
    ld a, [hl]
    ld [wBallWorkDirection], a
    jr .checkTopLeft

.bottomRightMiss:
    add sp, $04

.checkTopLeft:
    ld a, [wBallWorkX]
    inc a
    ld c, a
    push bc
    ld a, [wBallWorkY]
    inc a
    push af
    call CollideBallPoint
    jr z, .topLeftMiss

    jr c, .topLeftMiss

    ld a, $01
    ld [wBallBounced], a
    pop af
    pop bc
    and $07
    ld d, a
    ld a, c
    and $0f
    cp d
    jr z, .topLeftDiagonal

    jr nc, .topLeftReflectTop

    call ReflectBallLeft
    jr .checkTopRight

.topLeftReflectTop:
    call ReflectBallTop
    jr .checkTopRight

.topLeftDiagonal:
    ld a, [wBallWorkDirection]
    ld l, a
    ld h, $00
    ld de, BallReflectLeftTable
    add hl, de
    ld l, [hl]
    ld h, $00
    ld de, BallReflectTopTable
    add hl, de
    ld a, [hl]
    ; The other three corners store this result in wBallWorkDirection. This one does not,
    ; so an exact diagonal hit on the top-left corner leaves the direction unchanged.
    jr .checkTopRight

.topLeftMiss:
    add sp, $04

.checkTopRight:
    ld a, [wBallWorkX]
    add $06
    ld c, a
    push bc
    ld a, [wBallWorkY]
    inc a
    push af
    call CollideBallPoint
    jr z, .topRightMiss

    jr c, .topRightMiss

    ld a, $01
    ld [wBallBounced], a
    pop af
    pop bc
    and $07
    ld d, a
    ld a, c
    and $0f
    ld e, a
    ld a, $0f
    sub e
    cp d
    jr z, .topRightDiagonal

    jr nc, .topRightReflectTop

    call ReflectBallRight
    jr .done

.topRightReflectTop:
    call ReflectBallTop
    jr .done

.topRightDiagonal:
    ld a, [wBallWorkDirection]
    ld l, a
    ld h, $00
    ld de, BallReflectRightTable
    add hl, de
    ld l, [hl]
    ld h, $00
    ld de, BallReflectTopTable
    add hl, de
    ld a, [hl]
    ld [wBallWorkDirection], a
    jr .done

.topRightMiss:
    add sp, $04

.done:
    ret

; Change the ball direction with BallReflectLeftTable.
ReflectBallLeft:
    ld a, [wBallWorkDirection]
    ld l, a
    ld h, $00
    ld de, BallReflectLeftTable
    add hl, de
    ld a, [hl]
    ld [wBallWorkDirection], a
    ld a, [wAntigravityActive]
    or a
    jr nz, ReflectBallRight.restoreOldX

    ret

; Change the ball direction with BallReflectRightTable.
ReflectBallRight:
    ld a, [wBallWorkDirection]
    ld l, a
    ld h, $00
    ld de, BallReflectRightTable
    add hl, de
    ld a, [hl]
    ld [wBallWorkDirection], a
    ld a, [wAntigravityActive]
    or a
    ret z

.restoreOldX:
    ld a, [wBallOldXSub]
    ld [wBallWorkXSub], a
    ld a, [wBallOldX]
    ld [wBallWorkX], a
    ret

; Change the ball direction with BallReflectTopTable.
ReflectBallTop:
    ld a, [wBallWorkDirection]
    ld l, a
    ld h, $00
    ld de, BallReflectTopTable
    add hl, de
    ld a, [hl]
    ld [wBallWorkDirection], a
    ld a, [wAntigravityActive]
    or a
    jr nz, ReflectBallBottom.restoreOldY

    ret

; Change the ball direction with BallReflectBottomTable.
ReflectBallBottom:
    ld a, [wBallWorkDirection]
    ld l, a
    ld h, $00
    ld de, BallReflectBottomTable
    add hl, de
    ld a, [hl]
    ld [wBallWorkDirection], a

    ld a, [wAntigravityActive]
    or a
    ret z

.restoreOldY:
    ld a, [wBallOldYSub]
    ld [wBallWorkYSub], a
    ld a, [wBallOldY]
    ld [wBallWorkY], a
    ret

; Test one point of the ball. A ball moving down is tested against the bat first; otherwise the point is tested against the bricks.
CollideBallPoint:
    ld b, a
    call CheckUfoHit
    ret nz

    call CheckBlobCatch
    ld e, b
    ld d, c
    ld a, [wBallWorkDirection]
    cp $17
    jp nc, HitBrickAtBall

    cp $09
    jp c, HitBrickAtBall

    ld a, [wBatY]
    sub $08
    cp b
    jp nc, HitBrickAtBall

    add $04
    cp b
    jp c, HitBrickAtBall

    ld a, [wBatWidth]
    ld b, a
    ld a, [wBatX]
    sub $08
    ld c, a
    ld a, d
    sub c
    jr c, HitBrickAtBall

    cp b
    jr nc, HitBrickAtBall

    push af
    ld a, [wBatExplosionTimer]
    or a
    pop bc
    jr nz, .clearFlagsReturnHit

    ld a, b
    call BatBounceLookup
    ld [wBallWorkDirection], a
    ld a, [hl]
    ld b, a
    ld a, [wBallWorkSpeed]
    and $f0
    or b
    ld [wBallWorkSpeed], a
    ld a, $01
    ld [wBallBounced], a
    ld a, $01
    call PlaySound

.clearFlagsReturnHit:
    xor a
    ld [wBallWorkFlags], a
    sub $01
    ret

; Look up the brick at the position D = x, E = y and hit it with the ball.
HitBrickAtBall:
    ld a, e
    ld c, d
    push de
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, wBrickMap - $30
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    pop bc
    ld a, [hl]
    or a
    ret z

    cp $0f
    jr z, .countUnbreakableHit

    cp $0e
    jr z, .brickIs0e

    push af
    xor a
    ld [wBallWorkFlags], a
    pop af
    jp HitBrickWithBall

.brickIs0e:
    ld a, [wUnbreakableHitSpawned]
    or a
    call z, SpawnUnbreakableHitEffect

.countUnbreakableHit:
    ld a, [wBallWorkFlags]
    bit 7, a
    jr nz, .advanceBit7Counter

    cp $14
    jr z, .hitCountReached14

    inc a
    ld [wBallWorkFlags], a
    jr .playSound4ReturnNz

.hitCountReached14:
    xor a

.advanceBit7Counter:
    res 7, a
    inc a
    and $07
    set 7, a
    ld [wBallWorkFlags], a

.playSound4ReturnNz:
    ld a, $04
    call PlaySound
    ld a, $01
    or a
    ret

; Look up the new ball direction and speed for a hit at offset A along the bat.
BatBounceLookup:
    add a
    ld c, a
    ld b, $00
    ld hl, BatBounceTable
    ld de, $0040
    ld a, [wBatWidth]
    cp $20
    jr z, .checkSlowBall

    ld hl, BatBounceTable_BigBat
    ld de, $0050

.checkSlowBall:
    ld a, [wSlowBallActive]
    or a
    jr z, .readEntry

    add hl, de

.readEntry:
    add hl, bc
    ld a, [hl+]
    ret

; Animate the bat explosion after a lost life.
UpdateBatExplosion:
    ld a, [wBatExplosionTimer]
    or a
    ret z

    dec a
    ld [wBatExplosionTimer], a
    ld e, a
    ld d, $00
    ld hl, BatExplosionSequence
    add hl, de
    ld e, [hl]
    ld hl, BatExplosionFrames
    add hl, de
    ld d, h
    ld e, l
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld a, [de]
    inc de
    ld [hTemp], a
    ld b, a
    ld a, [wOamUsed]
    add b
    ld [wOamUsed], a
    ld a, [wBatExplosionY]
    ld b, a
    ld a, [wBatExplosionX]
    ld c, a

.copySpriteLoop:
    ld a, [de]
    inc de
    add b
    ld [hl+], a
    ld a, [de]
    inc de
    add c
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [hTemp]
    dec a
    ld [hTemp], a
    jr nz, .copySpriteLoop

    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ret

; Called once per frame while a level is played. Keeps the background tiles under the bat in step with the bat width.
; If wBatWidth is not the normal $20, it queues two bat tiles and the background tiles beside them in wBrickRedrawQueue and stores the column in wBatTilesColumn.
; Otherwise, or while the bat explodes, it queues the saved background tiles once to restore them.
UpdateBatTiles:
    ld a, [wBatExplosionTimer]
    or a
    jr nz, .restoreTiles

    ld a, [wBatWidth]
    cp $20
    jr nz, .queueWideBatTiles

.restoreTiles:
    ld a, [wBatTilesDrawn]
    or a
    ret z

    xor a
    ld [wBatTilesDrawn], a
    ld hl, $0200
    ld d, $00
    ld a, [wBatTilesColumn]
    inc a
    ld e, a
    add hl, de
    ld b, h
    ld c, l
    ld hl, $9800
    add hl, bc
    ld d, h
    ld e, l
    ld hl, wBackgroundTilemap
    add hl, bc
    ld b, h
    ld c, l
    ld hl, wBrickRedrawQueue
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, e
    cp $03
    ld a, [bc]
    ld [hl+], a
    ld a, $08
    jr nc, .storeRestoreAttr

    ld a, $0a

.storeRestoreAttr:
    ld [hl+], a
    inc e
    inc bc
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    ld a, $08
    ld [hl], a
    ld a, [wBrickRedrawCount]
    add $02
    ld [wBrickRedrawCount], a
    ret

.queueWideBatTiles:
    ld [wBatTilesDrawn], a
    ld hl, $0200
    ld a, [wBatX]
    sub $08
    sra a
    sra a
    sra a
    ld e, a
    ld d, $00
    ld [wBatTilesColumn], a
    add hl, de
    ld b, h
    ld c, l
    ld hl, $9800
    add hl, bc
    ld d, h
    ld e, l
    ld hl, wBackgroundTilemap
    add hl, bc
    ld b, h
    ld c, l
    ld hl, wBrickRedrawQueue
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, e
    cp $03
    ld a, [bc]
    ld [hl+], a
    ld a, $08
    jr nc, .storeLeftAttr

    ld a, $0a

.storeLeftAttr:
    ld [hl+], a
    inc e
    inc bc
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $4e
    ld [hl+], a
    ld a, $83
    ld [hl+], a
    inc e
    inc bc
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $4e
    ld [hl+], a
    ld a, $83
    ld [hl+], a
    inc e
    inc bc
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    ld a, $08
    ld [hl], a
    ld a, [wBrickRedrawCount]
    add $04
    ld [wBrickRedrawCount], a
    ret

; A rocket, laser, grenade or plasma shot hit the brick at HL. A = its hit points.
; A plasma shot (wPlasmaState = 2) removes 2 hit points.
HitBrickWithShot:
    and $0f
    ld c, l
    ld b, h
    ld de, $0120
    add hl, de
    bit 7, [hl]
    jr nz, HitBrickWithBall.returnNonZero

    set 7, [hl]
    dec a
    ld [wHitNewValue], a
    or a
    jr z, .checkPlasma

    ld a, [wPlasmaState]
    cp $02
    jr nz, .checkPlasma

    dec a
    ld [wHitNewValue], a

.checkPlasma:
    ld a, [wPlasmaState]
    cp $02
    jr nz, HitBrickWithBall.noHitEffect

    ld a, [wPlasmaShotX]
    ld [wHitEffectX], a
    jr HitBrickWithBall.storeHitPtr

; The ball hit the brick at HL. A = its hit points.
; While Ninja is active the brick is set to 1 hit point and the ball does not bounce.
HitBrickWithBall:
    and $0f
    ld c, l
    ld b, h
    ld de, $0120
    add hl, de
    bit 7, [hl]
    jr nz, .checkNinja

    set 7, [hl]
    dec a
    ld [wHitNewValue], a
    or a
    jr z, .noHitEffect

    ld a, [wNinjaActive]
    or a
    jr z, .noHitEffect

    ld [wHitNewValue], a

.noHitEffect:
    xor a
    ld [wHitEffectX], a

.storeHitPtr:
    ld a, l
    ld [wHitPowerupPtr], a
    ld a, h
    ld [wHitPowerupPtr + 1], a
    ld d, $00
    dec bc
    ld a, [bc]
    cp $0f
    jr nz, .checkBrickAbove

    set 0, d

.checkBrickAbove:
    ld hl, $fff1
    add hl, bc
    ld a, [hl]
    cp $0f
    jr nz, .queueHit

    set 1, d

.queueHit:
    ld a, d
    ld [wHitRedrawIndex], a
    ld de, $3326
    add hl, de
    add hl, hl
    call QueueBrickHit
    ld b, $01
    call AddScore

.checkNinja:
    ld a, [wNinjaActive]
    or a
    jr z, .returnNonZero

    xor a
    ret

.returnNonZero:
    ld a, $01
    or a
    ret

; Work out which neighbours of a destroyed brick are present, for the redraw.
GetBrickNeighbourMask:
    ld b, $00
    ld de, $0010
    add hl, de
    ld a, [hl+]
    or a
    jr z, .checkBelowRight

    set 0, b

.checkBelowRight:
    ld a, [hl]
    or a
    jr z, .checkAbove

    set 1, b

.checkAbove:
    ld de, $ffdf
    add hl, de
    ld a, [hl-]
    or a
    jr z, .checkAboveLeft

    set 2, b
    cp $0f
    jr nz, .checkAboveLeft

    set 5, b

.checkAboveLeft:
    ld a, [hl]
    or a
    jr z, .checkTwoRowsUpLeft

    set 3, b
    cp $0f
    jr nz, .checkTwoRowsUpLeft

    set 4, b
    jr .storeMask

.checkTwoRowsUpLeft:
    ld de, $fff0
    add hl, de
    ld a, [hl]
    ld de, $0010
    add hl, de
    cp $0f
    jr nz, .storeMask

    set 3, b
    set 2, b

.storeMask:
    ld a, b
    add a
    ld [wHitRedrawIndex], a
    ld de, $3327
    add hl, de
    add hl, hl
    call CountBrickDestroyed
    ret

; Add an entry to wBrickHitQueue.
QueueBrickHit:
    ld de, $981f
    add hl, de
    ld c, l
    ld b, h
    ld hl, wBrickHitQueue
    ld de, $0008

.findFreeSlot:
    ld a, [hl]
    or a
    jr z, .slotFound

    add hl, de
    jr .findFreeSlot

.slotFound:
    ld [hl], $05
    inc hl
    ld a, [wHitPowerupPtr]
    ld [hl+], a
    ld a, [wHitPowerupPtr + 1]
    ld [hl+], a
    ld a, [wHitNewValue]
    ld [hl+], a
    ld a, [wHitRedrawIndex]
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [wHitEffectX]
    ld [hl+], a
    ret

; Count down wBricksLeft and end the level when it reaches 0.
CountBrickDestroyed:
    ld a, [wBricksLeft]
    dec a
    ld [wBricksLeft], a
    jr nz, .queueRedraw

    ld a, [hStateTimer]
    or a
    jr nz, .queueRedraw

    xor a
    ld [hLifeLostTimer], a
    ld b, $02
    ld a, [wLevelsSincePassword]
    cp $04
    jr nz, .setEndState

    call NextLevelMusic
    ld a, [wEndingSeen]
    or a
    jr nz, .setEndState

    ld b, $09

.setEndState:
    ld a, b
    ld [hGameState], a
    ld a, $0f
    ld [hStateTimer], a
    ld a, [wCurrentLevel]
    inc a
    cp $a0
    jr nz, .storeLevel

    ld a, $0d
    ld [hGameState], a
    xor a

.storeLevel:
    ld [wCurrentLevel], a

.queueRedraw:
    ld a, h
    ld [hTemp], a
    ld a, l
    ld [hTemp + 1], a
    ld de, $981f
    add hl, de
    ld c, l
    ld b, h
    ld hl, wBrickRedrawQueue
    ld de, $0004

.findFreeSlot:
    ld a, [hl]
    or a
    jr z, .slotFound

    add hl, de
    jr .findFreeSlot

.slotFound:
    push hl
    ld a, [wHitRedrawIndex]
    ld e, a
    ld d, $00
    ld hl, BrickRedrawHandlers
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl

; The routines below queue the background tiles that replace a broken brick.
; Each queue entry is a tilemap address, a tile and an attribute byte.
; Attribute $08 is the normal background palette. $0a is the shadow palette.
; A brick casts a shadow on the two tiles below it, so those are redrawn too.

; Both tiles of the brick, lit.
BrickRedraw_Lit:
    ld a, [wBrickRedrawCount]
    add $02
    ld [wBrickRedrawCount], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [hTemp]
    ld d, a
    ld a, [hTemp + 1]
    ld e, a
    push hl
    ld hl, wBackgroundTilemap + $1f
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    ld a, e
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    inc c
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    ret

; Both tiles of the brick, in shadow.
BrickRedraw_Shadow:
    ld a, [wBrickRedrawCount]
    add $02
    ld [wBrickRedrawCount], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [hTemp]
    ld d, a
    ld a, [hTemp + 1]
    ld e, a
    push hl
    ld hl, wBackgroundTilemap + $1f
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    ld a, e
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    inc c
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    ret

; Left tile lit, right tile in shadow.
BrickRedraw_ShadowRight:
    ld a, [wBrickRedrawCount]
    add $02
    ld [wBrickRedrawCount], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld a, [hTemp]
    ld d, a
    ld a, [hTemp + 1]
    ld e, a
    push hl
    ld hl, wBackgroundTilemap + $1f
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    ld a, e
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    inc c
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    ret

; Left tile in shadow, right tile lit.
BrickRedraw_ShadowLeft:
    ld a, [wBrickRedrawCount]
    add $02
    ld [wBrickRedrawCount], a
    ld a, c
    ld [hl+], a
    ld a, b

    ld [hl+], a
    ld a, [hTemp]
    ld d, a
    ld a, [hTemp + 1]
    ld e, a
    push hl
    ld hl, wBackgroundTilemap + $1f
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]

    pop hl
    ld a, e
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    inc c
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    ret

; Both tiles below the brick, lit.
BrickRedraw_BelowLit:
    ld a, [wBrickRedrawCount]
    add $02
    ld [wBrickRedrawCount], a
    ld a, c
    add $20
    ld c, a
    jr nc, .noCarry

    inc b

.noCarry:
    ld [hl+], a
    ld a, b
    ld [hl+], a

    ld a, [hTemp]
    ld d, a
    ld a, [hTemp + 1]
    ld e, a
    push hl
    ld hl, wBackgroundTilemap + $40
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    ld a, e
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    inc c
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    ret

; Both tiles below the brick: left in shadow, right lit.
BrickRedraw_BelowHalfShadow:
    ld a, [wBrickRedrawCount]
    add $02
    ld [wBrickRedrawCount], a
    ld a, c
    add $20
    ld c, a
    jr nc, .noCarry

    inc b

.noCarry:
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [hTemp]
    ld d, a
    ld a, [hTemp + 1]
    ld e, a
    push hl
    ld hl, wBackgroundTilemap + $40
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    ld a, e
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    inc c
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    ret

; The tile below the right half, lit.
BrickRedraw_BelowRightLit:
    ld a, [wBrickRedrawCount]
    inc a
    ld [wBrickRedrawCount], a
    ld a, c
    add $21
    ld c, a
    jr nc, .noCarry

    inc b

.noCarry:
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [hTemp]
    ld d, a
    ld a, [hTemp + 1]
    ld e, a
    push hl
    ld hl, wBackgroundTilemap + $41
    add hl, de
    ld a, [hl]
    pop hl
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    ret

; The tile below the left half, lit.
BrickRedraw_BelowLeftLit:
    ld a, [wBrickRedrawCount]
    inc a
    ld [wBrickRedrawCount], a
    ld a, c
    add $20
    ld c, a
    jr nc, .noCarry

    inc b

.noCarry:
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [hTemp]
    ld d, a
    ld a, [hTemp + 1]
    ld e, a
    push hl
    ld hl, wBackgroundTilemap + $40
    add hl, de
    ld a, [hl]
    pop hl
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    ret

; The tile below the left half, in shadow.
BrickRedraw_BelowLeftShadow:
    ld a, [wBrickRedrawCount]
    inc a
    ld [wBrickRedrawCount], a
    ld a, c
    add $20
    ld c, a
    jr nc, .noCarry

    inc b

.noCarry:
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [hTemp]
    ld d, a
    ld a, [hTemp + 1]
    ld e, a
    push hl
    ld hl, wBackgroundTilemap + $40
    add hl, de
    ld d, [hl]
    pop hl
    ld a, d
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    ret

; Entries of BrickRedrawHandlers. The name gives the brick tiles, then the tiles below that are redrawn.
BrickRedrawCase_Lit_Below:
    pop hl
    call BrickRedraw_Lit
    jp BrickRedraw_BelowLit

; Entry of BrickRedrawHandlers. Redraws both brick tiles lit.
; Then redraws the lit tile below the right half.
BrickRedrawCase_Lit_BelowRight:
    pop hl
    call BrickRedraw_Lit
    jp BrickRedraw_BelowRightLit

; Entry of BrickRedrawHandlers. Redraws both brick tiles lit.
; Then redraws the lit tile below the left half.
BrickRedrawCase_Lit_BelowLeft:
    pop hl
    call BrickRedraw_Lit
    jp BrickRedraw_BelowLeftLit

; Entry of BrickRedrawHandlers. Redraws both brick tiles lit.
; Nothing below the brick needs to change.
BrickRedrawCase_Lit:
    pop hl

    jp BrickRedraw_Lit

; Entry of BrickRedrawHandlers. Redraws the left brick tile lit and the right one in shadow.
; Then redraws both lit tiles below it.
BrickRedrawCase_ShadowRight_Below:
    pop hl
    call BrickRedraw_ShadowRight
    jp BrickRedraw_BelowLit

; Entry of BrickRedrawHandlers. Redraws the left brick tile lit and the right one in shadow.
; Then redraws the lit tile below the right half.
BrickRedrawCase_ShadowRight_BelowRight:
    pop hl
    call BrickRedraw_ShadowRight
    jp BrickRedraw_BelowRightLit

; Entry of BrickRedrawHandlers. Redraws the left brick tile lit and the right one in shadow.
; Then redraws the lit tile below the left half.
BrickRedrawCase_ShadowRight_BelowLeft:
    pop hl
    call BrickRedraw_ShadowRight
    jp BrickRedraw_BelowLeftLit

; Entry of BrickRedrawHandlers. Redraws the left brick tile lit and the right one in shadow.
; Nothing below the brick needs to change.
BrickRedrawCase_ShadowRight:
    pop hl
    jp BrickRedraw_ShadowRight

; Entry of BrickRedrawHandlers. Redraws the left brick tile in shadow and the right one lit.
; Then redraws both lit tiles below it.
BrickRedrawCase_ShadowLeft_Below:
    pop hl
    call BrickRedraw_ShadowLeft
    jp BrickRedraw_BelowLit

; Entry of BrickRedrawHandlers. Redraws the left brick tile in shadow and the right one lit.
; Then redraws the lit tile below the right half.
BrickRedrawCase_ShadowLeft_BelowRight:
    pop hl
    call BrickRedraw_ShadowLeft
    jp BrickRedraw_BelowRightLit

; Entry of BrickRedrawHandlers. Redraws the left brick tile in shadow and the right one lit.
; Then redraws the lit tile below the left half.
BrickRedrawCase_ShadowLeft_BelowLeft:
    pop hl
    call BrickRedraw_ShadowLeft
    jp BrickRedraw_BelowLeftLit

; Entry of BrickRedrawHandlers. Redraws the left brick tile in shadow and the right one lit.
; Nothing below the brick needs to change.
BrickRedrawCase_ShadowLeft:
    pop hl
    jp BrickRedraw_ShadowLeft

; Entry of BrickRedrawHandlers. Redraws both brick tiles in shadow.
; Then redraws both lit tiles below it.
BrickRedrawCase_Shadow_Below:
    pop hl
    call BrickRedraw_Shadow
    jp BrickRedraw_BelowLit

; Entry of BrickRedrawHandlers. Redraws both brick tiles in shadow.
; Then redraws the lit tile below the right half.
BrickRedrawCase_Shadow_BelowRight:
    pop hl
    call BrickRedraw_Shadow
    jp BrickRedraw_BelowRightLit

; Entry of BrickRedrawHandlers. Redraws both brick tiles in shadow.
; Then redraws the lit tile below the left half.
BrickRedrawCase_Shadow_BelowLeft:
    pop hl
    call BrickRedraw_Shadow
    jp BrickRedraw_BelowLeftLit

; Entry of BrickRedrawHandlers. Redraws both brick tiles in shadow.
; Nothing below the brick needs to change.
BrickRedrawCase_Shadow:
    pop hl
    jp BrickRedraw_Shadow

; Entry of BrickRedrawHandlers. Redraws both brick tiles in shadow.
; Then redraws both tiles below it: the left one in shadow, the right one lit.
BrickRedrawCase_Shadow_BelowHalfShadow:
    pop hl
    call BrickRedraw_Shadow
    jp BrickRedraw_BelowHalfShadow

; Entry of BrickRedrawHandlers. Redraws both brick tiles in shadow.
; Then redraws only the tile below the left half, in shadow.
BrickRedrawCase_Shadow_BelowLeftShadow:
    pop hl
    call BrickRedraw_Shadow
    jp BrickRedraw_BelowLeftShadow

; Copy the queued brick tile changes to the buffer that VBlank writes to the screen.
FlushBrickRedraw:
    ld a, [wBrickRedrawCount]
    or a
    jr z, .appendShineTiles

    ld [hTemp], a
    ld hl, wBrickRedrawQueue
    ld bc, wVBlankAttrWrites
    ld a, [wVBlankTileWritePtr]
    ld e, a
    ld a, [wVBlankTileWritePtr + 1]
    ld d, a

.copyQueueLoop:
    ld a, [hl]
    ld [de], a
    ld [bc], a
    xor a
    ld [hl+], a
    inc de
    inc bc
    ld a, [hl+]
    ld [de], a
    ld [bc], a
    inc de
    inc bc
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hTemp]
    dec a
    ld [hTemp], a
    jr nz, .copyQueueLoop

.appendShineTiles:
    ld a, $09
    ld [ROM_BANK], a
    ld a, [wBrickShinePtr]
    ld l, a
    ld a, [wBrickShinePtr + 1]
    ld h, a
    ld b, $0c

.shineLoop:
    ld a, [hl+]
    cp $ff
    jr nz, .copyShineEntry

    ld hl, BrickShineAnimation
    ld a, [hl+]

.copyShineEntry:
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, .shineLoop

    ld a, l
    ld [wBrickShinePtr], a
    ld a, h
    ld [wBrickShinePtr + 1], a
    ld a, $01
    ld [ROM_BANK], a
    ld a, [wBrickRedrawCount]
    ld [wVBlankAttrWriteCount], a
    ld b, a
    ld a, [wHitTileWriteCount]
    add b
    add $0c
    ld [wBrickRedrawCount], a
    ret

; Sets every used entry of wBrickHitQueue to 1, so the next ProcessBrickHitQueue finishes it at once.
; It also clears the entry's break effect X and restarts the brick shine animation.
; Called when play restarts after a lost life.
MarkBrickHitQueue:
    ld b, $01
    jr ClearBrickHitQueue.setActiveEntries

; Empties every used entry of wBrickHitQueue and clears its break effect X.
; Also restarts the brick shine animation. Called while a level is loaded.
ClearBrickHitQueue:
    ld b, $00

.setActiveEntries:
    ld hl, wBrickHitQueue
    ld c, $0c

.entryLoop:
    ld a, [hl]
    or a
    jr z, .skipEmptyEntry

    ld [hl], b
    ld de, $0007
    add hl, de
    ld [hl], $00
    inc hl
    jr .nextEntry

.skipEmptyEntry:
    ld de, $0008
    add hl, de

.nextEntry:
    dec c
    jr nz, .entryLoop

    ld hl, BrickShineAnimation
    ld a, l
    ld [wBrickShinePtr], a
    ld a, h
    ld [wBrickShinePtr + 1], a
    ret

; Redraw hit bricks, remove destroyed ones and release power-ups.
ProcessBrickHitQueue:
    ld hl, wBrickHitQueue
    ld de, wVBlankTileWrites
    xor a
    ld [wHitTileWriteCount], a
    ld a, $0c
    ld [hTemp2], a

; Handles one of the 12 entries of wBrickHitQueue. HL = the entry, DE = the next VBlank tile write.
; An empty entry is skipped. A new hit draws the damaged brick, spawns its power-up and plays a sound.
; An older entry counts down. Then it either removes the brick, starting a break effect if one is set, or draws the brick again.
ProcessBrickHitQueue_Entry:
    ld a, [hl]
    or a
    jp z, ProcessBrickHitQueue_SkipEntry

    cp $05
    jp z, ProcessBrickHitQueue_NewHit

    dec a
    ld [hl], a
    jp nz, ProcessBrickHitQueue_SkipEntry

    inc hl
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [bc]
    and $7f
    ld [bc], a
    ld a, [hl+]
    or a
    jr nz, .brickSurvives

    push hl
    ld hl, $fee0
    add hl, bc
    ld [hl], a
    push de
    call GetBrickNeighbourMask
    pop de
    pop hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    or a
    call nz, SpawnBrickBreakEffect
    ld a, $03
    call PlaySound
    jp ProcessBrickHitQueue_Next

.brickSurvives:
    push hl
    ld hl, $fee0
    add hl, bc
    ld [hl], a
    pop hl
    cp $01
    jr nz, .checkValue2

    ld b, $06

.checkValue2:
    cp $02
    jr nz, .checkValue3

    ld b, $0c

.checkValue3:
    cp $03
    jr nz, .pickTilePair

    ld b, $12

.pickTilePair:
    ld a, [hl+]
    or a
    jr nz, .checkTileVariant1

    ld a, $48
    sub b
    ld [wBrickTileLeft], a
    ld a, $49
    sub b
    ld [wBrickTileRight], a

.checkTileVariant1:
    cp $01
    jr nz, .checkTileVariant2

    ld a, $4a
    sub b
    ld [wBrickTileLeft], a
    ld a, $49
    sub b
    ld [wBrickTileRight], a

.checkTileVariant2:
    cp $02
    jr nz, .checkTileVariant3

.tileVariant2Or3:
    ld a, $4a
    sub b
    ld [wBrickTileLeft], a
    ld a, $4b
    sub b
    ld [wBrickTileRight], a
    jr .queueTileWrites

.checkTileVariant3:
    cp $03
    jr z, .tileVariant2Or3

.queueTileWrites:
    ld a, [hl+]
    ld [de], a
    inc de
    ld c, a
    ld a, [hl+]
    ld [de], a
    inc de
    ld b, a
    ld a, [wBrickTileLeft]
    ld [de], a
    inc de
    inc c
    ld a, c
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    inc de
    ld a, [wBrickTileRight]
    ld [de], a
    inc de
    ld a, [wHitTileWriteCount]
    add $02
    ld [wHitTileWriteCount], a
    inc hl
    jp ProcessBrickHitQueue_Next

; Handles a queue entry whose timer has just been set to 5. HL = the entry.
; Stores the brick's power-up id and value, queues the brick's tile pair for the VBlank writes, calls SpawnPowerup and plays a sound.
ProcessBrickHitQueue_NewHit:
    dec a
    ld [hl+], a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [bc]
    and $7f
    ld [wHitPowerupId], a
    ld a, [hl+]
    ld [wHitBrickValue], a
    or a
    jr nz, .checkValue1

    ld b, $00

.checkValue1:
    cp $01
    jr nz, .checkValue2

    ld b, $06

.checkValue2:
    cp $02
    jr nz, .checkValue3

    ld b, $0c

.checkValue3:
    cp $03
    jr nz, .pickTilePair

    ld b, $12

.pickTilePair:
    ld a, [hl+]
    or a
    jr nz, .checkTileVariant1

    ld a, $46
    sub b
    ld [wBrickTileLeft], a
    ld a, $47
    sub b
    ld [wBrickTileRight], a

.checkTileVariant1:
    cp $01
    jr nz, .checkTileVariant2

    ld a, $48
    sub b
    ld [wBrickTileLeft], a
    ld a, $47
    sub b
    ld [wBrickTileRight], a

.checkTileVariant2:
    cp $02
    jr nz, .checkTileVariant3

.tileVariant2Or3:
    ld a, $48
    sub b
    ld [wBrickTileLeft], a
    ld a, $49
    sub b
    ld [wBrickTileRight], a
    jr .queueTileWrites

.checkTileVariant3:
    cp $03
    jr z, .tileVariant2Or3

.queueTileWrites:
    ld a, [hl+]
    ld [de], a
    inc de
    ld c, a
    ld a, [hl+]
    ld [de], a
    inc de
    ld b, a
    ld a, [wBrickTileLeft]
    ld [de], a
    inc de
    inc c
    ld a, c
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    inc de
    ld a, [wBrickTileRight]
    ld [de], a
    inc de
    ld a, [wHitTileWriteCount]
    add $02
    ld [wHitTileWriteCount], a
    call SpawnPowerup
    inc hl
    ld a, $02
    call PlaySound
    jr ProcessBrickHitQueue_Next

; Used for an empty entry or one whose timer is still running. HL = start of the entry; moves HL to the start of the next entry.
ProcessBrickHitQueue_SkipEntry:
    ld a, l
    add $08
    ld l, a
    jr nc, ProcessBrickHitQueue_Next

    inc h

; Moves on to the next of the 12 queue entries.
; After the last entry it stores the end of the queued tile writes in wVBlankTileWritePtr and returns.
ProcessBrickHitQueue_Next:
    ld a, [hTemp2]
    dec a
    ld [hTemp2], a
    jp nz, ProcessBrickHitQueue_Entry

    ld a, e
    ld [wVBlankTileWritePtr], a
    ld a, d
    ld [wVBlankTileWritePtr + 1], a
    ret

; Runs once when the main menu state starts. Starts the menu music and the menu VBlank handler.
; Loads the palettes, graphics and tilemap and draws the menu texts in the current language, including the music and sound on or off texts.
; Resets the password entry and idle timer and sets hMenuScrollY so the menu scrolls in.
StateInit_MainMenu:
    ld e, $05
    call PlayMusic
    ld a, $04
    ld [wLcdcFlags], a
    ld hl, VBlankMenus
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    ld a, $01
    ld [hPaletteMode], a
    ld a, $01
    ld [hInterruptEnable], a
    xor a
    ld [wHdmaMode], a
    ldh [rSCX], a
    ldh [rSCY], a
    ld [wHighScoresVBlankFlag], a
    ld de, Palettes_MainMenu
    call LoadPalettes
    ld hl, $9800
    call ClearTileMap
    ld a, $02
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ld de, $9880
    ld hl, Tilemap_MainMenu_002_6dc4
    ld b, $14
    ld c, $0e
    call CopyTilemapRect
    xor a
    ldh [rVBK], a
    ld hl, Gfx_MainMenu_002_6edc
    ld de, $8000
    ld bc, $04c0
    call DataTransfer
    ld hl, Gfx_MainMenu_002_603c
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, Gfx_MainMenu_002_603c + $800
    ld de, $8800
    ld bc, $0340
    call DataTransfer
    ld hl, Gfx_MainMenu_002_603c + $b40
    ld de, $8b40
    ld bc, $0090
    call DataTransfer
    ld a, $25
    ld de, $9880

    ld hl, Tilemap_MainMenu_002_6c5c
    ld b, $14
    ld c, $0e
    call CopyTilemapRect
    ld a, $0e
    call ChangeROMBank
    ld a, [wLangTextStartLevel]
    ld l, a
    ld a, [wLangTextStartLevel + 1]
    ld h, a
    ld de, wStartLevelLine
    ld bc, $0014
    call DataTransfer

    ld a, [wLangLevelLetter]
    ld [wStartLevelLine + 15], a
    call FormatLevelNumber
    ld a, [wLangTextStartGame]
    ld l, a
    ld a, [wLangTextStartGame + 1]
    ld h, a
    call DrawString
    ld hl, wStartLevelLine
    call DrawString
    ld a, [wLangTextEnterPassword]
    ld l, a
    ld a, [wLangTextEnterPassword + 1]
    ld h, a
    call DrawString
    ld a, [wLangTextMusicOn]
    ld l, a
    ld a, [wLangTextMusicOn + 1]
    ld h, a
    ld a, [wMusicOff]
    or a
    jr z, .drawMusicText

    ld a, [wLangTextMusicOff]
    ld l, a
    ld a, [wLangTextMusicOff + 1]
    ld h, a

.drawMusicText:
    call DrawString
    ld a, [wLangTextSfxOn]
    ld l, a
    ld a, [wLangTextSfxOn + 1]
    ld h, a
    ld a, [wSfxOff]
    or a
    jr z, .drawSfxText

    ld a, [wLangTextSfxOff]
    ld l, a
    ld a, [wLangTextSfxOff + 1]
    ld h, a

.drawSfxText:
    call DrawString
    ld a, [wCheatShowVersion]
    or a
    jr z, .skipVersionText

    ld hl, Text_Version
    call DrawString

.skipVersionText:
    ld hl, wPasswordSlotTiles
    ld a, [$9968]
    ld [hl+], a
    ld a, [$9969]
    ld [hl+], a
    ld a, [$996a]
    ld [hl+], a
    ld a, [$996b]
    ld [hl], a
    ld a, $01
    call ChangeROMBank
    ld a, $fd
    ld [wMenuIdleTimer], a
    xor a
    ld [wLevelSweepPending], a
    ld [wPasswordEntryActive], a
    ld [wLevelMusicIndex], a
    call InitMenuSparkles
    ld a, $90
    ld [hMenuScrollY], a
    ret

; Write wStartLevel + 1 as 3 decimal digits.
FormatLevelNumber:
    ld a, $30
    ld [wStartLevelText], a
    ld [wStartLevelText + 1], a
    ld [wStartLevelText + 2], a
    ld a, [wStartLevel]
    inc a
    ld c, $00

.hundredsLoop:
    ld b, a
    sub $64
    jr nc, .countHundred

    ld a, c
    or a
    jr z, .startTens

    add $30
    ld [wStartLevelText], a
    ld a, b
    or a
    jr z, .done

.startTens:
    ld a, b
    ld c, $00

.tensLoop:
    ld b, a
    sub $0a
    jr nc, .countTen

    ld a, c
    or a

    jr z, .writeUnits

    add $30
    ld [wStartLevelText + 1], a
    ld a, b
    or a
    jr z, .done

.writeUnits:
    ld a, b
    add $30
    ld [wStartLevelText + 2], a
    jr .done

.countTen:
    inc c
    jr .tensLoop

.countHundred:
    inc c
    jr .hundredsLoop

.done:
    ret

; Called once per frame while the main menu is shown. Updates the sparkles and does nothing more while the menu is still scrolling in.
; Then runs password entry if it is active, otherwise the menu navigation.
MainMenu_Update:
    call UpdateMenuSparkles
    ld a, [hMenuScrollY]
    or a
    ret nz

    ld a, [wPasswordEntryActive]
    or a
    jp z, MainMenu_Navigate

; Password entry. Up and down change the letter and skip the vowels.
; A, Start or right moves on; B, Select or left moves back. After the fourth letter the password is submitted.
MainMenu_PasswordEntry:
    xor a
    ld [wMenuItemColours], a
    ld [wMenuItemColours + 1], a
    ld [wMenuItemColours + 3], a
    ld [wMenuItemColours + 4], a
    inc a
    ld [wMenuItemColours + 2], a
    ld a, [hJoypad]
    ld b, a
    or a
    jr z, .selectLetter

    ld a, $fb
    ld [wMenuIdleTimer], a

.selectLetter:
    ld a, [wPasswordCursor]
    or a
    jr nz, .cursorNotFirst

    ld hl, wPasswordEntry
    jr .checkDown

.cursorNotFirst:
    cp $01
    jr nz, .cursorNotSecond

    ld hl, wPasswordEntry + 1
    jr .checkDown

.cursorNotSecond:
    cp $02
    jr nz, .cursorNotThird

    ld hl, wPasswordEntry + 2
    jr .checkDown

.cursorNotThird:
    cp $03
    jr nz, .checkDown

    ld hl, wPasswordEntry + 3

.checkDown:
    bit 3, b
    jr z, .downReleased

    ld a, [wMenuDownHeld]
    or a
    jr nz, .checkUp

    inc a
    ld [wMenuDownHeld], a
    ld a, $19
    call PlaySound
    ld a, [hl]

.prevLetter:
    dec a
    cp $41
    jr z, .prevLetter

    cp $45
    jr z, .prevLetter

    cp $49
    jr z, .prevLetter

    cp $4f
    jr z, .prevLetter

    cp $55
    jr z, .prevLetter

    cp $40
    jr nz, .storePrevLetter

    add $1a

.storePrevLetter:
    ld [hl], a
    jr .checkUp

.downReleased:
    xor a
    ld [wMenuDownHeld], a

.checkUp:
    bit 2, b
    jr z, .upReleased

    ld a, [wMenuUpHeld]
    or a
    jr nz, .checkButtons

    inc a
    ld [wMenuUpHeld], a
    ld a, $19
    call PlaySound
    ld a, [hl]

.nextLetter:
    inc a
    cp $45
    jr z, .nextLetter

    cp $49
    jr z, .nextLetter

    cp $4f
    jr z, .nextLetter

    cp $55
    jr z, .nextLetter

    cp $5b
    jr nz, .storeNextLetter

    sub $19

.storeNextLetter:
    ld [hl], a
    jr .checkButtons

.upReleased:
    xor a
    ld [wMenuUpHeld], a

.checkButtons:
    ld a, b
    and $f3
    or a
    jp z, SubmitPassword_ButtonsReleased

    ld a, [wMenuButtonHeld]
    or a
    ret nz

    ld a, $19
    call PlaySound
    ld a, $01
    ld [wMenuButtonHeld], a
    ld a, [wPasswordCursor]
    bit 4, b
    jr z, .checkBit5Back

    inc a

.checkBit5Back:
    bit 5, b
    jr z, .checkBit7Forward

    or a
    jr z, .checkBit7Forward

    dec a

.checkBit7Forward:
    bit 7, b
    jr z, .checkBit6Back

    inc a

.checkBit6Back:
    bit 6, b
    jr z, .checkBit0Forward

    or a
    jr z, .checkBit0Forward

    dec a

.checkBit0Forward:
    bit 0, b
    jr z, .checkBit1Back

    inc a

.checkBit1Back:
    bit 1, b
    jr z, .storeCursor

    or a
    jr z, .storeCursor

    dec a

.storeCursor:
    ld [wPasswordCursor], a
    or a
    jr nz, .highlightNotFirst

    ld a, $04
    ld [wPasswordLetterColours], a
    ld a, $01
    ld [wPasswordLetterColours + 1], a
    ret

.highlightNotFirst:
    cp $01
    jr nz, .highlightNotSecond

    ld [wPasswordLetterColours], a
    ld [wPasswordLetterColours + 2], a
    ld a, $04
    ld [wPasswordLetterColours + 1], a
    ret

.highlightNotSecond:
    cp $02
    jr nz, .highlightNotThird

    ld a, $01
    ld [wPasswordLetterColours + 1], a
    ld [wPasswordLetterColours + 3], a
    ld a, $04
    ld [wPasswordLetterColours + 2], a
    ret

.highlightNotThird:
    cp $03
    jr nz, SubmitPassword

    ld a, $01
    ld [wPasswordLetterColours + 2], a
    ld a, $04
    ld [wPasswordLetterColours + 3], a
    ret

; Check the typed password and add the "START nnn" menu entry if it is a level password.
SubmitPassword:
    ld a, $02
    call ChangeROMBank
    ld de, wPasswordEntry
    call CheckPassword
    push af
    call nz, FormatLevelNumber
    pop af
    jr z, .restoreBank

    ld hl, wLevelPasswordChars
    ld a, [wPasswordEntry]
    ld [hl+], a
    ld a, [wPasswordEntry + 1]

    ld [hl+], a
    ld a, [wPasswordEntry + 2]
    ld [hl+], a
    ld a, [wPasswordEntry + 3]
    ld [hl], a
    ld a, $1a
    call PlaySound

.restoreBank:
    ld a, $01
    call ChangeROMBank
    xor a
    ld [wPasswordEntryActive], a
    ret

; Clears wMenuButtonHeld so the next button press is accepted again.
; Reached during password entry when no button other than up or down is held.
SubmitPassword_ButtonsReleased:
    xor a
    ld [wMenuButtonHeld], a
    ret

; Menu navigation: wMenuCursor selects one of 5 items.
MainMenu_Navigate:
    ld a, [wMenuCursor]
    or a
    jr nz, .checkItem1

    ld a, $04
    ld [wMenuItemColours], a
    ld a, $01
    ld [wMenuItemColours + 1], a
    ld [wMenuItemColours + 2], a
    ld [wMenuItemColours + 3], a
    ld [wMenuItemColours + 4], a
    ld a, [wStartLevel]
    or a
    jr nz, .item0CheckButton

    ld [wMenuItemColours + 1], a

.item0CheckButton:
    ld a, [hJoypad]
    and $f0
    or a
    jr z, .checkItem1

    ld a, [hGameState]
    cp $02
    jr z, .checkItem1

    ld a, $1a
    call PlaySound
    ld a, $02
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ld b, $00
    call StartGame

.checkItem1:
    ld a, [wMenuCursor]
    dec a
    jr nz, .checkItem2

    ld a, $04
    ld [wMenuItemColours + 1], a
    ld a, $01
    ld [wMenuItemColours], a
    ld [wMenuItemColours + 2], a
    ld [wMenuItemColours + 3], a
    ld [wMenuItemColours + 4], a
    ld a, [wStartLevel]
    or a
    jr nz, .item1CheckButton

    ld [wMenuItemColours + 1], a

.item1CheckButton:
    ld a, [hJoypad]
    and $f0
    or a
    jr z, .checkItem2

    ld a, [hGameState]
    cp $02
    jr z, .checkItem2

    ld a, $1a
    call PlaySound
    ld a, $02
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ld b, $01
    call StartGame

.checkItem2:
    ld a, [wMenuCursor]
    cp $02
    jr nz, .checkItem3

    ld a, $04
    ld [wMenuItemColours + 2], a
    ld a, $01
    ld [wMenuItemColours], a
    ld [wMenuItemColours + 1], a
    ld [wMenuItemColours + 3], a
    ld [wMenuItemColours + 4], a
    ld a, [wStartLevel]
    or a
    jr nz, .item2CheckButton

    ld [wMenuItemColours + 1], a

.item2CheckButton:
    ld a, [hJoypad]
    and $f0
    or a
    jr z, .item2ButtonReleased

    ld a, [wMenuButtonHeld]
    or a
    jr nz, .checkItem3

    ld a, $1a
    call PlaySound
    ld a, $01
    ld [wPasswordEntryActive], a
    ld [wMenuButtonHeld], a
    ld [wPasswordLetterColours + 1], a
    ld [wPasswordLetterColours + 2], a
    ld [wPasswordLetterColours + 3], a
    dec a
    ld [wPasswordCursor], a
    ld a, $42
    ld [wPasswordEntry], a
    ld [wPasswordEntry + 1], a
    ld [wPasswordEntry + 2], a
    ld [wPasswordEntry + 3], a
    ld a, $04
    ld [wPasswordLetterColours], a
    jr .checkItem3

.item2ButtonReleased:
    xor a
    ld [wMenuButtonHeld], a

.checkItem3:
    ld a, [wMenuCursor]
    cp $03
    jr nz, .checkItem4

    ld a, $04
    ld [wMenuItemColours + 3], a
    ld a, $01
    ld [wMenuItemColours], a
    ld [wMenuItemColours + 1], a
    ld [wMenuItemColours + 2], a
    ld [wMenuItemColours + 4], a
    ld a, [wStartLevel]
    or a
    jr nz, .checkItem4

    ld [wMenuItemColours + 1], a

.checkItem4:
    ld a, [wMenuCursor]
    cp $04
    jr nz, .readJoypad

    ld a, $04
    ld [wMenuItemColours + 4], a
    ld a, $01
    ld [wMenuItemColours], a
    ld [wMenuItemColours + 1], a
    ld [wMenuItemColours + 2], a
    ld [wMenuItemColours + 3], a
    ld a, [wStartLevel]
    or a
    jr nz, .readJoypad

    ld [wMenuItemColours + 1], a

.readJoypad:
    ld a, [hJoypad]
    ld b, a
    or a
    jr z, .checkDown

    ld a, $fd
    ld [wMenuIdleTimer], a

.checkDown:
    bit 3, b
    jr z, .downReleased

    ld a, [wMenuDownHeld]
    or a
    jr nz, .checkUp

    inc a
    ld [wMenuDownHeld], a
    ld a, $19
    call PlaySound
    ld a, [wMenuCursor]
    inc a
    cp $05
    jr nz, .downNoWrap

    xor a
    jr .storeCursorDown

.downNoWrap:
    ld c, a
    ld a, [wStartLevel]
    or a
    ld a, c
    jr nz, .storeCursorDown

    cp $01
    jr nz, .storeCursorDown

    inc a

.storeCursorDown:
    ld [wMenuCursor], a
    jr .checkUp

.downReleased:
    xor a
    ld [wMenuDownHeld], a

.checkUp:
    bit 2, b
    jr z, .upReleased

    ld a, [wMenuUpHeld]
    or a
    jr nz, .checkToggleItems

    inc a
    ld [wMenuUpHeld], a
    ld a, $19
    call PlaySound
    ld a, [wMenuCursor]
    dec a
    cp $ff
    jr nz, .upNoWrap

    ld a, $04
    jr .storeCursorUp

.upNoWrap:
    ld c, a

    ld a, [wStartLevel]
    or a
    ld a, c
    jr nz, .storeCursorUp

    cp $01
    jr nz, .storeCursorUp

    dec a

.storeCursorUp:
    ld [wMenuCursor], a
    jr .checkToggleItems

.upReleased:
    xor a
    ld [wMenuUpHeld], a

.checkToggleItems:
    ld a, [wMenuCursor]
    cp $03
    jp c, MainMenu_IdleTick

    ld a, b
    and $f0
    or a
    jr z, .buttonReleased

    ld a, [wMenuButtonHeld]
    or a
    jr nz, .checkJoyBit0

    inc a
    ld [wMenuButtonHeld], a
    ld a, $19
    call PlaySound
    ld a, [wMenuCursor]
    cp $03
    jr nz, .buttonToggleSfx

    ld a, [wMusicOff]
    xor $01
    ld [wMusicOff], a
    ld e, $05
    or a
    jr z, .buttonStartSong

    ld e, $00

.buttonStartSong:
    call StartSong
    jr .checkJoyBit0

.buttonToggleSfx:
    ld a, [wSfxOff]
    xor $01
    ld [wSfxOff], a
    jr .checkJoyBit0

.buttonReleased:
    xor a
    ld [wMenuButtonHeld], a

.checkJoyBit0:
    bit 0, b
    jr z, .bit0Released

    ld a, [wMenuRightHeld]
    or a
    jr nz, .checkJoyBit1

    inc a
    ld [wMenuRightHeld], a
    ld a, $19
    call PlaySound
    ld a, [wMenuCursor]
    cp $03
    jr nz, .bit0ToggleSfx

    ld a, [wMusicOff]
    xor $01
    ld [wMusicOff], a
    ld e, $05
    or a
    jr z, .bit0StartSong

    ld e, $00

.bit0StartSong:
    call StartSong
    jr .checkJoyBit1

.bit0ToggleSfx:
    ld a, [wSfxOff]
    xor $01
    ld [wSfxOff], a
    jr .checkJoyBit1

.bit0Released:
    xor a
    ld [wMenuRightHeld], a

.checkJoyBit1:
    bit 1, b
    jr z, .bit1Released

    ld a, [wMenuLeftHeld]
    or a
    jr nz, MainMenu_IdleTick

    inc a
    ld [wMenuLeftHeld], a
    ld a, $19
    call PlaySound
    ld a, [wMenuCursor]
    cp $03
    jr nz, .bit1ToggleSfx

    ld a, [wMusicOff]
    xor $01
    ld [wMusicOff], a
    ld e, $05
    or a
    jr z, .bit1StartSong

    ld e, $00

.bit1StartSong:
    call StartSong
    jr MainMenu_IdleTick

.bit1ToggleSfx:
    ld a, [wSfxOff]
    xor $01
    ld [wSfxOff], a
    jr MainMenu_IdleTick

.bit1Released:
    xor a
    ld [wMenuLeftHeld], a

; Runs at the end of each menu update. Counts wMenuTick and on every second frame counts down wMenuIdleTimer.
; When the timer runs out on the menu, it switches to the high score or credits screen (hGameState 7 or 8, chosen by wAttractToggle) and plays a sound.
MainMenu_IdleTick:
    ld a, [wMenuTick]
    inc a
    ld [wMenuTick], a
    and $01
    jr z, .done

    ld a, [wMenuIdleTimer]
    cp $ff
    jr z, .done

    dec a
    ld [wMenuIdleTimer], a
    jr nz, .done

    ld a, [hGameState]
    cp $01
    jr nz, .done

    ld a, [wAttractToggle]
    xor $01
    ld [wAttractToggle], a
    jr z, .attractToggleZero

    ld a, $07
    jr .setAttractState

.attractToggleZero:
    ld a, $08

.setAttractState:
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ld a, $01
    ld [wHighScoresNextState], a
    ld a, $fe
    ld [wMenuIdleTimer], a
    ld a, $1a
    call PlaySound

.done:
    ret

; Begin a new game. B = 0 starts at level 1, B = 1 at the password level (wStartLevel).
StartGame:
    call ResetScore
    xor a
    ld [wLevelsSincePassword], a
    ld [wEndingSeen], a
    ld a, $05
    ld [wLives], a
    ld a, b
    or a
    jr z, .startAtFirstLevel

    ld a, [wStartLevel]
    jr .setLevel

.startAtFirstLevel:
    ld a, $00

.setLevel:
    ld [wCurrentLevel], a
    ld hl, $05dc
    ld a, l
    ld [wLevelBonus], a
    ld a, h
    ld [wLevelBonus + 1], a
    ld hl, $0096
    ld a, l
    ld [wLevelBonusUnits], a
    ld a, h
    ld [wLevelBonusUnits + 1], a
    ret

; Runs once when the title screen state starts. Starts the title music and loads the palettes, graphics and tilemaps.
; Picks the licensed-by graphics for the current language, sets wMenuItemColours and calls TitleScreen_InitLetters.
StateInit_TitleScreen:
    ld e, $01
    call PlayMusic
    ld a, $00
    ld [wLcdcFlags], a
    ld hl, VBlank
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    ld a, $04
    ld [hPaletteMode], a
    xor a
    ld [hLycStart], a
    ld a, $80
    ld [wRasterObjPaletteIndex], a
    ld a, $01
    ld [hInterruptEnable], a
    xor a
    ldh [rSCX], a
    ld de, Palettes_TitleScreen
    call LoadPalettes
    ld a, $07
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    ld hl, Gfx_TitleScreen_007_4000
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, Gfx_TitleScreen_007_4000 + $800
    ld de, $8800
    ld bc, $0620
    call DataTransfer
    ld hl, Gfx_TitleScreen_007_5f28 + $540
    ld de, $8000
    ld bc, $00d0
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, Tilemap_TitleScreen_007_5dac
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    ld a, [wLanguage]
    or a
    jr z, .skipAttrLangRow

    ld hl, Tilemap_TitleScreen_007_5f14
    ld de, $9a20
    xor a
    ld b, $14
    ld c, $01
    call CopyTilemapRect

.skipAttrLangRow:
    xor a
    ld [wLevelSweepPending], a
    ldh [rVBK], a
    ld hl, Gfx_TitleScreen_007_4000 + $e10
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, Gfx_TitleScreen_007_4000 + $1610
    ld de, $8800
    ld bc, $0620
    call DataTransfer
    ld a, [wLanguage]
    ld hl, Gfx_TitleLicensedBy_Spanish
    dec a
    jr z, .loadLangTiles

    ld hl, Gfx_TitleLicensedBy_French
    dec a
    jr z, .loadLangTiles

    ld hl, Gfx_TitleLicensedBy_German
    dec a
    jr z, .loadLangTiles

    ld hl, Gfx_TitleScreen_007_68f8

.loadLangTiles:
    ld de, $8e20
    ld bc, $0140
    call DataTransfer
    ld hl, Gfx_TitleScreen_007_5f28
    ld de, $8000
    ld bc, $0540
    call DataTransfer
    xor a
    ld [wMenuCursor], a
    ld de, $9800
    ld hl, Tilemap_TitleScreen_007_5c30
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    ld a, [wLanguage]
    or a
    jr z, .skipTileLangRow

    ld hl, Tilemap_TitleScreen_007_5d98
    ld a, $e2
    ld de, $9a20
    ld b, $14
    ld c, $01
    call CopyTilemapRect

.skipTileLangRow:
    ld a, $01
    call ChangeROMBank
    ld a, $04
    ld [wMenuItemColours], a
    ld a, $01
    ld [wMenuItemColours + 1], a
    ld [wMenuItemColours + 2], a
    ld [wMenuItemColours + 3], a
    ld [wMenuItemColours + 4], a
    ld a, [wStartLevel]
    or a
    jr nz, .initLetters

    ld [wMenuItemColours + 1], a

.initLetters:
    call TitleScreen_InitLetters
    ret

; Called once per frame while the title screen is shown. If hGameState is not 1 yet and a button is pressed, it plays a sound and sets hGameState to 1 with hStateTimer set to $1e.
; Always calls TitleScreen_SlideLetters.
TitleScreen_Update:
    ld a, [hGameState]
    cp $01
    jr z, .slideLetters

    ld a, [hJoypad]
    and $f0
    or a
    jr z, .slideLetters

    ld a, $01
    ld [hGameState], a
    ld a, $1e
    ld [hStateTimer], a
    ld a, $1a
    call PlaySound

.slideLetters:
    call TitleScreen_SlideLetters
    ret

; Runs once when the game over state starts. Starts the game over song unless wSfxOff is set.
; Loads the game over palettes, graphics and tilemaps and draws the game over text in the current language.
StateInit_GameOver:
    ld a, [wSfxOff]
    or a
    jr nz, .skipSong

    ld e, $07
    call StartSong

.skipSong:
    ld hl, VBlank
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    xor a
    ld [hPaletteMode], a
    ld a, $01
    ld [hInterruptEnable], a
    xor a
    ld [wLevelSweepPending], a
    ldh [rSCX], a
    ld de, Palettes_GameOver
    call LoadPalettes
    ld a, $05
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    ld hl, Gfx_GameOver_005_496c
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, Gfx_GameOver_005_496c + $800
    ld de, $8800
    ld bc, $0340
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, Tilemap_GameOver_005_63a4
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    xor a
    ldh [rVBK], a
    ld hl, Gfx_GameOver_005_496c + $b40
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, Gfx_GameOver_005_496c + $1340
    ld de, $8800
    ld bc, $0590
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, Tilemap_GameOver_005_623c
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    ld a, [wLangTextGameOver]
    ld l, a
    ld a, [wLangTextGameOver + 1]
    ld h, a
    call DrawStringSkipZero
    ld a, $01
    call ChangeROMBank
    ret

; Reset the UFO, the blob and Ghost. Runs at level start and after a lost life.
ResetEnemies:
    call ClearProjectiles
    xor a
    ld [wBlobActive], a
    ld [wUfoFlying], a
    ld [wGhostActive], a
    ld [wBlobThrowCount], a
    ld [wGrenadeBlastTimer], a
    ld [wUfoHits], a
    ld [wUfoPassIndex], a
    ld [wUfoTick], a
    ld [wUfoBombActive], a
    dec a
    ld [wUfoWaitTimer], a
    ld a, $01
    ld [wUfoTickMask], a
    ld b, $f0
    ld c, $32
    ld a, c
    ld [wBlob + 13], a
    ld a, $3c
    add b
    ld [wBlob + 14], a
    ld hl, BlobPath
    ld de, wBlob
    call InitEnemyObject
    xor a
    ld [wBlobThrowing], a
    inc a
    ld [wBlobActive], a
    ret

; Update the UFO on UFO levels and the blob on blob levels.
UpdateEnemies:
    ld a, [wLevelType]
    bit 0, a
    jr z, .skipUfo

    call UpdateUfo

.skipUfo:
    call UpdateProjectiles
    ld a, [wLevelType]
    bit 1, a
    jr z, .done

    call UpdateBlob

.done:
    ret

; Called once per frame on blob levels, from UpdateEnemies.
; Plays the blob's animation. When wBlobThrowing is set, it throws a projectile as the throw ends.
; Writes the blob's 4 sprites to OAM, then moves it along BlobPath.
UpdateBlob:
    ld a, [wBlobThrowing]
    or a
    jr z, .notThrowing

    ld hl, BlobSprites_Throwing
    ld a, [wBlobFrame]
    and $01
    ld e, a
    or a
    jr nz, .tickThrowFrame

    ld a, [wBlobFrameTick]
    or a
    jr nz, .tickThrowFrame

    ld a, [wBlobThrowCount]
    inc a
    ld [wBlobThrowCount], a

.tickThrowFrame:
    ld a, [wBlobFrameTick]
    inc a
    ld [wBlobFrameTick], a
    and $07
    jr nz, .drawSprites

    ld a, e
    inc a
    cp $02
    jr z, .throwFinished

    ld [wBlobFrame], a
    jr .drawSprites

.throwFinished:
    xor a
    ld [wBlobThrowing], a
    ld [wBlobFrame], a
    ld [wBlobFrameTick], a
    ld a, [wBlobX]
    add $04
    ld b, a
    ld a, [wBlobY]
    add $04
    ld c, a
    ld a, [hFrameCounter]
    and $07
    ld d, $00
    ld e, a
    ld a, c
    cp $68
    jr nc, .useRightTable

    ld hl, BlobThrowDirections_Left
    add hl, de
    ld l, [hl]
    ld h, d
    ld a, $40

    ld de, BlobThrowData_Left

    jr .spawnThrow

.useRightTable:
    ld hl, BlobThrowDirections_Right
    add hl, de
    ld l, [hl]
    ld h, d
    ld a, $24
    ld de, ThrowPath_4e6e

.spawnThrow:
    call SpawnProjectile
    ld a, $0e
    call PlaySound

.notThrowing:
    ld hl, BlobSprites
    ld a, [wGhostActive]
    or a
    jr z, .tickNormalFrame

    ld hl, BlobSprites_Ghost

.tickNormalFrame:
    ld a, [wBlobFrame]
    and $03
    ld e, a
    ld a, [wBlobFrameTick]
    inc a
    ld [wBlobFrameTick], a
    and $07
    jr nz, .drawSprites

    ld a, e
    inc a
    ld [wBlobFrame], a

.drawSprites:
    swap e
    ld d, $00
    add hl, de
    ld d, h
    ld e, l
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld a, [wBlobY]
    ld b, a
    ld a, [wBlobX]
    ld c, a
    ld a, $04
    ld [hTemp], a

.spriteLoop:
    ld a, [de]
    inc de
    add b
    ld [hl+], a
    ld a, [de]
    inc de
    add c
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    push de
    ld d, a
    ld a, [wBlobPalette]
    add d
    pop de
    ld [hl+], a
    ld a, [hTemp]
    dec a
    ld [hTemp], a
    jr nz, .spriteLoop

    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    add $04
    ld [wOamUsed], a
    ld bc, BlobPath
    ld hl, wBlob
    call UpdateEnemyPath
    ret

; Sets up the 15-byte enemy object at DE from the path data at HL.
; B and C = start position. Clears the position fractions and the step counters. Leaves the last 2 bytes alone.
; Used by ResetEnemies to start the blob on BlobPath.
InitEnemyObject:
    xor a
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    inc de
    xor a
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    xor a
    ld [de], a
    inc de
    ld [de], a
    inc de
    ld [de], a
    inc de
    ld a, [hl+]
    ld c, a
    ld [de], a
    inc de
    ld a, [hl]
    ld b, a
    ld [de], a
    inc de
    ld l, c
    ld h, b
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ret

; Move the 15-byte enemy object at HL along the path data at BC.
UpdateEnemyPath:
    push hl
    push bc
    ld de, wEnemyPathWork
    ld c, $0f

.copyInLoop:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, .copyInLoop

    pop bc
    ld a, [wEnemyPathWork + 11]
    dec a
    ld [wEnemyPathWork + 11], a
    jr nz, .move

    ld h, a
    ld a, [wEnemyPathWork + 8]
    inc a
    ld [wEnemyPathWork + 8], a
    ld l, a
    add hl, hl
    ld a, [wEnemyPathWork + 9]
    ld e, a
    ld a, [wEnemyPathWork + 10]
    ld d, a
    add hl, de
    ld a, [hl+]
    or a
    jr nz, .setStep

    ld a, [wEnemyPathWork + 4]
    dec a
    ld [wEnemyPathWork + 4], a
    jr nz, .restartSegment

    ld h, a
    ld a, [wEnemyPathWork + 5]
    ld l, a
    add hl, hl
    add hl, hl
    add hl, bc
    ld a, [hl+]
    ld [wEnemyPathWork + 4], a
    ld a, [hl+]
    ld [wEnemyPathWork + 5], a
    ld a, [hl+]
    ld [wEnemyPathWork + 9], a
    ld a, [hl+]
    ld [wEnemyPathWork + 10], a
    ld a, [wEnemyPathWork + 14]
    ld [wEnemyPathWork + 3], a
    ld a, [wEnemyPathWork + 13]
    ld [wEnemyPathWork + 1], a

.restartSegment:
    ld a, [wEnemyPathWork + 9]
    ld l, a
    ld a, [wEnemyPathWork + 10]
    ld h, a
    xor a
    ld [wEnemyPathWork + 8], a
    ld a, [hl+]

.setStep:
    ld [wEnemyPathWork + 11], a
    ld a, [hl]
    ld [wEnemyPathWork + 12], a

.move:
    ld a, [wEnemyPathWork + 12]
    ld h, $00
    ld l, a
    add hl, hl
    add hl, hl
    ld de, BallVelocityTable
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [wEnemyPathWork + 2]
    ld l, a
    ld a, [wEnemyPathWork + 3]
    ld h, a
    sra b
    rr c
    add hl, bc
    ld a, l
    ld [wEnemyPathWork + 2], a
    ld a, h
    ld [wEnemyPathWork + 3], a
    ld a, [wEnemyPathWork]
    ld l, a
    ld a, [wEnemyPathWork + 1]
    ld h, a
    sra d
    rr e
    add hl, de
    ld a, l
    ld [wEnemyPathWork], a
    ld a, h
    ld [wEnemyPathWork + 1], a
    pop hl
    ld de, wEnemyPathWork
    ld c, $0f

.copyOutLoop:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .copyOutLoop

    ret

; Marks all 4 slots of wProjectiles as free.
; Called by ResetEnemies at level start and after a lost life.
ClearProjectiles:
    ld hl, wProjectiles
    ld de, $0009
    ld b, $04
    xor a

.loop:
    ld [hl], a
    add hl, de
    dec b
    jr nz, .loop

    ret

; Start a projectile in a free slot of wProjectiles. Used for grenades and by the blob.
; A = type, B = x, C = y, HL = direction, DE = data pointer.
SpawnProjectile:
    push hl
    push af
    push bc
    push de
    ld hl, wProjectiles
    ld de, $0009

.findFreeSlot:
    ld a, [hl]
    or a
    jr z, .slotFound

    add hl, de
    jr .findFreeSlot

.slotFound:
    pop de
    pop bc
    pop af
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, b
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, c
    ld [hl+], a
    pop bc
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl], a
    ret

; Called once per frame from UpdateEnemies. Runs UpdateProjectile for each active slot of wProjectiles.
; Each slot is copied to wProjectileWork and written back afterwards.
; Then counts down wGrenadeBlastTimer and draws the grenade explosion.
UpdateProjectiles:
    ld hl, wProjectiles
    ld de, $0009
    ld b, $04

.slotLoop:
    ld a, [hl]
    or a
    jr z, .slotEmpty

    push hl
    inc hl
    ld [wProjectileWork], a
    ld a, [hl+]
    ld [wProjectileWork + 1], a
    ld a, [hl+]
    ld [wProjectileWork + 2], a
    ld a, [hl+]
    ld [wProjectileWork + 3], a
    ld a, [hl+]
    ld [wProjectileWork + 4], a
    ld a, [hl+]
    ld [wProjectileWork + 7], a
    ld a, [hl+]
    ld [wProjectileWork + 8], a
    ld a, [hl+]
    ld [wProjectileWork + 5], a
    ld a, [hl]
    ld [wProjectileWork + 6], a
    push bc
    push de
    call UpdateProjectile
    pop de
    pop bc
    pop hl
    ld a, [wProjectileWork]
    ld [hl+], a
    ld a, [wProjectileWork + 1]
    ld [hl+], a
    ld a, [wProjectileWork + 2]
    ld [hl+], a
    ld a, [wProjectileWork + 3]
    ld [hl+], a
    ld a, [wProjectileWork + 4]
    ld [hl+], a
    ld a, [wProjectileWork + 7]
    ld [hl+], a
    ld a, [wProjectileWork + 8]
    ld [hl+], a

    ld a, [wProjectileWork + 5]
    ld [hl+], a
    ld a, [wProjectileWork + 6]
    ld [hl+], a
    jr .nextSlot

.slotEmpty:
    add hl, de

.nextSlot:
    dec b
    jr nz, .slotLoop

    ld a, [wGrenadeBlastTimer]
    or a
    jr z, .done

    dec a
    ld [wGrenadeBlastTimer], a
    jr nz, .timerStillRunning

    xor a
    ld [wGrenadeDelay], a
    ret

.timerStillRunning:
    cp $33
    jr nz, .drawTimedSprites

    ld e, a
    ld a, $0b
    call PlaySound
    ld a, e

.drawTimedSprites:
    ld e, a
    ld d, $00
    ld hl, GrenadeExplosionSequence
    add hl, de
    ld e, [hl]
    ld hl, GrenadeExplosionFrames
    add hl, de
    ld d, h
    ld e, l
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld a, [de]
    inc de
    ld [hTemp], a
    ld b, a
    ld a, [wOamUsed]
    add b

    ld [wOamUsed], a
    ld a, [wGrenadeBlastY]
    ld b, a
    ld a, [wGrenadeBlastX]
    ld c, a

.spriteLoop:
    ld a, [de]
    inc de
    add b
    ld [hl+], a
    ld a, [de]
    inc de
    add c
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [hTemp]
    dec a
    ld [hTemp], a
    jr nz, .spriteLoop

    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a

.done:
    ret

; Runs when UpdateProjectile finds a brick under the projectile. Plays sound $0c for a grenade and $09 for a thrown ball.
; Picks a bounce arc and a new timer in wProjectileWork from the projectile's Y position.
UpdateProjectile_HitBrick:
    ld a, [wProjectileWork + 8]
    bit 7, a
    jr z, .playSound09

    ld a, $0c
    call PlaySound
    jr .pickDataByPos

.playSound09:
    ld a, $09
    call PlaySound

.pickDataByPos:
    ld a, [wProjectileWork + 4]
    cp $6d
    jr nc, .checkBelow72

    ld a, $24
    ld hl, ThrowPath_4e6e
    jr .storeTimerAndData

.checkBelow72:
    cp $72
    jr nc, .checkBelow77

    ld a, $20
    ld hl, ProjectileBounceArc_1
    jr .storeTimerAndData

.checkBelow77:
    cp $77
    jr nc, .checkBelow7c

    ld a, $1c
    ld hl, ProjectileBounceArc_2
    jr .storeTimerAndData

.checkBelow7c:
    cp $7c
    jr nc, .checkBelow81

    ld a, $18
    ld hl, ProjectileBounceArc_3
    jr .storeTimerAndData

.checkBelow81:
    cp $81
    jr nc, .checkBelow86

    ld a, $14
    ld hl, ProjectileBounceArc_4
    jr .storeTimerAndData

.checkBelow86:
    cp $86
    jr nc, .checkBelow8b

    ld a, $10
    ld hl, ProjectileBounceArc_5
    jr .storeTimerAndData

.checkBelow8b:
    cp $8b
    jr nc, .atOrAbove8b

    ld a, $0c
    ld hl, ProjectileBounceArc_6
    jr .storeTimerAndData

.atOrAbove8b:
    ld a, $08
    ld hl, ProjectileBounceArc_7

.storeTimerAndData:
    ld [wProjectileWork], a
    ld a, l
    ld [wProjectileWork + 5], a
    ld a, h
    ld [wProjectileWork + 6], a
    ret

; Updates the projectile in wProjectileWork. While its timer runs, it only moves it.
; When the timer ends it checks the 4 corners for a brick and bounces off one.
; Otherwise a grenade explodes and hits bricks, and a thrown ball becomes a ball in wBalls.
UpdateProjectile:
    ld a, [wProjectileWork]
    dec a
    ld [wProjectileWork], a
    jp nz, UpdateProjectile_Move

    ld a, [wProjectileWork + 2]
    ld c, a
    ld a, [wProjectileWork + 4]
    call Projectile_CheckBrick
    jp nz, UpdateProjectile_HitBrick

    ld a, [wProjectileWork + 2]
    add $07
    ld c, a
    ld a, [wProjectileWork + 4]
    call Projectile_CheckBrick
    jp nz, UpdateProjectile_HitBrick

    ld a, [wProjectileWork + 2]
    ld c, a
    ld a, [wProjectileWork + 4]
    add $07
    call Projectile_CheckBrick
    jp nz, UpdateProjectile_HitBrick

    ld a, [wProjectileWork + 2]
    add $07
    ld c, a
    ld a, [wProjectileWork + 4]
    add $07
    call Projectile_CheckBrick
    jp nz, UpdateProjectile_HitBrick

    ld a, [wProjectileWork + 8]
    bit 7, a
    jr z, .becomeBall

    ld a, $34
    ld [wGrenadeBlastTimer], a
    ld a, [wProjectileWork + 2]
    ld [wGrenadeBlastX], a
    ld c, a
    ld a, [wProjectileWork + 4]
    ld [wGrenadeBlastY], a
    call Projectile_HitBrick
    ld a, [wProjectileWork + 2]
    add $07
    ld c, a
    ld a, [wProjectileWork + 4]
    call Projectile_HitBrick
    ld a, [wProjectileWork + 2]
    ld c, a
    ld a, [wProjectileWork + 4]
    add $07
    call Projectile_HitBrick
    ld a, [wProjectileWork + 2]
    add $07
    ld c, a
    ld a, [wProjectileWork + 4]
    add $07
    call Projectile_HitBrick
    ret

.becomeBall:
    ld a, [wBlobThrowCount]
    dec a
    ld [wBlobThrowCount], a
    ld a, [wProjectileWork + 4]
    ld hl, wBalls
    ld a, [wBallCount]
    or a
    jr z, .writeBall

    ld de, $0007

.seekBallSlotLoop:
    add hl, de
    dec a
    jr nz, .seekBallSlotLoop

.writeBall:
    ld a, [wProjectileWork + 3]
    ld [hl+], a
    ld a, [wProjectileWork + 4]
    ld [hl+], a
    ld a, [wProjectileWork + 1]
    ld [hl+], a
    ld a, [wProjectileWork + 2]
    ld [hl+], a
    ld a, [wProjectileWork + 7]
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl], a
    ld a, [wBallCount]
    inc a
    ld [wBallCount], a
    ret

; Moves the thrown blob or grenade for one frame while its flight timer in wProjectileWork is still running. A = the timer after its decrement.
; Adds the velocity from BallVelocityTable to the position. Probes four sides for bricks and changes the direction for each side that is solid.
; Puts the position back on an axis that bounced, then writes the sprites to OAM.
UpdateProjectile_Move:
    ld e, a
    ld d, $00
    ld a, [wProjectileWork + 5]
    ld l, a
    ld a, [wProjectileWork + 6]
    ld h, a
    add hl, de
    ld e, [hl]
    ld hl, BallProjectileFrames
    ld a, [wProjectileWork + 8]
    bit 7, a
    jr z, .offsetTableChosen

    ld hl, GrenadeProjectileFrames

.offsetTableChosen:
    add hl, de
    ld d, h
    ld e, l
    push de
    ld a, [wProjectileWork + 7]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    ld de, BallVelocityTable
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [wProjectileWork + 1]
    ld [wProjectileOldXSub], a
    ld l, a
    ld a, [wProjectileWork + 2]
    ld [wProjectileOldX], a
    ld h, a
    add hl, bc
    ld a, l
    ld [wProjectileWork + 1], a
    ld a, h
    ld [wProjectileWork + 2], a
    ld a, [wProjectileWork + 3]
    ld [wProjectileOldYSub], a
    ld l, a
    ld a, [wProjectileWork + 4]
    ld [wProjectileOldY], a
    ld h, a
    add hl, de
    ld a, l
    ld [wProjectileWork + 3], a
    ld a, h
    ld [wProjectileWork + 4], a
    pop de
    xor a
    ld [wProjectileBouncedX], a
    ld [wProjectileBouncedY], a
    ld a, [de]
    inc de
    ld b, a
    ld a, [wProjectileWork + 2]
    add b
    ld [wProjectileWork + 2], a
    ld a, [de]
    inc de
    ld c, a
    ld a, [wProjectileWork + 4]
    add c
    ld [wProjectileWork + 4], a
    push bc
    ld a, [wProjectileWork + 2]
    ld c, a
    ld a, [wProjectileWork + 4]
    ld b, a
    ld a, [de]
    inc de
    add b
    call Projectile_CheckBrickKeepDE
    jr z, .checkRightSide

    ld a, [wProjectileWork + 7]
    ld l, a
    ld h, $00
    ld bc, BallReflectLeftTable
    add hl, bc
    ld a, [hl]
    ld [wProjectileWork + 7], a
    ld a, $01
    ld [wProjectileBouncedX], a

.checkRightSide:
    ld a, [wProjectileWork + 2]
    ld c, a
    ld a, [de]
    inc de
    add c
    ld c, a
    ld a, [wProjectileWork + 4]
    ld b, a
    ld a, [de]
    inc de
    add b
    call Projectile_CheckBrickKeepDE
    jr z, .checkTopSide

    ld a, [wProjectileWork + 7]
    ld l, a

    ld h, $00
    ld bc, BallReflectRightTable
    add hl, bc
    ld a, [hl]
    ld [wProjectileWork + 7], a
    ld a, $01
    ld [wProjectileBouncedX], a

.checkTopSide:
    ld a, [wProjectileWork + 2]
    ld c, a
    ld a, [de]
    inc de
    add c
    ld c, a
    ld a, [wProjectileWork + 4]
    call Projectile_CheckBrickKeepDE
    jr z, .checkBottomSide

    ld a, [wProjectileWork + 7]
    ld l, a
    ld h, $00
    ld bc, BallReflectTopTable
    add hl, bc
    ld a, [hl]
    ld [wProjectileWork + 7], a
    ld a, $01
    ld [wProjectileBouncedY], a

.checkBottomSide:
    ld a, [wProjectileWork + 2]
    ld c, a
    ld a, [de]
    inc de
    add c
    ld c, a
    ld a, [wProjectileWork + 4]
    ld b, a
    ld a, [de]
    inc de
    add b
    call Projectile_CheckBrickKeepDE
    jr z, .probesDone

    ld a, [wProjectileWork + 7]
    ld l, a
    ld h, $00
    ld bc, BallReflectBottomTable
    add hl, bc
    ld a, [hl]
    ld [wProjectileWork + 7], a
    ld a, $01

    ld [wProjectileBouncedY], a

.probesDone:
    pop bc
    ld a, [wProjectileWork + 2]
    sub b
    ld [wProjectileWork + 2], a
    ld a, [wProjectileWork + 4]
    sub c
    ld [wProjectileWork + 4], a
    ld a, [wProjectileBouncedX]
    or a
    jr z, .checkRestoreY

    ld a, [wProjectileOldXSub]
    ld [wProjectileWork + 1], a
    ld a, [wProjectileOldX]
    ld [wProjectileWork + 2], a

.checkRestoreY:
    ld a, [wProjectileBouncedY]
    or a
    jr z, .drawSprites

    ld a, [wProjectileOldYSub]
    ld [wProjectileWork + 3], a
    ld a, [wProjectileOldY]
    ld [wProjectileWork + 4], a

.drawSprites:
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld a, [de]
    inc de
    ld [hTemp], a
    ld b, a
    ld a, [wOamUsed]
    add b
    ld [wOamUsed], a
    ld a, [wProjectileWork + 4]
    ld b, a
    ld a, [wProjectileWork + 2]
    ld c, a

.spriteLoop:
    ld a, [de]
    inc de
    add b
    ld [hl+], a
    ld a, [de]
    inc de
    add c
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [hTemp]
    dec a
    ld [hTemp], a
    jr nz, .spriteLoop

    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ret

; Looks up the brick at A = y, C = x. Returns nz only if the brick type is $0f, and plays a sound then.
; An empty cell or any other brick type returns z. Keeps DE. Changes HL and BC.
; Called for each side probe in UpdateProjectile_Move.
Projectile_CheckBrickKeepDE:
    push de
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, wBrickMap - $30
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    pop de
    ret z

    cp $0f
    jr z, .brickIs0f

    xor a
    ret

.brickIs0f:
    ld a, $04
    call PlaySound
    ld a, $01
    or a
    ret

; Looks up the brick at A = y, C = x. Returns nz only if the brick type is $0e, and plays a sound then.
; An empty cell or any other brick type returns z. Changes DE and HL.
; Called for the four corners in UpdateProjectile when the flight timer reaches zero.
Projectile_CheckBrick:
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, wBrickMap - $30
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    ret z

    cp $0e
    jr z, .brickIs0e

    xor a
    ret

.brickIs0e:
    ld a, $04
    call PlaySound
    ld a, $01
    or a
    ret

; Hit the brick at A = y, C = x, if there is one.
Projectile_HitBrick:
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, wBrickMap - $30
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    ret z

    jp HitBrickWithBall

; Called once per frame on UFO levels. Moves the UFO across the screen in timed passes and drops a bomb at wUfoDropX.
; Draws the UFO while it flies and calls UfoHit when a shot touches it. Still updates the bomb after wUfoHits reaches 5.
UpdateUfo:
    ld a, [wUfoBombActive]
    or a
    call nz, UpdateUfoBomb
    ld a, [wUfoHits]
    cp $05
    ret z

    ld a, [wUfoFlying]
    or a
    jr nz, .flying

    ld a, [wUfoTickMask]
    ld b, a
    ld a, [wUfoTick]
    inc a
    ld [wUfoTick], a
    and b
    ret nz

    ld a, [wUfoWaitTimer]
    dec a
    ld [wUfoWaitTimer], a
    ret nz

    inc a
    ld [wUfoFlying], a
    ld a, [wUfoPassIndex]
    inc a
    ld [wUfoPassIndex], a
    and $07
    add a
    ld e, a
    ld d, $00
    ld hl, UfoPassTable
    add hl, de
    ld a, [hl+]
    ld [wUfoWaitTimer], a
    ld a, [hl+]
    or a
    jr nz, .passLeftward

    ld de, $0080
    ld h, $e0
    jr .storePassSetup

.passLeftward:
    ld de, $ff80
    ld h, $b0

.storePassSetup:
    ld a, e
    ld [wUfoSpeed], a
    ld a, d
    ld [wUfoSpeed + 1], a
    xor a
    ld [wUfoXSub], a
    ld a, h
    ld [wUfoX], a
    ld a, [hFrameCounter]
    cp $80
    jr c, .setDropX

    add $80

.setDropX:
    add $08
    ld [wUfoDropX], a
    ret

.flying:
    ld a, [wUfoXSub]
    ld l, a
    ld a, [wUfoX]
    ld h, a
    ld a, [wUfoSpeed]
    ld e, a
    ld a, [wUfoSpeed + 1]
    ld d, a
    add hl, de
    ld a, l
    ld [wUfoXSub], a
    ld a, h
    ld [wUfoX], a
    ld c, a
    ld a, [wUfoDropX]
    cp c
    jr nz, .checkPassEnd

    add $0a
    ld [wUfoBombX], a
    ld a, [wUfoHeight]
    add $10
    ld [wUfoBombY], a
    ld [wUfoBombStartY], a
    ld a, $01
    ld [wUfoBombActive], a
    ld a, $14
    call PlaySound

.checkPassEnd:
    ld a, d
    or a
    ld a, c
    jr nz, .movingLeft

    cp $b0
    jr nz, .drawUfo

    xor a
    jr .stopFlying

.movingLeft:
    cp $e0
    jr nz, .drawUfo

    xor a

.stopFlying:
    ld [wUfoFlying], a

.drawUfo:
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld a, [wUfoHeight]
    add $08
    ld b, a
    ld de, UfoSprites
    ld a, $05
    ld [hTemp], a

.spriteLoop:
    ld a, [de]
    inc de
    add b
    ld [hl+], a
    ld a, [de]
    inc de
    add c
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [hTemp]
    dec a
    ld [hTemp], a
    jr nz, .spriteLoop

    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    add $05
    ld [wOamUsed], a
    ld a, [wShotActive]
    or a
    jr z, .checkShot1

    ld a, [wShots]
    add $04
    ld c, a
    ld a, [wShots + 1]
    ld b, a
    ld a, [wUfoHeight]
    cp b
    jr nc, .checkShot1

    add $0f
    cp b
    jr c, .checkShot1

    ld a, [wUfoX]
    cp c
    jr nc, .checkShot1

    add $17
    cp c
    jr c, .checkShot1

    xor a
    ld [wUfoFlying], a
    ld a, [wPlasmaState]
    or a
    jr nz, .shot0HitUfo

    xor a
    ld [wShotActive], a
    ld a, [wShotActive + 1]
    or a
    jr nz, .shot0HitUfo

    ld a, [wShotActive + 2]
    or a
    jr nz, .shot0HitUfo

    ld a, [wShotActive + 3]
    or a
    jr nz, .shot0HitUfo

    ld a, [wShotActive + 4]
    or a
    jr nz, .shot0HitUfo

    ld a, [wShotActive + 5]
    or a
    jr nz, .shot0HitUfo

    ld [wShotCooldown], a

.shot0HitUfo:
    ld a, $15
    call PlaySound
    call UfoHit

.checkShot1:
    ld a, [wShotActive + 1]
    or a
    jr z, .checkShot2

    ld a, [wShots + 4]
    add $04
    ld c, a
    ld a, [wShots + 5]
    ld b, a
    ld a, [wUfoHeight]
    cp b
    jr nc, .checkShot2

    add $0f
    cp b
    jr c, .checkShot2

    ld a, [wUfoX]
    cp c
    jr nc, .checkShot2

    add $17
    cp c
    jr c, .checkShot2

    xor a
    ld [wUfoFlying], a
    ld a, [wPlasmaState]
    or a
    jr nz, .shot1HitUfo

    xor a
    ld [wShotActive + 1], a
    ld a, [wShotActive]
    or a
    jr nz, .shot1HitUfo

    ld a, [wShotActive + 2]
    or a
    jr nz, .shot1HitUfo

    ld a, [wShotActive + 3]
    or a
    jr nz, .shot1HitUfo

    ld a, [wShotActive + 4]
    or a
    jr nz, .shot1HitUfo

    ld a, [wShotActive + 5]
    or a
    jr nz, .shot1HitUfo

    ld [wShotCooldown], a

.shot1HitUfo:
    ld a, $15
    call PlaySound
    call UfoHit

.checkShot2:
    ld a, [wShotActive + 2]
    or a
    jr z, .checkShot3

    ld a, [wShots + 8]
    add $04
    ld c, a
    ld a, [wShots + 9]
    ld b, a
    ld a, [wUfoHeight]
    cp b
    jr nc, .checkShot3

    add $0f
    cp b
    jr c, .checkShot3

    ld a, [wUfoX]
    cp c
    jr nc, .checkShot3

    add $17
    cp c
    jr c, .checkShot3

    xor a
    ld [wUfoFlying], a
    ld [wShotActive + 2], a
    ld a, [wShotActive]
    or a
    jr nz, .shot2HitUfo

    ld a, [wShotActive + 1]
    or a
    jr nz, .shot2HitUfo

    ld a, [wShotActive + 3]
    or a
    jr nz, .shot2HitUfo

    ld a, [wShotActive + 4]
    or a
    jr nz, .shot2HitUfo

    ld a, [wShotActive + 5]
    or a
    jr nz, .shot2HitUfo

    ld [wShotCooldown], a

.shot2HitUfo:
    ld a, $15
    call PlaySound
    call UfoHit

.checkShot3:
    ld a, [wShotActive + 3]
    or a
    jr z, .checkShot4

    ld a, [wShots + 12]
    add $04
    ld c, a
    ld a, [wShots + 13]
    ld b, a
    ld a, [wUfoHeight]
    cp b
    jr nc, .checkShot4

    add $0f
    cp b
    jr c, .checkShot4

    ld a, [wUfoX]
    cp c
    jr nc, .checkShot4

    add $17
    cp c
    jr c, .checkShot4

    xor a
    ld [wUfoFlying], a
    ld [wShotActive + 3], a
    ld a, [wShotActive]
    or a
    jr nz, .shot3HitUfo

    ld a, [wShotActive + 1]
    or a
    jr nz, .shot3HitUfo

    ld a, [wShotActive + 2]
    or a
    jr nz, .shot3HitUfo

    ld a, [wShotActive + 4]
    or a
    jr nz, .shot3HitUfo

    ld a, [wShotActive + 5]
    or a
    jr nz, .shot3HitUfo

    ld [wShotCooldown], a

.shot3HitUfo:
    ld a, $15
    call PlaySound
    call UfoHit

.checkShot4:
    ld a, [wShotActive + 4]
    or a
    jr z, .checkShot5

    ld a, [wShots + 15]
    add $04
    ld c, a
    ld a, [wShots + 16]
    ld b, a
    ld a, [wUfoHeight]
    cp b
    jr nc, .checkShot5

    add $0f
    cp b
    jr c, .checkShot5

    ld a, [wUfoX]
    cp c
    jr nc, .checkShot5

    add $17
    cp c
    jr c, .checkShot5

    xor a
    ld [wUfoFlying], a
    ld [wShotActive + 4], a
    ld a, [wShotActive]
    or a
    jr nz, .shot4HitUfo

    ld a, [wShotActive + 1]
    or a
    jr nz, .shot4HitUfo

    ld a, [wShotActive + 2]
    or a
    jr nz, .shot4HitUfo

    ld a, [wShotActive + 3]
    or a
    jr nz, .shot4HitUfo

    ld a, [wShotActive + 5]
    or a
    jr nz, .shot4HitUfo

    ld [wShotCooldown], a

.shot4HitUfo:
    ld a, $15
    call PlaySound
    call UfoHit

.checkShot5:
    ld a, [wShotActive + 5]
    or a
    ret z

    ld a, [wShots + 18]
    add $04
    ld c, a
    ld a, [wShots + 19]
    ld b, a
    ld a, [wUfoHeight]
    cp b

    ret nc

    add $0f
    cp b
    ret c

    ld a, [wUfoX]
    cp c
    ret nc

    add $17
    cp c
    ret c

    xor a
    ld [wUfoFlying], a
    ld [wShotActive + 5], a
    ld a, [wShotActive]
    or a
    jr nz, .shot5HitUfo

    ld a, [wShotActive + 1]
    or a
    jr nz, .shot5HitUfo

    ld a, [wShotActive + 2]
    or a
    jr nz, .shot5HitUfo

    ld a, [wShotActive + 3]
    or a
    jr nz, .shot5HitUfo

    ld a, [wShotActive + 4]

    or a
    jr nz, .shot5HitUfo

    ld [wShotCooldown], a

.shot5HitUfo:
    ld a, $15
    call PlaySound
    call UfoHit
    ret

; The ball hit the UFO: count the hit, show the score effect and add the score from UfoHitScores.
UfoHit:
    ld hl, UfoHitScores
    ld a, [wUfoHits]
    inc a
    ld [wUfoHits], a
    add a
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [wUfoHeight]
    add $04
    ld d, a
    ld a, [wUfoX]
    add $04
    ld b, a
    ld a, [hl+]
    push hl
    ld e, $01
    call SpawnPickupEffect
    pop hl
    ld b, [hl]
    call AddScore
    ret

; Move the bomb dropped by the UFO. A hit on the bat costs a life.
UpdateUfoBomb:
    ld d, $00
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld a, [wUfoBombActive]
    inc a
    ld [wUfoBombActive], a
    cp $05
    jr nc, .bombFalling

    inc d
    ld a, [wUfoBombStartY]
    ld [hl+], a
    ld a, [wUfoBombX]
    ld [hl+], a
    ld a, $55
    ld [hl+], a
    ld a, $44
    ld [hl+], a
    jr .storeOamAndCheckBat

.bombFalling:
    ld a, [wUfoBombY]
    inc a
    ld [wUfoBombY], a
    cp $a8
    jr c, .drawFallingBomb

    xor a
    ld [wUfoBombActive], a

.drawFallingBomb:
    ld b, a
    sub $08
    ld [hl+], a
    ld a, [wUfoBombX]
    ld [hl+], a
    ld c, a
    ld a, $54
    ld [hl+], a
    ld a, $04
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, $51
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    inc d
    inc d

.storeOamAndCheckBat:
    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    add d
    ld [wOamUsed], a
    ld a, [wBatExplosionTimer]
    or a
    ret nz

    ld a, [wUfoBombX]
    add $04
    ld c, a
    ld a, [wUfoBombY]
    add $08
    ld b, a
    ld a, [wBatY]
    sub $08
    cp b
    ret nc

    add $04
    cp b
    ret c

    ld a, [wBatX]
    sub $08
    cp c
    ret nc

    ld e, a
    ld a, [wBatWidth]
    add e
    cp c
    ret c

    ld a, [hStateTimer]
    or a
    ret nz

    ld a, $28
    ld [wBatExplosionTimer], a
    ld a, [wBatY]
    sub $08
    ld [wBatExplosionY], a
    ld b, $f8
    ld a, [wBatWidth]
    cp $20
    jr z, .setExplosionX

    ld b, $fc

.setExplosionX:
    ld a, [wBatX]
    add b
    ld [wBatExplosionX], a
    xor a
    ld [wWeaponFlag], a
    xor a
    ld [wUfoBombActive], a
    ld a, $0a
    call PlaySound
    ld a, [wLives]
    dec a
    ld [wLives], a
    or a
    jr nz, .livesRemain

    ld a, $03
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ret

.livesRemain:
    ld a, $01
    ld [hLifeLostTimer], a
    ret

; Test a ball point against the UFO. The UFO disappears after 5 hits.
CheckUfoHit:
    ld a, [wUfoFlying]
    or a
    ret z

    ld a, [wUfoHeight]
    cp b
    jr nc, .noHit

    add $0f
    cp b
    jr c, .noHit

    ld a, [wUfoX]
    cp c
    jr nc, .noHit

    add $17
    cp c
    jr c, .noHit

    xor a
    ld [wUfoFlying], a
    push bc
    call UfoHit
    pop bc
    ld a, $15
    call PlaySound
    ld a, $01
    or a
    ret

.noHit:
    xor a
    ret

; The blob catches a ball that touches it: the ball is removed and the blob starts its throw.
; B = y, C = x of the ball point. Nothing happens while Ninja or Ghost is active.
CheckBlobCatch:
    ld a, [wBlobActive]
    or a
    ret z

    ld a, [wNinjaActive]
    or a
    ret nz

    ld a, [wGhostActive]
    or a
    ret nz

    ld a, [wBlobThrowing]
    or a
    ret nz

    ld a, [wBlobY]
    cp b
    jr nc, .returnZero

    add $0f
    cp b
    jr c, .returnZero

    ld a, [wBlobX]
    cp c
    jr nc, .returnZero

    add $0f
    cp c
    jr c, .returnZero

    xor a
    ld [wBlobFrame], a
    ld [wBlobFrameTick], a
    inc a
    ld [wBlobThrowing], a
    ld [wRemoveBall], a
    ld a, $0d
    call PlaySound

.returnZero:
    xor a
    ret

; Clear the shots and the weapon flag.
ResetShots:
    xor a
    ld [wWeaponFlag], a
    ld [wShotActive], a
    ld [wShotActive + 1], a
    ld [wShotActive + 2], a
    ld [wShotActive + 3], a
    ld [wShotActive + 4], a
    ld [wShotActive + 5], a
    ld [wShotCooldown], a
    ld [wRocketLaserBat], a
    ld [wPlasmaState], a
    ld [wLaserBat], a
    ld [wGrenadeCount], a
    ld [wGrenadeDelay], a
    ld [wGrenadePower], a
    ld [wGrenadePower + 1], a
    ld [wFireLatch], a
    ret

; Update the rocket, laser, grenade and plasma shots.
UpdateShots:
    ld a, [wShotActive]
    or a
    jp nz, UpdateShot0

; Updates shot 1 if wShotActive + 1 is set, then continues with shot 2.
; UpdateShot0 jumps here when it finishes.
UpdateShots_Shot1:
    ld a, [wShotActive + 1]
    or a
    jp nz, UpdateShot1

; Updates shot 2 if wShotActive + 2 is set, then continues with shot 3.
; UpdateShot1 jumps here when it finishes.
UpdateShots_Shot2:
    ld a, [wShotActive + 2]
    or a
    jp nz, UpdateShot2

; Updates shot 3 if wShotActive + 3 is set, then continues with shot 4.
; UpdateShot2 jumps here when it finishes.
UpdateShots_Shot3:
    ld a, [wShotActive + 3]
    or a
    jp nz, UpdateShot3

; Updates shot 4 if wShotActive + 4 is set, then continues with shot 5.
; UpdateShot3 jumps here when it finishes. One exit path each in UpdateShot4 and UpdateShot5 also lands here.
UpdateShots_Shot4:
    ld a, [wShotActive + 4]
    or a
    jp nz, UpdateShot4

; Updates shot 5 if wShotActive + 5 is set, then continues with Shots_HandleFire.
; UpdateShot4 jumps here when it finishes.
UpdateShots_Shot5:
    ld a, [wShotActive + 5]
    or a
    jp nz, UpdateShot5

; Fire the current weapon. A grenade is charged while A is held and thrown when A is released;
; left or right at that moment sets its direction.
Shots_HandleFire:
    ld a, [wWeaponFlag]
    or a
    ret z

    ld a, [wGrenadeCount]
    ld b, a
    or a
    jp z, Shots_FireRocketLaserPlasma

    ld a, [wGrenadeDelay]
    or a
    ret nz

    ld a, [hJoypad]
    bit 4, a
    jr z, .fireReleased

    ld de, $0020
    ld a, [wGrenadePower]
    ld l, a
    ld a, [wGrenadePower + 1]
    ld h, a
    add hl, de
    ld a, l
    ld [wGrenadePower], a
    ld a, h
    ld [wGrenadePower + 1], a
    cp $0b
    ret nz

    dec a
    ld [wGrenadePower + 1], a
    ret

.fireReleased:
    ld a, [wGrenadePower]
    ld c, a
    ld a, [wGrenadePower + 1]
    add c
    or a
    ret z

    ld a, b
    dec a
    ld [wGrenadeCount], a
    jr nz, .showGrenadeText

    ld [wWeaponFlag], a

.showGrenadeText:
    push af
    ld a, [wLangGrenadeTexts]
    ld l, a
    ld a, [wLangGrenadeTexts + 1]
    ld h, a
    pop af
    and $07
    add a
    ld e, a
    ld d, $00
    add hl, de
    ld a, $04
    ld [wGrenadeDelay], a
    call ShowMessage
    ld a, [wBatX]
    add $04
    ld b, a
    ld a, [wBatY]
    sub $0c
    ld c, a
    ld l, $00
    ld a, [hJoypad]
    bit 0, a
    jr z, .checkDirBit1

    ld l, $1e

.checkDirBit1:
    bit 1, a
    jr z, .directionSet

    ld l, $02

.directionSet:
    ld h, $80
    push hl
    ld a, [wGrenadePower + 1]
    add a
    add a
    ld l, a
    ld h, $00
    ld de, GrenadeThrowTable
    add hl, de
    xor a
    ld [wGrenadePower], a
    ld [wGrenadePower + 1], a
    ld a, [hl+]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    pop hl
    call SpawnProjectile
    ld a, $10
    call PlaySound
    ret

; Called by Shots_HandleFire when wGrenadeCount is 0. With wRocketLaserBat clear, a press of A fires plasma if shot slots 0 and 1 are free.
; Otherwise it continues with Shots_FireRocketOrLaser.
Shots_FireRocketLaserPlasma:
    ld a, [wRocketLaserBat]
    or a
    jr nz, Shots_FireRocketOrLaser

    ld a, [hJoypad]
    bit 4, a
    ret z

    ld a, [wShotActive]
    or a
    ret nz

    ld a, [wShotActive + 1]
    or a
    ret nz

    ld a, $02
    ld [wPlasmaState], a
    xor a
    ld [wWeaponFlag], a
    ld a, [wBatX]
    sub $0c
    add $08
    ld [wShots], a
    add $10
    ld [wShots + 4], a
    ld a, $88
    ld [wShots + 1], a
    ld [wShots + 2], a
    ld [wShots + 5], a
    ld [wShots + 6], a
    ld a, $01
    ld [wShotActive], a
    ld [wShotActive + 1], a
    ld a, $11
    call PlaySound
    ret

; Fires a rocket or a laser from the bat when A is pressed. Called once per frame while a Rocket or Laser bat is active.
; It waits for wShotCooldown to run out and needs a fresh A press (wFireLatch). It uses the first free slot in wShotActive.
; Slots 0 to 2 serve both bats. Slots 3 to 5 are used only with the Laser bat. The shot starts at wBatX and a sound plays.
Shots_FireRocketOrLaser:
    ld a, [wShotCooldown]
    or a
    jr z, .cooldownOver

    dec a
    ld [wShotCooldown], a
    ret

.cooldownOver:
    ld a, [hJoypad]
    bit 4, a
    jr nz, .firePressed

    xor a
    ld [wFireLatch], a
    ret

.firePressed:
    ld a, [wFireLatch]
    or a
    ret nz

    ld a, [wShotActive]
    or a
    jr nz, .trySlot1

    ld [wShots + 3], a
    ld b, $12
    ld a, [wLaserBat]
    or a
    jr z, .fireSlot0

    ld [wShots + 3], a
    ld b, $13

.fireSlot0:
    ld a, b
    call PlaySound
    ld a, [wShotReloadDelay]
    ld [wFireLatch], a
    ld [wShotCooldown], a
    ld a, [wBatX]
    sub $0c
    add $10
    ld [wShots], a
    ld a, $88
    ld [wShots + 1], a
    ld [wShots + 2], a
    ld a, $01
    ld [wShotActive], a
    ret

.trySlot1:
    ld a, [wShotActive + 1]
    or a
    jr nz, .trySlot2

    ld [wShots + 7], a
    ld b, $12
    ld a, [wLaserBat]
    or a
    jr z, .fireSlot1

    ld [wShots + 7], a
    ld b, $13

.fireSlot1:
    ld a, b
    call PlaySound
    ld a, [wShotReloadDelay]
    ld [wFireLatch], a
    ld [wShotCooldown], a
    ld a, [wBatX]
    sub $0c
    add $10
    ld [wShots + 4], a
    ld a, $88
    ld [wShots + 5], a
    ld [wShots + 6], a
    ld a, $01
    ld [wShotActive + 1], a
    ret

.trySlot2:
    ld a, [wShotActive + 2]
    or a
    jr nz, .tryLaserSlot3

    ld [wShots + 11], a
    ld b, $12
    ld a, [wLaserBat]
    or a
    jr z, .fireSlot2

    ld [wShots + 11], a
    ld b, $13

.fireSlot2:
    ld a, b
    call PlaySound
    ld a, [wShotReloadDelay]
    ld [wFireLatch], a
    ld [wShotCooldown], a
    ld a, [wBatX]
    sub $0c
    add $10
    ld [wShots + 8], a
    ld a, $88
    ld [wShots + 9], a
    ld [wShots + 10], a
    ld a, $01
    ld [wShotActive + 2], a
    ret

.tryLaserSlot3:
    ld a, [wLaserBat]
    or a
    ret z

    ld a, [wShotActive + 3]
    or a
    jr nz, .tryLaserSlot4

    ld a, $13
    call PlaySound
    ld a, [wShotReloadDelay]
    ld [wFireLatch], a
    ld [wShotCooldown], a
    ld a, [wBatX]
    sub $0c
    add $10
    ld [wShots + 12], a
    ld a, $88
    ld [wShots + 13], a
    ld [wShots + 14], a
    ld a, $01
    ld [wShotActive + 3], a
    ret

.tryLaserSlot4:
    ld a, [wShotActive + 4]
    or a
    jr nz, .tryLaserSlot5

    ld a, $13
    call PlaySound
    ld a, [wShotReloadDelay]
    ld [wFireLatch], a
    ld [wShotCooldown], a
    ld a, [wBatX]
    sub $0c
    add $10
    ld [wShots + 15], a
    ld a, $88
    ld [wShots + 16], a
    ld [wShots + 17], a
    ld a, $01
    ld [wShotActive + 4], a
    ret

.tryLaserSlot5:
    ld a, [wShotActive + 5]
    or a
    ret nz

    ld a, $13
    call PlaySound
    ld a, [wShotReloadDelay]
    ld [wFireLatch], a
    ld [wShotCooldown], a
    ld a, [wBatX]
    sub $0c
    add $10
    ld [wShots + 18], a
    ld a, $88
    ld [wShots + 19], a
    ld [wShots + 20], a
    ld a, $01
    ld [wShotActive + 5], a
    ret

; Shot slots 0 and 1 hit bricks with HitBrickWithShot.
UpdateShot0:
    ld d, $00
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld e, $01
    ld a, [wPlasmaState]
    cp $02
    jr z, .plasmaSprite

    ld bc, ShotSprite_Rocket
    ld a, [wShots + 3]
    or a
    jr z, .spriteChosen

    ld bc, ShotSprite_Laser
    ld e, $02
    jr .spriteChosen

.plasmaSprite:
    ld bc, ShotSprite_Plasma
    ld a, [wShots]
    ld [wPlasmaShotX], a

.spriteChosen:
    ld a, [wShotActive]
    inc a
    ld [wShotActive], a
    cp $05
    jr nc, .moveShotUp

    inc d
    ld a, [wShots + 2]
    ld [hl+], a
    ld a, [wShots]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    jr .storeOamAndCheckBrick

.moveShotUp:
    inc bc
    inc bc
    ld a, [wShots + 1]
    sub e
    ld [wShots + 1], a
    cp $18
    jr z, .removeShot

    ld [hl+], a
    ld a, [wShots]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [wShots + 1]
    add $08
    ld [hl+], a
    ld a, [wShots]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    inc d
    inc d

.storeOamAndCheckBrick:
    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    add d
    ld [wOamUsed], a
    ld a, [wShots]
    add $04
    ld c, a
    ld a, [wShots + 1]
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, wBrickMap - $30
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    jp z, UpdateShots_Shot1

    cp $0f
    jp z, UpdateShots_Shot1

    cp $0e
    jr z, .removeShot

    call HitBrickWithShot
    ld a, [wPlasmaState]
    cp $02
    jp z, UpdateShots_Shot1

.removeShot:
    ld a, [wPlasmaState]
    or a
    jr z, .clearShotActive

    ld a, [wShotActive + 1]
    or a
    jr nz, .clearShotActive

    xor a
    ld [wPlasmaState], a

.clearShotActive:
    xor a
    ld [wShotActive], a
    ld a, [wShotActive + 1]
    or a
    jp nz, UpdateShots_Shot1

    ld a, [wShotActive + 2]
    or a
    jp nz, UpdateShots_Shot1

    ld a, [wShotActive + 3]
    or a
    jp nz, UpdateShots_Shot1

    ld a, [wShotActive + 4]
    or a
    jp nz, UpdateShots_Shot1

    ld a, [wShotActive + 5]
    or a
    jp nz, UpdateShots_Shot1

    ld [wShotCooldown], a
    jp UpdateShots_Shot1

; Updates shot slot 1 while it is in flight. Called once per frame from the shot update chain when wShotActive + 1 is not 0.
; It writes the shot sprite to OAM and moves it up, 1 pixel for a rocket and 2 for a laser. It then checks the brick under it and calls HitBrickWithShot.
; The shot ends at the top of the field or on an unbreakable brick. A plasma shot keeps flying through bricks. The next slot is updated afterwards.
UpdateShot1:
    ld d, $00
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld e, $01
    ld a, [wPlasmaState]
    cp $02
    jr z, .usePlasmaSprite

    ld bc, ShotSprite_Rocket
    ld a, [wShots + 7]
    or a
    jr z, .spriteChosen

    ld bc, ShotSprite_Laser
    ld e, $02
    jr .spriteChosen

.usePlasmaSprite:
    ld bc, ShotSprite_Plasma
    ld a, [wShots + 4]
    ld [wPlasmaShotX], a

.spriteChosen:
    ld a, [wShotActive + 1]
    inc a
    ld [wShotActive + 1], a
    cp $05
    jr nc, .flying

    inc d
    ld a, [wShots + 6]
    ld [hl+], a
    ld a, [wShots + 4]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    jr .checkBrick

.flying:
    inc bc
    inc bc
    ld a, [wShots + 5]
    sub e
    ld [wShots + 5], a
    cp $18
    jr z, .endShot

    ld [hl+], a
    ld a, [wShots + 4]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [wShots + 5]
    add $08
    ld [hl+], a
    ld a, [wShots + 4]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    inc d
    inc d

.checkBrick:
    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    add d
    ld [wOamUsed], a
    ld a, [wShots + 4]
    add $04
    ld c, a
    ld a, [wShots + 5]
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, wBrickMap - $30
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    jp z, UpdateShots_Shot2

    cp $0f
    jp z, UpdateShots_Shot2

    cp $0e
    jr z, .endShot

    call HitBrickWithShot
    ld a, [wPlasmaState]
    cp $02
    jp z, UpdateShots_Shot2

.endShot:
    ld a, [wPlasmaState]
    or a
    jr z, .deactivate

    ld a, [wShotActive]
    or a
    jr nz, .deactivate

    xor a
    ld [wPlasmaState], a

.deactivate:
    xor a
    ld [wShotActive + 1], a
    ld a, [wShotActive]
    or a
    jp nz, UpdateShots_Shot2

    ld a, [wShotActive + 2]
    or a
    jp nz, UpdateShots_Shot2

    ld a, [wShotActive + 3]
    or a
    jp nz, UpdateShots_Shot2

    ld a, [wShotActive + 4]
    or a
    jp nz, UpdateShots_Shot2

    ld a, [wShotActive + 5]
    or a
    jp nz, UpdateShots_Shot2

    ld [wShotCooldown], a
    jp UpdateShots_Shot2

; Shot slots 2 to 5 hit bricks with HitBrickWithBall.
UpdateShot2:
    ld d, $00
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld bc, ShotSprite_Rocket
    ld e, $01
    ld a, [wShots + 11]
    or a
    jr z, .spriteChosen

    ld bc, ShotSprite_Laser
    ld e, $02

.spriteChosen:
    ld a, [wShotActive + 2]
    inc a
    ld [wShotActive + 2], a
    cp $05
    jr nc, .flying

    inc d
    ld a, [wShots + 10]
    ld [hl+], a
    ld a, [wShots + 8]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    jr .checkBrick

.flying:
    inc bc
    inc bc
    ld a, [wShots + 9]
    sub e
    ld [wShots + 9], a
    cp $18
    jr z, .deactivate

    ld [hl+], a
    ld a, [wShots + 8]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [wShots + 9]
    add $08
    ld [hl+], a
    ld a, [wShots + 8]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    inc d
    inc d

.checkBrick:
    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    add d
    ld [wOamUsed], a
    ld a, [wShots + 8]
    add $04
    ld c, a
    ld a, [wShots + 9]
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, wBrickMap - $30
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    jp z, UpdateShots_Shot3

    cp $0f
    jp z, UpdateShots_Shot3

    cp $0e
    jr z, .deactivate

    call HitBrickWithBall

.deactivate:
    xor a
    ld [wShotActive + 2], a
    ld a, [wShotActive]
    or a
    jp nz, UpdateShots_Shot3

    ld a, [wShotActive + 1]
    or a
    jp nz, UpdateShots_Shot3

    ld a, [wShotActive + 3]
    or a
    jp nz, UpdateShots_Shot3

    ld a, [wShotActive + 4]
    or a
    jp nz, UpdateShots_Shot3

    ld a, [wShotActive + 5]
    or a
    jp nz, UpdateShots_Shot3

    ld [wShotCooldown], a
    jp UpdateShots_Shot3

; Updates shot slot 3, which is only used by the Laser bat. Called once per frame from the shot update chain when wShotActive + 3 is not 0.
; It writes the laser sprite to OAM and moves it up 2 pixels. It then checks the brick under it and calls HitBrickWithBall.
; The shot ends at the top of the field, on an unbreakable brick or after a hit. The next slot is updated afterwards.
UpdateShot3:
    ld d, $00
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld bc, ShotSprite_Laser
    ld a, [wShotActive + 3]
    inc a
    ld [wShotActive + 3], a
    cp $05
    jr nc, .flying

    inc d
    ld a, [wShots + 14]
    ld [hl+], a
    ld a, [wShots + 12]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    jr .checkBrick

.flying:
    inc bc
    inc bc
    ld a, [wShots + 13]
    sub $02
    ld [wShots + 13], a
    cp $18
    jr z, .deactivate

    ld [hl+], a
    ld a, [wShots + 12]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [wShots + 13]
    add $08
    ld [hl+], a
    ld a, [wShots + 12]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    inc d
    inc d

.checkBrick:
    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    add d
    ld [wOamUsed], a
    ld a, [wShots + 12]
    add $04
    ld c, a
    ld a, [wShots + 13]
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, wBrickMap - $30
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    jp z, UpdateShots_Shot4

    cp $0f
    jp z, UpdateShots_Shot4

    cp $0e
    jr z, .deactivate

    call HitBrickWithBall

.deactivate:
    xor a
    ld [wShotActive + 3], a
    ld a, [wShotActive]
    or a
    jp nz, UpdateShots_Shot4

    ld a, [wShotActive + 1]
    or a
    jp nz, UpdateShots_Shot4

    ld a, [wShotActive + 2]
    or a
    jp nz, UpdateShots_Shot4

    ld a, [wShotActive + 4]
    or a
    jp nz, UpdateShots_Shot4

    ld a, [wShotActive + 5]
    or a
    jp nz, UpdateShots_Shot4

    ld [wShotCooldown], a
    jp UpdateShots_Shot4

; Updates shot slot 4, which is only used by the Laser bat. Called once per frame from the shot update chain when wShotActive + 4 is not 0.
; It writes the laser sprite to OAM and moves it up 2 pixels. It then checks the brick under it and calls HitBrickWithBall.
; The shot ends at the top of the field, on an unbreakable brick or after a hit. The next slot is updated afterwards.
UpdateShot4:
    ld d, $00
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld bc, ShotSprite_Laser
    ld a, [wShotActive + 4]
    inc a
    ld [wShotActive + 4], a
    cp $05
    jr nc, .flying

    inc d
    ld a, [wShots + 17]
    ld [hl+], a
    ld a, [wShots + 15]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    jr .checkBrick

.flying:
    inc bc
    inc bc
    ld a, [wShots + 16]
    sub $02
    ld [wShots + 16], a
    cp $18
    jr z, .deactivate

    ld [hl+], a
    ld a, [wShots + 15]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [wShots + 16]
    add $08
    ld [hl+], a
    ld a, [wShots + 15]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    inc d
    inc d

.checkBrick:
    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    add d
    ld [wOamUsed], a
    ld a, [wShots + 15]
    add $04
    ld c, a
    ld a, [wShots + 16]
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, wBrickMap - $30
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    jp z, UpdateShots_Shot5

    cp $0f
    jp z, UpdateShots_Shot5

    cp $0e
    jr z, .deactivate

    call HitBrickWithBall

.deactivate:
    xor a
    ld [wShotActive + 4], a
    ld a, [wShotActive]
    or a
    jp nz, UpdateShots_Shot5

    ld a, [wShotActive + 1]
    or a
    jp nz, UpdateShots_Shot5

    ld a, [wShotActive + 2]
    or a
    jp nz, UpdateShots_Shot5

    ld a, [wShotActive + 3]
    or a
    jp nz, UpdateShots_Shot5

    ld a, [wShotActive + 5]
    or a
    jp nz, UpdateShots_Shot5

    ld [wShotCooldown], a
    jp UpdateShots_Shot4

; Updates the sixth laser shot (wShotActive + 5) once per frame while it is active.
; It stays at the paddle for its first frames, then moves up 2 pixels a frame as a two-part sprite.
; It ends at the top of the field or at a brick cell, which is hit with HitBrickWithBall. Clears wShotCooldown when no shot is left.
UpdateShot5:
    ld d, $00
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld bc, ShotSprite_Laser
    ld a, [wShotActive + 5]
    inc a
    ld [wShotActive + 5], a
    cp $05
    jr nc, .flying

    inc d
    ld a, [wShots + 20]
    ld [hl+], a
    ld a, [wShots + 18]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    jr .checkBrick

.flying:
    inc bc
    inc bc
    ld a, [wShots + 19]
    sub $02
    ld [wShots + 19], a
    cp $18
    jr z, .deactivate

    ld [hl+], a
    ld a, [wShots + 18]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [wShots + 19]
    add $08
    ld [hl+], a
    ld a, [wShots + 18]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    inc d
    inc d

.checkBrick:
    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    add d
    ld [wOamUsed], a
    ld a, [wShots + 18]
    add $04
    ld c, a
    ld a, [wShots + 19]
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, wBrickMap - $30
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    jp z, Shots_HandleFire

    cp $0f
    jp z, Shots_HandleFire

    cp $0e
    jr z, .deactivate

    call HitBrickWithBall

.deactivate:
    xor a
    ld [wShotActive + 5], a
    ld a, [wShotActive]
    or a
    jp nz, Shots_HandleFire

    ld a, [wShotActive + 1]
    or a
    jp nz, Shots_HandleFire

    ld a, [wShotActive + 2]
    or a
    jp nz, Shots_HandleFire

    ld a, [wShotActive + 3]
    or a
    jp nz, Shots_HandleFire

    ld a, [wShotActive + 4]
    or a
    jp nz, Shots_HandleFire

    ld [wShotCooldown], a
    jp UpdateShots_Shot4

; Sets up the pause screen when the pause state starts.
; Loads the pause palettes, graphics and tilemaps (tiles and attributes) and draws the pause text for the current language.
; Sets wLives to 9 if wCheatLivesRefill is set.
StateInit_Pause:
    ld hl, VBlank
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    xor a
    ld [hPaletteMode], a
    ld a, $01
    ld [hInterruptEnable], a
    xor a
    ld [wLevelSweepPending], a
    ldh [rSCX], a
    ld de, Palettes_Pause
    call LoadPalettes
    ld a, $0e
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    ld hl, Gfx_Pause_00e_48c1
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, Gfx_Pause_00e_48c1 + $800
    ld de, $8800
    ld bc, $0340
    call DataTransfer
    xor a
    ld de, $9c00
    ld hl, Tilemap_Pause_00e_62f9
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    xor a
    ldh [rVBK], a
    ld hl, Gfx_Pause_00e_48c1 + $b40
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, Gfx_Pause_00e_48c1 + $1340
    ld de, $8800
    ld bc, $0590
    call DataTransfer
    xor a
    ld de, $9c00
    ld hl, Tilemap_Pause_00e_6191
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    ld a, [wLangTextPause]
    ld l, a
    ld a, [wLangTextPause + 1]
    ld h, a
    call DrawString
    ld a, $01
    call ChangeROMBank
    ld a, [wCheatLivesRefill]
    or a
    jr z, .skipLivesRefill

    ld a, $09
    ld [wLives], a

.skipLivesRefill:
    ret

; Sets up the developer logos screen at start-up and starts hLogoTimer.
; Loads its palettes, tilemaps and graphics and clears wLevelSweepPending.
; Falls through into ClearCheatFlags.
StateInit_DeveloperLogos:
    ld a, $46
    ld [hLogoTimer], a
    ld hl, VBlank
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    xor a
    ld [hPaletteMode], a
    ld a, $01
    ld [hInterruptEnable], a
    xor a
    ldh [rSCX], a
    ld de, Palettes_DeveloperLogos
    call LoadPalettes
    ld a, $02
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, Tilemap_DeveloperLogos_002_7df4
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    xor a
    ldh [rVBK], a
    ld hl, Gfx_MainMenu_002_6edc + $4c0
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, Gfx_MainMenu_002_6edc + $cc0
    ld de, $8800
    ld bc, $00f0
    call DataTransfer
    xor a
    ld [wLevelSweepPending], a
    ld de, $9800
    ld hl, Tilemap_DeveloperLogos_002_7c8c
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    ld a, $01
    call ChangeROMBank

; Sets all four cheat flags to 0: lives refill, level skip, photo background and show version.
; Runs at the end of the developer logos set-up, so every start-up begins with the cheats off.
ClearCheatFlags:
    ld a, $00
    ld [wCheatLivesRefill], a
    ld a, $00
    ld [wCheatLevelSkip], a
    ld a, $00
    ld [wCheatPhotoBackground], a
    ld a, $00
    ld [wCheatShowVersion], a
    ret

; Sets up the publisher logo screen and starts hLogoTimer.
; Loads its palettes, tilemaps and graphics, and sets hPaletteMode to 1.
StateInit_PublisherLogo:
    ld a, $46
    ld [hLogoTimer], a
    ld hl, VBlank
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    ld a, $01
    ld [hPaletteMode], a
    ld [hLycStart], a
    ld a, $01
    ld [hInterruptEnable], a
    xor a
    ldh [rSCX], a
    ld de, Palettes_PublisherLogo
    call LoadPalettes
    ld a, $03
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, Tilemap_PublisherLogo_003_5418
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    xor a
    ldh [rVBK], a
    ld hl, Gfx_PublisherLogo_003_4a20
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, Gfx_PublisherLogo_003_5220
    ld de, $8800
    ld bc, $0090
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, Tilemap_PublisherLogo_003_52b0
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    ld a, $01
    call ChangeROMBank
    ret

; Called once per frame while the publisher logo is shown.
; Counts hLogoTimer down. At 0 it sets hGameState to 6 (developer logos) and hStateTimer to 1.
PublisherLogo_Update:
    ld a, [hLogoTimer]
    or a
    jr z, .timerExpired

    dec a
    ld [hLogoTimer], a
    ret

.timerExpired:
    ld a, $06
    ld [hGameState], a
    ld a, $01
    ld [hStateTimer], a
    ret

; Sets up the credits screen. Starts the credits music, installs VBlank_Credits and loads the credits graphics.
; Clears the background map, picks the credits text for the current language and sets wCreditsRowColour to 0 and wCreditsScrollDone to $ff.
StateInit_Credits:
    ld e, $09
    call PlayMusic
    ld hl, VBlank_Credits
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    xor a
    ld [hLycStart], a
    ld a, $03
    ld [hInterruptEnable], a
    ld a, $80
    ld [wRasterObjPaletteIndex], a
    xor a
    ld [wLevelSweepPending], a
    ld a, $02
    ld [hPaletteMode], a
    ld hl, $9800
    call ClearTileMap
    ld a, $05
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ldh [rVBK], a
    ld hl, Gfx_Credits_005_650c
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, Gfx_Credits_005_650c + $800
    ld de, $8800
    ld bc, $0500
    call DataTransfer
    call SelectCreditsText
    ld a, $01
    call ChangeROMBank
    xor a
    ld [wCreditsRowColour], a
    dec a
    ld [wCreditsScrollDone], a
    ret

; Point the credits scroller at the list for the chosen language.
SelectCreditsText:
    ld hl, Credits_English
    ld a, [wLanguage]
    or a
    jr z, .storeTextPtr

    ld hl, Credits_Spanish
    dec a
    jr z, .storeTextPtr

    ld hl, Credits_French
    dec a
    jr z, .storeTextPtr

    ld hl, Credits_German
    dec a
    jr z, .storeTextPtr

    ld hl, Credits_Italian

.storeTextPtr:
    ld a, l
    ld [wCreditsTextPtr], a
    ld [wCreditsTextStart], a
    ld a, h
    ld [wCreditsTextPtr + 1], a
    ld [wCreditsTextStart + 1], a
    xor a
    ld [wCreditsScrollY], a
    ld a, $9a
    ld [wCreditsRowAddress + 1], a
    ld a, $60
    ld [wCreditsRowAddress], a
    ret

; Called during the credits whenever wCreditsScrollDone is not $ff. Applies wCreditsScrollY to rSCY.
; On each new 8 pixel row it copies the next 20 tile line of credits text to the background map at wCreditsRowAddress.
; A text line starting with 0 gives a blank row. The end marker $ff plays a sound, sets hGameState to 1 and restarts the text.
UpdateCreditsScroll:
    ld a, [wCreditsScrollDone]
    inc a
    ret z

    ld a, $ff
    ld [wCreditsScrollDone], a
    ld a, [wCreditsScrollY]
    ldh [rSCY], a
    and $07
    jr nz, UpdateCreditsScroll_AdvanceRow.notOnRowBoundary

    ld a, [wCreditsRowAddress]
    ld e, a
    ld a, [wCreditsRowAddress + 1]
    ld d, a
    ld a, $0f
    ld [ROM_BANK], a
    ld a, [wCreditsTextPtr]
    ld l, a
    ld a, [wCreditsTextPtr + 1]
    ld h, a
    ld a, [hl+]
    or a
    jp z, UpdateCreditsScroll_BlankRow

    inc a
    jr z, UpdateCreditsScroll_AdvanceRow.endOfText

    dec a
    ld b, $14

.copyCharLoop:
    sub $20
    jr c, UpdateCreditsScroll_AdvanceRow.charBelowSpace

    jr z, .storeTile

    sub $0f
    cp $12
    jr c, .storeTile

    sub $07

.storeTile:
    ld [de], a
    inc de
    ld a, [hl+]
    dec b
    jr nz, .copyCharLoop

    ld [wCreditsRowColour], a
    ld a, l
    ld [wCreditsTextPtr], a
    ld a, h
    ld [wCreditsTextPtr + 1], a

; Moves wCreditsRowAddress to the next background map row, wrapping from $9c00 back to $9800.
; Then switches back to ROM bank 1 and returns. Also holds the exits used by UpdateCreditsScroll.
UpdateCreditsScroll_AdvanceRow:
    ld a, [wCreditsRowAddress]
    add $20
    ld [wCreditsRowAddress], a
    jr nc, .restoreBank

    ld a, [wCreditsRowAddress + 1]
    inc a
    cp $9c
    jr nz, .storeRowAddressHigh

    ld a, $98

.storeRowAddressHigh:
    ld [wCreditsRowAddress + 1], a

.restoreBank:
    ld a, $01
    ld [ROM_BANK], a
    ret

.charBelowSpace:
    add $e4
    jr UpdateCreditsScroll.storeTile

.notOnRowBoundary:
    ld a, $fe

    ld [wCreditsRowColour], a
    ret

.endOfText:
    ld a, $01
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ld a, $1a
    call PlaySound
    ld a, [wCreditsTextStart]
    ld l, a
    ld a, [wCreditsTextStart + 1]
    ld h, a

; HL = new wCreditsTextPtr, DE = address of the map row to blank.
; Fills the 20 tiles of that row with 0 and sets wCreditsRowColour to $fe. Then continues into UpdateCreditsScroll_AdvanceRow.
UpdateCreditsScroll_BlankRow:
    ld a, l
    ld [wCreditsTextPtr], a
    ld a, h
    ld [wCreditsTextPtr + 1], a
    ld h, d
    ld l, e
    ld b, $14
    xor a

.clearRowLoop:
    ld [hl+], a
    dec b
    jr nz, .clearRowLoop

    ld a, $fe
    ld [wCreditsRowColour], a
    jp UpdateCreditsScroll_AdvanceRow

; Step wLevelMusicIndex (0, 1, 2, 0, ...) and restart the count of levels since the last password.
NextLevelMusic:
    ld a, [wLevelMusicIndex]
    inc a
    cp $03
    jr nz, .storeIndex

    xor a

.storeIndex:
    ld [wLevelMusicIndex], a
    xor a
    ld [wLevelsSincePassword], a
    ret

; Sets up the level password screen when that game state starts.
; Loads its palettes, graphics and text, and builds the password from the level title with EncodeLevelPassword.
; Adds 500 to wLevelBonus and 50 to wLevelBonusUnits, adds wLevelBonusUnits to the score, then starts the fireworks and twinkles.
StateInit_LevelPassword:
    ld a, $00
    ld [wLcdcFlags], a
    ld hl, VBlank
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    ld hl, Stat_Default
    ld a, l
    ld [hStatHandler], a
    ld a, h
    ld [hStatHandler + 1], a
    ld a, $1c
    ld [hLycStart], a
    xor a
    ld [hPaletteMode], a
    ld a, $01
    ld [hInterruptEnable], a
    ld de, Palettes_LevelPassword
    call LoadPalettes
    ld a, $0c
    call ChangeROMBank
    xor a
    ld [wLevelPasswordUnused], a
    ld a, $01
    ld [wLevelPasswordReady], a
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, Tilemap_LevelPassword_00c_577c
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    xor a
    ld [wLevelSweepPending], a
    ldh [rVBK], a
    ld hl, Gfx_LevelPassword_00c_4de4
    ld de, $9000
    ld bc, $0790
    call DataTransfer
    ld hl, Gfx_LevelPassword_00c_4de4 + $7a0
    ld de, $8b40
    ld bc, $0090
    call DataTransfer
    ld hl, Gfx_LevelPassword_00c_4de4 + $790
    ld de, $8000
    ld bc, $0010
    call DataTransfer
    ld a, $26
    ld de, $9800
    ld hl, Tilemap_LevelPassword_00c_5614
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    ld hl, LevelPasswordScrollSplits
    ld de, wScrollSplits
    ld bc, $0006
    call DataTransfer
    ld a, [wLangTextLevelPassword]

    ld l, a
    ld a, [wLangTextLevelPassword + 1]
    ld h, a
    ld de, wLevelPasswordText
    ld bc, $003e
    call DataTransfer
    ld a, $01
    call ChangeROMBank
    ld hl, LogoSwaySteps
    ld a, l
    ld [wLogoSwayPtr], a
    ld a, h
    ld [wLogoSwayPtr + 1], a
    call BuildLevelTitle
    ld hl, wLevelPasswordText + 12
    ld a, [wLanguage]
    cp $04
    jr nz, .notItalian

    ld a, [wLevelTitleText + 18]
    ld [hl+], a
    ld a, [wLevelTitleText + 19]
    ld [hl+], a
    ld a, [wLevelTitleText + 20]
    jr .storeLastDigit

.notItalian:
    ld a, [wLevelTitleText + 17]
    ld [hl+], a
    ld a, [wLevelTitleText + 18]
    ld [hl+], a
    ld a, [wLevelTitleText + 19]

.storeLastDigit:
    ld [hl-], a
    dec hl
    call EncodeLevelPassword
    ld a, [wLangTable + $34]
    ld l, a
    ld a, [wLangTable + $35]
    ld h, a
    ld de, wLevelPasswordChars
    ld a, [wPasswordChars]
    ld [hl+], a
    ld [de], a
    inc de
    ld a, [wPasswordChars + 1]
    ld [hl+], a
    ld [de], a
    inc de
    ld a, [wPasswordChars + 2]
    ld [hl+], a
    ld [de], a
    inc de
    ld a, [wPasswordChars + 3]
    ld [hl+], a
    ld [de], a
    ld a, [wLevelBonus]
    ld l, a
    ld a, [wLevelBonus + 1]
    ld h, a
    ld de, $01f4
    add hl, de
    ld a, l
    ld [wLevelBonus], a
    ld a, h
    ld [wLevelBonus + 1], a
    ld a, l
    ld [wBonusCountdown], a
    ld a, h
    ld [wBonusCountdown + 1], a
    call LevelPassword_DrawBonus
    ld a, [wLevelBonusUnits]
    ld l, a
    ld a, [wLevelBonusUnits + 1]
    ld h, a
    ld de, $0032
    add hl, de
    ld a, l
    ld [wLevelBonusUnits], a
    ld a, h
    ld [wLevelBonusUnits + 1], a
    ld b, h
    ld c, l
    call AddScoreBC
    ld hl, wLevelPasswordText
    call DrawString
    call DrawString
    call DrawString
    ld a, $2d
    ld [wBonusDelay], a
    ld hl, FireworkScript_0
    ld a, l
    ld [wFireworks], a
    ld a, h
    ld [wFireworks + 1], a
    ld hl, FireworkScript_1
    ld a, l
    ld [wFireworks + 15], a
    ld a, h
    ld [wFireworks + 16], a
    ld hl, FireworkScript_2
    ld a, l
    ld [wFireworks + 30], a
    ld a, h
    ld [wFireworks + 31], a
    ld hl, wFireworks
    call Firework_Launch
    ld hl, wFireworks + 15
    call Firework_Launch
    ld hl, wFireworks + 30
    call Firework_Launch
    ld hl, wFireworkSparks
    ld a, l
    ld [wFireworks + 13], a
    ld a, h
    ld [wFireworks + 14], a
    ld hl, wFireworkSparks + 80
    ld a, l
    ld [wFireworks + 28], a
    ld a, h
    ld [wFireworks + 29], a
    ld hl, wFireworkSparks + 160
    ld a, l
    ld [wFireworks + 43], a
    ld a, h
    ld [wFireworks + 44], a
    ld hl, TwinkleInitData
    ld de, wTwinkles
    ld bc, $0037
    call DataTransfer
    ret

; Sets up the language selection screen when that game state starts.
; Loads its palettes, graphics and tilemaps, and resets wLanguage and the up and down held flags.
StateInit_LanguageSelect:
    ld hl, VBlank
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    ld a, $01
    ld [hPaletteMode], a
    ld [hLycStart], a
    ld a, $01
    ld [hInterruptEnable], a
    xor a
    ldh [rSCX], a
    ld de, Palettes_LanguageSelect
    call LoadPalettes
    ld a, $0d
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, Tilemap_LanguageSelect_00d_5150
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    xor a
    ld [wLanguage], a
    ld [wLanguageDownHeld], a
    ld [wLanguageUpHeld], a
    ldh [rVBK], a
    ld hl, Gfx_LanguageSelect_00d_49b8
    ld de, $9000
    ld bc, $0630
    call DataTransfer
    ld de, $9800

    ld hl, Gfx_LanguageSelect_00d_49b8 + $630
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    ld a, $01
    call ChangeROMBank
    ret

; Start song E. Does nothing while music is turned off.
PlayMusic:
    ld a, [wMusicOff]
    or a
    ret nz

; Start song E, even when music is turned off.
StartSong:
    ld a, $06               ; Load ROM Bank 06
    ld [ROM_BANK], a
    call PlaySong
    ld a, $01
    ld [ROM_BANK], a
    ret

; Play sound effect A.
PlaySound:
    push de
    push hl
    push bc
    ld e, a
    ld a, [wSfxOff]
    or a
    jr nz, .restoreRegisters

    ld a, $06
    ld [ROM_BANK], a
    call PlaySfx
    ld a, $01
    ld [ROM_BANK], a

.restoreRegisters:
    pop bc

    pop hl
    pop de
    ret

; Run the sound driver in bank 6 for one frame.
UpdateSound:
    ld a, $06
    ld [ROM_BANK], a
    call UpdateSoundDriver
    ld a, $01
    ld [ROM_BANK], a
    ret

; Sets up the copyright screen when that game state starts.
; Loads its palettes, graphics and tilemaps, and sets hLogoTimer to $46 frames.
StateInit_Copyright:
    ld a, $46
    ld [hLogoTimer], a
    ld hl, VBlank
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    ld a, $01
    ld [hPaletteMode], a
    ld [hLycStart], a
    ld a, $01
    ld [hInterruptEnable], a
    xor a
    ldh [rSCX], a
    ld de, Palettes_Copyright
    call LoadPalettes
    ld a, $03
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, Tilemap_Copyright_003_5e98
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    xor a
    ldh [rVBK], a
    ld hl, Gfx_Copyright_003_5580
    ld de, $9000
    ld bc, $07b0
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, Tilemap_Copyright_003_5d30
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    ld a, $01
    call ChangeROMBank
    ret

; Called once per frame while the copyright screen is shown.
; Counts hLogoTimer down. Once it is zero, sets hGameState to $0c and hStateTimer to 1.
Copyright_Update:
    ld a, [hLogoTimer]
    or a
    jr z, .timerExpired

    dec a
    ld [hLogoTimer], a
    ret

.timerExpired:
    ld a, $0c
    ld [hGameState], a
    ld a, $01
    ld [hStateTimer], a
    ret

; Sets up the ending screen when that game state starts.
; Starts the ending music, loads its palettes, graphics and tilemaps, draws the ending text, and sets wEndingSeen.
; Also clears wLevelsSincePassword and sets wLives to 1.
StateInit_Ending:
    ld e, $08
    call PlayMusic
    xor a
    ldh [rSCX], a
    ld hl, VBlank
    ld a, l
    ld [hVBlankHandler], a
    ld a, h
    ld [hVBlankHandler + 1], a
    xor a
    ld [hPaletteMode], a
    ld [wLevelsSincePassword], a
    ld a, $01
    ld [hInterruptEnable], a
    ld de, Palettes_Ending
    call LoadPalettes
    ld a, $0e
    ld [wEndingSeen], a
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    ld hl, Gfx_Ending_00e_674f
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, Gfx_Ending_00e_674f + $800
    ld de, $8800
    ld bc, $0790
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, Tilemap_Ending_00e_7e87
    ld b, $14
    ld c, $12
    call CopyTilemapRect
    xor a
    ldh [rVBK], a
    ld hl, Gfx_Ending_00e_674f + $c80
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, Gfx_Ending_00e_674f + $1480
    ld de, $8800
    ld bc, $0150
    call DataTransfer
    ld a, $09
    ld de, $9800
    ld hl, Tilemap_Ending_00e_7d1f
    ld b, $14
    ld c, $09
    call CopyTilemapRect
    xor a
    ld de, $9920
    ld b, $14
    ld c, $09
    call CopyTilemapRect
    ld a, [wLangTextEnding]
    ld l, a
    ld a, [wLangTextEnding + 1]
    ld h, a
    call DrawStringSkipZero
    call DrawStringSkipZero
    call DrawStringSkipZero
    call DrawStringSkipZero
    call DrawStringSkipZero
    call DrawStringSkipZero
    ld a, $01
    ld [wLives], a
    call ChangeROMBank
    ret

; FuckYouDude:
;     ld hl, $2000
;     ld [hl], $D
;     ld a, $c3
;     ld [$ff92], a
; .loop:
;     jp .loop

; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "src/interrupts.asm"

INCLUDE "src/header.asm"

SECTION "FIXED BANK ROM", ROM0[$0150]
ProgramStart:
    di                      ; disable interrupts
    ld hl, wUnk_c1fe            ; setup stack pointer
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
    jr nz, jr_000_0184

    ld a, $28
    ld hl, wOamBuffer
    call ClearOamEntries

jr_000_0184:
    call RunStateInit
    call InstallInterruptHandlers
    ld a, [hResumeFromPause]
    or a
    jr nz, jr_000_0199

    ld a, [wLcdcFlags]
    ld b, a
    ld a, $83
    or b
    jr jr_000_019b

jr_000_0199:
    ld a, $89

jr_000_019b:
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

jr_000_01be:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec b
    jr nz, jr_000_01be

    pop hl
    ld a, $01
    ldh [rVBK], a
    xor a
    ld b, a

jr_000_01cc:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec b
    jr nz, jr_000_01cc

    ret

    ; TODO: Document this function

; Copy a rectangle of B x C tiles from HL to the tile map at DE.
CopyTilemapRect:
    ld [hTemp], a

jr_000_01d7:
    push bc
    push de
    ld a, [hTemp]
    ld c, a

jr_000_01dd:
    ld a, [hl+]
    add c
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_01dd

    pop de
    ld a, $20
    add e
    jr nc, jr_000_01eb

    inc d

jr_000_01eb:
    ld e, a
    pop bc
    dec c
    jr nz, jr_000_01d7

    ret

; Fill a rectangle of B x C tiles at HL with D.
FillTilemapRect:
    push bc
    push hl

jr_000_01f3:
    ld a, d
    ld [hl], a
    inc hl
    dec b
    jr nz, jr_000_01f3

    pop hl
    ld a, $20
    add l
    jr nc, jr_000_0200

    inc h

jr_000_0200:
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
    jr z, jr_000_0346

    cp $ff
    jr nz, jr_000_0304

    dec a
    ld [wLevelTitleTimer], a
    ld hl, $9800
    ld bc, $0014
    xor a
    call ClearRAM

    jr jr_000_0361

jr_000_0304:
    dec a
    ld [wLevelTitleTimer], a
    jr nz, jr_000_0317

    ld a, [wLangTextHud]
    ld l, a
    ld a, [wLangTextHud + 1]
    ld h, a
    call DrawString
    jr jr_000_0346

jr_000_0317:
    ld b, a
    ld a, [wLevelTitleBlink]
    and $01
    jr z, jr_000_0330

    ld a, b
    and $0f
    jr nz, jr_000_0328

    ld hl, wLevelTitleBlink
    inc [hl]

jr_000_0328:
    ld hl, VBlank_InGameData_001_745e
    call DrawString
    jr jr_000_0361

jr_000_0330:
    ld a, b
    and $3f
    jr nz, jr_000_0339

    ld hl, wLevelTitleBlink
    inc [hl]

jr_000_0339:
    ld hl, wLevelTitleText
    call DrawString
    ld a, [hLevelScrollX]
    ldh [rSCX], a
    jr jr_000_0361

jr_000_0346:
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

jr_000_0361:
    ld a, [wBrickRedrawCount]
    or a
    jr z, jr_000_0374

    ld b, a
    ld hl, wVBlankTileWrites

jr_000_036b:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld [de], a
    dec b
    jr nz, jr_000_036b

jr_000_0374:
    ld a, [wVBlankAttrWriteCount]
    or a
    jr z, jr_000_038b

    ld c, a
    ld a, $01
    ldh [rVBK], a
    ld hl, wVBlankAttrWrites

jr_000_0382:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a

    ld a, [hl+]

    ld [de], a
    dec c
    jr nz, jr_000_0382

jr_000_038b:
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
    ld a, [wUnk_c959]
    or a
    jp nz, VBlankMenus_BlinkRow

    ld a, [hMenuScrollY]
    ldh [rSCY], a
    cp $88
    jr z, jr_000_0410

    or a
    jr z, jr_000_0410

    cp $68
    jr nz, jr_000_03ec

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

jr_000_03ec:
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

jr_000_0410:
    ld hl, $98c4
    ld a, [wMenuItemColours]
    ld b, $0a

jr_000_0418:
    ld [hl+], a
    dec b
    jr nz, jr_000_0418

    ld hl, $98e3
    ld a, [wMenuItemColours + 1]
    ld b, $0d

jr_000_0424:
    ld [hl+], a
    dec b
    jr nz, jr_000_0424

    ld hl, $9923
    ld a, [wMenuItemColours + 2]
    ld b, $0e

jr_000_0430:
    ld [hl+], a
    dec b
    jr nz, jr_000_0430

    ld hl, $9964
    ld a, [wMenuItemColours + 3]
    ld b, $0c

jr_000_043c:
    ld [hl+], a
    dec b
    jr nz, jr_000_043c

    ld hl, $9984
    ld a, [wMenuItemColours + 4]
    ld b, $0b

jr_000_0448:
    ld [hl+], a
    dec b
    jr nz, jr_000_0448

    ld a, [wPasswordEntryActive]
    or a
    jr z, jr_000_048f

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

jr_000_048f:
    xor a
    ldh [rVBK], a
    ld a, [wUnk_df48]
    ld l, a
    ld a, [wUnk_df49]
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
    ld de, wUnk_df40
    ld a, [wMusicOff]
    or a
    jr nz, jr_000_04b8

    ld de, wUnk_df3d

jr_000_04b8:
    ld a, [wUnk_df39]
    ld l, a
    ld a, [wUnk_df3a]
    ld h, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld de, wUnk_df40
    ld a, [wSfxOff]
    or a
    jr nz, jr_000_04d4

    ld de, wUnk_df3d

jr_000_04d4:
    ld a, [wUnk_df3b]
    ld l, a
    ld a, [wUnk_df3c]
    ld h, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, wUnk_db56
    ld a, [hl+]
    ld [$9968], a
    ld a, [hl+]
    ld [$9969], a
    ld a, [hl+]
    ld [$996a], a
    ld a, [hl]
    ld [$996b], a

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

VBlankMenus_BlinkRow:
    ld a, [wBlinkTimer]
    dec a
    ld [wBlinkTimer], a
    jr nz, jr_000_0536

    ld a, [wUnk_df45]
    ld b, a
    ld a, [wBlinkPhase]
    or a
    jr z, jr_000_0525

    xor a
    ld [wBlinkPhase], a
    ld a, $28
    ld [wBlinkTimer], a
    ld a, $04
    jr jr_000_052f

jr_000_0525:
    ld a, $0f
    ld [wBlinkTimer], a
    ld [wBlinkPhase], a
    ld a, $02

jr_000_052f:
    ld hl, $9a01

jr_000_0532:
    ld [hl+], a
    dec b
    jr nz, jr_000_0532

jr_000_0536:
    ld a, [wNameEntryAddress]
    ld l, a
    ld a, [wNameEntryAddress + 1]
    ld h, a
    or l
    jr z, VBlankMenus_Done

    ld de, wNameEntry
    ld b, $07

jr_000_0546:
    ld a, [de]
    cp $5b
    jr nz, jr_000_054d

    ld a, $20

jr_000_054d:
    inc de
    ld [hl+], a
    dec b
    jr nz, jr_000_0546

    ld de, $ffec
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    add $07
    ld l, a
    push hl
    ld a, [wUnk_cccd]
    or a
    jr nz, jr_000_0581

    ld de, wUnk_ccc2
    ld b, $07

jr_000_0567:
    ld a, [de]
    inc de
    ld [hl+], a
    dec b
    jr nz, jr_000_0567

    pop hl
    xor a
    ldh [rVBK], a
    ld de, wNameEntry
    ld b, $07

jr_000_0576:
    ld a, [de]
    sub $36
    inc de
    ld [hl+], a
    dec b
    jr nz, jr_000_0576

    jp VBlankMenus_Done

jr_000_0581:
    xor a
    ld [wNameEntryAddress], a
    ld [wNameEntryAddress + 1], a
    ld a, $84
    ld b, $07

jr_000_058c:
    ld [hl+], a
    dec b
    jr nz, jr_000_058c

    pop hl
    xor a
    ldh [rVBK], a
    ld de, wNameEntry
    ld b, $07

jr_000_0599:
    ld a, [de]
    sub $36
    cp $25
    jr nz, jr_000_05a1

    xor a

jr_000_05a1:
    inc de
    ld [hl+], a
    dec b
    jr nz, jr_000_0599

    jp VBlankMenus_Done

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
    ld a, [wUnk_c95a]
    xor $01
    ld [wUnk_c95a], a
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
    ld [wUnk_c959], a
    call ChangeROMBank
    ld a, $01
    ld [wUnk_c959], a
    call ChangeROMBank
    call HighScores_InitSprites
    call HighScores_MoveSprites
    ld a, $81
    ld [wUnk_ccc2], a
    xor a
    ld [wLevelSweepPending], a
    ld [wUnk_cccd], a
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
    ld [wUnk_ccc3], a
    ld [wUnk_ccc4], a
    ld [wUnk_ccc5], a
    ld [wUnk_ccc6], a
    ld [wUnk_ccc7], a
    ld [wUnk_ccc8], a
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

HighScores_Update:
    call HighScores_AdvanceAnim
    call HighScores_MoveSprites
    ld a, [wMenuIdleTimer]
    cp $ff
    jr z, jr_000_06fd

    ld a, [wUnk_ccce]
    inc a
    and $03
    ld [wUnk_ccce], a
    jr nz, jr_000_0708

    ld a, [wMenuIdleTimer]
    dec a
    ld [wMenuIdleTimer], a
    jr z, HighScores_Leave

    jr jr_000_0708

jr_000_06fd:
    ld a, [wNameEntryAddress]
    ld l, a
    ld a, [wNameEntryAddress + 1]
    ld h, a
    or l
    jr nz, jr_000_072c

jr_000_0708:
    ld a, [hJoypad]
    and $f0
    or a
    jr z, jr_000_072b

HighScores_Leave:
    ld a, [hGameState]
    cp $07
    ret nz

    ld a, [wUnk_ccb6]
    ld [hGameState], a
    ld a, $01
    ld [wUnk_cccd], a
    ld a, $1e
    ld [hStateTimer], a
    ld a, $1a
    call PlaySound

jr_000_072b:
    ret

jr_000_072c:
    ld a, [hJoypad]
    ld b, a
    ld a, [wNameEntryCursor]
    or a
    jr nz, jr_000_073b

    ld hl, wNameEntry
    jr jr_000_076f

jr_000_073b:
    cp $01
    jr nz, jr_000_0744

    ld hl, wNameEntry + 1
    jr jr_000_076f

jr_000_0744:
    cp $02
    jr nz, jr_000_074d

    ld hl, wNameEntry + 2
    jr jr_000_076f

jr_000_074d:
    cp $03
    jr nz, jr_000_0756

    ld hl, wNameEntry + 3
    jr jr_000_076f

jr_000_0756:
    cp $04
    jr nz, jr_000_075f

    ld hl, wNameEntry + 4
    jr jr_000_076f

jr_000_075f:
    cp $05
    jr nz, jr_000_0768

    ld hl, wNameEntry + 5
    jr jr_000_076f

jr_000_0768:
    cp $06
    jr nz, jr_000_076f

    ld hl, wNameEntry + 6

jr_000_076f:
    bit 3, b
    jr z, jr_000_078f

    ld a, [wUnk_ccca]
    or a
    jr nz, jr_000_0793

    inc a
    ld [wUnk_ccca], a
    ld a, $19
    call PlaySound
    push hl
    pop hl
    ld a, [hl]
    dec a
    cp $40
    jr nz, jr_000_078c

    add $1b

jr_000_078c:
    ld [hl], a
    jr jr_000_0793

jr_000_078f:
    xor a
    ld [wUnk_ccca], a

jr_000_0793:
    bit 2, b
    jr z, jr_000_07b3

    ld a, [wUnk_ccc9]
    or a
    jr nz, jr_000_07b7

    inc a
    ld [wUnk_ccc9], a
    ld a, $19
    call PlaySound
    push hl
    pop hl
    ld a, [hl]
    inc a
    cp $5c
    jr nz, jr_000_07b0

    sub $1b

jr_000_07b0:
    ld [hl], a
    jr jr_000_07b7

jr_000_07b3:
    xor a
    ld [wUnk_ccc9], a

jr_000_07b7:
    ld a, b
    and $f3
    or a
    jp z, HighScores_ButtonsReleased

    ld a, [wUnk_cccb]
    or a
    ret nz

    ld a, $19
    call PlaySound
    ld a, $01
    ld [wUnk_cccb], a
    ld a, [wNameEntryCursor]
    bit 4, b
    jr z, jr_000_07d5

    inc a

jr_000_07d5:
    bit 5, b
    jr z, jr_000_07dd

    or a
    jr z, jr_000_07dd

    dec a

jr_000_07dd:
    bit 7, b
    jr z, jr_000_07e2

    inc a

jr_000_07e2:
    bit 6, b
    jr z, jr_000_07ea

    or a
    jr z, jr_000_07ea

    dec a

jr_000_07ea:
    bit 0, b
    jr z, jr_000_07ef

    inc a

jr_000_07ef:
    bit 1, b
    jr z, jr_000_07f7

    or a
    jr z, jr_000_07f7

    dec a

jr_000_07f7:
    ld [wNameEntryCursor], a
    or a
    jr nz, jr_000_0808

    ld a, $81
    ld [wUnk_ccc2], a
    ld a, $84
    ld [wUnk_ccc3], a
    ret

jr_000_0808:
    cp $01
    jr nz, jr_000_081a

    ld a, $81

    ld [wUnk_ccc3], a
    ld a, $84
    ld [wUnk_ccc2], a
    ld [wUnk_ccc4], a
    ret

jr_000_081a:
    cp $02
    jr nz, jr_000_082c

    ld a, $84
    ld [wUnk_ccc3], a
    ld [wUnk_ccc5], a
    ld a, $81
    ld [wUnk_ccc4], a
    ret

jr_000_082c:
    cp $03
    jr nz, jr_000_083e

    ld a, $84
    ld [wUnk_ccc4], a
    ld [wUnk_ccc6], a
    ld a, $81
    ld [wUnk_ccc5], a
    ret

jr_000_083e:
    cp $04
    jr nz, jr_000_0850

    ld a, $84
    ld [wUnk_ccc5], a
    ld [wUnk_ccc7], a
    ld a, $81
    ld [wUnk_ccc6], a
    ret

jr_000_0850:
    cp $05
    jr nz, jr_000_0862

    ld a, $84
    ld [wUnk_ccc6], a
    ld [wUnk_ccc8], a
    ld a, $81
    ld [wUnk_ccc7], a
    ret

jr_000_0862:
    cp $06
    jp nz, HighScores_Leave

    ld a, $84
    ld [wUnk_ccc7], a
    ld a, $81
    ld [wUnk_ccc8], a
    ret

HighScores_ButtonsReleased:
    xor a
    ld [wUnk_cccb], a
    ret

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
    ld de, wUnk_ccad
    ld b, $05

jr_000_08d0:
    ld a, [hl+]
    add $2f
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_08d0

    call BuildLevelTitle
    xor a
    ld [wNameEntryAddress], a
    ld [wNameEntryAddress + 1], a
    ld hl, wUnk_cb85
    ld b, $0a

jr_000_08e7:
    push hl
    ld de, wUnk_ccad
    ld c, $05

jr_000_08ed:
    ld a, [de]
    cp [hl]
    jr c, jr_000_08f8

    jr nz, jr_000_0901

    inc hl
    inc de
    dec c
    jr nz, jr_000_08ed

jr_000_08f8:
    pop hl
    ld de, $001c
    add hl, de
    dec b
    jr nz, jr_000_08e7

    ret

jr_000_0901:
    dec b
    jr z, jr_000_091b

    push bc
    ld hl, wUnk_cc7c
    ld de, wUnk_cc98

jr_000_090b:
    ld c, $1a

jr_000_090d:
    ld a, [hl-]
    ld [de], a
    dec de
    dec c
    jr nz, jr_000_090d

    dec hl
    dec hl
    dec de
    dec de
    dec b
    jr nz, jr_000_090b

    pop bc

jr_000_091b:
    pop hl
    ld de, wUnk_ccad
    ld c, $05

jr_000_0921:
    ld a, [de]
    ld [hl+], a
    inc de
    dec c
    jr nz, jr_000_0921

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
    jr nz, jr_000_095b

    ld de, wLevelTitleText + 18

jr_000_095b:
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

; Read a 3-digit decimal number from the string at HL.
ParseDecimal:
    ld a, $02
    call ChangeROMBank
    ld b, $00
    ld a, [hl+]
    sub $30
    jr z, jr_000_0988

    ld c, a
    ld a, b

jr_000_0982:
    add $64
    dec c
    jr nz, jr_000_0982

    ld b, a

jr_000_0988:
    ld a, [hl+]
    sub $30
    jr z, jr_000_0995

    ld c, a
    ld a, b

jr_000_098f:
    add $0a
    dec c
    jr nz, jr_000_098f

    ld b, a

jr_000_0995:
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

jr_000_0a02:
    cp [hl]
    jr z, jr_000_0a0b

    inc hl
    inc c
    dec b
    jr nz, jr_000_0a02

    ret

jr_000_0a0b:
    ld a, c
    swap a
    ld [wPasswordByteX], a
    inc de
    ld a, [de]
    ld hl, PasswordAlphabet
    ld c, $00
    ld b, $10

jr_000_0a1a:
    cp [hl]
    jr z, jr_000_0a23

    inc hl
    inc c
    dec b
    jr nz, jr_000_0a1a

    ret

jr_000_0a23:
    ld a, c
    ld [wPasswordByteY], a
    inc de
    ld a, [de]
    ld hl, PasswordAlphabet
    ld c, $00
    ld b, $10

jr_000_0a30:
    cp [hl]
    jr z, jr_000_0a39

    inc hl
    inc c
    dec b
    jr nz, jr_000_0a30

    ret

jr_000_0a39:
    ld a, [wPasswordByteX]
    or c
    ld [wPasswordByteX], a
    inc de
    ld a, [de]
    ld hl, PasswordAlphabet
    ld c, $00
    ld b, $10

jr_000_0a49:
    cp [hl]
    jr z, jr_000_0a52

    inc hl
    inc c
    dec b
    jr nz, jr_000_0a49

    ret

jr_000_0a52:
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
    jr nz, jr_000_0aaa

    ld a, b
    and $03
    jr nz, jr_000_0aaa

    ld a, b
    cp $c8
    jr nz, jr_000_0a80

    ld a, $01
    ld [wCheatLivesRefill], a
    jr jr_000_0aaa

jr_000_0a80:
    cp $cc
    jr nz, jr_000_0a8b

    ld a, $01
    ld [wCheatLevelSkip], a
    jr jr_000_0aaa

jr_000_0a8b:
    cp $d0
    jr nz, jr_000_0a96

    ld a, $01
    ld [wCheatPhotoBackground], a
    jr jr_000_0aaa

jr_000_0a96:
    cp $d4

    jr nz, jr_000_0aa1

    ld a, $01
    ld [wCheatShowVersion], a
    jr jr_000_0aaa

jr_000_0aa1:
    cp $a0
    jr nc, jr_000_0aaa

    ld [wStartLevel], a
    or a
    ret

jr_000_0aaa:
    xor a
    ret

StartHdmaTransfer:
    ld a, [wHdmaMode]
    or a
    ret z

    cp $01
    ret z

    cp $03
    jr z, jr_000_0aca

    ld a, [wLangGraphicsBank]
    ld [ROM_BANK], a
    ld a, [wHdmaSource + 1]
    ldh [rHDMA1], a
    ld a, [wHdmaSource]
    ldh [rHDMA2], a
    jr jr_000_0ad6

jr_000_0aca:
    ld a, $0c
    ld [ROM_BANK], a
    ld a, $40
    ldh [rHDMA1], a
    xor a
    ldh [rHDMA2], a

jr_000_0ad6:
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
    jr nz, jr_000_0af3

    ld e, $02

jr_000_0af3:
    cp $01
    jr nz, jr_000_0af9

    ld e, $03

jr_000_0af9:
    cp $02
    jr nz, jr_000_0aff

    ld e, $04

jr_000_0aff:
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
    ld [wUnk_c958], a
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
    jr z, jr_000_0b49

    ld de, Background_48ea

jr_000_0b49:
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
    jr z, jr_000_0b81

    ld hl, BrickPalette_4830

jr_000_0b81:
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
    ld [wLevelFlagsHigh], a
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
    ld [wUnk_dab2], a
    ld [hLifeLostTimer], a
    jr jr_000_0c41

LoadLevel_SkipTilemap:
    pop hl

jr_000_0c41:
    ld a, [hResumeFromPause]
    or a
    jr nz, jr_000_0c9a

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

jr_000_0c9a:
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

jr_000_0dc2:
    ld [hl+], a
    dec b
    jr nz, jr_000_0dc2

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
    jr z, jr_000_0dd8

jr_000_0dd2:
    ld [hl+], a
    dec b
    jr nz, jr_000_0dd2

    jr RleOverlay

jr_000_0dd8:
    inc hl
    dec b
    jr nz, jr_000_0dd8

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

jr_000_0df5:
    ld b, a
    sub $64
    jr nc, jr_000_0e51

    ld a, c
    or a
    jr z, jr_000_0e15

    add $30
    ld d, a
    ld a, [wLanguage]
    cp $04
    jr nz, jr_000_0e0e

    ld a, d
    ld [wLevelTitleText + 18], a
    jr jr_000_0e12

jr_000_0e0e:
    ld a, d
    ld [wLevelTitleText + 17], a

jr_000_0e12:
    ld a, b
    or a
    ret z

jr_000_0e15:
    ld a, b
    ld c, $00

jr_000_0e18:
    ld b, a
    sub $0a
    jr nc, jr_000_0e4e

    ld a, c
    or a
    jr z, jr_000_0e38

    add $30
    ld d, a
    ld a, [wLanguage]
    cp $04
    jr nz, jr_000_0e31

    ld a, d
    ld [wLevelTitleText + 19], a
    jr jr_000_0e35

jr_000_0e31:
    ld a, d
    ld [wLevelTitleText + 18], a

jr_000_0e35:
    ld a, b
    or a
    ret z

jr_000_0e38:
    ld a, b
    add $30
    ld d, a
    ld a, [wLanguage]
    cp $04
    jr nz, jr_000_0e49

    ld a, d
    ld [wLevelTitleText + 20], a
    jr jr_000_0e4d

jr_000_0e49:
    ld a, d
    ld [wLevelTitleText + 19], a

jr_000_0e4d:
    ret

jr_000_0e4e:
    inc c
    jr jr_000_0e18

jr_000_0e51:
    inc c
    jr jr_000_0df5

; Draw the string at HL: a 2-byte tile map address, then characters up to $ff.
DrawString:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    jr jr_000_0e65

jr_000_0e5a:
    ld [de], a
    ld a, $01
    ldh [rVBK], a
    ld a, b
    ld [de], a
    inc de
    xor a
    ldh [rVBK], a

jr_000_0e65:
    ld a, [hl+]
    cp $ff
    ret z

    or a
    jr nz, jr_000_0e70

    ld a, [hl+]
    ld b, a
    jr jr_000_0e65

jr_000_0e70:
    cp $20
    jr nz, jr_000_0e77

    xor a
    jr jr_000_0e5a

jr_000_0e77:
    cp $41
    jr c, jr_000_0e7f

    sub $36
    jr jr_000_0e5a

jr_000_0e7f:
    sub $2f
    jr jr_000_0e5a

    ret

; Like DrawString, but a zero character leaves the tile as it is.
DrawStringSkipZero:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    jr jr_000_0e98

jr_000_0e8a:
    or a
    jr z, jr_000_0e94

    ld [de], a
    ld a, $01
    ldh [rVBK], a
    ld a, b
    ld [de], a

jr_000_0e94:
    inc de
    xor a
    ldh [rVBK], a

jr_000_0e98:
    ld a, [hl+]
    cp $ff
    ret z

    or a
    jr nz, jr_000_0ea3

    ld a, [hl+]
    ld b, a
    jr jr_000_0e98

jr_000_0ea3:
    cp $20
    jr nz, jr_000_0eaa

    xor a
    jr jr_000_0e8a

jr_000_0eaa:
    cp $41
    jr c, jr_000_0eb2

    sub $36
    jr jr_000_0e8a

jr_000_0eb2:
    sub $2f
    jr jr_000_0e8a

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
    jr nz, jr_000_0f5d

    call NextLevelMusic
    ld a, [wEndingSeen]
    or a
    jr nz, jr_000_0f5d

    ld b, $09

jr_000_0f5d:
    ld a, b
    ld [hGameState], a
    ld a, $0f
    ld [hStateTimer], a
    ld a, [wCurrentLevel]
    inc a
    cp $a0
    jr c, jr_000_0f74

    ld a, $0d
    ld [hGameState], a
    xor a

jr_000_0f74:
    ld [wCurrentLevel], a

; Stun (Poison): shake the bat until wBatEffectTimer runs out.
Gameplay_UpdateStun:
    ld a, [wStunActive]
    or a
    jr z, Gameplay_MoveBat

    ld a, [wBatEffectTimer]
    and $07
    jr nz, jr_000_0f89

    ld a, $0f
    call PlaySound

jr_000_0f89:
    xor a
    ld [wStunWobbleNow], a
    ld a, [wBatEffectTick]
    inc a
    ld [wBatEffectTick], a
    and $03
    jr nz, Gameplay_MoveBat

    ld a, [wStunWobble]
    cp $fd
    jr nz, jr_000_0fa3

    ld a, $03
    jr jr_000_0fa9

jr_000_0fa3:
    cp $03
    jr nz, jr_000_0fa9

    ld a, $fd

jr_000_0fa9:
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
    jr z, jr_000_1001

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
    jr nz, jr_000_1001

    ld a, [wBatEffectTimer]
    dec a
    ld [wBatEffectTimer], a
    or a
    jr nz, jr_000_1001

    ld [wReverseActive], a

jr_000_1001:
    ld a, [hLastDirection]
    ld b, a
    ld a, c
    and $03
    cp $03
    jr nz, jr_000_100f

    xor b
    jr jr_000_1012

jr_000_100f:
    ld [hLastDirection], a

jr_000_1012:
    bit 0, a
    jr z, jr_000_1058

    ld a, [wBatMovingLeft]
    or a
    jp nz, Gameplay_MoveBat_Left

Gameplay_MoveBat_Right:
    inc hl
    ld a, [hl]
    or a

    jr nz, jr_000_1024

    dec hl
    ld a, [hl]

jr_000_1024:
    ld b, a
    ld a, $ff
    ld [wBatMovingRight], a

jr_000_102a:
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
    jr c, jr_000_1049

    sub $aa
    sub b
    cpl
    ld b, a

jr_000_1049:
    ld a, [wBatX]
    add b
    ld [wBatX], a
    ld a, b
    cpl
    inc a
    ld [wBatDeltaX], a
    jr Gameplay_AntigravitySteering

jr_000_1058:
    bit 1, a
    jr z, jr_000_1097

    ld a, [wBatMovingRight]
    or a
    jr nz, jr_000_109d

jr_000_1062:
    inc hl
    ld a, [hl]
    or a
    jr nz, jr_000_1069

    dec hl
    ld a, [hl]

jr_000_1069:
    ld b, a
    ld a, $01
    ld [wBatMovingLeft], a

jr_000_106f:
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
    jr nc, jr_000_108a

    sub $17
    cpl
    sub b
    cpl
    ld b, a

jr_000_108a:
    ld a, [wBatX]
    sub b
    ld [wBatX], a
    ld a, b

    ld [wBatDeltaX], a
    jr Gameplay_AntigravitySteering

jr_000_1097:
    ld a, [wBatMovingRight]
    or a
    jr z, jr_000_10af

jr_000_109d:
    dec hl
    ld b, [hl]
    ld a, b
    or a
    jr nz, jr_000_102a

    ld [wBatMovingRight], a
    ld a, [hJoypad]
    bit 1, a
    jr nz, jr_000_1062

    jr jr_000_10c6

jr_000_10af:
    ld a, [wBatMovingLeft]
    or a
    jr z, jr_000_10c6

Gameplay_MoveBat_Left:
    dec hl
    ld b, [hl]
    ld a, b
    or a
    jr nz, jr_000_106f

    ld [wBatMovingLeft], a
    ld a, [hJoypad]
    bit 0, a
    jp nz, Gameplay_MoveBat_Right

jr_000_10c6:
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
    jr nz, jr_000_1111

    ld a, [wAntigravityActive]
    or a
    jr z, Gameplay_LaunchBall

    ld a, [wBallEffectTimer]
    dec a
    ld [wBallEffectTimer], a
    jr z, jr_000_1111

    ld a, [wBallCount]
    or a
    jr z, Gameplay_LaunchBall

    ld c, a
    ld b, $00
    ld a, [hJoypad]
    bit 0, a
    jr z, jr_000_10fe

    ld b, $04

jr_000_10fe:
    bit 1, a
    jr z, jr_000_1104

    ld b, $1c

jr_000_1104:
    ld hl, wBalls + 4
    ld de, $0007

jr_000_110a:
    ld [hl], b
    add hl, de
    dec c
    jr nz, jr_000_110a

    jr Gameplay_LaunchBall

jr_000_1111:
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

jr_000_1127:
    ld [hl+], a
    inc a
    res 7, [hl]
    add hl, de
    dec b
    jr nz, jr_000_1127

    ld a, $17
    call PlaySound

; Launch the ball from the bat with A, or split it when Multi ball was picked up.
Gameplay_LaunchBall:
    ld a, [wMultiBallPending]
    or a
    jr nz, jr_000_114d

    ld a, [wBallSticks]
    or a
    jr z, Gameplay_UpdateBalls

    ld a, [wSleepyBallActive]
    or a
    jr nz, Gameplay_UpdateBalls

    ld a, [hJoypad]
    bit 4, a
    jr z, Gameplay_UpdateBalls

jr_000_114d:
    ld a, [wBallOnBat]
    or a
    jr z, jr_000_116a

    ld a, [wBatWidth]
    srl a
    ld b, a
    ld a, [wBatX]
    sub $08
    add b
    ld c, $01
    cp $58
    jr c, jr_000_1167

    ld c, $1f

jr_000_1167:
    ld a, c
    jr jr_000_116c

jr_000_116a:
    ld a, $04

jr_000_116c:
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
    jr nz, jr_000_1227

    ld a, [wBallWorkY]
    ld b, a
    cp $a0
    jp c, Gameplay_StoreBall

    pop bc
    ld a, [wBallCount]
    cp $01
    jr nz, jr_000_122f

    dec a
    ld [wBallCount], a
    ld c, a
    ld a, [wBlobThrowCount]
    or a
    jr z, jr_000_11d2

    ld a, c
    or a
    jp z, Gameplay_AfterBalls

jr_000_11d2:
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
    jr z, jr_000_11f8

    ld b, $fc

jr_000_11f8:
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
    jr nz, jr_000_121f

    ld a, $03
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    jp Gameplay_AfterBalls

jr_000_121f:
    ld a, $01
    ld [hLifeLostTimer], a
    jp Gameplay_AfterBalls

jr_000_1227:
    pop bc
    xor a
    ld [wRemoveBall], a
    ld a, [wBallCount]

jr_000_122f:
    dec a
    ld [wBallCount], a
    ld a, b
    cp $01
    jr z, jr_000_126c

    ld a, l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, l
    add $06
    ld l, a
    jr nc, jr_000_1245

    inc h

jr_000_1245:
    ld a, $ff
    ld [hl+], a
    ld a, [hTemp2]
    inc a
    ld [hTemp2], a
    jr jr_000_126c

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

jr_000_126c:
    dec b
    jp nz, Gameplay_BallLoop

    ld a, [wBallLoopCount]
    or a
    jr nz, jr_000_127a

    ld de, $000e
    add hl, de

jr_000_127a:
    ld a, [hTemp2]
    or a
    jr z, Gameplay_AfterBalls

    ld de, wRemovedBallPtrs
    ld b, a
    dec hl

jr_000_1285:
    push bc

jr_000_1286:
    ld a, [hl]
    cp $ff
    jr nz, jr_000_1291

    ld bc, $fff9
    add hl, bc
    jr jr_000_1286

jr_000_1291:
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
    jr nz, jr_000_1285

; Update power-ups, enemies, shots and the brick queue, restart after a lost life, and check for pause.
Gameplay_AfterBalls:
    xor a
    ld [wLaunchDirection], a
    ld a, [wBallOnBat]
    or a
    jr z, jr_000_12d4

    ld a, [hJoypad]
    bit 4, a
    jr z, jr_000_12d4

    xor a
    ld [wBallSticks], a
    ld [wBallOnBat], a
    ld a, $07
    call PlaySound

jr_000_12d4:
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

jr_000_133b:
    push af
    call WaitVBlank
    call UpdateSound
    pop af
    dec a
    jr nz, jr_000_133b

    ret

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
    ld de, wUnk_c2b9
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
    jr z, jr_000_1415

    ld a, [wBallEffectTimer]
    cp $18
    jr nz, jr_000_13c0

    ld a, $16
    call PlaySound
    jr jr_000_1415

jr_000_13c0:
    jr c, jr_000_1415

    ld a, [wBallEffectTick]
    and $1f
    ld d, $00
    cp $10
    jr c, jr_000_13cf

    ld d, $02

jr_000_13cf:
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld a, [wBallWorkY]
    sub $08
    cp $1e
    jr nc, jr_000_13e2

    add $0e

jr_000_13e2:
    ld b, a
    ld [hl+], a
    ld a, [wBallWorkX]
    add $04
    cp $90
    jr c, jr_000_13ef

    ld a, $90

jr_000_13ef:
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

jr_000_1415:
    ld a, [wBatExplosionTimer]
    or a
    jp nz, UpdateBall_Move

    ld a, [wBallSticks]
    or a
    jp z, UpdateBall_Split

    ld a, [wBallWorkSpeed]
    bit 7, a
    jr nz, jr_000_1453

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

jr_000_1453:
    ld a, [wLaunchDirection]
    or a
    jr z, jr_000_1486

    cp $04
    jr nz, jr_000_1479

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

jr_000_1479:
    ld [wBallWorkDirection], a
    ld a, [wBallWorkSpeed]
    res 7, a
    ld [wBallWorkSpeed], a
    jr UpdateBall_Split

jr_000_1486:
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

jr_000_14b9:
    add hl, de
    dec a
    jr nz, jr_000_14b9

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
    jr nz, jr_000_14e4

    dec a
    and $1f

jr_000_14e4:
    cp $10
    jr nz, jr_000_14eb

    dec a
    and $1f

jr_000_14eb:
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
    jr nz, jr_000_150c

    inc a
    and $1f

jr_000_150c:
    cp $10
    jr nz, jr_000_1513

    inc a
    and $1f

jr_000_1513:
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
    jr z, jr_000_1549

    res 7, a
    or a
    set 7, a
    ld [wBallWorkFlags], a
    jr nz, jr_000_1549

    xor a
    ld [wBallWorkFlags], a
    ld a, [wBallWorkDirection]
    inc a
    and $1f
    ld [wBallWorkDirection], a
    and $07
    jr nz, jr_000_1549

    ld a, [wBallWorkDirection]
    inc a
    ld [wBallWorkDirection], a

jr_000_1549:
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
    jr z, jr_000_1582

jr_000_157a:
    sra b
    rr c
    dec a
    jr nz, jr_000_157a

    push bc

jr_000_1582:
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
    jr z, jr_000_15ae

jr_000_15a1:
    sra d
    rr e
    dec a
    jr nz, jr_000_15a1

    push de
    ld a, $01
    ld [wBallSecondStep], a

jr_000_15ae:
    ld a, l
    ld [wBallWorkYSub], a
    ld a, h
    ld [wBallWorkY], a
    xor a
    ld [wUnk_d8ab], a
    call CollideBall
    ld a, [wBallSecondStep]
    or a
    ret z

    ld a, [wBallBounced]
    or a
    jr z, jr_000_15cb

    add sp, $04
    ret

jr_000_15cb:
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
    jr z, jr_000_160b

    jr c, jr_000_160b

    ld a, $01
    ld [wBallBounced], a
    call ReflectBallLeft

jr_000_160b:
    ld a, [wBallWorkX]
    add $07
    ld c, a
    ld a, [wBallWorkY]
    add $04
    call CollideBallPoint
    jr z, jr_000_1625

    jr c, jr_000_1625

    ld a, $01
    ld [wBallBounced], a
    call ReflectBallRight

jr_000_1625:
    ld a, [wBallWorkX]
    add $04
    ld c, a
    ld a, [wBallWorkY]
    add $07
    call CollideBallPoint
    jr z, jr_000_163f

    jr c, jr_000_163f

    ld a, $01
    ld [wBallBounced], a
    call ReflectBallBottom

jr_000_163f:
    ld a, [wBallWorkX]
    add $04
    ld c, a
    ld a, [wBallWorkY]
    call CollideBallPoint
    jr z, jr_000_1657

    jr c, jr_000_1657

    ld a, $01
    ld [wBallBounced], a
    call ReflectBallTop

jr_000_1657:
    ld a, [wAntigravityActive]
    or a
    jr z, CollideBall_Corners

    ld a, [wBallWorkX]
    ld c, a
    ld a, [wBallWorkY]
    call CollideBallPoint
    jr z, jr_000_1673

    jr c, jr_000_1673

    ld a, $01
    ld [wBallBounced], a
    call ReflectBallTop

jr_000_1673:
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

CollideBall_Corners:
    ld a, [wBallWorkX]
    inc a
    ld c, a
    push bc
    ld a, [wBallWorkY]
    add $06
    push af
    call CollideBallPoint
    jr z, jr_000_16d4

    jr c, jr_000_16d4

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
    jr z, jr_000_16bd

    jr nc, jr_000_16b8

    call ReflectBallLeft
    jr jr_000_16d6

jr_000_16b8:
    call ReflectBallBottom
    jr jr_000_16d6

jr_000_16bd:
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
    jr jr_000_16d6

jr_000_16d4:
    add sp, $04

jr_000_16d6:
    ld a, [wBallWorkX]
    add $06
    ld c, a
    push bc
    ld a, [wBallWorkY]
    add $06
    push af
    call CollideBallPoint
    jr z, jr_000_1725

    jr c, jr_000_1725

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
    jr z, jr_000_170e

    jr nc, jr_000_1709

    call ReflectBallRight
    jr jr_000_1727

jr_000_1709:
    call ReflectBallBottom
    jr jr_000_1727

jr_000_170e:
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
    jr jr_000_1727

jr_000_1725:
    add sp, $04

jr_000_1727:
    ld a, [wBallWorkX]
    inc a
    ld c, a
    push bc
    ld a, [wBallWorkY]
    inc a
    push af
    call CollideBallPoint
    jr z, jr_000_1769

    jr c, jr_000_1769

    ld a, $01
    ld [wBallBounced], a
    pop af
    pop bc
    and $07
    ld d, a
    ld a, c
    and $0f
    cp d
    jr z, jr_000_1755

    jr nc, jr_000_1750

    call ReflectBallLeft
    jr jr_000_176b

jr_000_1750:
    call ReflectBallTop
    jr jr_000_176b

jr_000_1755:
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
    jr jr_000_176b

jr_000_1769:
    add sp, $04

jr_000_176b:
    ld a, [wBallWorkX]
    add $06
    ld c, a
    push bc
    ld a, [wBallWorkY]
    inc a
    push af
    call CollideBallPoint
    jr z, jr_000_17b5

    jr c, jr_000_17b5

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
    jr z, jr_000_179e

    jr nc, jr_000_1799

    call ReflectBallRight
    jr jr_000_17b7

jr_000_1799:
    call ReflectBallTop
    jr jr_000_17b7

jr_000_179e:
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
    jr jr_000_17b7

jr_000_17b5:
    add sp, $04

jr_000_17b7:
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
    jr nz, jr_000_17e0

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

jr_000_17e0:
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
    jr nz, jr_000_1815

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

jr_000_1815:
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
    jr nz, jr_000_187d

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

jr_000_187d:
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
    jr z, jr_000_18b6

    cp $0e
    jr z, jr_000_18af

    push af
    xor a
    ld [wBallWorkFlags], a
    pop af
    jp HitBrickWithBall

jr_000_18af:
    ld a, [wUnk_d8ab]
    or a
    call z, SpawnUnbreakableHitEffect

jr_000_18b6:
    ld a, [wBallWorkFlags]
    bit 7, a
    jr nz, jr_000_18c8

    cp $14
    jr z, jr_000_18c7

    inc a
    ld [wBallWorkFlags], a
    jr jr_000_18d2

jr_000_18c7:
    xor a

jr_000_18c8:
    res 7, a
    inc a
    and $07
    set 7, a
    ld [wBallWorkFlags], a

jr_000_18d2:
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
    jr z, jr_000_18f2

    ld hl, BatBounceTable_BigBat
    ld de, $0050

jr_000_18f2:
    ld a, [wSlowBallActive]
    or a
    jr z, jr_000_18f9

    add hl, de

jr_000_18f9:
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

jr_000_1930:
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
    jr nz, jr_000_1930

    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ret

UpdateBatTiles:
    ld a, [wBatExplosionTimer]
    or a
    jr nz, jr_000_195d

    ld a, [wBatWidth]
    cp $20
    jr nz, jr_000_19a6

jr_000_195d:
    ld a, [wUnk_dab2]
    or a
    ret z

    xor a
    ld [wUnk_dab2], a
    ld hl, $0200
    ld d, $00
    ld a, [wUnk_dab1]
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
    jr nc, jr_000_1991

    ld a, $0a

jr_000_1991:
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

jr_000_19a6:
    ld [wUnk_dab2], a
    ld hl, $0200
    ld a, [wBatX]
    sub $08
    sra a
    sra a
    sra a
    ld e, a
    ld d, $00
    ld [wUnk_dab1], a
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
    jr nc, jr_000_19de

    ld a, $0a

jr_000_19de:
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
    jr nz, jr_000_1a92

    set 7, [hl]
    dec a
    ld [wHitNewValue], a
    or a
    jr z, jr_000_1a2b

    ld a, [wPlasmaState]
    cp $02
    jr nz, jr_000_1a2b

    dec a
    ld [wHitNewValue], a

jr_000_1a2b:
    ld a, [wPlasmaState]
    cp $02
    jr nz, jr_000_1a58

    ld a, [wUnk_d8bb]
    ld [wUnk_d8ba], a
    jr jr_000_1a5c

; The ball hit the brick at HL. A = its hit points.
; While Ninja is active the brick is set to 1 hit point and the ball does not bounce.
HitBrickWithBall:
    and $0f
    ld c, l
    ld b, h
    ld de, $0120
    add hl, de
    bit 7, [hl]
    jr nz, jr_000_1a8a

    set 7, [hl]
    dec a
    ld [wHitNewValue], a
    or a
    jr z, jr_000_1a58

    ld a, [wNinjaActive]
    or a
    jr z, jr_000_1a58

    ld [wHitNewValue], a

jr_000_1a58:
    xor a
    ld [wUnk_d8ba], a

jr_000_1a5c:
    ld a, l
    ld [wHitPowerupPtr], a
    ld a, h
    ld [wHitPowerupPtr + 1], a
    ld d, $00
    dec bc
    ld a, [bc]
    cp $0f
    jr nz, jr_000_1a6e

    set 0, d

jr_000_1a6e:
    ld hl, $fff1
    add hl, bc
    ld a, [hl]
    cp $0f
    jr nz, jr_000_1a79

    set 1, d

jr_000_1a79:
    ld a, d
    ld [wHitRedrawIndex], a
    ld de, $3326
    add hl, de
    add hl, hl
    call QueueBrickHit
    ld b, $01
    call AddScore

jr_000_1a8a:
    ld a, [wNinjaActive]
    or a
    jr z, jr_000_1a92

    xor a
    ret

jr_000_1a92:
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
    jr z, jr_000_1aa2

    set 0, b

jr_000_1aa2:
    ld a, [hl]
    or a
    jr z, jr_000_1aa8

    set 1, b

jr_000_1aa8:
    ld de, $ffdf
    add hl, de
    ld a, [hl-]
    or a
    jr z, jr_000_1ab8

    set 2, b
    cp $0f
    jr nz, jr_000_1ab8

    set 5, b

jr_000_1ab8:
    ld a, [hl]
    or a
    jr z, jr_000_1ac6

    set 3, b
    cp $0f
    jr nz, jr_000_1ac6

    set 4, b
    jr jr_000_1ad7

jr_000_1ac6:
    ld de, $fff0
    add hl, de
    ld a, [hl]
    ld de, $0010
    add hl, de
    cp $0f
    jr nz, jr_000_1ad7

    set 3, b
    set 2, b

jr_000_1ad7:
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

jr_000_1af1:
    ld a, [hl]
    or a
    jr z, jr_000_1af8

    add hl, de
    jr jr_000_1af1

jr_000_1af8:
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
    ld a, [wUnk_d8ba]
    ld [hl+], a
    ret

; Count down wBricksLeft and end the level when it reaches 0.
CountBrickDestroyed:
    ld a, [wBricksLeft]
    dec a
    ld [wBricksLeft], a
    jr nz, jr_000_1b55

    ld a, [hStateTimer]
    or a
    jr nz, jr_000_1b55

    xor a
    ld [hLifeLostTimer], a
    ld b, $02
    ld a, [wLevelsSincePassword]
    cp $04
    jr nz, jr_000_1b3b

    call NextLevelMusic
    ld a, [wEndingSeen]
    or a
    jr nz, jr_000_1b3b

    ld b, $09

jr_000_1b3b:
    ld a, b
    ld [hGameState], a
    ld a, $0f
    ld [hStateTimer], a
    ld a, [wCurrentLevel]
    inc a
    cp $a0
    jr nz, jr_000_1b52

    ld a, $0d
    ld [hGameState], a
    xor a

jr_000_1b52:
    ld [wCurrentLevel], a

jr_000_1b55:
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

jr_000_1b69:
    ld a, [hl]
    or a
    jr z, jr_000_1b70

    add hl, de
    jr jr_000_1b69

jr_000_1b70:
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
    jr nc, jr_000_1c43

    inc b

jr_000_1c43:
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
    jr nc, jr_000_1c76

    inc b

jr_000_1c76:
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
    jr nc, jr_000_1ca8

    inc b

jr_000_1ca8:
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
    jr nc, jr_000_1ccd

    inc b

jr_000_1ccd:
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
    jr nc, jr_000_1cf2

    inc b

jr_000_1cf2:
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

BrickRedrawCase_Lit_BelowRight:
    pop hl
    call BrickRedraw_Lit
    jp BrickRedraw_BelowRightLit

BrickRedrawCase_Lit_BelowLeft:
    pop hl
    call BrickRedraw_Lit
    jp BrickRedraw_BelowLeftLit

BrickRedrawCase_Lit:
    pop hl

    jp BrickRedraw_Lit

BrickRedrawCase_ShadowRight_Below:
    pop hl
    call BrickRedraw_ShadowRight
    jp BrickRedraw_BelowLit

BrickRedrawCase_ShadowRight_BelowRight:
    pop hl
    call BrickRedraw_ShadowRight
    jp BrickRedraw_BelowRightLit

BrickRedrawCase_ShadowRight_BelowLeft:
    pop hl
    call BrickRedraw_ShadowRight
    jp BrickRedraw_BelowLeftLit

BrickRedrawCase_ShadowRight:
    pop hl
    jp BrickRedraw_ShadowRight

BrickRedrawCase_ShadowLeft_Below:
    pop hl
    call BrickRedraw_ShadowLeft
    jp BrickRedraw_BelowLit

BrickRedrawCase_ShadowLeft_BelowRight:
    pop hl
    call BrickRedraw_ShadowLeft
    jp BrickRedraw_BelowRightLit

BrickRedrawCase_ShadowLeft_BelowLeft:
    pop hl
    call BrickRedraw_ShadowLeft
    jp BrickRedraw_BelowLeftLit

BrickRedrawCase_ShadowLeft:
    pop hl
    jp BrickRedraw_ShadowLeft

BrickRedrawCase_Shadow_Below:
    pop hl
    call BrickRedraw_Shadow
    jp BrickRedraw_BelowLit

BrickRedrawCase_Shadow_BelowRight:
    pop hl
    call BrickRedraw_Shadow
    jp BrickRedraw_BelowRightLit

BrickRedrawCase_Shadow_BelowLeft:
    pop hl
    call BrickRedraw_Shadow
    jp BrickRedraw_BelowLeftLit

BrickRedrawCase_Shadow:
    pop hl
    jp BrickRedraw_Shadow

BrickRedrawCase_Shadow_BelowHalfShadow:
    pop hl
    call BrickRedraw_Shadow
    jp BrickRedraw_BelowHalfShadow

BrickRedrawCase_Shadow_BelowLeftShadow:
    pop hl
    call BrickRedraw_Shadow
    jp BrickRedraw_BelowLeftShadow

; Copy the queued brick tile changes to the buffer that VBlank writes to the screen.
FlushBrickRedraw:
    ld a, [wBrickRedrawCount]
    or a
    jr z, jr_000_1dae

    ld [hTemp], a
    ld hl, wBrickRedrawQueue
    ld bc, wVBlankAttrWrites
    ld a, [wVBlankTileWritePtr]
    ld e, a
    ld a, [wVBlankTileWritePtr + 1]
    ld d, a

jr_000_1d93:
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
    jr nz, jr_000_1d93

jr_000_1dae:
    ld a, $09
    ld [ROM_BANK], a
    ld a, [wBrickShinePtr]
    ld l, a
    ld a, [wBrickShinePtr + 1]
    ld h, a
    ld b, $0c

jr_000_1dbd:
    ld a, [hl+]
    cp $ff
    jr nz, jr_000_1dc6

    ld hl, BrickShineAnimation
    ld a, [hl+]

jr_000_1dc6:
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_1dbd

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

MarkBrickHitQueue:
    ld b, $01
    jr jr_000_1df5

ClearBrickHitQueue:
    ld b, $00

jr_000_1df5:
    ld hl, wBrickHitQueue
    ld c, $0c

jr_000_1dfa:
    ld a, [hl]
    or a
    jr z, jr_000_1e08

    ld [hl], b
    ld de, $0007
    add hl, de
    ld [hl], $00
    inc hl
    jr jr_000_1e0c

jr_000_1e08:
    ld de, $0008
    add hl, de

jr_000_1e0c:
    dec c
    jr nz, jr_000_1dfa

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
    jr nz, jr_000_1e64

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

jr_000_1e64:
    push hl
    ld hl, $fee0
    add hl, bc
    ld [hl], a
    pop hl
    cp $01
    jr nz, jr_000_1e71

    ld b, $06

jr_000_1e71:
    cp $02
    jr nz, jr_000_1e77

    ld b, $0c

jr_000_1e77:
    cp $03
    jr nz, jr_000_1e7d

    ld b, $12

jr_000_1e7d:
    ld a, [hl+]
    or a
    jr nz, jr_000_1e8d

    ld a, $48
    sub b
    ld [wBrickTileLeft], a
    ld a, $49
    sub b
    ld [wBrickTileRight], a

jr_000_1e8d:
    cp $01
    jr nz, jr_000_1e9d

    ld a, $4a
    sub b
    ld [wBrickTileLeft], a
    ld a, $49
    sub b
    ld [wBrickTileRight], a

jr_000_1e9d:
    cp $02
    jr nz, jr_000_1eaf

jr_000_1ea1:
    ld a, $4a
    sub b
    ld [wBrickTileLeft], a
    ld a, $4b
    sub b
    ld [wBrickTileRight], a
    jr jr_000_1eb3

jr_000_1eaf:
    cp $03
    jr z, jr_000_1ea1

jr_000_1eb3:
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
    jr nz, jr_000_1eed

    ld b, $00

jr_000_1eed:
    cp $01
    jr nz, jr_000_1ef3

    ld b, $06

jr_000_1ef3:
    cp $02
    jr nz, jr_000_1ef9

    ld b, $0c

jr_000_1ef9:
    cp $03
    jr nz, jr_000_1eff

    ld b, $12

jr_000_1eff:
    ld a, [hl+]
    or a
    jr nz, jr_000_1f0f

    ld a, $46
    sub b
    ld [wBrickTileLeft], a
    ld a, $47
    sub b
    ld [wBrickTileRight], a

jr_000_1f0f:
    cp $01
    jr nz, jr_000_1f1f

    ld a, $48
    sub b
    ld [wBrickTileLeft], a
    ld a, $47
    sub b
    ld [wBrickTileRight], a

jr_000_1f1f:
    cp $02
    jr nz, jr_000_1f31

jr_000_1f23:
    ld a, $48
    sub b
    ld [wBrickTileLeft], a
    ld a, $49
    sub b
    ld [wBrickTileRight], a
    jr jr_000_1f35

jr_000_1f31:
    cp $03
    jr z, jr_000_1f23

jr_000_1f35:
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

ProcessBrickHitQueue_SkipEntry:
    ld a, l
    add $08
    ld l, a
    jr nc, ProcessBrickHitQueue_Next

    inc h

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
    ld [wUnk_c959], a
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
    ld de, wUnk_dac3
    ld bc, $0014
    call DataTransfer

    ld a, [wUnk_df43]
    ld [wUnk_dad2], a
    call FormatLevelNumber
    ld a, [wLangTextStartGame]
    ld l, a
    ld a, [wLangTextStartGame + 1]
    ld h, a
    call DrawString
    ld hl, wUnk_dac3
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
    jr z, jr_000_205b

    ld a, [wLangTextMusicOff]
    ld l, a
    ld a, [wLangTextMusicOff + 1]
    ld h, a

jr_000_205b:
    call DrawString
    ld a, [wLangTextSfxOn]
    ld l, a
    ld a, [wLangTextSfxOn + 1]
    ld h, a
    ld a, [wSfxOff]
    or a
    jr z, jr_000_2074

    ld a, [wLangTextSfxOff]
    ld l, a
    ld a, [wLangTextSfxOff + 1]
    ld h, a

jr_000_2074:
    call DrawString
    ld a, [wCheatShowVersion]
    or a
    jr z, jr_000_2083

    ld hl, Text_Version
    call DrawString

jr_000_2083:
    ld hl, wUnk_db56
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

jr_000_20c4:
    ld b, a
    sub $64
    jr nc, jr_000_20f6

    ld a, c
    or a
    jr z, jr_000_20d6

    add $30
    ld [wStartLevelText], a
    ld a, b
    or a
    jr z, jr_000_20f9

jr_000_20d6:
    ld a, b
    ld c, $00

jr_000_20d9:
    ld b, a
    sub $0a
    jr nc, jr_000_20f3

    ld a, c
    or a

    jr z, jr_000_20eb

    add $30
    ld [wStartLevelText + 1], a
    ld a, b
    or a
    jr z, jr_000_20f9

jr_000_20eb:
    ld a, b
    add $30
    ld [wStartLevelText + 2], a
    jr jr_000_20f9

jr_000_20f3:
    inc c
    jr jr_000_20d9

jr_000_20f6:
    inc c
    jr jr_000_20c4

jr_000_20f9:
    ret

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
    jr z, jr_000_2126

    ld a, $fb
    ld [wMenuIdleTimer], a

jr_000_2126:
    ld a, [wPasswordCursor]
    or a
    jr nz, jr_000_2131

    ld hl, wPasswordEntry
    jr jr_000_214a

jr_000_2131:
    cp $01
    jr nz, jr_000_213a

    ld hl, wPasswordEntry + 1
    jr jr_000_214a

jr_000_213a:
    cp $02
    jr nz, jr_000_2143

    ld hl, wPasswordEntry + 2
    jr jr_000_214a

jr_000_2143:
    cp $03
    jr nz, jr_000_214a

    ld hl, wPasswordEntry + 3

jr_000_214a:
    bit 3, b
    jr z, jr_000_217c

    ld a, [wMenuDownHeld]
    or a
    jr nz, jr_000_2180

    inc a
    ld [wMenuDownHeld], a
    ld a, $19
    call PlaySound
    ld a, [hl]

jr_000_215e:
    dec a
    cp $41
    jr z, jr_000_215e

    cp $45
    jr z, jr_000_215e

    cp $49
    jr z, jr_000_215e

    cp $4f
    jr z, jr_000_215e

    cp $55
    jr z, jr_000_215e

    cp $40
    jr nz, jr_000_2179

    add $1a

jr_000_2179:
    ld [hl], a
    jr jr_000_2180

jr_000_217c:
    xor a
    ld [wMenuDownHeld], a

jr_000_2180:
    bit 2, b
    jr z, jr_000_21ae

    ld a, [wMenuUpHeld]
    or a
    jr nz, jr_000_21b2

    inc a
    ld [wMenuUpHeld], a
    ld a, $19
    call PlaySound
    ld a, [hl]

jr_000_2194:
    inc a
    cp $45
    jr z, jr_000_2194

    cp $49
    jr z, jr_000_2194

    cp $4f
    jr z, jr_000_2194

    cp $55
    jr z, jr_000_2194

    cp $5b
    jr nz, jr_000_21ab

    sub $19

jr_000_21ab:
    ld [hl], a
    jr jr_000_21b2

jr_000_21ae:
    xor a
    ld [wMenuUpHeld], a

jr_000_21b2:
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
    jr z, jr_000_21d0

    inc a

jr_000_21d0:
    bit 5, b
    jr z, jr_000_21d8

    or a
    jr z, jr_000_21d8

    dec a

jr_000_21d8:
    bit 7, b
    jr z, jr_000_21dd

    inc a

jr_000_21dd:
    bit 6, b
    jr z, jr_000_21e5

    or a
    jr z, jr_000_21e5

    dec a

jr_000_21e5:
    bit 0, b
    jr z, jr_000_21ea

    inc a

jr_000_21ea:
    bit 1, b
    jr z, jr_000_21f2

    or a
    jr z, jr_000_21f2

    dec a

jr_000_21f2:
    ld [wPasswordCursor], a
    or a
    jr nz, jr_000_2203

    ld a, $04
    ld [wPasswordLetterColours], a
    ld a, $01
    ld [wPasswordLetterColours + 1], a
    ret

jr_000_2203:
    cp $01
    jr nz, jr_000_2213

    ld [wPasswordLetterColours], a
    ld [wPasswordLetterColours + 2], a
    ld a, $04
    ld [wPasswordLetterColours + 1], a
    ret

jr_000_2213:
    cp $02
    jr nz, jr_000_2225

    ld a, $01
    ld [wPasswordLetterColours + 1], a
    ld [wPasswordLetterColours + 3], a
    ld a, $04
    ld [wPasswordLetterColours + 2], a
    ret

jr_000_2225:
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
    jr z, jr_000_225e

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

jr_000_225e:
    ld a, $01
    call ChangeROMBank
    xor a
    ld [wPasswordEntryActive], a
    ret

SubmitPassword_ButtonsReleased:
    xor a
    ld [wMenuButtonHeld], a
    ret

; Menu navigation: wMenuCursor selects one of 5 items.
MainMenu_Navigate:
    ld a, [wMenuCursor]
    or a
    jr nz, jr_000_22b2

    ld a, $04
    ld [wMenuItemColours], a
    ld a, $01
    ld [wMenuItemColours + 1], a
    ld [wMenuItemColours + 2], a
    ld [wMenuItemColours + 3], a
    ld [wMenuItemColours + 4], a
    ld a, [wStartLevel]
    or a
    jr nz, jr_000_228f

    ld [wMenuItemColours + 1], a

jr_000_228f:
    ld a, [hJoypad]
    and $f0
    or a
    jr z, jr_000_22b2

    ld a, [hGameState]
    cp $02
    jr z, jr_000_22b2

    ld a, $1a
    call PlaySound
    ld a, $02
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ld b, $00
    call StartGame

jr_000_22b2:
    ld a, [wMenuCursor]
    dec a
    jr nz, jr_000_22f7

    ld a, $04
    ld [wMenuItemColours + 1], a
    ld a, $01
    ld [wMenuItemColours], a
    ld [wMenuItemColours + 2], a
    ld [wMenuItemColours + 3], a
    ld [wMenuItemColours + 4], a
    ld a, [wStartLevel]
    or a
    jr nz, jr_000_22d4

    ld [wMenuItemColours + 1], a

jr_000_22d4:
    ld a, [hJoypad]
    and $f0
    or a
    jr z, jr_000_22f7

    ld a, [hGameState]
    cp $02
    jr z, jr_000_22f7

    ld a, $1a
    call PlaySound
    ld a, $02
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ld b, $01
    call StartGame

jr_000_22f7:
    ld a, [wMenuCursor]
    cp $02
    jr nz, jr_000_235b

    ld a, $04
    ld [wMenuItemColours + 2], a
    ld a, $01
    ld [wMenuItemColours], a
    ld [wMenuItemColours + 1], a
    ld [wMenuItemColours + 3], a
    ld [wMenuItemColours + 4], a
    ld a, [wStartLevel]
    or a
    jr nz, jr_000_231a

    ld [wMenuItemColours + 1], a

jr_000_231a:
    ld a, [hJoypad]
    and $f0
    or a
    jr z, jr_000_2357

    ld a, [wMenuButtonHeld]
    or a
    jr nz, jr_000_235b

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
    jr jr_000_235b

jr_000_2357:
    xor a
    ld [wMenuButtonHeld], a

jr_000_235b:
    ld a, [wMenuCursor]
    cp $03
    jr nz, jr_000_237e

    ld a, $04
    ld [wMenuItemColours + 3], a
    ld a, $01
    ld [wMenuItemColours], a
    ld [wMenuItemColours + 1], a
    ld [wMenuItemColours + 2], a
    ld [wMenuItemColours + 4], a
    ld a, [wStartLevel]
    or a
    jr nz, jr_000_237e

    ld [wMenuItemColours + 1], a

jr_000_237e:
    ld a, [wMenuCursor]
    cp $04
    jr nz, jr_000_23a1

    ld a, $04
    ld [wMenuItemColours + 4], a
    ld a, $01
    ld [wMenuItemColours], a
    ld [wMenuItemColours + 1], a
    ld [wMenuItemColours + 2], a
    ld [wMenuItemColours + 3], a
    ld a, [wStartLevel]
    or a
    jr nz, jr_000_23a1

    ld [wMenuItemColours + 1], a

jr_000_23a1:
    ld a, [hJoypad]
    ld b, a
    or a
    jr z, jr_000_23ad

    ld a, $fd
    ld [wMenuIdleTimer], a

jr_000_23ad:
    bit 3, b
    jr z, jr_000_23dd

    ld a, [wMenuDownHeld]
    or a
    jr nz, jr_000_23e1

    inc a
    ld [wMenuDownHeld], a
    ld a, $19
    call PlaySound
    ld a, [wMenuCursor]
    inc a
    cp $05
    jr nz, jr_000_23cb

    xor a
    jr jr_000_23d8

jr_000_23cb:
    ld c, a
    ld a, [wStartLevel]
    or a
    ld a, c
    jr nz, jr_000_23d8

    cp $01
    jr nz, jr_000_23d8

    inc a

jr_000_23d8:
    ld [wMenuCursor], a
    jr jr_000_23e1

jr_000_23dd:
    xor a
    ld [wMenuDownHeld], a

jr_000_23e1:
    bit 2, b
    jr z, jr_000_2412

    ld a, [wMenuUpHeld]
    or a
    jr nz, jr_000_2416

    inc a
    ld [wMenuUpHeld], a
    ld a, $19
    call PlaySound
    ld a, [wMenuCursor]
    dec a
    cp $ff
    jr nz, jr_000_2400

    ld a, $04
    jr jr_000_240d

jr_000_2400:
    ld c, a

    ld a, [wStartLevel]
    or a
    ld a, c
    jr nz, jr_000_240d

    cp $01
    jr nz, jr_000_240d

    dec a

jr_000_240d:
    ld [wMenuCursor], a
    jr jr_000_2416

jr_000_2412:
    xor a
    ld [wMenuUpHeld], a

jr_000_2416:
    ld a, [wMenuCursor]
    cp $03
    jp c, MainMenu_IdleTick

    ld a, b
    and $f0
    or a
    jr z, jr_000_2458

    ld a, [wMenuButtonHeld]
    or a
    jr nz, jr_000_245c

    inc a
    ld [wMenuButtonHeld], a
    ld a, $19
    call PlaySound
    ld a, [wMenuCursor]
    cp $03
    jr nz, jr_000_244e

    ld a, [wMusicOff]
    xor $01
    ld [wMusicOff], a
    ld e, $05
    or a
    jr z, jr_000_2449

    ld e, $00

jr_000_2449:
    call StartSong
    jr jr_000_245c

jr_000_244e:
    ld a, [wSfxOff]
    xor $01
    ld [wSfxOff], a
    jr jr_000_245c

jr_000_2458:
    xor a
    ld [wMenuButtonHeld], a

jr_000_245c:
    bit 0, b
    jr z, jr_000_2494

    ld a, [wUnk_dab8]
    or a
    jr nz, jr_000_2498

    inc a
    ld [wUnk_dab8], a
    ld a, $19
    call PlaySound
    ld a, [wMenuCursor]
    cp $03
    jr nz, jr_000_248a

    ld a, [wMusicOff]
    xor $01
    ld [wMusicOff], a
    ld e, $05
    or a
    jr z, jr_000_2485

    ld e, $00

jr_000_2485:
    call StartSong
    jr jr_000_2498

jr_000_248a:
    ld a, [wSfxOff]
    xor $01
    ld [wSfxOff], a
    jr jr_000_2498

jr_000_2494:
    xor a
    ld [wUnk_dab8], a

jr_000_2498:
    bit 1, b
    jr z, jr_000_24d0

    ld a, [wUnk_dab9]
    or a
    jr nz, MainMenu_IdleTick

    inc a
    ld [wUnk_dab9], a
    ld a, $19
    call PlaySound
    ld a, [wMenuCursor]
    cp $03
    jr nz, jr_000_24c6

    ld a, [wMusicOff]
    xor $01
    ld [wMusicOff], a
    ld e, $05
    or a
    jr z, jr_000_24c1

    ld e, $00

jr_000_24c1:
    call StartSong
    jr MainMenu_IdleTick

jr_000_24c6:
    ld a, [wSfxOff]
    xor $01
    ld [wSfxOff], a
    jr MainMenu_IdleTick

jr_000_24d0:
    xor a
    ld [wUnk_dab9], a

MainMenu_IdleTick:
    ld a, [wMenuTick]
    inc a
    ld [wMenuTick], a
    and $01
    jr z, jr_000_251a

    ld a, [wMenuIdleTimer]
    cp $ff
    jr z, jr_000_251a

    dec a
    ld [wMenuIdleTimer], a
    jr nz, jr_000_251a

    ld a, [hGameState]
    cp $01
    jr nz, jr_000_251a

    ld a, [wAttractToggle]
    xor $01
    ld [wAttractToggle], a
    jr z, jr_000_2501

    ld a, $07
    jr jr_000_2503

jr_000_2501:
    ld a, $08

jr_000_2503:
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ld a, $01
    ld [wUnk_ccb6], a
    ld a, $fe
    ld [wMenuIdleTimer], a
    ld a, $1a
    call PlaySound

jr_000_251a:
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
    jr z, jr_000_2533

    ld a, [wStartLevel]
    jr jr_000_2535

jr_000_2533:
    ld a, $00

jr_000_2535:
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
    ld [wUnk_c958], a
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
    jr z, jr_000_25cf

    ld hl, Tilemap_TitleScreen_007_5f14
    ld de, $9a20
    xor a
    ld b, $14
    ld c, $01
    call CopyTilemapRect

jr_000_25cf:
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
    ld hl, TitleScreenData_007_6538
    dec a
    jr z, jr_000_2605

    ld hl, TitleScreenData_007_67b8
    dec a
    jr z, jr_000_2605

    ld hl, TitleScreenData_007_6678
    dec a
    jr z, jr_000_2605

    ld hl, Gfx_TitleScreen_007_68f8

jr_000_2605:
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
    jr z, jr_000_2640

    ld hl, Tilemap_TitleScreen_007_5d98
    ld a, $e2
    ld de, $9a20
    ld b, $14
    ld c, $01
    call CopyTilemapRect

jr_000_2640:
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
    jr nz, jr_000_2661

    ld [wMenuItemColours + 1], a

jr_000_2661:
    call TitleScreen_InitLetters
    ret

TitleScreen_Update:
    ld a, [hGameState]
    cp $01
    jr z, jr_000_2683

    ld a, [hJoypad]
    and $f0
    or a
    jr z, jr_000_2683

    ld a, $01
    ld [hGameState], a
    ld a, $1e
    ld [hStateTimer], a
    ld a, $1a
    call PlaySound

jr_000_2683:
    call TitleScreen_SlideLetters
    ret

StateInit_GameOver:
    ld a, [wSfxOff]
    or a
    jr nz, jr_000_2692

    ld e, $07
    call StartSong

jr_000_2692:
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
    ld [wUnk_dbea], a
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
    ld [wUnk_dc1e], a
    ld a, $3c
    add b
    ld [wUnk_dc1f], a
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
    jr z, jr_000_276d

    call UpdateUfo

jr_000_276d:
    call UpdateProjectiles
    ld a, [wLevelType]
    bit 1, a
    jr z, jr_000_277a

    call UpdateBlob

jr_000_277a:
    ret

UpdateBlob:
    ld a, [wBlobThrowing]
    or a
    jr z, jr_000_27f3

    ld hl, BlobSprites_Throwing
    ld a, [wBlobFrame]
    and $01
    ld e, a
    or a
    jr nz, jr_000_279a

    ld a, [wBlobFrameTick]
    or a
    jr nz, jr_000_279a

    ld a, [wBlobThrowCount]
    inc a
    ld [wBlobThrowCount], a

jr_000_279a:
    ld a, [wBlobFrameTick]
    inc a
    ld [wBlobFrameTick], a
    and $07
    jr nz, jr_000_2815

    ld a, e
    inc a
    cp $02
    jr z, jr_000_27b0

    ld [wBlobFrame], a
    jr jr_000_2815

jr_000_27b0:
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
    jr nc, jr_000_27e0

    ld hl, BlobThrowDirections_Left
    add hl, de
    ld l, [hl]
    ld h, d
    ld a, $40

    ld de, BlobThrowData_Left

    jr jr_000_27eb

jr_000_27e0:
    ld hl, BlobThrowDirections_Right
    add hl, de
    ld l, [hl]
    ld h, d
    ld a, $24
    ld de, UpdateBlobData_001_4e6e

jr_000_27eb:
    call SpawnProjectile
    ld a, $0e
    call PlaySound

jr_000_27f3:
    ld hl, BlobSprites
    ld a, [wGhostActive]
    or a
    jr z, jr_000_27ff

    ld hl, BlobSprites_Ghost

jr_000_27ff:
    ld a, [wBlobFrame]
    and $03
    ld e, a
    ld a, [wBlobFrameTick]
    inc a
    ld [wBlobFrameTick], a
    and $07
    jr nz, jr_000_2815

    ld a, e
    inc a
    ld [wBlobFrame], a

jr_000_2815:
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

jr_000_2831:
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
    ld a, [wLevelFlagsHigh]
    add d
    pop de
    ld [hl+], a
    ld a, [hTemp]
    dec a
    ld [hTemp], a
    jr nz, jr_000_2831

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

jr_000_2899:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_000_2899

    pop bc
    ld a, [wEnemyPathWork + 11]
    dec a
    ld [wEnemyPathWork + 11], a
    jr nz, jr_000_2901

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
    jr nz, jr_000_28fa

    ld a, [wEnemyPathWork + 4]
    dec a
    ld [wEnemyPathWork + 4], a
    jr nz, jr_000_28ed

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

jr_000_28ed:
    ld a, [wEnemyPathWork + 9]
    ld l, a
    ld a, [wEnemyPathWork + 10]
    ld h, a
    xor a
    ld [wEnemyPathWork + 8], a
    ld a, [hl+]

jr_000_28fa:
    ld [wEnemyPathWork + 11], a
    ld a, [hl]
    ld [wEnemyPathWork + 12], a

jr_000_2901:
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

jr_000_2944:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_000_2944

    ret

ClearProjectiles:
    ld hl, wProjectiles
    ld de, $0009
    ld b, $04
    xor a

jr_000_2954:
    ld [hl], a
    add hl, de
    dec b
    jr nz, jr_000_2954

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

jr_000_2964:
    ld a, [hl]
    or a
    jr z, jr_000_296b

    add hl, de
    jr jr_000_2964

jr_000_296b:
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

UpdateProjectiles:
    ld hl, wProjectiles
    ld de, $0009
    ld b, $04

jr_000_2989:
    ld a, [hl]
    or a
    jr z, jr_000_29e0

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
    jr jr_000_29e1

jr_000_29e0:
    add hl, de

jr_000_29e1:
    dec b
    jr nz, jr_000_2989

    ld a, [wUnk_dbea]
    or a
    jr z, jr_000_2a4a

    dec a
    ld [wUnk_dbea], a
    jr nz, jr_000_29f5

    xor a
    ld [wGrenadeDelay], a
    ret

jr_000_29f5:
    cp $33
    jr nz, jr_000_2a00

    ld e, a
    ld a, $0b
    call PlaySound
    ld a, e

jr_000_2a00:
    ld e, a
    ld d, $00
    ld hl, UpdateProjectilesData_001_4b21
    add hl, de
    ld e, [hl]
    ld hl, UpdateProjectilesData_001_4a68
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
    ld a, [wUnk_dbec]
    ld b, a
    ld a, [wUnk_dbeb]
    ld c, a

jr_000_2a2b:
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
    jr nz, jr_000_2a2b

    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a

jr_000_2a4a:
    ret

UpdateProjectile_HitBrick:
    ld a, [wProjectileWork + 8]
    bit 7, a
    jr z, jr_000_2a59

    ld a, $0c
    call PlaySound
    jr jr_000_2a5e

jr_000_2a59:
    ld a, $09
    call PlaySound

jr_000_2a5e:
    ld a, [wProjectileWork + 4]
    cp $6d
    jr nc, jr_000_2a6c

    ld a, $24
    ld hl, UpdateBlobData_001_4e6e
    jr jr_000_2ab3

jr_000_2a6c:
    cp $72
    jr nc, jr_000_2a77

    ld a, $20
    ld hl, ProjectileData_4e92
    jr jr_000_2ab3

jr_000_2a77:
    cp $77
    jr nc, jr_000_2a82

    ld a, $1c
    ld hl, ProjectileData_4eb2
    jr jr_000_2ab3

jr_000_2a82:
    cp $7c
    jr nc, jr_000_2a8d

    ld a, $18
    ld hl, ProjectileData_4ece
    jr jr_000_2ab3

jr_000_2a8d:
    cp $81
    jr nc, jr_000_2a98

    ld a, $14
    ld hl, ProjectileData_4ee6
    jr jr_000_2ab3

jr_000_2a98:
    cp $86
    jr nc, jr_000_2aa3

    ld a, $10
    ld hl, ProjectileData_4efa
    jr jr_000_2ab3

jr_000_2aa3:
    cp $8b
    jr nc, jr_000_2aae

    ld a, $0c
    ld hl, ProjectileData_4f0a
    jr jr_000_2ab3

jr_000_2aae:
    ld a, $08
    ld hl, ProjectileData_4f16

jr_000_2ab3:
    ld [wProjectileWork], a
    ld a, l
    ld [wProjectileWork + 5], a
    ld a, h
    ld [wProjectileWork + 6], a
    ret

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
    jr z, jr_000_2b48

    ld a, $34
    ld [wUnk_dbea], a
    ld a, [wProjectileWork + 2]
    ld [wUnk_dbeb], a
    ld c, a
    ld a, [wProjectileWork + 4]
    ld [wUnk_dbec], a
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

jr_000_2b48:
    ld a, [wBlobThrowCount]
    dec a
    ld [wBlobThrowCount], a
    ld a, [wProjectileWork + 4]
    ld hl, wBalls
    ld a, [wBallCount]
    or a
    jr z, jr_000_2b62

    ld de, $0007

jr_000_2b5e:
    add hl, de
    dec a
    jr nz, jr_000_2b5e

jr_000_2b62:
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

UpdateProjectile_Move:
    ld e, a
    ld d, $00
    ld a, [wProjectileWork + 5]
    ld l, a
    ld a, [wProjectileWork + 6]
    ld h, a
    add hl, de
    ld e, [hl]
    ld hl, UpdateProjectileData_001_49c0
    ld a, [wProjectileWork + 8]
    bit 7, a
    jr z, jr_000_2b9b

    ld hl, UpdateProjectileData_001_4a14

jr_000_2b9b:
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
    ld [wUnk_dc39], a
    ld l, a
    ld a, [wProjectileWork + 2]
    ld [wUnk_dc3a], a
    ld h, a
    add hl, bc
    ld a, l
    ld [wProjectileWork + 1], a
    ld a, h
    ld [wProjectileWork + 2], a
    ld a, [wProjectileWork + 3]
    ld [wUnk_dc3b], a
    ld l, a
    ld a, [wProjectileWork + 4]
    ld [wUnk_dc3c], a
    ld h, a
    add hl, de
    ld a, l
    ld [wProjectileWork + 3], a
    ld a, h
    ld [wProjectileWork + 4], a
    pop de
    xor a
    ld [wUnk_dc37], a
    ld [wUnk_dc38], a
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
    jr z, jr_000_2c20

    ld a, [wProjectileWork + 7]
    ld l, a
    ld h, $00
    ld bc, BallReflectLeftTable
    add hl, bc
    ld a, [hl]
    ld [wProjectileWork + 7], a
    ld a, $01
    ld [wUnk_dc37], a

jr_000_2c20:
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
    jr z, jr_000_2c47

    ld a, [wProjectileWork + 7]
    ld l, a

    ld h, $00
    ld bc, BallReflectRightTable
    add hl, bc
    ld a, [hl]
    ld [wProjectileWork + 7], a
    ld a, $01
    ld [wUnk_dc37], a

jr_000_2c47:
    ld a, [wProjectileWork + 2]
    ld c, a
    ld a, [de]
    inc de
    add c
    ld c, a
    ld a, [wProjectileWork + 4]
    call Projectile_CheckBrickKeepDE
    jr z, jr_000_2c6a

    ld a, [wProjectileWork + 7]
    ld l, a
    ld h, $00
    ld bc, BallReflectTopTable
    add hl, bc
    ld a, [hl]
    ld [wProjectileWork + 7], a
    ld a, $01
    ld [wUnk_dc38], a

jr_000_2c6a:
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
    jr z, jr_000_2c91

    ld a, [wProjectileWork + 7]
    ld l, a
    ld h, $00
    ld bc, BallReflectBottomTable
    add hl, bc
    ld a, [hl]
    ld [wProjectileWork + 7], a
    ld a, $01

    ld [wUnk_dc38], a

jr_000_2c91:
    pop bc
    ld a, [wProjectileWork + 2]
    sub b
    ld [wProjectileWork + 2], a
    ld a, [wProjectileWork + 4]
    sub c
    ld [wProjectileWork + 4], a
    ld a, [wUnk_dc37]
    or a
    jr z, jr_000_2cb2

    ld a, [wUnk_dc39]
    ld [wProjectileWork + 1], a
    ld a, [wUnk_dc3a]
    ld [wProjectileWork + 2], a

jr_000_2cb2:
    ld a, [wUnk_dc38]
    or a
    jr z, jr_000_2cc4

    ld a, [wUnk_dc3b]
    ld [wProjectileWork + 3], a
    ld a, [wUnk_dc3c]
    ld [wProjectileWork + 4], a

jr_000_2cc4:
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

jr_000_2ce1:
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
    jr nz, jr_000_2ce1

    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ret

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
    jr z, jr_000_2d1f

    xor a
    ret

jr_000_2d1f:
    ld a, $04
    call PlaySound
    ld a, $01
    or a
    ret

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
    jr z, jr_000_2d44

    xor a
    ret

jr_000_2d44:
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

UpdateUfo:
    ld a, [wUfoBombActive]
    or a
    call nz, UpdateUfoBomb
    ld a, [wUfoHits]
    cp $05
    ret z

    ld a, [wUfoFlying]
    or a
    jr nz, jr_000_2dd6

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
    jr nz, jr_000_2db2

    ld de, $0080
    ld h, $e0
    jr jr_000_2db7

jr_000_2db2:
    ld de, $ff80
    ld h, $b0

jr_000_2db7:
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
    jr c, jr_000_2dd0

    add $80

jr_000_2dd0:
    add $08
    ld [wUfoDropX], a
    ret

jr_000_2dd6:
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
    jr nz, jr_000_2e10

    add $0a
    ld [wUfoBombX], a
    ld a, [wUfoHeight]
    add $10
    ld [wUfoBombY], a
    ld [wUnk_dc32], a
    ld a, $01
    ld [wUfoBombActive], a
    ld a, $14
    call PlaySound

jr_000_2e10:
    ld a, d
    or a
    ld a, c
    jr nz, jr_000_2e1c

    cp $b0
    jr nz, jr_000_2e24

    xor a
    jr jr_000_2e21

jr_000_2e1c:
    cp $e0
    jr nz, jr_000_2e24

    xor a

jr_000_2e21:
    ld [wUfoFlying], a

jr_000_2e24:
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

jr_000_2e3a:
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
    jr nz, jr_000_2e3a

    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    add $05
    ld [wOamUsed], a
    ld a, [wShotActive]
    or a
    jr z, jr_000_2ebe

    ld a, [wShots]
    add $04
    ld c, a
    ld a, [wShots + 1]
    ld b, a
    ld a, [wUfoHeight]
    cp b
    jr nc, jr_000_2ebe

    add $0f
    cp b
    jr c, jr_000_2ebe

    ld a, [wUfoX]
    cp c
    jr nc, jr_000_2ebe

    add $17
    cp c
    jr c, jr_000_2ebe

    xor a
    ld [wUfoFlying], a
    ld a, [wPlasmaState]
    or a
    jr nz, jr_000_2eb6

    xor a
    ld [wShotActive], a
    ld a, [wShotActive + 1]
    or a
    jr nz, jr_000_2eb6

    ld a, [wShotActive + 2]
    or a
    jr nz, jr_000_2eb6

    ld a, [wShotActive + 3]
    or a
    jr nz, jr_000_2eb6

    ld a, [wShotActive + 4]
    or a
    jr nz, jr_000_2eb6

    ld a, [wShotActive + 5]
    or a
    jr nz, jr_000_2eb6

    ld [wShotCooldown], a

jr_000_2eb6:
    ld a, $15
    call PlaySound
    call UfoHit

jr_000_2ebe:
    ld a, [wShotActive + 1]
    or a
    jr z, jr_000_2f1b

    ld a, [wShots + 4]
    add $04
    ld c, a
    ld a, [wShots + 5]
    ld b, a
    ld a, [wUfoHeight]
    cp b
    jr nc, jr_000_2f1b

    add $0f
    cp b
    jr c, jr_000_2f1b

    ld a, [wUfoX]
    cp c
    jr nc, jr_000_2f1b

    add $17
    cp c
    jr c, jr_000_2f1b

    xor a
    ld [wUfoFlying], a
    ld a, [wPlasmaState]
    or a
    jr nz, jr_000_2f13

    xor a
    ld [wShotActive + 1], a
    ld a, [wShotActive]
    or a
    jr nz, jr_000_2f13

    ld a, [wShotActive + 2]
    or a
    jr nz, jr_000_2f13

    ld a, [wShotActive + 3]
    or a
    jr nz, jr_000_2f13

    ld a, [wShotActive + 4]
    or a
    jr nz, jr_000_2f13

    ld a, [wShotActive + 5]
    or a
    jr nz, jr_000_2f13

    ld [wShotCooldown], a

jr_000_2f13:
    ld a, $15
    call PlaySound
    call UfoHit

jr_000_2f1b:
    ld a, [wShotActive + 2]
    or a
    jr z, jr_000_2f71

    ld a, [wShots + 8]
    add $04
    ld c, a
    ld a, [wShots + 9]
    ld b, a
    ld a, [wUfoHeight]
    cp b
    jr nc, jr_000_2f71

    add $0f
    cp b
    jr c, jr_000_2f71

    ld a, [wUfoX]
    cp c
    jr nc, jr_000_2f71

    add $17
    cp c
    jr c, jr_000_2f71

    xor a
    ld [wUfoFlying], a
    ld [wShotActive + 2], a
    ld a, [wShotActive]
    or a
    jr nz, jr_000_2f69

    ld a, [wShotActive + 1]
    or a
    jr nz, jr_000_2f69

    ld a, [wShotActive + 3]
    or a
    jr nz, jr_000_2f69

    ld a, [wShotActive + 4]
    or a
    jr nz, jr_000_2f69

    ld a, [wShotActive + 5]
    or a
    jr nz, jr_000_2f69

    ld [wShotCooldown], a

jr_000_2f69:
    ld a, $15
    call PlaySound
    call UfoHit

jr_000_2f71:
    ld a, [wShotActive + 3]
    or a
    jr z, jr_000_2fc7

    ld a, [wShots + 12]
    add $04
    ld c, a
    ld a, [wShots + 13]
    ld b, a
    ld a, [wUfoHeight]
    cp b
    jr nc, jr_000_2fc7

    add $0f
    cp b
    jr c, jr_000_2fc7

    ld a, [wUfoX]
    cp c
    jr nc, jr_000_2fc7

    add $17
    cp c
    jr c, jr_000_2fc7

    xor a
    ld [wUfoFlying], a
    ld [wShotActive + 3], a
    ld a, [wShotActive]
    or a
    jr nz, jr_000_2fbf

    ld a, [wShotActive + 1]
    or a
    jr nz, jr_000_2fbf

    ld a, [wShotActive + 2]
    or a
    jr nz, jr_000_2fbf

    ld a, [wShotActive + 4]
    or a
    jr nz, jr_000_2fbf

    ld a, [wShotActive + 5]
    or a
    jr nz, jr_000_2fbf

    ld [wShotCooldown], a

jr_000_2fbf:
    ld a, $15
    call PlaySound
    call UfoHit

jr_000_2fc7:
    ld a, [wShotActive + 4]
    or a
    jr z, jr_000_301d

    ld a, [wShots + 15]
    add $04
    ld c, a
    ld a, [wShots + 16]
    ld b, a
    ld a, [wUfoHeight]
    cp b
    jr nc, jr_000_301d

    add $0f
    cp b
    jr c, jr_000_301d

    ld a, [wUfoX]
    cp c
    jr nc, jr_000_301d

    add $17
    cp c
    jr c, jr_000_301d

    xor a
    ld [wUfoFlying], a
    ld [wShotActive + 4], a
    ld a, [wShotActive]
    or a
    jr nz, jr_000_3015

    ld a, [wShotActive + 1]
    or a
    jr nz, jr_000_3015

    ld a, [wShotActive + 2]
    or a
    jr nz, jr_000_3015

    ld a, [wShotActive + 3]
    or a
    jr nz, jr_000_3015

    ld a, [wShotActive + 5]
    or a
    jr nz, jr_000_3015

    ld [wShotCooldown], a

jr_000_3015:
    ld a, $15
    call PlaySound
    call UfoHit

jr_000_301d:
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
    jr nz, jr_000_3066

    ld a, [wShotActive + 1]
    or a
    jr nz, jr_000_3066

    ld a, [wShotActive + 2]
    or a
    jr nz, jr_000_3066

    ld a, [wShotActive + 3]
    or a
    jr nz, jr_000_3066

    ld a, [wShotActive + 4]

    or a
    jr nz, jr_000_3066

    ld [wShotCooldown], a

jr_000_3066:
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
    jr nc, jr_000_30bd

    inc d
    ld a, [wUnk_dc32]
    ld [hl+], a
    ld a, [wUfoBombX]
    ld [hl+], a
    ld a, $55
    ld [hl+], a
    ld a, $44
    ld [hl+], a
    jr jr_000_30e7

jr_000_30bd:
    ld a, [wUfoBombY]
    inc a
    ld [wUfoBombY], a
    cp $a8
    jr c, jr_000_30cc

    xor a
    ld [wUfoBombActive], a

jr_000_30cc:
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

jr_000_30e7:
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
    jr z, jr_000_313d

    ld b, $fc

jr_000_313d:
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
    jr nz, jr_000_3166

    ld a, $03
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ret

jr_000_3166:
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
    jr nc, jr_000_3199

    add $0f
    cp b
    jr c, jr_000_3199

    ld a, [wUfoX]
    cp c
    jr nc, jr_000_3199

    add $17
    cp c
    jr c, jr_000_3199

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

jr_000_3199:
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
    jr nc, jr_000_31d8

    add $0f
    cp b
    jr c, jr_000_31d8

    ld a, [wBlobX]
    cp c
    jr nc, jr_000_31d8

    add $0f
    cp c
    jr c, jr_000_31d8

    xor a
    ld [wBlobFrame], a
    ld [wBlobFrameTick], a
    inc a
    ld [wBlobThrowing], a
    ld [wRemoveBall], a
    ld a, $0d
    call PlaySound

jr_000_31d8:
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

UpdateShots_Shot1:
    ld a, [wShotActive + 1]
    or a
    jp nz, UpdateShot1

UpdateShots_Shot2:
    ld a, [wShotActive + 2]
    or a
    jp nz, UpdateShot2

UpdateShots_Shot3:
    ld a, [wShotActive + 3]
    or a
    jp nz, UpdateShot3

UpdateShots_Shot4:
    ld a, [wShotActive + 4]
    or a
    jp nz, UpdateShot4

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
    jr z, jr_000_326b

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

jr_000_326b:
    ld a, [wGrenadePower]
    ld c, a
    ld a, [wGrenadePower + 1]
    add c
    or a
    ret z

    ld a, b
    dec a
    ld [wGrenadeCount], a
    jr nz, jr_000_327f

    ld [wWeaponFlag], a

jr_000_327f:
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
    jr z, jr_000_32af

    ld l, $1e

jr_000_32af:
    bit 1, a
    jr z, jr_000_32b5

    ld l, $02

jr_000_32b5:
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

Shots_FireRocketOrLaser:
    ld a, [wShotCooldown]
    or a
    jr z, jr_000_332f

    dec a
    ld [wShotCooldown], a
    ret

jr_000_332f:
    ld a, [hJoypad]
    bit 4, a
    jr nz, jr_000_333b

    xor a
    ld [wFireLatch], a
    ret

jr_000_333b:
    ld a, [wFireLatch]
    or a
    ret nz

    ld a, [wShotActive]
    or a
    jr nz, jr_000_337b

    ld [wShots + 3], a
    ld b, $12
    ld a, [wLaserBat]
    or a
    jr z, jr_000_3356

    ld [wShots + 3], a
    ld b, $13

jr_000_3356:
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

jr_000_337b:
    ld a, [wShotActive + 1]
    or a
    jr nz, jr_000_33b6

    ld [wShots + 7], a
    ld b, $12
    ld a, [wLaserBat]
    or a
    jr z, jr_000_3391

    ld [wShots + 7], a
    ld b, $13

jr_000_3391:
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

jr_000_33b6:
    ld a, [wShotActive + 2]
    or a
    jr nz, jr_000_33f1

    ld [wShots + 11], a
    ld b, $12
    ld a, [wLaserBat]
    or a
    jr z, jr_000_33cc

    ld [wShots + 11], a
    ld b, $13

jr_000_33cc:
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

jr_000_33f1:
    ld a, [wLaserBat]
    or a
    ret z

    ld a, [wShotActive + 3]
    or a
    jr nz, jr_000_3422

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

jr_000_3422:
    ld a, [wShotActive + 4]
    or a
    jr nz, jr_000_344e

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

jr_000_344e:
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
    jr z, jr_000_349c

    ld bc, ShotSprite_Rocket
    ld a, [wShots + 3]
    or a
    jr z, jr_000_34a5

    ld bc, ShotSprite_Laser
    ld e, $02
    jr jr_000_34a5

jr_000_349c:
    ld bc, ShotSprite_Plasma
    ld a, [wShots]
    ld [wUnk_d8bb], a

jr_000_34a5:
    ld a, [wShotActive]
    inc a
    ld [wShotActive], a
    cp $05
    jr nc, jr_000_34c1

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
    jr jr_000_34ea

jr_000_34c1:
    inc bc
    inc bc
    ld a, [wShots + 1]
    sub e
    ld [wShots + 1], a
    cp $18
    jr z, jr_000_352e

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

jr_000_34ea:
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
    jr z, jr_000_352e

    call HitBrickWithShot
    ld a, [wPlasmaState]
    cp $02
    jp z, UpdateShots_Shot1

jr_000_352e:
    ld a, [wPlasmaState]
    or a
    jr z, jr_000_353e

    ld a, [wShotActive + 1]
    or a
    jr nz, jr_000_353e

    xor a
    ld [wPlasmaState], a

jr_000_353e:
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

UpdateShot1:
    ld d, $00
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld e, $01
    ld a, [wPlasmaState]
    cp $02
    jr z, jr_000_358e

    ld bc, ShotSprite_Rocket
    ld a, [wShots + 7]
    or a
    jr z, jr_000_3597

    ld bc, ShotSprite_Laser
    ld e, $02
    jr jr_000_3597

jr_000_358e:
    ld bc, ShotSprite_Plasma
    ld a, [wShots + 4]
    ld [wUnk_d8bb], a

jr_000_3597:
    ld a, [wShotActive + 1]
    inc a
    ld [wShotActive + 1], a
    cp $05
    jr nc, jr_000_35b3

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
    jr jr_000_35dc

jr_000_35b3:
    inc bc
    inc bc
    ld a, [wShots + 5]
    sub e
    ld [wShots + 5], a
    cp $18
    jr z, jr_000_3620

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

jr_000_35dc:
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
    jr z, jr_000_3620

    call HitBrickWithShot
    ld a, [wPlasmaState]
    cp $02
    jp z, UpdateShots_Shot2

jr_000_3620:
    ld a, [wPlasmaState]
    or a
    jr z, jr_000_3630

    ld a, [wShotActive]
    or a
    jr nz, jr_000_3630

    xor a
    ld [wPlasmaState], a

jr_000_3630:
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
    jr z, jr_000_3677

    ld bc, ShotSprite_Laser
    ld e, $02

jr_000_3677:
    ld a, [wShotActive + 2]
    inc a
    ld [wShotActive + 2], a
    cp $05
    jr nc, jr_000_3693

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
    jr jr_000_36bc

jr_000_3693:
    inc bc
    inc bc
    ld a, [wShots + 9]
    sub e
    ld [wShots + 9], a
    cp $18
    jr z, jr_000_36f8

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

jr_000_36bc:
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
    jr z, jr_000_36f8

    call HitBrickWithBall

jr_000_36f8:
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
    jr nc, jr_000_374e

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
    jr jr_000_3778

jr_000_374e:
    inc bc
    inc bc
    ld a, [wShots + 13]
    sub $02
    ld [wShots + 13], a
    cp $18
    jr z, jr_000_37b4

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

jr_000_3778:
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
    jr z, jr_000_37b4

    call HitBrickWithBall

jr_000_37b4:
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
    jr nc, jr_000_380a

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
    jr jr_000_3834

jr_000_380a:
    inc bc
    inc bc
    ld a, [wShots + 16]
    sub $02
    ld [wShots + 16], a
    cp $18
    jr z, jr_000_3870

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

jr_000_3834:
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
    jr z, jr_000_3870

    call HitBrickWithBall

jr_000_3870:
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
    jr nc, jr_000_38c6

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
    jr jr_000_38f0

jr_000_38c6:
    inc bc
    inc bc
    ld a, [wShots + 19]
    sub $02
    ld [wShots + 19], a
    cp $18
    jr z, jr_000_392c

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

jr_000_38f0:
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
    jr z, jr_000_392c

    call HitBrickWithBall

jr_000_392c:
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
    ld a, [wUnk_df4c]
    ld l, a
    ld a, [wUnk_df4d]
    ld h, a
    call DrawString
    ld a, $01
    call ChangeROMBank
    ld a, [wCheatLivesRefill]
    or a
    jr z, jr_000_39ec

    ld a, $09
    ld [wLives], a

jr_000_39ec:
    ret

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

PublisherLogo_Update:
    ld a, [hLogoTimer]
    or a
    jr z, jr_000_3ae3

    dec a
    ld [hLogoTimer], a
    ret

jr_000_3ae3:
    ld a, $06
    ld [hGameState], a
    ld a, $01
    ld [hStateTimer], a
    ret

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
    ld [wUnk_c958], a
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
    jr z, jr_000_3b6e

    ld hl, Credits_Spanish
    dec a
    jr z, jr_000_3b6e

    ld hl, Credits_French
    dec a
    jr z, jr_000_3b6e

    ld hl, Credits_German
    dec a
    jr z, jr_000_3b6e

    ld hl, Credits_Italian

jr_000_3b6e:
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

UpdateCreditsScroll:
    ld a, [wCreditsScrollDone]
    inc a
    ret z

    ld a, $ff
    ld [wCreditsScrollDone], a
    ld a, [wCreditsScrollY]
    ldh [rSCY], a
    and $07
    jr nz, jr_000_3bfe

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
    jr z, jr_000_3c04

    dec a
    ld b, $14

jr_000_3bbe:
    sub $20
    jr c, jr_000_3bfa

    jr z, jr_000_3bcc

    sub $0f
    cp $12
    jr c, jr_000_3bcc

    sub $07

jr_000_3bcc:
    ld [de], a
    inc de
    ld a, [hl+]
    dec b
    jr nz, jr_000_3bbe

    ld [wCreditsRowColour], a
    ld a, l
    ld [wCreditsTextPtr], a
    ld a, h
    ld [wCreditsTextPtr + 1], a

UpdateCreditsScroll_AdvanceRow:
    ld a, [wCreditsRowAddress]
    add $20
    ld [wCreditsRowAddress], a
    jr nc, jr_000_3bf4

    ld a, [wCreditsRowAddress + 1]
    inc a
    cp $9c
    jr nz, jr_000_3bf1

    ld a, $98

jr_000_3bf1:
    ld [wCreditsRowAddress + 1], a

jr_000_3bf4:
    ld a, $01
    ld [ROM_BANK], a
    ret

jr_000_3bfa:
    add $e4
    jr jr_000_3bcc

jr_000_3bfe:
    ld a, $fe

    ld [wCreditsRowColour], a
    ret

jr_000_3c04:
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

UpdateCreditsScroll_BlankRow:
    ld a, l
    ld [wCreditsTextPtr], a
    ld a, h
    ld [wCreditsTextPtr + 1], a
    ld h, d
    ld l, e
    ld b, $14
    xor a

jr_000_3c28:
    ld [hl+], a
    dec b
    jr nz, jr_000_3c28

    ld a, $fe
    ld [wCreditsRowColour], a
    jp UpdateCreditsScroll_AdvanceRow

; Step wLevelMusicIndex (0, 1, 2, 0, ...) and restart the count of levels since the last password.
NextLevelMusic:
    ld a, [wLevelMusicIndex]
    inc a
    cp $03
    jr nz, jr_000_3c3d

    xor a

jr_000_3c3d:
    ld [wLevelMusicIndex], a
    xor a
    ld [wLevelsSincePassword], a
    ret

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
    ld [wUnk_defb], a
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
    jr nz, jr_000_3d12

    ld a, [wLevelTitleText + 18]
    ld [hl+], a
    ld a, [wLevelTitleText + 19]
    ld [hl+], a
    ld a, [wLevelTitleText + 20]
    jr jr_000_3d1d

jr_000_3d12:
    ld a, [wLevelTitleText + 17]
    ld [hl+], a
    ld a, [wLevelTitleText + 18]
    ld [hl+], a
    ld a, [wLevelTitleText + 19]

jr_000_3d1d:
    ld [hl-], a
    dec hl
    call ParseDecimal
    ld a, [wUnk_df35]
    ld l, a
    ld a, [wUnk_df36]
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
    ld [wUnk_defd], a
    ld [wUnk_defe], a
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
    call Call_006_473f
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
    jr nz, jr_000_3e7b

    ld a, $06
    ld [ROM_BANK], a
    call Call_006_4819
    ld a, $01
    ld [ROM_BANK], a

jr_000_3e7b:
    pop bc

    pop hl
    pop de
    ret

; Run the sound driver in bank 6 for one frame.
UpdateSound:
    ld a, $06
    ld [ROM_BANK], a
    call Call_006_4000
    ld a, $01
    ld [ROM_BANK], a
    ret

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

Copyright_Update:
    ld a, [hLogoTimer]
    or a
    jr z, jr_000_3ef8

    dec a
    ld [hLogoTimer], a
    ret

jr_000_3ef8:
    ld a, $0c
    ld [hGameState], a
    ld a, $01
    ld [hStateTimer], a
    ret

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

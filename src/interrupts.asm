SECTION "Interrupts", ROM0[$0]
; Restart vector $00. Only returns from the interrupt.
; Nothing in the code calls it.
RST_00::
    reti

; Show the 20-character message whose address is stored at HL. The message is in bank $0E.
ShowMessageBankE:
    ld a, $0e

    ld [ROM_BANK], a

; Like ShowMessageBankE, but the message is in the current bank.
ShowMessage:
    db $01
    inc d

; Middle of ShowMessage, reached by falling through from the code before it. BC = 20 is already set.
; Replaces HL with the message address stored at HL. Stores the first message byte in hLevelScrollX.
RST_08::
    nop
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    ld [hLevelScrollX], a

; Middle of ShowMessage. Clears wLevelTitleBlink and wMessageUnused.
; Leaves A = $FF.
RST_10::
    xor a
    ld [wLevelTitleBlink], a
    ld [wMessageUnused], a
    dec a

; Middle of ShowMessage. Sets wLevelTitleTimer from A, which is $FF, so the top row is cleared first.
; Starts wLevelTitleText with a zero byte. DE = wLevelTitleText.
RST_18::
    ld [wLevelTitleTimer], a
    ld de, wLevelTitleText
    xor a
    ld [de], a

; Middle of ShowMessage. Writes the next header bytes of wLevelTitleText: $98 and then $00.
; DE is left pointing at the following byte.
RST_20::
    inc de

    ld a, $98
    ld [de], a
    inc de
    xor a
    ld [de], a
    inc de

; Middle of ShowMessage. Writes $04 into wLevelTitleText, then copies the message text after it.
; DE = destination, HL = source, BC = length.
RST_28::
    ld a, $04
    ld [de], a

    inc de
    call DataTransfer
    db $3e

; End of ShowMessage. Writes $FF after the message text in wLevelTitleText.
; Switches ROM bank 1 back in and returns.
RST_30::
    rst $38
    ld [de], a
    ld a, $01
    ld [ROM_BANK], a
    ret

; Restart vector $38. Filled with nops and never called.
; It is only padding before the interrupt vectors.
RST_38::
    nop
    nop
    nop
    nop

    nop
    nop
    nop

    nop

; Runs at the start of every VBlank.
; Jumps to hVBlankJump, which leads to the VBlank handler of the current screen.
VBlankInterrupt::
    jp hVBlankJump

    nop
    nop
    nop
    nop
    nop

; Runs on the LCD STAT interrupt.
; Jumps to the handler in RAM at wStatJump. A raster effect copies its handler there.
LCDCInterrupt::
    jp wStatJump

    nop
    nop
    nop
    nop
    nop

; Timer interrupt vector. Only returns from the interrupt.
; The game does not use the timer.
TimerOverflowInterrupt::
    reti

    nop
    nop
    nop
    nop
    nop
    nop
    nop

; Serial interrupt vector. Only returns from the interrupt.
; The game does not use the serial port.
SerialTransferCompleteInterrupt::
    reti

    nop
    nop
    nop
    nop
    nop
    nop
    nop

; Joypad interrupt vector. Only returns from the interrupt.
; The game does not use this interrupt.
JoypadTransitionInterrupt::
    reti

; Unpack the colour palettes at DE into the palette buffer.
LoadPalettes:
    ld hl, wPaletteBuffer
    ld b, $10
    ld a, [hPaletteMode]
    cp $02
    jr nz, .paletteLoop

    ld b, $90
    ld hl, wRasterPaletteBuffer
    ld a, $02
    ldh [rSVBK], a

.paletteLoop:
    push bc
    ld b, $04

.colourLoop:
    ld a, [de]
    and $1f
    ld [hl+], a
    ld a, [de]
    inc de

    and $e0

    ld c, a

    ld a, [de]
    and $03
    or c
    swap a
    srl a
    ld [hl+], a
    ld a, [de]
    inc de
    srl a
    srl a
    ld [hl+], a
    dec b
    jr nz, .colourLoop

    ld a, [hPaletteMode]

    cp $02
    jr nz, .nextPalette

    inc de
    inc de

.nextPalette:
    pop bc
    dec b
    jr nz, .paletteLoop

    xor a
    ldh [rSVBK], a
    ret

; Sets up the "Please use a Game Boy Color" screen (state 10), which is shown on older consoles.
; Installs VBlank as the VBlank handler and enables only the VBlank interrupt (hInterruptEnable = 1).
; Loads the tiles from bank $0D and draws the 20 x 18 tilemap, then switches back to bank 1.
StateInit_ColorOnly:
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
    ld a, $e4

    ldh [rBGP], a
    xor a

    ldh [rSCX], a
    ld a, $0d
    call ChangeROMBank
    ld hl, Gfx_ColorOnly_00d_4000
    ld de, $9000
    ld bc, $0800

    call DataTransfer
    ld hl, Gfx_ColorOnly_00d_4800
    ld de, $8800
    ld bc, $0050
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, Tilemap_ColorOnly_00d_4850
    ld b, $14
    ld c, $12
    call CopyTilemapRect

    ld a, $01
    call ChangeROMBank
    ret

    nop
    nop

    nop
    nop

    nop

    nop
    nop
    nop
    nop

    nop

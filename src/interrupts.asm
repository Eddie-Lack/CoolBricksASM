SECTION "Interrupts", ROM0[$0]
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

RST_08::
    nop
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    ld [hUnk_ff9d], a

RST_10::
    xor a
    ld [wUnk_d746], a
    ld [wUnk_d75e], a
    dec a

RST_18::
    ld [wUnk_d745], a
    ld de, wLevelTitleText
    xor a
    ld [de], a

RST_20::
    inc de

    ld a, $98
    ld [de], a
    inc de
    xor a
    ld [de], a
    inc de

RST_28::
    ld a, $04
    ld [de], a

    inc de
    call DataTransfer
    db $3e

RST_30::
    rst $38
    ld [de], a
    ld a, $01
    ld [ROM_BANK], a
    ret

RST_38::
    nop
    nop
    nop
    nop

    nop
    nop
    nop

    nop

VBlankInterrupt::
    jp hVBlankJump

    nop
    nop
    nop
    nop
    nop

LCDCInterrupt::
    jp wStatJump

    nop
    nop
    nop
    nop
    nop

TimerOverflowInterrupt::
    reti

    nop
    nop
    nop
    nop
    nop
    nop
    nop

SerialTransferCompleteInterrupt::
    reti

    nop
    nop
    nop
    nop
    nop
    nop
    nop

JoypadTransitionInterrupt::
    reti

; Unpack the colour palettes at DE into the palette buffer.
LoadPalettes:
    ld hl, $c9dd
    ld b, $10
    ld a, [hPaletteMode]
    cp $02
    jr nz, jr_000_0076

    ld b, $90
    ld hl, $d000
    ld a, $02
    ldh [rSVBK], a

jr_000_0076:
    push bc
    ld b, $04

jr_000_0079:
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
    jr nz, jr_000_0079

    ld a, [hPaletteMode]

    cp $02
    jr nz, jr_000_009e

    inc de
    inc de

jr_000_009e:
    pop bc
    dec b
    jr nz, jr_000_0076

    xor a
    ldh [rSVBK], a
    ret

StateInit_ColorOnly:
    ld hl, $02b3
    ld a, l
    ld [hUnk_ff96], a
    ld a, h
    ld [hUnk_ff97], a
    ld a, $01
    ld [hPaletteMode], a
    ld [hUnk_ff9b], a
    ld a, $01
    ld [hUnk_ff9a], a
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

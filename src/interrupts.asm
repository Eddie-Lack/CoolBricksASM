SECTION "Interrupts", ROM0[$0]
RST_00::
    reti


Call_000_0001:
Jump_000_0001:
    ld a, $0e

Call_000_0003:
    ld [ROM_BANK], a

Call_000_0006:
    db $01
    inc d

RST_08::
    nop
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    ld [$ff9d], a

RST_10::
    xor a
    ld [$d746], a
    ld [$d75e], a
    dec a

RST_18::
    ld [$d745], a
    ld de, $d72a
    xor a
    ld [de], a

RST_20::
    inc de

Jump_000_0021:
    ld a, $98
    ld [de], a
    inc de
    xor a
    ld [de], a
    inc de

RST_28::
    ld a, $04
    ld [de], a

Call_000_002b:
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

Jump_000_003c:
    nop
    nop
    nop

Jump_000_003f:
    nop

VBlankInterrupt::
    jp $ff92


    nop
    nop
    nop
    nop
    nop

LCDCInterrupt::
    jp $c35a


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


Call_000_0061:
    ld hl, $c9dd
    ld b, $10
    ld a, [$ff9c]
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

Jump_000_007f:
    and $e0

Call_000_0081:
Jump_000_0081:
    ld c, a

Call_000_0082:
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

    ld a, [$ff9c]

Jump_000_0098:
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


    ld hl, $02b3
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    ld a, $01
    ld [$ff9c], a
    ld [$ff9b], a
    ld a, $01
    ld [$ff9a], a
    ld a, $e4

Call_000_00c0:
    ldh [rBGP], a
    xor a

Jump_000_00c3:
    ldh [rSCX], a
    ld a, $0d
    call ChangeROMBank
    ld hl, $4000
    ld de, $9000
    ld bc, $0800

Jump_000_00d3:
    call DataTransfer
    ld hl, $4800
    ld de, $8800
    ld bc, $0050
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, $4850
    ld b, $14
    ld c, $12
    call Call_000_01d4

Call_000_00f0:
    ld a, $01
    call ChangeROMBank
    ret


    nop
    nop

Call_000_00f8:
    nop
    nop

Jump_000_00fa:
    nop

Call_000_00fb:
    nop
    nop
    nop
    nop

Call_000_00ff:
Jump_000_00ff:
    nop
; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $002", ROMX[$4000], BANK[$2]

    db $52, $58, $4c, $4e, $47, $4b, $48, $42, $4a, $53, $50, $54, $5a, $43
    db $46, $44

    ; $00 is believed to be a command trigger
    ; $FF new line
HighScoreScreenDataHeader:
    db $24, $98, TXT_CMD, $84, "HIGH SCORES", $ff
    db $7f, $98, TXT_CMD, $84, "    PASSWORD ", TXT_CMD, $81, "PTPP", $ff
HighScoreScreenData:
    db $60, $98, TXT_CMD, $81, "001000 ", TXT_CMD, $84, "CLIVE   L", TXT_CMD, $81, "001", $ff
    db $c0, $98, TXT_CMD, $81, "000700 ", TXT_CMD, $84, "ANDY    L", TXT_CMD, $81, "001", $ff
    db $e0, $98, TXT_CMD, $81, "000600 ", TXT_CMD, $84, "MARCUS  L", TXT_CMD, $81, "001", $ff
    db $00, $99, TXT_CMD, $81, "000550 ", TXT_CMD, $84, "RACHEL  L", TXT_CMD, $81, "001", $ff
    db $20, $99, TXT_CMD, $81, "000500 ", TXT_CMD, $84, "VICKY   L", TXT_CMD, $81, "001", $ff
    db $40, $99, TXT_CMD, $81, "000300 ", TXT_CMD, $84, "CLIVE   L", TXT_CMD, $81, "001", $ff
    db $60, $99, TXT_CMD, $81, "000250 ", TXT_CMD, $84, "ANDY    L", TXT_CMD, $81, "001", $ff
    db $80, $99, TXT_CMD, $81, "000200 ", TXT_CMD, $84, "MARCUS  L", TXT_CMD, $81, "001", $ff
    db $a0, $99, TXT_CMD, $81, "000150 ", TXT_CMD, $84, "RACHEL  L", TXT_CMD, $81, "001", $ff
    db $c0, $99, TXT_CMD, $81, "000100 ", TXT_CMD, $84, "VICKY   L", TXT_CMD, $81, "001", $ff
    db $ff, $99, TXT_CMD, $84, "    LAST SCORE ", TXT_CMD, $81, "000000", $ff

HighScoresTextureData:
    INCBIN "gfx/image_002_416c.2bpp"

    INCBIN "gfx/image_002_4a6c.2bpp"

    nop
    nop
    inc a
    nop
    ld a, [hl]
    db $10
    ld a, h
    ld [bc], a
    ld a, b
    ld b, $4a
    inc a
    inc h
    jr jr_002_4b3b

jr_002_4b3b:
    nop
    nop
    nop
    ld a, [hl+]
    ld a, [de]
    ld h, b
    ld a, [de]
    ld a, [hl-]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    nop
    ld b, l
    nop
    add l
    nop
    push bc
    nop
    cp a
    ld b, b
    and l
    ld a, d
    ld e, a
    ld a, [hl-]
    ccf
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    nop

jr_002_4b70:
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    cpl
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    xor d
    ld d, l
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    cpl
    rst $38
    cpl
    rst $38
    cpl
    rst $38
    rst $38
    nop
    xor d
    ld d, l
    cpl
    rst $38
    rst $38
    nop
    rst $38
    nop
    cpl
    rst $38
    xor d
    ld d, l
    rst $38
    nop
    cpl
    rst $38
    ld a, a
    add b
    ld d, l
    cp e
    rst $38
    nop
    ld d, $01
    ld a, [bc]
    ld bc, $0001
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
    ld c, b
    add b
    ldh [rP1], a
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
    nop
    nop
    ld a, [hl-]
    ld bc, $0116
    inc bc
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, h
    adc b
    jr nc, jr_002_4b70

    ld b, b
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
    nop
    dec hl
    dec d
    ld l, $01
    inc bc
    nop
    ld [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call z, $14b8
    add sp, $48
    add b
    ret nz

    nop
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc sp
    dec e
    add hl, hl
    rla
    dec sp
    dec d
    ld d, $01
    inc bc
    nop
    ld bc, $0100
    nop
    nop
    nop
    cp h
    add sp, -$0c
    xor b
    ld e, h
    and b

Call_002_4c32:
    ld c, b
    and b
    and b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    sbc $cc
    ld e, $1a
    jp c, $da9a

    jp c, $dade

    sbc $8c
    nop
    nop
    nop
    nop
    inc sp
    ld sp, $7373
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    ld a, e
    ld a, c
    nop
    nop
    nop
    nop
    sbc $8c
    sbc $5a
    ld e, d
    ld e, d
    ld e, d
    ld e, d
    sbc $5a
    sbc $8c
    nop
    nop
    nop
    nop
    inc sp
    inc sp
    ld [hl], e
    ld [hl], e
    inc sp
    inc sp
    jr nc, jr_002_4cb6

    jr nc, jr_002_4cb8

    ld a, e
    ld a, e
    nop
    nop
    nop
    nop
    sbc $cc
    ld e, $1a
    jp c, $da9a

    jp c, $dade

    sbc $8c
    nop
    nop
    nop
    nop
    ld a, e
    ld sp, $5b5b
    dec de
    dec de
    dec sp
    inc sp
    ld h, e
    ld h, e
    ld a, e
    ld a, c
    nop
    nop
    nop
    nop
    sbc $8c
    sbc $5a
    ld e, d
    ld e, d
    ld e, d
    ld e, d

jr_002_4cb6:
    sbc $5a

jr_002_4cb8:
    sbc $8c
    nop
    nop
    nop
    nop
    ld a, e
    inc sp
    ld e, e
    ld e, e
    dec de
    dec de
    jr c, jr_002_4cf6

    ld h, b
    ld h, b
    ld a, e
    ld a, e
    nop
    nop
    nop
    nop
    sbc $cc
    ld e, $1a
    jp c, $da9a

    jp c, $dade

    sbc $8c
    nop
    nop
    nop
    nop
    ld a, e
    ld a, c
    ld h, e
    ld h, e
    ld a, e
    ld [hl], e
    dec de
    dec de
    dec de
    dec de
    ld a, e
    ld [hl], c
    nop
    nop
    nop
    nop
    sbc $8c
    sbc $5a
    ld e, d
    ld e, d
    ld e, d
    ld e, d

jr_002_4cf6:
    sbc $5a
    sbc $8c
    nop
    nop
    nop
    nop
    jr z, jr_002_4d00

jr_002_4d00:
    ld d, h
    nop
    ld a, [hl+]
    nop
    ld d, h
    nop
    ld a, [hl+]
    nop
    inc d
    nop
    nop
    nop
    ld a, [hl+]
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    ld a, [hl+]
    nop
    dec d
    nop
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    xor b
    nop
    ld d, h
    nop
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, h
    nop
    nop
    nop
    nop
    nop
    ccf
    ccf
    ld sp, $313f
    ccf
    ld sp, $313f
    ccf
    ld sp, $003f
    nop
    nop
    nop
    ld hl, sp-$08
    db $fc
    ld hl, sp-$02
    ld hl, sp-$02
    ld hl, sp-$02
    ld hl, sp-$02
    ld hl, sp+$30
    ccf
    jr nc, jr_002_4daf

    jr nc, jr_002_4db1

    ccf
    ccf
    rra
    nop
    rrca
    nop

jr_002_4d78:
    nop
    nop
    nop
    nop
    ld e, $f8
    ld e, $f8
    ld e, $f8
    cp $f8
    cp $00

jr_002_4d86:
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    nop
    ld [$1607], sp
    rrca
    rrca
    rra
    cpl
    rra
    ld h, $1f
    jr nc, jr_002_4dad

    jr z, @+$19

    dec d
    ld a, [bc]
    rra
    nop
    ld c, $01
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop

jr_002_4dad:
    nop
    nop

jr_002_4daf:
    nop
    ret nz

jr_002_4db1:
    nop
    or b
    ld b, b
    ld e, b
    and b
    jr c, jr_002_4d78

    inc e
    ldh [$34], a
    ret z

    ld d, h
    xor b
    and h
    ld e, b
    ld e, b
    or b
    cp b
    ld h, b
    jr nc, jr_002_4d86

    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rrca
    rra
    rra
    dec [hl]
    dec sp
    ccf
    ld [hl], c
    ld a, a
    ld [hl], c
    ld a, a
    ld [hl], c
    ld [hl], l
    ld a, e
    nop
    nop
    ret nz

    ldh [$f0], a
    ldh a, [$58]
    cp b
    ld hl, sp+$1c
    db $fc
    inc e
    cp $1c
    ld e, [hl]
    cp h
    ld a, a
    ld e, a
    ld d, a
    ld l, a
    cpl
    ld [hl], b
    jr nc, jr_002_4e33

    rra
    rra
    rlca
    rrca
    inc bc
    nop
    nop
    nop
    cp $f4
    sub $ec
    ld [$1e1c], a

jr_002_4e03:
    ld hl, sp-$04
    ldh a, [$d8]
    ldh [$f0], a
    nop
    nop
    nop
    nop
    nop
    inc e
    nop
    ld [hl+], a
    inc e
    ld c, c
    ld a, $5d
    ld a, $49
    ld a, $27
    inc e
    ld e, l
    jr nz, jr_002_4e2d

    nop
    nop
    db $10
    jr z, jr_002_4e32

    ld a, h
    db $10
    add hl, sp
    cp $7c
    db $10
    xor b
    db $10

jr_002_4e2a:
    ld b, h
    sub b
    xor a

jr_002_4e2d:
    ld [hl], b
    ld e, e
    dec h
    rla
    ld a, [bc]

jr_002_4e32:
    dec hl

jr_002_4e33:
    inc e
    dec d
    ld [$0008], sp
    nop
    nop
    nop
    nop
    ld a, [$d484]
    ldh [$f0], a
    add b
    ld c, b
    add b
    call c, $8808
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    inc b
    inc bc
    rlca
    inc bc
    rrca
    nop
    ld a, [bc]
    rlca
    rrca
    nop
    inc c
    rlca
    dec de
    inc c
    ret nz

    nop
    ld b, b
    add b
    ret nz

    add b
    ldh [rP1], a
    or b
    ld b, b
    ldh a, [rP1]
    jr nc, jr_002_4e2a

    ret nc

    jr nz, jr_002_4ea0

    inc e
    ld d, c
    ld a, $56
    add hl, sp
    ld d, c
    ld a, $56
    add hl, sp
    ld d, b
    ccf
    ccf
    nop
    rra
    nop
    ret z

    jr nc, jr_002_4e03

    ld a, b
    ld h, [hl]
    sbc b
    add [hl]
    ld a, b
    ld h, [hl]
    sbc b
    ld b, $f8
    cp $00
    db $fc
    nop
    rlca
    nop
    ld a, [bc]
    rlca
    rrca
    nop
    ld a, [bc]
    rlca
    rrca
    rlca
    rla
    rrca
    cpl
    rra
    ccf
    rra
    ret nz

    nop
    and b
    ld b, b

jr_002_4ea0:
    ldh [rP1], a
    or b
    ld b, b
    ldh a, [rLCDC]
    ld [hl], b
    and b
    sbc b
    ldh a, [$d8]
    ldh a, [$28]
    rra
    jr z, jr_002_4ecf

    jr z, jr_002_4ed1

    jr z, jr_002_4ed3

    ccf

Call_002_4eb5:
    rra
    cpl
    rra
    rra
    nop
    rlca
    nop
    ld a, h
    ret nc

    ld a, h
    ret nc

    ld a, h
    ret nc

    ld a, h
    ret nc

    db $fc
    ret nc

    xor h
    ret nc

    db $fc
    nop
    ld hl, sp+$00
    nop
    nop
    rrca

jr_002_4ecf:
    rra
    db $10

jr_002_4ed1:
    ccf
    cpl

jr_002_4ed3:
    ld [hl], b
    ld e, d
    ld h, l
    ld d, [hl]
    ld l, c
    ld e, [hl]
    ld h, c
    ld d, a
    ld l, c
    nop
    nop
    and b
    ldh a, [rP1]
    ld hl, sp-$20
    inc e
    ldh a, [$0c]
    jp nc, $fa2c

    inc c
    inc sp
    call z, $605f
    rla
    ld l, b
    ld e, [hl]
    ld h, c
    rrca
    ld [hl], b
    ld [bc], a
    ccf
    nop
    rra
    rlca
    nop
    ld bc, $fb00
    inc c
    db $db
    inc l
    ei
    inc e
    di
    inc a
    rst $20
    ld hl, sp+$0e
    ldh a, [$fc]
    nop

jr_002_4f0a:
    ld hl, sp+$00
    ld bc, $0300
    ld bc, $0207
    ld c, a
    ld [hl-], a
    or l
    ld a, d
    ld a, e
    db $fc
    ld [hl], a
    db $fd
    ld l, e
    db $fd
    add b
    nop
    add b
    nop

jr_002_4f20:
    nop
    nop
    ld a, b
    nop
    db $fc
    nop
    cp d
    call nz, $e49a
    ld e, $e4
    ld sp, $a2ff
    ld a, l
    db $10
    ld a, a
    ld b, d
    dec a
    daa
    jr jr_002_4f56

    nop
    ld b, $00
    nop
    nop
    sbc [hl]
    db $e4
    ld [hl], $cc
    cp h
    ret z

    ld [hl], h
    sbc b
    add sp, $10
    ldh a, [rP1]
    ret nz

    nop
    nop
    nop
    rlca
    nop
    jr jr_002_4f57

    jr nc, jr_002_4f71

    ld b, b
    ccf
    add a
    ld a, b

jr_002_4f56:
    adc a

jr_002_4f57:
    ld [hl], b
    adc [hl]
    ld [hl], b
    adc h
    ld [hl], b
    ret nz

    nop
    jr nc, jr_002_4f20

    ld [$04f0], sp
    ld hl, sp-$3e
    inc a
    ld [c], a
    inc e
    inc hl
    inc e
    inc hl
    inc e
    adc h
    ld [hl], b
    add [hl]
    ld a, b
    ld b, [hl]

jr_002_4f71:
    jr c, @+$44

    inc a
    ccf
    inc e
    rra
    nop
    rrca
    nop
    nop
    nop
    inc hl
    inc e
    ld b, e
    inc a
    ld b, a
    jr c, jr_002_4f0a

    ld a, b
    cp $70
    cp $00
    inc a
    nop
    nop
    nop
    inc bc
    nop
    inc bc
    nop
    ld b, $01
    ld b, $03
    ld c, $01
    dec bc
    inc b
    add hl, de
    ld c, $1b
    inc b
    add b
    nop
    add b
    nop
    ret nz

    nop
    ld b, b
    add b
    ldh [rP1], a
    and b
    ld b, b
    sub b
    ldh [$b0], a
    ld b, b
    ccf
    nop
    ld l, $11
    ld h, [hl]
    dec sp
    ld l, [hl]
    ld de, $00ff
    rst $38
    nop
    nop
    nop
    nop
    nop
    ld hl, sp+$00
    add sp, $10
    ld h, h
    cp b
    db $ec
    db $10
    cp $00
    cp $00
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
    jr c, @+$3a

    ld de, $3813
    jr c, @+$03

    ld bc, $0101
    nop
    nop
    nop
    nop
    rrca
    rra
    ld [bc], a
    ld b, $c4
    call z, $d888
    ld e, $bf
    ret nz

    ldh [rP1], a
    nop
    nop
    nop
    inc bc
    rlca
    ld bc, $3a01
    dec sp
    inc de
    inc de
    jr c, jr_002_5032

    nop
    nop
    nop
    nop
    nop
    nop
    add b
    add b
    ld e, $bf
    inc b
    ld b, $88
    call z, Call_000_1810
    inc a
    ld a, $18
    rlca

jr_002_500e:
    dec l
    ld e, $59
    ld a, $7f
    nop
    ld e, e
    ld [hl], $34
    dec bc
    rrca
    nop
    nop
    nop
    and l
    ld e, d
    rst $38
    nop
    ld a, [hl]
    db $db
    inc h
    db $db
    rst $38
    nop
    and l
    ld e, d
    rst $38
    nop
    nop
    nop
    jr jr_002_500e

    or h
    ld a, b
    sbc d
    ld a, h

jr_002_5032:
    cp $00
    jp c, $2c6c

    ret nc

    ldh a, [rP1]
    nop
    nop
    ld a, $00
    ld a, [hl+]
    inc e
    ld a, $00
    ld a, [hl+]
    inc e
    ld a, [hl+]
    inc e
    ld a, [hl+]
    inc e
    ld [hl], $08
    inc e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec de
    inc b
    ccf
    db $10
    ld a, a
    jr nz, jr_002_50b8

    jr nz, jr_002_50da

    nop
    nop
    nop
    nop
    nop
    ldh [rP1], a
    cp b
    ld b, b
    db $e4
    jr @-$04

    inc c
    ld a, [c]
    inc c
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$0000], sp
    ld [$0814], sp
    ld a, [hl+]
    inc e
    ld a, [hl+]
    inc e
    nop
    nop
    stop
    jr jr_002_5082

jr_002_5082:
    inc [hl]
    ld [$186e], sp
    cp a
    ld e, d
    sbc e
    ld a, [hl]
    ld h, c
    ld a, $3f
    nop
    ld e, a
    ld a, [hl-]
    sbc a
    ld a, d
    push bc
    ld a, [hl-]
    cp a
    ld b, b
    and l
    ld a, d
    ld e, a
    ld a, [hl-]
    ccf
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    ld b, b
    nop
    and b
    inc b
    ld b, h
    nop
    nop
    nop
    nop
    jr nz, @+$22

jr_002_50b8:
    nop
    ld [bc], a
    nop
    nop
    nop
    and h
    inc b
    inc b
    ld c, $bf
    inc b
    inc b
    jr nz, jr_002_513a

    ld d, b
    ld d, d
    ld [hl+], a
    ld [hl], a
    nop
    ld [bc], a
    inc b
    inc b
    ld b, h
    ld c, [hl]
    rra
    ccf
    inc h
    ld l, $24
    ld [hl], h
    jp c, Jump_000_27de

    ld [hl], a

jr_002_50da:
    ld [hl+], a
    ld [hl+], a
    nop
    ld b, h
    ld b, h
    db $e4
    ld c, $5f
    inc b
    inc b
    jr nz, jr_002_515a

    ld d, d
    rst $18
    dec h
    ld l, l
    ld [bc], a
    rlca
    ld d, h
    jr c, jr_002_5143

    jr c, jr_002_5145

    jr c, jr_002_5147

    jr c, jr_002_5149

    jr c, jr_002_514b

    jr c, @+$6e

    db $10
    jr c, jr_002_50fc

jr_002_50fc:
    jr c, jr_002_50fe

jr_002_50fe:
    ld l, h
    db $10
    ld d, h
    jr c, @+$56

    jr c, @+$56

    jr c, jr_002_515b

    jr c, jr_002_515d

    jr c, @+$56

    jr c, jr_002_511d

    jr c, @+$0a

    inc e
    inc b
    ld a, $3c
    ld a, [hl]
    jr nz, jr_002_5192

    jr jr_002_5154

    inc b
    ld c, $08
    inc e
    rlca

jr_002_511d:
    inc bc
    dec d
    ld c, $27
    jr @+$31

    db $10
    rra
    nop
    cpl
    db $10
    ld c, a
    jr nc, jr_002_51aa

    jr nz, jr_002_515d

    ret nz

    db $ec
    db $10
    cp $00
    cp $00
    cp $00
    db $fc
    nop
    ld hl, sp+$00

jr_002_513a:
    ldh a, [rP1]
    inc d
    ld [$1c33], sp
    ld l, a
    jr nc, jr_002_51a2

jr_002_5143:
    jr nz, @+$41

jr_002_5145:
    nop
    ccf

jr_002_5147:
    nop
    rra

jr_002_5149:
    nop
    rrca

jr_002_514b:
    db $10
    inc d
    ld [$fc0a], sp
    ld a, [$fe04]
    nop

jr_002_5154:
    cp $00
    cp $00
    cp $00

jr_002_515a:
    db $fc

jr_002_515b:
    nop
    nop

jr_002_515d:
    nop
    jr z, @+$12

    ld e, h
    jr nc, jr_002_51e1

    ld hl, $205f
    ld a, a
    nop
    ld a, a
    nop
    ccf
    nop
    jr z, jr_002_517e

    ld l, h
    jr nc, @-$20

    ld h, b
    ld a, $c0
    db $fc
    nop
    db $fc
    nop
    cp $00
    rst $38
    nop
    jr z, jr_002_518e

jr_002_517e:
    ld d, [hl]
    jr c, jr_002_51f0

    jr nc, jr_002_51f2

    jr nc, @+$71

    db $10
    ccf
    nop
    rra
    nop
    rrca
    stop
    nop

jr_002_518e:
    ld [hl-], a
    inc e
    dec l
    ld a, [c]

jr_002_5192:
    rst $38
    nop
    rst $38
    nop
    cp $00
    ld hl, sp+$00
    ld hl, sp+$00
    rst $38
    ld b, b
    cp a
    ld b, b
    rst $38
    nop

jr_002_51a2:
    cp h
    ld b, e
    rst $30
    ld [$0079], sp
    nop
    nop

jr_002_51aa:
    nop
    nop
    ldh a, [rP1]
    db $fc
    nop
    cp $00
    ld a, [hl]
    add b
    ld a, [hl]
    ret nz

    adc $30
    ld a, h
    nop
    nop
    nop
    ccf
    db $10
    ld l, a
    jr nc, jr_002_5220

    jr nz, @-$3f

    ld b, b
    cp a
    ld b, b
    rst $18
    jr nz, jr_002_5245

    nop
    nop
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $10
    jr c, jr_002_51ea

    inc c
    ld c, $00
    nop
    nop
    rra
    jr nz, jr_002_525e

    jr nz, jr_002_5220

jr_002_51e1:
    ld h, b
    ld a, [hl]
    ld b, c
    ccf
    ld b, b
    ld e, [hl]
    jr nz, @+$3e

    nop

jr_002_51ea:
    nop
    nop
    rst $38
    nop
    rst $38
    nop

jr_002_51f0:
    adc a
    ld [hl], b

jr_002_51f2:
    rst $28
    jr jr_002_5208

    inc c
    ld c, $00
    nop
    nop
    nop
    nop
    rra
    nop
    cpl
    db $10
    ld c, a
    jr nc, jr_002_5282

    jr nz, jr_002_5262

    ld [hl+], a
    ld l, h
    db $10

jr_002_5208:
    jr c, jr_002_520a

jr_002_520a:
    nop
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    ccf
    ldh [$df], a
    jr nc, jr_002_523a

    inc e
    ld e, $00
    nop

jr_002_521b:
    nop
    nop
    nop
    nop
    nop

jr_002_5220:
    nop
    inc b
    inc c
    ld [$1814], sp
    scf
    dec sp
    ld h, e
    ld a, a
    ret nz

    rst $38
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_002_5263

    jr nz, jr_002_525d

    jr nc, jr_002_521b

    ld hl, sp-$0e
    db $fc

jr_002_523a:
    ld bc, $60fe
    ld a, a
    scf
    jr c, jr_002_5255

    jr jr_002_524b

    inc c
    nop

jr_002_5245:
    inc b
    nop
    nop
    nop
    nop
    nop

jr_002_524b:
    nop
    ld [bc], a
    db $fc
    db $f4
    jr c, jr_002_5279

    jr nc, jr_002_5283

    jr nz, jr_002_5255

jr_002_5255:
    jr nz, jr_002_5257

jr_002_5257:
    nop
    nop
    nop
    nop
    nop
    nop

jr_002_525d:
    nop

jr_002_525e:
    inc a
    nop
    ld b, d
    inc a

jr_002_5262:
    sub c

jr_002_5263:
    ld a, [hl]
    and b
    ld a, a
    and b
    ld a, a
    add b
    ld a, a
    ld b, b
    ccf
    nop
    nop
    ld a, b
    nop
    add h
    ld a, b
    ld b, d
    db $fc
    ld [bc], a
    db $fc
    inc bc
    db $fc
    inc bc

jr_002_5279:
    db $fc
    rlca
    ld hl, sp+$60
    rra
    jr nc, jr_002_528f

    jr @+$09

jr_002_5282:
    inc c

jr_002_5283:
    inc bc
    ld b, $01
    inc bc
    nop
    ld bc, $0000
    nop
    rrca
    ldh a, [rNR34]

jr_002_528f:
    ldh [$3c], a
    ret nz

    ld a, b
    add b
    ldh a, [rP1]
    ldh [rP1], a
    ret nz

    nop
    add b
    nop
    nop
    nop
    inc c
    nop
    ld a, [bc]
    inc b
    dec a
    ld b, $7e
    ccf
    db $dd
    ld h, [hl]
    ld [$ec44], a
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp h
    nop
    ld a, [hl-]
    inc e
    add hl, sp
    ld b, $05
    ld [bc], a
    and b
    ld b, b
    sbc h
    ld h, b
    ld e, h
    jr c, jr_002_5300

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    scf
    ld [bc], a
    ld d, a
    ld [hl+], a
    cp l
    ld h, [hl]
    ld a, d
    db $fc
    cp h
    ld h, b
    ld d, b
    jr nz, jr_002_5309

    nop
    nop
    nop
    nop
    nop
    inc e
    nop
    ld a, [hl-]
    inc e
    ld [hl], c
    ld a, $60
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    jr nz, jr_002_530b

    nop
    nop
    ld [hl], b
    nop
    add sp, $70
    call nz, $86f8
    ld hl, sp+$06
    ld hl, sp+$06
    ld hl, sp+$0e
    ldh a, [rNR41]
    rra
    db $10
    rrca

jr_002_5300:
    ld [$0407], sp
    inc bc
    ld [bc], a
    ld bc, $0001
    nop

jr_002_5309:
    nop
    nop

jr_002_530b:
    nop
    inc c
    ldh a, [rNR32]
    ldh [$38], a
    ret nz

    ld [hl], b
    add b
    ldh [rP1], a
    ret nz

    nop
    add b
    nop
    nop
    nop
    inc bc
    nop
    inc bc
    ld bc, $0001
    inc bc
    ld bc, $0107
    rst $18
    inc bc
    ld sp, hl
    rst $18
    cp a
    ld l, a
    rst $38
    sub a
    sbc a
    rlca
    rra
    rrca
    dec [hl]
    rra
    ld l, d
    ccf
    cp l
    ld b, a
    push de
    ld a, [bc]
    ld e, $00
    add b
    nop
    ret nz

    add b
    ldh [$c0], a
    ldh a, [$e0]
    ld hl, sp+$50
    ld hl, sp-$10
    cp $60
    rst $38
    or $fe
    call c, $caff
    xor d
    ret nz

    ret nz

    add b
    ret nz

    add b
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    ld a, [bc]
    rlca
    rrca
    inc b
    rra
    nop
    rla
    dec bc
    rra
    add hl, bc
    dec d
    ld c, $00
    nop
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ld hl, sp+$00
    add sp, -$30
    ld hl, sp-$70
    xor b
    ld [hl], b
    rra
    nop
    rrca
    nop
    rlca
    nop
    dec bc
    inc b
    cpl
    jr jr_002_53d6

    jr nc, jr_002_5408

jr_002_5389:
    nop
    nop
    nop
    ld hl, sp+$00
    ldh a, [rP1]
    ldh [rP1], a
    ret nc

    jr nz, @-$1a

    jr jr_002_5389

    inc c
    cp $00
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
    nop
    nop
    ld bc, $3f00
    ld bc, $3f47
    rlca
    nop
    add hl, de
    ld b, $21
    ld e, $62
    inc a
    ld a, [c]

jr_002_53b5:
    ld a, h
    ld a, h
    ld hl, sp+$38
    ldh a, [$90]
    ldh [$8f], a
    ld a, h
    db $fd
    ld a, [bc]
    dec bc
    dec b
    rla
    dec bc
    ld a, [hl+]
    ld de, $0132
    ld [bc], a
    ld bc, $0003
    ldh [$c0], a
    ret nz

    add b
    ret nz

    add b
    ld b, b
    add b
    ld b, b
    add b

jr_002_53d6:
    ld b, b
    add b
    add b
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
    nop
    nop
    nop
    nop
    nop
    ld bc, $0300
    ld bc, $0000
    jr jr_002_53f0

jr_002_53f0:
    inc a
    ld [$346a], sp
    adc $70
    sub [hl]
    ld l, b
    db $ec
    sub b
    jr c, @-$3e

    ld b, $03
    dec c
    ld b, $1a
    dec c
    ld [hl-], a
    dec e
    ld h, a
    jr c, jr_002_53b5

    ld d, c

jr_002_5408:
    sbc e
    ld h, [hl]
    halt
    nop
    ld h, b
    add b
    ret nz

    nop
    ld b, b
    add b
    and b
    ret nz

    ld e, b
    ldh [$b8], a
    ld [hl], b
    ld a, b
    nop
    nop
    nop
    ld [$0008], sp
    ld [$0800], sp
    nop
    ld [$0008], sp
    ld [$0800], sp
    nop
    ld [$0800], sp
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
    nop
    nop
    nop
    nop
    nop
    inc e
    nop
    ld [hl+], a
    inc e
    ld a, [hl+]
    inc e
    ld b, [hl]
    ld b, [hl]
    adc l
    adc l
    db $f4
    db $fc
    ld b, h
    ld a, h
    ld [hl+], a
    ld a, $2f
    ccf
    or c
    or c
    ld h, d
    ld h, d
    ld c, $0e
    sbc b
    sbc b
    adc b
    sbc b
    ld [c], a
    cp $47
    ld a, a
    ld de, $1919
    add hl, de
    ld [hl], b
    ld [hl], b
    jr nc, jr_002_549e

    ld h, [hl]
    ld h, [hl]
    ld e, e
    ld a, a
    dec h
    dec a
    and h
    cp h
    jp c, $66fe

    ld h, [hl]
    inc c
    inc c
    rlca
    nop
    jr jr_002_5480

jr_002_5480:
    jr nz, jr_002_5482

jr_002_5482:
    jr nz, jr_002_5484

jr_002_5484:
    stop
    jr nz, jr_002_5488

jr_002_5488:
    ld b, b
    nop
    ld b, b
    nop
    ldh a, [rP1]
    inc c
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    inc b
    nop
    ld [$1000], sp
    nop
    inc e
    nop

jr_002_549e:
    inc hl
    nop
    ld b, b
    nop
    ld b, b
    nop
    jr nz, jr_002_54a6

jr_002_54a6:
    jr nz, jr_002_54a8

jr_002_54a8:
    stop
    stop
    inc e
    nop
    ld [c], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    inc b
    nop
    nop
    nop
    jr c, jr_002_54c0

jr_002_54c0:
    ld b, h
    nop
    ld b, e
    nop
    ld b, b
    nop
    ld b, b
    nop
    ld b, b
    nop
    jr nz, jr_002_54cc

jr_002_54cc:
    jr c, jr_002_54ce

jr_002_54ce:
    ld b, h
    nop
    add d
    nop
    ld [bc], a
    nop
    inc b
    nop
    inc b
    nop
    ld [bc], a
    nop
    ld bc, $3800
    nop
    ld b, [hl]
    nop
    ld b, c
    nop
    ld b, b
    nop
    ld b, b
    nop
    jr nz, jr_002_54e8

jr_002_54e8:
    stop
    stop
    nop
    nop
    ld a, $00
    pop bc
    nop
    ld bc, $0100
    nop
    ld b, $00
    ld [$0800], sp
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add [hl]
    nop
    ld a, c
    nop
    nop
    nop
    nop
    nop
    stop
    inc c
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    add d
    nop
    ld a, h
    nop
    nop
    nop
    jr nz, jr_002_551e

jr_002_551e:
    ld b, b
    nop
    ld b, b
    nop
    add b
    nop
    add b
    nop
    add e
    nop
    ld a, h
    nop
    nop
    nop
    ld [bc], a
    nop
    ld bc, $0100
    nop
    ld bc, $e100
    nop
    ld de, $0e00
    nop
    nop
    nop
    jr nz, jr_002_553e

jr_002_553e:
    ld b, b
    nop
    ld b, b
    nop
    ld b, b
    nop
    ld b, c
    nop
    ld b, d
    nop
    inc a
    nop
    nop
    nop
    ld bc, $0100
    nop
    ld bc, $e100
    nop
    ld de, $0e00
    nop
    nop
    nop
    nop
    nop
    stop
    jr nz, jr_002_5560

jr_002_5560:
    ld b, b
    nop
    ld b, b
    nop
    ld b, e
    nop
    ld b, h
    nop
    jr c, jr_002_556a

jr_002_556a:
    nop
    nop
    ld b, $00
    ld bc, $0100
    nop
    ld bc, $c100
    nop
    ld hl, $1e00
    nop
    nop
    nop
    nop
    nop
    add hl, bc
    ld b, $1d
    ld c, $3b
    inc e
    ld d, d
    dec a
    ld b, h
    dec sp
    ld c, h
    inc sp
    inc l
    inc de
    nop
    nop
    ld a, b

jr_002_558f:
    add b
    db $ec
    db $10
    cp $10
    ld e, $e8
    adc b
    or $1f
    ldh a, [$3f]
    ldh a, [$3d]
    inc bc
    ld h, $19
    dec de
    inc c
    inc c
    rlca
    ld b, $03
    inc bc
    nop
    nop
    nop
    nop
    nop
    rst $28
    ldh a, [$d2]
    db $ec
    or $18
    xor $30
    db $fc
    jr nz, jr_002_558f

    jr nz, @+$62

    nop
    nop
    nop
    inc d
    ld [$1c33], sp
    ld l, a
    jr nc, @+$61

    jr nz, jr_002_5603

    ld bc, $033c
    inc e
    inc bc
    inc c
    inc de
    inc d
    ld [$fc0a], sp
    ld a, [$fe04]
    nop
    ld e, $e0
    adc [hl]
    ldh a, [rNR34]
    ldh a, [$3c]
    ldh a, [$3d]
    inc de
    ld l, [hl]
    ld sp, $205f
    cp a
    ld b, b
    cp a
    ld b, b
    rst $18
    jr nz, jr_002_5665

    nop
    nop
    nop
    xor $f0
    rst $18
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $10
    jr c, jr_002_560a

    inc c
    ld c, $00
    nop
    nop
    nop
    nop
    rlca
    nop
    rra
    nop
    ccf

jr_002_5603:
    inc c
    ccf
    inc c
    ld a, a
    nop
    ld a, a
    nop

jr_002_560a:
    ld a, a
    nop
    nop
    nop
    ldh [rP1], a
    ld hl, sp+$00
    db $fc
    nop
    db $f4
    ld [$00fe], sp
    ld a, [$fa04]
    inc b
    ld e, a
    jr nz, jr_002_569e

    nop
    ld c, a
    jr nc, jr_002_5643

    rra
    inc sp
    rrca
    inc e
    inc bc
    rlca
    nop
    nop
    nop
    ld a, [c]
    inc c
    ld [$921c], a
    ld a, h
    ld h, h
    ld hl, sp-$34
    ldh a, [$38]
    ret nz

    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    nop
    rrca

jr_002_5643:
    nop
    rra
    inc b
    rra
    inc b
    ccf
    nop
    ccf
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop
    ldh a, [rP1]
    ld hl, sp+$00
    add sp, $10
    db $f4
    ld [$08f4], sp
    ccf
    nop
    scf
    ld [$0f10], sp
    dec de
    rlca
    inc c

jr_002_5665:
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    nop
    db $e4
    jr jr_002_5643

    jr c, jr_002_5699

    ldh a, [$d8]
    ldh [$30], a
    ret nz

    ret nz

    nop
    nop
    nop
    nop
    nop
    ld e, $00
    ccf
    nop
    ld a, a
    jr nc, @+$01

    nop
    rst $38
    nop
    rst $38
    nop
    sbc l
    ld h, e
    ld b, [hl]
    ccf
    nop
    nop
    nop
    nop
    add b
    nop
    ret nz

    nop
    ld b, b
    add b
    ld b, b
    add b
    ld b, b

jr_002_5699:
    add b
    add b
    nop
    inc sp
    inc c

jr_002_569e:
    ld e, $00
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
    nop
    nop
    inc a
    nop
    ld a, [hl]
    jr nz, @+$01

    nop
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    cp c
    ld b, [hl]
    ld e, d
    inc a
    inc a
    nop
    nop
    nop
    rra
    nop
    jr nc, jr_002_56e1

    ld l, [hl]
    inc sp
    ld a, l
    ld [hl+], a
    ld a, a
    jr nz, @+$7d

    daa
    ld a, h

jr_002_56cb:
    inc hl
    nop
    nop
    add b
    nop
    ret nz

    nop
    ldh [rP1], a
    or b
    ld b, b

jr_002_56d6:
    xor b
    ret nc

    ld c, h
    or b
    cp h
    ld h, b
    ld c, a
    jr nc, jr_002_5714

    dec de
    dec de

jr_002_56e1:
    inc c
    dec c
    ld b, $06
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    nop
    ld [hl], h
    ret z

    or h
    ret c

    db $ec
    jr nc, jr_002_56cb

    ldh [$f0], a
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop

jr_002_56fc:
    inc a
    nop
    ld h, [hl]
    jr c, jr_002_56d6

    ld l, d
    db $fd
    ld b, [hl]
    ld a, [$ff4d]
    ld b, d
    ld e, a
    inc h
    cpl
    ld de, $0000
    nop
    nop
    nop
    nop
    add b
    nop

jr_002_5714:
    add b
    nop
    ret nz

    nop
    ld b, b
    add b
    add b
    nop
    rla
    ld a, [bc]
    ld c, $00
    nop
    nop
    nop

jr_002_5723:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr c, jr_002_572e

jr_002_572e:
    ld a, h
    jr nz, jr_002_5723

    ld c, h
    db $ed
    ld e, d
    cp c
    ld b, [hl]
    ld d, l
    ld l, $2a
    inc d
    inc e
    nop
    ld l, [hl]
    nop
    db $dd
    ld h, [hl]
    cp e
    ld l, h
    ld b, [hl]
    jr c, jr_002_57ba

    ld e, $bb
    ld [hl], h
    xor a
    ld d, b
    ld a, d
    nop
    ld h, [hl]
    jr jr_002_56fc

    ld e, d
    ld a, c
    sbc $d2
    rst $38
    scf
    ei
    add h
    ld a, e
    call $7232
    nop
    ld c, $00
    ld de, $2f0e
    ld e, $2d
    ld e, $51
    ld l, $59
    ld a, $22
    inc e
    inc e
    nop
    inc c
    nop
    ld [de], a
    inc c
    ld l, $1c
    ld a, [hl+]
    inc e
    ld d, h
    jr z, jr_002_57c9

    inc a
    ld h, $18
    jr jr_002_577c

jr_002_577c:
    nop
    nop
    jr c, jr_002_5780

jr_002_5780:
    ld d, h
    jr z, jr_002_57f1

    inc a
    ld b, l
    ld a, $29
    ld d, $1e
    nop
    nop
    nop
    nop
    nop
    jr z, jr_002_5790

jr_002_5790:
    ld d, [hl]
    jr z, jr_002_57ed

    inc l
    ld d, a
    ld a, [hl-]
    ld l, $10
    nop
    nop
    nop
    nop
    jr jr_002_579e

jr_002_579e:
    inc l
    jr jr_002_57fd

    jr c, jr_002_57c7

    jr jr_002_57be

    nop
    ld [bc], a
    ld bc, $0000
    nop
    nop
    jr nc, jr_002_57ae

jr_002_57ae:
    ld a, b
    jr nc, jr_002_5809

    jr nz, jr_002_5813

    nop
    nop
    nop
    inc b
    nop
    nop
    nop

jr_002_57ba:
    nop
    nop
    stop

jr_002_57be:
    jr z, jr_002_57d0

    ld d, b
    jr nz, jr_002_57c3

jr_002_57c3:
    nop
    nop
    nop
    nop

jr_002_57c7:
    nop
    nop

jr_002_57c9:
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_002_57d0

jr_002_57d0:
    ld d, b
    jr nz, jr_002_57f3

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
    nop
    inc bc
    nop
    dec b
    inc bc
    ld c, $01
    ld [$3207], sp
    dec c
    ld b, h
    ccf
    ld d, h
    ccf

jr_002_57ec:
    nop

jr_002_57ed:
    nop
    ret nz

    nop
    cp b

jr_002_57f1:
    ret nz

    ld b, h

jr_002_57f3:
    cp b
    jr nc, @-$32

    jr z, jr_002_57ec

    add b
    ld a, h
    add h
    ld a, b
    rlca

jr_002_57fd:
    nop
    ld [$0d07], sp
    inc bc
    jr nc, jr_002_5813

    ld h, a
    dec de

jr_002_5806:
    cp d
    ld d, a
    db $ec

jr_002_5809:
    ld d, a
    ret nz

    ld a, a
    add b
    nop
    ld a, b
    add b
    and h
    ret c

    or [hl]

jr_002_5813:
    ret c

    ld h, $d8
    inc l
    jp nc, $7d8a

    xor l
    ld a, [hl]
    ld [hl], d
    inc c
    adc l

jr_002_581f:
    db $76
    ld h, l
    cp $61
    cp $42
    db $fd
    rst $38
    jr jr_002_5806

    cp $18
    rst $38
    jr c, jr_002_582e

jr_002_582e:
    ld d, h
    jr z, jr_002_581f

    inc a
    ld b, l
    cp [hl]
    jp hl


    sub [hl]
    cp $00
    ld e, $08
    ld d, $0c
    ld e, e
    inc a
    jr nz, jr_002_585f

    jr z, @+$21

    inc hl
    rra
    dec e
    inc bc
    ld c, $01
    nop
    nop
    nop
    nop
    ld a, h
    ret nz

    ret z

    db $f4
    inc [hl]
    ret z

    add sp, $10
    or b
    ret z

    jr nc, @-$3e

    nop
    nop
    nop
    nop
    jp $a47c


jr_002_585f:
    ld e, a
    adc $3f
    ld e, h
    cpl
    ld d, h
    cpl
    ld c, b
    scf
    ld hl, $1f1e
    nop
    ld l, l
    or $e9
    or $6d
    ld a, [c]
    sbc a
    ld h, b
    or [hl]
    ld c, b
    add sp, $10
    or b
    nop
    nop

jr_002_587b:
    nop
    cp d
    ld d, h
    db $ed
    ld a, $b7
    ld a, c
    ld c, c
    ld a, $b9
    ld a, a
    xor [hl]
    ld [hl], c
    ld d, e
    inc a
    jr c, jr_002_588c

jr_002_588c:
    dec d
    ld c, $e6
    jr jr_002_58da

    or [hl]
    or l
    xor $ab
    call c, Call_002_4eb5
    ld [$1c14], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    nop
    ld h, h
    dec sp
    sbc $63
    db $fd
    ld b, [hl]
    di
    ld c, h
    db $fd
    ld b, e
    or $4f
    ld hl, sp+$47
    add b
    nop
    ldh [rP1], a
    ret nc

    jr nz, jr_002_587b

    ld b, b
    sub h
    add sp, $2c
    ret nc

    ld b, [hl]
    cp b
    xor [hl]
    ld [hl], b
    sbc a
    ld h, b
    ld l, l
    inc sp
    db $76
    add hl, de
    dec sp
    inc c
    dec e
    ld b, $0e
    inc bc
    rlca
    nop

jr_002_58da:
    nop
    nop
    ld e, d
    db $e4
    sub d
    db $ec
    ld l, $d8
    sub $38
    ld l, h
    ldh a, [$f8]
    nop
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_002_590c

    jr jr_002_590e

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
    inc b
    inc b
    jr jr_002_591c

    jr @+$1a

    jr nz, jr_002_5928

    nop
    nop
    nop
    nop

jr_002_590c:
    nop
    nop

jr_002_590e:
    ld [bc], a
    ld [bc], a
    jr nz, jr_002_5936

    nop
    nop
    nop
    nop
    inc b
    inc h
    ld b, b
    ld b, b
    nop
    nop

jr_002_591c:
    ld bc, $4001
    ld b, d
    nop
    jr nz, jr_002_5923

jr_002_5923:
    nop
    nop
    nop
    nop
    inc b

jr_002_5928:
    ld [bc], a
    ld b, d
    add b
    add b
    add b
    add c
    nop
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop

jr_002_5936:
    nop
    nop
    nop
    ld [bc], a
    ld bc, $0081
    add b
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
    nop
    nop
    nop
    ld bc, $ffff
    ld a, [c]
    adc a
    push hl
    sbc a
    res 7, a
    sub a
    rst $38
    xor a
    rst $38
    rst $18
    rst $38
    ld a, a
    add b
    cp $ff
    db $fd
    cp $fb
    cp $f5
    cp $e9
    cp $d3
    db $fc
    and a
    ld hl, sp-$01
    nop
    nop
    rst $38
    inc c
    add e
    add hl, de
    add a
    ld [hl-], a
    adc a
    ld h, l
    sbc a
    ld c, e
    cp a
    ld d, $ff
    add b
    nop
    ld bc, $b4fe
    cp $68
    cp $d2
    db $fc
    and [hl]
    ld hl, sp+$4c
    ldh a, [$98]
    ldh [rP1], a
    nop
    rst $38
    nop
    adc e
    nop
    sub [hl]
    ld bc, $02ad
    jp c, $b405

    dec bc
    jp hl


    ld d, $00
    nop
    cp $00
    ld c, d
    or h
    sub [hl]
    ld l, b
    inc l
    ret nc

    ld e, d
    and b
    or h
    ld b, b
    ld l, b
    add b
    nop
    nop
    nop
    nop
    rra
    nop
    inc h
    dec de
    ld c, l
    dec sp
    ld e, d
    dec a
    db $76
    dec c
    ld c, l
    ld [hl-], a
    ld d, d
    inc a
    nop
    nop
    ld hl, sp+$00
    inc h
    ret c

    or d
    call c, $bc5a
    ld l, [hl]
    or b
    or d
    ld c, h
    ld c, d
    inc a
    nop
    nop
    ld b, d
    nop
    sbc h
    ld b, d
    ld h, e
    sbc $63
    sbc $9c
    ld b, d
    ld b, d
    nop
    nop
    nop
    nop
    nop
    ld a, a
    nop
    add b
    ld b, e
    ld c, a
    jp $cb44


    sbc h
    ld c, e
    ld a, a
    nop
    nop
    nop
    nop
    nop
    rst $28
    nop
    db $10
    rst $28
    rst $28
    rst $38
    rst $28
    rst $38
    db $10
    rst $28
    rst $28
    nop
    nop
    nop
    inc h
    jr jr_002_5a59

    inc a
    jr jr_002_5a02

jr_002_5a02:
    inc h
    jr jr_002_5a29

    jr jr_002_5a2b

    jr jr_002_5a63

    inc a
    jr jr_002_5a0c

jr_002_5a0c:
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    inc h
    jr jr_002_5a6f

    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    inc a
    jr jr_002_5a3b

    nop
    nop
    nop
    nop
    ld b, d
    inc h

jr_002_5a29:
    ld h, [hl]
    ld b, d

jr_002_5a2b:
    inc h
    ld h, [hl]
    nop
    ld b, d
    nop
    nop
    nop
    jr jr_002_5a34

jr_002_5a34:
    inc a
    jr jr_002_5a91

    inc a
    ld e, d
    inc a
    ld e, d

jr_002_5a3b:
    inc a
    rst $38
    rst $38
    ld a, [c]
    adc a
    push hl
    sbc a
    res 7, a
    sub l
    cp $a9
    rst $38
    rst $18
    ei
    ld a, a
    add b
    adc $ff
    db $fd
    sbc $db
    cp $b5
    cp $69
    cp $d3
    db $fc
    and a

jr_002_5a59:
    ld hl, sp-$01
    nop
    nop
    rst $38
    inc c
    add e
    add hl, de
    add a
    ld [hl-], a

jr_002_5a63:
    adc a
    ld h, [hl]
    sbc h
    ld c, a
    cp c
    ld [de], a
    ei
    add b
    nop
    ld sp, $94ce

jr_002_5a6f:
    sbc $68
    sbc $d2
    cp h
    and [hl]
    ld a, b
    call z, $98f0
    ldh [rP1], a
    nop
    rst $38
    nop
    adc e
    nop
    sub [hl]
    ld bc, $02ad
    ret c

    inc b
    or b
    add hl, bc
    jp hl


    ld [de], a
    nop
    nop
    adc $00
    ld c, d
    sub h
    sub [hl]

jr_002_5a91:
    ld c, b
    inc l
    sub b
    ld e, b
    jr nz, jr_002_5ac7

    ret nz

    ld h, b
    add b
    nop
    nop
    rst $38
    rst $38
    di
    adc a
    rst $20
    sbc a
    ei
    rlca
    cp e
    ld a, h
    ld e, c
    rst $38
    cp a
    ei
    ld a, a
    add b
    adc $ff
    ei
    sbc $d5
    cp $bf
    ret nz

    ld a, l
    cp $d3
    db $fc
    and a
    ld hl, sp-$01
    nop
    nop
    rst $38
    inc c
    add e
    add hl, de
    add a
    ld b, $03
    ld e, h
    jr c, @-$6f

jr_002_5ac7:
    ld a, c
    ld [de], a
    ei
    add b
    nop
    ld sp, $94ce
    sbc $6a
    call c, $80c0
    or d
    ld a, h
    call z, $98f0
    ldh [rP1], a
    nop
    rst $38
    nop
    add e
    nop
    and [hl]
    ld bc, $0241
    jr nz, jr_002_5afe

    ld [hl], b
    add hl, bc
    jp hl


    ld [de], a
    nop
    nop
    adc $00
    ld c, d
    sub h
    sub h
    ld c, b
    nop
    add b
    ld c, h
    jr nc, jr_002_5b27

    ret nz

    ld h, b
    add b
    nop
    nop
    ei
    rst $38

jr_002_5afe:
    pop af
    adc a
    rst $20
    sbc l
    rst $38
    ld bc, $7cbb
    ld e, c
    rst $38
    cp a
    ei
    ld a, a
    add b
    adc $ff
    rst $38
    sbc $dd
    cp $bf
    ret nz

    ld a, l
    sbc [hl]
    jp $affc


    ldh a, [rIE]
    nop
    inc b
    ei
    ld c, $81
    add hl, de
    add l
    nop
    ld bc, $385c
    adc a

jr_002_5b27:
    ld a, c
    ld [de], a
    ei
    add b
    nop
    ld sp, $94ce
    sbc $6a
    call c, $80c0
    sbc d
    inc e
    db $fc
    ret nz

    sub b
    ldh [rP1], a
    nop
    ei
    nop
    add c
    nop
    and h
    ld bc, $0041
    jr nz, jr_002_5b5e

    ld [hl], b
    add hl, bc
    jp hl


    ld [de], a
    nop
    nop
    adc $00
    ld c, d
    sub h
    sub h
    ld c, b
    nop
    add b
    inc b
    jr jr_002_5b57

jr_002_5b57:
    ret nz

    ld h, b
    add b
    nop
    nop
    xor $32

jr_002_5b5e:
    call z, $8f80
    nop
    ret c

    ld [$80e0], sp
    push hl
    ld bc, $1823
    jr nc, jr_002_5b6c

jr_002_5b6c:
    cp h
    inc d
    or b
    nop
    db $dd
    ld c, b
    add l
    inc b
    ld b, d
    ld b, b
    ld l, $00
    ld [hl], h
    nop
    xor b
    nop
    call z, Call_002_4c32
    add b
    adc a
    nop
    ret nc

    ld [$8060], sp
    push hl
    ld bc, $1823
    jr nz, jr_002_5b8c

jr_002_5b8c:
    xor b
    inc d
    or b
    nop
    call c, $8048
    inc b
    ld [bc], a
    ld b, b
    inc l
    nop
    ld [hl], h
    nop
    add b
    nop
    xor $10
    call z, $8f00
    nop
    ret c

    nop
    ldh [rP1], a
    db $e4
    ld bc, $1823
    jr nz, jr_002_5bac

jr_002_5bac:
    cp h
    nop
    or b
    nop
    sub h
    ld c, b
    add h
    nop
    ld b, d
    nop
    inc l
    nop
    ld [hl], h
    nop
    add b
    nop
    rst $38
    rst $38
    ld a, a
    rst $38
    ccf
    rst $38
    nop
    rst $38
    rra
    ldh [rNR41], a
    ret nz

    ld b, b
    add b
    add b
    nop
    db $fd
    cp $fb
    db $fc
    rst $30
    ld hl, sp+$0f
    ldh a, [rIE]
    nop
    rlca
    nop
    inc bc
    nop
    ld bc, $ff00
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ldh [rIE], a
    rst $18
    ldh [$bf], a
    ret nz

    ld a, a
    add b
    cp $ff
    db $fc
    rst $38
    ld hl, sp-$01
    ldh a, [rIE]
    nop
    rst $38
    ld hl, sp+$07
    db $fc
    inc bc
    cp $01
    nop
    rst $38
    add b
    ld a, a
    ret nz

    ccf
    rst $38
    nop
    ldh [rP1], a
    ret nz

    nop
    add b
    nop
    nop
    nop
    ld [bc], a
    db $fc
    inc b
    ld hl, sp+$08
    ldh a, [$f0]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    ld b, d
    inc a
    inc a
    nop
    nop
    nop
    jr jr_002_5c3e

jr_002_5c3e:
    jr jr_002_5c40

jr_002_5c40:
    inc h
    jr jr_002_5c67

    jr jr_002_5c69

    jr jr_002_5c6b

    jr jr_002_5c6d

    jr jr_002_5c6f

    jr jr_002_5c71

    jr jr_002_5ca9

    inc a
    jr jr_002_5c52

jr_002_5c52:
    inc h
    jr @+$26

    jr jr_002_5c7b

    jr @+$5c

    inc a
    jr jr_002_5c5c

jr_002_5c5c:
    ld e, d
    inc a
    ld e, d
    inc a
    nop
    ld b, d
    nop
    ld b, d
    nop
    ld b, d
    nop

jr_002_5c67:
    ld b, d
    db $10

jr_002_5c69:
    ld b, d
    nop

jr_002_5c6b:
    ld d, d
    ld e, d

jr_002_5c6d:
    inc a
    ld e, d

jr_002_5c6f:
    inc a
    nop

jr_002_5c71:
    ld b, d
    jr jr_002_5cb6

    jr jr_002_5cb8

    nop
    ld b, d
    ld [$1052], sp

jr_002_5c7b:
    ld d, d
    ld e, d
    inc a
    ld e, d
    inc a
    nop
    ld b, d
    nop
    ld e, d
    nop
    ld e, d
    nop
    ld b, d
    db $10
    ld e, d
    ld [$5a42], sp
    inc a
    ld e, d
    inc a
    nop
    ld b, d
    jr @+$5c

    jr jr_002_5cf0

    nop
    ld b, d
    ld [$004a], sp
    ld c, d
    ld e, d
    inc a
    ld e, d
    inc a
    nop
    ld b, d
    nop
    ld e, d
    nop
    ld e, d
    nop
    ld b, d
    nop

jr_002_5ca9:
    ld b, d
    ld [$5a4a], sp
    inc a
    ld e, d
    inc a
    nop
    ld b, d
    jr jr_002_5cf6

    jr jr_002_5cf8

jr_002_5cb6:
    nop
    ld b, d

jr_002_5cb8:
    nop
    ld b, d
    db $10
    ld b, d
    db $10
    ld d, d
    nop
    ld b, d
    nop
    ld b, d
    jr jr_002_5d1e

    jr jr_002_5d20

    nop
    ld b, d
    ld e, d
    inc a
    ld e, d
    inc a
    nop
    ld b, d
    nop
    ld b, d
    nop
    ld b, d
    nop
    ld e, d
    nop
    ld e, d
    nop
    ld b, d
    ld e, d
    inc a
    ld e, d
    inc a
    nop
    ld b, d
    nop
    ld b, d
    nop
    ld b, d
    jr jr_002_5d26

    jr jr_002_5d28

    nop
    ld b, d
    ld e, d
    inc a
    ld e, d
    inc a
    ld [$0042], sp
    ld b, d

jr_002_5cf0:
    nop
    ld b, d
    nop
    ld b, d
    nop
    ld b, d

jr_002_5cf6:
    nop
    ld b, d

jr_002_5cf8:
    ld e, d
    inc a
    ld e, d
    inc a
    db $10
    ld c, d
    nop
    ld b, d
    nop
    ld b, d
    jr jr_002_5d46

    jr jr_002_5d48

    nop
    ld b, d
    ld e, d
    inc a
    ld e, d
    inc a
    ld [$005a], sp
    ld b, d
    nop
    ld b, d
    nop
    ld e, d
    nop
    ld e, d
    nop
    ld b, d
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a

jr_002_5d1e:
    ld a, [de]
    inc a

jr_002_5d20:
    ld a, [de]
    inc a
    ld a, [de]
    inc a
    ld a, [de]
    inc a

jr_002_5d26:
    ld a, [de]
    inc a

jr_002_5d28:
    ld a, [de]
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc e
    ld e, d
    inc e
    ld e, d
    inc e
    ld e, d
    inc e
    ld e, d
    inc e
    ld e, d
    inc e
    ld e, d
    inc a
    ld e, d
    inc a
    ld c, d
    inc c
    ld e, d
    inc c
    ld e, d
    inc c
    ld e, d
    inc c

jr_002_5d46:
    ld e, d
    inc c

jr_002_5d48:
    ld c, d
    inc c
    ld e, d
    inc a
    ld e, d
    inc a
    ld b, d
    inc b
    ld c, d
    inc d
    ld d, d
    inc b
    ld d, d
    inc b
    ld b, d
    inc b
    ld b, d
    inc b
    ld e, d
    inc a
    ld e, d
    inc a
    ld b, d
    nop
    ld d, d
    jr jr_002_5dad

    db $10
    ld c, d
    db $10
    ld e, d
    nop
    ld b, d
    nop
    ld e, d
    inc a
    ld e, d
    inc a
    ld b, d
    nop
    ld b, d
    nop
    ld b, d
    nop
    ld b, d
    nop
    ld b, d
    nop
    ld b, d
    nop
    ld e, d
    inc a
    nop
    nop
    rst $38
    nop
    nop
    add b
    xor b
    add l
    and l
    adc b
    nop
    add b
    rst $38
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    jr z, jr_002_5dd6

    ld b, d
    jr z, jr_002_5d97

jr_002_5d97:
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    add b
    ld d, c
    ld c, c
    sub l
    ld de, $0029
    add hl, bc
    rst $38
    nop
    nop
    nop
    nop

jr_002_5dad:
    nop
    rst $38
    nop
    nop
    add b
    add l
    xor b
    adc b
    and l
    nop
    add b
    rst $38
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    ld b, d
    jr z, jr_002_5ded

    ld b, d
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    ld b, b
    adc c
    sub c
    ld l, c
    add hl, bc
    dec d

jr_002_5dd6:
    nop
    ld de, $00ff
    nop
    nop
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    ld e, d
    inc a
    nop

jr_002_5ded:
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
    nop
    nop
    nop
    nop
    nop
    ld [hl], h
    jr c, jr_002_5e5d

    ld h, b
    ld h, $40
    ld b, d
    inc h
    inc b
    ld h, [hl]
    jr jr_002_5e86

    ld b, d
    inc a
    nop
    nop
    jr c, jr_002_5e1e

    inc l
    jr nc, jr_002_5e2d

    jr nz, jr_002_5e37

    jr jr_002_5e1d

    inc a
    nop
    inc a
    inc h
    jr jr_002_5e1b

jr_002_5e1b:
    nop
    ld b, d

jr_002_5e1d:
    ld a, h

jr_002_5e1e:
    ld a, b
    ld b, $08
    ld b, $64
    jr c, jr_002_5e95

    ld h, b
    jr jr_002_5ea6

    ld [bc], a
    ld a, h
    nop
    nop
    ld [hl], h

jr_002_5e2d:
    jr c, jr_002_5e8d

    ld h, b
    ld b, $00
    ld [bc], a
    inc e
    inc b
    ld b, $18

jr_002_5e37:
    ld a, [hl]
    ld b, d
    inc a
    nop
    nop
    ld b, h
    inc h
    ld b, d
    ld h, h
    ld [hl+], a
    ld b, h
    ld b, d
    inc a
    nop
    ld b, $00
    ld b, $02
    inc b
    nop
    nop
    ld h, d
    ld a, h
    ld e, [hl]
    ld h, b
    jr nc, jr_002_5e92

    ld [hl+], a
    inc e
    inc c
    ld b, $18
    ld a, [hl]
    ld b, d
    inc a
    nop
    nop
    ld [hl], b

jr_002_5e5d:
    jr c, @+$5a

    ld h, b
    jr nz, jr_002_5ea2

    ld [bc], a
    ld a, h
    inc b
    ld h, [hl]
    jr jr_002_5ee6

    ld b, d
    inc a
    nop
    nop
    ld [hl], h
    jr c, jr_002_5ecd

    ld h, b
    ld b, $00
    inc b
    ld [$0c08], sp
    nop
    jr @+$0a

    stop
    nop
    ld [hl], h
    jr c, jr_002_5edd

    ld h, b
    ld h, $40
    ld b, d
    inc a
    inc b
    ld h, [hl]

jr_002_5e86:
    jr jr_002_5f06

    ld b, d
    inc a
    nop
    nop
    ld [hl], h

jr_002_5e8d:
    jr c, jr_002_5eed

    ld h, b
    ld h, $40

jr_002_5e92:
    ld b, d
    inc a
    inc b

jr_002_5e95:
    ld b, $00
    ld b, $02
    inc b
    nop
    nop
    inc [hl]
    ld a, b
    ld e, [hl]
    ld h, b
    ld [hl+], a
    ld b, h

jr_002_5ea2:
    ld a, [hl]
    nop
    ld b, b
    ld a, [hl]

jr_002_5ea6:
    ld b, h
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    jr nc, jr_002_5f2a

    ld e, [hl]
    ld h, b
    ld h, $40
    ld a, b
    inc b
    ld [bc], a
    ld h, h
    jr jr_002_5f36

    ld [bc], a
    ld a, h
    nop
    nop
    ld [hl-], a
    ld a, h
    ld e, [hl]
    ld h, b
    jr nz, jr_002_5f02

    ld b, b
    jr nz, jr_002_5ec5

jr_002_5ec5:
    ld h, b
    inc e
    ld a, [hl]
    ld b, b
    ld a, $00
    nop
    ld h, b

jr_002_5ecd:
    ld a, b
    inc a
    ld b, b
    ld h, $48
    ld h, d
    inc b
    inc b
    ld h, [hl]
    ld e, d
    ld a, h
    inc b
    ld a, b
    nop
    nop
    ld [hl+], a

jr_002_5edd:
    ld a, h
    ld e, [hl]
    ld h, b
    jr nz, @+$42

    ld l, h
    jr jr_002_5ee5

jr_002_5ee5:
    ld h, b

jr_002_5ee6:
    inc e
    ld a, [hl]
    ld b, b
    ld a, $00
    nop
    ld [hl+], a

jr_002_5eed:
    ld a, h
    ld e, [hl]
    ld h, b
    jr nz, @+$42

    ld l, h
    jr jr_002_5ef5

jr_002_5ef5:
    ld h, b
    nop
    ld h, b
    ld b, b
    jr nz, jr_002_5efb

jr_002_5efb:
    nop
    ld [hl+], a
    ld a, h
    ld e, [hl]
    ld h, b
    jr nz, jr_002_5f42

jr_002_5f02:
    ld l, [hl]
    nop
    nop
    ld h, [hl]

jr_002_5f06:
    inc e
    ld a, [hl]
    ld b, d
    inc a
    nop
    nop
    ld b, h
    ld h, [hl]
    ld [hl+], a
    ld b, h
    ld [hl+], a
    ld b, h
    ld a, [hl]
    nop
    inc c
    ld a, [hl]
    ld b, h
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    ld h, [hl]
    ld a, b
    ld a, $40
    ld [$1810], sp
    nop
    nop
    jr jr_002_5f8b

    ld a, d
    nop
    ld a, [hl]

jr_002_5f2a:
    nop
    nop
    ld h, d
    ld a, h
    ld a, $40
    inc b
    ld [$000c], sp
    db $10
    inc c

jr_002_5f36:
    inc [hl]
    ld a, b
    ld [$0070], sp
    nop
    ld b, b
    ld h, [hl]
    ld l, d
    ld b, h
    inc [hl]
    ld c, b

jr_002_5f42:
    ld a, b
    nop
    ld b, d
    ld a, h
    ld c, h
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    ld b, b
    ld h, b
    ld h, b
    ld b, b
    jr nz, jr_002_5f92

    ld h, b
    nop
    nop
    ld h, b
    inc e
    ld a, [hl]
    ld b, b
    ld a, $00
    nop
    nop
    ld b, d
    ld h, h
    ld b, [hl]
    ld [de], a
    ld l, h
    ld a, [hl]
    nop
    inc b
    ld h, [hl]
    ld b, h
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    ld [hl], $78
    ld e, [hl]
    ld h, b
    ld [hl+], a
    ld b, h
    ld h, [hl]
    nop
    inc b
    ld h, [hl]
    ld b, h
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    ld [hl], h
    jr c, jr_002_5fdd

    ld h, b
    ld h, $40
    ld b, d
    inc h
    inc b
    ld h, [hl]
    jr jr_002_6006

    ld b, d
    inc a
    nop

jr_002_5f8b:
    nop
    jr nc, jr_002_600a

    ld e, [hl]
    ld h, b
    ld [hl+], a
    ld b, h

jr_002_5f92:
    ld [hl], h
    ld [$6040], sp
    ld b, b
    ld h, b
    nop
    ld h, b
    nop
    nop
    ld [hl], h
    jr c, jr_002_5ffd

    ld h, b
    ld h, $40
    ld b, d
    inc h
    inc b
    ld h, [hl]
    jr @+$80

    ld d, d
    inc l
    ld [$3006], sp
    ld a, h
    ld e, [hl]
    ld h, b
    ld h, $40
    ld [hl], h
    ld [$644a], sp
    ld b, h
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    ld [hl+], a
    ld a, h
    ld e, [hl]
    ld h, b
    jr nc, jr_002_6002

    ld [hl+], a
    inc e
    inc c
    ld b, $18
    ld a, [hl]
    ld b, d
    inc a
    nop
    nop
    ld h, [hl]
    ld a, b
    ld a, $40
    ld [$1810], sp
    nop
    db $10
    jr @+$12

    jr jr_002_5fd9

jr_002_5fd9:
    jr jr_002_5fdb

jr_002_5fdb:
    nop
    ld [hl+], a

jr_002_5fdd:
    ld b, h
    ld h, d
    ld b, h
    ld h, $40
    ld h, d
    inc b
    inc b
    ld h, [hl]
    jr @+$80

    ld b, d
    inc a
    nop
    nop
    ld [hl+], a
    ld b, h
    ld h, d
    ld b, h
    ld h, $40
    ld h, d
    inc b
    inc b
    ld h, [hl]
    ld c, d
    inc a
    inc h
    jr jr_002_5ffb

jr_002_5ffb:
    nop
    ld b, b

jr_002_5ffd:
    ld h, [hl]
    ld [hl+], a
    ld b, h
    ld h, $40

jr_002_6002:
    ld a, [hl]
    nop
    jr nz, @+$80

jr_002_6006:
    ld b, h
    ld h, [hl]
    nop
    ld b, d

jr_002_600a:
    nop
    nop
    ld b, h
    ld h, [hl]
    ld [hl+], a
    ld b, h
    ld h, [hl]
    nop
    inc a
    nop
    ld c, d
    inc a
    ld b, h
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    ld b, h
    ld h, [hl]
    ld [hl+], a
    ld b, h
    ld h, [hl]
    nop
    inc a
    nop
    nop
    jr jr_002_6037

    jr jr_002_6029

jr_002_6029:
    jr jr_002_602b

jr_002_602b:
    nop
    ld h, h
    ld a, b
    ld a, $40
    ld c, $00
    ld h, h
    jr c, @+$52

    ld h, b
    inc c

jr_002_6037:
    ld a, [hl]
    ld b, b
    ld a, $00
    nop

    INCBIN "gfx/image_002_603c.2bpp"

    INCBIN "gfx/image_002_6b3c.2bpp"

    INCBIN "gfx/image_002_6b6c.2bpp"

    db $00, $01, $02, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db $03, $03, $04, $05, $06, $07, $08, $09, $03, $03, $0a, $0b, $0c, $0d, $0e, $0d
    db $0f, $10, $03, $03, $03, $03, $11, $12, $03, $03, $13, $14, $03, $03, $15, $16
    db $17, $18, $19, $18, $1a, $1b, $1c, $03, $03, $03, $1d, $1e, $03, $03, $1f, $20
    db $03, $03, $21, $22, $23, $24, $25, $26, $27, $28, $29, $03, $03, $03, $03, $2a
    db $03, $2b, $2c, $2d, $03, $03, $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $03
    db $03, $37, $38, $39, $03, $3a, $3b, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db $03, $03, $03, $03, $3c, $3d, $3e, $3f, $03, $40, $03, $03, $03, $03, $03, $03
    db $03, $03, $03, $03, $03, $03, $03, $03, $41, $42, $43, $44, $03, $03, $03, $03
    db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $45, $46, $47, $03
    db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db $48, $49, $4a, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db $03, $03, $03, $03, $03, $4b, $4c, $4d, $4e, $03, $03, $03, $03, $03, $03, $03
    db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $4f, $50, $51, $52, $03, $03
    db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db $53, $54, $55, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db $03, $03, $03, $03, $56, $57, $58, $59, $03, $03, $03, $03, $03, $03, $03, $03
    db $03, $03, $03, $03, $03, $03, $03, $03, $5a, $5b, $5c, $5d, $03, $03, $03, $03
    db $03, $03, $03, $03, $03, $03, $5e, $5f, $60, $61, $62, $63, $64, $65, $66, $67
    db $03, $03, $03, $03, $03, $68, $69, $6a, $03, $03, $6b, $6c, $6d, $6e, $6f, $70
    db $71, $72, $73, $74, $03, $03, $03, $75, $76, $77, $78, $79, $03, $03, $7a, $7b
    db $7c, $7d, $7e, $7f, $80, $81, $03, $03, $03, $03, $82, $83, $84, $85, $86, $87
    db $88, $03, $89, $8a, $8b, $8c, $8d, $8e, $06, $06, $06, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $06, $06, $06, $06
    db $00, $00, $02, $02, $02, $02, $02, $02, $02, $02, $02, $00, $00, $00, $03, $03
    db $06, $06, $06, $06, $00, $00, $02, $02, $02, $02, $02, $02, $02, $02, $02, $00
    db $00, $00, $03, $03, $06, $06, $06, $06, $00, $00, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $00, $00, $00, $00, $06, $06, $06, $06, $06, $00, $00, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $00, $00, $06, $06, $06, $06, $06, $06, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $06, $06
    db $00, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $06, $06, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $06
    db $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $06, $06, $04, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $04, $04, $04, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $07, $07
    db $07, $07, $07, $07, $04, $04, $04, $04, $00, $00, $00, $00, $00, $05, $05, $05
    db $00, $00, $07, $07, $07, $07, $07, $07, $04, $04, $04, $04, $00, $00, $00, $05
    db $05, $05, $05, $05, $00, $00, $07, $07, $07, $07, $07, $07, $04, $04, $00, $00
    db $00, $00, $05, $05, $05, $05, $05, $05, $05, $00, $07, $07, $07, $07, $07, $07

    INCBIN "gfx/image_002_6edc.2bpp"

    INCBIN "gfx/image_002_7bdc.2bpp"

    db $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $0a, $0b, $0c, $0d, $0e, $0f, $10
    db $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $00, $00, $1c, $1d, $1e
    db $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $00
    db $00, $00, $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b
    db $3c, $3d, $3e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $3f, $40
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $41, $42, $43, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $44, $45, $46, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $47, $48, $49, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $4a, $4b, $4c, $4d
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $4e, $4f, $50, $51, $52, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $53, $54, $55, $56, $57, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $58, $59, $5a, $00, $5b, $5c, $5d, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $5e, $5f, $60, $61, $62, $63, $64
    db $65, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $66, $67, $68
    db $69, $6a, $6b, $6c, $6d, $6e, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $7a, $7b, $7c, $7d, $7e, $7f, $80, $81, $82, $83, $84
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $85, $86, $87, $88, $89, $8a, $8b
    db $8c, $8d, $8e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01
    db $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01
    db $00, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01
    db $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01
    db $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00

    ld c, a
    ld hl, $73cf
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $7bcf
    ld de, $8800
    ld bc, $0150
    call DataTransfer
    ld a, $09
    ld de, $9800
    ld hl, $7d1f
    ld b, $14
    ld c, $09
    call Call_000_01d4
    xor a
    ld de, $9920
    ld b, $14
    ld c, $09
    call Call_000_01d4
    ld a, [$df0d]
    ld l, a
    ld a, [$df0e]
    ld h, a
    call Call_000_0e84
    call Call_000_0e84
    call Call_000_0e84
    call Call_000_0e84
    call Call_000_0e84
    call Call_000_0e84
    ld a, $01
    ld [$d8ac], a
    call ChangeROMBank
    ret

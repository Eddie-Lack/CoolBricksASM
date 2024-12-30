; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $4a, $29, $73, $4e, $bd, $77
    db $00, $00, $00, $41, $6f, $6e, $f9, $7f, $00, $00, $40, $01, $08, $16, $6f, $37
    db $00, $00, $d1, $00, $1b, $02, $9e, $17, $00, $00, $0f, $54, $b9, $71, $3d, $77
    db $00, $00, $e1, $3c, $08, $16, $ff, $7f, $00, $00, $11, $00, $19, $21, $1f, $42
    db $00, $00, $00, $41, $6f, $6e, $f9, $7f, $00, $00, $00, $48, $ef, $6d, $75, $7f
    db $00, $00, $65, $29, $6b, $36, $d9, $3e, $00, $00, $91, $1c, $70, $41, $5a, $77
    db $00, $00, $13, $19, $17, $2a, $3c, $4f, $00, $00, $e6, $29, $cd, $5a, $79, $67
    db $00, $00, $0a, $15, $f2, $35, $98, $4a, $00, $00, $08, $21, $31, $46, $5a, $6b

    rst $38
    ld a, a
    nop
    nop
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a

    db $00, $00, $0d, $00, $16, $00, $5f, $00, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $40, $01, $08, $16, $6f, $37
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $0f, $54, $b9, $71, $3d, $77
    db $00, $00, $e1, $3c, $08, $16, $ff, $7f, $00, $00, $0d, $00, $19, $21, $1f, $42
    db $00, $00, $0f, $54, $b9, $71, $3d, $77, $00, $00, $00, $48, $ef, $6d, $75, $7f
    db $00, $00, $65, $29, $6b, $36, $d9, $3e, $00, $00, $91, $1c, $70, $41, $5a, $77
    db $00, $00, $13, $19, $17, $2a, $3c, $4f, $00, $00, $e6, $29, $cd, $5a, $79, $67
    db $00, $00, $0a, $15, $f2, $35, $98, $4a, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $4a, $29, $73, $4e, $bd, $77
    db $00, $00, $00, $41, $6f, $6e, $f9, $7f, $00, $00, $40, $01, $08, $16, $6f, $37
    db $00, $00, $d1, $00, $1b, $02, $ff, $17, $00, $00, $0f, $54, $b9, $71, $3d, $77
    db $00, $00, $e1, $3c, $08, $16, $ff, $7f, $00, $00, $11, $00, $19, $21, $1f, $42
    db $00, $00, $00, $41, $6f, $6e, $f9, $7f, $00, $00, $d1, $00, $1b, $02, $ff, $17
    db $ff, $7f, $00, $00, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f
    db $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f
    db $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f

    nop
    nop
    dec c
    nop
    inc d
    nop
    rra
    nop
    ld c, $00
    ld d, l
    ld bc, $025b
    cp a
    inc bc
    nop
    nop
    ld l, $01
    sub $01
    rra
    inc bc
    nop
    nop
    ld l, e
    ld bc, $0292
    sbc b
    inc bc
    nop
    nop
    add b
    ld b, c
    ld h, [hl]
    ld d, d
    ld h, b
    ld [hl], e
    nop
    nop
    ld [$1034], a
    ld e, d
    ld e, h
    ld a, a
    nop
    nop
    adc d
    inc [hl]
    db $10
    ld e, c
    inc e
    ld a, [hl]
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    nop
    jr jr_001_4208

    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop

jr_001_4208:
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop

    db $00, $00, $00, $28, $00, $50, $00, $7c, $0e, $00, $55, $01, $5b, $02, $bf, $03
    db $00, $00, $2e, $01, $d6, $01, $1f, $03, $00, $00, $6b, $01, $92, $02, $98, $03
    db $00, $00, $80, $41, $66, $52, $60, $73, $00, $00, $ea, $34, $10, $5a, $5c, $7f
    db $00, $00, $8a, $34, $10, $59, $1c, $7e, $15, $00, $15, $00, $15, $00, $15, $00
    db $00, $18, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00

    db $00, $00, $47, $51, $2f, $7e, $99, $7f, $00, $00, $8b, $54, $d3, $75, $ff, $7f
    db $00, $24, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $00, $00, $05, $2d, $8f, $66, $bc, $7f, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $00, $00, $1f, $00, $ff, $02, $29, $25, $00, $00, $00, $00, $00, $00, $00, $00
    db $1f, $00, $ff, $7f, $20, $16, $00, $7c, $00, $00, $40, $01, $08, $16, $6f, $37
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $0f, $54, $b9, $71, $3d, $77
    db $00, $00, $e1, $3c, $08, $16, $ff, $7f, $00, $00, $0d, $00, $19, $21, $1f, $42
    db $00, $00, $0f, $54, $b9, $71, $3d, $77, $00, $00, $00, $48, $ef, $6d, $75, $7f
    db $00, $00, $65, $29, $6b, $36, $d9, $3e, $00, $00, $91, $1c, $70, $41, $5a, $77
    db $00, $00, $13, $19, $17, $2a, $3c, $4f, $00, $00, $e6, $29, $cd, $5a, $79, $67
    db $00, $00, $0a, $15, $f2, $35, $98, $4a, $00, $00, $4a, $29, $52, $4a, $39, $67

    nop
    nop
    rrca
    ld d, h
    cp c
    ld [hl], c
    dec a
    ld [hl], a
    nop
    nop
    nop
    ld c, b
    rst $28
    ld l, l
    ld [hl], l
    ld a, a
    nop
    nop
    ld l, h
    jr @-$2c

    inc l
    ld e, [hl]
    ld a, $00
    nop
    call nz, Call_000_2c38
    ld h, $ff
    ld a, a
    nop
    nop
    xor l
    nop
    rst $10
    ld bc, $179e
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    nop
    nop
    nop
    ld c, b
    rst $28
    ld l, l
    ld [hl], l
    ld a, a
    nop
    nop
    ld [hl+], a
    ld bc, $026c
    ei
    inc hl
    nop
    nop
    jr nz, jr_001_4485

    adc h

jr_001_4485:
    ld h, $f2
    ld d, a
    nop
    nop
    ld d, c
    ld bc, $1638
    sbc [hl]
    rla
    nop
    nop
    ld h, b
    dec l
    ld b, b
    ld e, [hl]
    or b
    ld a, a
    nop
    nop
    dec c
    inc [hl]
    dec d
    ld d, h
    ccf
    ld a, [hl]
    nop
    nop
    adc h
    ld b, h
    rla
    ld a, [hl]
    cp a
    ld a, a
    nop
    nop
    inc c
    nop
    rra
    nop
    ld e, a
    ld d, d
    nop
    nop
    inc c
    nop
    ld de, $1a00
    nop
    nop
    nop
    jr nz, @+$03

    jr nz, jr_001_44c0

    ld h, b
    inc bc

jr_001_44c0:
    nop
    nop
    ld l, $01
    sub $01
    rra
    inc bc
    nop
    nop
    rlca
    ld de, $1dcd
    or h
    ld l, $00
    nop
    jr nz, jr_001_4509

    ld h, $52
    nop
    ld [hl], e
    nop
    nop
    inc b
    add hl, de
    jr z, jr_001_4510

    ld c, l
    ld c, a
    nop
    nop
    adc d
    inc [hl]
    db $10
    ld e, c
    inc e
    ld a, [hl]
    nop
    nop
    nop
    inc [hl]
    nop
    ld d, b
    nop
    ld a, h
    nop
    jr jr_001_4508

    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop

jr_001_4508:
    dec d

jr_001_4509:
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop

jr_001_4510:
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop
    dec d
    nop

    db $00, $00, $47, $51, $2f, $7e, $99, $7f, $00, $00, $67, $38, $d3, $75, $ff, $7f
    db $00, $00, $00, $41, $6f, $6e, $f9, $7f, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $00, $00, $d1, $00, $1b, $02, $9e, $17, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b

    nop
    nop
    rrca
    ld d, h
    cp c
    ld [hl], c
    dec a
    ld [hl], a
    nop
    nop
    nop
    ld c, b
    rst $28
    ld l, l
    ld [hl], l
    ld a, a
    nop
    nop
    ld l, h
    jr @-$2c

    inc l
    ld e, [hl]
    ld a, $00
    nop
    call nz, Call_000_2c38
    ld h, $ff
    ld a, a
    nop
    nop
    xor l
    nop
    rst $10
    ld bc, $179e
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    rra
    ld a, h
    nop
    nop
    nop
    ld c, b
    rst $28
    ld l, l
    ld [hl], l
    ld a, a
    nop
    nop
    ld [hl+], a
    ld bc, $026c
    ei
    inc hl
    nop
    nop
    jr nz, jr_001_4605

    adc h

jr_001_4605:
    ld h, $f2
    ld d, a
    nop
    nop
    ld d, c
    ld bc, $1638
    sbc [hl]
    rla
    nop
    nop
    ld h, b
    dec l
    ld b, b
    ld e, [hl]
    or b
    ld a, a
    nop
    nop
    dec c
    inc [hl]
    dec d
    ld d, h
    ccf
    ld a, [hl]
    nop
    nop
    adc h
    ld b, h
    rla
    ld a, [hl]
    cp a
    ld a, a
    nop
    nop
    inc c
    nop
    rra
    nop
    ld e, a
    ld d, d

    db $00, $00, $4a, $00, $19, $02, $9e, $17, $00, $00, $00, $00, $f1, $49, $ff, $7f
    db $00, $00, $00, $00, $d2, $2c, $5e, $3e, $00, $00, $c4, $38, $2c, $26, $ff, $7f
    db $00, $00, $17, $00, $19, $02, $9e, $03, $00, $00, $00, $00, $84, $7c, $60, $7e
    db $00, $00, $00, $00, $17, $00, $ff, $7f, $00, $00, $c0, $00, $80, $02, $f3, $4f
    db $00, $00, $0e, $00, $15, $01, $7f, $02, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $00, $00, $06, $00, $8b, $00, $13, $01, $00, $00, $c0, $00, $a6, $0d, $33, $43
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $15, $54, $bf, $7d, $1f, $7f
    db $00, $00, $00, $60, $ef, $7d, $f5, $7f, $00, $00, $17, $00, $1b, $21, $7f, $4e
    db $80, $01, $00, $00, $ff, $7f, $f4, $03, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $f4, $03, $f4, $03, $f4, $03, $f4, $03, $00, $00, $c0, $00, $a6, $0d, $33, $43
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $17, $00, $fa, $1c, $7f, $4e
    db $00, $00, $65, $49, $8e, $62, $50, $7b, $00, $00, $87, $00, $ed, $00, $72, $01
    db $a0, $01, $60, $14, $ff, $7f, $f4, $03, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $f4, $03, $f4, $03, $f4, $03, $f4, $03, $00, $00, $c0, $00, $a6, $0d, $33, $43
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $00, $3c, $22, $41, $26, $46
    db $00, $00, $00, $60, $ef, $7d, $f5, $7f, $00, $00, $46, $00, $ad, $00, $94, $01
    db $a0, $01, $60, $14, $ff, $7f, $f4, $03, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $f4, $03, $f4, $03, $f4, $03, $f4, $03, $00, $00, $17, $00, $fa, $1c, $7f, $4e
    db $00, $00, $45, $01, $4e, $02, $d3, $3f, $00, $00, $a8, $21, $92, $4b, $97, $5f
    db $00, $00, $46, $11, $8d, $26, $f4, $3f, $00, $00, $ac, $25, $2e, $32, $d2, $3e
    db $a0, $01, $60, $14, $ff, $7f, $f4, $03, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $f4, $03, $f4, $03, $f4, $03, $f4, $03, $00, $00, $57, $61, $be, $7e, $bf, $73
    db $00, $00, $e0, $3c, $c1, $69, $a5, $7e, $00, $00, $80, $18, $40, $35, $e0, $55
    db $00, $00, $00, $60, $ef, $7d, $f5, $7f, $00, $00, $17, $00, $1b, $21, $7f, $4e
    db $80, $01, $00, $00, $ff, $7f, $f4, $03, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $f4, $03, $f4, $03, $f4, $03, $f4, $03, $00, $00, $cf, $00, $bf, $09, $bf, $3a
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $15, $54, $9d, $79, $1f, $7f
    db $00, $00, $00, $60, $ef, $7d, $f5, $7f, $00, $00, $17, $00, $1b, $21, $7f, $4e
    db $a0, $01, $60, $14, $ff, $7f, $f4, $03, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $f4, $03, $f4, $03, $f4, $03, $f4, $03, $00, $00, $e0, $3c, $c1, $69, $a5, $7e
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $80, $18, $40, $35, $e0, $55
    db $00, $00, $00, $60, $ef, $7d, $f5, $7f, $00, $00, $17, $00, $1b, $21, $7f, $4e

    nop
    nop
    rst $28
    db $10
    ld e, d
    ld a, $5d
    ld h, a
    nop
    nop
    call z, $d50c
    ld sp, $4a75

    db $00, $00, $13, $00, $38, $01, $1f, $03, $00, $00, $0d, $00, $f1, $00, $57, $02
    db $00, $00, $c0, $01, $11, $03, $ff, $03, $00, $00, $e0, $00, $e8, $01, $f3, $02
    db $00, $00, $0e, $38, $78, $61, $df, $7e, $00, $00, $0a, $28, $0f, $3d, $f7, $5d

    nop
    nop
    ld c, e
    dec h
    ld [hl], $3a
    sbc a
    ld h, a
    nop
    nop
    ret z

    jr @+$50

    dec h
    ld [hl], a
    ld c, d

    db $00, $00, $4b, $01, $36, $02, $9f, $03, $00, $00, $c8, $00, $4e, $01, $77, $02
    db $00, $00, $40, $25, $20, $3a, $80, $67, $00, $00, $c0, $18, $40, $25, $60, $4a
    db $00, $00, $00, $58, $20, $61, $a0, $7e, $00, $00, $00, $34, $e0, $44, $c0, $5d
    db $00, $00, $8b, $08, $75, $19, $df, $3a, $00, $00, $28, $00, $d0, $0c, $b5, $15
    db $00, $00, $04, $10, $0a, $28, $0f, $3c, $00, $00, $02, $08, $05, $14, $07, $1c

    db $00, $00, $00, $10, $00, $28, $00, $3c, $00, $00, $00, $08, $00, $14, $00, $1c

    nop
    nop
    nop
    inc c
    nop
    jr jr_001_48e7

jr_001_48e7:
    inc l
    nop
    nop
    nop
    inc b
    nop
    stop
    inc e
    nop
    nop
    add h
    db $10
    ld c, d
    add hl, hl
    rst $28
    dec a
    nop
    nop
    ld b, d
    ld [$14a5], sp
    rst $20
    inc e
    nop
    nop
    nop
    inc c
    nop
    jr jr_001_4907

jr_001_4907:
    inc l
    nop
    nop
    nop
    inc b
    nop
    stop
    inc e
    nop
    nop
    rlca
    nop
    dec c
    nop
    ld [de], a
    nop
    nop
    nop
    dec b
    nop
    ld [$0b00], sp
    nop
    nop
    nop
    inc bc
    dec c
    ld b, $1a
    ld a, [hl+]
    dec hl
    nop
    nop
    ld h, c
    inc b
    ld [c], a
    ld [$1164], sp
    nop
    nop
    ld a, [bc]
    ld bc, $0214
    ccf
    inc bc
    nop
    nop
    ld h, h
    nop
    ld a, [bc]
    ld bc, $018f
    nop
    nop
    ldh [rP1], a
    dec c
    ld bc, $01d2
    nop
    nop
    add b
    nop
    xor b
    nop
    dec hl
    ld bc, $0000
    ret nz

    inc e
    dec b
    dec [hl]
    xor b
    ld c, c
    nop
    nop
    ld h, b
    db $10
    and d
    inc h
    dec h
    dec [hl]
    nop
    nop
    ret nz

    inc c
    dec b
    ld de, $21ac
    nop
    nop
    ld h, b
    ld [$08a2], sp
    ld h, $19
    nop
    nop
    dec bc
    dec d
    ld l, e
    add hl, hl
    ld [hl], h
    ld b, [hl]
    nop
    nop
    ld h, [hl]
    ld [$14e7], sp
    rst $08
    ld sp, $0000
    xor e
    inc d
    ld c, [hl]
    nop
    inc [hl]
    dec d
    nop
    nop
    ld b, $00
    jr z, jr_001_498e

jr_001_498e:
    xor l
    inc b
    nop
    nop
    ld c, b
    jr nz, jr_001_4a01

    inc h
    ld sp, $0039
    nop
    ld b, l
    inc d
    rlca
    inc d
    sra b
    nop
    nop
    ret


    nop
    ld a, [bc]
    ld bc, $2256
    nop
    nop
    ld h, a
    nop
    and a
    nop
    ld c, l
    ld de, $0000
    ld b, b
    ld bc, $0160
    ld b, $01
    nop
    nop
    add b
    nop
    and b
    nop
    add e
    nop
    cp $fe
    ld b, $0a
    ld b, $06
    ld b, $0a
    ld bc, $0000
    add hl, sp
    dec bc
    cp $fe
    ld b, $0a
    ld b, $06
    ld b, $0a
    inc bc
    rst $38
    rst $38
    ld [hl], $0b
    rst $38
    rlca
    scf
    dec bc
    rlca
    rst $38
    jr c, jr_001_49ed

    cp $fe
    ld b, $0a
    ld b, $06
    ld b, $0a
    inc b
    db $fc
    db $fc

jr_001_49ed:
    ld [hl-], a
    dec bc
    db $fc
    inc b
    inc sp
    dec bc
    inc b
    db $fc
    inc [hl]
    dec bc
    inc b
    inc b
    dec [hl]
    dec bc
    cp $fe
    ld b, $0a
    ld b, $06

jr_001_4a01:
    ld b, $0a
    inc b
    db $fc
    db $fc
    ld l, $0b
    db $fc
    inc b
    cpl
    dec bc
    inc b
    db $fc
    jr nc, @+$0d

    inc b
    inc b
    ld sp, $fe0b
    cp $06
    ld a, [bc]
    ld b, $06
    ld b, $0a
    ld bc, $0000
    ld b, c
    rrca
    cp $fe
    ld b, $0a
    ld b, $06
    ld b, $0a
    inc bc
    rst $38
    rst $38
    ld a, $0f
    rst $38
    rlca
    ccf
    rrca
    rlca
    rst $38
    ld b, b
    rrca
    cp $fe
    ld b, $0a
    ld b, $06
    ld b, $0a
    inc b
    db $fc
    db $fc
    ld a, [hl-]
    rrca
    db $fc
    inc b
    dec sp
    rrca
    inc b
    db $fc
    inc a
    rrca
    inc b
    inc b
    dec a
    rrca
    cp $fe
    ld b, $0a
    ld b, $06
    ld b, $0a
    inc b
    db $fc
    db $fc
    ld e, c
    rrca
    db $fc
    inc b
    ld e, d
    rrca
    inc b
    db $fc
    ld e, e
    rrca
    inc b
    inc b
    ld e, h
    rrca
    ld bc, $0000
    ld b, d
    inc c
    inc b
    db $fc
    db $fc
    ld c, h
    inc c
    db $fc
    inc b
    ld c, l
    inc c
    inc b
    db $fc
    ld d, d
    inc c
    inc b
    inc b
    ld d, e
    inc c
    inc b
    db $fc
    db $fc
    ld c, [hl]
    inc c
    db $fc
    inc b
    ld c, a
    inc c
    inc b
    db $fc
    ld d, h
    inc c
    inc b
    inc b
    ld d, l
    inc c
    inc b
    db $fc
    db $fc
    ld d, b
    inc c
    db $fc
    inc b
    ld d, c
    inc c
    inc b
    db $fc
    ld d, [hl]
    inc c
    inc b
    inc b
    ld d, a
    inc c
    inc b
    ld sp, hl
    ld sp, hl
    ld b, e
    inc c
    ld sp, hl
    inc b
    ld b, h
    inc c
    inc b
    ld sp, hl
    ld b, l
    inc c
    inc b
    inc b
    ld b, [hl]
    inc c
    inc b
    ld sp, hl
    ld sp, hl
    ld b, h
    inc c
    ld sp, hl
    inc b
    ld b, l
    inc c
    inc b
    ld sp, hl
    ld b, [hl]
    inc c
    inc b
    inc b
    ld b, a
    inc c
    inc b
    ld sp, hl
    ld sp, hl
    ld b, l
    inc c
    ld sp, hl
    inc b
    ld b, [hl]
    inc c
    inc b
    ld sp, hl
    ld b, a
    inc c
    inc b
    inc b
    ld c, b
    inc c
    inc b
    ld sp, hl
    ld sp, hl
    ld b, [hl]
    inc c
    ld sp, hl
    inc b
    ld b, a
    inc c
    inc b
    ld sp, hl
    ld c, b
    inc c
    inc b
    inc b
    ld c, c
    inc c
    inc b
    ld sp, hl
    ld sp, hl
    ld b, a
    inc c
    ld sp, hl
    inc b
    ld c, b
    inc c
    inc b
    ld sp, hl
    ld c, c
    inc c
    inc b
    inc b
    ld c, d
    inc c
    inc b
    ld sp, hl
    ld sp, hl
    ld c, b
    inc c
    ld sp, hl
    inc b
    ld c, c
    inc c
    inc b
    ld sp, hl
    ld c, d
    inc c
    inc b
    inc b
    ld c, e
    inc c
    inc bc
    ld sp, hl
    ld sp, hl
    ld c, c
    inc c
    ld sp, hl
    inc b
    ld c, d
    inc c
    inc b
    ld sp, hl
    ld c, e
    inc c
    ld [bc], a
    ld sp, hl
    ld sp, hl
    ld c, d
    inc c
    ld sp, hl
    inc b
    ld c, e
    inc c
    ld bc, $f9f9
    ld c, e
    inc c
    or h

    db $b4, $b4, $b4, $ab, $ab, $ab, $ab, $9e, $9e, $9e, $9e, $8d, $8d, $8d, $8d, $7c
    db $7c, $7c, $7c, $6b, $6b, $6b, $6b, $5a, $5a, $5a, $5a, $49, $49, $49, $49, $38
    db $38, $38, $38, $27, $27, $27, $27, $16, $16, $16, $16, $05, $05, $05, $05, $00
    db $00, $00, $00

    nop

    db $00, $00, $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d
    db $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22
    db $22, $22, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22, $22, $22, $22
    db $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d
    db $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $00, $00, $00, $00, $00, $00

    nop
    nop
    nop
    nop
    nop
    nop
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    nop
    nop
    nop
    nop
    nop
    nop
    nop

    db $00, $00, $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d
    db $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22
    db $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d
    db $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $00, $00, $00, $00, $00, $00

    nop

    db $00, $00, $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d
    db $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22, $22, $22, $22, $22, $22, $22, $22, $22
    db $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d
    db $0d, $00, $00, $00, $00, $00, $00

    nop
    nop
    nop
    nop
    nop
    nop
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    nop
    nop
    nop
    nop
    nop
    nop
    nop

    db $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22
    db $22, $22, $22, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $22, $22, $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d
    db $0d, $0d, $0d, $00, $00, $00, $00

    nop

    db $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22
    db $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d, $0d, $00, $00, $00

    nop

    db $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22, $22, $22, $22, $22, $22, $22, $0d, $0d
    db $0d, $0d, $0d, $0d, $00, $00, $00

    nop
    nop
    nop
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    dec sp
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    nop
    nop
    nop
    nop

    db $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22, $22, $22, $22, $22, $22, $22, $0d, $0d
    db $0d, $0d, $0d, $0d, $00, $00, $00

    nop
    nop
    nop
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec sp
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    nop
    nop
    nop
    nop

    db $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $3b
    db $3b, $3b, $3b, $22, $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d, $0d
    db $00, $00, $00

    nop
    nop
    nop
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    nop
    nop
    nop
    nop
    nop
    nop
    dec c
    dec c
    dec c
    dec c
    dec c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec c
    dec c
    dec c
    dec c
    dec c
    nop
    nop
    nop
    nop
    nop
    nop
    dec c
    dec c
    dec c
    dec c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec c
    dec c
    dec c
    dec c
    nop
    nop
    nop
    nop
    nop
    dec c
    dec c
    dec c
    dec c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec c
    dec c
    dec c
    dec c
    nop
    nop
    nop
    nop
    dec c
    dec c
    dec c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec c
    dec c
    dec c
    nop
    nop
    nop
    dec c
    dec c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec c
    dec c
    nop
    nop
    dec c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec c
    nop

    db $04

    inc e

    db $01, $1f, $02

    db $1d

    inc bc
    db $1e

    db $14

    db $14

    db $15, $15, $0c

    db $0c, $0b

    dec bc

    db $78, $08, $00, $8c, $08, $46, $0d, $46, $13, $8c, $18, $46, $1d, $46, $03, $00
    db $8c, $08, $46, $13, $46, $0d, $8c, $18, $46, $03, $46, $1d, $00

    db $01, $01, $2e, $4f, $02, $02, $31, $4f

    ld bc, $3e01
    ld c, a

    db $00, $00, $5f, $00, $00, $08, $60, $00, $08, $00, $67, $00, $08, $08, $68, $00
    db $00, $00, $61, $00, $00, $08, $62, $00, $08, $00, $69, $00, $08, $08, $6a, $00

    nop
    nop
    ld h, e
    nop
    nop
    ld [$0064], sp
    ld [$6b00], sp
    nop
    ld [$6c08], sp
    nop
    nop
    nop
    ld h, l
    nop
    nop
    ld [$0066], sp
    ld [$6d00], sp
    nop
    ld [$6e08], sp
    nop
    nop
    nop
    ld d, $08
    nop
    ld [$0817], sp
    ld [$1e00], sp
    ld [$0808], sp
    rra
    ld [$0000], sp
    jr @+$0a

    nop
    ld [$0819], sp
    ld [$2000], sp
    ld [$0808], sp
    ld hl, $0008
    nop
    ld a, [de]
    ld [$0800], sp
    dec de
    ld [$0008], sp
    ld [hl+], a
    ld [$0808], sp
    inc hl
    ld [$0000], sp
    inc e
    ld [$0800], sp
    dec e
    ld [$0008], sp
    inc h
    ld [$0808], sp
    dec h
    ld [$0000], sp
    ld h, $08
    nop
    ld [$0827], sp
    ld [$2800], sp
    ld [$0808], sp
    add hl, hl
    ld [$0000], sp
    ld a, [hl+]
    ld [$0800], sp
    dec hl
    ld [$0008], sp
    inc l
    ld [$0808], sp
    dec l
    ld [$0000], sp
    ld c, [hl]
    ld [bc], a
    nop
    ld [$014f], sp
    nop
    db $10
    ld d, b
    dec b
    ld hl, sp+$04
    ld d, d
    ld [bc], a
    ld hl, sp+$0c
    ld d, e
    dec b
    ld bc, $020a
    rrca
    inc bc
    inc d
    inc b
    add hl, de
    dec b
    ld [hl-], a
    push af
    nop

    db $80, $00

    ret z

    ld bc, $0032
    and $01
    ld a, [bc]
    nop
    cp [hl]
    ld bc, $0164

    ld hl, $db71
    ld c, $08
    xor a

jr_001_502b:
    ld [hl], a
    ld de, $000c
    add hl, de
    dec c
    jr nz, jr_001_502b

    ret


    ld a, [$db6e]
    or a
    ret z

    ld a, [$db6f]
    dec a
    ret nz

    push hl
    push de
    ld hl, $db71
    ld de, $000c

jr_001_5046:
    ld a, [hl]
    or a
    jr z, jr_001_504d

    add hl, de
    jr jr_001_5046

jr_001_504d:
    inc a
    ld [hl+], a
    dec c
    ld e, c
    ld a, b
    sla c
    rla
    sla c
    rla
    sla c
    rla
    and $1f
    sla a
    sla a
    sla a
    add $10
    ld [hl+], a
    ld a, e
    and $1f
    sla a
    sla a
    sla a
    add $08
    ld [hl+], a
    ld a, [$db6e]
    dec a
    cp $10
    jr nz, jr_001_508d

    ld a, [$ff8c]
    and $0f
    push af
    ld a, [$dc35]
    bit 1, a
    jr z, jr_001_5089

    ld d, $03

jr_001_5089:
    pop af
    sub d
    and $0f

jr_001_508d:
    cp $09
    jr nz, jr_001_509e

    ld d, a
    ld a, [$d77c]
    or a
    jr z, jr_001_509d

    dec a
    jr z, jr_001_509d

    ld d, $00

jr_001_509d:
    ld a, d

jr_001_509e:
    cp $06
    jr nz, jr_001_50ab

    ld d, a
    ld a, [$dc3d]
    or a
    jr nz, jr_001_50aa

    ld d, a

jr_001_50aa:
    ld a, d

jr_001_50ab:
    cp $11
    jr nz, jr_001_50b1

    ld a, $06

jr_001_50b1:
    ld [hl+], a
    ld de, $7726
    add a
    add e
    ld e, a
    jr nc, jr_001_50bb

    inc d

jr_001_50bb:
    ld a, [de]
    inc de
    ld c, a
    ld a, [de]
    ld b, a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    ld a, $05
    call Call_000_3e64
    pop de
    pop hl
    ret


    ld hl, $db71
    ld c, $08

jr_001_50e4:
    ld a, [hl]
    or a
    jr z, jr_001_5118

    push hl
    ld e, a
    inc hl
    ld a, [hl+]
    cp $a0
    jr c, jr_001_50f5

jr_001_50f0:
    xor a
    pop hl
    ld [hl], a
    jr jr_001_5118

jr_001_50f5:
    ld d, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    add a
    call Call_001_5179
    jr nz, jr_001_50f0

    ld a, h
    ld hl, $7706
    add l
    ld l, a
    jr nc, jr_001_5108

    inc h

jr_001_5108:
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld de, $000b
    add hl, de
    jr jr_001_511c

jr_001_5118:
    ld de, $000c
    add hl, de

jr_001_511c:
    dec c
    jr nz, jr_001_50e4

    ld a, [$d8a5]
    or a
    jr z, jr_001_513c

    ld a, [$d8a7]
    inc a
    ld [$d8a7], a
    and $01
    jr nz, jr_001_513c

    ld a, [$d8a6]
    dec a
    ld [$d8a6], a
    jr nz, jr_001_513c

    ld [$d8a5], a

jr_001_513c:
    ld a, [$d76e]
    or a
    jr z, jr_001_5159

    ld a, [$d8a7]
    inc a
    ld [$d8a7], a
    and $01
    jr nz, jr_001_5159

    ld a, [$d8a6]
    dec a
    ld [$d8a6], a
    jr nz, jr_001_5159

    ld [$d76e], a

jr_001_5159:
    ld a, [$dc20]
    or a
    ret z

    ld a, [$dc22]
    inc a
    ld [$dc22], a
    and $07
    ret nz

    ld a, [$dc21]
    dec a
    ld [$dc21], a
    ret nz

    ld [$dc20], a
    ld a, $18
    call Call_000_3e64
    ret


Call_001_5179:
    push af
    push bc
    push de
    ld l, a
    ld a, d
    add $0c
    ld d, a
    ld a, [$c200]
    sub $08
    cp d
    jr nc, jr_001_51ae

    add $07
    cp d
    jr c, jr_001_51ae

    ld a, [$c201]
    sub $08
    cp b
    jr nc, jr_001_51ae

    ld h, a
    ld a, [$d764]
    add h
    cp b
    jr c, jr_001_51ae

jr_001_519e:
    ld a, [$d76b]
    or a
    jr nz, jr_001_51cf

    ld h, $00
    ld de, $76e6
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


jr_001_51ae:
    ld a, b
    add $0f
    ld b, a
    ld a, [$c200]
    sub $08
    cp d
    jr nc, jr_001_51cf

    add $07
    cp d
    jr c, jr_001_51cf

    ld a, [$c201]
    sub $08
    cp b
    jr nc, jr_001_51cf

    ld h, a
    ld a, [$d764]
    add h
    cp b
    jr nc, jr_001_519e

jr_001_51cf:
    xor a
    pop de
    pop bc
    pop hl
    ret


    ld a, [$d77c]
    or a
    jr z, jr_001_51e9

    ld hl, $d782
    ld de, $0007
    ld b, a

jr_001_51e1:
    ld a, [hl]
    and $f0
    ld [hl], a
    add hl, de
    dec b
    jr nz, jr_001_51e1

jr_001_51e9:
    ld a, [$d8a2]
    or a
    jr z, jr_001_51f2

    ld [$d8a9], a

jr_001_51f2:
    ld a, $01
    ld [$d8a3], a
    xor a
    ld [$d8a5], a
    ld [$d8a2], a
    ld [$d76e], a
    ld hl, $df11
    call Call_000_0001
    jp Jump_001_544e


    ld a, $1e
    ld [$dc45], a
    xor a
    ld [$dc4c], a
    ld hl, $df17
    call Call_000_0001

Jump_001_5219:
    ld a, $01
    ld [$dc46], a
    xor a
    ld [$dc48], a

Jump_001_5222:
    ld a, [$dc47]
    cp $01
    jr nz, jr_001_522d

    xor a
    ld [$dc47], a

jr_001_522d:
    xor a
    ld [$d763], a
    ld [$d765], a
    ld [$d766], a
    ld [$d76a], a
    inc a
    ld [$dc3d], a
    ld a, [$d764]
    cp $28
    jp nz, Jump_001_544e

    ld a, [$c201]
    add $04
    ld [$c201], a
    ld a, $20
    ld [$d764], a
    jp Jump_001_544e


    ld b, $02
    ld a, [$dcfe]
    cp $04
    jr nz, jr_001_526a

    call Call_000_3c34
    ld a, [$dcff]
    or a
    jr nz, jr_001_526a

    ld b, $09

jr_001_526a:
    ld a, b
    ld [$ff9f], a
    ld a, $0f
    ld [$ffa0], a
    ld a, [$cce8]
    inc a
    cp $a0
    jr nz, jr_001_5281

    ld a, $0d
    ld [$ff9f], a
    xor a

jr_001_5281:
    ld [$cce8], a
    ld b, $32
    jp Jump_001_5450


    xor a
    ld [$dc46], a
    ld [$dc4c], a
    ld [$dc48], a
    ld hl, $df19
    call Call_000_0001
    ld a, $01
    ld [$dc47], a
    jr jr_001_522d

    ld a, $50
    ld [$d768], a
    ld a, $03
    ld [$d765], a
    ld [$d766], a
    xor a
    ld [$d763], a
    ld [$dc3d], a
    ld [$d76a], a
    ld hl, $df1d
    call Call_000_0001
    ld a, [$d764]
    cp $28
    jp nz, Jump_001_544e

    ld a, [$c201]
    add $04
    ld [$c201], a
    ld a, $20
    ld [$d764], a
    jp Jump_001_544e


    ld a, [$c201]
    sub $04
    cp $81
    jr c, jr_001_52e2

    ld a, $81
    jr jr_001_52e8

jr_001_52e2:
    cp $17
    jr nc, jr_001_52e8

    ld a, $17

jr_001_52e8:
    ld [$c201], a
    ld a, $28
    ld [$d764], a
    xor a
    ld [$d763], a
    ld [$dc3d], a
    ld [$d765], a
    ld [$d766], a
    ld [$d76a], a
    ld hl, $df1b
    call Call_000_0001
    jp Jump_001_544e


    ld a, [$d8a2]
    or a
    jr z, jr_001_5312

    ld [$d8a9], a

jr_001_5312:
    ld a, $a0
    ld [$d8a6], a
    ld [$d8a5], a
    xor a
    ld [$d8a2], a
    ld [$d8a3], a
    ld [$d76e], a
    ld hl, $df15
    call Call_000_0001
    jp Jump_001_544e


    ld a, $a0
    ld [$d8a6], a
    ld [$d8a2], a
    xor a
    ld [$d8a5], a
    ld [$d8a3], a
    ld [$d76e], a
    ld hl, $df13
    call Call_000_0001
    jp Jump_001_544e


    ld a, $01
    ld [$d763], a
    xor a
    ld [$d765], a
    ld [$d766], a
    ld [$dc3d], a
    ld [$d76a], a
    ld hl, $df1f
    call Call_000_0001
    ld a, [$d764]
    cp $28
    jp nz, Jump_001_544e

    ld a, [$c201]
    add $04
    ld [$c201], a
    ld a, $20
    ld [$d764], a
    jp Jump_001_544e


    ld a, [$d8a2]
    or a
    jr z, jr_001_5381

    ld [$d8a9], a

jr_001_5381:
    ld a, $01
    ld [$d8a1], a
    xor a
    ld [$d8a5], a
    ld [$d8a2], a
    ld [$d8a3], a
    ld [$d76e], a
    ld hl, $df0f
    call Call_000_0001
    jp Jump_001_544e


    ld hl, $df21
    ld a, [$d8ac]
    inc a
    cp $0a
    jr nz, jr_001_53ac

    ld b, $32
    jp Jump_001_5450


jr_001_53ac:
    ld [$d8ac], a
    call Call_000_0001
    jp Jump_001_544e


    ld a, $08
    ld [$dc45], a
    ld a, $01
    ld [$dc4c], a
    ld hl, $df23
    call Call_000_0001
    jp Jump_001_5219


    ld a, $50
    ld [$d768], a
    ld [$d76a], a
    xor a
    ld [$d765], a
    ld [$d766], a
    ld [$dc3d], a
    ld [$d763], a
    ld hl, $df25
    call Call_000_0001
    ld a, [$d764]
    cp $28
    jr nz, jr_001_544e

    ld a, [$c201]
    add $04
    ld [$c201], a
    ld a, $20
    ld [$d764], a
    jr jr_001_544e

    ld a, [$d8a2]
    or a
    jr z, jr_001_5402

    ld [$d8a9], a

jr_001_5402:
    ld a, $c8
    ld [$d8a6], a
    ld a, $01
    ld [$d76e], a
    ld a, $04
    ld [$d8a0], a
    xor a
    ld [$d8a2], a
    ld [$d8a3], a
    ld [$d8a5], a
    ld hl, $df2b
    call Call_000_0001
    jr jr_001_544e

    ld a, $01
    ld [$dc20], a
    ld a, $ff
    ld [$dc21], a
    ld hl, $df27
    call Call_000_0001
    jr jr_001_544e

    xor a
    ld [$dc4c], a
    ld [$dc46], a
    ld hl, $df29
    call Call_000_0001
    ld b, $04
    ld a, [$dc48]
    add b
    ld [$dc48], a
    jp Jump_001_5222


Jump_001_544e:
jr_001_544e:
    ld b, $0a

Jump_001_5450:
    call Call_001_7c39
    pop de
    pop bc
    push de
    ld a, $01
    ld e, $00
    call Call_001_634d
    pop de
    ld a, $08
    call Call_000_3e64
    ld a, $01
    or a
    pop hl
    ret


    db $55, $04, $51, $41, $54, $44, $5e, $05, $5d, $05, $5c, $05, $12, $0c, $10, $0c
    db $11, $0c

    inc b
    jr nz, jr_001_549d

    jr nz, jr_001_549f

    jr nz, jr_001_54a1

    ld b, a
    ld d, d
    ld b, l
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l
    jr nz, jr_001_54ba

    jr nz, jr_001_54ac

    jr nz, jr_001_54ae

    jr nz, jr_001_5494

    jr nz, jr_001_54b2

    jr nz, jr_001_54b4

jr_001_5494:
    jr nz, jr_001_54b6

    ld b, a
    ld d, d
    ld b, l
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l

jr_001_549d:
    jr nz, jr_001_54cf

jr_001_549f:
    jr nz, jr_001_54c1

jr_001_54a1:
    jr nz, jr_001_54c3

    jr nz, jr_001_54a5

jr_001_54a5:
    jr nz, jr_001_54c7

    jr nz, jr_001_54c9

    jr nz, @+$49

    ld d, d

jr_001_54ac:
    ld b, c
    ld c, [hl]

jr_001_54ae:
    ld b, c
    ld d, h
    ld b, l
    ld c, [hl]

jr_001_54b2:
    jr nz, @+$32

jr_001_54b4:
    jr nz, jr_001_54d6

jr_001_54b6:
    jr nz, jr_001_54d8

    jr nz, jr_001_54be

jr_001_54ba:
    jr nz, jr_001_54dc

    jr nz, jr_001_54de

jr_001_54be:
    jr nz, jr_001_54e0

    ld b, a

jr_001_54c1:
    ld d, d
    ld b, c

jr_001_54c3:
    ld c, [hl]
    ld b, c
    ld d, h
    ld b, l

jr_001_54c7:
    jr nz, jr_001_54f9

jr_001_54c9:
    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_001_54d3

jr_001_54cf:
    jr nz, @+$22

    jr nz, @+$22

jr_001_54d3:
    jr nz, @+$22

    ld b, a

jr_001_54d6:
    ld d, d
    ld b, c

jr_001_54d8:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, c

jr_001_54dc:
    jr nz, jr_001_550e

jr_001_54de:
    jr nz, jr_001_5500

jr_001_54e0:
    jr nz, jr_001_5502

    db $20

    db $04, $20, $20, $20, $20, $20, $20, $47, $52, $45, $4e, $41, $44, $45, $20, $31
    db $20, $20, $20, $20, $20

    inc b

jr_001_54f9:
    jr nz, jr_001_551b

    jr nz, jr_001_551d

    jr nz, jr_001_551f

    ld b, a

jr_001_5500:
    ld d, d
    ld b, l

jr_001_5502:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l
    jr nz, @+$33

    jr nz, jr_001_552a

    jr nz, jr_001_552c

    jr nz, jr_001_550e

jr_001_550e:
    jr nz, jr_001_5530

    jr nz, jr_001_5532

    jr nz, @+$49

    ld d, d
    ld b, c
    ld c, [hl]
    ld b, c
    ld d, h
    ld b, l
    ld c, [hl]

jr_001_551b:
    jr nz, @+$33

jr_001_551d:
    jr nz, jr_001_553f

jr_001_551f:
    jr nz, jr_001_5541

    jr nz, jr_001_5527

    jr nz, jr_001_5545

    jr nz, jr_001_5547

jr_001_5527:
    jr nz, jr_001_5549

    ld b, a

jr_001_552a:
    ld d, d
    ld b, c

jr_001_552c:
    ld c, [hl]
    ld b, c
    ld d, h
    ld b, l

jr_001_5530:
    jr nz, @+$33

jr_001_5532:
    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_001_553c

    jr nz, @+$22

    jr nz, @+$22

jr_001_553c:
    jr nz, @+$22

    ld b, a

jr_001_553f:
    ld d, d
    ld b, c

jr_001_5541:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, c

jr_001_5545:
    jr nz, @+$33

jr_001_5547:
    jr nz, jr_001_5569

jr_001_5549:
    jr nz, jr_001_556b

    db $20

    db $04, $20, $20, $20, $20, $20, $20, $47, $52, $45, $4e, $41, $44, $45, $20, $32
    db $20, $20, $20, $20, $20

    inc b
    jr nz, jr_001_5584

    jr nz, jr_001_5586

    jr nz, jr_001_5588

    ld b, a

jr_001_5569:
    ld d, d
    ld b, l

jr_001_556b:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l
    jr nz, jr_001_55a3

    jr nz, jr_001_5593

    jr nz, jr_001_5595

    jr nz, jr_001_5577

jr_001_5577:
    jr nz, jr_001_5599

    jr nz, jr_001_559b

    jr nz, @+$49

    ld d, d
    ld b, c
    ld c, [hl]
    ld b, c
    ld d, h
    ld b, l
    ld c, [hl]

jr_001_5584:
    jr nz, @+$34

jr_001_5586:
    jr nz, jr_001_55a8

jr_001_5588:
    jr nz, jr_001_55aa

    jr nz, jr_001_5590

    jr nz, jr_001_55ae

    jr nz, jr_001_55b0

jr_001_5590:
    jr nz, jr_001_55b2

    ld b, a

jr_001_5593:
    ld d, d
    ld b, c

jr_001_5595:
    ld c, [hl]
    ld b, c
    ld d, h
    ld b, l

jr_001_5599:
    jr nz, jr_001_55cd

jr_001_559b:
    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_001_55a5

    jr nz, @+$22

jr_001_55a3:
    jr nz, @+$22

jr_001_55a5:
    jr nz, @+$22

    ld b, a

jr_001_55a8:
    ld d, d
    ld b, c

jr_001_55aa:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, c

jr_001_55ae:
    jr nz, jr_001_55e2

jr_001_55b0:
    jr nz, jr_001_55d2

jr_001_55b2:
    jr nz, jr_001_55d4

    db $20

    db $04, $20, $20, $20, $20, $20, $20, $47, $52, $45, $4e, $41, $44, $45, $20, $33
    db $20, $20, $20, $20, $20

    inc b
    jr nz, jr_001_55ed

jr_001_55cd:
    jr nz, jr_001_55ef

    jr nz, jr_001_55f1

    ld b, a

jr_001_55d2:
    ld d, d
    ld b, l

jr_001_55d4:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l
    jr nz, @+$35

    jr nz, jr_001_55fc

    jr nz, jr_001_55fe

    jr nz, jr_001_55e0

jr_001_55e0:
    jr nz, jr_001_5602

jr_001_55e2:
    jr nz, jr_001_5604

    jr nz, @+$49

    ld d, d
    ld b, c
    ld c, [hl]
    ld b, c
    ld d, h
    ld b, l
    ld c, [hl]

jr_001_55ed:
    jr nz, @+$35

jr_001_55ef:
    jr nz, jr_001_5611

jr_001_55f1:
    jr nz, jr_001_5613

    jr nz, jr_001_55f9

    jr nz, jr_001_5617

    jr nz, jr_001_5619

jr_001_55f9:
    jr nz, jr_001_561b

    ld b, a

jr_001_55fc:
    ld d, d
    ld b, c

jr_001_55fe:
    ld c, [hl]
    ld b, c
    ld d, h
    ld b, l

jr_001_5602:
    jr nz, @+$35

jr_001_5604:
    jr nz, jr_001_5626

    jr nz, jr_001_5628

    jr nz, jr_001_560e

    jr nz, jr_001_562c

    jr nz, jr_001_562e

jr_001_560e:
    jr nz, jr_001_5630

    ld b, a

jr_001_5611:
    ld d, d
    ld b, c

jr_001_5613:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, c

jr_001_5617:
    jr nz, @+$35

jr_001_5619:
    jr nz, jr_001_563b

jr_001_561b:
    jr nz, jr_001_563d

    jr nz, jr_001_5623

    jr nz, jr_001_5641

    jr nz, jr_001_5643

jr_001_5623:
    jr nz, jr_001_5645

    ld b, a

jr_001_5626:
    ld d, d
    ld b, l

jr_001_5628:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l

jr_001_562c:
    jr nz, jr_001_5662

jr_001_562e:
    jr nz, jr_001_5650

jr_001_5630:
    jr nz, jr_001_5652

    jr nz, jr_001_5638

    jr nz, jr_001_5656

    jr nz, jr_001_5658

jr_001_5638:
    jr nz, jr_001_565a

    ld b, a

jr_001_563b:
    ld d, d
    ld b, l

jr_001_563d:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l

jr_001_5641:
    jr nz, jr_001_5677

jr_001_5643:
    jr nz, jr_001_5665

jr_001_5645:
    jr nz, jr_001_5667

    jr nz, jr_001_5649

jr_001_5649:
    jr nz, jr_001_566b

    jr nz, jr_001_566d

    jr nz, @+$49

    ld d, d

jr_001_5650:
    ld b, c
    ld c, [hl]

jr_001_5652:
    ld b, c
    ld d, h
    ld b, l
    ld c, [hl]

jr_001_5656:
    jr nz, jr_001_568c

jr_001_5658:
    jr nz, jr_001_567a

jr_001_565a:
    jr nz, jr_001_567c

    jr nz, jr_001_5662

    jr nz, jr_001_5680

    jr nz, jr_001_5682

jr_001_5662:
    jr nz, jr_001_5684

    ld b, a

jr_001_5665:
    ld d, d
    ld b, c

jr_001_5667:
    ld c, [hl]
    ld b, c
    ld d, h
    ld b, l

jr_001_566b:
    jr nz, jr_001_56a1

jr_001_566d:
    jr nz, jr_001_568f

    jr nz, jr_001_5691

    jr nz, jr_001_5677

    jr nz, jr_001_5695

    jr nz, jr_001_5697

jr_001_5677:
    jr nz, jr_001_5699

    ld b, a

jr_001_567a:
    ld d, d
    ld b, c

jr_001_567c:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, c

jr_001_5680:
    jr nz, jr_001_56b6

jr_001_5682:
    jr nz, jr_001_56a4

jr_001_5684:
    jr nz, jr_001_56a6

    jr nz, jr_001_568c

    jr nz, jr_001_56aa

    jr nz, jr_001_56ac

jr_001_568c:
    jr nz, jr_001_56ae

    ld b, a

jr_001_568f:
    ld d, d
    ld b, l

jr_001_5691:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l

jr_001_5695:
    jr nz, @+$37

jr_001_5697:
    jr nz, jr_001_56b9

jr_001_5699:
    jr nz, jr_001_56bb

    jr nz, jr_001_56a1

    jr nz, jr_001_56bf

    jr nz, jr_001_56c1

jr_001_56a1:
    jr nz, jr_001_56c3

    ld b, a

jr_001_56a4:
    ld d, d
    ld b, l

jr_001_56a6:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l

jr_001_56aa:
    jr nz, @+$37

jr_001_56ac:
    jr nz, jr_001_56ce

jr_001_56ae:
    jr nz, jr_001_56d0

    jr nz, jr_001_56b2

jr_001_56b2:
    jr nz, jr_001_56d4

    jr nz, jr_001_56d6

jr_001_56b6:
    jr nz, @+$49

    ld d, d

jr_001_56b9:
    ld b, c
    ld c, [hl]

jr_001_56bb:
    ld b, c
    ld d, h
    ld b, l
    ld c, [hl]

jr_001_56bf:
    jr nz, @+$37

jr_001_56c1:
    jr nz, jr_001_56e3

jr_001_56c3:
    jr nz, jr_001_56e5

    jr nz, jr_001_56cb

    jr nz, jr_001_56e9

    jr nz, jr_001_56eb

jr_001_56cb:
    jr nz, jr_001_56ed

    ld b, a

jr_001_56ce:
    ld d, d
    ld b, c

jr_001_56d0:
    ld c, [hl]
    ld b, c
    ld d, h
    ld b, l

jr_001_56d4:
    jr nz, @+$37

jr_001_56d6:
    jr nz, jr_001_56f8

    jr nz, jr_001_56fa

    jr nz, jr_001_56e0

    jr nz, jr_001_56fe

    jr nz, jr_001_5700

jr_001_56e0:
    jr nz, jr_001_5702

    ld b, a

jr_001_56e3:
    ld d, d
    ld b, c

jr_001_56e5:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, c

jr_001_56e9:
    jr nz, @+$37

jr_001_56eb:
    jr nz, jr_001_570d

jr_001_56ed:
    jr nz, jr_001_570f

    jr nz, jr_001_56f5

    jr nz, jr_001_5713

    jr nz, jr_001_5715

jr_001_56f5:
    jr nz, jr_001_5717

    ld b, a

jr_001_56f8:
    ld d, d
    ld b, l

jr_001_56fa:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l

jr_001_56fe:
    jr nz, jr_001_5736

jr_001_5700:
    jr nz, jr_001_5722

jr_001_5702:
    jr nz, jr_001_5724

    jr nz, jr_001_570a

    jr nz, jr_001_5728

    jr nz, jr_001_572a

jr_001_570a:
    jr nz, jr_001_572c

    ld b, a

jr_001_570d:
    ld d, d
    ld b, l

jr_001_570f:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l

jr_001_5713:
    jr nz, jr_001_574b

jr_001_5715:
    jr nz, jr_001_5737

jr_001_5717:
    jr nz, jr_001_5739

    jr nz, jr_001_571b

jr_001_571b:
    jr nz, jr_001_573d

    jr nz, jr_001_573f

    jr nz, @+$49

    ld d, d

jr_001_5722:
    ld b, c
    ld c, [hl]

jr_001_5724:
    ld b, c
    ld d, h
    ld b, l
    ld c, [hl]

jr_001_5728:
    jr nz, jr_001_5760

jr_001_572a:
    jr nz, jr_001_574c

jr_001_572c:
    jr nz, jr_001_574e

    jr nz, jr_001_5734

    jr nz, jr_001_5752

    jr nz, jr_001_5754

jr_001_5734:
    jr nz, jr_001_5756

jr_001_5736:
    ld b, a

jr_001_5737:
    ld d, d
    ld b, c

jr_001_5739:
    ld c, [hl]
    ld b, c
    ld d, h
    ld b, l

jr_001_573d:
    jr nz, jr_001_5775

jr_001_573f:
    jr nz, jr_001_5761

    jr nz, jr_001_5763

    jr nz, jr_001_5749

    jr nz, jr_001_5767

    jr nz, jr_001_5769

jr_001_5749:
    jr nz, jr_001_576b

jr_001_574b:
    ld b, a

jr_001_574c:
    ld d, d
    ld b, c

jr_001_574e:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, c

jr_001_5752:
    jr nz, jr_001_578a

jr_001_5754:
    jr nz, jr_001_5776

jr_001_5756:
    jr nz, jr_001_5778

    jr nz, jr_001_575e

    jr nz, jr_001_577c

    jr nz, jr_001_577e

jr_001_575e:
    jr nz, jr_001_5780

jr_001_5760:
    ld b, a

jr_001_5761:
    ld d, d
    ld b, l

jr_001_5763:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l

jr_001_5767:
    jr nz, jr_001_57a0

jr_001_5769:
    jr nz, jr_001_578b

jr_001_576b:
    jr nz, jr_001_578d

    jr nz, jr_001_5773

    jr nz, jr_001_5791

    jr nz, jr_001_5793

jr_001_5773:
    jr nz, jr_001_5795

jr_001_5775:
    ld b, a

jr_001_5776:
    ld d, d
    ld b, l

jr_001_5778:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, l

jr_001_577c:
    jr nz, jr_001_57b5

jr_001_577e:
    jr nz, jr_001_57a0

jr_001_5780:
    jr nz, jr_001_57a2

    jr nz, jr_001_5784

jr_001_5784:
    jr nz, jr_001_57a6

    jr nz, jr_001_57a8

    jr nz, jr_001_57d1

jr_001_578a:
    ld d, d

jr_001_578b:
    ld b, c
    ld c, [hl]

jr_001_578d:
    ld b, c
    ld d, h
    ld b, l
    ld c, [hl]

jr_001_5791:
    jr nz, jr_001_57ca

jr_001_5793:
    jr nz, jr_001_57b5

jr_001_5795:
    jr nz, jr_001_57b7

    jr nz, jr_001_579d

    jr nz, jr_001_57bb

    jr nz, jr_001_57bd

jr_001_579d:
    jr nz, jr_001_57bf

    ld b, a

jr_001_57a0:
    ld d, d
    ld b, c

jr_001_57a2:
    ld c, [hl]
    ld b, c
    ld d, h
    ld b, l

jr_001_57a6:
    jr nz, jr_001_57df

jr_001_57a8:
    jr nz, jr_001_57ca

    jr nz, jr_001_57cc

    jr nz, jr_001_57b2

    jr nz, jr_001_57d0

    jr nz, jr_001_57d2

jr_001_57b2:
    jr nz, jr_001_57d4

    ld b, a

jr_001_57b5:
    ld d, d
    ld b, c

jr_001_57b7:
    ld c, [hl]
    ld b, c
    ld b, h
    ld b, c

jr_001_57bb:
    jr nz, jr_001_57f4

jr_001_57bd:
    jr nz, jr_001_57df

jr_001_57bf:
    jr nz, jr_001_57e1

    db $20

    db $7a, $54, $e3, $54, $4c, $55, $b5, $55

jr_001_57ca:
    ld e, $56

jr_001_57cc:
    add a
    ld d, [hl]
    ldh a, [rRP]

jr_001_57d0:
    ld e, c

jr_001_57d1:
    ld d, a

jr_001_57d2:
    adc a
    ld d, h

jr_001_57d4:
    ld hl, sp+$54
    ld h, c
    ld d, l
    jp z, $3355

    ld d, [hl]
    sbc h
    ld d, [hl]
    dec b

jr_001_57df:
    ld d, a
    ld l, [hl]

jr_001_57e1:
    ld d, a
    and h
    ld d, h
    dec c
    ld d, l
    db $76
    ld d, l
    rst $18
    ld d, l
    ld c, b
    ld d, [hl]
    or c
    ld d, [hl]
    ld a, [de]
    ld d, a
    add e
    ld d, a
    adc $54

jr_001_57f4:
    scf
    ld d, l
    and b
    ld d, l
    add hl, bc
    ld d, [hl]
    ld [hl], d
    ld d, [hl]
    db $db
    ld d, [hl]
    ld b, h
    ld d, a
    xor l
    ld d, a
    cp c
    ld d, h
    ld [hl+], a
    ld d, l
    adc e
    ld d, l
    db $f4
    ld d, l
    ld e, l
    ld d, [hl]
    add $56
    cpl
    ld d, a
    sbc b
    ld d, a
    ld hl, $4d00
    ld c, [hl]

    db $28

    nop

    db $25, $4e

    jr nc, jr_001_581c

jr_001_581c:
    push af
    ld c, l

    db $38

    nop

    db $bd, $4d, $40

    nop

    db $7d, $4d, $48

    nop

    db $35, $4d

    ld d, b
    nop
    push hl
    ld c, h

    db $58

    nop

    db $8d, $4c, $60

    nop

    db $2d, $4c

    ld l, b
    nop
    push bc
    ld c, e

    db $70

    nop

    db $55, $4b

    db $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8
    db $f8, $f8, $fd, $fe, $fe, $ff, $00, $12, $00, $00, $00, $01, $00, $08, $00, $01
    db $00, $10, $00, $01, $08, $00, $00, $01, $08, $08, $00, $01, $08, $10, $00, $01
    db $10, $00, $00, $01, $10, $08, $00, $01, $10, $10, $00, $01, $18, $00, $20, $01
    db $18, $08, $21, $01, $18, $10, $22, $01, $20, $00, $32, $01, $20, $08, $33, $01
    db $20, $10, $34, $01, $28, $00, $42, $01, $28, $08, $43, $01, $28, $10, $44, $01
    db $24, $00, $00, $01, $00, $00, $08, $02, $00, $00, $10, $03, $00, $08, $00, $0b
    db $00, $08, $08, $0c, $00, $08, $10, $0d, $00, $10, $00, $14, $00, $10, $08, $15
    db $00, $10, $10, $16, $00, $18, $00, $23, $01, $18, $08, $24, $01, $18, $10, $25
    db $01, $20, $00, $35, $01, $20, $08, $36, $01, $20, $10, $37, $01, $28, $00, $45
    db $01, $28, $08, $46, $01, $28, $10, $47, $01, $00, $00, $00, $0a, $00, $08, $01
    db $0a, $00, $10, $02, $0a, $08, $00, $04, $0a, $08, $08, $00, $0a, $08, $10, $05
    db $0a, $10, $00, $08, $0a, $10, $08, $09, $0a, $10, $10, $0a, $0a, $18, $00, $00
    db $00, $18, $08, $00, $00, $18, $10, $00, $00, $20, $00, $00, $00, $20, $08, $00
    db $00, $20, $10, $00, $00, $28, $00, $00, $00, $28, $08, $00, $00, $28, $10, $00
    db $00, $24, $00, $00, $04, $00, $00, $08, $05, $00, $00, $10, $06, $00, $08, $00
    db $0e, $00, $08, $08, $0f, $00, $08, $10, $10, $00, $10, $00, $17, $00, $10, $08
    db $18, $00, $10, $10, $19, $00, $18, $00, $26, $01, $18, $08, $27, $01, $18, $10
    db $28, $01, $20, $00, $00, $01, $20, $08, $38, $01, $20, $10, $00, $01, $28, $00
    db $48, $01, $28, $08, $49, $01, $28, $10, $4a, $01, $00, $00, $00, $0a, $00, $08
    db $01, $0a, $00, $10, $02, $0a, $08, $00, $04, $0a, $08, $08, $00, $0a, $08, $10
    db $06, $0a, $10, $00, $08, $0a, $10, $08, $09, $0a, $10, $10, $0b, $0a, $18, $00
    db $00, $00, $18, $08, $00, $00, $18, $10, $00, $00, $20, $00, $00, $00, $20, $08
    db $00, $00, $20, $10, $00, $00, $28, $00, $00, $00, $28, $08, $00, $00, $28, $10
    db $00, $00, $24, $00, $00, $07, $00, $00, $08, $08, $00, $00, $10, $09, $00, $08
    db $00, $11, $00, $08, $08, $0f, $00, $08, $10, $12, $00, $10, $00, $1a, $00, $10
    db $08, $1b, $00, $10, $10, $1c, $00, $18, $00, $29, $01, $18, $08, $2a, $01, $18
    db $10, $2b, $01, $20, $00, $39, $01, $20, $08, $3a, $01, $20, $10, $3b, $01, $28
    db $00, $4b, $01, $28, $08, $4c, $01, $28, $10, $4d, $01, $00, $00, $00, $0a, $00
    db $08, $01, $0a, $00, $10, $02, $0a, $08, $00, $04, $0a, $08, $08, $00, $0a, $08
    db $10, $06, $0a, $10, $00, $08, $0a, $10, $08, $09, $0a, $10, $10, $0b, $0a, $18
    db $00, $00, $00, $18, $08, $00, $00, $18, $10, $00, $00, $20, $00, $00, $00, $20
    db $08, $00, $00, $20, $10, $00, $00, $28, $00, $00, $00, $28, $08, $00, $00, $28
    db $10, $00, $00, $24, $00, $00, $0a, $00, $00, $08, $00, $00, $00, $10, $00, $00
    db $08, $00, $13, $00, $08, $08, $00, $00, $08, $10, $00, $00, $10, $00, $1d, $00
    db $10, $08, $1e, $00, $10, $10, $1f, $00, $18, $00, $2c, $01, $18, $08, $2d, $01
    db $18, $10, $2e, $01, $20, $00, $3c, $01, $20, $08, $3d, $01, $20, $10, $3e, $01
    db $28, $00, $4e, $01, $28, $08, $4f, $01, $28, $10, $50, $01, $00, $00, $03, $0a
    db $00, $08, $00, $0a, $00, $10, $00, $0a, $08, $00, $07, $0a, $08, $08, $00, $0a
    db $08, $10, $00, $0a, $10, $00, $08, $0a, $10, $08, $09, $0a, $10, $10, $0c, $0a
    db $18, $00, $00, $00, $18, $08, $00, $00, $18, $10, $00, $00, $20, $00, $00, $00
    db $20, $08, $00, $00, $20, $10, $00, $00, $28, $00, $00, $00, $28, $08, $00, $00
    db $28, $10, $00, $00, $12, $00, $00, $00, $01, $00, $08, $00, $01, $00, $10, $00
    db $01, $08, $00, $00, $01, $08, $08, $00, $01, $08, $10, $00, $01, $10, $00, $00
    db $01, $10, $08, $00, $01, $10, $10, $00, $01, $18, $00, $2f, $01, $18, $08, $30
    db $01, $18, $10, $31, $01, $20, $00, $3f, $01, $20, $08, $40, $01, $20, $10, $41
    db $01, $28, $00, $51, $01, $28, $08, $52, $01, $28, $10, $53, $01, $01, $98, $03
    db $c1, $5b, $04, $98, $03, $af, $5b, $07, $98, $03, $9d, $5b, $0a, $98, $03, $8b
    db $5b, $0d, $98, $03, $79, $5b, $10, $98, $03, $67, $5b, $01, $98, $03, $d3, $5b
    db $04, $98, $03, $e5, $5b, $07, $98, $03, $e5, $5b, $0a, $98, $03, $e5, $5b, $0d
    db $98, $03, $f7, $5b, $10, $98, $03, $d3, $5b, $0f, $10, $11, $20, $21, $11, $31
    db $32, $33, $0f, $10, $11, $20, $21, $22, $32, $33, $34, $0c, $0d, $0e, $1d, $1e
    db $1f, $2e, $2f, $30, $0c, $0d, $0e, $1d, $1e, $1f, $2f, $30, $31, $09, $0a, $0b
    db $1b, $19, $1c, $2b, $2c, $2d, $09, $0a, $0b, $1a, $1b, $1c, $2c, $2d, $2e, $06
    db $07, $08, $18, $19, $1a, $28, $29, $2a, $06, $07, $08, $18, $19, $18, $29, $2a
    db $2b, $03, $04, $05, $15, $16, $17, $25, $26, $27, $03, $04, $05, $15, $16, $17
    db $26, $27, $28, $00, $01, $02, $12, $13, $14, $22, $23, $24, $00, $01, $02, $12
    db $13, $14, $23, $24, $25, $08, $08, $08, $08, $08, $08, $08, $08, $08, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $0a, $08, $08, $0a, $08, $08, $0a
    db $0a, $0a, $04, $04, $04, $04, $04, $04, $04, $04, $04

Call_001_5c09:
    ld a, [$df37]
    ld c, a
    ld a, [$df38]
    ld b, a
    xor a

jr_001_5c12:
    ld de, $d8f0
    add hl, de
    bit 7, h
    jr z, jr_001_5c63

    ld de, $2710
    add hl, de
    add $30
    ld [bc], a
    inc bc
    xor a

jr_001_5c23:
    ld de, $fc18
    add hl, de
    bit 7, h
    jr z, jr_001_5c60

    ld de, $03e8
    add hl, de
    add $30
    ld [bc], a
    inc bc
    xor a

jr_001_5c34:
    ld de, $ff9c
    add hl, de
    bit 7, h
    jr z, jr_001_5c5d

    ld de, $0064
    add hl, de
    add $30
    ld [bc], a
    inc bc
    xor a

jr_001_5c45:
    ld de, $fff6
    add hl, de
    bit 7, h
    jr z, jr_001_5c5a

    ld de, $000a
    add hl, de
    add $30
    ld [bc], a
    inc bc
    ld a, l
    add $30
    ld [bc], a
    ret


jr_001_5c5a:
    inc a
    jr jr_001_5c45

jr_001_5c5d:
    inc a
    jr jr_001_5c34

jr_001_5c60:
    inc a
    jr jr_001_5c23

jr_001_5c63:
    inc a
    jr jr_001_5c12

    xor a
    ld [$dcfe], a
    call Call_001_5d63
    call Call_001_5f18
    ld a, [$dd4b]
    or a
    jr z, jr_001_5c7c

    dec a
    ld [$dd4b], a
    jr jr_001_5c9f

jr_001_5c7c:
    ld a, [$dd49]
    ld l, a
    ld a, [$dd4a]
    ld h, a
    or l
    jr z, jr_001_5c9f

    ld a, [$dd4c]
    xor $01
    jr z, jr_001_5c92

    ld de, $ffce
    add hl, de

jr_001_5c92:
    push hl
    call Call_001_5c09
    pop hl
    ld a, l
    ld [$dd49], a
    ld a, h
    ld [$dd4a], a

jr_001_5c9f:
    ld a, [$ff9f]
    cp $02
    jr z, jr_001_5cbd

    ld a, [$ff8a]
    and $f0
    or a
    jr z, jr_001_5cbd

    ld a, $02
    ld [$ff9f], a
    ld a, $28
    ld [$ffa0], a
    ld a, $1a
    call Call_000_3e64

jr_001_5cbd:
    ret


    ld a, [$dd00]
    or a
    ret z

    ld a, $03
    ldh [rIE], a
    ld hl, $dd32
    call Call_000_0e54
    ld a, [$defa]
    or a
    jr z, jr_001_5cf5

    ld de, $deb8

jr_001_5cd6:
    push af
    ld a, [de]
    inc de
    ld l, a
    ld a, [de]
    inc de
    ld h, a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl-], a
    ld bc, $0020
    add hl, bc
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl-], a
    pop af
    dec a
    jr nz, jr_001_5cd6

    xor a
    ld [$defa], a

jr_001_5cf5:
    ld a, [$dd09]
    ld l, a
    ld a, [$dd0a]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, jr_001_5d05

    ld hl, $6784
    ld a, [hl+]

jr_001_5d05:
    ld b, a
    ld a, [$dd03]
    add b
    ld [$dd03], a
    ld a, [$dd07]
    sub b
    ld [$dd07], a
    ld a, l
    ld [$dd09], a
    ld a, h
    ld [$dd0a], a
    ld hl, $dd03
    ld a, [hl+]
    ldh [rSCX], a
    ld a, [hl+]
    ldh [rLYC], a
    ld a, l
    ld [$dd01], a
    ld a, h
    ld [$dd02], a
    ret


Call_001_5d2e:
    push hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    inc de
    cp $ff
    jr nz, jr_001_5d41

    ld a, [de]
    inc de
    ld b, a
    ld a, [de]
    ld d, a
    ld e, b
    ld a, [de]
    inc de

jr_001_5d41:
    ld b, a
    xor a
    ld [hl+], a
    ld a, b
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    xor a
    ld [hl+], a
    xor a
    ld [hl+], a
    pop hl
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ret


Call_001_5d63:
    ld a, [$de80]
    inc a
    and $03
    ld [$de80], a
    ld hl, $c200
    ld a, [$de7d]
    inc a
    call Call_001_6e9a
    xor a
    ld [$de7d], a
    ld hl, $c200
    ld a, l
    ld [$de7e], a
    ld a, h
    ld [$de7f], a
    ld a, $03
    ld hl, $dd60

jr_001_5d8a:
    push af
    push hl
    ld de, $dd51
    ld c, $0f

jr_001_5d91:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_001_5d91

    call Call_001_5dab
    pop hl
    ld de, $dd51
    ld c, $0f

jr_001_5da0:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_001_5da0

    pop af
    dec a
    jr nz, jr_001_5d8a

    ret


Call_001_5dab:
    ld a, [$dd5d]
    or a
    jp z, Jump_001_5e35

    ld a, [$dd5e]
    ld e, a
    ld a, [$dd5f]
    ld d, a
    ld a, $0a

jr_001_5dbc:
    push af
    push de
    ld a, [de]
    inc de
    ld l, a
    ld a, [de]
    inc de
    ld h, a
    ld a, [de]
    inc de
    ld c, a
    ld a, [de]
    inc de
    ld b, a
    add hl, bc
    pop bc
    ld a, l
    ld [bc], a
    inc bc
    ld a, h
    ld [bc], a
    push hl
    push de
    ld a, [de]
    inc de
    ld l, a
    ld a, [de]
    inc de
    ld h, a
    ld a, [hl+]
    cp $80
    jr z, jr_001_5e2b

    pop de
    cp $7f
    jr z, jr_001_5e1f

    ld b, a
    ld a, l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, [de]
    add b
    ld [de], a
    inc de
    push af
    ld a, [$de7e]
    ld l, a
    ld a, [$de7f]
    ld h, a
    pop af
    ld [hl+], a
    pop af
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [de]
    ld b, a
    ld a, [$de80]
    or a
    jr nz, jr_001_5e0a

    ld a, b
    inc a
    and $07
    ld b, a

jr_001_5e0a:
    ld a, b
    ld [de], a
    inc de
    ld [hl+], a
    ld a, [$de7d]
    inc a
    ld [$de7d], a
    ld a, l
    ld [$de7e], a
    ld a, h
    ld [$de7f], a
    jr jr_001_5e26

jr_001_5e1f:
    pop af
    ld hl, $0004
    add hl, de
    ld d, h
    ld e, l

jr_001_5e26:
    pop af
    dec a
    jr nz, jr_001_5dbc

    ret


jr_001_5e2b:
    pop de
    pop hl
    pop af
    ld hl, $dd51
    call Call_001_5d2e
    ret


Jump_001_5e35:
    ld a, [$dd57]
    ld e, a
    ld a, [$dd58]
    ld d, a
    ld a, [$dd5a]
    ld l, a
    ld a, [$dd5b]
    ld h, a
    add hl, de
    ld a, h
    or a
    jr nz, jr_001_5e99

    ld hl, $660a
    ld a, [$dd5e]
    ld e, a
    ld a, [$dd5f]
    ld d, a
    ld c, $0a
    ld a, c
    ld [$dd5d], a
    ld a, [$ff9f]
    cp $02
    jr z, jr_001_5e67

    ld a, $1c
    call Call_000_3e64

jr_001_5e67:
    xor a
    ld [de], a
    inc de
    ld a, [$dd54]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [$dd56]
    ld [de], a
    inc de
    cp $90
    jr nc, jr_001_5e90

    ld a, [$ff9f]
    cp $02
    jr z, jr_001_5e90

    ld a, $1b
    call Call_000_3e64

jr_001_5e90:
    ld a, c
    and $07
    ld [de], a
    inc de
    dec c
    jr nz, jr_001_5e67

    ret


jr_001_5e99:
    ld a, l
    ld [$dd5a], a
    ld a, h
    ld [$dd5b], a
    ld a, [$dd59]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    ld de, $617f
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [$dd53]
    ld l, a
    ld a, [$dd54]
    ld h, a
    ld a, [$dd5b]

jr_001_5ebf:
    add hl, bc
    dec a
    jr nz, jr_001_5ebf

    ld a, l
    ld [$dd53], a
    ld a, h
    ld [$dd54], a
    ld a, [$dd55]
    ld l, a
    ld a, [$dd56]
    ld h, a
    ld a, [$dd5b]

jr_001_5ed6:
    add hl, de
    dec a
    jr nz, jr_001_5ed6

    ld a, l
    ld [$dd55], a
    ld a, h
    ld [$dd56], a
    ld a, [$de7e]
    ld l, a
    ld a, [$de7f]
    ld h, a
    ld a, [$dd56]
    ld [hl+], a
    ld a, [$dd54]
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$dd5c]
    ld b, a
    ld a, [$de80]
    or a
    jr nz, jr_001_5f06

    ld a, b
    inc a
    and $07
    ld [$dd5c], a
    ld b, a

jr_001_5f06:
    ld a, b
    ld [hl+], a
    ld a, [$de7d]
    inc a
    ld [$de7d], a
    ld a, l
    ld [$de7e], a
    ld a, h
    ld [$de7f], a
    ret


Call_001_5f18:
    ld a, $0b
    ld hl, $de81
    ld de, $deb8

jr_001_5f20:
    push af
    ld a, [hl]
    dec a
    or a
    jr nz, jr_001_5f6d

    push hl
    inc hl
    ld a, [hl]
    inc a
    ld [hl+], a
    cp $30
    jr z, jr_001_5f60

    add a
    push hl
    ld l, a
    ld h, $00
    ld bc, $65a8
    add hl, bc
    ld a, [hl+]
    ld b, [hl]
    ld c, a
    pop hl
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [bc]
    inc bc
    ld [de], a
    inc de
    ld a, [bc]
    inc bc
    ld [de], a
    inc de
    ld a, [bc]
    inc bc
    ld [de], a
    inc de
    ld a, [bc]
    inc bc
    ld [de], a
    inc de
    ld a, [$defa]
    inc a
    ld [$defa], a
    pop hl
    ld bc, $0005
    add hl, bc
    jr jr_001_5f72

jr_001_5f60:
    inc hl
    inc hl
    ld a, [hl]
    pop hl
    ld [hl+], a
    xor a
    ld [hl+], a
    ld bc, $0003
    add hl, bc
    jr jr_001_5f72

jr_001_5f6d:
    ld [hl+], a
    ld bc, $0004
    add hl, bc

jr_001_5f72:
    pop af
    dec a
    jr nz, jr_001_5f20

    ret


    db $00, $01, $01, $01, $01, $01, $01, $01, $01, $02, $00

    nop
    ld bc, $0101
    ld bc, $0201
    ld [bc], a
    ld [bc], a
    inc bc
    nop

    db $1c, $01

    db $1c, $01

    db $1c, $01

    db $1c, $01

    dec e
    ld [bc], a

    db $1d, $02

    db $1d, $02, $1d, $02

    db $1e, $03, $1e, $03, $1e, $03

    ld e, $03
    rra
    nop

    db $1f, $00, $1f, $00

    rra
    nop

    db $01, $00

    db $01, $00

    ld bc, $0100
    nop
    ld [bc], a
    inc bc

    db $02, $03

    db $02, $03

    db $02, $03

    inc bc
    ld [bc], a
    inc bc
    ld [bc], a

    db $03, $02

    inc bc
    ld [bc], a

    db $04, $01

    inc b
    db $01

    db $04, $01

    inc b
    ld bc, $021c
    inc e
    ld [bc], a

    db $1c, $02

    inc e
    ld [bc], a

    db $1d, $02

    dec e
    inc bc
    dec e
    inc bc

    db $1d, $03

    ld e, $03
    ld e, $03
    ld e, $00
    ld e, $00

    db $1f, $00, $1f, $00

    rra
    nop

    db $1f, $00, $01, $00

    db $01
    nop

    db $01, $00, $01, $00

    db $02, $00

    ld [bc], a
    nop

    db $02, $03

    ld [bc], a
    inc bc

    db $03, $03

    db $03, $03

    inc bc
    inc bc
    inc bc
    ld [bc], a

    db $04, $02

    inc b
    ld [bc], a
    inc b
    ld [bc], a

    db $04, $02, $1c, $01

    inc e
    db $01

    db $1c, $01

    inc e
    db $01

    db $1c, $01, $1d, $02

    dec e
    ld [bc], a

    db $1d, $02, $1d, $02

    dec e
    ld [bc], a
    ld e, $03

    db $1e, $03

    ld e, $03

    db $1e, $03, $1e, $03, $1f, $00, $1f, $00

    rra
    nop

    db $1f, $00, $1f, $00

    ld bc, $0100
    nop
    db $01
    nop

    db $01, $00, $01, $00, $02, $03, $02, $03, $02, $03

    ld [bc], a
    inc bc

    db $02, $03, $03, $02, $03, $02, $03, $02

    inc bc
    ld [bc], a
    inc bc
    ld [bc], a

    db $04, $01

    inc b
    ld bc, HeaderLogo
    inc b
    ld bc, HeaderLogo
    inc e
    ld [bc], a
    inc e
    ld [bc], a
    inc e
    ld [bc], a
    inc e
    ld [bc], a
    inc e
    ld [bc], a
    dec e
    ld [bc], a
    dec e
    ld [bc], a
    dec e
    inc bc
    dec e
    inc bc
    dec e
    inc bc
    ld e, $03
    ld e, $03
    ld e, $03
    ld e, $00
    ld e, $00
    rra
    nop
    rra
    nop
    rra
    nop
    rra
    nop
    rra
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0200
    nop
    ld [bc], a
    nop
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc b
    ld [bc], a
    inc b
    ld [bc], a
    inc b
    ld [bc], a
    inc b
    ld [bc], a
    inc b
    ld [bc], a

    db $04, $00, $00, $43, $0c, $00, $08, $4b, $0c, $00, $10, $43, $0c, $00, $18, $4b
    db $0c, $04, $00, $00, $44, $0c, $00, $08, $4a, $0c, $00, $10, $44, $0c, $00, $18
    db $4a, $0c, $04, $00, $00, $45, $0c, $00, $08, $49, $0c, $00, $10, $45, $0c, $00
    db $18, $49, $0c, $04, $00, $00, $46, $0c, $00, $08, $48, $0c, $00, $10, $46, $0c
    db $00, $18, $48, $0c, $04, $00, $00, $47, $0c, $00, $08, $47, $0c, $00, $10, $47
    db $0c, $00, $18, $47, $0c, $04, $00, $00, $48, $0c, $00, $08, $46, $0c, $00, $10
    db $48, $0c, $00, $18, $46, $0c, $04, $00, $00, $49, $0c, $00, $08, $45, $0c, $00
    db $10, $49, $0c, $00, $18, $45, $0c, $04, $00, $00, $4a, $0c, $00, $08, $44, $0c
    db $00, $10, $4a, $0c, $00, $18, $44, $0c, $04, $00, $00, $4b, $0c, $00, $08, $44
    db $0c, $00, $10, $4b, $0c, $00, $18, $44, $0c, $04, $00, $00, $58, $0c, $00, $08
    db $58, $0c, $00, $10, $58, $0c, $00, $18, $58, $0c

    sbc c

    db $99, $99, $99, $88, $88, $88, $88, $77, $77, $77, $77, $66, $66, $66, $66, $55
    db $55, $55, $55, $44, $44, $44, $44, $33, $33, $33, $33, $22, $22, $22, $22, $11
    db $11, $11, $11, $00, $00, $00, $00

    nop
    nop
    nop
    rst $38

    db $30, $00, $08, $ff, $60, $00, $12, $ff, $8d, $00, $2d, $ff, $b5, $00, $4b, $ff
    db $d3, $00, $73, $ff

    xor $00
    and b
    rst $38
    ld hl, sp+$00
    ret nc

    rst $38

    db $00, $01, $00, $00

    ld hl, sp+$00
    jr nc, jr_001_61a7

jr_001_61a7:
    xor $00
    ld h, b
    nop

    db $d3, $00, $8d, $00

    db $b5, $00, $b5, $00

    adc l
    nop
    db $d3
    nop

    db $60, $00, $ee, $00, $30, $00, $f8, $00

    nop
    nop
    nop
    db $01

    db $d0, $ff, $f8, $00, $a0, $ff, $ee, $00, $73, $ff, $d3, $00

    db $4b, $ff, $b5, $00

    dec l
    rst $38
    adc l
    nop
    ld [de], a
    rst $38
    ld h, b
    nop
    ld [$30ff], sp
    nop

    db $00, $ff, $00, $00

    ld [$d0ff], sp
    rst $38
    ld [de], a
    rst $38
    and b
    rst $38

    db $2d, $ff, $73, $ff

    db $4b, $ff, $4b, $ff

    ld [hl], e
    rst $38
    dec l
    rst $38

    db $a0, $ff, $12, $ff, $d0, $ff, $08, $ff

    nop
    db $01

    db $02

    db $03

    inc b
    dec b
    ld b, $07
    ld [$0607], sp

    db $05

    db $04

    db $03

    db $02

    db $01
    nop

    db $1f, $1e, $1d

    inc e
    dec de
    ld a, [de]
    add hl, de
    jr @+$1b

    ld a, [de]

    db $1b, $1c

    db $1d

    db $1e

    rra

    db $10

    db $0f, $0e, $0d, $0c, $0b

    ld a, [bc]
    add hl, bc
    ld [$0a09], sp
    dec bc

    db $0c

    dec c
    db $0e

    db $0f

    db $10

    db $11

    db $12, $13

    db $14

    dec d
    ld d, $17
    jr @+$19

    db $16

    db $15

    db $14

    inc de

    db $12, $11

    nop

    db $1f

    db $1e, $1d, $1c

    dec de
    ld a, [de]
    add hl, de
    jr @+$19

    db $16

    db $15

    db $14, $13

    db $12

    db $11
    db $10

    db $11, $12

    db $13

    inc d
    dec d
    ld d, $17
    jr jr_001_6272

    ld a, [de]
    dec de

    db $1c

    db $1d

    db $1e

    db $1f

    nop

    db $01

    db $02, $03

    inc b
    dec b
    ld b, $07
    ld [$0a09], sp
    dec bc

    db $0c

    dec c
    ld c, $0f
    db $10

    db $0f

    db $0e

jr_001_6272:
    dec c

    db $0c

    dec bc
    ld a, [bc]
    add hl, bc
    ld [$0607], sp

    db $05

    db $04, $03

    db $02

    db $01

    ld c, $0e
    xor a
    ld de, $0006
    ld hl, $dc63

jr_001_6288:
    ld [hl], a
    add hl, de
    dec c
    jr nz, jr_001_6288

    ret


    push hl
    push de
    push af
    ld hl, $dc63
    ld de, $0006

jr_001_6297:
    ld a, [hl]
    or a
    jr z, jr_001_629e

    add hl, de
    jr jr_001_6297

jr_001_629e:
    ld a, $1c
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, b
    sla c
    rla
    sla c
    rla
    sla c
    rla
    and $1f
    sla a
    sla a
    sla a
    add $10
    ld [hl+], a
    pop af
    ld [hl+], a
    pop de
    pop hl
    ret


Call_001_62bf:
    push hl
    push af
    ld hl, $dc63
    ld de, $0006

jr_001_62c7:
    ld a, [hl]
    or a
    jr z, jr_001_62ce

    add hl, de
    jr jr_001_62c7

jr_001_62ce:
    ld a, $1c
    ld [hl+], a
    pop af
    or a
    jr nz, jr_001_62d9

    ld [hl+], a
    ld [hl+], a
    jr jr_001_62df

jr_001_62d9:
    ld a, $80
    ld [hl+], a
    ld a, $ff
    ld [hl+], a

jr_001_62df:
    xor a
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, c
    add $04
    ld [hl+], a
    pop hl
    ret


    ld hl, $dc63
    ld c, $0e

jr_001_62ee:
    ld a, [hl]
    or a
    jr z, jr_001_6336

    dec a
    ld [hl+], a
    push hl
    ld hl, $7b68
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld b, a
    pop hl
    ld a, [$c2b6]
    ld e, a
    ld a, [$c2b7]
    ld d, a
    push bc
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    push hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld b, h
    ld c, l
    pop hl
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld [de], a
    inc de
    pop bc
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    inc de
    ld a, $01
    ld [de], a
    inc de
    ld a, e
    ld [$c2b6], a
    ld a, d
    ld [$c2b7], a
    ld a, [$c2b5]
    inc a
    ld [$c2b5], a
    jr jr_001_633a

jr_001_6336:
    ld de, $0006
    add hl, de

jr_001_633a:
    dec c
    jr nz, jr_001_62ee

    ret


    ld c, $04
    xor a
    ld de, $0004
    ld hl, $dcb7

jr_001_6347:
    ld [hl], a
    add hl, de
    dec c
    jr nz, jr_001_6347

    ret


Call_001_634d:
    push bc
    ld c, d
    push af
    push de
    ld hl, $dcb7
    ld de, $0007

jr_001_6357:
    ld a, [hl]
    or a
    jr z, jr_001_635e

    add hl, de
    jr jr_001_6357

jr_001_635e:
    ld a, $28
    ld [hl+], a
    pop de
    ld a, e
    or a
    jr nz, jr_001_636e

    ld a, $80
    ld [hl+], a
    ld a, $ff
    ld [hl+], a
    jr jr_001_6371

jr_001_636e:
    xor a
    ld [hl+], a
    ld [hl+], a

jr_001_6371:
    ld a, $00
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    pop af
    ld e, a
    ld d, $00
    push hl
    ld hl, $7b84
    add hl, de
    ld a, [hl]
    pop hl
    ld [hl], a
    pop bc
    ret


    ld hl, $dcb7
    ld c, $04

jr_001_638b:
    push bc
    ld a, [hl]
    or a
    jr z, jr_001_63f1

    dec a
    ld [hl+], a
    cp $0f
    jr nz, jr_001_63a5

    push hl
    inc hl
    ld a, [hl+]
    ld d, a
    inc hl
    ld a, [hl+]
    ld b, a
    ld c, [hl]
    inc hl
    inc hl
    ld a, d
    call Call_001_62bf
    pop hl

jr_001_63a5:
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, h
    ld e, l
    pop hl
    ld [hl-], a
    ld a, e
    ld [hl+], a
    ld a, [$c2b6]
    ld e, a
    ld a, [$c2b7]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld [de], a
    inc de
    ld a, [hl+]
    ld b, a
    ld [de], a
    inc de
    ld a, [hl+]
    push af
    ld [de], a
    inc de
    ld a, $01
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    inc de
    ld a, b
    add $08
    ld [de], a
    inc de
    pop af
    inc a
    ld [de], a
    inc de
    ld a, $01
    ld [de], a
    inc de
    ld a, e
    ld [$c2b6], a
    ld a, d
    ld [$c2b7], a
    ld a, [$c2b5]
    add $02
    ld [$c2b5], a
    jr jr_001_63f5

jr_001_63f1:
    ld de, $0007
    add hl, de

jr_001_63f5:
    pop bc
    dec c
    jr nz, jr_001_638b

    ret


Call_001_63fa:
    ld a, [$dae1]
    or a
    ret z

    ld b, $16
    ld hl, $99d1
    ld de, $7b8a

Jump_001_6407:
    push de
    call Call_001_7c54
    call Call_001_7c54
    call Call_001_7c54
    pop de
    xor a
    ld [$d9bd], a
    ld a, [de]
    inc de
    ld c, a
    push de
    ld de, $d9bf
    push hl

Jump_001_641e:
    push bc
    push hl
    ld bc, $6800
    add hl, bc
    ld bc, $d32a
    add hl, bc
    ld a, [hl]
    pop hl
    cp $27
    jr nz, jr_001_6433

    ld bc, $2625
    jr jr_001_644c

jr_001_6433:
    cp $29
    jr nz, jr_001_643c

    ld bc, $2625
    jr jr_001_644c

jr_001_643c:
    cp $4c
    jr nz, jr_001_6445

    ld bc, $504f
    jr jr_001_644c

jr_001_6445:
    cp $51
    jr nz, jr_001_6468

    ld bc, $504f

jr_001_644c:
    ld a, l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    inc de
    inc l
    ld a, l
    dec l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    inc de
    ld a, [$d9bd]
    add $02
    ld [$d9bd], a

jr_001_6468:
    push hl
    ld bc, $0020
    add hl, bc
    push hl
    ld bc, $6800
    add hl, bc
    ld bc, $d32a
    add hl, bc
    ld c, l
    ld b, h
    pop hl
    ld a, l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, [bc]
    inc bc
    ld [de], a
    inc de
    inc l
    ld a, l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, [bc]
    ld [de], a
    inc de
    ld a, [$d9bd]
    add $02
    ld [$d9bd], a
    pop hl
    ld bc, $ffe2
    add hl, bc
    pop bc
    ld a, c
    cp $ff
    jr z, jr_001_64a8

    cp $fe
    jr z, jr_001_64ad

    dec c
    jp nz, Jump_001_641e

jr_001_64a8:
    ld c, $fe
    push bc
    jr jr_001_6468

jr_001_64ad:
    pop hl
    ld de, $fffe
    add hl, de
    ld a, l
    and $1f
    cp $1f
    jr nz, jr_001_64bd

    ld de, $ffe2
    add hl, de

jr_001_64bd:
    pop de
    dec b
    jp nz, Jump_001_6407

    ret


    ld a, $ff
    ld [$dcf3], a
    ld hl, $dcd5
    ld a, l
    ld [$dcd3], a
    ld a, h
    ld [$dcd4], a
    ret


    ld a, [$dcd3]
    ld l, a
    ld a, [$dcd4]
    ld h, a
    ld [hl], $12
    inc hl
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [hl]
    cp $ff
    jr nz, jr_001_64eb

    ld hl, $dcd5

jr_001_64eb:
    ld a, l
    ld [$dcd3], a
    ld a, h
    ld [$dcd4], a
    ld a, $01
    ld [$d8ab], a
    ret


    ld hl, $dcd5
    ld a, $0a

jr_001_64fe:
    push af
    ld a, [hl]
    or a
    jr z, jr_001_653a

    dec a
    ld [hl+], a
    ld e, a
    ld a, [hl+]
    sub $04
    ld c, a
    ld a, [hl+]
    sub $04
    ld b, a
    push hl
    ld d, $00
    ld hl, $7b56
    add hl, de
    ld a, [hl]
    ld d, a
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $0b
    ld [hl+], a
    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ld a, [$c2b5]
    inc a
    ld [$c2b5], a
    pop hl
    jr jr_001_653e

jr_001_653a:
    ld de, $0003
    add hl, de

jr_001_653e:
    pop af
    dec a
    jr nz, jr_001_64fe

    ret


    db $01, $00, $2e, $99, $64, $0a, $00, $26, $99, $69, $14, $00, $d2, $98, $64, $1e
    db $00, $92, $99, $69, $28, $00, $90, $98, $64, $32, $00, $ad, $99, $69, $3c, $00
    db $87, $99, $64, $46, $00, $82, $99, $69, $50, $00, $20, $99, $64, $64, $00, $c1
    db $98, $69, $5a, $00, $84, $98, $64, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d
    db $5e, $5f, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6a, $6b, $6c, $6d
    db $6e, $6f, $70, $71, $72, $73, $74, $75, $76, $77, $78, $59, $5a, $5b, $5c, $55
    db $56, $57, $58, $00, $00, $00, $00, $7a, $65, $7a, $65, $7a, $65, $7a, $65, $7e
    db $65, $7e, $65, $7e, $65, $7e, $65, $82, $65, $82, $65, $82, $65, $82, $65, $86
    db $65, $86, $65, $86, $65, $86, $65, $8a, $65, $8a, $65, $8a, $65, $8a, $65, $8e
    db $65, $8e, $65, $8e, $65, $8e, $65, $92, $65, $92, $65, $92, $65, $92, $65, $96
    db $65, $96, $65, $96, $65, $96, $65, $9a, $65, $9a, $65, $9a, $65, $9a, $65, $9e
    db $65, $9e, $65, $9e, $65, $9e, $65, $a2, $65, $a2, $65, $a2, $65, $a2, $65, $a6
    db $65, $a6, $65, $a6, $65

    and [hl]
    ld h, l

    db $5c, $fe, $32, $66, $a4, $01, $70, $66, $2e, $ff, $13, $67, $d2, $00, $13, $67
    db $d4, $fe, $ae, $66, $2c, $01, $ae, $66, $1a, $ff, $e6, $66, $e6, $00, $e6, $66
    db $52, $fe, $4d, $67, $ae, $01, $4d, $67, $fc, $fc, $fd, $fd, $fd, $fd, $fd, $fe
    db $fe, $fe, $fe, $ff, $ff, $00, $00, $00, $00, $01, $01, $02, $02, $02, $03, $03
    db $03, $03, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $80, $fc, $fc, $fd, $fd, $fd, $fd, $fd, $fe, $fe, $fe
    db $fe, $ff, $ff, $00, $00, $00, $00, $01, $01, $02, $02, $02, $03, $03, $03, $03
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04

    ld a, a

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $02, $02, $02
    db $03, $03, $03, $03, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $7f, $01, $01, $02, $02, $02, $03, $03, $03
    db $03, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $7f, $fc, $fc, $fd, $fd, $fd, $fe, $fe, $ff, $ff, $00, $00
    db $00, $00, $01, $01, $02, $02, $02, $03, $03, $03, $03, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $7f, $01
    db $01, $01, $02, $02, $02, $02, $02, $02, $02, $03, $03, $03, $03, $03, $03, $03
    db $03, $03, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $7f, $03, $03, $03, $03, $03, $03, $03, $03, $02, $01
    db $ff, $fe, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
    db $fd, $fd, $fe, $ff, $01, $02, $03, $03, $03, $03, $03, $03, $03, $03, $00, $50
    db $a0, $f4, $ff, $01, $04, $40, $a0, $eb, $ff, $1f, $05

    rst $38
    xor l
    ld h, a

    db $6e, $d8, $e9, $ff, $1e, $06, $1e, $d8, $f8, $ff, $02, $04

    rst $38
    cp h
    ld h, a

    db $6e, $c0, $f4, $ff, $01, $04, $82, $c0, $ed, $ff, $1f, $05

    rst $38
    bit 4, a
    ld a, $80
    ldh [rBCPS], a
    ld c, $40

jr_001_67e0:
    ld a, [hl+]
    ldh [rBCPD], a
    dec c
    jr nz, jr_001_67e0

    ret


    ld a, $80
    ldh [rOCPS], a
    ld c, $40

jr_001_67ed:
    ld a, [hl+]
    ldh [rOCPD], a
    dec c
    jr nz, jr_001_67ed

    ret


Call_001_67f4:
    ld a, $80
    ldh [rBCPS], a
    ldh [rOCPS], a
    ld c, $40

jr_001_67fc:
    ld a, [hl+]
    ldh [rBCPD], a
    ld a, [de]
    inc de
    ldh [rOCPD], a
    dec c
    jr nz, jr_001_67fc

    ret


Call_001_6807:
    ld de, $c3b6
    ld hl, $d6c0
    ld b, $90
    ld a, $02
    ldh [rSVBK], a

jr_001_6813:
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    inc de
    inc de
    dec b
    jr nz, jr_001_6813

    xor a
    ldh [rSVBK], a
    ret


    ld c, $10
    jr jr_001_683a

Call_001_6838:
    ld c, $20

Jump_001_683a:
jr_001_683a:
    add b
    push af
    push bc
    ld [$ff8d], a
    ld bc, $0040
    ld hl, $c9dd
    ld de, $ca9d
    ld a, [$ff9c]
    cp $02
    jr nz, jr_001_685d

    ld bc, $0240
    ld a, $02
    ldh [rSVBK], a
    ld hl, $d000
    ld de, $d6c0

jr_001_685d:
    push bc
    ld a, [$ff8d]
    ld b, a
    ld a, [hl+]
    add b
    cp $20
    jr c, jr_001_686a

    ld a, $1f

jr_001_686a:
    ld c, a
    ld a, [$ff8d]
    ld b, a
    ld a, [hl+]
    add b
    cp $20
    jr c, jr_001_6877

    ld a, $1f

jr_001_6877:
    push af
    swap a
    sla a
    and $e0
    or c
    ld [de], a
    inc de
    pop af
    sla a
    swap a
    and $03
    ld c, a
    ld a, [$ff8d]
    ld b, a
    ld a, [hl+]
    add b
    cp $20
    jr c, jr_001_6895

    ld a, $1f

jr_001_6895:
    sla a
    sla a
    or c
    ld [de], a
    inc de
    pop bc
    dec bc
    ld a, b
    or c
    jr nz, jr_001_685d

    xor a
    ldh [rSVBK], a
    ld a, [$ff9c]
    cp $02
    jr z, jr_001_68bd

    call Call_001_7c54
    ld hl, $ca9d
    ld de, $cadd
    call Call_001_67f4
    call Call_001_693c
    jr jr_001_68c3

jr_001_68bd:
    call Call_001_7c54
    call Call_001_6807

jr_001_68c3:
    pop bc
    pop af
    dec c
    jp nz, Jump_001_683a

    call Call_001_7c54
    ret


    ld c, $10
    jr jr_001_68dd

Call_001_68d1:
    ld h, a
    ld c, $08
    ld a, b
    ld b, $fc
    dec a
    jr nz, jr_001_68dc

    ld b, $04

jr_001_68dc:
    ld a, h

Jump_001_68dd:
jr_001_68dd:
    add b
    push af
    push bc
    ld [$ff8d], a
    ld bc, $0240
    ld a, $02
    ldh [rSVBK], a
    ld hl, $d000
    ld de, $d6c0

jr_001_68f0:
    push bc
    ld a, [$ff8d]
    ld b, a
    ld a, [hl+]
    sub b
    jr nc, jr_001_68fa

    xor a

jr_001_68fa:
    ld c, a
    ld a, [$ff8d]
    ld b, a
    ld a, [hl+]
    sub b
    jr nc, jr_001_6904

    xor a

jr_001_6904:
    push af
    swap a
    sla a
    and $e0
    or c
    ld [de], a
    inc de
    pop af
    sla a
    swap a
    and $03
    ld c, a
    ld a, [$ff8d]
    ld b, a
    ld a, [hl+]
    sub b
    jr nc, jr_001_691f

    xor a

jr_001_691f:
    sla a
    sla a
    or c
    ld [de], a
    inc de
    pop bc
    dec bc
    ld a, b
    or c
    jr nz, jr_001_68f0

    call Call_001_7c54
    call Call_001_6807
    pop bc
    pop af
    dec c
    jp nz, Jump_001_68dd

    call Call_001_7c54
    ret


Call_001_693c:
    ld a, [$ff9c]
    or a
    ret z

    cp $03
    ret z

    cp $04
    ret z

    ld a, [$c958]
    ldh [rOCPS], a
    ld a, $9e
    ldh [rBCPS], a
    ld hl, $cb1d
    ld a, [$caf7]
    ld [hl+], a
    ld a, [$caf8]
    ld [hl+], a
    ld a, [$cafb]
    ld [hl+], a
    ld a, [$cafc]
    ld [hl+], a
    ld a, [$cab5]
    ld [hl+], a
    ld a, [$cab6]
    ld [hl+], a
    ld a, [$caf7]
    ld [hl+], a
    ld a, [$caf8]
    ld [hl+], a
    ld a, [$cafb]
    ld [hl+], a
    ld a, [$cafc]
    ld [hl+], a
    ld a, [$cafb]
    ld [hl+], a
    ld a, [$cafc]
    ld [hl+], a
    ld a, [$caf7]
    ld [hl+], a
    ld a, [$caf8]
    ld [hl+], a
    ld a, [$caf9]
    ld [hl+], a
    ld a, [$cafa]
    ld [hl+], a
    ld a, [$caf9]
    ld [hl+], a
    ld a, [$cafa]
    ld [hl+], a
    ld a, [$caf7]
    ld [hl+], a
    ld a, [$caf8]
    ld [hl+], a
    ld a, [$caf9]
    ld [hl+], a
    ld a, [$cafa]
    ld [hl+], a
    ld a, [$caf7]
    ld [hl+], a
    ld a, [$caf8]
    ld [hl+], a
    ld a, [$caf1]
    ld [hl+], a
    ld a, [$caf2]
    ld [hl+], a
    ld a, [$caf3]
    ld [hl+], a
    ld a, [$caf4]
    ld [hl+], a
    ld a, [$caed]
    ld [hl+], a
    ld a, [$caee]
    ld [hl+], a
    ld a, [$caf1]
    ld [hl+], a
    ld a, [$caf2]
    ld [hl+], a
    ld a, [$caf3]
    ld [hl+], a
    ld a, [$caf4]
    ld [hl+], a
    ld a, [$caf1]
    ld [hl+], a
    ld a, [$caf2]
    ld [hl+], a
    ld a, [$caf1]
    ld [hl+], a
    ld a, [$caf2]
    ld [hl+], a
    ld a, [$caf3]
    ld [hl+], a
    ld a, [$caf4]
    ld [hl+], a
    ld a, [$caf3]
    ld [hl+], a
    ld a, [$caf4]
    ld [hl+], a
    ld a, [$caf1]
    ld [hl+], a
    ld a, [$caf2]
    ld [hl+], a
    ld a, [$caf3]
    ld [hl+], a
    ld a, [$caf4]
    ld [hl+], a
    ld a, [$cab5]
    ld [hl+], a
    ld a, [$cab6]
    ld [hl+], a
    ld a, [$caf1]
    ld [hl+], a
    ld a, [$caf2]
    ld [hl+], a
    ld a, [$caf3]
    ld [hl+], a
    ld a, [$caf4]
    ld [hl+], a
    ld a, [$cabb]
    ld [hl+], a
    ld a, [$cabc]
    ld [hl+], a
    ld hl, $c3b6
    ld b, $09
    ld c, $81
    ld de, $cb1d

jr_001_6a35:
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, c
    ld [hl+], a
    inc a
    cp $88
    jr nz, jr_001_6a50

    ld a, $08

jr_001_6a50:
    cp $09
    jr nz, jr_001_6a56

    ld a, $80

jr_001_6a56:
    ld c, a
    dec b
    jr nz, jr_001_6a35

    ret


    ld a, $01
    ldh [rVBK], a
    ld a, [$defc]
    or a
    jr nz, jr_001_6a71

    ld hl, $986c
    ld [hl], $04
    ld hl, $98cc
    ld [hl], $01
    jr jr_001_6abe

jr_001_6a71:
    cp $01
    jr nz, jr_001_6a86

    ld hl, $986c
    ld [hl], $01
    ld hl, $98cc
    ld [hl], $04
    ld hl, $992c
    ld [hl], $01
    jr jr_001_6abe

jr_001_6a86:
    cp $02
    jr nz, jr_001_6a9b

    ld hl, $98cc
    ld [hl], $01
    ld hl, $992c
    ld [hl], $04
    ld hl, $998c
    ld [hl], $01
    jr jr_001_6abe

jr_001_6a9b:
    cp $03
    jr nz, jr_001_6ab0

    ld hl, $992c
    ld [hl], $01
    ld hl, $998c
    ld [hl], $04
    ld hl, $99ec
    ld [hl], $01
    jr jr_001_6abe

jr_001_6ab0:
    cp $04
    jr nz, jr_001_6abe

    ld hl, $998c
    ld [hl], $01
    ld hl, $99ec
    ld [hl], $04

jr_001_6abe:
    ld a, [$ff8a]
    ld b, a
    ld a, [$defd]
    or a
    jr nz, jr_001_6ae2

    bit 3, b
    jr z, jr_001_6aea

    ld a, b
    ld [$defd], a
    ld a, [$defc]
    cp $04
    jr z, jr_001_6aea

    inc a
    ld [$defc], a
    ld a, $19
    call Call_000_3e64
    jr jr_001_6aea

jr_001_6ae2:
    bit 3, b
    jr nz, jr_001_6aea

    xor a
    ld [$defd], a

jr_001_6aea:
    ld a, [$defe]
    or a
    jr nz, jr_001_6b09

    bit 2, b
    jr z, jr_001_6b11

    ld a, b
    ld [$defe], a
    ld a, [$defc]
    or a
    jr z, jr_001_6b11

    dec a
    ld [$defc], a
    ld a, $19
    call Call_000_3e64
    jr jr_001_6b11

jr_001_6b09:
    bit 2, b
    jr nz, jr_001_6b11

    xor a
    ld [$defe], a

jr_001_6b11:
    ld a, b
    and $f0
    or a
    jp z, Jump_001_6b8a

    ld a, [$ff9f]
    cp $05
    ret z

    ld a, [$defc]
    ld hl, $70ab
    or a
    jp z, Jump_001_6b40

    ld hl, $70fc
    dec a
    jp z, Jump_001_6b40

    ld hl, $714d
    dec a
    jp z, Jump_001_6b40

    ld hl, $719e
    dec a
    jp z, Jump_001_6b40

    ld hl, $705a

Jump_001_6b40:
    ld de, $df01
    ld bc, $0051
    call DataTransfer
    ld a, [$df4a]
    ld l, a
    ld a, [$df4b]
    ld h, a
    ld de, $cb69
    ld bc, $0018
    call DataTransfer
    ld a, [$df50]
    ld l, a
    ld a, [$df51]
    ld h, a
    ld de, $cc99
    ld bc, $001b
    call DataTransfer
    ld a, [$df43]
    ld hl, $cb96
    ld de, $001c
    ld b, $0a

jr_001_6b76:
    ld [hl], a
    add hl, de
    dec b
    jr nz, jr_001_6b76

    ld a, $1a
    call Call_000_3e64
    ld a, $05
    ld [$ff9f], a
    ld a, $28
    ld [$ffa0], a

Jump_001_6b8a:
    ret


    db $7f, $98, $00, $84, $20, $20, $20, $20, $50, $41, $53, $53, $57, $4f, $52, $44
    db $20, $00, $81, $50, $54, $50, $50, $ff

    db $81, $98, $00, $84, $4d, $4f, $54, $20, $44, $45, $20, $50, $41, $53, $53, $45
    db $20, $00, $81, $50, $54, $50, $50, $ff

    db $7f, $98, $00, $84, $20, $20, $20, $20, $50, $41, $53, $53, $57, $4f, $52, $54
    db $20, $00, $81, $50, $54, $50, $50, $ff

    db $80, $98, $00, $84, $20, $20, $43, $4f, $4e, $54, $52, $41, $53, $45, $f0, $41
    db $20, $00, $81, $50, $54, $50, $50, $ff

    db $7f, $98, $00, $84, $20, $20, $20, $20, $50, $41, $53, $53, $57, $4f, $52, $44
    db $20, $00, $81, $50, $54, $50, $50, $ff

    db $fc, $99, $00, $84, $20, $20, $20, $20, $20, $20, $20, $4c, $41, $54, $45, $53
    db $54, $20, $00, $81, $30, $30, $30, $30, $30, $30, $ff

    db $fd, $99, $00, $84, $20, $20, $20, $20, $20, $20, $44, $45, $52, $4e, $49, $45
    db $52, $20, $00, $81, $30, $30, $30, $30, $30, $30, $ff

    db $ff, $99, $00, $84, $20, $20, $ee, $4c, $54, $49, $4d, $41, $20, $50, $55, $4e
    db $54, $20, $00, $81, $30, $30, $30, $30, $30, $30, $ff

    db $fc, $99, $00, $84, $20, $20, $20, $20, $20, $20, $20, $55, $4c, $54, $49, $4d
    db $4f, $20, $00, $81, $30, $30, $30, $30, $30, $30, $ff

    db $fc, $99, $00, $84, $20, $20, $20, $20, $20, $20, $20, $4c, $45, $54, $5a, $54
    db $45, $20, $00, $81, $30, $30, $30, $30, $30, $30, $ff

    ld a, [$db5a]
    or a
    ret z

    ld c, a
    ld b, $00
    add a
    add a
    ld l, a
    ld h, b
    ld de, $5b44
    add hl, de
    add hl, bc
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, $01
    ldh [rVBK], a
    xor a
    ld c, $06
    call Call_000_01d4
    ld a, [$db5a]
    ld c, a
    ld b, $00
    add a
    add a
    ld l, a
    ld h, b
    ld de, $5b26
    add hl, de
    add hl, bc
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    xor a
    ldh [rVBK], a
    ld [$db5a], a
    ld a, $ad
    ld c, $06
    call Call_000_01d4
    ret


    ld a, [$db6d]
    or a
    ret z

    push af
    ld a, $28
    ld hl, $c200
    call Call_001_6e9a
    pop af
    cp $01
    jr nz, jr_001_6d15

    ld a, [$db61]
    ld l, a
    ld a, [$db62]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, jr_001_6cfe

    ld a, $02
    ld [$db6d], a
    ld a, $01
    ld [$db5a], a
    ret


jr_001_6cfe:
    ld b, a
    ld a, l
    ld [$db61], a
    ld a, h
    ld [$db62], a
    ld a, [$db5b]
    add b
    ld [$db5b], a
    ld c, a
    ld hl, $5855
    jp Jump_001_6e0b


jr_001_6d15:
    cp $02
    jr nz, jr_001_6d47

    ld a, [$db63]
    ld l, a
    ld a, [$db64]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, jr_001_6d30

    ld a, $03
    ld [$db6d], a
    ld a, $02
    ld [$db5a], a
    ret


jr_001_6d30:
    ld b, a
    ld a, l
    ld [$db63], a
    ld a, h
    ld [$db64], a
    ld a, [$db5c]
    add b
    ld [$db5c], a
    ld c, a
    ld hl, $589e
    jp Jump_001_6e0b


jr_001_6d47:
    cp $03
    jr nz, jr_001_6d79

    ld a, [$db65]
    ld l, a
    ld a, [$db66]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, jr_001_6d62

    ld a, $04
    ld [$db6d], a
    ld a, $03
    ld [$db5a], a
    ret


jr_001_6d62:
    ld b, a
    ld a, l
    ld [$db65], a
    ld a, h
    ld [$db66], a
    ld a, [$db5d]
    add b
    ld [$db5d], a
    ld c, a
    ld hl, $592f
    jp Jump_001_6e0b


jr_001_6d79:
    cp $04
    jr nz, jr_001_6daa

    ld a, [$db67]
    ld l, a
    ld a, [$db68]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, jr_001_6d94

    ld a, $05
    ld [$db6d], a
    ld a, $04
    ld [$db5a], a
    ret


jr_001_6d94:
    ld b, a
    ld a, l
    ld [$db67], a
    ld a, h
    ld [$db68], a
    ld a, [$db5e]
    add b
    ld [$db5e], a
    ld c, a
    ld hl, $59c0
    jr jr_001_6e0b

jr_001_6daa:
    cp $05
    jr nz, jr_001_6ddb

    ld a, [$db69]
    ld l, a
    ld a, [$db6a]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, jr_001_6dc5

    ld a, $06
    ld [$db6d], a
    ld a, $05
    ld [$db5a], a
    ret


jr_001_6dc5:
    ld b, a
    ld a, l
    ld [$db69], a
    ld a, h
    ld [$db6a], a
    ld a, [$db5f]
    add b
    ld [$db5f], a
    ld c, a
    ld hl, $5a51
    jr jr_001_6e0b

jr_001_6ddb:
    cp $06
    jr nz, jr_001_6e0b

    ld a, [$db6b]
    ld l, a
    ld a, [$db6c]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, jr_001_6df5

    xor a
    ld [$db6d], a
    ld a, $06
    ld [$db5a], a
    ret


jr_001_6df5:
    ld b, a
    ld a, l
    ld [$db6b], a
    ld a, h
    ld [$db6c], a
    ld a, [$db60]
    add b
    ld [$db60], a
    ld c, a
    ld hl, $5ae2
    jr jr_001_6e0b

Jump_001_6e0b:
jr_001_6e0b:
    ld de, $c200
    ld b, $10
    ld a, [hl+]

jr_001_6e11:
    push af
    ld a, [hl+]
    add b
    ld [de], a
    inc de
    ld a, [hl+]
    add c
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    pop af
    dec a
    jr nz, jr_001_6e11

    ret


    ld a, $a8
    ld [$db5b], a
    ld [$db5c], a
    ld [$db5d], a
    ld [$db5e], a
    ld [$db5f], a
    ld [$db60], a
    ld hl, $583e
    ld a, l
    ld [$db61], a
    ld a, h
    ld [$db62], a
    ld hl, $5841
    ld a, l
    ld [$db63], a
    ld a, h
    ld [$db64], a
    ld hl, $5844
    ld a, l
    ld [$db65], a
    ld a, h
    ld [$db66], a
    ld hl, $5847
    ld a, l
    ld [$db67], a
    ld a, h
    ld [$db68], a
    ld hl, $584a
    ld a, l
    ld [$db69], a
    ld a, h
    ld [$db6a], a
    ld hl, $584d
    ld a, l
    ld [$db6b], a
    ld a, h
    ld [$db6c], a
    ld a, $01
    ld [$db6d], a
    ret


    ld b, b
    sbc b
    nop
    ld a, [bc]
    jr nz, @+$22

    jr nz, jr_001_6ecf

    ld b, l
    ld c, h
    ld c, c
    ld b, e
    ld c, c
    ld d, h
    ld b, c
    ld d, h
    ld c, c
    ld c, a
    ld c, [hl]
    ld d, e
    jr nz, jr_001_6eb7

    jr nz, jr_001_6eb9

    rst $38

Call_001_6e9a:
    ld b, a
    xor a
    ld de, $0004

jr_001_6e9f:
    ld [hl], a
    add hl, de
    dec b
    jr nz, jr_001_6e9f

    ret


    ld hl, $c200
    ld de, $7b0c
    ld b, $09

jr_001_6ead:
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]

jr_001_6eb7:
    inc de
    ld [hl+], a

jr_001_6eb9:
    dec b
    jr nz, jr_001_6ead

    ld a, $01
    ld [$c2b4], a
    dec a
    ld [$c2b5], a
    ld [$db70], a
    ld de, $c2b9
    ld a, e
    ld [$c2b6], a

jr_001_6ecf:
    ld a, d
    ld [$c2b7], a
    ret


    ld hl, $c204
    ld a, [$c2b4]
    call Call_001_6e9a
    ld a, [$d76b]
    or a
    jr z, jr_001_6ee8

    ld hl, $c200
    jr jr_001_6f66

jr_001_6ee8:
    ld hl, $c204
    ld a, [$c201]
    add $08
    ld b, a
    ld a, [$ff90]
    or a
    jr nz, jr_001_6efe

    ld de, $7b30
    ld c, $03
    jr jr_001_6f03

jr_001_6efe:
    ld de, $7b36
    ld c, $04

jr_001_6f03:
    ld a, $98
    ld [hl+], a
    ld a, b
    ld [hl+], a
    add $08
    ld b, a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_001_6f03

    ld de, $7b3e
    ld a, [$dc3d]
    or a
    jr z, jr_001_6f20

    ld de, $7b46

jr_001_6f20:
    ld a, [$d8a8]
    or a
    jr nz, jr_001_6f2f

    ld a, [$d763]
    or a
    jr z, jr_001_6f2f

    ld de, $7b4e

jr_001_6f2f:
    ld a, [$d764]
    cp $20
    jr z, jr_001_6f3a

    ld a, $01
    jr jr_001_6f3b

jr_001_6f3a:
    xor a

jr_001_6f3b:
    ld [$ff90], a
    ld c, $04
    ld a, [$c201]
    sub $08
    ld b, a

jr_001_6f46:
    ld a, [$ff90]
    or a
    jr z, jr_001_6f55

    ld a, c
    cp $02
    jr nz, jr_001_6f55

    ld a, b
    add $08
    ld b, a

jr_001_6f55:
    ld a, $90
    ld [hl+], a
    ld a, b
    ld [hl+], a
    add $08
    ld b, a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_001_6f46

jr_001_6f66:
    ld a, [$c2b5]
    or a
    jr z, jr_001_6f87

    ld c, a
    ld de, $c2b9
    ld a, e
    ld [$c2b6], a
    ld a, d
    ld [$c2b7], a

jr_001_6f78:
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_001_6f78

jr_001_6f87:
    ld a, [$d76e]
    or a
    jr z, jr_001_6f99

    ld a, [$c2b8]
    inc a
    cp $03
    jr nz, jr_001_6f96

    xor a

jr_001_6f96:
    ld [$c2b8], a

jr_001_6f99:
    ld a, [$d77c]
    or a
    jr z, jr_001_6fdb

    ld de, $d77d
    ld c, a

jr_001_6fa3:
    inc de
    ld a, [de]
    inc de
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    ld [hl+], a
    inc de
    inc de
    inc de
    ld a, [$d76e]
    or a
    jr z, jr_001_6fd4

    ld a, [$c2b8]
    or a
    jr nz, jr_001_6fbf

    ld a, $13
    ld [hl+], a
    jr jr_001_6fcf

jr_001_6fbf:
    cp $01
    jr nz, jr_001_6fc8

    ld a, $14
    ld [hl+], a
    jr jr_001_6fcf

jr_001_6fc8:
    cp $02
    jr nz, jr_001_6fcf

    ld a, $15
    ld [hl+], a

jr_001_6fcf:
    ld a, $0d
    ld [hl+], a
    jr jr_001_6fd8

jr_001_6fd4:
    ld [hl+], a
    ld a, $03
    ld [hl+], a

jr_001_6fd8:
    dec c
    jr nz, jr_001_6fa3

jr_001_6fdb:
    ld de, $db71
    ld a, $08
    ld [$ff8d], a

jr_001_6fe3:
    ld a, [de]
    or a
    jr z, jr_001_7028

    inc de
    ld a, [de]
    inc de
    ld b, a
    ld [hl+], a
    ld a, [de]
    inc de
    ld c, a
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, c
    add $08
    ld c, a
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, b
    add $08
    ld b, a
    ld [hl+], a
    ld a, c
    ld c, a
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, c
    sub $08
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [$db70]
    add $04
    ld [$db70], a
    jr jr_001_702f

jr_001_7028:
    ld a, e
    add $0c
    ld e, a
    jr nc, jr_001_702f

    inc d

jr_001_702f:
    ld a, [$ff8d]
    dec a
    ld [$ff8d], a
    jr nz, jr_001_6fe3

    ld b, $08
    ld a, [$ff90]
    or a
    jr z, jr_001_7041

    inc b

jr_001_7041:
    ld a, [$d77c]
    add b
    ld b, a
    ld a, [$db70]
    add b
    ld b, a
    ld a, [$c2b5]
    add b
    ld [$c2b4], a
    xor a
    ld [$c2b5], a
    ld [$db70], a
    ret


    db $ee, $41, $46, $42, $57, $42, $24, $42, $35, $42, $11, $42, $23, $66, $a7, $42
    db $10, $43, $79, $43, $e2, $43, $4b, $44, $b4, $44, $1d, $45, $86, $45, $ef, $45
    db $58, $46, $c1, $46, $2a, $47, $93, $47, $fc, $47, $65, $48, $02, $58, $c2, $73
    db $45, $74, $a6, $4d, $2a, $dd, $3f, $dd, $6c, $99, $8d, $99, $1d, $13, $00, $18
    db $19, $00, $4c, $10, $08, $fd, $41, $ec, $98, $eb, $6b, $b7, $48, $53, $49, $54
    db $6c

    db $86, $40, $de, $40, $ee, $40, $bc, $40, $cd, $40, $a9, $40, $61, $64, $68, $42
    db $d1, $42, $3a, $43, $a3, $43, $0c, $44, $75, $44, $de, $44, $47, $45, $b0, $45
    db $19, $46, $82, $46, $eb, $46, $54, $47, $bd, $47, $26, $48, $c2, $57, $46, $73
    db $e1, $73, $ae, $4c, $2a, $dd, $3f, $dd, $6d, $99, $8c, $99, $19, $18, $00, $19
    db $10, $10, $4c, $0b, $08, $95, $40, $eb, $98, $8b, $6b, $8f, $48, $f0, $48, $03
    db $6c

    db $0e, $40, $66, $40, $76, $40, $44, $40, $55, $40, $31, $40, $b9, $66, $bc, $42
    db $25, $43, $8e, $43, $f7, $43, $60, $44, $c9, $44, $32, $45, $9b, $45, $04, $46
    db $6d, $46, $d6, $46, $3f, $47, $a8, $47, $11, $48, $7a, $48, $f2, $57, $84, $73
    db $13, $74, $2a, $4d, $2b, $dd, $43, $dd, $6d, $99, $8b, $99, $1d, $b9, $00, $18
    db $19, $00, $4e, $12, $0b, $1d, $40, $ed, $98, $d3, $6b, $a3, $48, $22, $49, $39
    db $6c

    db $fe, $40, $56, $41, $66, $41, $45, $41, $34, $41, $21, $41, $f7, $64, $7d, $42
    db $e6, $42, $4f, $43, $b8, $43, $21, $44, $8a, $44, $f3, $44, $5c, $45, $c5, $45
    db $2e, $46, $97, $46, $00, $47, $69, $47, $d2, $47, $3b, $48, $d2, $57, $65, $73
    db $fa, $73, $ec, $4c, $2c, $dd, $3f, $dd, $6c, $99, $8c, $99, $19, $1f, $13, $18
    db $19, $18, $45, $11, $09, $0d, $41, $ec, $98, $a3, $6b, $99, $48, $09, $49, $1e
    db $6c

    db $76, $41, $ce, $41, $de, $41, $ac, $41, $bd, $41, $99, $41, $8d, $65, $92, $42
    db $fb, $42, $64, $43, $cd, $43, $36, $44, $9f, $44, $08, $45, $71, $45, $da, $45
    db $43, $46, $ac, $46, $15, $47, $7e, $47, $e7, $47, $50, $48, $e2, $57, $a3, $73
    db $2c, $74, $68, $4d, $2a, $dd, $3f, $dd, $6c, $99, $8a, $99, $0b, $18, $00, $0b
    db $1f, $1d, $4c, $13, $08, $85, $41, $ed, $98, $bb, $6b, $ad, $48, $3a, $49, $6f
    db $6c

    ld hl, $dae3
    ld de, $7592
    ld b, $0a

jr_001_71f7:
    ld a, [de]
    inc de
    ld [hl+], a
    dec b
    jr nz, jr_001_71f7

    ld de, $75ba
    ld hl, $daed
    ld b, $0a

jr_001_7205:
    ld a, [de]
    inc de
    ld [hl+], a
    dec b
    jr nz, jr_001_7205

    ld hl, $daf7
    ld de, $74b4
    ld b, $0b

jr_001_7213:
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    dec b
    jr nz, jr_001_7213

    ld hl, $749b
    ld a, l
    ld [$db4f], a
    ld a, h
    ld [$db50], a
    ret


    ld hl, $c200
    ld de, $7542
    ld a, $05
    ld bc, $dae3

jr_001_7243:
    push af
    push bc
    ld a, [bc]
    inc bc
    push af
    ld a, [bc]
    ld b, a
    pop af
    ld c, a
    ld a, $04

jr_001_724e:
    push af
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
    pop af
    dec a
    jr nz, jr_001_724e

    pop bc
    inc bc
    inc bc
    pop af
    dec a
    jr nz, jr_001_7243

    ld de, $dae3
    ld hl, $daed
    ld a, $05

jr_001_7270:
    push af
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    ld b, a
    ld a, [bc]
    or a
    jr nz, jr_001_727d

    ld bc, $75af
    ld a, [bc]

jr_001_727d:
    inc bc
    push af
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    pop af
    inc de
    ld c, a
    ld a, [de]
    add c
    ld [de], a
    inc de
    pop af
    dec a
    jr nz, jr_001_7270

    ld a, [$ff9e]
    or a
    jr z, jr_001_72ae

    ld a, [$db4f]
    ld l, a
    ld a, [$db50]
    ld h, a
    ld a, [hl+]
    ld b, a
    ld a, l
    ld [$db4f], a
    ld a, h
    ld [$db50], a
    ld a, [$ff9e]
    add b
    ld [$ff9e], a
    ret


jr_001_72ae:
    ld a, $14
    ld hl, $c250
    call Call_001_6e9a
    ld a, [$ff8f]
    inc a
    ld [$ff8f], a
    ld a, $0b
    ld hl, $daf7
    ld de, $c250

jr_001_72c5:
    push af
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    or c
    jr z, jr_001_72da

    dec bc
    dec hl
    dec hl
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld bc, $0007
    add hl, bc
    jr jr_001_7341

jr_001_72da:
    ld b, [hl]
    ld a, [$ff8f]
    and $03
    jr nz, jr_001_72e3

    inc b

jr_001_72e3:
    ld a, b
    cp $0b
    jr nz, jr_001_7305

    ld a, $00
    ld [hl+], a
    ld bc, $0002
    add hl, bc
    ld a, [$ff8c]
    and $07
    ld [hl+], a
    push de
    ld a, [hl+]
    ld d, [hl]
    ld bc, $fff9
    add hl, bc
    ld [hl+], a
    ld [hl], d
    ld bc, $0007
    add hl, bc
    pop de
    jr jr_001_7341

jr_001_7305:
    ld [hl+], a
    ld [$ff8e], a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    push hl
    push af
    push de
    ld a, [$ff8e]
    add a
    ld l, a
    ld h, $00
    ld de, $752c
    add hl, de
    pop de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, $02
    ld [$ff8d], a

jr_001_7325:
    ld a, [hl+]
    add b
    ld [de], a
    inc de
    ld a, [hl+]
    add c
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    pop af
    ld [de], a
    inc de
    push af
    ld a, [$ff8d]
    dec a
    ld [$ff8d], a
    jr nz, jr_001_7325

    pop af
    pop hl
    inc hl
    inc hl

jr_001_7341:
    pop af
    dec a
    jr nz, jr_001_72c5

    ret


    db $00, $98, $00, $04, $53, $43, $4f, $52, $45, $20, $00, $01, $30, $30, $30, $30
    db $30, $30, $20, $00, $04, $4c, $49, $56, $45, $53, $20, $00, $01, $30, $ff

    db $00, $98, $00, $04, $53, $43, $4f, $52, $45, $20, $00, $01, $30, $30, $30, $30
    db $30, $30, $20, $00, $04, $20, $56, $49, $45, $53, $20, $00, $01, $30, $ff

    db $00, $98, $00, $04, $ae, $af, $b0, $b1, $b2, $20, $00, $01, $30, $30, $30, $30
    db $30, $30, $20, $00, $04, $56, $49, $44, $41, $53, $20, $00, $01, $30, $ff

    db $00, $98, $00, $04, $ae, $af, $b3, $b4, $b5, $20, $00, $01, $30, $30, $30, $30
    db $30, $30, $20, $00, $04, $4c, $45, $42, $45, $4e, $20, $00, $01, $30, $ff

    db $00, $98, $00, $04, $53, $43, $4f, $52, $45, $20, $00, $01, $30, $30, $30, $30
    db $30, $30, $20, $00, $04, $20, $56, $49, $54, $45, $20, $00, $01, $30, $ff

    db $01, $98, $00, $04, $20, $20, $20, $20, $20, $4c, $45, $56, $45, $4c, $20, $00
    db $01, $30, $30, $30, $20, $20, $20, $20, $ff

    db $01, $98, $00, $04, $20, $20, $20, $20, $20, $45, $54, $41, $47, $45, $20, $00
    db $01, $30, $30, $30, $20, $20, $20, $20, $ff

    db $01, $98, $00, $04, $20, $20, $20, $20, $20, $4e, $49, $56, $45, $4c, $20, $00
    db $01, $30, $30, $30, $20, $20, $20, $20, $ff

    db $01, $98, $00, $04, $20, $20, $20, $20, $20, $4c, $45, $56, $45, $4c, $20, $00
    db $01, $30, $30, $30, $20, $20, $20, $20, $ff

    db $01, $98, $00, $04, $20, $20, $20, $20, $4c, $45, $56, $45, $4c, $4c, $4f, $20
    db $00, $01, $30, $30, $30, $20, $20, $20, $ff

    db $00, $98, $00, $04, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $ff, $06, $08, $0a, $0a, $0a, $43, $44
    db $45, $0a, $0a, $0a, $0a, $43, $44, $45, $0a, $0a, $0a, $08, $07, $0b, $0c, $2f
    db $49, $0c, $0c, $0d, $0e, $0c, $0c, $31, $37, $0c, $2e, $2f, $30

    db $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8
    db $f8, $f9, $04, $04, $fd, $fd, $fe, $ff

    nop

    db $01, $00, $82, $79, $c8, $00, $0a, $00, $51, $81, $c9, $00, $14, $00, $70, $38
    db $cb, $00, $1e, $00, $18, $50, $cc, $00, $64, $00, $0a, $3a, $cd, $00, $6e, $00
    db $8e, $35, $ce, $00, $78, $00, $51, $40, $cf, $00, $b4, $00, $40, $57, $d0, $00
    db $be, $00, $94, $6a, $d1, $00, $c8, $00, $18, $73, $d2, $00, $d3, $00, $2c, $8a
    db $d3, $00, $00, $00, $28, $00, $08, $2a, $00, $00, $2c, $00, $08, $2e, $00, $00
    db $30, $00, $08, $32, $00, $00, $34, $00, $08, $36, $00, $00, $38, $00, $08, $3a
    db $00, $00, $3c, $00, $08, $3e, $00, $00, $40, $00, $08, $42, $00, $00, $44, $00
    db $08, $46, $00, $00, $48, $00, $08, $4a, $f6, $74, $fc, $74, $02, $75, $08, $75
    db $0e, $75, $14, $75, $1a, $75, $20, $75, $26, $75, $fc, $74, $f6, $74, $00, $00
    db $00, $01, $00, $08, $02, $01, $10, $00, $14, $00, $10, $08, $16, $00, $00, $00
    db $04, $01, $00, $08, $06, $01, $10, $00, $18, $00, $10, $08, $1a, $00, $00, $00
    db $08, $01, $00, $08, $0a, $01, $10, $00, $1c, $00, $10, $08, $1e, $00, $00, $00
    db $0c, $01, $00, $08, $0e, $01, $10, $00, $20, $00, $10, $08, $22, $00, $00, $00
    db $10, $01, $00, $08, $12, $01, $10, $00, $24, $00, $10, $08, $26, $00, $90, $a4
    db $90, $a4, $90, $a4, $90, $a4, $90, $a4, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $fe, $fe, $fe, $ff, $ff
    db $01, $01, $02, $02, $02, $00, $a4, $75, $a2, $75, $a0, $75, $9e, $75, $9c, $75

    ld hl, $7ba0
    jr jr_001_75cc

    ld hl, $7bbc

jr_001_75cc:
    ld a, [$ff9f]
    add a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


Call_001_75d8:
    jp hl


Jump_001_75d9:
    ld b, $ff
    ld a, $20
    call Call_001_6838
    ld a, [$ff9c]
    cp $04
    jr nz, jr_001_75fc

    ld a, $02
    ld [$ff9c], a
    ld a, $03
    ldh [rIE], a
    ld b, $ff
    ld a, $20
    call Call_001_68d1
    ld a, $04
    ld [$ff9c], a

jr_001_75fc:
    ld a, [$ff9c]
    cp $03
    jr nz, jr_001_7615

    ld a, $82
    ldh [rOCPS], a
    ld a, $03
    ldh [rIE], a
    ld d, $04
    call Call_001_7929
    ld a, $02
    ld [$cb53], a

jr_001_7615:
    call Call_001_63fa

jr_001_7618:
    call Call_001_7c54
    call Call_000_3e7f
    ld a, [$ffa3]
    ld l, a
    ld a, [$ffa4]
    ld h, a
    call Call_001_75d8
    ld a, [$ffa0]
    or a
    jr z, jr_001_7618

    dec a
    ld [$ffa0], a
    jr nz, jr_001_7618

    ld e, $00
    call Call_000_3e56
    xor a
    call Call_000_3e64
    ld a, $09

jr_001_7640:
    push af
    call Call_001_7c54
    call Call_000_3e7f
    pop af
    dec a
    jr nz, jr_001_7640

    ld a, [$ff9c]
    cp $03
    jr nz, jr_001_7665

    ld [$cb53], a
    ld d, $fc
    call Call_001_7929
    call Call_001_7c54
    ld a, $01
    ldh [rIE], a
    xor a
    ld [$ff9c], a

jr_001_7665:
    ld a, [$ff9c]
    cp $04
    jr nz, jr_001_7680

    ld a, $02
    ld [$ff9c], a
    ld b, $01
    xor a
    call Call_001_68d1
    ld a, $01
    ldh [rIE], a
    ld a, $04
    ld [$ff9c], a

jr_001_7680:
    ld b, $01
    xor a
    call Call_001_6838
    ret


Jump_001_7687:
    ld a, l
    ld [$ffa3], a
    ld a, h
    ld [$ffa4], a
    jp Jump_001_75d9


    ld hl, $0f30
    jp Jump_001_7687


    ld hl, $2665
    jp Jump_001_7687


    ld hl, $7bd8
    jp Jump_001_7687


    ld hl, $7c03
    jp Jump_001_7687


    ld hl, $7c92
    jp Jump_001_7687


    ld hl, $3ad8
    jp Jump_001_7687


    ld hl, $06da
    jp Jump_001_7687


    ld hl, $20fa
    jp Jump_001_7687


    ld hl, $7a5e
    jp Jump_001_7687


    ld hl, $5c66
    jp Jump_001_7687


    ld hl, $7ca8
    jp Jump_001_7687


    ld hl, $6a5b
    jp Jump_001_7687


    ld hl, $3eed
    jp Jump_001_7687


    ld hl, $7c74
    jp Jump_001_7687


    db $d4, $51

    db $0a, $52

    ld d, [hl]
    ld d, d

    db $89, $52

    and b
    ld d, d
    push de
    ld d, d

    db $09, $53

    db $2d, $53

    ld c, b
    ld d, e
    ld a, b
    ld d, e
    sbc h
    ld d, e

    db $b5, $53

    ret z

    ld d, e

    db $f9, $53, $23, $54

    dec [hl]
    ld d, h

    db $80, $00

    db $80, $00

    add b
    nop

    db $80, $00

    add b
    nop
    add b
    nop

    db $80, $00

    db $80, $00

    add b
    nop
    add b
    nop
    add b
    nop

    db $80, $00

    add b
    nop

    db $80, $00, $80, $00

    add b
    nop

    db $46, $77

    db $4e, $77

    ld d, [hl]
    ld [hl], a

    db $5e, $77

    ld h, [hl]
    ld [hl], a
    ld l, [hl]
    ld [hl], a

    db $76, $77

    db $7e, $77

    add [hl]
    ld [hl], a
    adc [hl]
    ld [hl], a
    sub [hl]
    ld [hl], a

    db $9e, $77

    and [hl]
    ld [hl], a

    db $ae, $77, $b6, $77

    cp [hl]
    ld [hl], a

    db $22, $06, $23, $06, $25, $06, $24, $06

    db $08, $0e, $09, $0e, $0b, $0e, $0a, $0e

    ld a, [hl+]
    nop
    dec hl
    nop
    dec l
    nop
    inc l
    nop

    db $2e, $05, $2f, $05, $31, $05, $30, $05

    ld [hl-], a
    ld b, $33
    ld b, $35
    ld b, $34
    ld b, $36
    ld bc, $0137
    add hl, sp
    ld bc, $0138

    db $3a, $01, $3b, $01, $3d, $01, $3c, $01

    db $3e, $07, $3f, $07, $41, $07, $40, $07

    ld b, d
    ld b, $43
    ld b, $45
    ld b, $44
    ld b, $46
    ld b, $47
    ld b, $49
    ld b, $48
    ld b, $7b
    ld b, $7c
    ld b, $7e
    ld b, $7d
    db $06

    db $26, $04, $28, $04, $29, $04, $27, $04

    ld [hl], a
    ld bc, $0178
    ld a, d
    ld bc, $0179

    db $04, $0a, $05, $0a, $07, $0a, $06, $0a, $00, $09, $02, $09, $03, $09, $01, $09

    inc c
    add hl, bc
    dec c
    add hl, bc
    rrca
    add hl, bc
    ld c, $09

    xor a
    ld [$cce7], a
    ld a, $01
    ldh [rVBK], a
    ld hl, $9841
    ld de, $ccfb
    ld b, $10

Jump_001_77d6:
    ld c, $09

Jump_001_77d8:
    ld a, [de]
    or a
    jr z, jr_001_783a

    push af
    swap a
    and $07
    ld [hl+], a
    ld [hl], a
    pop af
    and $0f
    ld [de], a
    cp $0e
    jr nz, jr_001_780f

    xor a
    ldh [rVBK], a
    dec l
    ld [hl], $4c
    inc l
    ld [hl], $4d
    dec l
    ld a, b
    cp $10
    jr z, jr_001_7803

    ld a, c
    cp $09
    jr nz, jr_001_7809

    ld [hl], $51
    jr jr_001_7809

jr_001_7803:
    ld [hl], $51
    inc l
    ld [hl], $52
    dec l

jr_001_7809:
    ld a, $01
    ldh [rVBK], a
    jr jr_001_787f

jr_001_780f:
    ld a, [$cce7]
    inc a
    ld [$cce7], a
    dec l
    xor a
    ldh [rVBK], a
    ld [hl], $27
    inc l
    ld [hl], $28
    dec l
    ld a, b
    cp $10
    jr z, jr_001_782e

    ld a, c
    cp $09
    jr nz, jr_001_7834

    ld [hl], $29
    jr jr_001_7834

jr_001_782e:
    ld [hl], $29
    inc l
    ld [hl], $2a
    dec l

jr_001_7834:
    ld a, $01
    ldh [rVBK], a
    jr jr_001_787f

jr_001_783a:
    xor a
    ldh [rVBK], a
    push hl
    ld hl, $ffdf
    add hl, de
    ld a, [hl]
    pop hl
    cp $0f
    jr z, jr_001_7852

    push hl
    ld hl, $ffef
    add hl, de
    ld a, [hl]
    pop hl
    or a
    jr z, jr_001_785b

jr_001_7852:
    ld a, $01
    ldh [rVBK], a
    ld [hl], $0a
    xor a
    ldh [rVBK], a

jr_001_785b:
    push hl
    ld hl, $ffdf
    add hl, de
    ld a, [hl]
    pop hl
    cp $0f
    jr z, jr_001_7870

    push hl
    ld hl, $fff0
    add hl, de
    ld a, [hl]
    pop hl
    or a
    jr z, jr_001_787b

jr_001_7870:
    inc hl
    ld a, $01
    ldh [rVBK], a
    ld [hl], $0a
    dec hl
    xor a
    ldh [rVBK], a

jr_001_787b:
    ld a, $01
    ldh [rVBK], a

jr_001_787f:
    inc de
    inc l
    inc l
    dec c
    jp nz, Jump_001_77d8

    ld a, l
    add $0e
    ld l, a
    jr nc, jr_001_788d

    inc h

jr_001_788d:
    ld a, e
    add $07
    ld e, a
    jr nc, jr_001_7894

    inc d

jr_001_7894:
    dec b
    jp nz, Jump_001_77d6

    ret


    ld a, [$cb58]
    inc a
    ld [$cb58], a
    cp $03
    ret nz

    xor a
    ld [$cb58], a
    ld a, [$cb56]
    ld l, a
    ld a, [$cb57]
    ld h, a
    ld a, [hl]
    cp $01
    jr nz, jr_001_78b7

    ld hl, $79b8

jr_001_78b7:
    ld a, [hl+]
    ld [$cb54], a
    ld a, [hl+]
    ld [$cb55], a
    ld a, l
    ld [$cb56], a
    ld a, h
    ld [$cb57], a
    ret


    ld b, $14
    ld hl, $c200
    ld de, $7990

jr_001_78d0:
    ld a, [de]
    inc de
    ld [hl+], a
    push af
    ld a, [de]
    inc de
    ld [hl+], a
    ld c, a
    xor a
    ld [hl+], a
    ld [hl+], a
    pop af
    ld [hl+], a
    ld a, $08
    add c
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    dec b
    jr nz, jr_001_78d0

    ld b, $04
    ld hl, $cccf
    xor a

jr_001_78ed:
    ld c, $05
    push af

jr_001_78f0:
    ld [hl+], a
    add $04
    dec c
    jr nz, jr_001_78f0

    pop af
    add $04
    dec b
    jr nz, jr_001_78ed

    ret


Call_001_78fd:
    ld a, $14
    ld de, $cccf
    ld hl, $c202
    ld bc, $0004

jr_001_7908:
    push af
    ld a, [de]
    inc a
    and $1f
    ld [de], a
    inc de
    push de
    push hl
    add a
    ld l, a
    ld h, $00
    ld de, $7950
    add hl, de
    ld d, h
    ld e, l
    pop hl
    ld a, [de]
    inc de
    ld [hl], a
    add hl, bc
    ld a, [de]
    ld [hl], a
    add hl, bc
    pop de
    pop af
    dec a
    jr nz, jr_001_7908

    ret


Call_001_7929:
    ld a, $20

jr_001_792b:
    push af
    call Call_001_7c54
    push de
    call Call_001_78fd
    pop de
    ld hl, $c201
    ld c, $04

jr_001_7939:
    ld b, $0a

jr_001_793b:
    ld a, [hl]
    add d
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    dec b
    jr nz, jr_001_793b

    ld a, d
    cpl
    inc a
    ld d, a
    dec c
    jr nz, jr_001_7939

    pop af
    dec a
    jr nz, jr_001_792b

    ret


    db $00, $02, $00, $02, $04, $06, $04, $06, $08, $0a, $08, $0a, $0c, $0e, $0c, $0e
    db $10, $12, $10, $12, $14, $16, $14, $16, $18, $1a, $18, $1a, $1c, $1e, $1c, $1e
    db $20, $22, $20, $22, $24, $26, $24, $26, $28, $2a, $28, $2a, $2c, $2e, $2c, $2e
    db $30, $32, $30, $32, $34, $36, $34, $36, $38, $3a, $38, $3a, $3c, $3e, $3c, $3e
    db $37, $a6, $37, $ba, $37, $ce, $37, $e2, $37, $f6, $4f, $a6, $4f, $ba, $4f, $ce
    db $4f, $e2, $4f, $f6, $67, $a6, $67, $ba, $67, $ce, $67, $e2, $67, $f6, $7f, $a6
    db $7f, $ba, $7f, $ce, $7f, $e2, $7f, $f6, $00, $40, $60, $43, $c0, $46, $20, $4a
    db $80, $4d, $e0, $50, $40, $54, $a0, $57, $00, $5b, $60, $5e, $c0, $61, $20, $65
    db $80, $68, $e0, $6b, $40, $6f, $a0, $72, $00, $76, $60, $79, $01

    nop

    db $0a, $1d

    ld de, $181d
    dec e
    rra
    dec e
    inc hl
    dec e
    ld a, [hl+]
    dec e

    db $31, $1d

    jr c, jr_001_7a0b

    db $3c, $1d

    ld b, e
    dec e

    db $4a, $1d

    db $51, $1d

    db $55, $1d

    ld e, h
    dec e

    db $63, $1d

    ld l, d
    dec e
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

jr_001_7a0b:
    nop
    nop
    nop

    db $6e, $1d

    ld e, h
    dec e
    ld [hl], l
    dec e
    ld l, d
    dec e

    db $6e, $1d, $5c, $1d

    ld [hl], l
    dec e
    ld l, d
    dec e
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
    nop
    nop
    nop
    nop
    nop
    nop

    db $6a, $1d

    db $6a, $1d

    db $75, $1d

    ld l, d
    dec e

    ld hl, $dcf4
    ld a, [hl]
    inc a
    ret z

    ld [hl], $ff
    cp $ff
    jr z, jr_001_7a6e

    dec a
    ld [$c954], a

jr_001_7a6e:
    ld a, [$dcf7]
    inc a
    ld [$dcf7], a
    ld de, $c3be
    ld hl, $c3c8
    ld b, $8f

jr_001_7a7d:
    ld a, [hl]
    ld [de], a
    ld a, l
    add $0a
    ld l, a
    jr nc, jr_001_7a86

    inc h

jr_001_7a86:
    ld a, e
    add $0a
    ld e, a
    jr nc, jr_001_7a8d

    inc d

jr_001_7a8d:
    dec b
    jr nz, jr_001_7a7d

    xor a
    ld [$dcf5], a
    ld a, [$ff9f]
    cp $01
    ret z

    ld a, [$ff8a]
    and $f0
    or a
    jr z, jr_001_7ab6

    ld a, $ff
    ld [$dcf5], a
    ld a, $01
    ld [$ff9f], a
    ld a, $28
    ld [$ffa0], a
    ld a, $1a
    call Call_000_3e64

jr_001_7ab6:
    ret

GBC_Check:
    ; RAM test
    xor a                       ; switch WRAM1 to Bank 0
    ldh [rSVBK], a
    xor a                       ; store 0 to first byte of WRAM1
    ld [$d000], a
    ld a, $02                   ; switch WRAM to Bank 2
    ldh [rSVBK], a
    ld [$d000], a               ; Store value $02 to the first byte of WRAM1 Bank 2
    xor a                       ; switch WRAM1 back to Bank 0
    ldh [rSVBK], a
    ld a, [$d000]               ; Read value from first byte of WRAM1
    or a                        ; Bitwise OR with itself, Zero flag should be set. LD instruction doesn't change register flags in Z80...
    jr z, .RAMCheckPass         ; RAM check passed, WRAM bank switching works so this is a GBC with a MBC

    ; RAM check failed, this might not be a GBC or wrong hardware
    ld a, $0a
    push af                 ; Push A = 0A to stack
    jr .NotGBC

.RAMCheckPass:
    push af                 ; If check passed, A should be 00.
    ldh a, [rKEY1]          ; get CPU speed
    bit 7, a                ; check for bit 7
    jr nz, .SoftReset       ; if bit 7 is set, that means CPU is already at double speed. Probably a soft reset.

    ld a, $01               ; otherwise, prepare CPU for double speed
    ldh [rKEY1], a
    ld a, P1F_GET_NONE      ; You need to read the controller before doubling CPU speed, yeah weird.
    ldh [rP1], a
    stop                    ; Double CPU speed.

.NotGBC:
.SoftReset:
    xor a                   ; Zero out A register
    ldh [rSCY], a           ; Reset scroll
    ldh [rSCX], a
    ; Clear WRAM (except stack around $C100-$C1FD)
    ld bc, $1e00
    call ClearRAM

    ; Clear part of start of WRAM0
    ld bc, $0068
    ld hl, $c000
    call ClearRAM
    
    ; Clear HRAM 
    ld hl, $ff80
    ld bc, $007f
    call ClearRAM
    call LoadOAMCode            ; Load OAM DMA code
    call LoadHighScores         ; Load High Scores info
    pop af                      ; Get RAM Check info back to A
    ld [$ff9f], a               ; Store to RAM
    ret                         ; return


    db $98, $50, $1e, $02, $98, $58, $1f, $02, $98, $60, $20, $02, $98, $68, $21, $02
    db $90, $48, $56, $02, $90, $50, $57, $02, $90, $58, $57, $22, $90, $60, $56, $22
    db $89, $54, $00, $03, $1f, $02, $20, $02, $21, $02, $1f, $02, $20, $02, $20, $02
    db $21, $02

    db $56, $02, $57, $02, $57, $22, $56, $22, $56, $02, $08, $01, $08, $21, $56, $22

    ld d, [hl]
    ld [bc], a
    rlca
    ld bc, $2107
    ld d, [hl]
    ld [hl+], a
    ld h, d
    ld h, d
    ld h, d
    ld h, c
    ld h, c
    ld h, c
    ld h, b
    ld h, b
    ld h, b
    ld e, a
    ld e, a
    ld e, a
    ld e, [hl]
    ld e, [hl]
    ld e, [hl]
    ld e, l
    ld e, l
    ld e, l

    db $58, $58, $58, $58, $59, $59, $59, $59, $5a, $5a

    db $5a, $5a, $5b, $5b, $5b, $5b, $5a, $5a, $5a, $5a, $59, $59, $59, $59, $58, $58
    db $58, $58

    db $11

    db $13

    dec d
    rla
    add hl, de
    dec de

    db $01, $02, $03, $04, $05, $06, $07, $08, $09, $09, $09, $09, $09, $08, $07, $06
    db $05, $04, $03, $02, $01, $ff

    db $8d, $3e, $7b, $1f

    inc bc
    dec bc
    add a
    db $26

    db $59, $39

    db $4f, $25, $ed, $39, $d9, $05, $ee, $3a

    ld b, l
    inc a
    and [hl]
    nop

    db $ee, $3d, $6c, $3a

    inc bc
    ccf

    db $da, $76, $bc, $76, $92, $76

    sbc [hl]
    db $76

    db $a4, $76

    db $98, $76, $aa, $76, $b6, $76, $c2, $76

    ret z

    db $76
    adc $76

    db $d4, $76, $b0, $76

    ldh [rPCM12], a

    ld a, [$ff9f]
    cp $07
    ret z

    ld a, [$ff8a]
    and $f0
    or a
    jr z, jr_001_7c02

    ld a, $07
    ld [$ff9f], a
    ld a, $28
    ld [$ffa0], a
    ld a, $05
    ld [$ccb6], a
    ld a, $ff
    ld [$ccb7], a
    call Call_000_08c8
    ld a, $1a
    call Call_000_3e64

jr_001_7c02:
    ret


    ld a, [$ff9f]
    cp $02
    ret z

    ld a, [$ff8a]
    bit 7, a
    jr z, jr_001_7c2c

    ld a, $02
    ld [$ff9f], a
    ld a, $28
    ld [$ffa0], a
    xor a
    ld [$ff8a], a
    ld [$ff8b], a
    ld [$d75f], a
    ld [$d760], a
    ld a, $1a
    call Call_000_3e64

jr_001_7c2c:
    ret


    ld hl, $d8ad
    ld a, $01
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ret


Call_001_7c39:
    ld c, b
    ld b, $00

Call_001_7c3c:
jr_001_7c3c:
    ld a, $0b
    ld hl, $d8b2

jr_001_7c41:
    inc [hl]
    cp [hl]
    jr nz, jr_001_7c4a

    ld [hl], $01
    dec hl
    jr jr_001_7c41

jr_001_7c4a:
    xor a
    ld [$d8ad], a
    dec bc
    ld a, b
    or c
    jr nz, jr_001_7c3c

    ret


Call_001_7c54:
    call Call_000_0223
    ld a, [$ff9f]
    or a
    jr z, jr_001_7c67

    ld a, [$ff8a]
    and $f0
    cp $f0
    jp z, Boot

jr_001_7c67:
    halt
    nop
    ld a, [$ff95]
    or a
    jr z, jr_001_7c67

    xor a
    ld [$ff95], a
    ret


    ld a, [$ff9f]
    cp $02
    ret z

    ld a, [$ff8a]
    and $f0
    or a
    jr z, jr_001_7c91

    ld a, $02
    ld [$ff9f], a
    ld a, $28
    ld [$ffa0], a
    ld a, $1a
    call Call_000_3e64

jr_001_7c91:
    ret


    ld a, [$ff91]
    or a
    jr z, jr_001_7c9d

    dec a
    ld [$ff91], a
    ret


jr_001_7c9d:
    ld a, $0b
    ld [$ff9f], a
    ld a, $01
    ld [$ffa0], a
    ret


jr_001_7ca8:
    jr jr_001_7ca8

    ld bc, $0090
    call DataTransfer
    ld hl, $5574
    ld de, $8000
    ld bc, $0010
    call DataTransfer
    ld a, $26
    ld de, $9800
    ld hl, $5614
    ld b, $14
    ld c, $12
    call Call_000_01d4
    ld hl, $4ca8
    ld de, $dd03
    ld bc, $0006
    call DataTransfer
    ld a, [$df33]
    ld l, a
    ld a, [$df34]
    ld h, a
    ld de, $dd0b
    ld bc, $003e
    call DataTransfer
    ld a, $01
    call ChangeROMBank
    ld hl, $6784
    ld a, l
    ld [$dd09], a
    ld a, h
    ld [$dd0a], a
    call Call_000_0dde
    ld hl, $dd17
    ld a, [$defc]
    cp $04
    jr nz, jr_001_7d12

    ld a, [$d73c]
    ld [hl+], a
    ld a, [$d73d]
    ld [hl+], a
    ld a, [$d73e]
    jr jr_001_7d1d

jr_001_7d12:
    ld a, [$d73b]
    ld [hl+], a
    ld a, [$d73c]
    ld [hl+], a
    ld a, [$d73d]

jr_001_7d1d:
    ld [hl-], a
    dec hl
    call Call_000_0974
    ld a, [$df35]
    ld l, a
    ld a, [$df36]
    ld h, a
    ld de, $cce3
    ld a, [$cb7c]
    ld [hl+], a
    ld [de], a
    inc de
    ld a, [$cb7d]
    ld [hl+], a
    ld [de], a
    inc de
    ld a, [$cb7e]
    ld [hl+], a
    ld [de], a
    inc de
    ld a, [$cb7f]
    ld [hl+], a
    ld [de], a
    ld a, [$dd4d]
    ld l, a
    ld a, [$dd4e]
    ld h, a
    ld de, $01f4
    add hl, de
    ld a, l
    ld [$dd4d], a
    ld a, h
    ld [$dd4e], a
    ld a, l
    ld [$dd49], a
    ld a, h
    ld [$dd4a], a
    call Call_001_5c09
    ld a, [$dd4f]
    ld l, a
    ld a, [$dd50]
    ld h, a
    ld de, $0032
    add hl, de
    ld a, l
    ld [$dd4f], a
    ld a, h
    ld [$dd50], a
    ld b, h
    ld c, l
    call Call_001_7c3c
    ld hl, $dd0b
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    ld a, $2d
    ld [$dd4b], a
    ld hl, $67ad
    ld a, l
    ld [$dd60], a
    ld a, h
    ld [$dd61], a
    ld hl, $67bc
    ld a, l
    ld [$dd6f], a
    ld a, h
    ld [$dd70], a
    ld hl, $67cb
    ld a, l
    ld [$dd7e], a
    ld a, h
    ld [$dd7f], a
    ld hl, $dd60
    call Call_001_5d2e
    ld hl, $dd6f
    call Call_001_5d2e
    ld hl, $dd7e
    call Call_001_5d2e
    ld hl, $dd8d
    ld a, l
    ld [$dd6d], a
    ld a, h
    ld [$dd6e], a
    ld hl, $dddd
    ld a, l
    ld [$dd7c], a
    ld a, h
    ld [$dd7d], a
    ld hl, $de2d
    ld a, l
    ld [$dd8b], a
    ld a, h
    ld [$dd8c], a
    ld hl, $6543
    ld de, $de81
    ld bc, $0037
    call DataTransfer
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
    xor a
    ldh [rSCX], a
    ld de, $43b0
    call Call_000_0061
    ld a, $0d
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, $5150
    ld b, $14
    ld c, $12
    call Call_000_01d4
    xor a
    ld [$defc], a
    ld [$defd], a
    ld [$defe], a
    ldh [rVBK], a
    ld hl, $49b8
    ld de, $9000
    ld bc, $0630
    call DataTransfer
    ld de, $9800
    ld hl, $4fe8
    ld b, $14
    ld c, $12
    call Call_000_01d4
    ld a, $01
    call ChangeROMBank
    ret


    ld a, [$dabb]
    or a
    ret nz

    ld a, $06
    ld [ROM_BANK], a
    call $473f
    ld a, $01
    ld [ROM_BANK], a
    ret


    push de
    push hl
    push bc
    ld e, a
    ld a, [$dabc]
    or a
    jr nz, jr_001_7e7b

    ld a, $06
    ld [ROM_BANK], a
    call $4819
    ld a, $01
    ld [ROM_BANK], a

jr_001_7e7b:
    pop bc
    pop hl
    pop de
    ret


    ld a, $06
    ld [ROM_BANK], a
    call $4000
    ld a, $01
    ld [ROM_BANK], a
    ret


    ld a, $46
    ld [$ff91], a
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
    xor a
    ldh [rSCX], a
    ld de, $4530
    call Call_000_0061
    ld a, $03
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, $5e98
    ld b, $14
    ld c, $12
    call Call_000_01d4
    xor a
    ldh [rVBK], a
    ld hl, $5580
    ld de, $9000
    ld bc, $07b0
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, $5d30
    ld b, $14
    ld c, $12
    call Call_000_01d4
    ld a, $01
    call ChangeROMBank
    ret


    ld a, [$ff91]
    or a
    jr z, jr_001_7ef8

    dec a
    ld [$ff91], a
    ret


jr_001_7ef8:
    ld a, $0c
    ld [$ff9f], a
    ld a, $01
    ld [$ffa0], a
    ret


    ld e, $08
    call Call_000_3e51
    xor a
    ldh [rSCX], a
    ld hl, $02b3
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    xor a
    ld [$ff9c], a
    ld [$dcfe], a
    ld a, $01
    ld [$ff9a], a
    ld de, $44b0
    call Call_000_0061
    ld a, $0e
    ld [$dcff], a
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    ld hl, $674f
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $6f4f
    ld de, $8800
    ld bc, $0790
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, $7e87
    ld b, $14
    ld c, $12
    call Call_000_01d4
    xor a
    ldh [rVBK], a
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


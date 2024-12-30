; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $007", ROMX[$4000], BANK[$7]

    INCBIN "gfx/image_007_4000.2bpp"

    INCBIN "gfx/image_007_5c00.2bpp"

    db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f
    db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f
    db $20, $21, $22, $23, $24, $25, $12, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e
    db $2f, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e
    db $3f, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e
    db $4f, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $5e
    db $5f, $60, $61, $62, $63, $64, $65, $66, $67, $06, $68, $06, $69, $6a, $6b, $6c
    db $6d, $6e, $06, $6f, $06, $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $7a
    db $7b, $06, $7c, $7d, $7e, $7f, $80, $81, $82, $06, $83, $84, $85, $86, $87, $88
    db $89, $8a, $8b, $8c, $8d, $8e, $8f, $90, $91, $92, $93, $94, $95, $96, $97, $98
    db $99, $9a, $9b, $9c, $9d, $9e, $9f, $a0, $a1, $a2, $a3, $a4, $a5, $06, $a6, $a7
    db $a8, $a9, $aa, $ab, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b
    db $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b
    db $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b
    db $2c, $2d, $2e, $2f, $30, $31, $32, $33, $34, $34, $35, $36, $37, $38, $39, $3a
    db $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $45, $34, $34, $34, $46, $47
    db $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50, $51, $52, $53, $54, $55, $56, $34
    db $34, $57, $58, $59, $5a, $5b, $5c, $5d, $5e, $5f, $60, $61, $62, $63, $64, $65
    db $66, $67, $68, $69, $34, $6a, $6b, $6c, $6d, $6e, $6f, $70, $71, $72, $73, $74
    db $75, $76, $77, $78, $79, $7a, $7b, $7c, $7d, $7e, $7f, $80, $81, $82, $83, $84
    db $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $8f, $90, $91, $92, $93, $94
    db $95, $96, $97, $98, $99, $9a, $9b, $9c, $9d, $9e, $9c, $9f, $a0, $a1, $a2, $a3
    db $9d, $9a, $9d, $a4, $9c, $9d, $9f, $a5, $00, $01, $02, $03, $04, $05, $06, $07
    db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13

    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $0c, $08, $08, $08, $08, $08, $08, $08, $0b
    db $0b, $08, $08, $08, $08, $08, $08, $08, $08, $08, $0c, $0c, $08, $08, $08, $08
    db $08, $08, $0b, $0b, $0b, $0b, $0b, $08, $08, $08, $08, $08, $08, $0c, $0c, $0c
    db $08, $08, $08, $08, $08, $08, $0b, $0b, $0b, $0b, $0b, $0e, $0e, $08, $08, $08
    db $0c, $0c, $0c, $0c, $00, $00, $00, $00, $00, $00, $03, $03, $03, $06, $06, $06
    db $06, $06, $06, $00, $04, $04, $04, $04, $07, $07, $07, $07, $07, $07, $03, $03
    db $06, $06, $06, $06, $06, $06, $06, $06, $04, $04, $04, $04, $07, $07, $07, $07
    db $07, $07, $00, $00, $06, $06, $06, $06, $06, $06, $06, $06, $04, $04, $04, $04
    db $07, $07, $07, $07, $07, $07, $00, $00, $06, $06, $06, $06, $06, $06, $06, $06
    db $00, $00, $04, $04, $07, $07, $07, $07, $07, $07, $00, $00, $06, $06, $06, $06
    db $06, $06, $06, $06, $00, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $06, $06, $06, $06, $06, $06, $05, $05, $05, $05, $05, $02, $02, $02, $02
    db $02, $02, $02, $02, $02, $02, $02, $06, $00, $06, $05, $05, $05, $05, $05, $05
    db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $00, $00, $00, $05, $05
    db $05, $05, $05, $05, $01, $01, $01, $01, $01, $01, $01, $01, $02, $01, $01, $00
    db $01, $01, $01, $01, $01, $01, $01, $01

    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    db $01
    db $01

    INCBIN "gfx/image_007_5f28.2bpp"

    INCBIN "gfx/image_007_6528.2bpp"

    nop
    nop
    ld c, $1c
    rla
    jr jr_007_6548

    ld [de], a
    rra
    nop
    db $10
    rra
    ld [de], a
    dec de
    nop
    dec de

jr_007_6548:
    nop
    nop
    ld [de], a
    inc h
    ld [hl-], a
    inc h
    ld d, $20
    ld [hl-], a
    inc b
    inc b
    ld [hl], $08
    ld a, $22
    inc e
    nop
    nop
    ld c, c
    ld [hl], b
    add hl, sp
    ld b, c
    db $10
    ld hl, $0031
    jr nz, jr_007_6595

    jr nz, jr_007_6597

    ld bc, $0030
    nop
    pop hl
    jp $8372


    or c
    ld [bc], a
    inc de
    and b
    ld [hl+], a
    or e
    ld b, d
    di
    db $10
    db $e3
    nop
    nop
    inc b
    rst $00
    db $e3
    inc b
    ld h, c
    ld [bc], a
    ld b, e
    add b
    and b
    ld b, e
    ld b, h
    ld h, a
    nop
    ld h, a
    nop
    nop
    sbc d
    inc e
    adc a
    db $10
    rlca
    nop
    ld a, [de]
    inc c
    db $10
    jr jr_007_659b

jr_007_6595:
    sbc a
    db $10

jr_007_6597:
    adc a
    nop
    nop
    inc e

jr_007_659b:
    jr c, jr_007_65cb

    jr nc, jr_007_65b1

    inc h
    ld a, $00
    jr nz, jr_007_65e2

    inc h
    ld [hl], $00
    ld [hl], $00
    nop
    ld h, b
    ld [hl], b
    jr c, jr_007_65ee

    inc l
    ld b, b
    ld h, h

jr_007_65b1:
    ld [$6c08], sp
    ld d, h
    ld a, b
    ld [$0070], sp
    nop
    ret nc

    ld h, b
    cp b
    ret nz

jr_007_65be:
    ld e, b
    add b
    adc b
    ld d, b
    db $10
    ret c

    jr nz, jr_007_65be

    adc b
    ld [hl], b
    nop
    nop
    inc bc

jr_007_65cb:
    rlca
    dec b
    ld b, $02
    inc b
    rlca
    nop
    inc b
    ld b, $04
    ld b, $00
    ld b, $00
    nop
    ld b, $c3
    push hl
    ld b, $22
    ld b, h
    ld b, h
    add d

jr_007_65e2:
    nop
    ld b, $01
    rlca
    inc b
    inc bc
    nop
    nop
    add h
    rrca
    rrc h

jr_007_65ee:
    push bc
    ld [$824d], sp
    adc d
    call $cd09
    ld b, b
    adc l
    nop
    nop
    nop
    nop
    add b
    nop
    add b
    nop
    nop
    nop
    add b
    nop
    nop
    add b
    nop
    add b
    nop
    nop
    inc a
    ld [hl], b
    ld e, h
    ld h, b
    inc h
    ld c, b
    ld l, h
    nop
    ld [$486c], sp
    ld l, h
    nop
    ld l, h
    nop
    nop
    sub c
    db $e3
    ld [hl], d
    add e
    ld hl, $6342
    nop
    nop
    ld h, e
    add d
    di
    nop
    di

    INCBIN "gfx/image_007_6628.2bpp"

    INCBIN "gfx/image_007_6678.2bpp"

    INCBIN "gfx/image_007_6778.2bpp"

    INCBIN "gfx/image_007_67b8.2bpp"

    INCBIN "gfx/image_007_68b8.2bpp"

    INCBIN "gfx/image_007_68f8.2bpp"

    INCBIN "gfx/image_007_69f8.2bpp"

    nop
    nop
    nop
    nop
    ld [$2107], sp
    ld e, $0a
    push af
    ld d, c
    xor [hl]
    inc b
    ld hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    sub b
    ld h, b
    jr nz, @-$3e

    ld b, b
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
    jr jr_007_6a83

    rla
    jr jr_007_6a86

    db $10
    ld c, $10
    ld c, $10
    nop
    nop
    nop
    nop
    nop
    nop
    db $10

jr_007_6a83:
    ldh [$f8], a
    nop

jr_007_6a86:
    ld a, b
    nop
    jr c, jr_007_6a8a

jr_007_6a8a:
    jr c, jr_007_6a8c

jr_007_6a8c:
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
    jr jr_007_6ab3

    rla
    jr jr_007_6ab6

    db $10
    rrca
    db $10
    inc c
    db $10
    inc c
    db $10
    inc c
    db $10
    ld c, $11
    rra

jr_007_6ab3:
    ldh [rIE], a
    nop

jr_007_6ab6:
    cp $00
    inc a
    nop
    add hl, de
    jr nz, jr_007_6ad5

    nop
    ld [$1810], sp
    ldh [$fc], a
    inc bc
    rst $38
    nop
    ccf
    nop
    cp $00
    xor $10
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, b
    ldh [$f8], a

jr_007_6ad5:
    nop
    ld hl, sp+$00
    ld a, b
    nop
    jr jr_007_6adc

jr_007_6adc:
    ld [$0c10], sp
    db $10
    rrca
    db $10
    rra
    nop
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec de
    jr nz, jr_007_6b0a

    jr nz, jr_007_6b10

    jr nz, @-$40

    ld b, c
    rst $38
    nop
    rra
    nop
    rrca
    db $10
    inc c
    db $10
    cp $10
    sbc $30
    cp [hl]
    ld h, b
    ccf
    ret nz

    rst $38
    nop
    ld hl, sp+$00
    ld hl, sp+$00

jr_007_6b0a:
    jr jr_007_6b0c

jr_007_6b0c:
    ld [$1800], sp
    nop

jr_007_6b10:
    ld c, b
    jr nc, jr_007_6b4b

    ret nz

    ldh a, [rP1]
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
    inc c
    db $10
    ld e, $10
    ld e, $10
    rrca
    db $10
    rla

jr_007_6b35:
    ld [$0000], sp
    nop
    nop
    nop
    nop
    ld [$2810], sp
    db $10
    jr jr_007_6b62

    ld e, b
    jr nz, jr_007_6b35

    nop
    nop
    nop
    nop
    nop
    nop

jr_007_6b4b:
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

jr_007_6b62:
    nop
    nop
    nop
    nop
    ld [bc], a
    ld bc, $0304
    ld [$0007], sp
    nop
    nop
    nop
    nop
    nop
    jr nc, jr_007_6b83

    add b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, h

jr_007_6b83:
    or b
    and c
    ld e, [hl]
    ld d, e
    xor a
    inc hl
    rst $18
    ld b, a
    cp a
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
    ld b, b
    add b
    and b
    ret nz

    ret nc

    ldh [rP1], a
    rrca
    db $10
    rrca
    nop
    rra
    jr nz, @+$21

    jr nc, jr_007_6bc5

    jr @+$41

    ccf
    ccf
    nop
    ccf

jr_007_6bac:
    nop
    rst $38
    nop
    rst $38

jr_007_6bb0:
    rlca
    rst $38
    rra
    rst $38
    ld a, [de]
    db $fc
    jr nc, jr_007_6bb0

    ld hl, sp-$10
    jr nc, jr_007_6bac

    daa
    rst $18
    ld c, a
    cp a
    rst $28
    rst $38
    cp $ff
    ld e, b

jr_007_6bc5:
    ccf
    inc c
    rra
    rra
    rrca
    inc c
    rrca
    ldh [$f0], a
    add sp, -$10
    add b
    ld hl, sp+$04
    ld hl, sp+$04
    ld hl, sp+$00
    db $fc
    xor b
    db $fc
    nop
    db $fc
    ld a, [hl+]
    dec d
    inc d
    dec hl

jr_007_6be0:
    nop
    ccf
    jr nz, jr_007_6c03

    jr nz, @+$21

    ld bc, $171f
    rrca

jr_007_6bea:
    rlca
    rrca
    or b
    ld [hl], b
    jr c, jr_007_6be0

    jr nc, jr_007_6bea

    ld a, [de]
    db $fc
    ld a, a
    rst $38
    rst $30
    rst $38
    ld a, [c]
    db $fd
    db $e4
    ei
    inc c
    rrca
    inc e
    rrca
    inc c
    rra
    ld e, b

jr_007_6c03:
    ccf
    ld hl, sp-$01
    ld [c], a
    db $fd
    dec c
    ld a, [c]
    ld c, $f1
    nop
    db $fc
    nop
    db $fc
    nop
    db $fc
    inc b
    ld hl, sp+$04
    ld hl, sp+$00
    ld hl, sp+$08
    ldh a, [$a0]
    ld d, b
    dec bc
    rlca
    dec b
    inc bc
    ld [bc], a
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [c], a
    db $fd
    call nz, $c8fb
    rst $30
    add h
    ld a, e
    jr nc, jr_007_6c45

    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    ld hl, sp+$07
    ld hl, sp+$03
    db $fc
    inc bc
    db $fc
    inc c

jr_007_6c45:
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    ld d, b
    and b
    and b
    ld b, b
    ret nz

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
    rrca
    rra
    db $10
    rra
    db $10
    rra
    ld bc, $101e
    ld e, $00
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38
    add b
    nop
    ld a, a
    nop
    sub l
    ld l, d
    nop
    nop
    nop
    nop
    nop
    nop
    cp $ff
    nop
    rst $38
    dec bc
    nop
    db $dd
    ld [hl+], a
    xor e
    ld d, h
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    nop
    add b
    ld [$80f0], sp
    ld a, b
    adc b
    ld [hl], b
    ld bc, $101e
    rra
    db $10
    rra
    db $10
    rra
    ld de, $121e
    inc e
    ld bc, $191c
    inc b
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    ccf
    rst $38
    ccf
    db $e4
    rst $38
    nop
    rst $38
    nop
    xor e
    rst $38
    nop
    rst $38
    dec b
    nop
    rst $38
    nop
    cp $ff
    cp $93
    add b
    ld a, b
    ld c, b
    ldh a, [$80]
    ld hl, sp+$00
    ld hl, sp-$80
    ld a, b
    ret nz

    jr c, jr_007_6d19

    cp b
    ld e, b
    and b
    add hl, bc
    inc e
    add hl, de
    inc e
    add hl, de
    inc e
    add hl, de
    inc e
    dec de
    inc e
    add hl, de
    inc e
    dec de
    inc e
    add hl, de
    ld e, $3f
    rst $38
    ccf
    db $e4
    ccf
    rst $38
    ccf
    ei
    ccf
    rst $38
    ccf
    db $fc
    ccf
    rst $38
    rst $38
    nop
    cp $ff
    cp $93

Jump_007_6d00:
    cp $ff
    cp $ff
    cp $ff
    cp $3f
    cp $ff
    rst $38
    nop
    ld b, b
    or b
    ld b, b
    or b
    ld b, b
    or b
    ld b, b
    or b
    ld b, b
    or b
    ld b, b
    or b
    ld b, b

jr_007_6d19:
    or b
    and b
    ld [hl], b
    jr jr_007_6d3d

    jr @+$21

    ld [$101f], sp
    rrca
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
    ld bc, $00fe
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [bc]

jr_007_6d3d:
    rst $38
    ldh [$3f], a
    ret nz

    ld a, a
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rNR10]
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
    ld [$0000], sp
    inc b
    ld b, $02
    ld [bc], a
    ld bc, $0000
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
    ld e, h
    ld a, $d7
    ld [c], a
    inc bc
    ld bc, $0100
    ld bc, $0000
    nop
    nop
    nop

jr_007_6d80:
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    add b
    add b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    inc bc
    nop
    dec b
    inc bc
    nop
    nop
    cp a
    ld a, a
    ld a, a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    nop
    jr nz, jr_007_6d80

    nop
    nop
    ld sp, hl
    ld a, [hl]
    cp $7f
    rst $38
    ld a, a
    rst $38
    ld a, a
    ld a, a
    ld a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld bc, $0100
    sbc b
    ldh [$df], a
    ccf
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
    add hl, de
    rlca
    ei
    db $fc
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
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    nop
    add b
    nop
    add b
    ld bc, $0101
    ld bc, $0100
    nop
    ld bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ccf
    rst $38
    nop
    rst $38
    add d
    ld a, l
    jr nz, jr_007_6e59

    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    db $fc
    rst $38
    dec b
    ld a, [$54ab]
    ld d, h
    xor b
    nop
    nop
    add b
    add b
    add b
    add b
    nop
    add b

jr_007_6e52:
    add b
    nop
    add b
    nop
    nop
    nop
    nop

jr_007_6e59:
    nop
    nop
    nop
    jr nz, jr_007_6e5e

jr_007_6e5e:
    jr jr_007_6e60

jr_007_6e60:
    inc d
    ld [$040e], sp
    inc b
    ld [bc], a
    nop
    nop
    nop
    nop
    ld bc, $0000
    nop
    nop
    nop
    ld [$2007], sp
    rra
    ld e, b
    ccf
    cp h
    ld a, a
    inc a
    rst $38
    jr @+$01

    nop
    nop
    nop
    nop
    jr nz, jr_007_6e52

    inc d
    add sp, $0a
    db $f4
    rlca
    ld hl, sp+$0b
    db $f4
    dec b
    ld a, [$0002]
    inc c
    nop
    inc d
    ld [$1038], sp
    db $10
    jr nz, jr_007_6e97

jr_007_6e97:
    nop
    add b
    nop
    add b
    nop
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    ld e, b
    dec a
    nop
    ld bc, $0001
    nop
    nop
    ld b, b
    rst $38
    ld h, b
    rst $38
    ld b, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    inc bc
    db $fc
    dec b
    ld a, [$fc03]
    dec b
    ld a, [$f40b]

jr_007_6ec6:
    rlca
    ld hl, sp+$0b
    db $f4
    rla
    add sp, -$40
    nop
    ret nz

    nop
    ret nz

    nop
    ret nz

    nop
    call $c01e
    nop
    add b
    nop
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    ld [bc], a
    ld c, $04
    inc d
    ld [$0018], sp
    jr nz, jr_007_6eec

jr_007_6eec:
    add b
    ld a, a
    ld b, b
    ccf
    jr nz, jr_007_6f11

    ld [$101f], sp
    rrca
    inc d
    rrca
    inc b
    rrca
    nop
    rrca
    cpl
    ret nc

    ld e, $e0
    inc l
    ret nc

    ld e, h
    and b
    jr c, jr_007_6ec6

    ld a, b
    add b
    cp b
    ld b, b
    ld a, b
    add b
    nop
    nop
    nop
    nop
    nop

jr_007_6f11:
    nop
    db $10
    jr nz, jr_007_6f4d

    db $10
    inc d
    ld [$000c], sp
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    ld d, $0f
    rrca
    nop
    ld d, $0f
    rrca
    nop
    ld [de], a
    rrca
    rlca
    nop
    ld b, $03
    ret nz

    nop
    inc [hl]
    ret z

    ret z

    nop
    inc [hl]
    ret z

    ret z

    nop
    inc [hl]
    ret z

    ld hl, sp+$00
    ret nc

    jr nz, jr_007_6f4d

jr_007_6f4d:
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
    rst $38
    inc c
    add e
    add hl, de
    add a
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
    ld bc, $b4fe
    cp $68
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
    rst $38
    inc c
    add e
    add hl, de
    add a
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
    ld bc, $b4fe
    cp $68
    cp $32
    adc a
    ld h, l
    sbc a
    ld c, e
    cp a
    ld d, $ff
    add b
    nop
    nop
    ld bc, $0100
    nop
    ld bc, $fcd2
    and [hl]
    ld hl, sp+$4c
    ldh a, [$98]
    ldh [rP1], a
    nop
    nop
    rst $38
    add hl, de
    rlca
    ld [hl-], a
    rrca
    ld [hl-], a
    adc a
    ld h, l
    sbc a
    ld c, e
    cp a
    ld d, $ff
    add b
    nop
    ld [bc], a
    db $fc
    ld l, b
    db $fc
    ldh a, [$9c]
    jp nc, $a6fc

    ld hl, sp+$4c
    ldh a, [$98]
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    ld h, l
    rra
    srl a
    sub [hl]
    ld a, a
    dec l
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sub h
    xor b
    inc l
    or b
    or b
    cp b
    ld a, b
    cp h
    inc a
    ld a, $3e
    ccf
    ccf
    ccf
    ccf
    ccf
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
    add b
    add b
    ret nz

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
    ccf
    ccf
    ccf
    ccf
    dec hl
    scf
    ld bc, $0003
    ld bc, $0001
    nop
    nop
    nop
    nop
    nop
    add b
    add b
    nop
    nop
    add b
    ret nz

    add b
    add b
    ret nz

    nop
    ret nz

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
    ld bc, $0000
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    ld a, a
    ld [bc], a
    db $fd
    dec b
    ld a, [$0400]
    nop
    ld c, $00
    ld c, $00
    ld c, $0a
    inc b
    dec c
    ld a, [c]
    and b
    ld e, a
    ld d, b
    xor a
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
    add b
    nop
    nop
    add b
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    ld [bc], a
    db $fd
    nop
    rst $38
    add b
    nop
    rra
    ld b, b
    rra
    nop
    rra
    nop
    add b
    nop
    jr nc, @-$3e

    and b
    ld e, a
    nop
    rst $38
    ld [bc], a
    ld bc, $01f1
    pop af
    ld bc, $01f1
    inc bc
    ld bc, $071a
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    ld bc, $0000
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $ff07
    nop
    rst $38
    ld a, e
    rst $38
    ld a, a
    ei
    dec a
    jp nz, $ff7b

    ld a, a
    ei
    dec a
    jp nz, $fffc

    nop
    rst $38
    sbc $ff
    rst $38
    sbc $ef
    db $10
    sbc $ff
    rst $38
    sbc $ef
    db $10
    add b
    nop
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    ld bc, $0000
    nop
    ld a, e
    rst $38
    ld a, a
    ei
    dec a
    jp nz, $ff7b

    ld a, a
    ei
    inc a
    jp $fc02


    add b
    ld a, a
    sbc $ff
    rst $38
    sbc $ef
    db $10
    sbc $ff
    rst $38
    sbc $2f
    ret nc

    ld b, b
    ccf
    ld bc, $00fe
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
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
    nop
    nop
    inc d
    inc d
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
    ld [$1c00], sp
    ld [$143e], sp
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
    inc c
    inc b
    inc c
    ld [$0000], sp
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
    jr jr_007_71aa

    jr jr_007_71a4

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_007_71a4:
    nop
    nop
    nop
    nop
    ld a, [bc]
    ld a, [bc]

jr_007_71aa:
    inc d
    inc d
    nop
    nop
    ld a, $7f
    ld [hl], a
    ld h, e
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ld [hl], a
    ld h, e
    ld a, $7f
    inc e
    ld [$1818], sp
    jr jr_007_71d8

    jr jr_007_71da

    jr jr_007_71dc

    jr jr_007_71de

    nop
    nop
    jr jr_007_71e2

    jr jr_007_71e4

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

jr_007_71d8:
    jr nc, jr_007_720a

jr_007_71da:
    jr nc, jr_007_720c

jr_007_71dc:
    nop
    nop

jr_007_71de:
    nop
    nop
    nop
    nop

jr_007_71e2:
    nop
    nop

jr_007_71e4:
    inc e
    ld a, $00
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
    jr nc, jr_007_720a

    jr nc, jr_007_721c

    jr jr_007_7216

    db $10
    jr jr_007_7201

jr_007_7201:
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_007_720a:
    nop
    nop

jr_007_720c:
    cp a
    nop
    ld a, [$4800]
    nop
    dec h
    nop
    sub b
    nop

jr_007_7216:
    ld b, h
    nop
    jr z, jr_007_721a

jr_007_721a:
    ld b, c
    nop

jr_007_721c:
    inc d
    nop
    add c
    nop
    ld c, l
    nop
    dec hl
    nop
    adc d
    nop
    dec h
    nop
    sub l
    nop
    ld [bc], a
    nop
    ld d, d
    nop
    inc b
    nop
    add sp, $17
    add sp, $17
    db $e4
    dec de
    ld [hl], h
    dec bc
    ld [$f415], a
    dec bc
    ld a, l
    ld [bc], a
    or [hl]
    add hl, bc
    add hl, bc
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld bc, $8bfe
    ld [hl], h
    dec h
    jp c, $e817

    ld c, e
    or h
    inc b
    ei
    ld [de], a
    db $ed
    and b
    ld e, a
    ld l, c
    sub [hl]
    xor c
    ld d, [hl]
    push de
    ld a, [hl+]
    db $ed
    ld [de], a
    cp [hl]
    ld b, c
    rst $18
    jr nz, jr_007_721a

    ld c, b
    xor a
    ld d, b
    ld e, l
    and b
    ld a, a

jr_007_7269:
    add b
    ld e, a
    and b
    cp a
    ld b, b
    rst $38
    nop
    ldh [$1f], a
    db $fd
    ld [bc], a
    ld a, a
    nop
    xor a
    nop
    rst $30
    nop
    ld e, l
    nop
    rst $38
    nop
    cp a
    nop
    rst $38
    nop
    ld a, a
    add b
    ei
    nop
    rst $38
    nop
    rst $28
    nop
    cp a
    nop
    rst $38
    nop
    ld a, $c0
    and b
    ld e, a
    call nc, $f92b
    ld b, $ed
    ld [de], a
    ld a, [$f705]
    ld [$00ff], sp
    rst $38
    nop
    jr c, jr_007_7269

    ld c, [hl]
    or c
    dec hl
    call nc, $a05f
    xor a
    ld d, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    jr nz, @+$01

    ld bc, $80fe
    ld a, a
    ld d, b
    cp a
    add c
    ld a, [hl]
    add c
    ld a, [hl]
    pop bc
    ld a, $81
    ld a, [hl]
    ld e, l
    and b
    ld a, h
    add b
    xor l
    ld d, b
    cp h
    ld b, b
    ld a, h
    add b
    ld e, d
    and b
    ld a, l
    add b
    cp b
    ld b, b
    ld d, a
    nop
    cp d
    nop
    rla
    nop
    xor l
    nop
    or [hl]
    nop
    ld e, e
    nop
    ld l, d
    nop
    xor e
    nop
    or l
    nop
    db $eb
    nop
    or e
    nop
    rst $10
    nop
    db $db
    nop
    db $e3
    nop
    xor d
    nop
    xor d
    nop
    rst $20
    rra
    push af
    rrca
    di
    rrca
    ld e, c
    and a
    add hl, sp
    rst $00
    rra
    db $e3
    ccf
    jp Jump_000_27db


    rst $38
    rst $38
    ld a, a
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
    cp $ff
    rst $38
    rst $38
    cp $ff
    cp $ff
    ld a, [$ffff]
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp l
    nop
    or a
    nop
    cp e
    nop
    dec hl
    add b
    ld l, e
    add b
    ld a, e
    add b
    sub l
    ldh [$c8], a
    ldh a, [$94]
    nop
    jp nz, $c400

    nop
    ld [c], a
    nop
    ld h, c
    add b
    call nz, $4300
    nop
    add hl, hl
    nop
    stop
    ld b, d
    nop
    ld [$8000], sp
    nop
    ld a, [bc]
    nop
    and b
    nop
    nop
    nop
    ld c, c
    nop
    db $fd
    ld [bc], a
    ccf
    nop
    ld a, a
    nop
    ccf
    nop
    ld a, a
    nop
    rra
    nop
    ld e, a
    nop
    dec bc
    nop
    rlca
    ld hl, sp-$75
    ld [hl], h
    and a
    ld e, b
    add l
    ld a, d
    db $d3
    inc l
    db $eb
    inc d
    push de
    ld a, [hl+]
    ld a, [$ff05]
    nop
    rst $38
    nop
    rst $18
    nop
    xor l
    nop
    rst $38
    nop
    rst $38
    nop
    db $fc
    inc bc
    ldh a, [rIF]
    cp [hl]
    ld b, b
    rst $38
    nop
    rst $38
    nop
    ld e, a
    nop
    cp [hl]
    ld bc, $02dd
    db $fc
    inc bc
    ld a, [hl+]
    push de
    xor $01
    cp $01
    db $fd
    ld [bc], a
    ld h, c
    sbc [hl]
    ld [$0af7], sp
    rst $38
    ld l, $ff
    ld [bc], a
    rst $38
    cp a
    ld b, b
    cp a
    ld b, b
    ld d, [hl]
    xor c
    nop
    rst $38
    sub l
    ld a, a
    ld a, [hl-]
    rst $38
    cp e
    db $fc
    inc de
    db $fc
    ld a, a
    nop
    db $fc
    nop
    jp c, $3d20

    ret nz

    dec de
    ldh [$3d], a
    jp nz, Jump_000_29d6

    jp hl


    ld d, $7a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $08
    jr nc, @-$57

    ld e, b
    ld [bc], a
    db $fd
    ld b, e
    cp h
    inc bc
    db $fc
    pop de
    ld a, $85
    ld a, d
    add d
    ld a, l
    inc bc
    db $fc
    add l

jr_007_73d9:
    ld a, d
    dec d
    ld [$748b], a
    ld d, l
    xor d
    ld a, l
    add b
    reti


    jr nz, jr_007_73d9

    nop
    ld [hl], l
    add b
    ld a, [c]
    nop
    ld d, c
    add b
    call nc, $ca00
    nop
    ld d, l
    nop
    ld a, [hl+]
    nop
    and l
    nop
    ld d, d
    nop
    ld c, d
    nop
    ld d, l
    nop
    xor d
    nop
    ld c, c
    nop
    ld e, l
    nop
    cp [hl]
    nop
    rra
    nop
    cp e
    inc b
    sbc a
    nop
    ld e, l
    ld [bc], a
    ld c, a
    nop
    dec a
    ld [bc], a
    ld h, l
    rra
    ld l, a
    rra
    daa
    rra
    rst $30
    rrca
    db $db
    rlca
    ei
    rlca
    rst $28
    rra
    ld e, a
    cp a
    ld a, [$efe0]
    ldh a, [$f7]
    ld hl, sp-$1f
    cp $fc
    rst $38
    ld sp, hl
    cp $fc
    rst $38
    ld sp, hl
    cp $8a
    nop
    stop
    ld d, h
    nop
    adc c
    nop
    ldh [rP1], a
    and l
    nop
    ret nc

    nop
    and b
    nop
    jr nz, jr_007_7442

jr_007_7442:
    add h
    nop
    ld de, $4000
    nop
    ld bc, $2400
    nop
    nop
    nop
    ld de, $2f00
    nop
    ld [bc], a
    nop
    ld a, [hl+]
    nop
    ld [bc], a
    nop
    dec h
    nop
    ld b, c
    nop
    ld [$2200], sp
    nop
    db $fd
    ld [bc], a
    cp $01
    db $fd
    ld [bc], a
    rst $18
    nop
    ld a, a
    nop
    ld e, a
    nop
    rst $28
    nop
    scf
    nop
    ld d, h
    xor e
    ret nz

    ccf
    or b
    ld c, a
    ld h, b
    sbc a
    call nc, $f02b
    rrca
    ret c

    daa
    db $f4
    dec bc
    ld b, h
    cp e
    dec b
    ld a, [$fd02]
    xor b
    ld d, a
    ld [bc], a
    db $fd
    db $10
    rst $28
    ld a, [bc]
    push af
    dec b
    ld a, [$fe01]
    ld c, l
    or d
    or l
    ld c, d
    add b
    ld a, a
    ld d, b
    xor a
    and b
    ld e, a
    ld d, $e9
    ld d, l
    xor d
    dec b
    ld a, [$9768]
    ld d, h
    xor e
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add d
    ld a, l
    ld l, c
    sub [hl]
    inc l
    db $d3
    ld d, d
    xor l
    add hl, bc
    or $aa
    ld d, l
    and c
    ld e, [hl]
    sub h
    ld l, e
    ld d, d
    xor l
    ld d, h
    xor e
    dec b
    ld a, [$fa05]
    dec bc
    db $f4
    rrca
    ldh a, [rLYC]
    cp d
    rla
    add sp, $57
    xor b
    dec hl
    call nc, $d02f
    cp a
    ld b, b
    cpl
    ret nc

    ld e, l
    and b
    cp [hl]
    ld b, b
    db $fd
    nop
    ld a, [hl]
    add b
    ld a, [$d200]
    nop
    xor c
    nop
    ld c, d
    nop
    ld d, c
    nop
    xor d
    nop
    ld h, h
    nop
    jp nc, $a800

    nop
    and l
    nop
    inc d
    nop
    ld d, d
    nop
    dec h
    nop
    ld c, a
    nop
    adc [hl]
    ld bc, $075b
    push af
    rrca
    ld [hl], h
    rrca
    ld l, $1f
    xor [hl]
    rra
    ld [hl], a
    rrca
    pop af
    rrca
    db $10
    rst $28
    pop bc
    cp $e4
    rst $38
    sbc a
    ld a, a
    ccf
    rst $38
    cp a
    rst $38
    rst $18
    rst $38
    daa
    rst $38
    dec b
    rst $38
    and a
    ld e, a
    dec de
    rst $38
    db $fc
    rst $38
    db $fc
    rst $38
    cp $ff
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
    sub b
    nop
    add l
    nop
    rst $28
    nop
    ld a, b
    add a
    ld b, e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp $ff
    inc b
    nop
    pop bc
    nop
    ld hl, $80c0
    ldh [$d9], a
    ldh [$ec], a
    ldh a, [$f2]
    db $fc
    ld sp, hl
    cp $01
    nop
    ld c, b
    nop
    and d
    nop
    call nz, $e000
    nop
    pop de
    nop
    and b
    nop
    inc b
    nop
    ld e, e
    nop
    ld c, l
    nop
    ld h, $00
    sub l
    nop
    ld d, l
    nop
    dec [hl]
    nop
    ld d, h
    nop
    dec [hl]
    nop
    db $fd
    ld [bc], a
    cp l
    ld [bc], a
    sbc $01
    ld a, a
    nop
    xor a
    nop
    ld l, a
    nop
    or a
    nop
    ld d, a
    nop
    add hl, bc
    or $05
    ld a, [$7f80]
    ld bc, $00fe
    rst $38
    add b
    ld a, a
    add b
    ld a, a
    and b
    ld e, a
    ld d, [hl]
    xor c
    ld d, l
    xor d
    rst $38
    nop
    ld e, e
    and h
    cp a
    ld b, b
    ld e, l
    and d
    dec hl
    call nc, $f708
    xor [hl]
    ld d, c
    cp l
    ld b, d
    rst $28
    db $10
    ld a, a
    add b
    rst $38
    nop
    xor $11
    ld e, d
    and l
    xor d
    ld d, l
    ld a, [$aa05]
    ld d, l
    ld hl, sp+$07
    xor h
    ld d, e
    ret nc

    cpl
    xor b
    ld d, a
    sub h
    ld l, e
    nop
    rst $38
    ld e, a
    and b
    cpl
    ret nc

    ccf
    ret nz

    ld e, [hl]
    and b
    ld a, $c0
    ld a, l
    add b
    ld a, [hl]
    add b
    cp d
    ld b, b
    db $fd
    nop
    ld a, [$dd00]
    nop
    ld [$b500], a
    nop
    ld l, l
    nop
    push de
    nop
    or a
    nop
    ld [c], a
    nop
    or h
    nop
    ld l, b
    nop
    ld a, [c]
    nop
    or c
    nop

Call_007_75ea:
    add sp, $00
    ld [hl], h
    nop
    pop af
    nop
    ld l, a
    rra
    rst $08
    ccf
    rst $38
    rrca
    ld e, c
    rlca
    dec l
    ld [bc], a
    sub l
    nop
    ld c, d
    nop
    jr nz, jr_007_7600

jr_007_7600:
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rra
    rst $38
    rst $38
    rrca
    or b
    rrca
    ld e, $01
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
    ld a, a
    rst $38
    ld e, a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    cp $ff
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp $ff
    db $fd
    cp $fd
    cp $f3
    db $fc
    db $e4
    ld hl, sp-$28
    ldh [$99], a
    ldh [rNR41], a
    ret nz

    ld [c], a
    nop
    adc b
    nop
    stop
    inc b
    nop
    jr nz, jr_007_7646

jr_007_7646:
    ld [bc], a
    nop
    stop
    ld bc, $4800
    nop
    nop
    nop
    ld e, b
    nop
    dec l
    nop
    inc [hl]
    nop
    ld e, $00
    ld d, l
    nop
    ld e, $00
    ld l, $00
    rla
    nop
    xor e
    nop
    ld d, l
    nop
    xor d
    nop
    dec d
    nop
    and l
    nop
    adc b
    nop
    and l
    nop
    and h
    nop
    ret nc

    cpl
    ldh a, [rIF]
    db $fd
    ld [bc], a
    ld a, e
    inc b
    ld a, [hl]
    ld bc, $00af
    ld e, a
    nop
    dec hl
    nop
    ld [de], a
    db $ed
    add hl, bc
    or $6d
    sub d
    ld d, a
    xor b
    ld a, [$ef05]
    db $10
    rst $38
    nop
    rst $38
    nop
    ld d, c
    xor [hl]
    ld e, h
    and e
    ld [hl], l
    adc d
    cp h
    ld b, e
    cp $01
    db $fd
    ld [bc], a
    cp $01
    rst $28
    nop
    ld a, [hl+]
    push de
    ld b, l
    cp d
    scf
    ret z

    push de
    ld a, [hl+]
    cp a
    ld b, b
    ld a, a
    add b
    rst $38
    nop
    ld a, [hl]
    add b
    db $fd
    nop
    or $00
    ld [$da00], a
    nop
    ld l, c
    nop
    xor d
    nop
    xor c
    nop
    call nc, $d500
    nop
    xor a
    nop
    xor e
    nop
    xor a
    nop
    ld e, a
    nop
    xor a
    nop
    ld e, a
    nop
    cp a
    nop
    db $f4
    nop
    ld sp, hl
    nop
    ldh a, [rP1]
    ld a, [$f800]
    nop
    ld sp, hl
    nop
    ld a, [$f800]
    nop
    adc d
    nop
    ld hl, $8a00
    nop
    inc b
    nop
    sub c
    nop
    inc b
    nop
    ld de, $8400
    nop
    xor e
    nop
    nop
    nop
    ld d, l
    nop
    ld [$5200], sp
    nop
    inc b
    nop
    ld d, b
    nop
    dec b
    nop
    rst $10
    ccf
    ld [hl], b
    rrca
    ld [hl], $01
    add e
    nop
    ld e, c
    nop
    add h
    nop
    ld a, [hl+]
    nop
    inc h
    nop
    rst $38
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    adc a
    ld a, a
    rst $20
    rra
    add hl, sp
    rlca
    adc l
    ld [bc], a
    dec hl
    nop
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
    cp $ff
    cp $ff
    rst $30
    db $fc
    di
    db $fc
    ldh [$f8], a
    ret


    ldh a, [$90]
    ldh [rNR51], a
    ret nz

    ret nc

    nop
    sub h
    nop
    ld hl, $0000
    nop
    and d
    nop
    nop
    nop
    ld b, b
    nop
    ld [de], a
    nop
    add b
    nop
    nop
    nop
    ld [bc], a
    nop
    stop
    nop
    nop
    ld b, b
    nop
    ld [bc], a
    nop
    stop
    ld b, b
    nop
    nop
    nop
    ld c, [hl]
    nop
    rra
    nop
    rrca
    nop
    ld c, a
    nop
    rla
    nop
    rra
    nop
    adc a
    nop
    rla
    nop
    jp nc, $a500

    nop
    call nc, $f200
    nop
    jp c, $f900

    nop
    push af
    nop
    db $fd
    nop
    sub l
    nop
    dec h
    nop
    ld c, d
    nop
    sub c
    nop
    ld b, h
    nop
    add hl, hl
    nop
    ld b, b
    nop
    ld a, [hl+]
    nop
    ld e, a
    nop
    ld e, a
    nop
    xor d
    nop
    ld d, [hl]
    nop
    ld d, d
    nop
    inc d
    nop
    and d
    nop
    ld c, c
    nop
    rst $18
    nop
    cp a
    nop
    db $eb
    nop
    xor l
    nop
    xor d
    nop
    and l
    nop
    xor c
    nop
    ld b, l
    nop
    ei
    nop
    db $ed
    nop
    jp c, Jump_007_6d00

    nop
    and h
    nop
    ld d, d
    nop
    ld a, [hl+]
    nop
    ld c, c
    nop
    ld c, d
    nop
    ld d, d
    nop
    adc l
    nop
    ld d, l
    nop
    dec hl
    nop
    xor l
    nop
    sub a
    nop
    ld d, l
    nop
    rst $18
    nop
    cp a
    nop
    ld a, [hl]
    ld bc, $00df
    ld a, l
    ld [bc], a
    cp $01
    ei
    inc b
    rst $38
    nop
    ld a, h
    add b
    ld a, [$bc00]
    ld b, b
    ld l, d
    sub b
    cp l
    ld b, b
    cp $00
    ld a, [hl]
    add b
    xor $10
    jr z, jr_007_77f2

jr_007_77f2:
    ld b, d
    nop
    stop
    ld b, l
    nop
    stop
    ld b, c
    nop
    ld [$a200], sp
    nop
    sub b
    nop
    dec h
    nop
    ld [$4200], sp
    nop
    inc h
    nop
    ld [$4200], sp
    nop
    jr z, jr_007_7810

jr_007_7810:
    sub c
    nop
    inc b
    nop
    sub d
    nop
    ld b, c
    nop
    adc b
    nop
    dec h
    nop
    adc b
    nop
    ld b, l
    nop
    ld b, b
    nop
    xor d
    nop
    add hl, bc
    nop
    ld d, d
    nop
    inc b
    nop
    ld d, c
    nop
    adc d
    nop
    jr nz, jr_007_7830

jr_007_7830:
    db $fd
    cp $fe
    ld hl, sp-$0a
    ld hl, sp-$17
    ldh a, [$ca]
    ldh a, [$92]
    ldh [$65], a
    add b
    ld c, d
    add b
    ld b, d
    nop
    jr z, jr_007_7844

jr_007_7844:
    and b
    nop
    ld b, h
    nop
    stop
    add d
    nop
    inc h
    nop
    ld [$4000], sp
    nop
    ld [$8000], sp
    nop
    nop
    nop
    ld [de], a
    nop
    nop
    nop
    ld b, b
    nop
    ld [$0000], sp
    nop
    sub d
    nop
    nop
    nop
    add hl, bc
    nop
    jr nz, jr_007_786a

jr_007_786a:
    nop
    nop
    nop
    nop
    add h
    nop
    ld c, a
    nop
    rra
    nop
    ld c, a
    nop
    rra
    nop
    cpl
    nop
    rra
    nop
    sub a
    nop
    cpl
    nop
    push af
    nop
    cp $00
    rst $38
    nop

jr_007_7886:
    rst $38
    nop
    rst $18
    jr nz, @+$01

    nop
    rst $18
    jr nz, jr_007_7886

    ld [$0051], sp
    call nc, $5500
    nop
    xor d
    nop
    ld l, e
    nop
    or l
    nop
    ld [$f500], a
    nop
    ld [de], a
    nop
    add b
    nop
    ld d, h
    nop
    ld [hl+], a
    nop
    ld d, h
    nop
    ld d, l
    nop
    xor l
    nop
    rst $10
    nop
    ld [hl+], a
    nop
    adc c
    nop
    ld b, h
    nop
    add hl, hl
    nop
    sub d
    nop
    ld c, c
    nop
    ld d, l
    nop
    cp a
    nop
    inc h
    nop
    ld d, l
    nop
    sub l
    nop
    dec l
    nop
    ld e, [hl]
    nop
    or a
    nop
    ld a, l
    nop
    rst $10
    nop
    cp [hl]
    nop
    ld l, e
    nop
    cp a
    nop
    rst $28
    nop
    cp a
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    db $ed
    ld [de], a
    rst $38
    nop
    db $ed
    ld [de], a
    cp $01
    rst $28
    db $10
    ld a, [$5505]
    xor d
    ld a, d
    add l
    ld a, [hl]
    add b
    cp a
    ld b, b
    db $ed
    db $10
    cp a
    ld b, b
    rst $38
    nop
    cp a
    ld b, b
    rst $28
    db $10
    cp a
    ld b, b
    stop
    ld b, d
    nop
    jr z, jr_007_7906

jr_007_7906:
    add c
    nop
    ld a, [hl+]
    nop
    sub c
    nop
    ld c, d
    nop
    pop de
    nop
    add d
    nop
    ld de, $0400
    nop
    stop
    ld b, l
    nop
    nop
    nop
    ld a, [hl+]
    nop
    ld b, b
    nop
    jr nz, jr_007_7922

jr_007_7922:
    inc d
    nop
    and c
    nop
    inc d
    nop
    ld b, c
    nop
    inc d
    nop
    ld c, c
    nop
    stop
    adc d
    nop
    ld hl, $4400
    nop
    ld [de], a
    nop
    ld c, c
    nop
    inc h
    nop
    add hl, bc
    nop
    and h
    nop
    rst $38
    nop
    ld d, l
    xor d
    rst $38
    nop
    xor d
    ld d, l
    rst $38
    nop
    xor d
    ld d, l
    rst $30
    ld [$a55a], sp
    rst $38
    nop
    ld d, l
    xor d
    rst $38
    nop
    xor d
    ld d, l
    rst $38
    add hl, bc
    xor [hl]
    ld d, l
    rst $30
    ld [$a55a], sp
    rst $38
    nop
    ld d, l
    xor d
    rst $38
    nop
    xor d
    ld d, l
    rst $38
    ld b, b
    xor d
    ld [hl], a
    rst $38
    ld [$b55a], sp
    rst $38
    nop
    ld d, l
    xor e
    rst $38

jr_007_7975:
    ld [bc], a
    xor a
    ld [hl], l
    rst $38
    add b
    cp d
    ld d, a
    rst $30
    ld [$b55e], sp
    rst $38
    ld [de], a
    ld e, l
    db $eb
    rst $38
    xor h
    cp d
    ld d, l
    rst $38
    jr nz, jr_007_7975

    ld e, l
    rst $30
    ld [$a5fa], sp
    rst $38
    ld c, b
    push af
    xor d
    rst $38
    ld b, b
    xor e
    ld d, l
    rst $38
    inc d
    xor d
    push de
    rst $30
    ld [$e57a], sp
    rst $38
    add b
    ld d, l
    xor d
    rst $38
    nop
    xor d
    ld d, l

jr_007_79a8:
    rst $38
    nop
    xor d
    ld d, a
    rst $30
    ld [$a55a], sp
    rst $38
    nop
    ld d, l
    xor [hl]
    rst $38
    nop
    xor d
    ld d, l
    rst $38
    nop
    xor d
    ld d, l
    rst $30
    ld [$a55a], sp
    rst $38
    ld [$aa57], sp
    rst $38
    add c
    ld [$ff7d], a

jr_007_79c9:
    dec d
    xor d
    ld [hl], l
    rst $30
    ld c, d
    ld e, d
    and l
    rst $38
    jr nz, jr_007_79a8

    xor d
    rst $38

jr_007_79d5:
    ld d, b
    xor [hl]
    ld d, l
    rst $38
    ld [bc], a
    xor d
    push af
    rst $30
    ld e, b
    ld e, [hl]
    and l
    rst $38
    nop
    ld d, l
    xor d
    rst $38
    nop
    xor d
    push de
    rst $38
    add b
    ld [$ff55], a
    jr z, jr_007_79c9

    or a
    rst $38
    nop
    ld d, a
    xor d
    rst $38
    nop
    xor d
    ld e, l
    rst $38
    nop
    xor d
    ld d, l
    rst $30
    ld [$a55a], sp
    rst $38
    db $10
    ld d, l
    xor d
    rst $38
    nop
    xor d
    ld d, l
    rst $38
    nop
    xor d
    ld d, l
    rst $30
    ld [$a55a], sp
    rst $38
    ld [bc], a
    ld d, l
    xor d
    rst $38
    ld [bc], a
    xor e
    ld d, l
    rst $38
    nop
    xor d
    ld d, l
    rst $30
    ld [$a55a], sp
    rst $38
    nop
    ld [hl], l
    ld [$08ff], a
    ld [$ff55], a
    jr nz, jr_007_79d5

    ld d, l
    rst $30
    ld [$a55a], sp
    rst $38
    nop

jr_007_7a32:
    ld d, l
    xor d
    rst $38
    nop
    xor e
    ld d, l

jr_007_7a38:
    rst $38

jr_007_7a39:
    dec bc
    rst $38
    ld d, l
    rst $38
    ld a, [hl+]
    ld e, d
    xor l
    rst $38
    ld bc, $aa55
    rst $38
    call nc, Call_007_75ea
    rst $38
    ld d, b
    ld [$f755], a
    ld [$a55a], sp
    rst $38
    db $10
    ld d, l
    xor [hl]
    rst $38
    ld bc, $55ae
    rst $38
    db $10
    xor d
    ld d, l
    rst $38
    jr z, jr_007_7a39

    and l
    rst $38
    jr nc, jr_007_7a38

    xor d
    rst $38
    ld b, b
    ld [$ff55], a
    nop
    xor d
    ld d, l
    rst $30
    ld [$a55a], sp
    jr c, jr_007_7a32

    adc b
    ldh a, [$e7]
    ret nz

    sbc a
    nop
    rrca
    ld [hl], b
    adc $f1
    nop
    nop
    rrca
    nop
    dec [hl]
    ld a, [bc]
    ret nz

    ccf
    adc d
    ld [hl], c
    nop
    ret nz

    ld e, h
    adc [hl]
    or a
    rra
    nop
    nop
    nop
    nop
    ret nz

    nop
    ld h, b
    add b
    jr nc, @-$3e

    sbc b
    ld h, b
    ld c, b
    jr nc, @+$06

    jr c, jr_007_7a9e

    nop

jr_007_7a9e:
    ld bc, $0000
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
    add hl, hl
    add $81
    ld h, [hl]
    add b
    ld [hl], e
    ld b, d
    add hl, sp
    ld hl, $3a1c
    inc b
    dec e
    ld [bc], a
    ld a, $01
    sbc $01
    xor l
    nop
    sbc $00
    db $ed
    ld [bc], a
    add $01
    db $e3
    nop
    ld b, l
    nop
    ld [c], a

jr_007_7acb:
    nop
    jr jr_007_7acb

    ld sp, $a0f8
    ld b, b
    inc b
    inc bc
    ld b, h
    cp a
    ld bc, $fffe
    nop
    push af
    nop
    inc b
    ld hl, sp+$04
    ld sp, hl
    add l
    ld a, c
    ldh a, [$0d]
    ld a, d
    add l
    rst $10
    nop
    and d
    nop
    ld bc, $3300
    db $fc
    xor e
    sbc h
    add c
    adc [hl]
    add e
    ret nz

    dec c
    ldh a, [$8f]
    ld [hl], b
    cp d
    nop
    ld d, l
    nop
    and c
    ld h, e
    add b
    ld h, [hl]
    sub h
    ld h, [hl]
    sbc $27
    ld hl, sp+$07
    ld e, [hl]
    ld bc, $00af
    dec b
    nop
    rst $08
    ldh a, [$ef]
    ld [hl], b
    dec c
    jr nc, jr_007_7b32

    nop
    ld a, [hl-]
    ret nz

jr_007_7b16:
    dec [hl]
    ret nz

    add sp, $00
    ld d, h
    nop
    ld bc, $a1bf
    rra
    ret c

    rlca
    and $01
    xor c
    nop
    inc b
    nop
    ld bc, $0400
    nop
    sub h
    jr jr_007_7b33

    sbc b
    ld b, $98

jr_007_7b32:
    inc c

jr_007_7b33:
    add b
    inc d
    add sp, -$08
    nop
    inc [hl]
    nop
    xor b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    nop
    dec b
    nop
    dec hl
    nop
    ld b, l
    jr @+$1d

    nop
    ld e, b
    rlca
    jr nc, jr_007_7b5f

    ld h, h
    jr jr_007_7b16

    jr nc, @-$30

    daa
    xor b
    ld c, h
    sbc l
    ld c, [hl]
    add h
    ld c, [hl]
    ldh a, [rP1]
    ld l, b

jr_007_7b5f:
    add b
    or c
    ld b, b
    jr @+$62

    ld sp, $5ac0
    jr nz, jr_007_7b7e

    ld h, b
    cp e
    ld b, b
    ld l, d
    nop
    cp a
    nop
    ld a, e
    inc b
    db $e4
    dec de
    sub b
    ld h, b
    and h
    ld c, h
    adc l
    ld e, h
    call z, $8019
    nop

jr_007_7b7e:
    ld b, b
    nop
    add d
    nop
    push de
    nop
    db $e3
    nop
    ld d, a
    add b
    ld l, e
    add b
    ld b, a
    add b
    ld a, [hl+]
    nop
    ld a, a
    nop
    db $e3
    inc e
    add b
    ld a, a
    ld b, c
    add b
    nop
    or [hl]
    and [hl]
    inc [hl]
    ld h, l
    inc l
    add d
    nop
    ld b, c
    nop
    and d
    nop
    push bc
    nop
    ld h, e
    add b
    ld b, [hl]
    add c
    ld h, e
    add b
    ld d, [hl]
    add c
    xor b
    nop
    ld e, h
    nop
    xor $10
    add c
    ld a, [hl]
    ld bc, $22c2
    sbc c
    ld bc, $9982
    ld [hl], $01
    nop
    ld [bc], a
    nop
    add c
    nop
    ld b, d
    ld bc, $0186
    call z, $9402
    inc bc
    ld c, h
    inc bc
    ld d, b
    nop
    and b
    nop
    ldh a, [rP1]
    ld a, d
    add b
    dec e
    nop
    ld b, [hl]
    ld a, b
    dec b
    jr jr_007_7be9

    ret nc

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    add b
    nop
    nop

jr_007_7be9:
    ld h, b
    ldh [rP1], a
    dec d
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
    nop
    nop
    nop
    nop
    add c
    ld h, b
    ret z

    scf
    inc sp
    inc c
    ld e, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], c
    add b
    ld l, d
    add b
    pop de
    nop
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
    add b
    ld b, c
    pop de
    ld l, $6f
    db $10
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
    db $e3
    nop
    push bc
    nop
    and d
    nop
    ld b, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    dec l
    add e
    ld a, h
    rst $38
    nop
    ld a, [hl+]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $e3
    nop
    push bc
    nop
    add d
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
    ld bc, $2386
    call c, Call_000_20de
    dec [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sub [hl]
    nop
    rrca
    nop
    add a
    nop
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec l
    db $10
    sbc d
    ld h, b
    ldh a, [rP1]
    ret nz

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
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld [$0009], sp
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
    ld a, [bc]
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $1312
    inc d
    dec d
    ld d, $17
    jr jr_007_7cde

    ld a, [de]
    dec de
    nop
    nop
    inc e
    dec e
    ld e, $1f
    jr nz, jr_007_7cf0

    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $27
    jr z, jr_007_7d00

    ld a, [hl+]
    dec hl
    inc l
    dec l
    nop
    nop
    nop

jr_007_7cde:
    ld l, $2f
    jr nc, jr_007_7d13

    ld [hl-], a
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, jr_007_7d23

    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $00

jr_007_7cf0:
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
    ld b, b
    nop
    nop
    nop
    nop

jr_007_7d00:
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
    ld b, c
    ld b, d
    ld b, e
    nop
    nop
    nop

jr_007_7d13:
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
    ld b, h
    ld b, l

jr_007_7d23:
    ld b, [hl]
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
    ld b, a
    ld c, b
    ld c, c
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
    ld c, d
    ld c, e
    ld c, h
    ld c, l
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
    ld c, [hl]
    ld c, a
    ld d, b
    ld d, c
    ld d, d
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
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
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
    ld e, b
    ld e, c
    ld e, d
    nop
    ld e, e
    ld e, h
    ld e, l
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
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    ld h, d
    ld h, e
    ld h, h
    ld h, l
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
    ld h, [hl]
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld l, e
    ld l, h
    ld l, l
    ld l, [hl]
    ld l, a
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
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], h
    ld [hl], l
    db $76
    ld [hl], a
    ld a, b
    ld a, c
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
    ld a, d
    ld a, e
    ld a, h
    ld a, l
    ld a, [hl]
    ld a, a
    add b
    add c
    add d
    add e
    add h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add l
    add [hl]
    add a
    adc b
    adc c
    adc d
    adc e
    adc h
    adc l
    adc [hl]
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
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0101
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
    ld bc, $0101
    ld bc, $0000
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
    ld bc, $0101
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
    nop
    nop
    nop
    nop
    ld bc, $0101
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
    nop
    ld bc, $0101
    nop
    ld bc, $0101
    ld bc, $0000
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
    ld bc, $0101
    ld bc, $0101
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
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0000
    nop
    nop
    nop
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

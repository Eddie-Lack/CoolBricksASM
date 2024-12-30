; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00f", ROMX[$4000], BANK[$f]

    dec a
    jr nz, jr_00f_400f

    ld hl, $412e
    ld de, $c35a
    ld bc, $0052
    jp Jump_00f_4100


jr_00f_400f:
    cp $03
    jr nz, jr_00f_405e

    ld hl, $c3b6
    ld bc, $0009
    ld a, $00
    call Call_00f_4113
    ld hl, $c3b8
    ld de, $4724
    call Call_00f_4104
    ld hl, $c3ba
    ld de, $4844
    call Call_00f_4104
    ld hl, $c3bc
    ld de, $4964
    call Call_00f_4104
    ld hl, $c3bf
    ld de, $4214
    call Call_00f_411c
    ld hl, $c3be
    xor a
    ld e, $90
    call Call_00f_4128
    ld a, $02
    ld [$ff9c], a
    ld de, $c3b6
    call Call_000_0061
    ld a, $04
    ld [$ff9c], a
    xor a
    jr jr_00f_40a4

jr_00f_405e:
    cp $02
    jp z, Jump_00f_40ca

    ld hl, $c3b6
    ld bc, $0009
    ld a, $00
    call Call_00f_4113
    ld hl, $c3b8
    ld de, $4604
    call Call_00f_4104
    ld hl, $c3ba
    ld de, $44e4
    call Call_00f_4104
    ld hl, $c3bc
    ld de, $43c4
    call Call_00f_4104
    ld hl, $c3bf
    ld de, $4214
    call Call_00f_411c
    ld hl, $c3be
    ld a, $f8
    ld e, $90
    call Call_00f_4128
    ld de, $c3b6
    call Call_000_0061
    ld a, $ff

jr_00f_40a4:
    ld hl, $c3b6
    ld bc, $0009
    call Call_00f_4113
    ld hl, $c3b8
    call Call_00f_4113
    ld hl, $c3ba
    call Call_00f_4113
    ld hl, $c3bc
    call Call_00f_4113
    ld hl, $4180
    ld de, $c35a
    ld bc, $005c
    jr jr_00f_4100

Jump_00f_40ca:
    ld hl, $c3b6
    ld de, $42a4
    ld bc, $0003
    call Call_00f_4104
    ld hl, $c3b9
    ld de, $4214
    call Call_00f_411c
    ld hl, $c3b8
    ld a, $f8
    ld e, $17
    call Call_00f_4128
    ld a, $fc
    ld e, $78
    call Call_00f_4128
    ld a, $f8
    ld e, $01
    call Call_00f_4128
    ld hl, $41dc
    ld de, $c35a
    ld bc, $0038

Jump_00f_4100:
jr_00f_4100:
    call DataTransfer
    ret


Call_00f_4104:
    ld a, $90

jr_00f_4106:
    push af
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    add hl, bc
    pop af
    dec a
    jr nz, jr_00f_4106

    ret


Call_00f_4113:
    ld e, $90

jr_00f_4115:
    ld [hl+], a
    ld [hl], a
    add hl, bc
    dec e
    jr nz, jr_00f_4115

    ret


Call_00f_411c:
    ld a, $90

jr_00f_411e:
    push af
    ld a, [de]
    inc de
    ld [hl+], a
    add hl, bc
    pop af
    dec a
    jr nz, jr_00f_411e

    ret


Call_00f_4128:
jr_00f_4128:
    ld [hl+], a
    add hl, bc
    dec e
    jr nz, jr_00f_4128

    ret


    db $e5, $21, $6b, $ff, $36, $00, $36, $00, $36, $00, $36, $00, $2e, $69, $36, $00
    db $36, $00, $2e, $68, $36, $9e, $2e, $6a, $36, $94, $2e, $45, $36, $09, $2e, $43
    db $36, $00, $f5, $fa, $56, $c9, $6f, $fa, $57, $c9, $67, $2a, $ea, $5f, $c3, $2a
    db $ea, $61, $c3, $2a, $ea, $63, $c3, $2a, $ea, $65, $c3, $2a, $ea, $69, $c3, $2a
    db $ea, $6b, $c3, $2a, $ea, $77, $c3, $7d, $ea, $56, $c9, $7c, $ea, $57, $c9, $f1
    db $e1, $d9, $e5, $21, $69, $ff, $36, $00, $36, $00, $36, $00, $36, $00, $36, $00
    db $36, $00, $36, $00, $36, $00, $2e, $43, $36, $00, $2e, $68, $36, $80, $2e, $45
    db $36, $01, $f5, $fa, $56, $c9, $6f, $fa, $57, $c9, $67, $2a, $ea, $5f, $c3, $2a
    db $ea, $61, $c3, $2a, $ea, $63, $c3, $2a, $ea, $65, $c3, $2a, $ea, $67, $c3, $2a
    db $ea, $69, $c3, $2a, $ea, $6b, $c3, $2a, $ea, $6d, $c3, $2a, $ea, $71, $c3, $2a
    db $ea, $79, $c3, $7d, $ea, $56, $c9, $7c, $ea, $57, $c9, $f1, $e1, $d9, $e5, $21
    db $6b, $ff, $36, $00, $36, $00, $2e, $43, $36, $fc, $2e, $6a, $36, $82, $2e, $45
    db $36, $01, $f5, $fa, $56, $c9, $6f, $fa, $57, $c9, $67, $2a, $ea, $5f, $c3, $2a
    db $ea, $61, $c3, $2a, $ea, $65, $c3, $2a, $ea, $6d, $c3, $7d, $ea, $56, $c9, $7c
    db $ea, $57, $c9, $f1, $e1, $d9, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b
    db $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b
    db $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b
    db $2c, $2d, $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b
    db $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b
    db $4c, $4d, $4e, $4f, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b
    db $5c, $5d, $5e, $5f, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6a, $6b
    db $6c, $6d, $6e, $6f, $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $7a, $7b
    db $7c, $7d, $7e, $7f, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a, $8b
    db $8c, $8d, $8e, $8f, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $11, $00, $11, $00, $11, $00
    db $11, $04, $11, $04, $11, $04, $11, $08, $11, $08, $31, $0c, $31, $0c, $31, $0c
    db $31, $10, $31, $10, $31, $14, $31, $14, $51, $14, $51, $18, $51, $18, $51, $18
    db $51, $1c, $51, $1c, $51, $20, $71, $20, $71, $20, $71, $24, $71, $24, $71, $28
    db $71, $28, $71, $28, $71, $2c, $91, $2c, $91, $2c, $91, $30, $91, $30, $91, $34
    db $91, $34, $91, $34, $b1, $38, $b1, $38, $b1, $3c, $b1, $3c, $b1, $3c, $b1, $40
    db $b1, $40, $b1, $44, $90, $44, $90, $44, $8f, $44, $8f, $44, $8e, $44, $8e, $44
    db $8e, $44, $8d, $44, $6d, $44, $6c, $44, $6c, $44, $6c, $44, $6b, $44, $6b, $44
    db $6a, $44, $6a, $44, $4a, $44, $49, $44, $49, $44, $48, $44, $48, $44, $48, $44
    db $47, $44, $47, $44, $46, $44, $26, $44, $26, $44, $25, $44, $25, $44, $24, $44
    db $24, $44, $24, $44, $23, $44, $03, $44, $02, $44, $02, $44, $02, $44, $01, $44
    db $01, $44, $00, $44, $00, $44, $00, $44, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $21, $04, $21, $04, $42, $08
    db $42, $08, $63, $0c, $63, $0c, $63, $0c, $84, $10, $84, $10, $a5, $14, $a5, $14
    db $c6, $18, $c6, $18, $c6, $18, $e7, $1c, $e7, $1c, $08, $21, $08, $21, $29, $25
    db $29, $25, $4a, $29, $4a, $29, $4a, $29, $6b, $2d, $6b, $2d, $8c, $31, $8c, $31
    db $ad, $35, $ad, $35, $ad, $35, $ce, $39, $ce, $39, $ef, $3d, $ef, $3d, $10, $42
    db $10, $42, $31, $46, $31, $46, $31, $46, $52, $4a, $52, $4a, $73, $4e, $73, $4e
    db $94, $52, $94, $52, $94, $52, $b5, $56, $b5, $56, $d6, $5a, $d6, $5a, $f7, $5e
    db $f7, $5e, $18, $63, $18, $63, $18, $63, $39, $67, $39, $67, $5a, $6b, $5a, $6b
    db $7b, $6f, $7b, $6f, $7b, $6f, $9c, $73, $9c, $73, $bd, $77, $bd, $77, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $bd, $77, $bd, $77, $9c, $73, $9c, $73
    db $7b, $6f, $7b, $6f, $7b, $6f, $5a, $6b, $5a, $6b, $39, $67, $39, $67, $18, $63
    db $18, $63, $18, $63, $f7, $5e, $f7, $5e, $d6, $5a, $d6, $5a, $b5, $56, $b5, $56
    db $b5, $56, $94, $52, $94, $52, $73, $4e, $73, $4e, $52, $4a, $52, $4a, $52, $4a
    db $31, $46, $31, $46, $10, $42, $10, $42, $ef, $3d, $ef, $3d, $ef, $3d, $ce, $39
    db $ce, $39, $ad, $35, $ad, $35, $8c, $31, $8c, $31, $8c, $31, $6b, $2d, $6b, $2d
    db $4a, $29, $4a, $29, $29, $25, $29, $25, $29, $25, $08, $21, $08, $21, $e7, $1c
    db $e7, $1c, $c6, $18, $c6, $18, $c6, $18, $a5, $14, $a5, $14, $84, $10, $84, $10
    db $63, $0c, $63, $0c, $63, $0c, $42, $08, $42, $08, $21, $04, $21, $04, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $21, $04, $21, $04
    db $21, $04, $42, $08, $42, $08, $42, $08, $42, $08, $63, $0c, $63, $0c, $63, $0c
    db $84, $10, $84, $10, $84, $10, $a5, $14, $a5, $14, $a5, $14, $a5, $14, $c6, $18
    db $c6, $18, $c6, $18, $e7, $1c, $e7, $1c, $e7, $1c, $e7, $1c, $08, $21, $08, $21
    db $08, $21, $29, $25, $29, $25, $29, $25, $4a, $29, $4a, $29, $4a, $29, $4a, $29
    db $6b, $2d, $6b, $2d, $6b, $2d, $8c, $31, $8c, $31, $8c, $31, $ad, $35, $ad, $35
    db $ad, $35, $ad, $35, $ce, $39, $ce, $39, $ce, $39, $ef, $3d, $ef, $3d, $ef, $3d
    db $ef, $3d, $10, $42, $10, $42, $10, $42, $31, $46, $31, $46, $31, $46, $52, $4a
    db $52, $4a, $52, $4a, $52, $4a, $73, $4e, $73, $4e, $73, $4e, $94, $52, $94, $52
    db $94, $52, $94, $52, $94, $52, $94, $52, $94, $52, $73, $4e, $73, $4e, $73, $4e
    db $52, $4a, $52, $4a, $52, $4a, $52, $4a, $31, $46, $31, $46, $31, $46, $10, $42
    db $10, $42, $10, $42, $10, $42, $ef, $3d, $ef, $3d, $ef, $3d, $ce, $39, $ce, $39
    db $ce, $39, $ce, $39, $ad, $35, $ad, $35, $ad, $35, $8c, $31, $8c, $31, $8c, $31
    db $6b, $2d, $6b, $2d, $6b, $2d, $6b, $2d, $4a, $29, $4a, $29, $4a, $29, $29, $25
    db $29, $25, $29, $25, $29, $25, $08, $21, $08, $21, $08, $21, $e7, $1c, $e7, $1c
    db $e7, $1c, $e7, $1c, $c6, $18, $c6, $18, $c6, $18, $a5, $14, $a5, $14, $a5, $14
    db $84, $10, $84, $10, $84, $10, $84, $10, $63, $0c, $63, $0c, $63, $0c, $42, $08
    db $42, $08, $42, $08, $42, $08, $21, $04, $21, $04, $21, $04, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $21, $04, $21, $04, $21, $04, $21, $04, $21, $04, $21, $04
    db $21, $04, $42, $08, $42, $08, $42, $08, $42, $08, $42, $08, $42, $08, $42, $08
    db $63, $0c, $63, $0c, $63, $0c, $63, $0c, $63, $0c, $63, $0c, $63, $0c, $84, $10
    db $84, $10, $84, $10, $84, $10, $84, $10, $84, $10, $84, $10, $a5, $14, $a5, $14
    db $a5, $14, $a5, $14, $a5, $14, $a5, $14, $a5, $14, $c6, $18, $c6, $18, $c6, $18
    db $c6, $18, $c6, $18, $c6, $18, $c6, $18, $e7, $1c, $e7, $1c, $e7, $1c, $e7, $1c
    db $e7, $1c, $e7, $1c, $e7, $1c, $08, $21, $08, $21, $08, $21, $08, $21, $08, $21
    db $08, $21, $08, $21, $29, $25, $29, $25, $29, $25, $29, $25, $29, $25, $29, $25
    db $29, $25, $29, $25, $29, $25, $29, $25, $29, $25, $29, $25, $29, $25, $29, $25
    db $29, $25, $08, $21, $08, $21, $08, $21, $08, $21, $08, $21, $08, $21, $08, $21
    db $e7, $1c, $e7, $1c, $e7, $1c, $e7, $1c, $e7, $1c, $e7, $1c, $e7, $1c, $c6, $18
    db $c6, $18, $c6, $18, $c6, $18, $c6, $18, $c6, $18, $c6, $18, $a5, $14, $a5, $14
    db $a5, $14, $a5, $14, $a5, $14, $a5, $14, $a5, $14, $84, $10, $84, $10, $84, $10
    db $84, $10, $84, $10, $84, $10, $84, $10, $84, $10, $63, $0c, $63, $0c, $63, $0c
    db $63, $0c, $63, $0c, $63, $0c, $63, $0c, $42, $08, $42, $08, $42, $08, $42, $08
    db $42, $08, $42, $08, $42, $08, $21, $04, $21, $04, $21, $04, $21, $04, $21, $04
    db $21, $04, $21, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $4c, $00, $4c, $00, $4c, $00, $4c, $00, $4c, $00
    db $6c, $04, $6c, $04, $6c, $04, $6c, $04, $6c, $04, $6c, $04, $8c, $08, $8c, $08
    db $8c, $08, $8c, $08, $8c, $08, $ac, $0c, $ab, $0c, $ab, $0c, $ab, $0c, $ab, $10
    db $ab, $10, $ab, $10, $ab, $10, $ab, $14, $ab, $14, $aa, $14, $aa, $18, $aa, $18
    db $aa, $18, $aa, $18, $aa, $1c, $aa, $1c, $aa, $1c, $aa, $1c, $a9, $1c, $a9, $1c
    db $c8, $1c, $c8, $20, $c8, $20, $e7, $20, $e7, $20, $e6, $24, $06, $25, $06, $25
    db $05, $29, $25, $29, $24, $29, $24, $29, $24, $2d, $43, $2d, $43, $2d, $42, $2d
    db $41, $29, $41, $25, $41, $25, $41, $21, $41, $1d, $41, $1d, $41, $19, $41, $19
    db $40, $15, $40, $11, $40, $11, $40, $0d, $40, $0d, $40, $09, $40, $05, $40, $05
    db $40, $01, $40, $01, $40, $01, $41, $01, $42, $01, $42, $01, $43, $01, $44, $01
    db $44, $01, $45, $01, $45, $01, $66, $01, $67, $01, $67, $01, $68, $01, $69, $01
    db $6a, $01, $6a, $01, $6b, $01, $6c, $01, $4c, $01, $4c, $01, $4c, $01, $2c, $01
    db $2c, $01, $2c, $01, $2c, $01, $0c, $01, $0c, $01, $0c, $01, $ec, $00, $ec, $00
    db $ec, $00, $ec, $00, $cc, $00, $cc, $00, $cc, $00, $cc, $00, $cb, $00, $cb, $04
    db $cb, $08, $ca, $08, $ca, $0c, $ca, $10, $c9, $10, $c9, $14, $c9, $14, $c8, $18
    db $c8, $1c, $c8, $1c, $c7, $20, $c7, $24, $c7, $28, $c6, $28, $c6, $2c, $c6, $30
    db $a6, $2c, $a6, $28, $87, $24, $87, $24, $87, $20, $68, $1c, $68, $1c, $68, $18
    db $49, $14, $49, $14, $49, $10, $29, $0c, $2a, $0c, $2a, $08, $0a, $04, $0b, $04
    db $0b, $00, $0b, $00, $4c, $00, $98, $00, $98, $00, $b8, $04, $b8, $04, $b8, $04
    db $d8, $08, $d8, $08, $d8, $08, $f8, $0c, $f8, $0c, $f8, $0c, $18, $11, $18, $11
    db $18, $11, $38, $15, $38, $15, $58, $19, $57, $19, $57, $19, $57, $1d, $57, $1d
    db $56, $21, $56, $21, $56, $25, $56, $25, $56, $29, $55, $29, $55, $29, $55, $2d
    db $55, $2d, $54, $31, $54, $31, $54, $35, $54, $35, $54, $39, $53, $39, $72, $39
    db $71, $3d, $90, $3d, $8f, $41, $ae, $41, $ad, $45, $cc, $45, $cb, $49, $eb, $49
    db $0a, $4a, $09, $4e, $28, $4e, $27, $52, $46, $52, $45, $56, $64, $56, $63, $5a
    db $62, $52, $62, $4e, $62, $4a, $62, $46, $62, $3e, $61, $3a, $61, $36, $61, $32
    db $61, $2e, $61, $26, $61, $22, $60, $1e, $60, $1a, $60, $12, $60, $0e, $60, $0a
    db $60, $06, $60, $02, $61, $02, $62, $02, $64, $02, $65, $02, $66, $02, $68, $02
    db $89, $02, $8a, $02, $8b, $02, $8d, $02, $8e, $02, $8f, $02, $b1, $02, $b2, $02
    db $b4, $02, $b5, $02, $b6, $02, $b8, $02, $98, $02, $98, $02, $78, $02, $78, $02
    db $58, $02, $58, $02, $38, $02, $38, $02, $18, $02, $18, $02, $f8, $01, $f8, $01
    db $d8, $01, $d8, $01, $b8, $01, $b8, $01, $98, $01, $98, $01, $97, $05, $96, $09
    db $96, $11, $95, $15, $94, $19, $94, $21, $93, $25, $92, $29, $92, $2d, $91, $35
    db $90, $39, $90, $3d, $8f, $45, $8e, $49, $8e, $51, $8d, $55, $8c, $59, $8c, $61
    db $6c, $59, $4d, $55, $2d, $4d, $2e, $49, $0e, $45, $ef, $3c, $ef, $38, $d0, $34
    db $b0, $2c, $b1, $28, $92, $24, $72, $1c, $73, $18, $53, $14, $34, $0c, $34, $08
    db $15, $04, $15, $00, $98, $00, $9f, $01, $9f, $05, $bf, $09, $bf, $09, $df, $0d
    db $df, $11, $ff, $11, $ff, $15, $1f, $1a, $1f, $1e, $3f, $1e, $3f, $22, $5f, $26
    db $5f, $26, $7f, $2a, $7f, $2e, $9f, $32, $9f, $32, $9f, $36, $9f, $3a, $9f, $3e
    db $9f, $42, $9f, $46, $9f, $4a, $9f, $4e, $9f, $52, $9f, $52, $9f, $56, $9f, $5a
    db $9f, $5e, $9f, $62, $9f, $66, $9f, $6a, $9f, $6e, $9f, $72, $9d, $72, $9c, $72
    db $bb, $72, $ba, $72, $b9, $72, $d8, $72, $d6, $76, $f5, $76, $f4, $76, $f3, $76
    db $12, $77, $11, $77, $2f, $7b, $2e, $7b, $2d, $7b, $4c, $7b, $4b, $7b, $6a, $7b
    db $69, $73, $68, $6b, $68, $67, $67, $5f, $87, $57, $86, $53, $86, $4b, $85, $43
    db $85, $3f, $a4, $37, $a3, $2f, $a3, $2b, $a2, $23, $c2, $1b, $c1, $17, $c1, $0f
    db $c0, $07, $c0, $03, $a1, $03, $a3, $03, $a5, $03, $a6, $03, $a8, $03, $aa, $03
    db $ac, $03, $ad, $03, $af, $03, $b1, $03, $b2, $03, $b4, $03, $b6, $03, $b8, $03
    db $b9, $03, $bb, $03, $bd, $03, $be, $03, $9e, $03, $9e, $03, $9e, $03, $7e, $03
    db $7e, $03, $7e, $03, $7e, $03, $5e, $03, $5e, $03, $5e, $03, $3e, $03, $3e, $03
    db $3e, $03, $3e, $03, $1e, $03, $1e, $03, $1e, $03, $fe, $02, $dd, $06, $dc, $0e
    db $dc, $16, $db, $1a, $db, $22, $da, $2a, $ba, $32, $b9, $36, $b9, $3e, $b8, $46
    db $b7, $4a, $b7, $52, $96, $5a, $96, $62, $95, $66, $95, $6e, $94, $76, $94, $7a
    db $54, $72, $35, $6a, $15, $66, $f6, $5d, $d7, $55, $b7, $51, $98, $49, $78, $41
    db $59, $3d, $1a, $35, $fa, $2c, $db, $28, $bb, $20, $9c, $18, $7d, $14, $5d, $0c
    db $3e, $04, $1e, $00, $9f, $01

    nop
    jr nz, jr_00f_4aa7

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_00f_4ad0

    ld d, d
    ld b, l
    ld b, h
    ld c, c
    ld d, h
    ld d, e
    jr nz, jr_00f_4ab5

    jr nz, jr_00f_4ab7

    jr nz, jr_00f_4ab9

    inc b
    nop
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    xor e
    xor h
    xor l

jr_00f_4aa7:
    xor [hl]
    jr nz, jr_00f_4aca

    jr nz, jr_00f_4acc

    jr nz, jr_00f_4ace

    jr nz, jr_00f_4ad0

    nop
    jr nz, @+$22

    jr nz, @+$22

jr_00f_4ab5:
    jr nz, @+$22

jr_00f_4ab7:
    jr nz, @+$22

jr_00f_4ab9:
    xor a
    or b
    or c
    or d
    jr nz, jr_00f_4adf

    jr nz, jr_00f_4ae1

    jr nz, jr_00f_4ae3

    jr nz, jr_00f_4ae5

    nop
    jr nz, @+$22

    jr nz, @+$22

jr_00f_4aca:
    jr nz, @+$22

jr_00f_4acc:
    jr nz, @+$22

jr_00f_4ace:
    or e
    or h

jr_00f_4ad0:
    or l
    or [hl]
    jr nz, jr_00f_4af4

    jr nz, jr_00f_4af6

    jr nz, jr_00f_4af8

    jr nz, jr_00f_4afa

    nop
    jr nz, jr_00f_4afd

    jr nz, jr_00f_4aff

jr_00f_4adf:
    jr nz, jr_00f_4b01

jr_00f_4ae1:
    jr nz, @+$22

jr_00f_4ae3:
    or a
    cp b

jr_00f_4ae5:
    cp c
    cp d
    jr nz, jr_00f_4b09

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_00f_4b0f

    nop
    nop
    nop
    jr nz, jr_00f_4b14

jr_00f_4af4:
    jr nz, jr_00f_4b16

jr_00f_4af6:
    jr nz, jr_00f_4b4b

jr_00f_4af8:
    ld b, e
    ld c, c

jr_00f_4afa:
    jr nz, jr_00f_4b3f

    ld d, d

jr_00f_4afd:
    ld b, l
    ld b, h

jr_00f_4aff:
    ld c, c
    ld d, h

jr_00f_4b01:
    ld d, e
    jr nz, jr_00f_4b24

    jr nz, jr_00f_4b26

    inc b
    nop
    nop

jr_00f_4b09:
    nop
    jr nz, jr_00f_4b2c

    jr nz, @+$45

    ld c, b

jr_00f_4b0f:
    ld c, c
    ld b, l
    ld b, [hl]
    jr nz, jr_00f_4b59

jr_00f_4b14:
    ld e, b
    ld b, l

jr_00f_4b16:
    ld b, e
    ld d, l
    ld d, h
    ld c, c
    ld d, [hl]
    ld b, l
    jr nz, jr_00f_4b3e

    inc b
    nop
    jr nz, jr_00f_4b42

    jr nz, jr_00f_4b44

jr_00f_4b24:
    ld c, d
    ld b, c

jr_00f_4b26:
    ld c, [hl]
    ld b, l
    jr nz, jr_00f_4b6d

    ld b, c
    ld d, [hl]

jr_00f_4b2c:
    ld b, c
    ld c, [hl]
    ld b, c
    ld b, a
    ld c, b
    jr nz, jr_00f_4b53

    jr nz, jr_00f_4b39

    nop
    nop
    jr nz, jr_00f_4b59

jr_00f_4b39:
    jr nz, jr_00f_4b5b

    jr nz, jr_00f_4b81

    ld c, c

jr_00f_4b3e:
    ld d, d

jr_00f_4b3f:
    ld b, l
    ld b, e
    ld d, h

jr_00f_4b42:
    ld c, a
    ld d, d

jr_00f_4b44:
    jr nz, jr_00f_4b95

    ld b, [hl]
    jr nz, jr_00f_4b69

    jr nz, @+$22

jr_00f_4b4b:
    inc b
    jr nz, jr_00f_4b6e

    jr nz, jr_00f_4b70

    jr nz, jr_00f_4b96

    ld b, l

jr_00f_4b53:
    ld d, [hl]
    ld b, l
    ld c, h
    ld c, a
    ld d, b
    ld c, l

jr_00f_4b59:
    ld b, l
    ld c, [hl]

jr_00f_4b5b:
    ld d, h
    jr nz, @+$22

    jr nz, @+$22

    inc b
    nop
    jr nz, jr_00f_4b84

    jr nz, @+$46

    ld b, c
    ld d, [hl]
    ld c, c

jr_00f_4b69:
    ld b, h
    jr nz, jr_00f_4bbe

    ld b, c

jr_00f_4b6d:
    ld d, h

jr_00f_4b6e:
    ld b, e
    ld c, h

jr_00f_4b70:
    ld c, c
    ld b, [hl]
    ld b, [hl]
    ld b, l
    jr nz, jr_00f_4b96

    inc b
    nop
    nop
    nop
    nop
    jr nz, @+$22

    jr nz, jr_00f_4b9f

    jr nz, jr_00f_4ba1

jr_00f_4b81:
    ld d, b
    ld d, d
    ld c, a

jr_00f_4b84:
    ld b, h
    ld d, l
    ld b, e
    ld b, l
    ld d, d
    jr nz, jr_00f_4bab

    jr nz, jr_00f_4bad

    jr nz, jr_00f_4baf

    nop
    nop
    jr nz, jr_00f_4bb3

    jr nz, @+$4c

jr_00f_4b95:
    ld c, a

jr_00f_4b96:
    ld c, [hl]
    ld b, c
    ld d, h
    ld c, b
    ld b, c
    ld c, [hl]
    jr nz, jr_00f_4be1

    ld c, a

jr_00f_4b9f:
    ld d, l
    ld d, d

jr_00f_4ba1:
    ld d, h
    jr nz, @+$22

    jr nz, jr_00f_4ba6

jr_00f_4ba6:
    nop
    nop
    nop
    jr nz, jr_00f_4bde

jr_00f_4bab:
    ld d, d
    ld b, h

jr_00f_4bad:
    jr nz, @+$52

jr_00f_4baf:
    ld b, c
    ld d, d
    ld d, h
    ld e, c

jr_00f_4bb3:
    jr nz, jr_00f_4c07

    ld b, l
    ld c, h
    ld b, c
    ld d, h
    ld c, c
    ld c, a
    ld c, [hl]
    ld d, e
    inc b

jr_00f_4bbe:
    nop
    jr nz, jr_00f_4be1

    jr nz, jr_00f_4be3

    jr nz, jr_00f_4c06

    ld c, [hl]
    ld b, h
    ld e, c
    jr nz, jr_00f_4c19

    dec bc
    ld b, h
    ld c, a
    ld d, a
    ld b, h
    jr nz, jr_00f_4bf1

    jr nz, jr_00f_4bf3

    inc b
    nop
    nop
    nop
    jr nz, jr_00f_4bf9

    jr nz, jr_00f_4bfb

    jr nz, jr_00f_4c2e

    ld b, c

jr_00f_4bde:
    jr nz, jr_00f_4c25

    ld c, [hl]

jr_00f_4be1:
    ld b, a
    ld c, c

jr_00f_4be3:
    ld c, [hl]
    ld b, l
    ld b, l
    ld d, d
    jr nz, jr_00f_4c09

    jr nz, jr_00f_4c0b

    inc b
    nop
    jr nz, @+$22

    jr nz, jr_00f_4c11

jr_00f_4bf1:
    jr nz, @+$22

jr_00f_4bf3:
    ld b, d
    ld b, l
    ld c, [hl]
    jr nz, @+$4f

    ld b, c

jr_00f_4bf9:
    ld d, e
    ld c, a

jr_00f_4bfb:
    ld c, [hl]
    jr nz, @+$22

    jr nz, jr_00f_4c20

    jr nz, jr_00f_4c06

    nop
    nop
    nop
    ld d, b

jr_00f_4c06:
    ld b, c

jr_00f_4c07:
    ld b, e
    ld c, e

jr_00f_4c09:
    ld b, c
    ld b, a

jr_00f_4c0b:
    ld c, c
    ld c, [hl]
    ld b, a
    jr nz, jr_00f_4c51

    ld c, [hl]

jr_00f_4c11:
    ld b, h
    jr nz, jr_00f_4c58

    ld b, l
    ld d, e
    ld c, c
    ld b, a
    ld c, [hl]

jr_00f_4c19:
    nop
    nop
    jr nz, jr_00f_4c3d

    jr nz, jr_00f_4c6a

    ld b, l

jr_00f_4c20:
    ld c, c
    ld d, h
    ld c, b
    jr nz, @+$4a

jr_00f_4c25:
    ld c, a
    ld b, h
    ld b, a
    ld b, l
    ld d, h
    ld d, h
    ld d, e
    jr nz, jr_00f_4c4e

jr_00f_4c2e:
    jr nz, jr_00f_4c30

jr_00f_4c30:
    nop
    nop
    nop
    jr nz, jr_00f_4c55

    jr nz, @+$22

    ld b, c
    ld c, [hl]
    ld b, h
    jr nz, jr_00f_4c90

    ld c, b

jr_00f_4c3d:
    ld b, c
    ld c, [hl]
    ld c, e
    ld d, e
    jr nz, @+$56

    ld c, a
    jr nz, @+$22

    jr nz, jr_00f_4c4c

    jr nz, jr_00f_4c6a

    jr nz, @+$47

jr_00f_4c4c:
    ld d, [hl]
    ld b, l

jr_00f_4c4e:
    ld d, d
    ld e, c
    ld c, a

jr_00f_4c51:
    ld c, [hl]
    ld b, l
    jr nz, jr_00f_4c96

jr_00f_4c55:
    ld d, h
    jr nz, jr_00f_4cab

jr_00f_4c58:
    ld b, e
    ld c, c
    jr nz, @+$22

    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00f_4c85

    jr nz, @+$22

    ld d, b
    ld d, l
    ld c, e

jr_00f_4c6a:
    ld c, e
    ld b, c
    jr nz, @+$45

    ld d, d
    ld b, l
    ld b, h
    ld c, c
    ld d, h
    ld d, e
    jr nz, jr_00f_4c96

    jr nz, @+$06

    nop
    nop
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    db $eb
    db $ec

jr_00f_4c85:
    db $ed
    xor $20
    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_00f_4cae

    jr nz, jr_00f_4c90

jr_00f_4c90:
    jr nz, jr_00f_4cb2

    jr nz, jr_00f_4cb4

    jr nz, jr_00f_4cb6

jr_00f_4c96:
    jr nz, jr_00f_4cb8

    rst $28
    ldh a, [$f1]
    ld a, [c]
    jr nz, jr_00f_4cbe

    jr nz, jr_00f_4cc0

    jr nz, jr_00f_4cc2

    jr nz, @+$22

    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

jr_00f_4cab:
    jr nz, @+$22

    di

jr_00f_4cae:
    db $f4
    push af
    or $20

jr_00f_4cb2:
    jr nz, jr_00f_4cd4

jr_00f_4cb4:
    jr nz, jr_00f_4cd6

jr_00f_4cb6:
    jr nz, jr_00f_4cd8

jr_00f_4cb8:
    jr nz, jr_00f_4cba

jr_00f_4cba:
    jr nz, jr_00f_4cdc

    jr nz, jr_00f_4cde

jr_00f_4cbe:
    jr nz, jr_00f_4ce0

jr_00f_4cc0:
    jr nz, jr_00f_4ce2

jr_00f_4cc2:
    rst $30
    ld hl, sp-$07
    ld a, [$2020]
    jr nz, jr_00f_4cea

    jr nz, jr_00f_4cec

    jr nz, jr_00f_4cee

    nop
    nop
    ld d, b
    ld d, d
    ld c, a
    ld b, h

jr_00f_4cd4:
    ld d, l
    ld b, e

jr_00f_4cd6:
    ld d, h
    ld c, c

jr_00f_4cd8:
    ld c, a
    ld c, [hl]
    jr nz, jr_00f_4d20

jr_00f_4cdc:
    ld c, c
    ld d, d

jr_00f_4cde:
    ld b, l
    ld b, e

jr_00f_4ce0:
    ld d, h
    ld c, a

jr_00f_4ce2:
    ld d, d
    ld d, e
    nop
    nop
    jr nz, jr_00f_4d08

    jr nz, jr_00f_4d0a

jr_00f_4cea:
    ld b, h
    ld b, c

jr_00f_4cec:
    ld c, l
    ld c, a

jr_00f_4cee:
    ld c, [hl]
    jr nz, jr_00f_4d33

    ld d, d
    ld b, c
    ld c, [hl]
    ld b, e
    ld c, b
    jr nz, @+$22

    jr nz, @+$22

    nop
    jr nz, jr_00f_4d1d

    jr nz, @+$45

    ld c, h
    ld c, c
    ld d, [hl]
    ld b, l
    jr nz, @+$56

    ld c, a
    ld d, a
    ld c, [hl]

jr_00f_4d08:
    ld d, e
    ld b, l

jr_00f_4d0a:
    ld c, [hl]
    ld b, h
    jr nz, jr_00f_4d2e

    jr nz, jr_00f_4d10

jr_00f_4d10:
    nop
    nop
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    set 1, h

jr_00f_4d1d:
    call $20ce

jr_00f_4d20:
    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_00f_4d46

    jr nz, jr_00f_4d28

jr_00f_4d28:
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

jr_00f_4d2e:
    jr nz, @+$22

    rst $08
    ret nc

    pop de

jr_00f_4d33:
    jp nc, Jump_000_2020

    jr nz, jr_00f_4d58

    jr nz, jr_00f_4d5a

    jr nz, jr_00f_4d5c

    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    db $d3

jr_00f_4d46:
    call nc, $d6d5
    jr nz, @+$22

    jr nz, jr_00f_4d6d

    jr nz, jr_00f_4d6f

    jr nz, @+$22

    nop
    jr nz, jr_00f_4d74

    jr nz, jr_00f_4d76

    jr nz, jr_00f_4d78

jr_00f_4d58:
    jr nz, jr_00f_4d7a

jr_00f_4d5a:
    rst $10
    ret c

jr_00f_4d5c:
    reti


    jp c, Jump_000_2020

    jr nz, jr_00f_4d82

    jr nz, jr_00f_4d84

    jr nz, jr_00f_4d86

    nop
    nop
    jr nz, jr_00f_4d8a

    jr nz, jr_00f_4d8c

    ld b, a

jr_00f_4d6d:
    ld b, c
    ld c, l

jr_00f_4d6f:
    ld b, l
    jr nz, jr_00f_4db5

    ld c, a
    ld c, [hl]

jr_00f_4d74:
    ld b, e
    ld b, l

jr_00f_4d76:
    ld d, b
    ld d, h

jr_00f_4d78:
    jr nz, jr_00f_4d9a

jr_00f_4d7a:
    jr nz, jr_00f_4d9c

    nop
    nop
    jr nz, jr_00f_4da0

    jr nz, @+$4f

jr_00f_4d82:
    ld b, c
    ld d, d

jr_00f_4d84:
    ld b, e
    ld d, l

jr_00f_4d86:
    ld d, e
    jr nz, @+$55

    ld d, h

jr_00f_4d8a:
    ld d, d
    ld c, c

jr_00f_4d8c:
    ld c, [hl]
    ld b, a
    ld b, l
    ld d, d
    jr nz, @+$22

    inc b
    jr nz, jr_00f_4db5

    jr nz, jr_00f_4db7

    jr nz, @+$43

    ld c, [hl]

jr_00f_4d9a:
    ld b, h
    ld e, c

jr_00f_4d9c:
    jr nz, jr_00f_4de1

    ld c, a
    ld b, c

jr_00f_4da0:
    ld d, h
    ld b, l
    ld d, e
    jr nz, @+$22

    jr nz, @+$22

    inc b
    nop
    nop
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    ld e, e
    ld e, h

jr_00f_4db5:
    ld e, l
    ld e, [hl]

jr_00f_4db7:
    jr nz, jr_00f_4dd9

    jr nz, jr_00f_4ddb

    jr nz, jr_00f_4ddd

    jr nz, jr_00f_4ddf

    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    ld e, a
    ld h, b
    ld h, c
    ld h, d
    jr nz, jr_00f_4dee

    jr nz, jr_00f_4df0

    jr nz, jr_00f_4df2

    jr nz, jr_00f_4df4

    nop
    jr nz, @+$22

    jr nz, @+$22

jr_00f_4dd9:
    jr nz, @+$22

jr_00f_4ddb:
    jr nz, @+$22

jr_00f_4ddd:
    ld h, e
    ld h, h

jr_00f_4ddf:
    ld h, l
    ld h, [hl]

jr_00f_4de1:
    jr nz, @+$22

    jr nz, jr_00f_4e05

    jr nz, jr_00f_4e07

    jr nz, jr_00f_4e09

    nop
    jr nz, jr_00f_4e0c

    jr nz, jr_00f_4e0e

jr_00f_4dee:
    jr nz, jr_00f_4e10

jr_00f_4df0:
    jr nz, jr_00f_4e12

jr_00f_4df2:
    ld h, a
    ld l, b

jr_00f_4df4:
    ld l, c
    ld l, d
    jr nz, jr_00f_4e18

    jr nz, jr_00f_4e1a

    jr nz, jr_00f_4e1c

    jr nz, jr_00f_4e1e

    nop
    nop
    jr nz, jr_00f_4e22

    jr nz, jr_00f_4e50

    ld b, l

jr_00f_4e05:
    ld b, c
    ld b, h

jr_00f_4e07:
    jr nz, jr_00f_4e59

jr_00f_4e09:
    ld d, d
    ld c, a
    ld b, a

jr_00f_4e0c:
    ld d, d
    ld b, c

jr_00f_4e0e:
    ld c, l
    ld c, l

jr_00f_4e10:
    ld b, l
    ld d, d

jr_00f_4e12:
    jr nz, jr_00f_4e34

    inc b
    nop
    jr nz, jr_00f_4e38

jr_00f_4e18:
    jr nz, jr_00f_4e3a

jr_00f_4e1a:
    jr nz, jr_00f_4e5d

jr_00f_4e1c:
    ld c, [hl]
    ld b, h

jr_00f_4e1e:
    ld e, c
    jr nz, jr_00f_4e64

    ld c, a

jr_00f_4e22:
    ld b, c
    ld d, h
    ld b, l
    ld d, e
    jr nz, @+$22

    jr nz, jr_00f_4e4a

    inc b
    nop
    nop
    nop
    jr nz, jr_00f_4e50

    jr nz, jr_00f_4e52

    jr nz, jr_00f_4e75

jr_00f_4e34:
    ld b, h
    ld b, h
    ld c, c
    ld d, h

jr_00f_4e38:
    ld c, c
    ld c, a

jr_00f_4e3a:
    ld c, [hl]
    ld b, c
    ld c, h
    jr nz, jr_00f_4e5f

    jr nz, jr_00f_4e61

    jr nz, jr_00f_4e43

jr_00f_4e43:
    jr nz, jr_00f_4e65

    jr nz, jr_00f_4e67

    jr nz, @+$52

    ld d, d

jr_00f_4e4a:
    ld c, a
    ld b, a
    ld d, d
    ld b, c
    ld c, l
    ld c, l

jr_00f_4e50:
    ld c, c
    ld c, [hl]

jr_00f_4e52:
    ld b, a
    jr nz, jr_00f_4e75

    jr nz, jr_00f_4e77

    inc b
    nop

jr_00f_4e59:
    jr nz, jr_00f_4e7b

    jr nz, @+$45

jr_00f_4e5d:
    ld c, h
    ld c, c

jr_00f_4e5f:
    ld d, [hl]
    ld b, l

jr_00f_4e61:
    jr nz, @+$56

    ld c, a

jr_00f_4e64:
    ld d, a

jr_00f_4e65:
    ld c, [hl]
    ld d, e

jr_00f_4e67:
    ld b, l
    ld c, [hl]
    ld b, h
    jr nz, jr_00f_4e8c

    jr nz, jr_00f_4e6e

jr_00f_4e6e:
    nop
    nop
    nop
    jr nz, @+$22

    jr nz, @+$22

jr_00f_4e75:
    jr nz, @+$22

jr_00f_4e77:
    jr nz, @+$22

    cp e
    cp h

jr_00f_4e7b:
    cp l
    cp [hl]
    jr nz, jr_00f_4e9f

    jr nz, jr_00f_4ea1

    jr nz, jr_00f_4ea3

    jr nz, @+$22

    nop
    jr nz, jr_00f_4ea8

    jr nz, jr_00f_4eaa

    jr nz, jr_00f_4eac

jr_00f_4e8c:
    jr nz, jr_00f_4eae

    cp a
    ret nz

    pop bc
    jp nz, Jump_000_2020

    jr nz, jr_00f_4eb6

    jr nz, jr_00f_4eb8

    jr nz, jr_00f_4eba

    nop
    jr nz, @+$22

    jr nz, @+$22

jr_00f_4e9f:
    jr nz, @+$22

jr_00f_4ea1:
    jr nz, @+$22

jr_00f_4ea3:
    jp $c5c4


    add $20

jr_00f_4ea8:
    jr nz, jr_00f_4eca

jr_00f_4eaa:
    jr nz, jr_00f_4ecc

jr_00f_4eac:
    jr nz, jr_00f_4ece

jr_00f_4eae:
    jr nz, jr_00f_4eb0

jr_00f_4eb0:
    jr nz, jr_00f_4ed2

    jr nz, jr_00f_4ed4

    jr nz, jr_00f_4ed6

jr_00f_4eb6:
    jr nz, jr_00f_4ed8

jr_00f_4eb8:
    rst $00
    ret z

jr_00f_4eba:
    ret


    jp z, Jump_000_2020

    jr nz, jr_00f_4ee0

    jr nz, jr_00f_4ee2

    jr nz, jr_00f_4ee4

    nop
    nop
    jr nz, jr_00f_4ee8

    jr nz, jr_00f_4eea

jr_00f_4eca:
    jr nz, jr_00f_4eec

jr_00f_4ecc:
    ld b, a
    ld d, d

jr_00f_4ece:
    ld b, c
    ld d, b
    ld c, b
    ld c, c

jr_00f_4ed2:
    ld b, e
    ld d, e

jr_00f_4ed4:
    jr nz, jr_00f_4ef6

jr_00f_4ed6:
    jr nz, jr_00f_4ef8

jr_00f_4ed8:
    jr nz, jr_00f_4efa

    nop
    nop
    jr nz, jr_00f_4efe

    jr nz, @+$4f

jr_00f_4ee0:
    ld b, c
    ld d, d

jr_00f_4ee2:
    ld b, e
    ld d, l

jr_00f_4ee4:
    ld d, e
    jr nz, @+$55

    ld d, h

jr_00f_4ee8:
    ld d, d
    ld c, c

jr_00f_4eea:
    ld c, [hl]
    ld b, a

jr_00f_4eec:
    ld b, l
    ld d, d
    jr nz, @+$22

    inc b
    nop
    nop
    nop
    jr nz, @+$22

jr_00f_4ef6:
    jr nz, @+$22

jr_00f_4ef8:
    jr nz, @+$22

jr_00f_4efa:
    jr nz, @+$22

    sbc e
    sbc h

jr_00f_4efe:
    sbc l
    sbc [hl]
    jr nz, jr_00f_4f22

    jr nz, jr_00f_4f24

    jr nz, jr_00f_4f26

    jr nz, jr_00f_4f28

    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    sbc a
    and b
    and c
    and d
    jr nz, jr_00f_4f37

    jr nz, jr_00f_4f39

    jr nz, jr_00f_4f3b

    jr nz, jr_00f_4f3d

    nop
    jr nz, @+$22

    jr nz, @+$22

jr_00f_4f22:
    jr nz, @+$22

jr_00f_4f24:
    jr nz, @+$22

jr_00f_4f26:
    and e
    and h

jr_00f_4f28:
    and l
    and [hl]
    jr nz, @+$22

    jr nz, jr_00f_4f4e

    jr nz, jr_00f_4f50

    jr nz, jr_00f_4f52

    nop
    jr nz, jr_00f_4f55

    jr nz, @+$22

jr_00f_4f37:
    jr nz, jr_00f_4f59

jr_00f_4f39:
    jr nz, @+$22

jr_00f_4f3b:
    and a
    xor b

jr_00f_4f3d:
    xor c
    xor d
    jr nz, jr_00f_4f61

    jr nz, jr_00f_4f63

    jr nz, jr_00f_4f65

    jr nz, jr_00f_4f67

    nop
    nop
    jr nz, jr_00f_4f6b

    jr nz, jr_00f_4f6d

    ld c, l

jr_00f_4f4e:
    ld d, l
    ld d, e

jr_00f_4f50:
    ld c, c
    ld b, e

jr_00f_4f52:
    jr nz, jr_00f_4f95

    ld c, [hl]

jr_00f_4f55:
    ld b, h
    jr nz, jr_00f_4fab

    ld b, [hl]

jr_00f_4f59:
    ld e, b
    jr nz, jr_00f_4f7c

    jr nz, @+$06

    nop
    jr nz, @+$22

jr_00f_4f61:
    jr nz, jr_00f_4f83

jr_00f_4f63:
    jr nz, jr_00f_4f85

jr_00f_4f65:
    ld b, c
    ld d, l

jr_00f_4f67:
    ld b, h
    ld c, c
    ld c, a
    ld b, c

jr_00f_4f6b:
    ld d, d
    ld d, h

jr_00f_4f6d:
    ld d, e
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$06

    nop
    nop
    nop
    jr nz, jr_00f_4f99

    jr nz, jr_00f_4f9b

    ld d, e

jr_00f_4f7c:
    ld c, a
    ld d, l
    ld c, [hl]
    ld b, h
    jr nz, jr_00f_4fc6

    ld d, d

jr_00f_4f83:
    ld c, c
    ld d, [hl]

jr_00f_4f85:
    ld b, l
    ld d, d
    ld d, e
    jr nz, @+$22

    jr nz, @+$06

    nop
    jr nz, jr_00f_4faf

    jr nz, jr_00f_4fb1

    jr nz, jr_00f_4fb3

    ld b, c
    ld d, l

jr_00f_4f95:
    ld b, h
    ld c, c
    ld c, a
    ld b, c

jr_00f_4f99:
    ld d, d
    ld d, h

jr_00f_4f9b:
    ld d, e
    jr nz, jr_00f_4fbe

    jr nz, jr_00f_4fc0

    jr nz, @+$06

    nop
    nop
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

jr_00f_4fab:
    jr nz, @+$22

    ld l, e
    ld l, h

jr_00f_4faf:
    ld l, l
    ld l, [hl]

jr_00f_4fb1:
    jr nz, jr_00f_4fd3

jr_00f_4fb3:
    jr nz, jr_00f_4fd5

    jr nz, jr_00f_4fd7

    jr nz, jr_00f_4fd9

    nop
    jr nz, @+$22

    jr nz, @+$22

jr_00f_4fbe:
    jr nz, @+$22

jr_00f_4fc0:
    jr nz, @+$22

    ld l, a
    ld [hl], b
    ld [hl], c
    ld [hl], d

jr_00f_4fc6:
    jr nz, jr_00f_4fe8

    jr nz, jr_00f_4fea

    jr nz, jr_00f_4fec

    jr nz, jr_00f_4fee

    nop
    jr nz, @+$22

    jr nz, @+$22

jr_00f_4fd3:
    jr nz, @+$22

jr_00f_4fd5:
    jr nz, @+$22

jr_00f_4fd7:
    ld [hl], e
    ld [hl], h

jr_00f_4fd9:
    ld [hl], l
    db $76
    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_00f_5001

    jr nz, jr_00f_5003

    nop
    jr nz, jr_00f_5006

    jr nz, jr_00f_5008

jr_00f_4fe8:
    jr nz, @+$22

jr_00f_4fea:
    jr nz, @+$22

jr_00f_4fec:
    ld [hl], a
    ld a, b

jr_00f_4fee:
    ld a, c
    ld a, d
    jr nz, jr_00f_5012

    jr nz, jr_00f_5014

    jr nz, jr_00f_5016

    jr nz, jr_00f_5018

    nop
    nop
    jr nz, jr_00f_501c

    jr nz, jr_00f_501e

    jr nz, jr_00f_5020

    ld d, l

jr_00f_5001:
    ld d, h
    ld c, c

jr_00f_5003:
    ld c, h
    ld c, c
    ld d, h

jr_00f_5006:
    ld c, c
    ld b, l

jr_00f_5008:
    ld d, e
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$06

    nop
    jr nz, @+$22

jr_00f_5012:
    jr nz, @+$45

jr_00f_5014:
    ld c, h
    ld c, c

jr_00f_5016:
    ld d, [hl]
    ld b, l

jr_00f_5018:
    jr nz, @+$56

    ld c, a
    ld d, a

jr_00f_501c:
    ld c, [hl]
    ld d, e

jr_00f_501e:
    ld b, l
    ld c, [hl]

jr_00f_5020:
    ld b, h
    jr nz, jr_00f_5043

    jr nz, jr_00f_5025

jr_00f_5025:
    nop
    nop
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    db $db
    call c, $dedd
    jr nz, jr_00f_5056

    jr nz, jr_00f_5058

    jr nz, jr_00f_505a

    jr nz, jr_00f_505c

    nop
    jr nz, jr_00f_505f

    jr nz, jr_00f_5061

    jr nz, jr_00f_5063

jr_00f_5043:
    jr nz, jr_00f_5065

    rst $18
    ldh [$e1], a
    ld [c], a
    jr nz, jr_00f_506b

    jr nz, jr_00f_506d

    jr nz, jr_00f_506f

    jr nz, @+$22

    nop
    jr nz, @+$22

    jr nz, @+$22

jr_00f_5056:
    jr nz, @+$22

jr_00f_5058:
    jr nz, @+$22

jr_00f_505a:
    db $e3
    db $e4

jr_00f_505c:
    push hl
    and $20

jr_00f_505f:
    jr nz, jr_00f_5081

jr_00f_5061:
    jr nz, jr_00f_5083

jr_00f_5063:
    jr nz, jr_00f_5085

jr_00f_5065:
    jr nz, jr_00f_5067

jr_00f_5067:
    jr nz, jr_00f_5089

    jr nz, jr_00f_508b

jr_00f_506b:
    jr nz, jr_00f_508d

jr_00f_506d:
    jr nz, jr_00f_508f

jr_00f_506f:
    rst $20
    add sp, -$17
    ld [$2020], a
    jr nz, jr_00f_5097

    jr nz, jr_00f_5099

    jr nz, jr_00f_509b

    nop
    nop
    jr nz, jr_00f_509f

    jr nz, jr_00f_50a1

jr_00f_5081:
    ld c, h
    ld b, l

jr_00f_5083:
    ld d, [hl]
    ld b, l

jr_00f_5085:
    ld c, h
    jr nz, jr_00f_50cc

    ld b, l

jr_00f_5089:
    ld d, e
    ld c, c

jr_00f_508b:
    ld b, a
    ld c, [hl]

jr_00f_508d:
    jr nz, jr_00f_50af

jr_00f_508f:
    jr nz, jr_00f_50b1

    nop
    nop
    jr nz, jr_00f_50b5

    jr nz, jr_00f_50da

jr_00f_5097:
    ld c, h
    ld c, c

jr_00f_5099:
    ld d, [hl]
    ld b, l

jr_00f_509b:
    jr nz, @+$56

    ld c, a
    ld d, a

jr_00f_509f:
    ld c, [hl]
    ld d, e

jr_00f_50a1:
    ld b, l
    ld c, [hl]
    ld b, h
    jr nz, jr_00f_50c6

    jr nz, jr_00f_50a8

jr_00f_50a8:
    jr nz, jr_00f_50ca

    jr nz, @+$4f

    ld b, c
    ld d, d
    ld b, e

jr_00f_50af:
    ld d, l
    ld d, e

jr_00f_50b1:
    jr nz, @+$55

    ld d, h
    ld d, d

jr_00f_50b5:
    ld c, c
    ld c, [hl]
    ld b, a
    ld b, l
    ld d, d
    jr nz, jr_00f_50dc

    inc b
    jr nz, jr_00f_50df

    jr nz, jr_00f_50e1

    jr nz, @+$43

    ld c, [hl]
    ld b, h
    ld e, c

jr_00f_50c6:
    jr nz, jr_00f_510b

    ld c, a
    ld b, c

jr_00f_50ca:
    ld d, h
    ld b, l

jr_00f_50cc:
    ld d, e
    jr nz, @+$22

    jr nz, @+$22

    inc b
    jr nz, jr_00f_50f4

    jr nz, @+$43

    ld c, [hl]
    ld b, c
    ld d, h
    ld c, a

jr_00f_50da:
    ld c, h
    ld b, l

jr_00f_50dc:
    jr nz, jr_00f_5120

    ld d, d

jr_00f_50df:
    ld b, c
    ld c, [hl]

jr_00f_50e1:
    ld b, e
    ld c, b
    jr nz, jr_00f_5105

    jr nz, jr_00f_50e7

jr_00f_50e7:
    nop
    nop
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    adc e
    adc h

jr_00f_50f4:
    adc l
    adc [hl]
    jr nz, jr_00f_5118

    jr nz, jr_00f_511a

    jr nz, jr_00f_511c

    jr nz, jr_00f_511e

    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

jr_00f_5105:
    jr nz, @+$22

    adc a
    sub b
    sub c
    sub d

jr_00f_510b:
    jr nz, jr_00f_512d

    jr nz, jr_00f_512f

    jr nz, jr_00f_5131

    jr nz, jr_00f_5133

    nop
    jr nz, @+$22

    jr nz, @+$22

jr_00f_5118:
    jr nz, @+$22

jr_00f_511a:
    jr nz, @+$22

jr_00f_511c:
    sub e
    sub h

jr_00f_511e:
    sub l
    sub [hl]

jr_00f_5120:
    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_00f_5146

    jr nz, jr_00f_5148

    nop
    jr nz, jr_00f_514b

    jr nz, jr_00f_514d

jr_00f_512d:
    jr nz, jr_00f_514f

jr_00f_512f:
    jr nz, jr_00f_5151

jr_00f_5131:
    sub a
    sbc b

jr_00f_5133:
    sbc c
    sbc d
    jr nz, jr_00f_5157

    jr nz, jr_00f_5159

    jr nz, jr_00f_515b

    jr nz, jr_00f_515d

    nop
    nop
    jr nz, jr_00f_5161

    jr nz, jr_00f_5163

    jr nz, @+$52

    ld c, h

jr_00f_5146:
    ld b, c
    ld e, c

jr_00f_5148:
    ld d, h
    ld b, l
    ld d, e

jr_00f_514b:
    ld d, h
    ld b, l

jr_00f_514d:
    ld d, d
    ld d, e

jr_00f_514f:
    jr nz, jr_00f_5171

jr_00f_5151:
    jr nz, jr_00f_5173

    inc b
    nop
    jr nz, jr_00f_5177

jr_00f_5157:
    jr nz, jr_00f_519c

jr_00f_5159:
    ld c, h
    ld c, c

jr_00f_515b:
    ld d, [hl]
    ld b, l

jr_00f_515d:
    jr nz, jr_00f_51b3

    ld c, a
    ld d, a

jr_00f_5161:
    ld c, [hl]
    ld d, e

jr_00f_5163:
    ld b, l
    ld c, [hl]
    ld b, h
    jr nz, jr_00f_5188

    jr nz, jr_00f_516a

jr_00f_516a:
    jr nz, jr_00f_518c

    jr nz, jr_00f_518e

    jr nz, jr_00f_51b1

    ld c, [hl]

jr_00f_5171:
    ld b, h
    ld e, c

jr_00f_5173:
    jr nz, jr_00f_51b8

    ld c, a
    ld b, c

jr_00f_5177:
    ld d, h
    ld b, l
    ld d, e
    jr nz, jr_00f_519c

    jr nz, jr_00f_519e

    inc b
    jr nz, jr_00f_51a1

    jr nz, jr_00f_51d0

    ld b, c
    ld d, d
    ld b, e
    ld d, l
    ld d, e

jr_00f_5188:
    jr nz, jr_00f_51dd

    ld d, h
    ld d, d

jr_00f_518c:
    ld c, c
    ld c, [hl]

jr_00f_518e:
    ld b, a
    ld b, l
    ld d, d
    jr nz, jr_00f_51b3

    inc b
    jr nz, jr_00f_51b6

    jr nz, jr_00f_51d9

    ld c, [hl]
    ld b, c
    ld d, h
    ld c, a

jr_00f_519c:
    ld c, h
    ld b, l

jr_00f_519e:
    jr nz, jr_00f_51e2

    ld d, d

jr_00f_51a1:
    ld b, c
    ld c, [hl]
    ld b, e
    ld c, b
    jr nz, jr_00f_51c7

    jr nz, jr_00f_51a9

jr_00f_51a9:
    jr nz, jr_00f_51cb

    jr nz, jr_00f_51f7

    ld c, a
    ld c, [hl]
    ld b, c
    ld d, h

jr_00f_51b1:
    ld c, b
    ld b, c

jr_00f_51b3:
    ld c, [hl]
    jr nz, jr_00f_5208

jr_00f_51b6:
    ld c, a
    ld b, a

jr_00f_51b8:
    ld b, l
    ld d, d
    ld d, e
    jr nz, jr_00f_51dd

    inc b
    jr nz, jr_00f_51e0

    jr nz, jr_00f_520e

    ld b, l
    ld b, l
    jr nz, jr_00f_5216

    ld b, l

jr_00f_51c7:
    ld d, d
    ld d, d
    ld e, c
    add hl, bc

jr_00f_51cb:
    ld d, e
    ld c, l
    ld c, c
    ld d, h
    ld c, b

jr_00f_51d0:
    jr nz, jr_00f_51f2

    inc b
    jr nz, jr_00f_51f5

    jr nz, jr_00f_51f7

    jr nz, jr_00f_522b

jr_00f_51d9:
    ld c, a
    ld b, d
    jr nz, jr_00f_5234

jr_00f_51dd:
    ld c, c
    ld c, h
    ld d, e

jr_00f_51e0:
    ld c, a
    ld c, [hl]

jr_00f_51e2:
    jr nz, jr_00f_5204

    jr nz, jr_00f_5206

    jr nz, jr_00f_51e8

jr_00f_51e8:
    jr nz, jr_00f_520a

    jr nz, jr_00f_520c

    jr nz, jr_00f_5231

    ld c, b
    ld d, d
    ld c, c
    ld d, e

jr_00f_51f2:
    ld d, h
    ld c, a
    ld d, b

jr_00f_51f5:
    ld c, b
    ld b, l

jr_00f_51f7:
    jr nz, jr_00f_5219

    jr nz, jr_00f_521b

    jr nz, jr_00f_51fd

jr_00f_51fd:
    jr nz, jr_00f_521f

    jr nz, jr_00f_524c

    ld b, l
    ld c, c
    ld d, d

jr_00f_5204:
    ld b, c
    ld c, [hl]

jr_00f_5206:
    jr nz, jr_00f_5255

jr_00f_5208:
    ld b, e
    ld c, l

jr_00f_520a:
    ld c, c
    ld c, h

jr_00f_520c:
    ld c, h
    ld b, c

jr_00f_520e:
    ld c, [hl]
    jr nz, jr_00f_5231

    inc b
    jr nz, jr_00f_5234

    jr nz, jr_00f_5257

jr_00f_5216:
    ld c, [hl]
    ld e, c
    ld b, c

jr_00f_5219:
    jr nz, jr_00f_525c

jr_00f_521b:
    ld c, [hl]
    ld b, h
    jr nz, jr_00f_5276

jr_00f_521f:
    ld b, c
    ld e, c
    ld c, [hl]
    ld b, l
    jr nz, jr_00f_5245

    jr nz, jr_00f_5227

jr_00f_5227:
    jr nz, jr_00f_5249

    jr nz, jr_00f_524b

jr_00f_522b:
    ld d, d
    ld b, c
    ld b, e
    ld c, b
    ld b, l
    ld c, h

jr_00f_5231:
    jr nz, jr_00f_5276

    ld c, a

jr_00f_5234:
    ld c, a
    ld d, b
    ld b, l
    ld d, d
    jr nz, jr_00f_525a

    jr nz, jr_00f_5240

    jr nz, @+$22

    jr nz, @+$22

jr_00f_5240:
    ld b, h
    ld c, a
    ld c, [hl]
    ld c, [hl]
    ld b, c

jr_00f_5245:
    jr nz, @+$4a

    ld b, c
    ld d, d

jr_00f_5249:
    ld d, d
    ld c, c

jr_00f_524b:
    ld d, e

jr_00f_524c:
    jr nz, jr_00f_526e

    jr nz, jr_00f_5270

    nop
    jr nz, jr_00f_5273

    jr nz, jr_00f_5275

jr_00f_5255:
    jr nz, @+$22

jr_00f_5257:
    jr nz, @+$22

    ld c, d

jr_00f_525a:
    ld b, c
    ld d, d

jr_00f_525c:
    ld d, [hl]
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    nop
    jr nz, jr_00f_5288

    jr nz, jr_00f_528a

    ld c, [hl]
    ld c, c
    ld b, e
    ld c, e

jr_00f_526e:
    jr nz, @+$49

jr_00f_5270:
    ld d, l
    ld c, [hl]
    ld c, [hl]

jr_00f_5273:
    ld c, c
    ld c, [hl]

jr_00f_5275:
    ld b, a

jr_00f_5276:
    jr nz, @+$22

    jr nz, @+$22

    nop
    nop
    nop
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    ld a, e
    ld a, h

jr_00f_5288:
    ld a, l
    ld a, [hl]

jr_00f_528a:
    jr nz, jr_00f_52ac

    jr nz, jr_00f_52ae

    jr nz, jr_00f_52b0

    jr nz, jr_00f_52b2

    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    ld a, a
    add b
    add c
    add d
    jr nz, jr_00f_52c1

    jr nz, jr_00f_52c3

    jr nz, jr_00f_52c5

    jr nz, jr_00f_52c7

    nop
    jr nz, @+$22

    jr nz, @+$22

jr_00f_52ac:
    jr nz, @+$22

jr_00f_52ae:
    jr nz, @+$22

jr_00f_52b0:
    add e
    add h

jr_00f_52b2:
    add l
    add [hl]
    jr nz, @+$22

    jr nz, jr_00f_52d8

    jr nz, jr_00f_52da

    jr nz, jr_00f_52dc

    nop
    jr nz, jr_00f_52df

    jr nz, jr_00f_52e1

jr_00f_52c1:
    jr nz, jr_00f_52e3

jr_00f_52c3:
    jr nz, @+$22

jr_00f_52c5:
    add a
    adc b

jr_00f_52c7:
    adc c
    adc d
    jr nz, jr_00f_52eb

    jr nz, jr_00f_52ed

    jr nz, jr_00f_52ef

    jr nz, jr_00f_52f1

    nop
    nop
    jr nz, jr_00f_52f5

    jr nz, jr_00f_52f7

    ld c, l

jr_00f_52d8:
    ld c, a
    ld d, d

jr_00f_52da:
    ld b, c
    ld c, h

jr_00f_52dc:
    jr nz, jr_00f_5331

    ld d, l

jr_00f_52df:
    ld d, b
    ld d, b

jr_00f_52e1:
    ld c, a
    ld d, d

jr_00f_52e3:
    ld d, h
    jr nz, jr_00f_5306

    jr nz, jr_00f_52ec

    nop
    jr nz, jr_00f_530b

jr_00f_52eb:
    ld c, l

jr_00f_52ec:
    ld b, l

jr_00f_52ed:
    ld d, d
    ld e, c

jr_00f_52ef:
    ld c, h
    ld d, e

jr_00f_52f1:
    jr nz, jr_00f_5346

    ld b, c
    ld c, [hl]

jr_00f_52f5:
    ld b, h
    ld d, a

jr_00f_52f7:
    ld c, c
    ld b, e
    ld c, b
    ld b, l
    ld d, e
    jr nz, jr_00f_5302

    jr nz, jr_00f_5320

    jr nz, jr_00f_5322

jr_00f_5302:
    ld c, b
    ld b, l
    ld c, h
    ld b, l

jr_00f_5306:
    ld c, [hl]
    jr nz, jr_00f_534c

    ld c, a
    ld b, c

jr_00f_530b:
    ld d, h
    ld b, l
    ld d, e
    jr nz, jr_00f_5330

    jr nz, @+$22

    nop
    jr nz, jr_00f_5335

    jr nz, jr_00f_5337

    jr nz, @+$4f

    ld c, c
    ld c, [hl]
    ld c, c
    jr nz, jr_00f_536b

    ld c, a
    ld d, d

jr_00f_5320:
    ld d, d
    ld c, c

jr_00f_5322:
    ld d, e
    jr nz, jr_00f_5345

    jr nz, @+$22

    inc b
    jr nz, jr_00f_534a

    jr nz, jr_00f_534c

    jr nz, jr_00f_5380

    ld d, l
    ld d, h

jr_00f_5330:
    ld c, b

jr_00f_5331:
    jr nz, jr_00f_5375

    ld b, c
    ld c, e

jr_00f_5335:
    ld b, l
    ld d, d

jr_00f_5337:
    jr nz, jr_00f_5359

    jr nz, @+$22

    jr nz, jr_00f_533d

jr_00f_533d:
    jr nz, jr_00f_535f

    ld c, h
    ld c, c
    ld c, [hl]
    ld b, h
    ld d, e
    ld b, c

jr_00f_5345:
    ld e, c

jr_00f_5346:
    jr nz, jr_00f_5393

    ld b, l
    ld d, d

jr_00f_534a:
    ld c, [hl]
    ld c, a

jr_00f_534c:
    ld c, b
    ld b, c
    ld c, [hl]
    jr nz, jr_00f_5371

    nop
    jr nz, @+$22

    jr nz, jr_00f_53a1

    ld b, c
    ld d, d
    ld b, l

jr_00f_5359:
    ld c, [hl]
    jr nz, @+$4d

    ld b, l
    ld d, d
    ld c, [hl]

jr_00f_535f:
    ld c, a
    ld c, b
    ld b, c
    ld c, [hl]
    jr nz, jr_00f_5385

    jr nz, jr_00f_5367

jr_00f_5367:
    jr nz, jr_00f_5389

    jr nz, jr_00f_538b

jr_00f_536b:
    jr nz, jr_00f_53bf

    ld c, a
    ld c, [hl]
    jr nz, jr_00f_53b2

jr_00f_5371:
    ld c, [hl]
    ld b, h
    jr nz, @+$4d

jr_00f_5375:
    ld b, c
    ld b, [hl]
    jr nz, jr_00f_5399

    jr nz, jr_00f_539b

    inc b
    jr nz, @+$22

    jr nz, jr_00f_53a0

jr_00f_5380:
    jr nz, jr_00f_53d5

    ld d, l
    ld c, [hl]
    ld c, [hl]

jr_00f_5385:
    ld e, c
    jr nz, jr_00f_53d5

    ld c, a

jr_00f_5389:
    ld c, h
    ld c, h

jr_00f_538b:
    ld e, c
    jr nz, jr_00f_53ae

    jr nz, jr_00f_53b0

    inc b
    jr nz, jr_00f_53b3

jr_00f_5393:
    jr nz, @+$56

    ld b, l
    ld d, e
    ld d, e
    ld b, c

jr_00f_5399:
    jr nz, jr_00f_53dc

jr_00f_539b:
    ld c, [hl]
    ld b, h
    jr nz, jr_00f_53f2

    ld c, c

jr_00f_53a0:
    ld c, l

jr_00f_53a1:
    ld c, a
    ld c, [hl]
    jr nz, jr_00f_53c5

    inc b
    jr nz, jr_00f_53c8

    jr nz, @+$22

    jr nz, jr_00f_53cc

    jr nz, jr_00f_53ce

jr_00f_53ae:
    ld c, e
    ld b, c

jr_00f_53b0:
    ld d, h
    ld c, c

jr_00f_53b2:
    ld b, l

jr_00f_53b3:
    jr nz, jr_00f_53d5

    jr nz, jr_00f_53d7

    jr nz, jr_00f_53d9

    jr nz, jr_00f_53bf

    nop
    nop
    nop
    nop

jr_00f_53bf:
    jr nz, jr_00f_53e1

    jr nz, jr_00f_53e3

    jr nz, jr_00f_5415

jr_00f_53c5:
    ld d, l
    ld c, e
    ld c, e

jr_00f_53c8:
    ld b, c
    jr nz, @+$49

    ld b, c

jr_00f_53cc:
    ld c, l
    ld b, l

jr_00f_53ce:
    ld d, e
    jr nz, jr_00f_53f1

    jr nz, jr_00f_53f3

    inc b
    nop

jr_00f_53d5:
    jr nz, jr_00f_53f7

jr_00f_53d7:
    jr nz, jr_00f_53f9

jr_00f_53d9:
    ld d, a
    ld c, a
    ld d, l

jr_00f_53dc:
    ld c, h
    ld b, h
    jr nz, @+$4e

    ld c, c

jr_00f_53e1:
    ld c, e
    ld b, l

jr_00f_53e3:
    jr nz, jr_00f_5439

    ld c, a
    jr nz, jr_00f_5408

    jr nz, @+$06

    nop
    jr nz, jr_00f_540d

    jr nz, @+$56

    ld c, b
    ld b, c

jr_00f_53f1:
    ld c, [hl]

jr_00f_53f2:
    ld c, e

jr_00f_53f3:
    jr nz, @+$47

    ld d, [hl]
    ld b, l

jr_00f_53f7:
    ld d, d
    ld e, c

jr_00f_53f9:
    ld c, a
    ld c, [hl]
    ld b, l
    jr nz, @+$22

    jr nz, jr_00f_5400

jr_00f_5400:
    nop
    jr nz, @+$22

    jr nz, jr_00f_5425

    jr nz, jr_00f_544c

    ld d, [hl]

jr_00f_5408:
    ld b, l
    ld d, d
    ld e, c
    ld d, a
    ld c, b

jr_00f_540d:
    ld b, l
    ld d, d
    ld b, l
    ld a, [bc]
    jr nz, jr_00f_5433

    jr nz, jr_00f_5435

jr_00f_5415:
    nop
    nop
    nop
    nop
    jr nz, jr_00f_543b

    jr nz, jr_00f_543d

    jr nz, @+$22

    ld b, d
    ld d, l
    ld d, h
    jr nz, @+$56

    ld c, b

jr_00f_5425:
    ld b, c
    ld d, h
    jr nz, jr_00f_5449

    jr nz, jr_00f_544b

    jr nz, jr_00f_544d

    nop
    nop
    jr nz, jr_00f_5451

    jr nz, jr_00f_5453

jr_00f_5433:
    jr nz, @+$59

jr_00f_5435:
    ld c, a
    ld d, l
    ld c, h
    ld b, h

jr_00f_5439:
    jr nz, @+$56

jr_00f_543b:
    ld b, c
    ld c, e

jr_00f_543d:
    ld b, l
    jr nz, jr_00f_5460

    jr nz, jr_00f_5462

    jr nz, jr_00f_5444

jr_00f_5444:
    nop
    jr nz, jr_00f_5467

    jr nz, jr_00f_5469

jr_00f_5449:
    jr nz, @+$56

jr_00f_544b:
    ld c, a

jr_00f_544c:
    ld c, a

jr_00f_544d:
    jr nz, @+$4e

    ld c, a
    ld c, [hl]

jr_00f_5451:
    ld b, a
    ld a, [bc]

jr_00f_5453:
    ld a, [bc]
    ld a, [bc]
    jr nz, @+$22

    jr nz, @+$22

    inc b
    nop
    nop
    nop
    nop
    nop
    nop

jr_00f_5460:
    nop
    nop

jr_00f_5462:
    nop
    nop
    nop
    nop
    nop

jr_00f_5467:
    nop
    nop

jr_00f_5469:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38

    db $00, $20, $20, $20, $20, $52, $45, $4d, $45, $52, $43, $49, $45, $4d, $45, $4e
    db $54, $53, $20, $20, $20, $04, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $ab, $ac, $ad, $ae, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $af, $b0, $b1, $b2, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $b3, $b4, $b5, $b6, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $b7
    db $b8, $b9, $ba, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00, $00, $20, $20
    db $52, $45, $4d, $45, $52, $43, $49, $45, $4d, $45, $4e, $54, $53, $20, $53, $43
    db $49, $20, $04, $00, $00, $00, $20, $20, $44, $49, $52, $45, $43, $54, $45, $55
    db $52, $20, $47, $45, $4e, $45, $52, $41, $4c, $20, $04, $00, $20, $20, $20, $20
    db $4a, $41, $4e, $45, $20, $43, $41, $56, $41, $4e, $41, $47, $48, $20, $20, $20
    db $04, $00, $00, $20, $20, $20, $20, $44, $49, $52, $45, $43, $54, $45, $55, $52
    db $20, $44, $55, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $03, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $04, $20, $20, $20
    db $20, $44, $45, $56, $45, $4c, $4f, $50, $50, $45, $4d, $45, $4e, $54, $20, $20
    db $20, $04, $00, $20, $20, $20, $44, $41, $56, $49, $44, $20, $52, $41, $54, $43
    db $4c, $49, $46, $46, $45, $20, $20, $04, $00, $00, $00, $00, $20, $20, $20, $20
    db $20, $50, $52, $4f, $44, $55, $43, $54, $45, $55, $52, $20, $20, $20, $20, $20
    db $00, $00, $20, $20, $20, $4a, $4f, $4e, $41, $54, $48, $41, $4e, $20, $43, $4f
    db $55, $52, $54, $20, $20, $20, $00, $00, $00, $00, $20, $20, $20, $52, $45, $4c
    db $41, $54, $49, $4f, $4e, $53, $20, $41, $56, $45, $43, $20, $20, $20, $00, $20
    db $20, $20, $4c, $45, $53, $20, $50, $41, $52, $54, $45, $4e, $41, $49, $52, $45
    db $53, $20, $20, $04, $00, $20, $20, $20, $20, $20, $41, $4e, $44, $59, $20, $4f
    db $0b, $44, $4f, $57, $44, $20, $20, $20, $20, $04, $00, $00, $20, $20, $20, $20
    db $20, $20, $20, $20, $03, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
    db $00, $20, $20, $20, $20, $20, $49, $4e, $47, $45, $4e, $49, $45, $55, $52, $53
    db $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $03, $20, $04, $20, $20, $41, $53, $53
    db $55, $52, $41, $4e, $43, $45, $20, $51, $55, $41, $4c, $49, $54, $45, $20, $04
    db $00, $20, $20, $20, $20, $20, $20, $42, $45, $4e, $20, $4d, $41, $53, $4f, $4e
    db $20, $20, $20, $20, $20, $04, $00, $00, $00, $20, $20, $20, $43, $4f, $4e, $44
    db $49, $54, $49, $4f, $4e, $4e, $45, $4d, $45, $4e, $54, $20, $20, $04, $20, $20
    db $20, $20, $45, $54, $20, $43, $4f, $4e, $43, $45, $50, $54, $49, $4f, $4e, $20
    db $20, $20, $04, $00, $20, $20, $20, $4b, $45, $49, $54, $48, $20, $48, $4f, $44
    db $47, $45, $54, $54, $53, $20, $20, $20, $00, $00, $00, $20, $20, $20, $20, $20
    db $20, $20, $04, $20, $20, $20, $20, $20, $20, $04, $20, $20, $20, $20, $20, $00
    db $20, $4d, $45, $52, $43, $49, $20, $41, $20, $54, $4f, $55, $53, $20, $41, $20
    db $53, $43, $49, $20, $00, $00, $00, $00, $00, $00, $00, $20, $52, $45, $4d, $45
    db $52, $43, $49, $45, $4d, $45, $4e, $54, $53, $20, $50, $55, $4b, $4b, $41, $04
    db $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $eb, $ec, $ed, $ee, $20
    db $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $ef, $f0, $f1, $f2, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $f3, $f4, $f5, $f6, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $f7, $f8, $f9, $fa, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $20, $20, $44, $49, $52
    db $45, $43, $54, $45, $55, $52, $53, $20, $20, $20, $20, $20, $00, $20, $20, $44
    db $45, $20, $4c, $41, $20, $50, $52, $4f, $44, $55, $43, $54, $49, $4f, $4e, $20
    db $20, $00, $00, $20, $20, $20, $20, $44, $41, $4d, $4f, $4e, $20, $42, $52, $41
    db $4e, $43, $48, $20, $20, $20, $20, $00, $20, $20, $20, $43, $4c, $49, $56, $45
    db $20, $54, $4f, $57, $4e, $53, $45, $4e, $44, $20, $20, $20, $00, $00, $00, $00
    db $20, $20, $20, $20, $20, $20, $20, $20, $cb, $cc, $cd, $ce, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $cf, $d0, $d1
    db $d2, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $d3, $d4, $d5, $d6, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20
    db $20, $20, $20, $20, $20, $20, $20, $d7, $d8, $d9, $da, $20, $20, $20, $20, $20
    db $20, $20, $20, $00, $00, $20, $20, $20, $20, $20, $43, $4f, $4e, $43, $45, $50
    db $54, $49, $4f, $4e, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $4d, $41
    db $52, $43, $55, $53, $20, $53, $54, $52, $49, $4e, $47, $45, $52, $20, $20, $04
    db $20, $20, $20, $20, $20, $41, $4e, $44, $59, $20, $43, $4f, $41, $54, $45, $53
    db $20, $20, $20, $20, $04, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $5b, $5c, $5d, $5e, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $5f, $60, $61, $62, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $63, $64, $65, $66, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $67
    db $68, $69, $6a, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20
    db $20, $50, $52, $4f, $47, $52, $41, $4d, $4d, $41, $54, $49, $4f, $4e, $20, $20
    db $20, $04, $00, $20, $20, $20, $20, $20, $41, $4e, $44, $59, $20, $43, $4f, $41
    db $54, $45, $53, $20, $20, $20, $20, $04, $20, $20, $20, $43, $4c, $49, $56, $45
    db $20, $54, $4f, $57, $4e, $53, $45, $4e, $44, $20, $20, $20, $00, $00, $00, $00
    db $20, $20, $20, $20, $20, $20, $20, $20, $bb, $bc, $bd, $be, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $bf, $c0, $c1
    db $c2, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $c3, $c4, $c5, $c6, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20
    db $20, $20, $20, $20, $20, $20, $20, $c7, $c8, $c9, $ca, $20, $20, $20, $20, $20
    db $20, $20, $20, $00, $00, $20, $20, $20, $20, $20, $47, $52, $41, $50, $48, $49
    db $53, $4d, $45, $53, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $4d, $41
    db $52, $43, $55, $53, $20, $53, $54, $52, $49, $4e, $47, $45, $52, $20, $20, $04
    db $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $9b, $9c, $9d, $9e, $20
    db $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $9f, $a0, $a1, $a2, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $a3, $a4, $a5, $a6, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $a7, $a8, $a9, $aa, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $4d, $55, $53, $49, $51
    db $55, $45, $0a, $20, $45, $46, $46, $45, $54, $53, $20, $20, $04, $20, $20, $20
    db $53, $4f, $4e, $4f, $52, $45, $53, $20, $45, $54, $20, $53, $4f, $4e, $20, $20
    db $20, $00, $00, $20, $20, $20, $20, $20, $20, $41, $55, $44, $49, $4f, $41, $52
    db $54, $53, $20, $20, $20, $20, $20, $04, $00, $00, $00, $00, $20, $20, $20, $20
    db $20, $20, $20, $20, $6b, $6c, $6d, $6e, $20, $20, $20, $20, $20, $20, $20, $20
    db $00, $20, $20, $20, $20, $20, $20, $20, $20, $6f, $70, $71, $72, $20, $20, $20
    db $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $73, $74
    db $75, $76, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20
    db $20, $20, $20, $77, $78, $79, $7a, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $00, $20, $20, $20, $20, $20, $20, $20, $4f, $55, $54, $49, $4c, $53, $20, $20
    db $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $43, $4c, $49, $56, $45, $20
    db $54, $4f, $57, $4e, $53, $45, $4e, $44, $20, $20, $20, $00, $00, $00, $00, $20
    db $20, $20, $20, $20, $20, $20, $20, $db, $dc, $dd, $de, $20, $20, $20, $20, $20
    db $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $df, $e0, $e1, $e2
    db $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20
    db $20, $e3, $e4, $e5, $e6, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20
    db $20, $20, $20, $20, $20, $20, $e7, $e8, $e9, $ea, $20, $20, $20, $20, $20, $20
    db $20, $20, $00, $20, $20, $03, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $00, $43, $52, $45, $41, $54, $49, $4f, $4e
    db $20, $44, $45, $53, $20, $4e, $49, $56, $45, $41, $55, $58, $00, $00, $20, $20
    db $20, $43, $4c, $49, $56, $45, $20, $54, $4f, $57, $4e, $53, $45, $4e, $44, $20
    db $20, $20, $00, $20, $20, $20, $4d, $41, $52, $43, $55, $53, $20, $53, $54, $52
    db $49, $4e, $47, $45, $52, $20, $20, $04, $20, $20, $20, $20, $20, $41, $4e, $44
    db $59, $20, $43, $4f, $41, $54, $45, $53, $20, $20, $20, $20, $04, $20, $20, $20
    db $41, $4e, $41, $54, $4f, $4c, $45, $20, $42, $52, $41, $4e, $43, $48, $20, $20
    db $20, $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $8b, $8c, $8d
    db $8e, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $8f, $90, $91, $92, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20
    db $20, $20, $20, $20, $20, $20, $20, $93, $94, $95, $96, $20, $20, $20, $20, $20
    db $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $97, $98, $99, $9a
    db $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $03, $04, $20, $54
    db $45, $53, $54, $53, $20, $44, $45, $20, $4a, $4f, $55, $41, $42, $49, $4c, $49
    db $54, $45, $04, $00, $20, $20, $20, $43, $4c, $49, $56, $45, $20, $54, $4f, $57
    db $4e, $53, $45, $4e, $44, $20, $20, $20, $00, $20, $20, $20, $20, $20, $41, $4e
    db $44, $59, $20, $43, $4f, $41, $54, $45, $53, $20, $20, $20, $20, $04, $20, $20
    db $20, $4d, $41, $52, $43, $55, $53, $20, $53, $54, $52, $49, $4e, $47, $45, $52
    db $20, $20, $04, $20, $20, $20, $41, $4e, $41, $54, $4f, $4c, $45, $20, $42, $52
    db $41, $4e, $43, $48, $20, $20, $20, $00, $20, $20, $20, $4a, $4f, $4e, $41, $54
    db $48, $41, $4e, $20, $52, $4f, $47, $45, $52, $53, $20, $20, $04, $20, $20, $20
    db $4c, $45, $45, $20, $50, $45, $52, $52, $59, $09, $53, $4d, $49, $54, $48, $20
    db $20, $04, $20, $20, $20, $20, $20, $52, $4f, $42, $20, $57, $49, $4c, $53, $4f
    db $4e, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $43, $48, $52, $49
    db $53, $54, $4f, $50, $48, $45, $20, $20, $20, $20, $20, $00, $20, $20, $20, $4b
    db $45, $49, $52, $41, $4e, $20, $4d, $43, $4d, $49, $4c, $4c, $41, $4e, $20, $20
    db $04, $20, $20, $20, $41, $4e, $59, $41, $20, $41, $4e, $44, $20, $57, $41, $59
    db $4e, $45, $20, $20, $20, $00, $20, $20, $20, $20, $52, $41, $43, $48, $45, $4c
    db $20, $43, $4f, $4f, $50, $45, $52, $20, $20, $20, $04, $20, $20, $20, $20, $44
    db $4f, $4e, $4e, $41, $20, $48, $41, $52, $52, $49, $53, $20, $20, $20, $20, $00
    db $20, $20, $20, $20, $20, $20, $20, $20, $4a, $41, $52, $56, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $20, $20, $20, $20, $4e, $49, $43, $4b, $20, $47, $55
    db $4e, $4e, $49, $4e, $47, $20, $20, $20, $20, $00, $00, $00, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $7b, $7c, $7d, $7e, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $7f, $80, $81, $82, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $83
    db $84, $85, $86, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20
    db $20, $20, $20, $20, $87, $88, $89, $8a, $20, $20, $20, $20, $20, $20, $20, $20
    db $00, $00, $20, $20, $20, $20, $53, $55, $50, $50, $4f, $52, $54, $20, $4d, $4f
    db $52, $41, $4c, $20, $20, $20, $04, $00, $20, $20, $4d, $45, $52, $59, $4c, $53
    db $20, $53, $41, $4e, $44, $57, $49, $43, $48, $45, $53, $20, $04, $20, $20, $20
    db $20, $48, $45, $4c, $45, $4e, $20, $43, $4f, $41, $54, $45, $53, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $4d, $49, $4e, $49, $20, $4d, $4f, $52, $52
    db $49, $53, $20, $20, $20, $20, $04, $20, $20, $20, $20, $20, $52, $55, $54, $48
    db $20, $42, $41, $4b, $45, $52, $20, $20, $20, $20, $20, $00, $20, $20, $4c, $49
    db $4e, $44, $53, $41, $59, $20, $4b, $45, $52, $4e, $4f, $48, $41, $4e, $20, $20
    db $00, $20, $20, $20, $4b, $41, $52, $45, $4e, $20, $4b, $45, $52, $4e, $4f, $48
    db $41, $4e, $20, $20, $20, $00, $20, $20, $20, $20, $20, $52, $4f, $4e, $20, $41
    db $4e, $44, $20, $4b, $41, $46, $20, $20, $20, $20, $04, $20, $20, $20, $20, $20
    db $53, $55, $4e, $4e, $59, $20, $4d, $4f, $4c, $4c, $59, $20, $20, $20, $20, $04
    db $20, $20, $20, $54, $45, $53, $53, $41, $20, $41, $4e, $44, $20, $53, $49, $4d
    db $4f, $4e, $20, $20, $04, $20, $20, $20, $20, $20, $20, $20, $20, $4b, $41, $54
    db $49, $45, $20, $20, $20, $20, $20, $20, $20, $04, $00, $00, $00, $00, $20, $20
    db $20, $20, $20, $50, $55, $4b, $4b, $41, $20, $47, $41, $4d, $45, $53, $20, $20
    db $20, $20, $04, $00, $20, $56, $4f, $55, $44, $52, $41, $49, $54, $20, $52, $45
    db $4d, $45, $52, $43, $49, $45, $52, $20, $00, $00, $20, $20, $20, $4c, $45, $20
    db $4d, $4f, $4e, $44, $45, $20, $45, $4e, $54, $49, $45, $52, $0a, $20, $04, $00
    db $00, $00, $20, $20, $20, $20, $20, $20, $20, $4d, $41, $49, $53, $20, $06, $41
    db $20, $20, $20, $20, $20, $20, $04, $00, $20, $20, $20, $50, $52, $45, $4e, $44
    db $52, $41, $49, $54, $20, $54, $52, $4f, $50, $20, $20, $20, $00, $00, $20, $20
    db $20, $20, $20, $44, $45, $20, $54, $45, $4d, $50, $53, $20, $07, $20, $20, $20
    db $20, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff

    db $00, $20, $20, $20, $20, $20, $20, $20, $20, $54, $45, $41, $4d, $20, $20, $20
    db $20, $20, $20, $20, $20, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $ab, $ac, $ad, $ae, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $af, $b0, $b1, $b2, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $b3, $b4, $b5, $b6, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $b7
    db $b8, $b9, $ba, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00, $00, $20, $20
    db $20, $20, $20, $20, $53, $43, $49, $09, $54, $45, $41, $4d, $20, $20, $20, $20
    db $20, $20, $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $01, $20, $20
    db $20, $20, $01, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $47, $45, $53
    db $43, $48, $41, $46, $54, $53, $46, $55, $48, $52, $55, $4e, $47, $20, $20, $00
    db $00, $20, $20, $20, $20, $4a, $41, $4e, $45, $20, $43, $41, $56, $41, $4e, $41
    db $47, $48, $20, $20, $20, $04, $00, $00, $20, $4c, $45, $49, $54, $55, $4e, $47
    db $20, $45, $4e, $54, $57, $49, $43, $4b, $4c, $55, $4e, $47, $04, $00, $20, $20
    db $20, $44, $41, $56, $49, $44, $20, $52, $41, $54, $43, $4c, $49, $46, $46, $45
    db $20, $20, $04, $00, $00, $00, $00, $20, $20, $20, $20, $20, $50, $52, $4f, $44
    db $55, $4b, $54, $49, $4f, $4e, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20
    db $4a, $4f, $4e, $41, $54, $48, $41, $4e, $20, $43, $4f, $55, $52, $54, $20, $20
    db $20, $00, $00, $00, $00, $20, $20, $20, $20, $42, $45, $54, $52, $45, $55, $55
    db $4e, $47, $20, $44, $45, $52, $20, $20, $20, $04, $20, $20, $20, $20, $20, $20
    db $20, $01, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20
    db $20, $47, $45, $53, $43, $48, $41, $46, $54, $53, $50, $41, $52, $54, $4e, $45
    db $52, $20, $20, $00, $00, $20, $20, $20, $20, $20, $41, $4e, $44, $59, $20, $4f
    db $0b, $44, $4f, $57, $44, $20, $20, $20, $20, $04, $00, $00, $00, $20, $20, $20
    db $20, $51, $53, $09, $49, $4e, $47, $45, $4e, $49, $45, $55, $52, $45, $20, $20
    db $20, $04, $00, $20, $20, $20, $20, $20, $20, $42, $45, $4e, $20, $4d, $41, $53
    db $4f, $4e, $20, $20, $20, $20, $20, $04, $00, $00, $00, $20, $20, $20, $20, $20
    db $56, $45, $52, $50, $41, $43, $4b, $55, $4e, $47, $20, $20, $20, $20, $20, $00
    db $20, $20, $20, $20, $20, $55, $4e, $44, $20, $44, $45, $53, $49, $47, $4e, $20
    db $20, $20, $20, $20, $00, $00, $20, $20, $20, $4b, $45, $49, $54, $48, $20, $48
    db $4f, $44, $47, $45, $54, $54, $53, $20, $20, $20, $00, $00, $00, $00, $20, $20
    db $20, $55, $4e, $44, $20, $56, $49, $45, $4c, $45, $4e, $20, $44, $41, $4e, $4b
    db $20, $20, $04, $20, $41, $4e, $20, $41, $4c, $4c, $45, $20, $4d, $49, $54, $41
    db $52, $42, $45, $49, $54, $45, $52, $04, $20, $20, $20, $20, $20, $20, $20, $56
    db $4f, $4e, $20, $53, $43, $49, $20, $20, $20, $20, $20, $20, $04, $00, $00, $00
    db $00, $00, $00, $20, $20, $20, $20, $20, $50, $55, $4b, $4b, $41, $09, $54, $45
    db $41, $4d, $20, $20, $20, $20, $20, $00, $00, $00, $00, $20, $20, $20, $20, $20
    db $20, $20, $20, $eb, $ec, $ed, $ee, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $20, $20, $20, $20, $20, $20, $20, $20, $ef, $f0, $f1, $f2, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $f3, $f4, $f5
    db $f6, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $f7, $f8, $f9, $fa, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00
    db $20, $20, $50, $52, $4f, $44, $55, $4b, $54, $49, $4f, $4e, $4c, $45, $49, $54
    db $55, $4e, $47, $20, $04, $00, $20, $20, $20, $20, $44, $41, $4d, $4f, $4e, $20
    db $42, $52, $41, $4e, $43, $48, $20, $20, $20, $20, $00, $20, $20, $20, $43, $4c
    db $49, $56, $45, $20, $54, $4f, $57, $4e, $53, $45, $4e, $44, $20, $20, $20, $00
    db $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $cb, $cc, $cd, $ce, $20
    db $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $cf, $d0, $d1, $d2, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $d3, $d4, $d5, $d6, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $d7, $d8, $d9, $da, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $20, $20, $20, $20, $44
    db $45, $53, $49, $47, $4e, $20, $20, $20, $20, $20, $20, $20, $00, $00, $20, $20
    db $20, $4d, $41, $52, $43, $55, $53, $20, $53, $54, $52, $49, $4e, $47, $45, $52
    db $20, $20, $04, $20, $20, $20, $20, $20, $41, $4e, $44, $59, $20, $43, $4f, $41
    db $54, $45, $53, $20, $20, $20, $20, $04, $00, $00, $00, $20, $20, $20, $20, $20
    db $20, $20, $20, $5b, $5c, $5d, $5e, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $20, $20, $20, $20, $20, $20, $20, $20, $5f, $60, $61, $62, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $63, $64, $65
    db $66, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $67, $68, $69, $6a, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00
    db $20, $20, $20, $50, $52, $4f, $47, $52, $41, $4d, $4d, $49, $45, $52, $55, $4e
    db $47, $20, $20, $20, $00, $00, $20, $20, $20, $20, $20, $41, $4e, $44, $59, $20
    db $43, $4f, $41, $54, $45, $53, $20, $20, $20, $20, $04, $20, $20, $20, $43, $4c
    db $49, $56, $45, $20, $54, $4f, $57, $4e, $53, $45, $4e, $44, $20, $20, $20, $00
    db $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $bb, $bc, $bd, $be, $20
    db $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $bf, $c0, $c1, $c2, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $c3, $c4, $c5, $c6, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $c7, $c8, $c9, $ca, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $20, $20, $20, $20, $47
    db $52, $41, $46, $49, $4b, $20, $20, $20, $20, $20, $20, $20, $00, $00, $20, $20
    db $20, $4d, $41, $52, $43, $55, $53, $20, $53, $54, $52, $49, $4e, $47, $45, $52
    db $20, $20, $04, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $9b, $9c
    db $9d, $9e, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20
    db $20, $20, $20, $9f, $a0, $a1, $a2, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $20, $20, $20, $20, $20, $20, $20, $20, $a3, $a4, $a5, $a6, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $a7, $a8, $a9
    db $aa, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $20, $20
    db $20, $4d, $55, $53, $49, $4b, $20, $55, $4e, $44, $20, $20, $20, $20, $20, $04
    db $20, $20, $20, $20, $53, $4f, $55, $4e, $44, $45, $46, $46, $45, $4b, $54, $45
    db $20, $20, $20, $20, $00, $00, $20, $20, $20, $20, $20, $20, $41, $55, $44, $49
    db $4f, $41, $52, $54, $53, $20, $20, $20, $20, $20, $04, $00, $00, $00, $20, $20
    db $20, $20, $53, $4f, $55, $4e, $44, $54, $52, $45, $49, $42, $45, $52, $20, $20
    db $20, $20, $00, $00, $20, $20, $20, $20, $20, $20, $41, $55, $44, $49, $4f, $41
    db $52, $54, $53, $20, $20, $20, $20, $20, $04, $00, $00, $00, $20, $20, $20, $20
    db $20, $20, $20, $20, $6b, $6c, $6d, $6e, $20, $20, $20, $20, $20, $20, $20, $20
    db $00, $20, $20, $20, $20, $20, $20, $20, $20, $6f, $70, $71, $72, $20, $20, $20
    db $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $73, $74
    db $75, $76, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20
    db $20, $20, $20, $77, $78, $79, $7a, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $00, $20, $20, $55, $54, $49, $4c, $49, $54, $59, $09, $50, $52, $4f, $47, $52
    db $41, $4d, $4d, $45, $20, $04, $00, $20, $20, $20, $43, $4c, $49, $56, $45, $20
    db $54, $4f, $57, $4e, $53, $45, $4e, $44, $20, $20, $20, $00, $00, $00, $00, $20
    db $20, $20, $20, $20, $20, $20, $20, $db, $dc, $dd, $de, $20, $20, $20, $20, $20
    db $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $df, $e0, $e1, $e2
    db $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20
    db $20, $e3, $e4, $e5, $e6, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20
    db $20, $20, $20, $20, $20, $20, $e7, $e8, $e9, $ea, $20, $20, $20, $20, $20, $20
    db $20, $20, $00, $00, $20, $20, $20, $20, $20, $4c, $45, $56, $45, $4c, $44, $45
    db $53, $49, $47, $4e, $20, $20, $20, $20, $04, $00, $20, $20, $20, $43, $4c, $49
    db $56, $45, $20, $54, $4f, $57, $4e, $53, $45, $4e, $44, $20, $20, $20, $00, $20
    db $20, $20, $4d, $41, $52, $43, $55, $53, $20, $53, $54, $52, $49, $4e, $47, $45
    db $52, $20, $20, $04, $20, $20, $20, $20, $20, $41, $4e, $44, $59, $20, $43, $4f
    db $41, $54, $45, $53, $20, $20, $20, $20, $04, $20, $20, $20, $41, $4e, $41, $54
    db $4f, $4c, $45, $20, $42, $52, $41, $4e, $43, $48, $20, $20, $20, $00, $00, $00
    db $00, $20, $20, $20, $20, $20, $20, $20, $20, $8b, $8c, $8d, $8e, $20, $20, $20
    db $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $8f, $90
    db $91, $92, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20
    db $20, $20, $20, $93, $94, $95, $96, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $20, $20, $20, $20, $20, $20, $20, $20, $97, $98, $99, $9a, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $00, $20, $20, $20, $20, $20, $53, $50, $49, $45, $4c
    db $54, $45, $53, $54, $45, $52, $20, $20, $20, $20, $04, $00, $20, $20, $20, $43
    db $4c, $49, $56, $45, $20, $54, $4f, $57, $4e, $53, $45, $4e, $44, $20, $20, $20
    db $00, $20, $20, $20, $20, $20, $41, $4e, $44, $59, $20, $43, $4f, $41, $54, $45
    db $53, $20, $20, $20, $20, $04, $20, $20, $20, $4d, $41, $52, $43, $55, $53, $20
    db $53, $54, $52, $49, $4e, $47, $45, $52, $20, $20, $04, $20, $20, $20, $41, $4e
    db $41, $54, $4f, $4c, $45, $20, $42, $52, $41, $4e, $43, $48, $20, $20, $20, $00
    db $20, $20, $20, $4a, $4f, $4e, $41, $54, $48, $41, $4e, $20, $52, $4f, $47, $45
    db $52, $53, $20, $20, $04, $20, $20, $20, $4c, $45, $45, $20, $50, $45, $52, $52
    db $59, $09, $53, $4d, $49, $54, $48, $20, $20, $04, $20, $20, $20, $20, $20, $52
    db $4f, $42, $20, $57, $49, $4c, $53, $4f, $4e, $20, $20, $20, $20, $20, $00, $20
    db $20, $20, $20, $20, $43, $48, $52, $49, $53, $54, $4f, $50, $48, $45, $20, $20
    db $20, $20, $20, $00, $20, $20, $20, $4b, $45, $49, $52, $41, $4e, $20, $4d, $43
    db $4d, $49, $4c, $4c, $41, $4e, $20, $20, $04, $20, $20, $20, $41, $4e, $59, $41
    db $20, $41, $4e, $44, $20, $57, $41, $59, $4e, $45, $20, $20, $20, $00, $20, $20
    db $20, $20, $52, $41, $43, $48, $45, $4c, $20, $43, $4f, $4f, $50, $45, $52, $20
    db $20, $20, $04, $20, $20, $20, $20, $44, $4f, $4e, $4e, $41, $20, $48, $41, $52
    db $52, $49, $53, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $4a, $41, $52, $56, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $4e, $49, $43, $4b, $20, $47, $55, $4e, $4e, $49, $4e, $47, $20, $20, $20
    db $20, $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $7b, $7c, $7d
    db $7e, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $7f, $80, $81, $82, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20
    db $20, $20, $20, $20, $20, $20, $20, $83, $84, $85, $86, $20, $20, $20, $20, $20
    db $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $87, $88, $89, $8a
    db $20, $20, $20, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $20, $20, $4d
    db $4f, $52, $41, $4c, $49, $53, $43, $48, $45, $20, $20, $20, $20, $20, $00, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $01, $20, $20, $20, $20, $20
    db $20, $20, $20, $04, $20, $20, $20, $20, $55, $4e, $54, $45, $52, $53, $54, $55
    db $54, $5a, $55, $4e, $47, $20, $20, $20, $04, $00, $20, $20, $4d, $45, $52, $59
    db $4c, $53, $20, $53, $41, $4e, $44, $57, $49, $43, $48, $45, $53, $20, $04, $20
    db $20, $20, $20, $48, $45, $4c, $45, $4e, $20, $43, $4f, $41, $54, $45, $53, $20
    db $20, $20, $20, $00, $20, $20, $20, $20, $20, $4d, $49, $4e, $49, $20, $4d, $4f
    db $52, $52, $49, $53, $20, $20, $20, $20, $04, $20, $20, $20, $20, $20, $52, $55
    db $54, $48, $20, $42, $41, $4b, $45, $52, $20, $20, $20, $20, $20, $00, $20, $20
    db $4c, $49, $4e, $44, $53, $41, $59, $20, $4b, $45, $52, $4e, $4f, $48, $41, $4e
    db $20, $20, $00, $20, $20, $20, $4b, $41, $52, $45, $4e, $20, $4b, $45, $52, $4e
    db $4f, $48, $41, $4e, $20, $20, $20, $00, $20, $20, $20, $20, $20, $52, $4f, $4e
    db $20, $41, $4e, $44, $20, $4b, $41, $46, $20, $20, $20, $20, $04, $20, $20, $20
    db $20, $20, $53, $55, $4e, $4e, $59, $20, $4d, $4f, $4c, $4c, $59, $20, $20, $20
    db $20, $04, $20, $20, $20, $54, $45, $53, $53, $41, $20, $41, $4e, $44, $20, $53
    db $49, $4d, $4f, $4e, $20, $20, $04, $20, $20, $20, $20, $20, $20, $20, $20, $4b
    db $41, $54, $49, $45, $20, $20, $20, $20, $20, $20, $20, $04, $00, $00, $00, $00
    db $20, $20, $20, $20, $20, $50, $55, $4b, $4b, $41, $20, $47, $41, $4d, $45, $53
    db $20, $20, $20, $20, $04, $20, $20, $20, $01, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $57, $55, $52, $44
    db $45, $20, $53, $49, $43, $48, $20, $47, $45, $52, $4e, $45, $20, $20, $04, $00
    db $20, $20, $20, $20, $20, $20, $42, $45, $49, $20, $41, $4c, $4c, $45, $4e, $20
    db $20, $20, $20, $20, $04, $00, $20, $20, $20, $20, $4d, $49, $54, $57, $49, $52
    db $4b, $45, $4e, $44, $45, $4e, $20, $20, $20, $20, $00, $00, $20, $20, $20, $20
    db $20, $20, $42, $45, $44, $41, $4e, $4b, $45, $4e, $0a, $20, $20, $20, $20, $20
    db $00, $00, $00, $00, $20, $20, $20, $41, $42, $45, $52, $20, $44, $41, $53, $20
    db $57, $55, $52, $44, $45, $20, $20, $20, $00, $00, $20, $20, $20, $5a, $55, $20
    db $4c, $41, $4e, $47, $45, $20, $44, $41, $55, $45, $52, $4e, $20, $20, $04, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $ff

    db $00, $20, $20, $20, $52, $49, $43, $4f, $4e, $4f, $53, $43, $49, $4d, $45, $4e
    db $54, $49, $20, $20, $20, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $ab, $ac, $ad, $ae, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $af, $b0, $b1, $b2, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $b3, $b4, $b5, $b6, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $b7
    db $b8, $b9, $ba, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00, $00, $20, $52
    db $49, $43, $4f, $4e, $4f, $53, $43, $49, $4d, $45, $4e, $54, $49, $20, $53, $43
    db $49, $20, $00, $00, $00, $00, $20, $44, $49, $52, $45, $54, $54, $4f, $52, $45
    db $20, $45, $53, $45, $43, $55, $54, $49, $56, $4f, $04, $00, $20, $20, $20, $20
    db $4a, $41, $4e, $45, $20, $43, $41, $56, $41, $4e, $41, $47, $48, $20, $20, $20
    db $04, $00, $00, $20, $20, $20, $44, $49, $52, $45, $54, $54, $4f, $52, $45, $20
    db $44, $45, $4c, $4c, $4f, $20, $20, $04, $20, $20, $20, $20, $20, $20, $53, $56
    db $49, $4c, $55, $50, $50, $4f, $20, $20, $20, $20, $20, $20, $00, $00, $20, $20
    db $20, $44, $41, $56, $49, $44, $20, $52, $41, $54, $43, $4c, $49, $46, $46, $45
    db $20, $20, $04, $00, $00, $00, $00, $20, $20, $20, $20, $20, $50, $52, $4f, $44
    db $55, $54, $54, $4f, $52, $45, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20
    db $4a, $4f, $4e, $41, $54, $48, $41, $4e, $20, $43, $4f, $55, $52, $54, $20, $20
    db $20, $00, $00, $00, $00, $20, $20, $52, $45, $4c, $41, $5a, $49, $4f, $4e, $49
    db $20, $45, $53, $54, $45, $52, $4e, $45, $20, $04, $00, $20, $20, $20, $20, $20
    db $41, $4e, $44, $59, $20, $4f, $0b, $44, $4f, $57, $44, $20, $20, $20, $20, $04
    db $00, $00, $00, $20, $20, $54, $45, $43, $4e, $49, $43, $49, $20, $43, $4f, $4e
    db $54, $52, $4f, $4c, $4c, $4f, $20, $04, $20, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $04, $20, $20, $20, $20, $20, $20, $04, $20, $20, $20
    db $20, $20, $20, $20, $51, $55, $41, $4c, $49, $54, $41, $20, $20, $20, $20, $20
    db $20, $04, $00, $20, $20, $20, $20, $20, $20, $42, $45, $4e, $20, $4d, $41, $53
    db $4f, $4e, $20, $20, $20, $20, $20, $04, $00, $00, $00, $50, $52, $4f, $47, $45
    db $54, $54, $41, $5a, $49, $4f, $4e, $45, $20, $45, $20, $43, $55, $52, $41, $00
    db $20, $20, $44, $45, $4c, $4c, $41, $20, $43, $4f, $4e, $46, $45, $5a, $49, $4f
    db $4e, $45, $20, $20, $00, $00, $20, $20, $20, $4b, $45, $49, $54, $48, $20, $48
    db $4f, $44, $47, $45, $54, $54, $53, $20, $20, $20, $00, $00, $00, $00, $20, $20
    db $55, $4e, $20, $52, $49, $4e, $47, $52, $41, $5a, $49, $41, $4d, $45, $4e, $54
    db $4f, $20, $04, $20, $20, $53, $50, $45, $43, $49, $41, $4c, $45, $20, $41, $20
    db $54, $55, $54, $54, $49, $20, $20, $00, $20, $20, $51, $55, $45, $4c, $4c, $49
    db $20, $44, $45, $4c, $4c, $41, $20, $53, $43, $49, $20, $20, $00, $00, $00, $00
    db $00, $00, $00, $52, $49, $43, $4f, $4e, $4f, $53, $43, $49, $4d, $45, $4e, $54
    db $49, $20, $50, $55, $4b, $4b, $41, $00, $00, $00, $00, $20, $20, $20, $20, $20
    db $20, $20, $20, $eb, $ec, $ed, $ee, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $20, $20, $20, $20, $20, $20, $20, $20, $ef, $f0, $f1, $f2, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $f3, $f4, $f5
    db $f6, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $f7, $f8, $f9, $fa, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00
    db $20, $20, $20, $44, $49, $52, $45, $54, $54, $4f, $52, $49, $20, $44, $45, $4c
    db $4c, $41, $20, $20, $04, $20, $20, $20, $20, $20, $50, $52, $4f, $44, $55, $5a
    db $49, $4f, $4e, $45, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $20, $44
    db $41, $4d, $4f, $4e, $20, $42, $52, $41, $4e, $43, $48, $20, $20, $20, $20, $00
    db $20, $20, $20, $43, $4c, $49, $56, $45, $20, $54, $4f, $57, $4e, $53, $45, $4e
    db $44, $20, $20, $20, $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $cb, $cc, $cd, $ce, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $cf, $d0, $d1, $d2, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $d3, $d4, $d5, $d6, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $d7
    db $d8, $d9, $da, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20
    db $20, $20, $43, $55, $52, $41, $20, $44, $45, $4c, $4c, $41, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $43, $4f, $4e, $46, $45, $5a, $49, $4f, $4e
    db $45, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $4d, $41, $52, $43, $55
    db $53, $20, $53, $54, $52, $49, $4e, $47, $45, $52, $20, $20, $04, $20, $20, $20
    db $20, $20, $41, $4e, $44, $59, $20, $43, $4f, $41, $54, $45, $53, $20, $20, $20
    db $20, $04, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $5b, $5c, $5d
    db $5e, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $5f, $60, $61, $62, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20
    db $20, $20, $20, $20, $20, $20, $20, $63, $64, $65, $66, $20, $20, $20, $20, $20
    db $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $67, $68, $69, $6a
    db $20, $20, $20, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $50, $52, $4f
    db $47, $52, $41, $4d, $4d, $41, $5a, $49, $4f, $4e, $45, $20, $20, $20, $00, $00
    db $20, $20, $20, $20, $20, $41, $4e, $44, $59, $20, $43, $4f, $41, $54, $45, $53
    db $20, $20, $20, $20, $04, $20, $20, $20, $43, $4c, $49, $56, $45, $20, $54, $4f
    db $57, $4e, $53, $45, $4e, $44, $20, $20, $20, $00, $00, $00, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $bb, $bc, $bd, $be, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $bf, $c0, $c1, $c2, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $c3
    db $c4, $c5, $c6, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20
    db $20, $20, $20, $20, $c7, $c8, $c9, $ca, $20, $20, $20, $20, $20, $20, $20, $20
    db $00, $00, $20, $20, $20, $20, $20, $20, $20, $47, $52, $41, $46, $49, $43, $41
    db $20, $20, $20, $20, $20, $20, $04, $00, $20, $20, $20, $4d, $41, $52, $43, $55
    db $53, $20, $53, $54, $52, $49, $4e, $47, $45, $52, $20, $20, $04, $00, $00, $00
    db $20, $20, $20, $20, $20, $20, $20, $20, $9b, $9c, $9d, $9e, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $9f, $a0, $a1
    db $a2, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $a3, $a4, $a5, $a6, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20
    db $20, $20, $20, $20, $20, $20, $20, $a7, $a8, $a9, $aa, $20, $20, $20, $20, $20
    db $20, $20, $20, $00, $00, $20, $20, $20, $4d, $55, $53, $49, $43, $41, $0a, $20
    db $45, $46, $46, $45, $54, $54, $49, $20, $20, $04, $20, $20, $20, $53, $4f, $4e
    db $4f, $52, $49, $20, $45, $20, $44, $52, $49, $56, $45, $52, $20, $20, $04, $20
    db $20, $20, $20, $20, $20, $20, $20, $41, $55, $44, $49, $4f, $20, $20, $20, $20
    db $20, $20, $20, $04, $00, $20, $20, $20, $20, $20, $20, $41, $55, $44, $49, $4f
    db $41, $52, $54, $53, $20, $20, $20, $20, $20, $04, $00, $00, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $6b, $6c, $6d, $6e, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $6f, $70, $71, $72, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $73
    db $74, $75, $76, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20
    db $20, $20, $20, $20, $77, $78, $79, $7a, $20, $20, $20, $20, $20, $20, $20, $20
    db $00, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $04, $20
    db $20, $20, $20, $20, $20, $04, $20, $20, $20, $20, $20, $20, $20, $55, $54, $49
    db $4c, $49, $54, $41, $20, $20, $20, $20, $20, $20, $04, $00, $20, $20, $20, $43
    db $4c, $49, $56, $45, $20, $54, $4f, $57, $4e, $53, $45, $4e, $44, $20, $20, $20
    db $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $db, $dc, $dd, $de
    db $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20
    db $20, $df, $e0, $e1, $e2, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20
    db $20, $20, $20, $20, $20, $20, $e3, $e4, $e5, $e6, $20, $20, $20, $20, $20, $20
    db $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $e7, $e8, $e9, $ea, $20
    db $20, $20, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $20, $50, $52, $4f
    db $47, $45, $54, $54, $41, $5a, $49, $4f, $4e, $45, $20, $20, $20, $04, $20, $20
    db $20, $20, $20, $44, $45, $49, $20, $4c, $49, $56, $45, $4c, $4c, $49, $20, $20
    db $20, $20, $04, $00, $20, $20, $20, $43, $4c, $49, $56, $45, $20, $54, $4f, $57
    db $4e, $53, $45, $4e, $44, $20, $20, $20, $00, $20, $20, $20, $4d, $41, $52, $43
    db $55, $53, $20, $53, $54, $52, $49, $4e, $47, $45, $52, $20, $20, $04, $20, $20
    db $20, $20, $20, $41, $4e, $44, $59, $20, $43, $4f, $41, $54, $45, $53, $20, $20
    db $20, $20, $04, $20, $20, $20, $41, $4e, $41, $54, $4f, $4c, $45, $20, $42, $52
    db $41, $4e, $43, $48, $20, $20, $20, $00, $00, $00, $00, $20, $20, $20, $20, $20
    db $20, $20, $20, $8b, $8c, $8d, $8e, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $20, $20, $20, $20, $20, $20, $20, $20, $8f, $90, $91, $92, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $93, $94, $95
    db $96, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $97, $98, $99, $9a, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00
    db $20, $20, $54, $45, $53, $54, $20, $44, $45, $4c, $20, $50, $52, $4f, $44, $4f
    db $54, $54, $4f, $20, $04, $00, $20, $20, $20, $43, $4c, $49, $56, $45, $20, $54
    db $4f, $57, $4e, $53, $45, $4e, $44, $20, $20, $20, $00, $20, $20, $20, $20, $20
    db $41, $4e, $44, $59, $20, $43, $4f, $41, $54, $45, $53, $20, $20, $20, $20, $04
    db $20, $20, $20, $4d, $41, $52, $43, $55, $53, $20, $53, $54, $52, $49, $4e, $47
    db $45, $52, $20, $20, $04, $20, $20, $20, $41, $4e, $41, $54, $4f, $4c, $45, $20
    db $42, $52, $41, $4e, $43, $48, $20, $20, $20, $00, $20, $20, $20, $4a, $4f, $4e
    db $41, $54, $48, $41, $4e, $20, $52, $4f, $47, $45, $52, $53, $20, $20, $04, $20
    db $20, $20, $4c, $45, $45, $20, $50, $45, $52, $52, $59, $09, $53, $4d, $49, $54
    db $48, $20, $20, $04, $20, $20, $20, $20, $20, $52, $4f, $42, $20, $57, $49, $4c
    db $53, $4f, $4e, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $43, $48
    db $52, $49, $53, $54, $4f, $50, $48, $45, $20, $20, $20, $20, $20, $00, $20, $20
    db $20, $4b, $45, $49, $52, $41, $4e, $20, $4d, $43, $4d, $49, $4c, $4c, $41, $4e
    db $20, $20, $04, $20, $20, $20, $41, $4e, $59, $41, $20, $41, $4e, $44, $20, $57
    db $41, $59, $4e, $45, $20, $20, $20, $00, $20, $20, $20, $20, $52, $41, $43, $48
    db $45, $4c, $20, $43, $4f, $4f, $50, $45, $52, $20, $20, $20, $04, $20, $20, $20
    db $20, $44, $4f, $4e, $4e, $41, $20, $48, $41, $52, $52, $49, $53, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $4a, $41, $52, $56, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $4e, $49, $43, $4b, $20
    db $47, $55, $4e, $4e, $49, $4e, $47, $20, $20, $20, $20, $00, $00, $00, $00, $20
    db $20, $20, $20, $20, $20, $20, $20, $7b, $7c, $7d, $7e, $20, $20, $20, $20, $20
    db $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $7f, $80, $81, $82
    db $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20
    db $20, $83, $84, $85, $86, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20
    db $20, $20, $20, $20, $20, $20, $87, $88, $89, $8a, $20, $20, $20, $20, $20, $20
    db $20, $20, $00, $00, $20, $20, $20, $53, $55, $50, $50, $4f, $52, $54, $4f, $20
    db $4d, $4f, $52, $41, $4c, $45, $20, $20, $04, $00, $20, $20, $4d, $45, $52, $59
    db $4c, $53, $20, $53, $41, $4e, $44, $57, $49, $43, $48, $45, $53, $20, $04, $20
    db $20, $20, $20, $48, $45, $4c, $45, $4e, $20, $43, $4f, $41, $54, $45, $53, $20
    db $20, $20, $20, $00, $20, $20, $20, $20, $20, $4d, $49, $4e, $49, $20, $4d, $4f
    db $52, $52, $49, $53, $20, $20, $20, $20, $04, $20, $20, $20, $20, $20, $52, $55
    db $54, $48, $20, $42, $41, $4b, $45, $52, $20, $20, $20, $20, $20, $00, $20, $20
    db $4c, $49, $4e, $44, $53, $41, $59, $20, $4b, $45, $52, $4e, $4f, $48, $41, $4e
    db $20, $20, $00, $20, $20, $20, $4b, $41, $52, $45, $4e, $20, $4b, $45, $52, $4e
    db $4f, $48, $41, $4e, $20, $20, $20, $00, $20, $20, $20, $20, $20, $52, $4f, $4e
    db $20, $41, $4e, $44, $20, $4b, $41, $46, $20, $20, $20, $20, $04, $20, $20, $20
    db $20, $20, $53, $55, $4e, $4e, $59, $20, $4d, $4f, $4c, $4c, $59, $20, $20, $20
    db $20, $04, $20, $20, $20, $54, $45, $53, $53, $41, $20, $41, $4e, $44, $20, $53
    db $49, $4d, $4f, $4e, $20, $20, $04, $20, $20, $20, $20, $20, $20, $20, $20, $4b
    db $41, $54, $49, $45, $20, $20, $20, $20, $20, $20, $20, $04, $00, $00, $00, $00
    db $20, $20, $20, $4c, $41, $20, $50, $55, $4b, $4b, $41, $20, $47, $41, $4d, $45
    db $53, $20, $20, $20, $00, $00, $44, $45, $53, $49, $44, $45, $52, $41, $20, $52
    db $49, $4e, $47, $52, $41, $5a, $49, $41, $52, $45, $00, $00, $20, $20, $54, $55
    db $54, $54, $45, $20, $4c, $45, $20, $50, $45, $52, $53, $4f, $4e, $45, $20, $20
    db $00, $00, $20, $20, $20, $43, $4f, $49, $4e, $56, $4f, $4c, $54, $45, $20, $4e
    db $45, $4c, $4c, $41, $20, $20, $04, $00, $43, $52, $45, $41, $5a, $49, $4f, $4e
    db $45, $20, $44, $45, $4c, $20, $47, $49, $4f, $43, $4f, $0a, $00, $00, $00, $00
    db $20, $20, $20, $4d, $41, $20, $43, $49, $20, $56, $4f, $52, $52, $45, $42, $42
    db $45, $20, $20, $20, $00, $00, $20, $20, $20, $20, $54, $52, $4f, $50, $50, $4f
    db $20, $54, $45, $4d, $50, $4f, $20, $20, $20, $20, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $ff

    db $20, $20, $20, $20, $20, $20, $20, $20, $03, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $43, $52, $45, $44, $49
    db $54, $4f, $53, $20, $20, $20, $20, $20, $20, $00, $00, $00, $20, $20, $20, $20
    db $20, $20, $20, $20, $ab, $ac, $ad, $ae, $20, $20, $20, $20, $20, $20, $20, $20
    db $00, $20, $20, $20, $20, $20, $20, $20, $20, $af, $b0, $b1, $b2, $20, $20, $20
    db $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $b3, $b4
    db $b5, $b6, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20
    db $20, $20, $20, $b7, $b8, $b9, $ba, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $00, $20, $20, $20, $20, $20, $20, $03, $20, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $43, $52, $45, $44, $49, $54
    db $4f, $53, $20, $53, $43, $49, $20, $20, $20, $20, $00, $00, $00, $00, $20, $44
    db $49, $52, $45, $43, $54, $4f, $52, $20, $45, $4a, $45, $43, $55, $54, $49, $56
    db $4f, $20, $00, $00, $20, $20, $20, $20, $4a, $41, $4e, $45, $20, $43, $41, $56
    db $41, $4e, $41, $47, $48, $20, $20, $20, $04, $00, $00, $20, $20, $20, $20, $20
    db $44, $49, $52, $45, $43, $54, $4f, $52, $20, $44, $45, $20, $20, $20, $20, $04
    db $20, $20, $20, $20, $20, $44, $45, $53, $41, $52, $52, $4f, $4c, $4c, $4f, $20
    db $20, $20, $20, $20, $00, $00, $20, $20, $20, $44, $41, $56, $49, $44, $20, $52
    db $41, $54, $43, $4c, $49, $46, $46, $45, $20, $20, $04, $00, $00, $00, $00, $20
    db $20, $20, $20, $20, $20, $50, $52, $4f, $44, $55, $43, $54, $4f, $52, $20, $20
    db $20, $20, $20, $04, $00, $20, $20, $20, $4a, $4f, $4e, $41, $54, $48, $41, $4e
    db $20, $43, $4f, $55, $52, $54, $20, $20, $20, $00, $00, $00, $00, $20, $20, $20
    db $52, $45, $4c, $41, $43, $49, $4f, $4e, $45, $53, $20, $43, $4f, $4e, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $41, $53, $4f, $43, $49, $41, $44, $4f
    db $53, $20, $20, $20, $20, $20, $04, $00, $20, $20, $20, $20, $20, $41, $4e, $44
    db $59, $20, $4f, $0b, $44, $4f, $57, $44, $20, $20, $20, $20, $04, $00, $00, $00
    db $20, $20, $20, $49, $4e, $47, $45, $4e, $49, $45, $52, $4f, $53, $20, $44, $45
    db $4c, $20, $20, $20, $00, $20, $43, $4f, $4e, $54, $52, $4f, $4c, $20, $44, $45
    db $20, $43, $41, $4c, $49, $44, $41, $44, $20, $00, $00, $20, $20, $20, $20, $20
    db $20, $42, $45, $4e, $20, $4d, $41, $53, $4f, $4e, $20, $20, $20, $20, $20, $04
    db $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
    db $03, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $50, $52, $45, $53, $45
    db $4e, $54, $41, $43, $49, $4f, $4e, $20, $20, $20, $20, $00, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $05, $20, $20, $20, $20, $20, $20, $20
    db $00, $20, $20, $20, $20, $20, $20, $59, $20, $44, $49, $53, $45, $4e, $4f, $20
    db $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $4b, $45, $49, $54, $48, $20
    db $48, $4f, $44, $47, $45, $54, $54, $53, $20, $20, $20, $00, $00, $00, $00, $20
    db $20, $59, $20, $4d, $55, $43, $48, $4f, $53, $20, $47, $52, $41, $43, $49, $41
    db $53, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $41, $20, $53, $43
    db $49, $20, $20, $20, $20, $20, $20, $20, $04, $00, $00, $00, $00, $00, $20, $20
    db $20, $20, $20, $03, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $00, $20, $20, $20, $43, $52, $45, $44, $49, $54, $4f, $53, $20, $50
    db $55, $4b, $4b, $41, $20, $20, $20, $00, $00, $00, $00, $20, $20, $20, $20, $20
    db $20, $20, $20, $eb, $ec, $ed, $ee, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $20, $20, $20, $20, $20, $20, $20, $20, $ef, $f0, $f1, $f2, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $f3, $f4, $f5
    db $f6, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $f7, $f8, $f9, $fa, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00
    db $20, $20, $20, $20, $44, $49, $52, $45, $43, $54, $4f, $52, $45, $53, $20, $44
    db $45, $20, $20, $20, $04, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $03, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $50
    db $52, $4f, $44, $55, $43, $43, $49, $4f, $4e, $20, $20, $20, $20, $20, $00, $00
    db $20, $20, $20, $20, $44, $41, $4d, $4f, $4e, $20, $42, $52, $41, $4e, $43, $48
    db $20, $20, $20, $20, $00, $20, $20, $20, $43, $4c, $49, $56, $45, $20, $54, $4f
    db $57, $4e, $53, $45, $4e, $44, $20, $20, $20, $00, $00, $00, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $cb, $cc, $cd, $ce, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $cf, $d0, $d1, $d2, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $d3
    db $d4, $d5, $d6, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20
    db $20, $20, $20, $20, $d7, $d8, $d9, $da, $20, $20, $20, $20, $20, $20, $20, $20
    db $00, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $05, $20, $20, $20
    db $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $44, $49, $53
    db $45, $4e, $4f, $20, $20, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $4d
    db $41, $52, $43, $55, $53, $20, $53, $54, $52, $49, $4e, $47, $45, $52, $20, $20
    db $04, $20, $20, $20, $20, $20, $41, $4e, $44, $59, $20, $43, $4f, $41, $54, $45
    db $53, $20, $20, $20, $20, $04, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20
    db $20, $5b, $5c, $5d, $5e, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20
    db $20, $20, $20, $20, $20, $20, $5f, $60, $61, $62, $20, $20, $20, $20, $20, $20
    db $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $63, $64, $65, $66, $20
    db $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $67, $68, $69, $6a, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $03, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $50, $52, $4f, $47, $52, $41, $4d, $41, $43, $49
    db $4f, $4e, $20, $20, $20, $20, $00, $00, $20, $20, $20, $20, $20, $41, $4e, $44
    db $59, $20, $43, $4f, $41, $54, $45, $53, $20, $20, $20, $20, $04, $20, $20, $20
    db $43, $4c, $49, $56, $45, $20, $54, $4f, $57, $4e, $53, $45, $4e, $44, $20, $20
    db $20, $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $bb, $bc, $bd
    db $be, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $bf, $c0, $c1, $c2, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20
    db $20, $20, $20, $20, $20, $20, $20, $c3, $c4, $c5, $c6, $20, $20, $20, $20, $20
    db $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $c7, $c8, $c9, $ca
    db $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20
    db $20, $03, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20
    db $20, $20, $20, $20, $47, $52, $41, $46, $49, $43, $4f, $53, $20, $20, $20, $20
    db $20, $20, $00, $00, $20, $20, $20, $4d, $41, $52, $43, $55, $53, $20, $53, $54
    db $52, $49, $4e, $47, $45, $52, $20, $20, $04, $00, $00, $00, $20, $20, $20, $20
    db $20, $20, $20, $20, $9b, $9c, $9d, $9e, $20, $20, $20, $20, $20, $20, $20, $20
    db $00, $20, $20, $20, $20, $20, $20, $20, $20, $9f, $a0, $a1, $a2, $20, $20, $20
    db $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $a3, $a4
    db $a5, $a6, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20
    db $20, $20, $20, $a7, $a8, $a9, $aa, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $20, $20, $20, $03, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $00, $20, $20, $4d, $55, $53, $49, $43, $41, $0a, $20, $53
    db $4f, $4e, $49, $44, $4f, $20, $59, $20, $20, $00, $20, $20, $45, $46, $45, $43
    db $54, $4f, $53, $20, $44, $45, $20, $53, $4f, $4e, $49, $44, $4f, $20, $04, $00
    db $20, $20, $20, $20, $20, $20, $41, $55, $44, $49, $4f, $41, $52, $54, $53, $20
    db $20, $20, $20, $20, $04, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $6b, $6c, $6d, $6e, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $6f, $70, $71, $72, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $73, $74, $75, $76, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $77
    db $78, $79, $7a, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $03, $20, $20, $20, $20, $20, $20
    db $04, $20, $20, $20, $50, $52, $4f, $47, $52, $41, $4d, $41, $43, $49, $4f, $4e
    db $20, $44, $45, $20, $20, $04, $20, $20, $20, $20, $20, $55, $54, $49, $4c, $49
    db $44, $41, $44, $45, $53, $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $43
    db $4c, $49, $56, $45, $20, $54, $4f, $57, $4e, $53, $45, $4e, $44, $20, $20, $20
    db $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $db, $dc, $dd, $de
    db $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20
    db $20, $df, $e0, $e1, $e2, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20
    db $20, $20, $20, $20, $20, $20, $e3, $e4, $e5, $e6, $20, $20, $20, $20, $20, $20
    db $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $e7, $e8, $e9, $ea, $20
    db $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $05, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $04, $20, $20, $44
    db $49, $53, $45, $4e, $4f, $20, $44, $45, $20, $4e, $49, $56, $45, $4c, $45, $53
    db $20, $04, $00, $20, $20, $20, $43, $4c, $49, $56, $45, $20, $54, $4f, $57, $4e
    db $53, $45, $4e, $44, $20, $20, $20, $00, $20, $20, $20, $4d, $41, $52, $43, $55
    db $53, $20, $53, $54, $52, $49, $4e, $47, $45, $52, $20, $20, $04, $20, $20, $20
    db $20, $20, $41, $4e, $44, $59, $20, $43, $4f, $41, $54, $45, $53, $20, $20, $20
    db $20, $04, $20, $20, $20, $41, $4e, $41, $54, $4f, $4c, $45, $20, $42, $52, $41
    db $4e, $43, $48, $20, $20, $20, $00, $00, $00, $00, $20, $20, $20, $20, $20, $20
    db $20, $20, $8b, $8c, $8d, $8e, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20
    db $20, $20, $20, $20, $20, $20, $20, $8f, $90, $91, $92, $20, $20, $20, $20, $20
    db $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $93, $94, $95, $96
    db $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20
    db $20, $97, $98, $99, $9a, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00, $20
    db $20, $45, $51, $55, $49, $50, $4f, $20, $44, $45, $20, $50, $52, $55, $45, $42
    db $41, $53, $20, $04, $00, $20, $20, $20, $43, $4c, $49, $56, $45, $20, $54, $4f
    db $57, $4e, $53, $45, $4e, $44, $20, $20, $20, $00, $20, $20, $20, $20, $20, $41
    db $4e, $44, $59, $20, $43, $4f, $41, $54, $45, $53, $20, $20, $20, $20, $04, $20
    db $20, $20, $4d, $41, $52, $43, $55, $53, $20, $53, $54, $52, $49, $4e, $47, $45
    db $52, $20, $20, $04, $20, $20, $20, $41, $4e, $41, $54, $4f, $4c, $45, $20, $42
    db $52, $41, $4e, $43, $48, $20, $20, $20, $00, $20, $20, $20, $4a, $4f, $4e, $41
    db $54, $48, $41, $4e, $20, $52, $4f, $47, $45, $52, $53, $20, $20, $04, $20, $20
    db $20, $4c, $45, $45, $20, $50, $45, $52, $52, $59, $09, $53, $4d, $49, $54, $48
    db $20, $20, $04, $20, $20, $20, $20, $20, $52, $4f, $42, $20, $57, $49, $4c, $53
    db $4f, $4e, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $43, $48, $52
    db $49, $53, $54, $4f, $50, $48, $45, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $4b, $45, $49, $52, $41, $4e, $20, $4d, $43, $4d, $49, $4c, $4c, $41, $4e, $20
    db $20, $04, $20, $20, $20, $41, $4e, $59, $41, $20, $41, $4e, $44, $20, $57, $41
    db $59, $4e, $45, $20, $20, $20, $00, $20, $20, $20, $20, $52, $41, $43, $48, $45
    db $4c, $20, $43, $4f, $4f, $50, $45, $52, $20, $20, $20, $04, $20, $20, $20, $20
    db $44, $4f, $4e, $4e, $41, $20, $48, $41, $52, $52, $49, $53, $20, $20, $20, $20
    db $00, $20, $20, $20, $20, $20, $20, $20, $20, $4a, $41, $52, $56, $20, $20, $20
    db $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $4e, $49, $43, $4b, $20, $47
    db $55, $4e, $4e, $49, $4e, $47, $20, $20, $20, $20, $00, $00, $00, $00, $20, $20
    db $20, $20, $20, $20, $20, $20, $7b, $7c, $7d, $7e, $20, $20, $20, $20, $20, $20
    db $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $7f, $80, $81, $82, $20
    db $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20
    db $83, $84, $85, $86, $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $20
    db $20, $20, $20, $20, $20, $87, $88, $89, $8a, $20, $20, $20, $20, $20, $20, $20
    db $20, $00, $00, $20, $20, $20, $20, $20, $41, $50, $4f, $59, $4f, $20, $4d, $4f
    db $52, $41, $4c, $20, $20, $20, $20, $04, $00, $20, $20, $4d, $45, $52, $59, $4c
    db $53, $20, $53, $41, $4e, $44, $57, $49, $43, $48, $45, $53, $20, $04, $20, $20
    db $20, $20, $48, $45, $4c, $45, $4e, $20, $43, $4f, $41, $54, $45, $53, $20, $20
    db $20, $20, $00, $20, $20, $20, $20, $20, $4d, $49, $4e, $49, $20, $4d, $4f, $52
    db $52, $49, $53, $20, $20, $20, $20, $04, $20, $20, $20, $20, $20, $52, $55, $54
    db $48, $20, $42, $41, $4b, $45, $52, $20, $20, $20, $20, $20, $00, $20, $20, $4c
    db $49, $4e, $44, $53, $41, $59, $20, $4b, $45, $52, $4e, $4f, $48, $41, $4e, $20
    db $20, $00, $20, $20, $20, $4b, $41, $52, $45, $4e, $20, $4b, $45, $52, $4e, $4f
    db $48, $41, $4e, $20, $20, $20, $00, $20, $20, $20, $20, $20, $52, $4f, $4e, $20
    db $41, $4e, $44, $20, $4b, $41, $46, $20, $20, $20, $20, $04, $20, $20, $20, $20
    db $20, $53, $55, $4e, $4e, $59, $20, $4d, $4f, $4c, $4c, $59, $20, $20, $20, $20
    db $04, $20, $20, $20, $54, $45, $53, $53, $41, $20, $41, $4e, $44, $20, $53, $49
    db $4d, $4f, $4e, $20, $20, $04, $20, $20, $20, $20, $20, $20, $20, $20, $4b, $41
    db $54, $49, $45, $20, $20, $20, $20, $20, $20, $20, $04, $00, $00, $00, $00, $20
    db $20, $41, $20, $50, $55, $4b, $4b, $41, $20, $47, $41, $4d, $45, $53, $20, $4c
    db $45, $20, $20, $00, $20, $20, $20, $20, $20, $20, $20, $20, $03, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $00, $20, $20, $47, $55, $53, $54, $41
    db $52, $49, $41, $20, $44, $41, $52, $20, $4c, $41, $53, $20, $20, $00, $00, $20
    db $20, $20, $47, $52, $41, $43, $49, $41, $53, $20, $41, $20, $54, $4f, $44, $4f
    db $20, $20, $20, $00, $00, $20, $20, $20, $20, $20, $20, $45, $4c, $20, $4d, $55
    db $4e, $44, $4f, $0a, $20, $20, $20, $20, $20, $00, $00, $00, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $03, $20, $20, $20, $20, $20, $20
    db $00, $20, $20, $20, $20, $20, $50, $45, $52, $4f, $20, $53, $45, $52, $49, $41
    db $20, $20, $20, $20, $20, $00, $00, $20, $20, $20, $20, $49, $4e, $54, $45, $52
    db $4d, $49, $4e, $41, $42, $4c, $45, $20, $20, $20, $20, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $ff

    add hl, bc
    add hl, bc
    add hl, bc
    rrca
    rrca
    ld [$0c0f], sp
    rrca
    add hl, bc
    add hl, bc
    inc c
    dec c
    dec c
    dec c
    ld [$0908], sp
    add hl, bc
    add hl, bc
    add hl, bc
    ld c, $09
    ld [$0808], sp
    ld [$0c0c], sp
    inc c
    inc c
    inc c
    dec c
    dec c
    dec c
    dec c
    dec c
    ld [$090e], sp
    add hl, bc
    add hl, bc
    add hl, bc
    ld c, $08
    ld [$0c08], sp
    inc c
    inc c
    ld [$0e0e], sp
    ld a, [bc]
    ld a, [bc]
    dec c
    dec c
    ld c, $0e
    ld c, $0f
    rrca
    rrca
    ld c, $0e
    ld c, $0c
    inc c
    inc c
    inc c
    rrca
    ld [$0a0e], sp
    ld a, [bc]
    dec c
    dec c
    ld c, $0e
    ld c, $0f
    rrca
    rrca
    ld c, $09
    ld c, $0e
    inc c
    inc c
    rrca
    rrca
    rrca
    ld c, $0e
    dec c
    dec c
    dec c
    dec bc
    dec bc
    dec bc
    rrca
    rrca
    ld [$0808], sp
    ld [$0c0c], sp
    inc c
    rrca
    rrca
    rrca
    ld [$0b0f], sp
    dec bc
    dec bc
    dec bc
    dec bc
    rrca
    rrca
    rrca
    add hl, bc
    ld [$0808], sp
    ld [$0808], sp
    ld [$0808], sp
    dec bc
    dec bc
    dec bc
    dec bc
    dec bc
    inc c
    dec bc
    ld [$0908], sp
    add hl, bc
    add hl, bc
    ld [$0c0c], sp
    ld [$0808], sp
    ld [$0b08], sp
    dec bc
    dec bc
    dec bc
    inc c
    inc c
    ld c, $08
    ld [$0909], sp
    ld bc, $0401
    inc b
    nop
    nop
    nop
    nop
    ld bc, $0003
    nop
    ld bc, $0604
    ld b, $06
    ld b, $01
    ld bc, $0101
    ld bc, $0000
    nop
    nop
    ld bc, $0101
    nop
    inc bc
    inc bc
    ld b, $06
    ld b, $06
    ld b, $07
    ld bc, $0201
    ld bc, $0000
    rlca
    rlca
    ld bc, $0101
    inc bc
    inc bc
    inc bc
    rlca
    rlca
    nop
    ld b, $06
    nop
    nop
    nop
    ld bc, $0001
    nop
    rlca
    rlca
    rlca
    rlca
    rlca
    inc bc
    inc bc
    inc bc
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0304
    rlca
    rlca
    inc bc
    rlca
    rlca
    nop
    nop
    inc bc
    nop
    nop
    nop
    dec b
    nop
    nop
    ld b, $01
    ld [bc], a
    inc b
    inc b
    inc b
    ld bc, $0707
    rlca
    rlca
    nop
    nop
    inc bc
    inc bc
    nop
    dec b
    dec b
    dec b
    ld b, $06
    ld [bc], a
    ld [bc], a
    inc b
    inc b
    inc b
    rlca
    rlca
    rlca
    inc b
    inc b
    nop
    nop
    nop
    nop
    nop
    dec b
    dec b
    dec b
    ld b, $06
    nop
    nop
    nop
    rlca
    ld b, $06
    ld b, $00
    inc b
    inc b
    nop
    nop
    nop
    ld [bc], a
    ld bc, $0606
    ld b, $06
    ld b, $00
    nop
    ld b, $06
    ld b, $06
    ld b, $00
    nop
    nop
    nop
    nop
    nop
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

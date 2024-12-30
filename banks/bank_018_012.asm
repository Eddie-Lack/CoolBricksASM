; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $012", ROMX[$4000], BANK[$12]

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_012_40c7:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_012_416b

    ld h, b
    ld h, b
    ret nz

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
    nop
    nop
    nop
    ld bc, $0000
    ld bc, $0101
    ld bc, $0301
    ld bc, $0301
    inc bc
    inc bc
    add h
    nop
    adc [hl]
    call z, $ccae
    call c, $ecce
    sbc $d6
    cp $f3
    ld a, [hl]
    ld a, a
    ld [hl], d
    ld [$f77e], sp
    ld a, [hl]
    ldh [rLCDC], a
    ldh [rLCDC], a
    db $ec
    ld a, [hl]
    ld h, d
    db $fc
    ldh [rLCDC], a
    ld h, c
    ret nz

    inc [hl]
    nop
    ld a, [hl]
    ld a, [hl]
    ld l, [hl]
    jr jr_012_4163

    jr jr_012_4162

    jr jr_012_4163

    add hl, de
    ret z

    add hl, de
    ret


    sbc b
    inc d
    nop

jr_012_4162:
    ld a, h

jr_012_4163:
    ld a, $fb
    ld h, a
    pop hl
    jp $81c3


    pop bc

jr_012_416b:
    add e
    add e
    add e
    and e
    add $70
    nop
    ld a, h
    ld a, b
    ld d, h
    ld l, [hl]
    ld b, e
    ld h, [hl]
    jp Jump_012_6c66


    ld a, [hl]
    ld a, b
    ld a, h
    ld e, [hl]
    ld l, [hl]
    ld bc, $0702
    inc bc
    ld [bc], a
    ld b, $06
    ld [bc], a
    inc bc
    ld b, $03
    rlca
    inc bc
    ld b, $00
    ld b, $80
    nop
    db $ec
    ret z

    cp h
    ld l, b
    inc e
    ld l, b
    call c, $9c68
    ret z

    inc e
    ld [$0c08], sp
    inc b
    nop
    db $76
    inc l
    ld a, [hl]
    ld h, $67
    cpl
    ld a, a
    dec h
    dec l
    ld h, h
    inc b
    ld l, h
    xor $44
    ld a, [bc]
    nop
    rlca
    dec de
    dec bc
    jr @+$0a

    jr @+$0a

    sbc b
    adc b
    ret c

    ld l, b
    ret c

    jr c, jr_012_4238

    jr nz, jr_012_41c2

jr_012_41c2:
    ld hl, sp-$01
    ld d, [hl]
    db $eb
    ld b, d
    jp Jump_012_43e2


    ld [c], a
    ld b, e
    ld [c], a
    ld b, e
    pop hl
    ld b, e
    nop
    nop
    ld [$180c], sp
    inc c
    ld [$180c], sp
    inc c
    inc e
    ld [$190c], sp
    or c
    add hl, de
    nop
    nop
    jr z, jr_012_41f4

    jr nc, jr_012_421e

    add hl, sp
    ld a, b
    ret


    ld a, c
    ld c, [hl]
    ld sp, hl
    ld sp, hl
    db $fd
    reti


    adc l
    ld [$7f00], sp
    ccf

jr_012_41f4:
    ld a, [$e56d]
    ret nz

    pop bc
    add b
    add c
    add b
    add hl, bc
    add b
    ret


    sbc h
    nop
    nop
    di
    pop af
    rst $18
    db $e3
    ld b, a
    add $c4
    adc $44
    adc $c4
    adc $4b
    add $41
    nop
    jp hl


    di
    db $fd
    dec de
    rrca
    add hl, de
    dec bc
    dec e
    dec e
    dec de
    ccf
    add hl, de

jr_012_421e:
    ld [hl], c
    dec sp
    add [hl]
    nop
    add e
    add [hl]
    add d
    rst $00
    add $e7
    ld [hl-], a
    rst $20
    sbc d
    or a
    ld l, $9f
    ld d, $8f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_4238:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    inc bc
    ld bc, $0002
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and $33
    db $10
    inc hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp Jump_000_3e7c


    ld a, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nc

    ld hl, sp-$48
    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, h
    cp $44
    jr c, jr_012_4285

jr_012_4285:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, d
    ld h, a
    inc hl
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
    nop
    ld [bc], a
    ld b, $06
    nop
    nop
    nop
    nop
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
    rrca
    rlca
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
    nop
    nop
    nop
    add h
    call z, Call_000_0488
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $10
    jr c, jr_012_42eb

    nop
    nop
    nop
    nop
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
    ld b, c
    ld b, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_42eb:
    nop
    nop
    nop
    nop
    nop
    dec sp
    pop af
    ld b, b
    pop hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    adc h
    nop
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, l
    ei
    ld [hl-], a
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
    nop
    nop
    nop
    db $fd
    di
    ldh a, [rSB]
    nop
    nop
    nop
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
    di
    ld [bc], a
    pop hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc d
    add a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_012_43e2:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_012_4458

jr_012_4458:
    jr nc, jr_012_448a

    jr nc, @+$62

    jr nz, @+$42

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_448a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    db $76
    ld c, l
    ld e, [hl]
    db $ed
    ld c, [hl]
    db $fd
    xor $fd
    db $fc
    rst $38
    cp h
    rst $30
    cp $b7
    add sp, $10
    db $fd
    ei
    ld [c], a
    add c
    ret nz

    add b
    db $f4
    ld hl, sp-$3c
    ldh a, [$c7]
    add b
    rst $20
    add [hl]
    nop
    nop
    rst $38
    db $e3
    call nz, $aaef
    call z, $c8be
    xor h
    ret c

    adc h
    ret c

    jp hl


    adc [hl]
    ld [$ae00], sp
    rst $18
    ld c, e
    rst $38
    ld e, l
    ld a, c
    ld c, l
    ld a, c
    ld e, a
    ld a, a
    adc $7f
    rst $28
    db $db
    inc bc
    nop
    inc bc
    inc bc
    ld b, d
    add e
    ld b, d
    add e
    jp nz, $8383

    inc bc
    add d
    inc bc
    ld b, e
    add d
    ret nz

    nop
    call c, $ace8
    ld a, b
    inc a
    ld l, b
    ld l, h
    ld hl, sp-$24
    ret z

    sbc h
    ld [$0c1a], sp
    ld [$4a00], sp
    ld a, h
    ld c, [hl]
    ld a, h
    ld c, a
    ld a, [hl]
    ld e, d
    ld l, a
    db $dd
    ld l, e
    db $fc
    ld c, c
    call c, $2ac8
    nop
    cpl
    ccf
    dec l
    inc sp
    add hl, hl
    ld sp, $31a1
    ld sp, $a9b1
    pop af
    ldh [$f1], a
    add b
    nop
    or $fc
    and [hl]
    call c, $8c06
    ld b, d
    adc h
    ld b, $8c
    add $8c
    adc [hl]
    add h
    nop
    nop
    jr jr_012_4564

    db $10
    jr nc, @+$1a

    jr nc, jr_012_4549

    ld sp, $3139
    inc hl
    inc sp
    scf
    ld h, e
    nop
    nop
    jr nz, jr_012_45a4

    pop af
    ld h, b
    db $e3
    pop af
    and c

jr_012_4549:
    di
    ld a, [c]
    or e
    cp $f3
    ld a, [$3b13]
    nop
    ei
    ld a, a
    cp $d9
    ret z

    add c
    add b
    ld bc, $0001
    nop
    ld bc, $1920
    ret nz

    nop
    di
    pop af

jr_012_4564:
    sub a
    db $e3
    jp $cc86


    add [hl]
    call z, $c686
    adc h
    call z, $b086
    ld b, b
    db $fc
    ld hl, sp+$78
    adc h
    ld c, $0c
    ld b, $0c
    inc b
    inc c
    inc c
    inc c
    ld [$401c], sp
    add b
    ldh [$c0], a
    ldh a, [$e0]
    ldh a, [$f0]
    ld hl, sp-$28
    ret z

    call c, $cec4
    jp Jump_012_40c7


    add b
    add b
    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    nop
    nop
    nop
    nop

jr_012_45a4:
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, d
    or a
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
    nop
    nop
    di
    rst $38
    jp c, Jump_000_0021

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $00
    adc a
    add e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call z, Call_000_0899
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp nz, $8283

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rrca
    nop
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call z, $9498
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
    ld l, c
    ld [hl], c
    ld de, $0020
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add a
    add a
    add l
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
    nop
    nop
    nop
    ld b, e
    and $a0
    add $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld de, $041b
    add hl, de
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $fd
    di
    db $d3
    rst $20
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp Jump_012_61f7


    di
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc b
    ld a, b
    ldh [$f0], a
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
    pop bc
    jp $c1c0


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
    ret nz

    ret nz

    add b
    ret nz

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr jr_012_47dd

    jr jr_012_47b3

    jr nc, jr_012_47dd

    nop
    nop
    nop
    nop
    nop
    nop

jr_012_47b3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_47dd:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0602
    inc bc
    ld b, $03
    rlca
    inc bc
    inc bc
    rlca
    dec b
    rlca
    dec b
    rlca
    ld a, [bc]
    nop
    inc e
    rst $38
    or a
    ld hl, sp-$3c
    ld hl, sp-$22
    db $fd
    call nc, Call_012_66f8
    ld sp, hl
    pop af
    ld a, a
    nop
    nop
    sub $ef
    ld c, c
    rst $38
    push af
    ld e, c
    push af
    ld e, c
    db $fd
    ld d, c
    ld [hl], e
    db $dd
    cp a
    rst $18
    nop
    nop
    db $fc
    ld [hl], b
    ld a, [hl]
    ld hl, sp-$16
    call c, $d86e
    ld [hl], h
    ld hl, sp-$04
    ld [hl], b
    ret c

    ld a, [hl]
    ld [hl], b
    nop
    ld [hl], l
    ld a, [hl]
    ld d, l
    ld a, [hl]
    ld l, l
    ld e, [hl]
    push de
    ld a, [hl]
    ld l, l
    db $76
    push af
    ld b, [hl]
    di
    ld b, [hl]
    ld [$1a00], sp
    ld a, h
    xor c
    ld a, [hl]
    cpl
    ld a, h
    adc a
    ld a, [hl]
    ld c, d
    ld a, a
    db $ed
    ld e, e
    ld l, a
    reti


    ld a, d
    nop
    ld e, a
    rst $38
    db $e4
    ld e, a
    rst $38
    ld b, h
    ld a, a
    call nz, $c477
    push af
    add $f7
    call nz, Call_000_0081
    ld sp, hl
    db $e3
    pop de
    ld h, e
    ld a, [hl-]
    ld h, e
    ld d, d
    ld h, e
    ld e, d
    ld h, e
    ld [hl], d
    ld h, e
    dec sp
    ld h, [hl]
    inc b
    nop
    rst $00
    inc c
    sbc a
    inc c
    rst $08
    inc e
    or l
    ld e, $bd
    ld [hl], $ff
    ld a, $63
    ld a, [hl]
    inc bc
    inc c
    ccf
    rra
    ld [hl], a
    ld a, $38
    ld h, b
    ret nc

    ld h, b
    ld h, b
    ret nz

    ldh [$c0], a
    ld [hl], a
    call nz, $d028
    rst $38
    ld hl, sp-$15
    ld [hl], c
    ld l, c
    ld h, e
    ld [hl], e
    ld h, e
    ld d, [hl]
    ld h, e
    ld l, d
    ld h, e
    db $76
    ld h, e
    sub h
    ld a, b
    rst $38
    db $fc
    and [hl]
    adc $c7
    ld b, $86
    ld b, $47
    ld b, $86
    ld b, $85
    ld c, $f0
    ld h, b
    ld hl, sp+$60
    ld hl, sp+$70
    db $fc
    ld a, b
    jp c, $df7c

    ld l, h
    rst $18
    ld h, [hl]
    rst $00
    ld h, e
    ret nz

    ld h, b
    ret nc

    ld h, b
    ret nz

    ld h, b
    ret nc

    ld h, b
    ret nc

    ld h, b
    ret nz

    ld h, b
    ret nc

    ld h, b
    ld d, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp a
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
    nop
    rst $30
    adc [hl]
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
    cp [hl]
    ld c, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $30
    ld b, e
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
    nop
    nop
    xor [hl]
    ret c

    sbc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    push af
    add $81
    ld b, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], l
    ld a, $3e
    inc e
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
    rst $10
    ld h, d
    ld [c], a
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, l
    cp $b9
    ld a, l
    ld de, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $ed
    ld [hl], e
    rst $38
    ld sp, hl
    ld hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [hl]
    adc h
    cp $f8
    ld l, b
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
    pop de
    ld h, e
    ret nc

    ld h, c
    ld b, b
    ld h, b
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
    ret nc

    ldh [$c0], a
    ldh [$50], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_012_4a67:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    inc c
    dec c
    ld [$0816], sp

Jump_012_4aec:
    nop
    nop
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $01
    inc bc
    rlca
    inc bc
    rlca
    rlca
    rlca
    rlca
    rlca
    dec b
    rlca
    rlca
    rlca
    nop
    nop
    ldh a, [rIE]
    adc e
    rst $38
    add $fd
    ret c

    rst $38
    sub l
    rst $28
    or a
    rst $38
    or $ff
    ld [bc], a
    nop
    ld c, e
    rst $30
    push af
    rst $38
    xor l

Jump_012_4bb7:
    rst $38
    and d
    rst $38
    db $db
    and $40
    rst $38
    ld [hl], h
    rst $38
    adc l
    nop
    adc e
    rst $38
    sbc l
    rst $38
    sbc l
    rst $38
    adc l
    rst $38
    xor a
    rst $38
    xor e
    rst $38
    cp a
    db $eb
    push af
    nop
    cp $fd
    daa
    db $fc
    dec h
    cp $36
    db $ed
    ld h, a
    cp h
    ld [hl], h
    xor a
    ld l, h
    or a
    xor l
    nop
    and c
    sbc $a9
    sbc $ae
    db $dd
    or h
    rst $18
    rst $10
    cp l
    db $dd
    cp a
    push hl
    cp a
    ld c, d
    ccf
    ld a, a
    rst $38
    sbc h
    rst $30
    push af
    add [hl]
    ld d, c
    add [hl]
    ld h, l
    add [hl]
    pop hl
    ld b, $0d
    or $fc
    rra
    rst $38
    ld a, $fa
    ld h, a
    sub $63
    ld a, d
    jp $c37a


    ld a, e
    jp nz, $c67b

    rst $18
    pop hl
    ld a, a
    pop hl
    ld l, l
    di
    ld a, c
    rst $30
    push de
    ld a, e
    ld a, l
    db $db
    ld l, c
    rst $18
    db $fd
    ld c, a
    ldh [rP1], a
    ldh [rP1], a
    ldh a, [rP1]
    ldh [rP1], a
    ldh [rP1], a
    ldh [rP1], a
    ldh a, [rP1]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, bc
    or $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc c
    ld h, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld e, c
    rst $28
    db $ec
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop

Call_012_4cec:
    nop
    nop
    nop
    nop
    ld [hl], a
    xor a
    adc a
    inc hl
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
    ld a, l
    and a
    ld hl, sp+$27
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
    xor [hl]
    rst $30
    rst $38
    rst $28
    ret nc

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
    nop
    ld b, l
    cp $ff
    ld a, h
    ld a, e
    inc a
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $30
    ld c, a
    ei
    ld b, a
    ei
    ld b, e
    dec bc
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [rP1], a
    ldh [rP1], a
    ldh [rP1], a
    jr nz, jr_012_4d48

jr_012_4d48:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$78f0], sp
    add b
    and b
    nop
    and b
    nop
    stop
    jp hl


    ld d, $00
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    inc bc
    inc bc
    inc bc
    ld b, $03
    inc bc
    inc bc
    rlca
    inc bc
    rla
    nop
    rra
    rst $38
    cp $ff
    ld l, [hl]
    rst $38
    ld a, a
    rst $38
    xor d
    rst $18
    rst $18
    rst $38
    or l
    rst $38
    pop af
    rrca
    ld e, [hl]
    rst $38
    and b
    rst $38
    cp h
    di
    ld e, c
    or $a8
    rst $30
    or b
    rst $38
    sub l
    rst $38
    ret nc

    rst $38
    push de
    ld a, [$7de2]
    rst $30
    ld a, b
    dec h
    ld a, [$f936]
    rla
    ld hl, sp-$6b
    ld a, [$0080]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp nz, $0f3f

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sub d
    rst $38
    ld [hl], a
    sbc a
    ld a, [de]
    dec b
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $10
    cp b
    dec b
    ld a, [$b847]
    ld a, [hl]
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
    add b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc bc
    nop
    nop
    nop
    nop
    ld a, b
    inc a
    inc a
    nop
    ld a, [hl+]
    nop
    inc d
    nop
    nop
    nop
    adc b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    inc bc
    ld b, $03
    dec b
    inc bc
    inc b
    inc bc
    ld b, $03
    inc b
    inc bc
    dec b
    inc bc
    inc b
    inc bc
    jp nc, $1afd

    push af
    dec e
    ldh a, [$8e]
    pop af
    ld a, [bc]
    push af
    inc c
    di
    ld d, $eb
    xor [hl]
    db $d3
    cp $00
    ld c, h
    ld a, $68
    sbc a
    ld [c], a
    rra
    ld [c], a
    rra
    inc hl
    rst $18
    jp c, Jump_012_4a67

    rst $30
    ret nz

    nop
    dec h
    ld a, [$f98e]
    adc c
    rst $38
    db $db
    xor a
    ld e, $e3
    rrca
    ei
    inc e
    ei
    nop
    nop
    add b
    nop
    ret nz

    add b
    nop
    add b
    nop
    add b
    ld b, b
    add b
    nop
    add b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_012_52ff:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $03
    inc b
    inc bc
    inc b
    inc bc
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
    ld l, $d3
    cpl
    ret nc

    ld a, [hl+]
    ret nc

    ret nc

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor h
    ld d, e
    xor a
    db $10
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
    cpl
    ret nc

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_5458:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, bc
    ld b, $00
    nop
    nop
    nop
    ld [bc], a
    ld bc, $0103
    ld bc, $0000
    nop
    nop
    nop
    inc [hl]
    ld [$0000], sp
    nop
    nop
    ld b, b
    add b
    jr nz, jr_012_5458

    ld b, b
    nop
    and b
    nop
    nop
    nop
    jr nz, jr_012_54a0

jr_012_54a0:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, $0f
    rra
    ld c, $0f
    ld c, $1f
    ld c, $0f
    ld c, $1f
    ld c, $0d
    ld c, $1f
    ld c, $7d
    dec sp
    push af
    ld a, e
    db $fd
    ld [hl], e
    ld l, l
    di
    ld a, h
    db $e3
    ld e, h
    db $eb
    ld a, [hl]
    ret


    ld a, [hl]
    sbc c
    xor c
    add $5f
    add [hl]
    call nc, $bf03
    inc bc
    add l
    dec sp
    sub l
    dec sp
    cp e
    dec a
    db $fd
    dec sp
    pop hl
    db $10
    cp a
    ld bc, $b14b
    ld e, [hl]
    add c
    ld b, [hl]
    adc c
    sub c
    adc [hl]
    rst $08
    adc [hl]
    ld b, a
    cp [hl]
    db $dd
    nop
    db $fd
    rst $18
    rst $38
    db $dd
    cp a
    call $cdbf
    rst $30
    adc l
    rst $38
    add l
    ei
    add l
    and [hl]
    nop
    cp [hl]
    pop bc
    adc e
    or $f6
    cp a
    or a
    cp $be
    rst $30
    sub a
    cp $ff
    or [hl]
    ld [c], a
    nop
    rst $00
    rst $38
    db $e4
    rst $18
    and h
    rst $18
    or l
    sbc $c5
    cp [hl]
    ld b, l
    rst $38
    call $8077
    nop
    or [hl]
    add hl, de
    ld a, h
    cp e
    or h
    rst $38
    inc [hl]
    rst $38
    sbc h
    inc hl
    sub $b9
    or a
    db $fc
    nop
    nop
    jr c, jr_012_5661

    push af
    cpl
    ld a, a
    xor a
    xor a
    ld sp, hl
    ldh a, [$ef]
    and [hl]
    rst $38
    ld h, h
    cp a
    nop
    nop
    ret nz

    nop
    nop
    ret nz

    nop
    ret nz

    ret nz

    nop
    ld b, b
    add b
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_564b:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_5661:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld c, $15
    ld c, $03
    ld c, $04
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $18
    jr c, @+$01

    jr c, jr_012_564b

    jr c, jr_012_56db

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $fd
    dec sp
    cp a
    ld [bc], a
    ld [hl], l
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_56db:
    nop
    nop
    nop
    nop
    nop
    ld c, c
    or [hl]
    xor $01
    jr nz, jr_012_56e6

jr_012_56e6:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    res 6, h
    ld l, a
    sub b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, a
    or [hl]
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
    nop
    nop
    nop
    nop
    ld e, a
    pop hl
    add sp, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $db
    or h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $18
    jr nz, jr_012_5733

jr_012_5733:
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
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
    jr nc, jr_012_5815

    nop
    inc c
    nop
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_5815:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    ld b, $0c
    rlca
    dec c
    ld b, $0d
    ld b, $0c
    rlca
    dec c
    ld b, $0d
    ld b, $0d
    ld b, $0d
    ld c, $19
    ld c, $3d
    ld a, [de]
    dec [hl]
    ld a, [hl-]
    ld l, $75
    ld b, l
    cp $f7
    call z, $8ee5
    ld c, a
    jr nc, @+$01

    ld h, b
    ei
    ret nz

    di
    ret nz

    ldh a, [$c1]
    or b
    pop bc
    ld sp, $b1c1
    ld b, c
    dec sp
    nop
    db $eb
    inc [hl]
    pop de
    ld c, $9e
    ld c, h
    ld l, a
    adc h
    ld l, $cc
    rst $28
    adc h
    rst $28
    adc h
    and b
    ld b, b

jr_012_5912:
    and h
    ld e, b
    ld a, $c0
    ld l, $00
    dec bc
    inc b
    ld [$0d07], sp
    ld b, $74
    rst $08
    ld h, c
    nop
    ld d, c
    db $e3
    reti


    db $e3
    db $db
    pop hl
    rst $28
    pop de
    rst $28
    pop de
    rst $30
    ret


    cp d
    push bc
    ld [$cc00], sp
    sbc a
    ld c, e
    sbc h
    ld e, d
    adc h
    ld c, [hl]
    sbc h
    res 3, h
    ld c, d
    sbc h
    dec sp
    call c, $0016
    jr nc, jr_012_5912

    ld a, h
    adc $ef
    call z, $efcd
    rst $38
    call $cfed
    rst $28
    call z, $0070
    ld a, c
    ld l, h
    ld a, [c]
    db $ed
    add sp, -$23
    add d
    db $fd
    and e
    db $fc
    db $e3
    ld a, l
    db $e3
    ld a, l
    jr jr_012_5962

jr_012_5962:
    sbc $f0
    xor [hl]
    db $fc
    adc $fc
    sub d
    db $ec
    cp $c0
    xor [hl]
    call z, $cc9e

jr_012_5970:
    nop
    nop
    rla
    add hl, sp
    ld h, c
    ld a, a
    db $fc
    ld l, a
    ld l, h
    ld a, a
    ld a, b
    rlca
    ld l, d
    dec [hl]
    db $e4
    ld a, a
    nop
    nop
    rst $28
    jr jr_012_5970

    inc e
    sbc [hl]
    ld l, h
    xor $3d
    db $f4
    ld a, $b7
    ld a, l
    db $fd
    ld l, a
    nop
    nop
    db $ec
    rst $10
    ld [hl], l
    ccf
    inc a
    scf
    and $dd
    add h
    ccf
    db $f4
    ccf
    db $f4
    ccf
    nop
    nop
    nop
    add b
    ret nz

    add b
    ret nz

    add b
    ld b, b
    add b
    nop
    ret nz

    and b
    ld b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec c
    ld b, $09
    ld b, $07
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, a
    adc h
    adc l
    ld b, $8f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, a
    inc de
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
    nop
    nop
    nop
    nop
    ld h, e
    cp h
    call $0132
    nop
    nop
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
    adc a
    sub $09
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and e
    call z, $804e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    push af
    jr jr_012_5acf

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $ed
    adc $6e
    nop
    nop
    nop
    nop
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
    ld [hl], h
    ld [hl], c
    nop
    nop
    nop
    nop
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
    adc h
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
    db $db
    ld l, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $fd
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
    dec sp
    call nz, RST_00
    nop
    nop
    nop
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
    nop
    nop

jr_012_5acf:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    inc bc
    ld [bc], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_5bf5:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_5c0a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_012_5bf5

    ld [hl+], a
    pop bc
    ld [bc], a
    jp $c625


    jr nz, jr_012_5c0a

    inc l
    ret c

    nop
    ld hl, sp-$7d
    ld b, b
    inc c
    rst $00
    xor e
    call z, $cc50
    sbc h
    ret z

    sub b
    call z, $cc40
    add b
    adc $c1
    nop
    ld b, $e3
    jp Jump_000_3030


    jr jr_012_5c79

    jr jr_012_5c63

    jr jr_012_5c61

jr_012_5c5d:
    jr jr_012_5c8f

    jr jr_012_5cb7

jr_012_5c61:
    nop
    ld e, c

jr_012_5c63:
    rst $38
    inc sp
    call z, $c0c4
    and b
    ret nz

    add b
    ret nz

    ld h, b
    ret nz

    add b
    adc $00
    nop
    ld b, $83
    ld b, $c3
    add b
    ld h, a
    inc h

jr_012_5c79:
    ld h, a
    rlca
    db $76
    ld a, h
    daa
    ld d, c
    ld l, [hl]
    nop
    nop
    inc b
    ld c, $0c
    add [hl]
    ld c, b
    add [hl]
    inc c
    add $29
    add $51
    and $14

jr_012_5c8f:
    ld h, e
    nop
    nop
    ld a, [de]
    ccf

jr_012_5c94:
    ld b, $39
    add hl, de
    jr nc, @+$03

    jr c, jr_012_5cb3

    ld sp, $3920
    ld l, b
    ld sp, $0016
    xor h
    cp $30
    adc $84
    adc $84
    adc $80
    rst $08
    inc bc
    rst $08
    add h
    rst $08
    jr jr_012_5cb2

jr_012_5cb2:
    dec d

jr_012_5cb3:
    ld a, $66
    ccf
    ld h, h

jr_012_5cb7:
    ld a, a
    sub $ff
    sub b
    rst $38
    ld [hl], b
    sbc a
    ld [hl], $99
    inc bc
    nop
    ld [hl-], a

jr_012_5cc3:
    rra
    dec d
    ld a, $35
    ld e, $10
    ccf
    scf
    jr jr_012_5c5d

    jr c, jr_012_5cff

    cp b
    ld b, b
    nop
    jr nz, jr_012_5c94

    and c
    pop bc
    pop hl
    jp $c1a3


    ld hl, $e1c0
    ret nz

    add e
    pop hl
    nop
    nop
    ld d, h
    ei
    sub [hl]
    rst $38
    ld d, l
    cp [hl]
    ld d, h
    cp [hl]
    dec b
    cp $11
    cp $30
    rst $38
    nop
    nop
    jr c, jr_012_5cc3

    ret z

    scf
    ld b, d
    scf
    ld [hl+], a
    ccf
    ld a, [hl-]
    scf
    ld [hl], $3b
    xor [hl]

jr_012_5cff:
    ld [hl], e
    ld a, [de]
    nop
    jr nc, @+$01

    add $03
    rlca
    inc bc
    sub b
    ccf
    ld l, $03
    daa
    jp $e3d6


    nop
    nop
    ld [hl], h
    xor $6d
    cp $cd
    cp $cc
    rst $38
    call nc, Call_012_52ff
    rst $38
    jp nc, Jump_000_00ff

    nop
    nop
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

jr_012_5d42:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_012_5d42

    add b
    ld h, b
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
    add b
    rst $00
    ld b, b
    jp VBlankInterrupt


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc h
    ld [hl], e
    sub b
    db $e3
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
    sbc l
    db $e3
    add e
    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, $ec
    inc c
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
    ld b, d
    ld sp, $0031
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    pop af
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
    nop
    nop
    nop
    ld [$86c7], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec [hl]
    jr jr_012_5deb

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$d0f0], sp
    jr nz, jr_012_5de5

jr_012_5de5:
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_5deb:
    nop
    nop
    nop
    nop
    nop
    ld h, d
    jp RST_20


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], e
    sbc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    di
    pop bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $10
    rst $38
    sub $00
    nop
    nop
    nop
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
    rst $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
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
    ret nz

    add b
    ret nz

    ld b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld [$180c], sp
    inc e
    ld [$180d], sp
    dec e
    add hl, bc
    rrca
    dec de
    rra
    ld c, $30
    nop
    inc sp
    ld sp, $7377
    ld [hl], e
    or $93
    or $53
    or [hl]
    sub [hl]
    inc sp
    ld sp, $8033
    nop
    db $e3
    pop af
    jp c, $0c39

    jr jr_012_5fc1

    inc c
    inc b
    inc c
    ld b, $0c
    sbc c
    inc c
    inc h

jr_012_5fc1:
    nop
    rst $30
    rst $38
    ld e, h
    rst $20
    ld b, h
    ld h, b

jr_012_5fc8:
    ret nz

    ld h, b
    ld b, b
    ld h, b
    jp nz, $c760

    ld h, [hl]
    nop
    nop
    ld bc, $8382
    jp $e347


    ld [hl+], a
    ld h, a
    ld [hl], e
    ld h, $27
    scf
    cp [hl]
    ld h, h
    nop
    nop
    ld c, $04
    adc d
    inc b

jr_012_5fe6:
    ld b, $84
    adc h
    add $c4
    add $c2
    and $b7
    ld h, d
    nop
    nop
    ccf
    rla
    dec a
    ld [de], a
    jr c, @+$12

    jr c, @+$12

    jr c, @+$12

    jr nc, @+$12

    db $10
    jr nc, jr_012_6023

    nop
    ldh a, [$fe]
    or $c6
    nop
    add $82
    add $80
    add $83
    add $c3
    add a
    ld [$1b00], sp
    dec c
    dec de
    dec e
    rra
    add hl, sp
    add hl, sp
    ld l, l
    jp hl


    ld c, l
    adc b
    call $881d
    nop
    nop
    dec c

jr_012_6023:
    inc b
    adc a
    dec b
    add a
    dec c
    adc [hl]
    dec b
    ld c, $84
    add h
    adc h
    call z, Call_012_708c
    nop
    ld hl, sp-$10
    jr jr_012_5fe6

    jr c, jr_012_5fc8

    ld hl, sp-$70
    ld a, b
    ldh a, [$38]
    db $10
    jr c, jr_012_6050

    inc bc
    nop
    rla
    rrca
    dec a
    dec de
    dec de
    ld sp, $313b
    add hl, hl
    rra
    rra
    rrca
    dec de
    dec a

jr_012_6050:
    inc b
    nop
    sbc a
    ld a, $2d
    di
    ldh a, [$61]
    ld h, c
    ldh [$31], a
    ldh [$f1], a
    jr nz, jr_012_6098

    or c
    ld [de], a
    nop
    ld e, a
    ccf
    ccf
    adc h
    call c, $948c
    call z, $cc4c
    adc $cc
    adc l
    call Call_000_1c23
    db $eb
    ccf
    ld bc, $0103
    inc bc
    inc sp
    ccf
    inc sp
    rrca
    ld bc, $8183
    jp $0090


    sub e
    add hl, sp
    dec a
    cp e
    db $fd
    dec sp
    ld a, e
    cp a
    rst $30
    ccf
    cpl
    rst $38
    ld l, [hl]
    rst $30
    add b
    nop
    ret nz

    add b
    ret nz

    add b
    add b
    ret nz

jr_012_6098:
    ret nz

    ret nz

    ldh [$c0], a
    ld b, b
    ldh [rLCDC], a
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
    nop
    nop
    nop
    ld c, $1c
    nop
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
    ld [de], a
    ld sp, $1020
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ei
    ld sp, hl
    ld de, $00e0
    nop
    nop
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
    di
    pop hl
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add $ec
    call nz, RST_00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, $3133
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    pop af
    ldh [rNR41], a
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
    jp nz, $8687

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$040c], sp
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
    ld a, h
    ld hl, sp+$48
    jr nc, jr_012_6145

jr_012_6145:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nc, jr_012_616a

    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, e
    ld sp, $0021
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_616a:
    nop
    nop
    nop
    nop
    nop
    nop
    dec de
    sbc a
    adc c
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
    dec b
    adc a
    ld [bc], a
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp $aabf


    rra
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ei
    and $06
    ld h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, @-$1e

    nop
    ld h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_012_61f7:
    nop
    nop
    nop
    inc bc
    ld [bc], a
    ld bc, $0103
    nop
    nop
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
    add b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    inc b
    ld c, $04
    rrca
    inc b
    rrca
    inc b
    rrca
    dec b
    rrca
    rlca
    rrca
    ld b, $00
    nop
    ld l, a
    inc sp
    ld a, [hl]
    ld h, a
    and $7c
    or [hl]
    db $ec
    ld h, a
    cp h
    push af
    ld l, $2a
    scf
    nop
    nop
    xor a
    rst $08
    or $cf
    ld [hl], a
    ld h, d
    ld a, a
    ld [hl+], a
    cpl
    ld [hl-], a
    ld [hl], a
    ld [hl+], a
    or d
    ld l, a
    nop
    nop
    ld a, b
    ldh a, [$78]
    db $fc
    ld e, [hl]
    inc c
    adc a
    inc b
    dec b
    ld b, $65
    ld b, $a4
    ld a, a
    nop
    nop
    ld h, e
    ld b, c
    db $d3
    ld h, c
    ld a, e
    pop hl
    ld a, e
    pop af
    db $d3
    ld sp, hl
    db $fd
    ld sp, hl
    db $db
    adc h
    nop
    nop
    adc e
    rrca
    sbc b
    rrca
    adc h
    ld [$0c98], sp
    ret z

    inc c
    ld e, h
    adc b
    call z, Call_000_0a98
    nop
    rst $38
    ld a, [$f66b]

Jump_012_6366:
    rst $20
    ld b, d
    ld [c], a
    ld b, [hl]
    db $e3
    ld b, [hl]
    db $e3
    ld b, [hl]
    rst $20
    ld b, e

jr_012_6370:
    ld [$1900], sp
    rrca
    add hl, sp
    rra
    add hl, sp
    ccf
    dec l
    ld a, e
    rst $18
    ld l, c
    xor c
    call $8dc8
    nop
    nop
    add l
    dec c
    adc a
    dec c
    add l
    rrca
    adc a
    dec c
    adc c
    inc c
    ld c, $8c
    ret c

    adc h
    sub b
    ld h, b
    ldh a, [$f0]
    db $10
    or b
    sbc b
    jr nc, jr_012_63e9

    or b

jr_012_639a:
    ld hl, sp-$10
    ld d, b
    jr nc, jr_012_63d7

    db $10
    ld b, $01
    rra
    rrca
    ccf
    add hl, de
    dec sp
    ld sp, $3131
    dec a
    rra
    rra

jr_012_63ad:
    rrca
    add hl, sp
    rra
    ld c, $00
    ccf
    sbc a
    ld a, a
    or c
    ld [hl], c
    and b
    jr nc, jr_012_639a

    ld [hl], b
    and b
    ld h, b
    or b
    jr c, jr_012_6370

    rra
    nop
    adc a
    rra
    rst $18
    add [hl]
    jp nz, Jump_012_66c6

    add $c3
    ld h, [hl]
    jp nz, Jump_012_6366

    add $8f
    rrca
    sbc b
    rst $08
    add b
    nop
    nop

jr_012_63d7:
    nop
    ld b, $0f
    inc bc
    rrca
    jr nz, jr_012_63de

jr_012_63de:
    jr nz, jr_012_6440

    jp $e7e0


    db $e3
    ld h, a
    ld h, e
    ld h, e
    ld h, a
    ld h, e

jr_012_63e9:
    rst $20
    and $e7
    ld l, l
    ld h, [hl]
    inc a
    ld h, [hl]
    jr jr_012_63f2

jr_012_63f2:
    inc e
    jr jr_012_63ad

    inc e
    inc a
    sbc h
    sbc h
    cp h
    or $bc
    cp h
    or $e6
    or $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec sp
    inc hl
    ld hl, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_6440:
    rst $38
    rst $08
    add c
    nop
    nop
    nop
    nop
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
    cp l
    stop
    nop
    nop
    nop
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
    adc h
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
    nop
    nop
    nop
    nop
    db $f4

jr_012_6471:
    ld hl, sp+$10
    ld h, b
    nop
    nop
    nop
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
    ld b, a
    ld b, b
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
    sbc c
    inc c
    inc b
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
    call c, Call_012_68f8
    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr @+$32

    jr nc, jr_012_64b4

jr_012_64b4:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, e
    ld sp, $2110
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr c, jr_012_6471

    adc a
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
    nop
    nop
    nop
    rst $00
    jp nz, $8303

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
    db $ed
    ld h, b
    rst $20
    rst $08
    adc l
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
    and [hl]
    ld l, h
    call z, Call_012_4cec
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
    ld [hl], a
    and $e2
    ld h, [hl]
    jr nz, jr_012_6518

    nop
    nop

jr_012_6518:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [rP1], a
    db $10
    ldh [rSVBK], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    daa
    ld c, h
    scf
    ld a, l
    cpl
    ld c, l
    ccf
    ld [hl], c
    ccf
    ld a, c
    scf
    ld a, b
    daa
    nop
    nop
    ld c, d
    rst $30
    xor [hl]
    rst $38
    db $d3
    ld a, $3a
    rst $10
    inc de
    sbc $bb
    sub $fe
    rst $30
    nop
    nop
    pop de
    ld [c], a
    and $fb
    inc de
    cp a
    sub e
    rra
    sub a
    rra
    ld h, a
    sbc a
    rst $38
    db $f4
    nop
    nop
    xor [hl]
    ld de, $b14f
    rst $18
    ld sp, $f11f
    sbc l
    di
    sbc h
    di
    cp d
    rst $18
    ld [bc], a
    nop
    cp $ff
    ld d, [hl]
    ei

Jump_012_66c6:
    call c, $ca33
    inc sp
    adc $33
    xor h
    inc sp
    xor e
    inc sp
    adc h
    nop
    sbc e
    ld e, $fb

jr_012_66d5:
    ld e, $f3
    ld a, $bb
    ld a, [hl]
    ld l, a
    jp c, $dbae

    rst $20
    sbc e
    inc b
    inc bc
    sub a
    ccf
    sub [hl]
    dec a
    sub [hl]
    dec a
    sub h
    ccf
    sbc a
    scf
    xor d
    ld sp, $30e9
    ld b, b
    add b
    pop hl
    add b
    pop bc
    add c
    pop hl
    add e

Call_012_66f8:
    pop hl
    add e
    db $e3
    add c
    pop hl
    add b
    pop hl
    add c
    ld [$ff71], sp
    di
    sbc [hl]
    rst $30
    cp l
    ld d, $fd
    ld d, $ff
    or $ff
    or $da
    rst $30
    jr nz, jr_012_66d5

    db $eb
    di
    rst $30
    jr c, jr_012_6733

    jr jr_012_6727

    jr @+$1c

    inc c
    sbc [hl]
    ld [$0c98], sp
    dec b
    di
    ld hl, sp-$0d
    or b
    ret nz

    ret nz

jr_012_6727:
    ret nz

    and e
    pop bc
    db $e3
    pop bc
    and b
    ret nz

    jp c, $fecc

    ld hl, sp+$5c

jr_012_6733:
    cp b
    ld c, $18
    dec c
    jr @-$1f

    ld hl, sp-$01
    ld hl, sp+$2e
    add hl, de
    add hl, de
    dec c
    ld h, [hl]
    jp $e7d3


    rst $10
    rst $20
    rst $28
    rst $20
    rst $38
    rst $20
    rst $20
    rst $38
    db $fd
    cp a
    sbc $bd
    nop
    nop
    add b
    nop
    add b
    nop
    ret nz

    nop
    nop
    add b
    add b
    add b
    ret nz

    add b
    ldh [$80], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc h
    nop
    nop
    nop
    nop
    nop
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
    rst $20
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor [hl]
    ld [hl], h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $28
    ld e, [hl]
    ld c, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc l
    inc sp
    inc hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $08
    add hl, de
    dec d
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
    ld hl, sp-$20
    pop bc
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
    db $e3
    add e
    ld b, d
    add e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, a
    sub e
    dec a
    ld de, $0010
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld e, $f8
    ld hl, sp-$10
    and b
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
    ld a, d
    call z, $f97e
    ld a, e
    ld [hl], c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec de
    dec c
    db $dd
    ei
    db $fd
    ei
    and c
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
    sbc l
    ld e, e
    sbc h
    adc l
    jr jr_012_6867

jr_012_6867:
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
    ret nz

    ldh [$c0], a
    and b
    ret nz

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    ld c, $07
    ld b, $07
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_012_68f8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc de
    ld a, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sub $00
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    inc bc
    ld a, h
    rst $30
    ld a, a
    db $db
    ld a, a
    ei
    ld a, a
    sbc $7f
    cp [hl]
    ld e, a
    cp l
    ld e, a
    nop
    nop
    ld a, [bc]
    push af
    rst $38
    rst $38
    sbc a
    rst $38
    cp l
    rst $38
    adc a
    rst $38
    sub $ff
    rst $28
    ei
    ld bc, $0f00
    rst $38
    dec a
    rst $38
    and a
    db $fd
    and l
    rst $38
    and b
    rst $38
    and l
    rst $38
    pop af
    rst $28
    ld e, h
    nop
    add hl, sp
    rst $38
    xor l
    ld a, e
    dec hl
    db $fd
    ld e, e
    db $fd
    ld c, c
    rst $38
    adc c

jr_012_6a3d:
    rst $38
    push af
    sbc a
    ld l, [hl]
    jr nc, jr_012_6a3d

    db $f4
    ld a, [hl]
    ret nc

    sub a
    ld hl, sp+$7b
    db $f4
    ld a, a
    ldh a, [rRP]
    cp b
    ld a, [$0a14]
    ld [hl], a
    ld [hl], a
    rst $38
    adc e
    db $fc
    db $db
    cp h
    db $eb
    cp h
    ld [$79fd], a
    cp $e4
    rst $38
    ld e, a
    cp [hl]
    sbc a
    cp $9b
    db $ec
    ld l, e
    call c, Call_012_6cdb
    ld e, e
    ld l, h
    db $db
    ld l, h
    db $db
    ld l, l
    ld a, a
    db $fc
    or a
    ld c, h
    rrca
    inc b
    adc a
    inc b
    cp a
    ld a, h
    ld a, l
    ld a, [hl]
    cp [hl]
    dec b
    db $ec
    rlca
    ld [hl], l
    adc $dd
    xor $df
    xor $df
    xor $ff
    xor $ef
    cp $aa
    rst $38
    ld a, [$80bf]
    nop
    ret nz

    nop
    ret nz

    nop
    ret nz

    nop
    ld b, b
    nop
    ldh [rP1], a
    ret nz

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld e, e
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, [hl]
    xor c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld e, a
    push hl
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
    ld [hl], a
    sbc a
    dec hl
    ld d, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $11
    adc [hl]
    ld de, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call nz, Call_012_7bbf
    sub a
    add hl, hl
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
    nop
    rst $20
    call $cfb7
    adc $07
    ld b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, a
    add l
    rst $10
    dec l
    rst $38
    ld a, l
    ld b, [hl]
    add hl, sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    cp e
    ld d, l
    cp e
    ld [hl], l
    sbc e
    xor b
    inc de
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [rP1], a
    ldh [rP1], a
    ret nz

    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_012_6c66:
    nop
    nop
    nop
    nop
    nop
    nop
    jr c, jr_012_6ca6

    jr c, jr_012_6ca8

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, $07
    nop
    nop
    nop
    nop
    nop
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
    db $e4
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_6ca6:
    nop
    nop

jr_012_6ca8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_012_6cdb:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr c, jr_012_6d82

jr_012_6d82:
    ld de, $df6f
    ld a, a
    rst $38
    ld a, a
    cp a
    ld a, a
    rst $38
    ld a, a
    ld a, [hl]
    ld a, a
    sub [hl]
    ld a, a
    ld [hl], b
    rrca
    rst $30
    rst $38
    ld d, d
    rst $38
    ld hl, sp-$01
    ld e, e
    rst $38
    cp e
    rst $38
    xor d
    rst $38
    and e
    rst $38
    or [hl]
    rst $38
    ld a, h
    di
    nop
    rst $38
    ld sp, $24ff
    rst $38
    and [hl]
    rst $38
    add d
    rst $38
    ld d, d
    rst $38
    ld b, d
    db $fc
    ld c, d
    db $f4
    jp nc, Jump_012_4aec

    db $f4
    jp z, $c2f4

    db $fc
    or h
    ld [$fe40], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, h
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
    nop
    nop
    nop
    nop
    nop
    ld h, h
    cp a
    db $ed
    ld [de], a
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
    pop hl
    rst $18
    ld h, b
    rst $18
    and [hl]
    ld e, a
    jr jr_012_6ecf

jr_012_6ec8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_6ecf:
    nop
    jr z, jr_012_6ec8

    dec bc
    db $f4
    ld a, [bc]
    db $f4
    rst $18
    jr nz, jr_012_6ef9

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_6ef9:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, l
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
    nop
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
    ldh [$c0], a
    ldh [$c0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_012_708c:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, b
    ld a, a
    add hl, sp
    ld a, [hl]
    dec hl
    ld a, h
    ld d, c
    ld a, [hl]
    ld l, e
    ld a, h
    ld a, a
    ld a, b
    db $d3
    ld a, h
    cp a
    ld a, b
    call nc, $e12b
    ld a, [bc]
    rlca
    ld hl, sp-$1d
    ld a, h
    call nz, $c63f
    dec a
    add a
    ld a, h
    rst $20
    ld a, h
    ld sp, hl
    add b
    db $ec
    cp e
    push bc
    cp e
    add [hl]
    rst $38
    or $af
    rst $28
    or [hl]
    adc h
    rst $30
    xor h
    rst $30
    add b
    ld b, b
    ret nc

    jr nz, jr_012_7135

    ret nz

    db $10
    ldh [$f0], a
    ldh [$d0], a
    ldh [$60], a
    ldh [$d0], a
    jr nz, jr_012_7111

jr_012_7111:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_7135:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $18
    ld a, b
    xor a
    ld a, b
    and a
    ld a, b
    add $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc c
    ld h, [hl]
    cp a
    ld b, b
    and h
    nop
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
    ld [$7095], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    rst $18
    inc hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add sp, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $00
    rrca
    ld b, $0f
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    rrca
    rlca
    rlca
    rrca
    ld b, $0f
    ld c, $0f
    ld c, $0f
    rra
    ld c, $0f
    ld e, $f7
    dec sp
    db $fd
    inc sp
    ld a, l
    inc sp
    push de
    inc sp
    xor l
    inc sp
    call $ff33
    ld bc, $03fd
    db $db
    ld b, $af
    nop
    add c
    rlca
    add e
    rlca
    rst $38
    inc bc
    db $eb
    rlca
    add e
    rlca
    cp l
    rra
    ret


    inc e
    ld a, a
    jr jr_012_749a

    cp b
    ld a, c
    or a
    inc sp
    rst $30
    ld l, a
    or a
    ld l, a
    or a
    ld l, a
    or a
    ld [hl], c
    pop bc
    di
    ld b, c
    xor a
    ld b, c
    xor a
    ld d, c
    ccf
    reti


    dec hl
    pop de
    or a
    ld b, c
    db $eb
    ld b, c
    xor e
    ret nz

    di
    rst $08
    or a
    set 3, e
    rst $30
    add a
    ei
    cp a
    res 7, a
    db $db
    sbc a
    ei
    ld a, b
    add b
    dec de
    db $fc
    cp l
    ld e, d
    ld a, [hl+]
    rst $18
    cp [hl]
    ld c, e
    ld a, [$364f]
    bit 7, [hl]
    jp RST_00


    db $d3
    ld a, $97
    ld a, [hl]
    rst $10
    cp $d4
    rst $38
    rst $10
    db $fc
    rst $10
    db $fc
    ld [hl], h
    rst $18
    ld c, $00
    dec [hl]
    jp nz, $c4bf

    sub l
    rst $38
    or a
    rst $38
    or a
    rst $38
    scf
    rst $38
    ld a, [hl]
    sub c
    nop
    nop
    db $10
    ldh [$b0], a
    ldh [rSVBK], a
    and b
    ld [hl], b
    and b
    ld d, b
    and b
    and b
    ret nz

    ret nz

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
    nop

jr_012_749a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, $1e
    dec e
    ld e, $0d
    ld e, $1f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $76
    adc c

jr_012_7522:
    sub d
    ld c, l
    or a
    ld c, b
    ld c, d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp e
    dec e
    db $eb
    inc d
    reti


    nop
    ld d, b
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
    and a
    scf
    add b
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
    nop
    nop
    rst $28

jr_012_7551:
    ld b, c
    db $76
    pop bc
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
    and a
    ret c

    rra
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
    ld a, [hl]
    jp $c008


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nc, jr_012_7551

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    push af
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_012_7522

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $10
    ld h, b
    ldh a, [$60]
    ld h, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [de]
    inc e
    ld [hl-], a
    inc e
    inc [hl]
    ld a, [de]
    inc d
    dec sp
    ld a, $31
    ld a, [hl-]
    dec [hl]
    ld h, d
    dec a
    add hl, hl
    db $76
    ld d, d
    rst $20
    ld [c], a
    rst $10
    xor $d3
    sbc [hl]
    db $e3
    cp d
    rst $00
    jp z, Jump_012_4bb7

    or [hl]
    adc [hl]
    ld [hl], a
    or a
    ld c, c
    sub $01
    add b
    nop
    add b
    nop
    call c, $bc20
    ld b, b
    add b
    nop
    add a
    ld b, $7c
    add b
    rst $38
    ld bc, $637b
    ld a, a
    ld h, e
    ld a, [$7667]
    ld h, a
    bit 6, [hl]
    di
    ld h, [hl]
    ld a, e
    add c
    cp l
    jp $836d


    ret nc

    rrca
    adc a
    dec c
    sbc a
    dec c
    sbc a
    dec c
    sbc c
    rra
    ld h, b
    add b
    ld a, b
    add b
    ld a, h
    add b
    ld c, h
    sub b
    ld d, b
    cp h
    ld c, h
    or b
    ld e, b
    and b
    ld a, b
    add b
    ld c, l
    jr nc, jr_012_77d2

    ld [hl], c
    ld a, [hl+]
    ld [hl], l
    daa
    ld a, [hl]
    inc h
    ld a, a
    dec hl
    ld [hl], l
    dec hl
    ld [hl], c
    ld l, d
    ld [hl], c
    rlca
    nop
    adc l
    rst $18
    ld c, c
    sbc a
    call $d99f
    sbc a
    reti


    sbc a
    db $db
    sbc a
    rra
    ei
    inc e
    nop
    ccf
    sbc d
    cp $19
    db $fd
    dec de
    rst $18
    add hl, sp
    xor a
    ld e, c
    rst $38
    add hl, bc
    rst $30
    add hl, bc
    nop
    nop
    ld [hl], a
    adc c
    ld l, a
    sbc c
    rst $18
    cp c
    db $dd
    cp e
    push de
    cp e
    rst $38
    sbc e
    rst $30
    sbc e
    nop
    nop

jr_012_77d2:
    ret


    sbc h
    rst $38
    sbc c
    db $dd
    cp e
    ei
    or a
    or c
    rst $38
    ld a, e
    push hl
    ld a, a
    db $ed
    nop
    nop
    ccf
    ret nz

    sub d
    db $ed
    rst $18
    sbc a
    dec de
    sbc a
    adc a
    rra
    ld sp, hl
    rra
    ret z

    ld a, a
    ld b, b
    nop
    ccf
    call z, $cdb7
    cp $b5
    db $76
    cp l
    ld a, $b5
    ld [hl], $fd
    ld c, $fd
    nop
    nop
    add b
    ret nz

    ldh [$c0], a
    ret nz

    ret nz

    ldh [$c0], a
    ld b, b
    ret nz

    and b
    ld b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, c
    ld h, [hl]
    ld a, l
    ld h, d
    rra
    ld h, b
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, e

jr_012_7861:
    or [hl]
    db $e4
    dec de
    cp e
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add e
    ld b, $df
    jr nz, jr_012_7861

    db $10
    ld c, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], a
    ldh [$91], a
    ld h, b
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
    push de
    dec sp
    rst $18
    ld hl, $0030
    nop
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
    add h
    call z, RST_00
    nop
    nop
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
    ld [hl], b
    ld d, b
    jr nz, jr_012_78b5

jr_012_78b5:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, e
    cp a
    cp $01
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp a
    ld bc, $0088
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $10
    adc b
    add [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, c
    xor $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $20
    jr jr_012_7903

jr_012_7903:
    nop
    nop
    nop
    nop
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
    inc c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_7a20:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_7a41:
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
    jr jr_012_7a5d

    jr c, jr_012_7a77

    jr nc, jr_012_7a51

jr_012_7a51:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_7a5d:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_7a6e:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_7a77:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $00
    ld bc, $0a06
    rlca
    ld [$0c07], sp
    rlca
    ld bc, $120f
    dec c
    dec e
    add hl, bc
    add hl, sp
    nop
    ld hl, $1118
    jr c, @+$47

    jr c, jr_012_7a6e

    jr c, jr_012_7a20

    ld a, b
    db $10
    db $ed
    ld h, c
    call z, $fe20
    ld a, [hl+]
    call nc, $80c0
    ld b, b
    add b
    add d
    db $fc
    ld b, $f8
    ld b, b
    add b
    ret nz

    add c
    ld a, [hl]
    nop
    nop
    ld a, a
    ld [hl+], a
    inc e
    inc b
    jr jr_012_7abd

    jr jr_012_7ac0

    jr jr_012_7a41

jr_012_7abd:
    jr jr_012_7b03

    sbc b

jr_012_7ac0:
    ld e, $00
    ld b, b
    ccf
    ld a, [bc]
    ld [hl], c
    ld b, b
    pop hl
    and b
    pop bc
    ld bc, $83c1

jr_012_7acd:
    pop bc
    ld h, h
    jp Jump_000_003c


    pop bc
    ld a, $6c
    or e
    ld h, d
    or c
    jr z, jr_012_7acd

    ld [$49b7], a
    cp [hl]
    ld e, h
    or e
    inc bc
    nop
    nop
    inc bc
    add c
    inc bc
    nop
    add e
    nop
    add e
    add c
    inc bc
    nop
    inc bc
    add c
    inc bc
    ldh [rP1], a
    inc b
    cp $2c
    sbc [hl]
    xor b
    ld a, $28
    cp $1c
    and $4c
    add [hl]
    adc c
    ld b, $0e
    nop
    dec [hl]

jr_012_7b03:
    ld a, $09
    ccf
    inc h
    ccf
    inc h
    ccf
    dec h
    ld a, $6d
    ld [hl], $6d
    db $76
    ld a, [de]
    nop
    ld a, [bc]
    rra
    adc c
    inc e
    db $10
    sbc h
    ld [$b0dc], sp
    ld e, h
    db $10
    ld a, h
    nop
    inc a
    nop
    nop
    ld b, l
    cp $9d
    and $a5
    add $af
    add $e5
    add $84
    rst $20
    add b
    rst $20
    nop
    nop
    jr jr_012_7b64

    jr nc, jr_012_7b6f

    add hl, sp
    ld sp, $3b21
    ld a, a
    inc sp
    ld l, d
    scf
    ld l, a
    halt
    nop
    nop
    ld h, b
    jp $e786


    add l
    xor $5c
    xor $0a
    db $fc
    ld a, [de]
    db $fc
    ld b, b
    ld a, a
    nop
    nop
    dec h
    ld a, [$fc0b]
    cp c
    dec e
    add hl, de
    dec e
    dec de
    dec e
    db $dd
    add hl, de
    cp d
    db $dd
    nop
    nop
    add l
    ld a, e

jr_012_7b64:
    reti


    rst $20
    and c
    rst $08
    add l
    rst $08
    ld c, l
    adc a
    db $dd
    adc a
    add hl, hl

jr_012_7b6f:
    rst $18
    add b
    nop
    call z, Call_000_2c8e
    adc $8c
    xor $8c
    cp $84
    cp $e5
    sbc [hl]
    sub b
    adc $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add hl, de
    dec b
    jr jr_012_7bbd

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    call z, $c40b
    add h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_7bbd:
    nop
    nop

Call_012_7bbf:
    nop
    ld l, c
    add b
    ld b, $fc
    db $ec
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $10
    ret c

    and b
    ld a, b
    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc b
    ld [hl], a
    ld bc, $083e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, d
    ld sp, $3001
    nop
    nop
    nop
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
    add e
    add e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add h
    inc bc
    add e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec d
    and $20
    add $00
    nop
    nop
    nop
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
    inc c
    nop
    nop
    nop
    nop
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
    db $e3
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
    nop
    nop
    nop
    nop
    dec e
    and $e2
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, h
    inc sp
    ld de, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, @+$01

    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    push bc
    add hl, sp
    ld de, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call z, Call_000_0082
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

    db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f
    db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f
    db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f
    db $30, $31, $32, $33, $34, $35, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    jr nz, @+$4f

    ld c, c
    ld c, [hl]
    ld c, c
    jr nz, jr_012_7d80

    ld c, a
    ld d, d
    ld d, d
    ld c, c
    ld d, e
    jr nz, jr_012_7d5a

    jr nz, @+$22

    inc b
    jr nz, jr_012_7d5f

    jr nz, jr_012_7d61

    jr nz, jr_012_7d95

    ld d, l
    ld d, h
    ld c, b
    jr nz, jr_012_7d8a

    ld b, c
    ld c, e
    ld b, l
    ld d, d
    jr nz, jr_012_7d6e

    jr nz, @+$22

    jr nz, jr_012_7d52

jr_012_7d52:
    jr nz, jr_012_7d74

    ld c, h
    ld c, c
    ld c, [hl]
    ld b, h
    ld d, e
    ld b, c

jr_012_7d5a:
    ld e, c
    jr nz, jr_012_7da8

    ld b, l
    ld d, d

jr_012_7d5f:
    ld c, [hl]
    ld c, a

jr_012_7d61:
    ld c, b
    ld b, c
    ld c, [hl]
    jr nz, jr_012_7d86

    nop
    jr nz, @+$22

    jr nz, jr_012_7db6

    ld b, c
    ld d, d
    ld b, l

jr_012_7d6e:
    ld c, [hl]
    jr nz, @+$4d

    ld b, l
    ld d, d
    ld c, [hl]

jr_012_7d74:
    ld c, a
    ld c, b
    ld b, c
    ld c, [hl]
    jr nz, jr_012_7d9a

    jr nz, jr_012_7d7c

jr_012_7d7c:
    jr nz, jr_012_7d9e

    jr nz, jr_012_7da0

jr_012_7d80:
    jr nz, jr_012_7dd4

    ld c, a
    ld c, [hl]
    jr nz, jr_012_7dc7

jr_012_7d86:
    ld c, [hl]
    ld b, h
    jr nz, @+$4d

jr_012_7d8a:
    ld b, c
    ld b, [hl]
    jr nz, jr_012_7dae

    jr nz, jr_012_7db0

    inc b
    jr nz, @+$22

    jr nz, jr_012_7db5

jr_012_7d95:
    jr nz, @+$55

    ld d, l
    ld c, [hl]
    ld c, [hl]

jr_012_7d9a:
    ld e, c
    jr nz, @+$4f

    ld c, a

jr_012_7d9e:
    ld c, h
    ld c, h

jr_012_7da0:
    ld e, c
    jr nz, jr_012_7dc3

    jr nz, jr_012_7dc5

    inc b
    jr nz, jr_012_7dc8

jr_012_7da8:
    jr nz, jr_012_7dfe

    ld b, l
    ld d, e
    ld d, e
    ld b, c

jr_012_7dae:
    jr nz, jr_012_7df1

jr_012_7db0:
    ld c, [hl]
    ld b, h
    jr nz, jr_012_7e07

    ld c, c

jr_012_7db5:
    ld c, l

jr_012_7db6:
    ld c, a
    ld c, [hl]
    jr nz, jr_012_7dda

    inc b
    jr nz, jr_012_7ddd

    jr nz, jr_012_7ddf

    jr nz, jr_012_7de1

    jr nz, jr_012_7de3

jr_012_7dc3:
    ld c, e
    ld b, c

jr_012_7dc5:
    ld d, h
    ld c, c

jr_012_7dc7:
    ld b, l

jr_012_7dc8:
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_012_7dd4

    nop
    nop
    nop
    nop

jr_012_7dd4:
    jr nz, jr_012_7df6

    ld b, c
    jr nz, jr_012_7e29

    ld d, l

jr_012_7dda:
    ld c, e
    ld c, e
    ld b, c

jr_012_7ddd:
    jr nz, @+$49

jr_012_7ddf:
    ld b, c
    ld c, l

jr_012_7de1:
    ld b, l
    ld d, e

jr_012_7de3:
    jr nz, jr_012_7e31

    ld b, l
    jr nz, jr_012_7e08

    nop
    jr nz, jr_012_7e0b

    jr nz, @+$22

    jr nz, jr_012_7e0f

    jr nz, @+$22

jr_012_7df1:
    inc bc
    jr nz, jr_012_7e14

    jr nz, jr_012_7e16

jr_012_7df6:
    jr nz, jr_012_7e18

    jr nz, jr_012_7e1a

    jr nz, jr_012_7e1c

    jr nz, jr_012_7dfe

jr_012_7dfe:
    jr nz, jr_012_7e20

    ld b, a
    ld d, l
    ld d, e
    ld d, h
    ld b, c
    ld d, d
    ld c, c

jr_012_7e07:
    ld b, c

jr_012_7e08:
    jr nz, @+$46

    ld b, c

jr_012_7e0b:
    ld d, d
    jr nz, jr_012_7e5a

    ld b, c

jr_012_7e0f:
    ld d, e
    jr nz, jr_012_7e32

    nop
    nop

jr_012_7e14:
    jr nz, jr_012_7e36

jr_012_7e16:
    jr nz, jr_012_7e5f

jr_012_7e18:
    ld d, d
    ld b, c

jr_012_7e1a:
    ld b, e
    ld c, c

jr_012_7e1c:
    ld b, c
    ld d, e
    jr nz, jr_012_7e61

jr_012_7e20:
    jr nz, jr_012_7e76

    ld c, a
    ld b, h
    ld c, a
    jr nz, jr_012_7e47

    jr nz, jr_012_7e29

jr_012_7e29:
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    ld b, l

jr_012_7e31:
    ld c, h

jr_012_7e32:
    jr nz, jr_012_7e81

    ld d, l
    ld c, [hl]

jr_012_7e36:
    ld b, h
    ld c, a
    ld a, [bc]
    jr nz, @+$22

    jr nz, jr_012_7e5d

    jr nz, jr_012_7e3f

jr_012_7e3f:
    nop
    nop
    jr nz, jr_012_7e63

    jr nz, jr_012_7e65

    jr nz, jr_012_7e67

jr_012_7e47:
    jr nz, jr_012_7e69

    jr nz, jr_012_7e6b

    jr nz, @+$22

    jr nz, @+$05

    jr nz, jr_012_7e71

    jr nz, jr_012_7e73

    jr nz, jr_012_7e75

    nop
    jr nz, jr_012_7e78

    jr nz, jr_012_7e7a

jr_012_7e5a:
    jr nz, jr_012_7eac

    ld b, l

jr_012_7e5d:
    ld d, d
    ld c, a

jr_012_7e5f:
    jr nz, @+$55

jr_012_7e61:
    ld b, l
    ld d, d

jr_012_7e63:
    ld c, c
    ld b, c

jr_012_7e65:
    jr nz, jr_012_7e87

jr_012_7e67:
    jr nz, jr_012_7e89

jr_012_7e69:
    jr nz, jr_012_7e6b

jr_012_7e6b:
    nop
    jr nz, jr_012_7e8e

    jr nz, jr_012_7e90

    ld c, c

jr_012_7e71:
    ld c, [hl]
    ld d, h

jr_012_7e73:
    ld b, l
    ld d, d

jr_012_7e75:
    ld c, l

jr_012_7e76:
    ld c, c
    ld c, [hl]

jr_012_7e78:
    ld b, c
    ld b, d

jr_012_7e7a:
    ld c, h
    ld b, l
    jr nz, @+$22

    jr nz, jr_012_7ea0

    nop

jr_012_7e81:
    nop
    nop
    nop
    nop
    nop
    nop

jr_012_7e87:
    nop
    nop

jr_012_7e89:
    nop
    nop
    nop
    nop
    nop

jr_012_7e8e:
    nop
    nop

jr_012_7e90:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    add hl, bc
    add hl, bc
    add hl, bc
    rrca
    rrca
    ld [$0c0f], sp

jr_012_7ea0:
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

jr_012_7eac:
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

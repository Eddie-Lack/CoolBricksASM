; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $014", ROMX[$4000], BANK[$14]

    jr nz, jr_014_4002

jr_014_4002:
    ld h, e
    nop
    jr nz, jr_014_4006

jr_014_4006:
    ld h, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld a, h
    cp $7f
    rst $38
    ld a, a
    db $fd
    ld h, e
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
    add a
    inc bc
    add e
    jp $c3e3


    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    rst $38
    rst $38
    rst $38
    rst $38
    cp $81
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
    sbc b
    cp b
    sbc h
    db $fc
    jr jr_014_40ac

    jr jr_014_4071

jr_014_4071:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $10
    ld a, b
    jr c, jr_014_40ed

    ld a, b
    ldh [$f0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, $01

jr_014_408a:
    ccf
    rra
    ccf
    ld a, a
    push af
    ld a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add c
    nop
    pop de
    pop hl
    di
    pop af
    or c
    ld a, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_014_408a

    cp $fc

jr_014_40ac:
    cp $ff
    sbc a
    rst $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec bc
    ld b, $0f
    rrca
    rrca
    rrca
    ld c, $8f
    nop
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
    ret nz

    add sp, -$10
    ld hl, sp-$04
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    nop
    rra
    ccf
    ccf
    ccf
    ccf
    inc a
    jr c, jr_014_411c

    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [rP1]
    ld hl, sp-$04
    db $fc
    db $fc
    db $f4

jr_014_40ed:
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

jr_014_411c:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld h, b
    ld hl, sp+$60
    ldh a, [$60]
    ld sp, hl
    ld h, b
    di
    ld a, a
    rst $38
    ld a, a
    ld a, a
    rst $38
    rst $20
    ld a, a
    rst $30
    db $e3
    ld [hl], e
    db $e3
    rst $20
    ld [hl], e
    rst $30
    db $e3
    rst $10
    db $e3
    add l
    jp $8307


    and a
    jp $8040


    nop
    add b
    jp nz, $ffbf

    rst $38
    db $fc
    rst $38
    ld b, b
    add b
    add b
    nop
    nop
    add b
    ld a, $19
    dec a
    dec de
    cp a
    rra
    cp a
    rra
    ccf
    ld e, $1e
    ccf
    ccf
    rra
    dec de
    ccf
    ret nc

    ldh [$e0], a
    pop bc
    add c
    add c
    add e
    ld bc, $0301
    inc bc
    ld bc, $8301
    and e
    pop bc
    ldh a, [$e0]
    ret nz

    ldh [$c0], a
    ret nz

    add b
    ret nz

    ret nz

    add b
    ret nz

    add b
    ret nz

    add b
    add b
    ret nz

    dec a
    add hl, sp
    dec e
    add hl, sp
    ccf
    add hl, de
    dec a
    add hl, de
    dec e
    add hl, sp
    dec sp
    add hl, sp
    ld [hl], c
    add hl, sp
    ld a, e
    ld [hl], c
    add l
    jp $c183


    add e
    pop bc
    add a
    jp $ffcf


    cp $ff
    db $fc
    cp $9f
    rst $38
    rst $08
    adc [hl]
    adc a
    adc $cf
    adc $87
    adc $8f
    adc [hl]
    adc a
    ld c, $0f
    ld c, $8f
    ld c, $5c
    ld a, $1e
    rrca
    rrca
    rlca
    inc bc
    rlca
    rlca
    inc bc
    rlca
    inc bc
    inc bc
    rlca
    rrca
    rlca
    jr c, jr_014_422e

    jr c, jr_014_4230

    cp [hl]
    dec a
    ld e, a
    cp a
    rst $38
    cp a
    jp c, $fcbc

    cp b
    ld e, h
    cp b
    nop
    nop
    nop
    nop
    db $10
    ld hl, sp-$04
    ld hl, sp-$3c
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

jr_014_422e:
    nop
    nop

jr_014_4230:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_4261:
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld h, e
    pop af
    ld h, b
    ld a, b
    ldh [rP1], a
    ld h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $30
    db $e3
    rst $30
    di
    ld a, e
    ld [hl], e
    inc sp
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    dec a
    jp nz, $ffff

    rst $38
    rst $38
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, $19
    dec e
    jr c, jr_014_4261

    jr jr_014_42e3

    jr jr_014_42c1

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    pop de
    pop hl
    ld [hl], c
    ld hl, sp-$48
    ld a, h
    jr nz, jr_014_42d0

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    pop bc

jr_014_42c1:
    ldh [$f3], a
    rst $38
    cp a
    ld a, a
    ld c, $3f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_42d0:
    pop hl
    pop af
    jp $a1e1


    pop bc
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
    adc a
    rst $00
    add c

jr_014_42e3:
    jp $c180


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
    rst $08
    adc [hl]
    xor $cf
    rst $00
    rst $28
    pop bc
    rlca
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    rlca
    rrca
    cp $1f
    cp $fe
    ld hl, sp-$04
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop
    ret c

    inc a
    dec sp
    inc a
    ccf
    rra
    rra
    rrca
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
    ld hl, sp+$00
    ld hl, sp-$08
    db $fc
    ld hl, sp-$10
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0700
    inc bc
    inc bc
    rlca
    inc bc
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
    ret c

    ldh [$fe], a
    ldh a, [$7e]
    ld hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc a
    ld a, a
    rst $38
    rst $38
    pop af
    rst $38
    ret z

    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, b
    add b
    cp [hl]
    ret c

    cp $98
    ld a, $19
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_014_43da

jr_014_43da:
    ld a, h
    ld [hl], b
    ld l, c
    ldh a, [$f9]
    pop hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc sp
    inc c
    ccf
    ld a, a
    rst $38
    rst $38
    rst $38
    pop hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    rst $08
    add a
    rst $20
    rst $08
    rst $18
    and $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [$f0], a
    ld hl, sp-$06
    db $fc
    rst $18
    inc a
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    ld e, $3c
    ccf
    ccf
    ccf
    ccf
    dec sp
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
    add b
    ret nz

    ldh [$f8], a
    ldh a, [rP1]
    nop
    nop
    nop
    ld [bc], a
    nop
    ld l, a
    ccf
    ld a, a
    ld a, a
    ld a, [hl]
    ld a, a
    ld a, b
    ld [hl], b
    jr c, jr_014_44b0

    nop
    nop
    nop
    nop
    and b
    nop
    ldh a, [$f8]
    ld hl, sp-$04
    db $fc
    ld hl, sp+$10
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_44b0:
    ld [bc], a
    rlca
    ld [bc], a
    rlca
    ld [bc], a
    rlca
    ld [bc], a
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    sbc a
    inc a
    rst $18
    inc c
    sbc [hl]
    inc c
    rst $38
    inc e
    ld sp, hl
    db $fc
    ld a, [c]
    ld hl, sp-$02
    ldh a, [$7f]
    ld hl, sp-$30
    ldh [$f0], a
    ret nz

    jp $ffff


    rst $38
    rst $38
    rst $38
    ret c

    ldh [$e8], a
    ret nz

    ldh a, [$c0]
    cpl
    add hl, de
    dec sp
    rra
    rst $38
    rra
    cp $9f
    cp l
    ld e, $3f
    ld e, $3f

jr_014_44ed:
    rra
    dec sp
    rra
    pop af
    jp $c393


    ld b, a
    add e
    add e
    rlca
    add a
    rlca
    add [hl]
    rlca
    rst $20
    rlca
    db $e3
    add a
    or b
    ret nz

    ret nz

    add b
    ld b, b
    add b
    add b
    nop
    ret nz

    nop
    add b
    nop
    add b
    ld bc, $01c3
    rst $20
    xor $7f
    and $77
    xor $7f
    and $f7
    rst $28
    rst $20
    rst $28
    rst $18
    rst $20
    and $cf
    rra
    ld c, $87
    ld c, $07
    ld c, $8f
    ld e, $7d
    cp $fa
    db $fc
    ldh a, [$f8]
    ld a, [$39fc]
    jr c, jr_014_456f

    jr c, jr_014_44ed

jr_014_4535:
    jr c, jr_014_4573

    jr c, jr_014_4571

    jr c, jr_014_4577

    jr c, jr_014_4575

    jr c, jr_014_457b

    jr c, jr_014_4535

    ld hl, sp+$3a
    ld a, h
    ld a, $1c
    ld c, $1e
    rrca
    ld c, $0f
    ld c, $0f
    ld c, $1f
    ld c, $78
    ld [hl], b
    ld a, b
    ld [hl], b
    ld [hl], c
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    db $76
    ld a, b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    nop
    nop
    nop
    nop
    ld hl, sp-$10
    ldh a, [$f8]
    ld hl, sp-$10
    add b
    nop
    nop
    nop
    nop

jr_014_456f:
    nop
    nop

jr_014_4571:
    nop
    nop

jr_014_4573:
    nop
    nop

jr_014_4575:
    nop
    nop

jr_014_4577:
    nop
    nop
    nop
    nop

jr_014_457b:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    ld [bc], a
    rlca
    ld b, $03
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc $3d
    adc a
    ld e, $4c
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
    ldh a, [$c0]
    ld [$7fff], a
    rst $38
    ccf
    ld a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec a
    dec de
    call c, $9e39
    cp b
    db $fc
    jr jr_014_4609

jr_014_4609:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $18
    db $e3
    ld sp, hl
    di
    db $fc
    ld [hl], c
    ld c, b
    jr nc, jr_014_4619

jr_014_4619:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or l
    jp $ffef


    rst $38
    rst $38
    cp [hl]
    ld a, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor a
    add $cf
    add [hl]
    adc a
    ld b, $0d
    ld b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $fd
    ld a, $0e
    rra
    adc a
    rlca
    rlca
    ld [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr c, jr_014_468a

    cp [hl]
    jr c, @+$01

    ccf
    rra
    ccf
    inc bc
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    inc e
    ld e, $de
    inc a
    db $fc
    ld hl, sp-$08
    ldh a, [$a0]
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, sp+$70
    ld [hl], b
    ld [hl], b
    ld a, a
    ld a, a
    ccf
    ld a, a
    rra
    ccf
    dec b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, sp-$10
    ld hl, sp-$10
    ld hl, sp-$10

jr_014_468a:
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
    ld [bc], a
    ld bc, $0303
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
    inc bc
    nop
    ld [hl], e
    add a
    rst $00
    rst $38
    ld [c], a
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, $f0
    ld a, [$fff7]
    or $e2
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    or l
    ld a, d
    cp [hl]
    ld [hl], c
    db $eb
    ld [hl], c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec d
    jr z, jr_014_47c7

    rst $38
    cp $ff
    rst $30
    rst $08
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, l
    ld a, $bf
    ld a, a
    cp a
    ld a, a
    rst $38
    ld [hl], e
    nop
    nop
    nop
    nop
    nop
    nop
    dec b
    ld [bc], a
    rst $00
    rlca
    ld l, a
    add a
    rst $18
    and a
    or $cf
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    sub b
    ldh [$ec], a
    ldh a, [$f3]
    db $fc
    rst $38
    db $fc
    nop
    nop
    nop
    nop
    rra
    inc bc
    ccf
    ccf
    ccf
    ccf
    dec a
    ld a, $3f
    jr c, @-$61

    jr c, jr_014_4791

jr_014_4791:
    nop
    nop
    nop
    push af
    ld hl, sp-$05
    db $fc
    ei
    db $fc
    push hl
    jr jr_014_479d

jr_014_479d:
    nop
    nop
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

jr_014_47c7:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc bc
    ld [bc], a
    inc bc
    ld b, $03
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    ld [bc], a
    inc bc
    ccf
    or $be
    ld [hl], a
    cp $37
    dec sp
    rst $30
    db $eb
    rst $30
    jp c, $f7e7

    xor $77
    cp $e7
    ld b, $e2
    rlca
    ld c, a
    rst $30
    rst $38
    rst $30
    rst $20
    rst $30
    rst $00
    rlca
    db $e3
    rlca
    and $07
    rst $38
    db $e3
    rst $30
    jp $c3bf


    ld [c], a
    add a
    db $76
    add a
    db $db
    and [hl]
    sub [hl]
    rst $28
    rst $08
    rst $30
    rst $30
    add e
    db $d3
    inc bc
    ld h, e
    inc bc
    jp $e303


    inc bc
    rst $20
    inc bc
    db $e3
    rlca
    adc $27
    xor a
    ld [hl], c
    ld a, $f0
    cpl
    ldh a, [$fe]
    ld [hl], c
    or a
    ld a, a
    cp a
    ld a, a
    cp a
    ld a, a
    ccf
    ld a, a
    rst $30
    adc $de
    rst $20
    rst $18
    and $ff
    add $fe
    rst $00
    rst $18
    add [hl]
    rst $28
    ld b, $af
    sub $fd
    ld a, $fe
    rrca
    add $0f
    rst $00
    rlca
    db $e3
    rlca
    rst $00
    inc bc
    rst $00
    inc bc

jr_014_489e:
    db $e3
    rlca
    rst $38
    jr c, jr_014_489e

    jr c, @-$01

    ccf
    rst $38
    ccf
    ld a, a
    cp a
    ld a, c
    cp [hl]

jr_014_48ac:
    rst $30
    jr c, jr_014_48ac

    jr c, jr_014_48b1

jr_014_48b1:
    nop
    inc [hl]
    nop
    rst $38
    ld hl, sp-$03
    ld hl, sp-$02
    ldh a, [$80]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    scf
    cp $d3
    ccf
    ccf
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
    ld h, a
    add [hl]
    rst $20
    cp $ff
    or $11
    and $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $e3
    rst $38
    ld [hl], e
    rst $38
    or a
    ld a, c
    ld c, c
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    xor $fd
    cp $fa
    db $fc
    db $fd
    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor e
    ld [hl], a
    cp a
    ld [hl], c
    cpl
    ld [hl], b
    ld l, b
    jr nc, jr_014_4999

jr_014_4999:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or $cf
    rst $30
    xor $f7
    rst $28
    ld a, a
    ld h, a
    ld bc, $0003
    nop
    nop
    nop
    nop
    nop
    rst $08
    rlca
    xor $0f
    rst $38
    cp $ff
    db $fc
    push af
    ld hl, sp-$20
    nop
    nop
    nop
    nop
    nop
    rst $30
    jr c, @+$01

    jr c, jr_014_4a3f

    dec a
    sbc a
    ccf
    ccf
    rra
    inc bc
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc $20
    rst $30
    ld hl, sp-$03
    ld hl, sp-$06
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

jr_014_4a3f:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld d, e
    rlca
    ld l, a
    ld a, a
    db $fd
    ld a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor b
    nop
    db $ec
    rst $38
    xor [hl]
    db $fd
    ld a, [hl+]
    db $fd
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, e
    inc bc
    di
    rst $38
    ei
    rst $38
    cp d
    rst $18
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    inc bc
    add a
    rst $38
    rst $20
    rst $38
    rst $20
    rst $38
    db $76
    rst $38
    nop
    nop
    nop
    nop
    ld [bc], a
    ld bc, $43b1
    add l
    ei
    db $d3
    rst $38
    db $e3
    rst $38
    di
    rst $38
    nop
    nop
    ld l, a
    db $10
    db $fc
    rst $38
    rst $38
    cp $fd

jr_014_4ad9:
    cp $fc
    add b
    ld a, h
    add b
    inc l
    ret nc

    nop
    nop
    ld b, b
    nop
    db $10
    ldh [$d8], a
    jr nz, jr_014_4ad9

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld a, a
    sbc h
    ld a, a
    push de
    ld a, a
    sub a
    ld a, a
    rst $38
    ld [hl], a
    db $ed
    db $76
    db $ec
    ld a, a
    cp h
    ld a, a
    cpl
    ld sp, hl
    ld [hl], a
    ld sp, hl
    cp a
    pop af
    cp c
    di
    add hl, hl
    rst $30
    scf
    rst $38
    dec sp
    rst $38
    ld a, e
    rst $38
    ld c, e
    sbc a
    ld a, [$fb0f]
    rrca
    ld [$4b1f], a
    cp a
    adc e
    ld a, a
    rra
    ei
    ld d, a
    ei
    or a
    ld a, [hl]
    ld [hl], d
    cp a
    cp a
    db $76
    ld a, [hl-]
    rst $30
    db $eb
    or $f2
    rst $20
    db $d3
    xor $e6
    rst $38
    ld [hl], e
    rst $38
    cp e
    ld a, a
    ld e, c
    cp a
    sbc e
    ld a, a
    ld a, c
    sbc a
    cp e
    ld e, a
    ld c, e
    cp a
    rst $18
    dec sp
    ld [hl], h
    adc b
    ld b, e
    cp h
    cp $fd
    rst $38
    db $fc
    ei
    db $fc
    sbc h
    ldh [$6c], a
    sub b
    ld a, h
    add b
    nop
    nop
    and b
    nop
    sub b
    ld h, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call c, Call_014_677f
    ld e, a
    inc de
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
    ld l, a
    rst $38
    db $ed
    rst $38
    cp [hl]
    db $ed
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
    or [hl]
    ei
    cp $f3
    ld [$14f3], a
    db $e3
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], a
    cp $36
    rst $38
    ld [hl], a
    cp a
    ei
    rla
    dec b
    inc bc
    ld bc, $0000
    nop
    nop
    nop
    ld e, a
    cp e
    sbc l
    ld a, e
    db $fd
    di
    ld sp, hl
    di
    rst $38
    pop hl
    ld h, b
    add c
    nop
    nop
    nop
    nop
    xor h
    ld d, b
    ld d, h
    xor b
    inc c
    ldh a, [$fc]
    rst $38
    db $fd
    cp $ff
    db $fc
    db $ec
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sub b
    ldh [$b0], a
    ld b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc bc
    ld a, [bc]
    rlca
    dec b
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $6f07
    rra
    cp l
    rst $38
    rst $38
    rst $38
    cpl
    rst $38
    nop
    nop
    add h
    ld a, e
    xor $ff
    ret nz

    rst $38
    ld [hl], a
    ret nz

    db $76
    adc b
    ld d, c
    cp $04
    cp $00
    nop
    add b
    nop
    ret nz

    add b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_014_4eff:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    rlca
    ld c, $07
    ld b, $07
    ld [$0307], sp
    rlca
    ld c, $07
    rlca
    rlca
    ei
    ccf
    ld d, a
    cp a
    dec de
    rst $38
    dec [hl]
    rst $38
    inc sp
    rst $38
    db $dd
    rst $30
    db $fd
    rst $30
    db $db
    rst $38
    xor c
    cp $55
    cp $ef
    rst $38
    ret nz

    rst $38
    cp e
    ret nz

    ld a, [hl]
    add b
    ld b, b
    cp $14
    cp $00
    nop
    add b
    nop
    ret nz

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc bc
    rlca
    nop
    inc bc
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call c, Call_014_4eff
    rst $38
    ld a, d
    rst $18
    ld a, a
    ld b, $01
    ld b, $06
    nop
    nop
    nop
    nop
    nop
    and d
    cp $95
    cp $ea
    cp $7e
    rst $38
    push de
    rst $38
    jp hl


    sub $92
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
    add b
    ret nz

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
    ld b, $01
    inc bc
    rlca
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
    nop
    nop
    ld [$f6f0], sp
    ld hl, sp-$45
    ldh a, [$fb]
    nop
    sub d
    ld l, l
    db $fc
    rst $38
    db $fc
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, b
    ret nz

    ld [c], a
    ret c

    db $dd
    sub d
    db $fc
    sub d
    cp e
    sub h
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
    ret nc

    ldh [$28], a
    ret z

    sub b
    ld l, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    inc bc
    rlca
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [hl]
    rst $38
    ld hl, sp-$01
    or $f9
    ld a, h
    pop af
    ld a, [$fe01]
    ld bc, $feff
    ld a, l
    cp $23
    call c, Call_014_7e89
    ret nz

    ld a, a
    pop de
    ld l, a
    db $dd
    ld h, e
    rst $08

jr_014_528b:
    ld h, c
    ld l, l
    db $d3
    rst $18
    ld [hl], c
    sub h
    ld a, b
    ldh a, [$3c]
    db $e4
    jr jr_014_528b

    ld [$40ac], sp
    ld [hl], b
    ret nc

    inc d
    ld hl, sp+$3c
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

jr_014_5363:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    inc bc
    inc b
    inc bc
    ld bc, $0000
    nop
    rst $38
    cp $ff
    cp $ff
    cp $fe
    ld hl, sp-$0e
    ld hl, sp+$05
    ld hl, sp+$50
    nop
    nop
    nop
    rst $08
    ld [hl], c
    ld [c], a
    ld e, h
    rst $20
    jr jr_014_5363

    nop
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, h
    cp b
    inc b
    add sp, -$50
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    rrca
    ld [$0007], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and b
    nop
    rst $38
    ret nz

    or $c0
    dec e
    ret nz

    ld a, $01
    rra
    rra
    ccf
    rra
    nop
    nop
    nop
    nop
    ld b, b
    nop
    ret nz

    rlca
    sbc a
    rrca
    rst $18
    ld a, $ff
    inc a
    ei
    inc a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ld [hl], h
    adc a
    rst $28
    ld e, $bd
    ld c, $af
    ld e, h
    nop
    nop
    nop
    nop

jr_014_54c4:
    nop
    nop
    nop
    nop
    call nc, $ab00
    inc e
    ld a, [hl]
    jr jr_014_54c4

    ret c

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $b600
    ld a, a
    ld a, [$ef37]
    ld [de], a
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
    db $f4
    add b
    ld l, d
    add a
    rrca
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    rlca
    rrca
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    rra
    rst $30
    rra
    rst $18
    ldh [$d7], a
    ldh [$ed], a
    nop

jr_014_55ba:
    add hl, bc
    ld d, $1f
    rra
    rra
    rra
    db $fd
    jr c, jr_014_55ba

    add hl, sp
    ei
    inc sp
    cp a
    inc sp
    db $d3
    scf
    swap a
    ld c, e
    or a
    swap a
    ld [$fbdd], a
    call $d9ef
    cp $c9
    ld sp, hl
    call nz, $c0f7
    ldh a, [$ce]
    db $fd
    adc $d7
    ret c

    db $fc
    db $d3
    sbc $d3
    rst $20
    db $db
    db $eb
    rla
    rst $20
    dec de
    and a
    dec de
    di
    dec bc
    xor h
    inc de
    db $76
    adc c
    ccf
    ret nz

    rst $30
    ret z

    ldh a, [$ce]
    db $fd
    sbc $ee
    call c, $dcfb
    ld [hl], l
    cp $7c
    rst $30
    ld e, a
    push af
    ld a, [hl-]
    push bc
    db $d3
    inc b
    ld [hl], a
    ld hl, sp-$0d
    cp $71
    cp $c0
    add b
    ret nz

    add b
    add b
    add b
    ret nz

    add b
    ret nz

    nop
    add b
    nop
    ret nz

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    rlca
    rlca
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    rra
    rra
    rra
    rra
    cp a
    rra
    rst $30
    ldh [$dd], a
    ldh [rPCM34], a
    add b
    nop
    nop
    nop
    nop
    ld l, a
    sub e
    call $fb33
    nop
    rst $38
    nop
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor $dc
    cp $c9
    ld a, a
    adc c
    ld a, l
    nop
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], a
    ret


    rst $38
    ret nz

    db $fd
    ret nz

    jp nz, RST_00

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $f4
    sbc e
    sbc $33
    adc d
    scf
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
    db $76
    db $fd
    inc sp
    push bc
    ld a, b
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
    ret nz

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ccf
    inc e
    dec sp
    inc e
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
    db $f4
    nop
    db $fd

Jump_014_57e7:
    ld [bc], a
    ld l, e
    sub h
    cp $01
    dec c
    ld e, $1f
    inc e
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    add c
    nop
    add e
    rlca
    sbc a
    ld c, $9f
    inc a
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], b
    nop
    call z, Call_014_75f0
    adc b
    ld e, e
    and l
    add a
    ld a, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, a
    db $10
    rst $28
    ldh a, [$f5]
    jp z, $ef96

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc d
    nop
    or e
    ld a, h
    db $fd
    ld [hl], d
    rst $20
    ld a, b
    nop
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
    adc [hl]
    db $ec
    rra
    jp hl


    ld d, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    ld a, l
    or $f8
    ld [hl], a
    cp h
    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_5858:
    ld b, b
    nop
    push de
    jr z, jr_014_5858

    rlca
    inc hl
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
    ret nc

    nop
    ld hl, sp-$80
    xor b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld c, $1f
    dec c
    ld e, $0f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec e
    ld e, $1d
    ld e, $a2
    ld e, l
    ld a, e
    add h
    sub $29
    ld bc, $0d1e
    ld e, $1c
    rra
    cp l
    ld a, d
    ld a, a
    ldh a, [$e6]
    ld a, b
    ld l, h
    ldh a, [$fc]
    ld h, b
    ld [hl], b
    add sp, -$04
    ld h, b
    call z, Call_014_7f70
    di
    ei
    ld [hl], a
    ld a, a
    di
    ld sp, hl
    ld [hl], a
    ld a, a
    ldh a, [$f9]
    ld [hl], h
    ld a, c
    db $f4
    db $fd
    ld [hl], e
    cp $8f
    cp $8f

jr_014_5934:
    ld l, $cf
    ld a, [hl]
    adc a
    xor b
    ld d, a
    ld a, e
    inc b
    dec c
    ld a, [c]
    call nc, $f9eb
    ld h, b
    pop af
    ld l, b
    ld sp, hl
    ld h, b
    ret z

    ld [hl], b
    cp b
    ld h, b
    jr nc, jr_014_5934

    cp h
    ld h, b
    adc l
    ld [hl], b
    push af
    ld a, [bc]
    ld e, a
    and b
    ld c, $f1
    db $ed
    ldh a, [$64]
    ld sp, hl
    rst $38
    pop af
    rst $38
    di
    db $e3
    rst $38
    ld e, h
    or b
    cp h
    ld d, b
    add sp, $17
    cp d
    ld b, a
    dec bc
    db $f4
    call c, $9ce0
    ldh [$a4], a
    ret c

    ld a, [hl]
    rst $30
    ld a, [hl]
    rst $30
    dec sp
    or $f2
    rrca
    jp c, $ff25

jr_014_597b:
    ld [hl], b
    ld a, e
    rst $30
    ld [hl], d
    rst $38
    cp b
    ld [hl], b
    ld a, b
    ldh a, [$78]
    ldh a, [$f8]
    ld [hl], b
    ret z

    jr nc, jr_014_597b

    ld [$a058], sp
    ld a, b
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

jr_014_59e4:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld c, $0d
    ld e, $10
    rrca
    ld bc, $0000
    nop
    nop
    nop
    dec c
    ld e, $1c
    rra
    push hl
    ld e, $d7
    jr z, jr_014_59e4

    ld b, h
    db $f4
    nop
    nop
    nop
    nop
    nop
    inc e
    ldh [$ca], a
    inc [hl]
    db $fd
    ld [bc], a
    sbc [hl]
    ld bc, $0003
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, e
    rst $30
    ld a, a
    di
    ld e, e
    and a
    db $ed
    db $10
    or b
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    or [hl]
    rst $08
    ld e, [hl]
    xor a
    xor $0f
    rlc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc e
    ld [hl], l
    cp $01
    rst $18
    nop
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
    rst $08
    rst $30
    cp a
    ld c, [hl]
    push hl
    ld e, $c1
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call c, $ba30
    ld [hl], a
    ld a, d
    rst $30
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
    ld a, e
    or $73
    adc [hl]
    db $dd
    jr nz, jr_014_5ae7

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, sp+$70
    ld h, b
    ld hl, sp+$50
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_5ae7:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, b
    rra
    nop
    rst $38
    add hl, hl
    rst $38
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
    ldh a, [rP1]
    ld [$58f0], sp
    ldh a, [$a8]
    ld [hl], b
    ret z

    ld [hl], b
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
    dec c
    inc bc
    jr nc, @+$21

    and l
    ld a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [rSB], a
    ldh [$a3], a
    pop hl
    ld [hl+], a
    rst $20
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
    ld b, h
    rst $38
    ld bc, $5cff
    rst $28
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
    inc h
    rra
    ld sp, $637f
    db $fc
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
    inc bc
    pop hl
    ld [$e5f1], sp
    jr c, jr_014_5ba1

jr_014_5ba1:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $8600
    rst $20
    ld b, [hl]
    rst $30
    add a
    ld a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, d
    dec b
    ld h, b
    rst $38
    nop
    rst $38
    ld b, c
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [rP1], a
    ld bc, $07f0
    di
    adc $f7
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, b
    xor h
    ld [bc], a
    db $fc
    or d
    db $fc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $a87e
    ld a, a
    ld b, d
    ccf
    ld bc, $0000
    nop
    nop
    nop
    sbc c
    ld [hl], b
    ld c, c
    ld [hl], c
    add hl, hl

jr_014_5c65:
    di
    adc [hl]
    di
    ld l, $f3
    sbc [hl]
    ld [hl], e
    ld b, l
    ld a, e
    jr nz, @+$7d

    ld b, [hl]
    ld sp, hl
    jr nz, jr_014_5c65

    ld h, b
    pop bc
    nop
    pop bc
    ret nz

    add c
    ld b, b
    add c
    ld b, b
    add c
    nop
    pop bc
    sub [hl]
    rst $20
    adc h
    rst $20
    ld b, h
    rst $28
    sub c
    rst $20
    add h
    db $e3
    and c
    ldh [$90], a
    pop hl
    add a
    db $e3
    push bc
    adc a
    inc c
    adc a
    add h
    rrca
    ld c, h
    adc a
    ld [bc], a
    rst $38
    ld b, h
    rst $38
    jr z, @+$01

    dec b
    rst $38
    ld b, b
    ld hl, sp-$28
    ldh a, [$c8]
    ldh a, [$c8]
    ldh a, [$a8]
    ldh a, [rLCDC]
    ld hl, sp-$7c
    ld a, b
    nop
    ld a, h
    ld h, b
    inc e
    ld [hl+], a
    inc e
    nop
    ld a, $20
    ld e, $3b
    ld e, $18
    ld e, $3b
    ld e, $38
    ld a, $c6
    ccf
    ld h, d
    rra
    ld [hl-], a
    rrca
    jr jr_014_5ccf

    db $10
    rrca
    ld a, [hl-]
    rra
    ld [hl], h
    ccf
    or d

jr_014_5ccf:
    ld a, a
    ld b, b
    add c
    ld b, b
    add c
    daa
    ld sp, hl
    ldh [rIE], a
    ld [hl], b
    adc a
    ld b, c
    add b
    ret nz

    add c
    ld b, c
    add b
    adc $ff
    call z, $9cff
    rst $38
    ld a, [bc]
    rst $38
    ld c, h
    di
    set 6, b
    jp nz, $def7

    rst $38
    ld a, [hl-]
    db $fc
    ld a, [c]
    inc a
    jp c, $f23c

    inc a
    ld a, [hl+]
    db $fc
    ld [bc], a
    db $fc
    add d
    db $fc
    ld a, [hl-]
    db $fc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_5d53:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec h
    nop
    ld c, b
    ld a, a
    ld [de], a
    ld a, a
    ld h, b
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, e
    ld a, c
    ld e, b
    ld [hl], c
    adc b
    ldh a, [rLCDC]
    ldh a, [$60]
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_014_5d53

    ld e, $e1
    jr nz, @+$01

    ld b, l
    ccf
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor [hl]
    rst $20
    sbc h
    rst $28
    jr nc, @-$0f

    ld h, $c0
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, h
    rst $28
    ld b, h
    adc a
    add d
    rrca
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
    and b
    ld e, $90
    rrca
    ld [$0307], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or e
    ld a, h
    inc bc
    rst $38
    sbc b
    di
    ld [hl], b
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add $ff
    sbc [hl]
    rst $30
    rla
    rst $20
    rst $00
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

    add c
    inc [hl]
    ei
    ld h, b
    rst $38
    ld e, b
    add a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call z, $8cff
    rst $38
    inc a
    ld [c], a
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [hl-]
    db $fc
    ld a, [c]
    inc a
    jr c, jr_014_5e1a

    nop
    nop
    nop
    nop

jr_014_5e1a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    ccf
    rra
    ccf
    ccf
    inc hl
    inc e
    nop
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

    ld hl, sp-$08
    ld hl, sp+$3c
    ld hl, sp+$30
    jr c, jr_014_5eb1

jr_014_5eb1:
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
    inc bc
    rla
    rrca
    rra
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
    ret nz

    ret nz

    ldh [$e1], a
    ldh [$d3], a
    pop hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc e
    ld [bc], a
    cp [hl]
    ld a, a
    rst $38
    rst $38
    db $db
    rst $20
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
    rlca
    rrca
    ccf
    rra
    dec de
    inc a
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
    ldh a, [$e0]
    ldh a, [$f8]
    ld hl, sp+$3c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_014_5f0a

jr_014_5f0a:
    ld a, b
    jr nc, jr_014_5f41

    ld a, b
    inc e
    inc a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, c
    rlca
    ld a, a
    rst $20
    ld [hl], d
    rst $20
    ld [hl], b
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    and b
    nop
    ld sp, hl
    cp $fe
    rst $38
    sbc $2f
    ld b, $0f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0a00
    rlca
    rrca
    rra
    rra
    ld a, $00

jr_014_5f41:
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_5f48:
    ldh a, [rP1]
    ld hl, sp-$10
    ldh a, [$f8]
    jr nc, jr_014_5f48

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$3f1f], sp
    rra
    rlca
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    inc e
    jr c, jr_014_5ff3

    jr c, @+$5e

    cp c
    ld sp, hl
    ld sp, hl
    rst $38
    ld sp, hl
    sbc a
    add hl, sp
    dec e
    add hl, sp
    dec e
    add hl, sp
    ld a, d
    ld a, h
    ld hl, sp-$10
    ret nc

    ldh [$e0], a
    ret nz

    add b
    ret nz

    ret nz

    add b
    add b
    ret nz

    ret nz

    ret nz

    ld h, e
    db $e3
    jp Jump_014_57e7


    db $e3
    rst $00
    db $e3
    ld h, c
    db $e3
    jp nz, Jump_014_60e1

    ldh [$d2], a
    pop hl
    jp $8387


jr_014_5ff3:
    rlca
    add e
    rlca
    jp $e787


    rst $38
    rst $38
    rst $38
    ld a, a
    rst $38
    ei
    rst $30
    ld [hl], b
    jr c, jr_014_607b

    jr nc, jr_014_607d

    jr nc, jr_014_603f

    ld [hl], b
    ld a, b
    jr nc, @+$32

    jr c, @+$3a

    jr c, @+$3a

    inc e
    inc e
    ld e, $1e
    ld c, $0f
    ld b, $0e
    rlca
    rlca
    rlca
    inc bc
    rlca
    rlca
    rlca
    ld b, $0f
    ld e, $1e
    ld b, $0f
    dec bc
    rlca
    inc bc
    inc bc
    inc bc
    ld bc, $0303
    rrca
    rlca
    rla
    rrca
    ld [hl], b
    ldh [rSVBK], a
    ldh [$f4], a
    db $e3
    rst $30
    rst $20
    db $f4
    db $e3
    ldh a, [$e0]
    ldh a, [$e0]
    ld h, b

jr_014_603f:
    ldh a, [rTMA]
    rrca
    ld b, $0f
    ld [hl], $cf
    cp $ff
    rst $38
    rst $38
    ld e, $07
    rrca
    rlca
    ld b, $0f
    ld a, b
    inc a
    jr c, jr_014_60cc

    jr nc, jr_014_60ce

    ld a, d
    inc a
    ld a, $1f
    rla
    rrca
    rla
    rrca
    rra
    ccf
    ld hl, sp+$70
    or b
    ld a, b
    or b
    ld a, b
    cp b
    ld [hl], b
    ld [hl], b
    ld hl, sp-$10
    ld hl, sp-$10
    ld hl, sp+$70
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

jr_014_607b:
    nop
    nop

jr_014_607d:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_60cc:
    nop
    nop

jr_014_60ce:
    nop
    nop
    nop
    nop
    ld de, $1f0e
    rra
    rrca
    rra
    dec b
    nop
    nop
    nop

jr_014_60dc:
    nop
    nop
    nop
    nop
    inc e

Jump_014_60e1:
    add hl, sp
    jr jr_014_60dc

    db $f4
    ld hl, sp-$20
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nc

    ldh [$e2], a
    db $fd
    cp a
    ld a, a
    rra
    ccf
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, a
    db $e3
    rst $28
    rst $20
    set 4, [hl]
    ld b, [hl]
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $e3
    rst $00
    inc bc
    add a
    inc bc
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
    dec c
    ld e, $17
    rrca
    rlca
    rlca
    ld [bc], a
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    ld c, $fe
    db $fc
    db $fc
    ld hl, sp+$10
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    ld e, $7c
    ld a, h
    ldh a, [$78]
    ld d, b
    jr nz, jr_014_6149

jr_014_6149:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [$60]
    ld h, h
    di
    ld [hl], e
    rst $20
    push af
    ld h, e
    ld hl, $0000
    nop
    nop
    nop
    nop
    nop
    rrca
    rlca
    and [hl]
    ld e, a
    rst $38
    cp $fe
    db $fc
    ld d, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, l
    ld a, [hl]
    ld a, h
    ld hl, sp-$50
    ld [hl], b
    jr nz, jr_014_6178

jr_014_6178:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or b
    ld a, b
    or b
    ld a, b
    jr c, jr_014_61f6

    jr nc, jr_014_6188

jr_014_6188:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_61f6:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc e
    rst $38
    ld a, a
    ld a, a
    rst $38
    ld b, e
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    ldh a, [$80]
    ldh [$81], a
    rst $10
    add e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_014_622a

jr_014_622a:
    inc a
    ld a, b
    ld a, [$fdf8]
    ld hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    ccf
    rra
    ld a, a
    ld a, a
    ld [hl], a
    ei
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
    ld b, a
    adc a
    cpl
    sbc a
    ld a, l
    sbc [hl]
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
    add sp, -$10
    db $f4
    ld hl, sp-$46
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
    jr nz, jr_014_62e3

    ld [hl], b
    inc a
    ld a, b
    ld a, [hl-]
    inc a
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    ld bc, $678f
    rst $20
    rst $28
    ld [hl], c
    and $e0
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    ld c, $f0
    rst $38
    rst $38
    rst $38
    rst $38
    rst $10
    rrca
    rlca
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
    ld bc, $0783
    rrca
    rrca
    ld c, $1f
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_014_62a8

jr_014_62a8:
    ld hl, sp-$04
    db $fc
    db $fc
    cp $fc
    sbc h
    inc e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_62e3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0301
    ld bc, $7d03
    ld a, a
    ld a, a
    rra
    ld a, a
    inc bc
    ld bc, $0101
    ld bc, $ef01
    add a
    sbc $8f
    rst $38
    sbc h
    ld a, [$da9c]
    cp b
    sbc $b8
    cp l
    ret c

    ld a, [$dc9c]
    cp c
    sbc d
    add hl, sp
    dec a
    add hl, de
    ld a, $19
    dec sp
    jr jr_014_6387

    jr jr_014_6387

    jr jr_014_636c

    jr c, @-$2b

    db $e3
    di
    jp $c3a3


    db $db
    db $e3
    rst $38
    rst $38
    rst $38
    ld a, a
    ld a, a
    ccf
    ld a, e
    rst $38
    ld a, h
    cp b
    ld [hl], h
    cp b
    ld [hl], h
    cp b
    ld d, d
    cp b
    ld [hl], h
    cp b
    inc a
    cp b

jr_014_636c:
    ld e, d
    cp h
    ld e, a
    sbc h
    rra
    inc e
    ld e, $0e
    rlca
    ld c, $0e
    rlca
    ld c, $07
    ld b, $07
    ld b, $07
    ld b, $0f
    dec a
    ld e, $1e
    rrca
    adc a
    rlca
    rlca

jr_014_6387:
    inc bc
    add e
    ld bc, $0383
    add a
    rlca
    rra
    rrca
    ld [hl], b
    ldh [$f0], a
    ldh [$e7], a
    db $e3
    rst $30
    rst $20
    rst $30
    db $e3
    ldh a, [$e0]
    ldh a, [$e0]
    ldh a, [$e0]
    rlca
    rlca
    rlca
    rlca
    add a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ccf
    rlca
    inc bc
    rlca
    rlca
    rlca
    ld a, $1c
    sbc b
    inc a
    jr jr_014_63f2

    cp l
    ld e, $1f
    rra
    adc a
    rrca
    add a
    inc bc
    add a
    rrca
    inc e
    inc e
    ld e, $1c
    inc e
    inc e
    ld e, $1c
    sbc h
    db $fc
    cp $fc
    db $fc
    db $fc
    sbc $fc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_63f2:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $7f7f
    ld a, a
    ld a, a
    ld bc, $003e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor l
    sbc $df
    adc a
    ld l, a
    add a
    ld [bc], a
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    cp [hl]
    add hl, de
    ld sp, hl
    ei
    rst $38
    ld sp, hl
    ret nc

    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $e3
    di
    db $e3
    jp $8343


    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, a
    sbc [hl]
    ld b, a
    adc a
    inc hl
    add a
    ld [bc], a
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    adc a
    ld e, $fc
    cp $fc
    ld hl, sp-$40
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    ld e, $fe
    ld a, h
    ld [hl], h
    ld hl, sp+$50
    ld h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], b
    ldh [$73], a
    ldh [$73], a
    rst $20
    ld [hl], e
    rst $20
    ld [hl+], a
    ld b, c
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    rlca
    rst $28
    rlca
    rst $38
    rst $38
    rst $38
    cp $06
    ld hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    sbc a
    rra
    ld a, h
    ld a, $7c
    jr c, jr_014_652f

    jr nc, jr_014_64d9

jr_014_64d9:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc e
    sbc h
    ld e, $1c
    inc e
    inc e
    inc e
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_652f:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$1f00], sp
    ccf
    ld a, a
    ccf
    dec e
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
    ld [hl], e
    add c
    rst $30
    rlca
    rst $28
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $a300
    rst $10
    rst $38
    adc a
    db $ec
    sbc a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and c
    nop
    di
    rst $08
    rst $38
    rst $08
    db $ec
    rst $18
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
    db $e4
    ld sp, hl
    db $fd
    ld a, [c]
    rst $38

jr_014_65bf:
    ld a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, e
    add e
    ei
    rst $00
    ei
    rst $20
    ld a, e
    rst $30
    nop
    nop
    nop
    nop
    ld [bc], a
    nop
    rra
    ccf
    cp a
    ld a, a
    cp a
    ld a, a
    ret nc

    jr nz, jr_014_65bf

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $fc
    ldh [$fc], a
    ldh a, [$ea]
    ldh a, [$ee]
    ld [hl], c
    jp hl


    ld [hl], e
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rra
    ccf
    ld a, a
    rst $38
    rst $38
    rst $30
    ei
    rst $10
    db $e3
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    add b
    ldh a, [$80]
    ret nc

    add b
    ldh [$80], a
    or b
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
    ld bc, $0103
    inc bc
    dec h
    dec de
    ccf
    ccf
    cpl
    rra
    ld bc, $0303
    ld bc, $0103
    ld e, a
    cp l
    rst $38
    add hl, sp
    dec sp
    pop af
    dec a
    pop hl
    ld a, l
    pop hl
    ld a, a
    pop hl
    rst $30
    ld l, c
    ld h, a
    ld sp, hl
    jp c, $ddbc

    cp b
    rst $10
    cp b
    ret c

    cp a
    rst $38
    sbc a
    rst $28
    sbc a
    rst $30
    adc a
    cp $9f
    ld a, [$ffdc]
    ret c

    rst $38
    ret c

    ei
    call c, $dcfb
    ei
    call c, $dcef
    db $fc
    rst $08
    sbc a
    jr c, jr_014_66f2

    inc e
    adc a
    inc e
    sbc a
    inc c
    adc l
    ld c, $8f
    inc c
    adc l
    ld c, $df
    inc c
    di
    ld a, a
    ei
    ccf
    cp a
    rra
    rst $08
    rra
    rst $08
    rrca
    sbc a
    rrca
    rst $18
    rra
    ld a, a
    ccf
    ldh [rP1], a

jr_014_66f2:
    ldh [rP1], a
    rst $18
    ccf
    rst $38
    ccf
    rst $18
    ccf
    db $e3
    nop
    ldh [rP1], a
    ldh [rP1], a
    ld l, a
    ld [hl], e
    rst $28
    ld [hl], e
    ld l, a
    di
    rst $38
    di
    db $ed
    di
    db $fc
    ld [hl], c
    db $76
    ld [hl], b
    ld a, [hl]
    ld [hl], b
    sub e
    jp $83e3


    di
    add e
    cp e
    jp $ffff


    rst $38
    rst $38
    rst $38
    ld a, a
    rst $38
    rst $38
    ldh [$80], a
    ldh a, [$80]
    ret nc

    add b
    ldh [$80], a
    or b
    add b
    ldh [$80], a
    ldh a, [$80]
    ret nc

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

Call_014_677f:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc bc
    rra
    ccf
    ld e, $3f
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
    or c
    ld a, a
    rst $18
    ccf
    cp a
    rra
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
    jp c, $f7bc

    cp b
    ld c, b
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
    cp $cf
    rst $38
    rst $00
    rst $38
    jp $0140


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec e
    db $fc
    cp $f9
    push af
    ld sp, hl
    ret nc

    pop hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    di
    ld a, a
    rst $38
    di
    rst $28
    db $e3
    sub a
    jp Jump_000_0302


    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [rP1]
    db $e4
    nop
    rst $18
    ccf
    rst $38
    ccf
    sbc a
    ccf
    ld [bc], a
    nop
    nop
    nop
    nop
    nop
    ld a, e
    ld [hl], c
    ld l, e
    ld [hl], a
    rst $28
    rst $30
    ei
    rst $20
    rst $10
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    rst $30
    ei
    db $d3
    db $e3
    db $e3
    add e
    db $d3
    inc bc
    ld bc, $0003
    nop
    nop
    nop
    nop
    nop
    ldh [$80], a
    ldh a, [$80]
    ret nc

    add b
    ret nc

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc bc
    rlca
    rlca
    ld [bc], a
    dec b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc l
    rst $10
    adc h
    rst $38
    sbc h
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc de
    nop
    ld [hl], a
    rst $38
    rst $30
    rst $38
    rst $10
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor d
    dec b
    adc $ff
    and $ff
    ld h, a
    rst $38
    nop
    nop
    nop
    nop
    rlca
    nop
    ccf
    rrca
    rst $18
    ld a, a
    ld l, h
    rst $38
    rst $08
    ldh a, [$75]
    ld [$0000], a
    nop
    nop
    add sp, $00
    jp hl


    rst $30
    push af

jr_014_6939:
    db $eb
    ei
    rst $20
    rst $08
    ld [hl], a
    db $76
    ld l, a
    nop
    nop
    nop
    nop
    ld c, a
    jr nc, jr_014_6939

    db $fd
    di
    db $fc
    rst $38
    ld hl, sp+$55
    cp d
    ld e, a
    jr c, jr_014_6951

jr_014_6951:
    nop
    nop
    nop
    add b
    nop
    ret nz

    nop
    ld b, b
    add b
    ret nz

    nop
    ld b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0700
    nop
    inc bc
    rlca
    dec b
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    sub l
    rst $38
    cp l
    rst $30
    or l
    rst $20
    db $fd

jr_014_6a17:
    rst $20
    call $c4f7
    rst $38
    db $f4
    rst $38
    or l
    rst $38
    rst $30
    sbc h
    ld d, l
    cp [hl]
    sub [hl]
    db $fd
    or h
    rst $38
    db $f4
    rst $38
    db $f4
    rst $38
    or $ff
    sub $ff
    or a
    ld a, a
    or e
    ld a, a
    ld [hl], c
    cp a
    ld sp, $14ff
    ei
    ld a, [hl-]
    push af
    or l
    ei
    cp l
    di
    ld c, e
    db $f4
    push af
    ld [$ffcf], a
    rst $28
    rst $38
    rst $08
    rst $38
    ld sp, hl
    and $f7
    add sp, -$35
    db $f4
    rst $38
    ld l, [hl]
    ld a, l
    ld l, [hl]
    db $fc
    rst $28
    or $ef
    rst $30
    rst $28
    ld l, a
    rst $30
    ld a, c
    ld h, a
    ld l, e
    ld [hl], a
    push de
    ld a, [hl-]
    rst $18
    jr c, jr_014_6a17

    ld a, l
    scf
    ld hl, sp-$03
    ld a, [$f9f6]
    rst $38
    ld hl, sp-$0e
    db $fd
    ld b, b
    add b
    ret nz

    nop
    ret nz

    nop
    ld b, b
    add b
    ret nz

    nop
    ret nz

    nop
    ld b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_6b20:
    ld b, $01
    inc bc
    rlca
    dec b
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
    or l
    rst $38
    db $dd
    cp a
    cp [hl]
    dec e
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    di
    sbc a
    ld [hl], e
    sbc a
    ld l, l
    inc de
    db $10
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, e
    rst $30
    xor $f7
    rst $10
    xor $af
    call nz, RST_00
    nop
    nop
    nop
    nop
    nop
    nop
    push af
    ld l, d
    ei
    ld h, h
    cp $6f
    ld a, a
    ld l, a
    ld e, a
    ld l, a
    ld b, $01
    nop
    nop
    nop
    nop
    ld [hl], a
    ld l, a
    ld [hl], a
    ld l, a
    rst $38
    xor $cf
    db $fc
    ld a, [c]
    call z, Call_000_00c0
    nop
    nop
    nop
    nop
    sub a
    ld hl, sp-$23
    ld a, [hl-]
    or [hl]
    add hl, sp
    ld e, a
    jr c, jr_014_6b20

    jr c, jr_014_6bb5

    stop
    nop
    nop
    nop
    ret nz

    nop
    ld b, b
    add b
    ret nz

    nop
    ret nz

    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_6bb5:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld h, a
    rra
    ld a, a
    ccf
    ld e, e
    ld a, $00
    nop
    nop
    nop
    ld a, [bc]
    dec b
    ld e, $0f
    db $fd
    ccf
    ld a, [c]
    rst $38
    push hl
    rst $38
    ei
    rst $38
    nop
    nop
    nop
    nop
    ld a, d
    rst $38
    set 7, a
    call nz, $d0ff
    rst $38
    add d
    ld a, a
    xor b
    ld a, a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    ld a, [hl-]
    ld [bc], a
    ccf
    ccf
    cpl
    ld l, a
    ccf
    ld l, e
    ccf
    rra
    ccf
    dec de
    ccf
    dec de
    ccf
    db $ec
    rst $38
    or $ff
    db $ed
    rst $38
    ld a, a
    rst $38
    db $ed
    rst $38
    or a
    rst $38
    cp d
    rst $38
    xor d
    rst $38
    pop bc
    ld a, a
    inc b
    rst $38
    ret nc

    rst $38
    jp nz, $88ff

    rst $38
    jp nc, $c0ff

    rst $38
    ret z

    rst $38
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
    add b
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
    dec sp
    ld c, a
    dec sp
    ld l, h
    inc de
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec d
    rst $38
    rla
    rst $38
    add hl, de
    rst $38
    xor a
    ld e, [hl]
    dec l
    ld e, $0d
    nop
    nop
    nop
    nop
    nop
    ld b, d
    rst $38
    ret z

    ld a, a
    add d
    ld a, a
    sub b
    ld a, a
    add b
    ld a, a
    ccf
    ld b, b
    nop
    nop
    nop
    nop
    nop
    add b
    add b
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
    nop
    nop
    nop
    rrca
    rlca
    rrca
    rlca
    rrca
    rlca
    rrca
    rlca
    rrca
    rlca
    rrca
    rlca
    nop
    nop
    sub b
    nop
    db $fd
    ld a, [c]
    ei

jr_014_6fc7:
    or $eb
    ld a, [c]
    push af
    ld a, [c]
    ld hl, sp-$0d
    db $ec
    di
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop
    ld e, b
    jr nz, jr_014_6fc7

    scf
    ld c, $f1
    sub b
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
    ld b, b
    add b
    ret nz

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec bc
    rlca
    rrca
    rlca
    rrca
    rlca
    rrca
    rlca
    rrca
    rlca
    dec bc
    rlca
    rrca
    rlca
    rrca
    rlca
    cp $f1
    add sp, -$09
    push af
    cp $e1
    cp $f9
    ld a, [c]
    db $eb
    ld a, [c]
    or $f3
    rst $38
    ld a, [c]
    cp e
    call nc, $ddb2
    jr c, jr_014_7155

    ld [$8a7f], sp
    ld a, l
    adc d
    db $fd
    xor d
    db $dd
    xor d
    db $dd
    ld b, b
    add b
    ret nz

    nop
    ret nz

    nop
    ret nz

    nop
    ld b, b
    add b
    ret nz

    add b
    ret nz

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_7155:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec bc
    rlca
    rrca
    rlca
    ld a, [bc]
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    db $e4
    di
    ld hl, sp-$0d
    db $eb
    ldh a, [$e9]
    ld a, [c]
    or [hl]
    ldh a, [$f9]
    nop
    nop
    nop
    nop
    nop
    or c
    call z, $c49b
    ld l, $c0
    db $10
    ld b, b
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rra
    ccf
    ccf
    ld a, $3f
    ld a, $3f
    ld a, $3f
    ld a, $3f
    nop
    nop
    nop
    nop
    xor [hl]
    ld bc, $07df
    cp a
    inc bc
    db $dd
    inc bc
    and a
    ld bc, $01da
    nop
    nop
    nop
    nop
    ld l, b
    add b
    or a
    ret nz

    xor $80
    or l
    ret nz

    add a
    rst $08
    xor a
    rst $08
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop
    ld a, l
    call c, $dd9b
    cp a
    reti


    cp l
    db $d3
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $20
    nop
    rst $38
    jp $c3ad


    rst $30
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
    rst $18
    dec a
    ld hl, sp+$1d
    adc e
    inc e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call nc, $f8e0
    ldh [rLY], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld a, $3f
    ld a, $3f
    ld a, $3f
    ld a, $3f
    ld a, $3f
    ld a, $3f
    ld a, $3f
    xor $11
    ei
    inc a
    ei
    inc a
    cp $39
    db $fd
    ld bc, $01f7
    xor a
    inc bc
    rst $38
    inc bc
    and a
    rst $08
    sub a
    rst $08
    cp a
    ret nz

    push af
    add b
    sbc a
    ret nz

    rst $20
    adc a
    xor a
    rst $08
    rst $20
    adc a
    cp a
    db $d3
    cp e
    rst $00
    rst $38
    add a
    sub a
    rst $08
    cp a
    rst $08
    sbc a
    rst $08
    cp a
    rst $00
    db $eb
    add a
    and a
    sbc c
    ld a, a
    cp l
    cp l
    ld a, l
    cp [hl]
    ld a, l
    cp a
    ld a, l
    ld a, e
    ld a, l
    ei
    ld a, l
    cp l
    ld a, e
    ld a, c
    inc c
    sbc d
    ld l, h
    rst $38
    ld l, b
    ld hl, sp+$6f
    ld a, l
    dec bc
    rr a
    cp c
    rra
    ei
    rrca
    ldh a, [$60]
    ret nz

    ld h, b
    or h
    ld h, b
    ld e, b
    and b
    call nc, $c0a0
    and b
    ldh [$a0], a
    ret nc

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
    ld a, $3f
    ld a, $3f
    ld a, $3f
    ld a, $3f
    ld a, [de]
    ccf
    ld l, $00
    nop
    nop
    nop
    nop
    xor a
    ld bc, $01d6
    adc e
    nop
    ld [$ad00], a
    nop
    add b
    nop
    nop
    nop
    nop
    nop
    rst $28
    adc a
    rst $28
    adc a
    ld a, [hl-]
    push bc
    rra
    ret nz

    push af
    nop
    sub h
    nop
    nop
    nop
    nop
    nop
    cp h
    jp $81ea


    cp l
    ret nz

    and $80
    ld b, b
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    rst $30
    dec sp
    cp a
    inc bc
    cp $03
    jr nz, jr_014_7578

jr_014_7578:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, hl
    rrca
    ei
    inc b
    cp l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sub b
    ld h, b
    sbc h
    ld h, b
    ld l, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_014_75f0:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    nop
    nop
    nop
    nop
    add b
    nop
    sub [hl]
    add sp, -$12
    sub c
    db $db
    and h
    rst $30
    add b
    db $d3
    and b
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    ld e, $9c
    rra
    db $dd
    ld e, $6c
    sbc a
    rst $38
    ld e, $00
    nop
    nop
    nop
    sub b
    nop
    or l
    ld c, d

jr_014_7668:
    rst $18
    jr nz, jr_014_7668

    ld [bc], a
    add e
    ld bc, $8103
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    ld l, l
    di
    ld e, a
    rst $20
    sbc $ef
    sub $ef
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $00
    add b
    db $76
    adc a
    cp a
    ld e, [hl]
    rst $38
    inc a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and a
    nop
    xor e
    ld d, a
    rst $38
    inc bc
    db $fd
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    pop bc
    nop
    db $dd
    and e
    rst $28
    sub e
    cpl
    pop bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, b
    nop
    pop af
    pop bc
    rst $30
    ret


    rst $38
    pop bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc h
    nop
    rst $38
    ldh [$f5], a
    ld [$e0f9], a
    nop
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
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rst $30
    add b
    pop af
    add e
    rst $10
    and e
    rst $38
    add a
    ld a, [c]
    adc l
    db $dd
    and d
    db $eb
    sub h
    cp $81
    call $3c3e
    rst $08
    cp l
    adc $6c
    sbc a
    db $dd
    ld a, $fd
    ld e, $dd
    ld e, $dd
    ld e, $82
    ld bc, $0193
    ld l, $d1
    push af
    ld a, [bc]
    cp [hl]
    ld b, c
    db $d3
    ld bc, $0183
    add e
    ld bc, $ecdf
    jp nc, $d7ed

    add sp, -$26
    db $e4
    call c, $d6e0
    add sp, -$21
    ldh [$ef], a
    ret nc

    ei
    inc a
    db $fc
    ld a, d
    ld a, [hl]
    ld a, b
    or $78
    or $78
    db $f4
    ld a, b
    ld a, [$d674]
    ld a, b
    ld b, a
    add hl, sp
    ld a, e
    dec a
    ld a, d
    dec a
    ld e, b
    ccf
    ld a, e
    dec a
    dec sp
    ld a, l
    ld a, l
    ld a, e
    push af
    ld a, e
    cp $81
    pop bc
    cp [hl]
    db $dd
    cp [hl]
    cp $bd
    xor $91
    push af
    adc e
    ccf
    jp $85fb


    cp $c1
    rst $38
    ret nz

    rst $38
    ret nz

    ldh a, [$cf]
    rst $38
    rst $08
    rst $30
    rst $08
    rst $38
    rst $08
    rst $28
    rst $18
    ldh a, [$e0]
    ld a, b
    ldh [$7f], a
    ldh [rIE], a
    ld h, b
    cp a
    ld h, b
    cp b
    ld h, b
    ret nc

    ld h, b
    ldh a, [$60]
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

jr_014_7848:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $18
    and b
    inc sp
    ret nz

    pop af
    add b
    jr nc, jr_014_7848

    ld h, b
    add b
    jr nz, jr_014_788c

jr_014_788c:
    nop
    nop
    nop
    nop
    db $fd
    ld e, $ad
    ld e, [hl]
    push af
    ld c, $e9
    ld d, $2b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add e
    ld bc, $0183
    ld b, [hl]
    cp c
    ld a, [$5705]
    xor b
    ld d, b
    nop
    nop
    nop
    nop
    nop
    db $dd
    ld [c], a
    rst $38
    ret nz

    db $db
    ldh [$e9], a
    ret nc

    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop
    add a
    ld a, b
    db $db
    inc h
    cp a
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
    ei
    rst $30
    dec de
    rst $20
    ei
    rlca
    or b
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, $c1
    rst $30
    add b
    ld l, a
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
    rst $28
    sbc $6b
    call nc, $40bf
    inc e
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
    ldh a, [$5f]
    ldh [$db], a
    inc h
    add hl, bc
    nop
    nop
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
    inc a
    nop
    ld b, b
    ld a, a
    and h
    ld a, a
    sbc h
    ld [hl], e
    ret


    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $8100
    ld bc, $c1a3
    ld de, $09e1
    pop af
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [$1f], a
    nop
    rst $38
    ld b, b
    rst $38
    db $10
    ldh [rP1], a
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    ld h, b
    add b
    ld de, $1aee
    rst $28
    ld hl, sp+$0f
    inc c
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [de]
    inc b
    ld sp, $501e
    ld a, $62

jr_014_79df:
    ld a, h
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
    ld [$301f], sp
    ccf
    ld h, c
    ld a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_79f7:
    nop
    pop hl
    nop
    add hl, bc
    di
    dec b
    ei
    ld h, a
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, b
    add b
    add d
    db $fc
    add b
    rst $38
    jr jr_014_79f7

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, $10
    jr c, jr_014_7a5b

    cp b
    ccf
    jr c, jr_014_79df

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
    add a
    inc bc
    inc hl
    jp $e317


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    push af
    ld a, [bc]
    add b
    rst $38
    add d
    db $fd
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
    ld b, b
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

jr_014_7a5b:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_7a9e:
    nop
    nop

jr_014_7aa0:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld [hl], b
    adc b
    ld [hl], b
    ret nz

    ld [hl], b
    sub c

jr_014_7ab7:
    ld [hl], b
    and b
    ld a, a
    add b
    ld a, a
    jp nc, $807f

    ld a, a
    inc hl
    ld a, c
    ld bc, $0b79
    ld a, c
    ld d, e
    ld sp, hl
    dec bc
    pop af
    sub d
    pop hl
    inc bc
    pop bc
    inc bc
    pop hl
    nop
    ldh [$60], a
    ret nz

    jr @-$17

    db $10
    rst $38
    ld [bc], a
    rst $38
    ld a, b
    ret nz

    jr nz, jr_014_7a9e

    jr nz, jr_014_7aa0

    jr @+$11

    add hl, de
    rrca
    ld a, [hl-]
    rst $08
    jr c, jr_014_7ab7

    add hl, sp
    rst $08
    jr @+$11

    add hl, de
    rrca
    jr jr_014_7aff

    call z, $88f8
    ldh a, [rHDMA1]
    ldh [rNR41], a
    pop bc
    ld b, c
    add c
    ld hl, $00c1
    pop hl
    add hl, bc

jr_014_7aff:
    ldh a, [$6c]
    ld hl, sp-$38
    ldh a, [$c8]
    ldh a, [$80]
    ldh a, [$90]
    ldh [$90], a
    ldh [$80], a
    ldh a, [rP1]
    ldh a, [rSB]
    ccf
    inc bc
    ccf
    add hl, de
    ccf
    add hl, de
    ccf
    inc sp
    ccf
    inc sp
    ccf
    inc sp
    ld a, a
    pop hl
    ld a, a

jr_014_7b20:
    add [hl]
    pop hl
    inc b
    db $e3
    add e
    rst $20
    ld b, $ef
    add b
    rst $38
    ld [bc], a
    rst $38
    sub c
    cp $10
    rst $28
    ld [hl], b
    cp [hl]
    ld a, [hl-]
    db $fc

jr_014_7b34:
    jr c, jr_014_7b34

    ld [hl-], a
    db $fc
    ld a, b
    cp [hl]
    cp d
    inc a
    jr nc, jr_014_7b7c

    cp d
    inc a
    add e
    ld a, e
    db $e3
    rra
    ld h, e
    rra
    inc de
    cpl
    ld sp, $393f
    ccf
    add hl, sp
    ccf
    dec sp
    ld a, a
    and b
    ret nz

    nop
    ldh [$9d], a
    ld [c], a
    add b
    rst $38
    nop
    rst $38
    add b
    ldh [$a0], a
    ret nz

    jr nz, jr_014_7b20

    nop
    nop
    nop
    nop
    add b
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

jr_014_7b7c:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp nz, $9071

    ld [hl], b
    ret z

jr_014_7bd5:
    ld [hl], b
    add b

jr_014_7bd7:
    ld [hl], b
    jr nc, jr_014_7bda

jr_014_7bda:
    nop
    nop
    nop
    nop
    nop
    nop
    adc d
    pop af
    and [hl]
    ld a, c
    ld b, b
    dec a
    dec b
    jr jr_014_7be9

jr_014_7be9:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and b
    ret nz

    ld a, [hl+]
    ret nz

    ld b, b
    rst $38
    add hl, bc
    rst $38

jr_014_7bf8:
    ld b, b
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_014_7c11

    sbc b
    rrca
    jr c, jr_014_7bd5

    jr nc, jr_014_7bd7

    ld c, l
    add d
    nop
    nop
    nop
    nop
    nop
    nop
    add h

jr_014_7c11:
    ld a, b
    ld bc, $303e
    rrca
    add hl, bc
    ld b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $40f8
    ccf
    inc h
    rra
    inc c
    inc bc
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    call Call_000_09fb
    di
    ld b, b
    di
    jr nz, jr_014_7bf8

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    rst $20
    ld [bc], a
    pop hl
    add d
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

jr_014_7c50:
    jr nc, jr_014_7c50

    jr c, @+$01

    nop
    rst $38
    ld b, [hl]
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    pop af
    ld a, a
    inc bc
    rst $38
    inc bc
    ld hl, sp+$10
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, @-$3e

    nop
    rst $38
    nop
    rst $38
    push hl
    ld a, [de]
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld [$0a09], sp
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $1312
    inc d
    dec d
    ld d, $17
    jr jr_014_7cf3

    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $1f
    jr nz, jr_014_7d03

    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $27
    jr z, jr_014_7d13

    ld a, [hl+]
    dec hl
    inc l
    dec l
    ld l, $2f
    jr nc, jr_014_7d23

    ld [hl-], a

jr_014_7cf3:
    inc sp
    inc [hl]
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
    nop
    nop
    nop
    nop

jr_014_7d03:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_7d13:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_7d23:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, @+$4f

    ld c, c
    ld c, [hl]
    ld c, c
    jr nz, jr_014_7d80

    ld c, a
    ld d, d
    ld d, d
    ld c, c
    ld d, e
    jr nz, jr_014_7d5a

    jr nz, @+$22

    inc b
    jr nz, jr_014_7d5f

    jr nz, jr_014_7d61

    jr nz, jr_014_7d95

    ld d, l
    ld d, h
    ld c, b
    jr nz, jr_014_7d8a

    ld b, c
    ld c, e
    ld b, l
    ld d, d
    jr nz, jr_014_7d6e

    jr nz, @+$22

    jr nz, jr_014_7d52

jr_014_7d52:
    jr nz, jr_014_7d74

    ld c, h
    ld c, c
    ld c, [hl]
    ld b, h
    ld d, e
    ld b, c

jr_014_7d5a:
    ld e, c
    jr nz, jr_014_7da8

    ld b, l
    ld d, d

jr_014_7d5f:
    ld c, [hl]
    ld c, a

jr_014_7d61:
    ld c, b
    ld b, c
    ld c, [hl]
    jr nz, jr_014_7d86

    nop
    jr nz, @+$22

    jr nz, jr_014_7db6

    ld b, c
    ld d, d
    ld b, l

jr_014_7d6e:
    ld c, [hl]
    jr nz, @+$4d

    ld b, l
    ld d, d
    ld c, [hl]

jr_014_7d74:
    ld c, a
    ld c, b
    ld b, c
    ld c, [hl]
    jr nz, jr_014_7d9a

    jr nz, jr_014_7d7c

jr_014_7d7c:
    jr nz, jr_014_7d9e

    jr nz, jr_014_7da0

jr_014_7d80:
    jr nz, jr_014_7dd4

    ld c, a
    ld c, [hl]
    jr nz, jr_014_7dc7

jr_014_7d86:
    ld c, [hl]
    ld b, h
    jr nz, @+$4d

jr_014_7d8a:
    ld b, c
    ld b, [hl]
    jr nz, jr_014_7dae

    jr nz, jr_014_7db0

    inc b
    jr nz, @+$22

    jr nz, jr_014_7db5

jr_014_7d95:
    jr nz, @+$55

    ld d, l
    ld c, [hl]
    ld c, [hl]

jr_014_7d9a:
    ld e, c
    jr nz, @+$4f

    ld c, a

jr_014_7d9e:
    ld c, h
    ld c, h

jr_014_7da0:
    ld e, c
    jr nz, jr_014_7dc3

    jr nz, jr_014_7dc5

    inc b
    jr nz, jr_014_7dc8

jr_014_7da8:
    jr nz, jr_014_7dfe

    ld b, l
    ld d, e
    ld d, e
    ld b, c

jr_014_7dae:
    jr nz, jr_014_7df1

jr_014_7db0:
    ld c, [hl]
    ld b, h
    jr nz, jr_014_7e07

    ld c, c

jr_014_7db5:
    ld c, l

jr_014_7db6:
    ld c, a
    ld c, [hl]
    jr nz, jr_014_7dda

    inc b
    jr nz, jr_014_7ddd

    jr nz, jr_014_7ddf

    jr nz, jr_014_7de1

    jr nz, jr_014_7de3

jr_014_7dc3:
    ld c, e
    ld b, c

jr_014_7dc5:
    ld d, h
    ld c, c

jr_014_7dc7:
    ld b, l

jr_014_7dc8:
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_014_7dd4

    nop
    nop
    nop
    nop

jr_014_7dd4:
    jr nz, jr_014_7df6

    ld b, c
    jr nz, jr_014_7e29

    ld d, l

jr_014_7dda:
    ld c, e
    ld c, e
    ld b, c

jr_014_7ddd:
    jr nz, @+$49

jr_014_7ddf:
    ld b, c
    ld c, l

jr_014_7de1:
    ld b, l
    ld d, e

jr_014_7de3:
    jr nz, jr_014_7e31

    ld b, l
    jr nz, jr_014_7e08

    nop
    jr nz, jr_014_7e0b

    jr nz, @+$22

    jr nz, jr_014_7e0f

    jr nz, @+$22

jr_014_7df1:
    inc bc
    jr nz, jr_014_7e14

    jr nz, jr_014_7e16

jr_014_7df6:
    jr nz, jr_014_7e18

    jr nz, jr_014_7e1a

    jr nz, jr_014_7e1c

    jr nz, jr_014_7dfe

jr_014_7dfe:
    jr nz, jr_014_7e20

    ld b, a
    ld d, l
    ld d, e
    ld d, h
    ld b, c
    ld d, d
    ld c, c

jr_014_7e07:
    ld b, c

jr_014_7e08:
    jr nz, @+$46

    ld b, c

jr_014_7e0b:
    ld d, d
    jr nz, jr_014_7e5a

    ld b, c

jr_014_7e0f:
    ld d, e
    jr nz, jr_014_7e32

    nop
    nop

jr_014_7e14:
    jr nz, jr_014_7e36

jr_014_7e16:
    jr nz, jr_014_7e5f

jr_014_7e18:
    ld d, d
    ld b, c

jr_014_7e1a:
    ld b, e
    ld c, c

jr_014_7e1c:
    ld b, c
    ld d, e
    jr nz, jr_014_7e61

jr_014_7e20:
    jr nz, jr_014_7e76

    ld c, a
    ld b, h
    ld c, a
    jr nz, jr_014_7e47

    jr nz, jr_014_7e29

jr_014_7e29:
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    ld b, l

jr_014_7e31:
    ld c, h

jr_014_7e32:
    jr nz, jr_014_7e81

    ld d, l
    ld c, [hl]

jr_014_7e36:
    ld b, h
    ld c, a
    ld a, [bc]
    jr nz, @+$22

    jr nz, jr_014_7e5d

    jr nz, jr_014_7e3f

jr_014_7e3f:
    nop
    nop
    jr nz, jr_014_7e63

    jr nz, jr_014_7e65

    jr nz, jr_014_7e67

jr_014_7e47:
    jr nz, jr_014_7e69

    jr nz, jr_014_7e6b

    jr nz, @+$22

    jr nz, @+$05

    jr nz, jr_014_7e71

    jr nz, jr_014_7e73

    jr nz, jr_014_7e75

    nop
    jr nz, jr_014_7e78

    jr nz, jr_014_7e7a

jr_014_7e5a:
    jr nz, jr_014_7eac

    ld b, l

jr_014_7e5d:
    ld d, d
    ld c, a

jr_014_7e5f:
    jr nz, @+$55

jr_014_7e61:
    ld b, l
    ld d, d

jr_014_7e63:
    ld c, c
    ld b, c

jr_014_7e65:
    jr nz, jr_014_7e87

jr_014_7e67:
    jr nz, jr_014_7e89

jr_014_7e69:
    jr nz, jr_014_7e6b

jr_014_7e6b:
    nop
    jr nz, jr_014_7e8e

    jr nz, jr_014_7e90

    ld c, c

jr_014_7e71:
    ld c, [hl]
    ld d, h

jr_014_7e73:
    ld b, l
    ld d, d

jr_014_7e75:
    ld c, l

jr_014_7e76:
    ld c, c
    ld c, [hl]

jr_014_7e78:
    ld b, c
    ld b, d

jr_014_7e7a:
    ld c, h
    ld b, l
    jr nz, @+$22

    jr nz, jr_014_7ea0

    nop

jr_014_7e81:
    nop
    nop
    nop
    nop
    nop
    nop

jr_014_7e87:
    nop
    nop

Call_014_7e89:
jr_014_7e89:
    nop
    nop
    nop
    nop
    nop

jr_014_7e8e:
    nop
    nop

jr_014_7e90:
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

jr_014_7ea0:
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

jr_014_7eac:
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

Call_014_7f70:
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

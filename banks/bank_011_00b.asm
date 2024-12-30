; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00b", ROMX[$4000], BANK[$b]

    nop
    nop
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
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    add b
    ldh [$c0], a
    ret nc

    ret nz

    ldh [$c0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nc, jr_00b_402a

jr_00b_402a:
    scf
    dec sp
    ld a, e
    scf
    inc a
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
    ldh a, [$fe]
    cp $ff
    ld a, a
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
    rrca
    rlca
    sbc a
    rrca
    dec e
    ld e, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    add b
    ldh [$f1], a
    ld hl, sp-$0f
    ld l, b
    ld sp, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    add b
    add b
    ret nz

    ret nz

    ret nz

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
    jr nc, jr_00b_407a

jr_00b_407a:
    jr c, jr_00b_40ac

    ld a, b
    jr nc, jr_00b_40b7

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, de
    ld b, $5f
    ccf
    rst $38
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
    nop
    nop
    nop

jr_00b_40ac:
    add c
    ret nz

    add c
    pop bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_40b7:
    nop
    ld [bc], a
    nop
    ld e, a
    ld a, $7f
    cp $e6
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
    dec bc
    rlca
    rrca
    rra
    inc a
    ccf
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
    add sp, -$10
    ld sp, hl
    db $fc
    sbc a
    ld a, h
    nop

Jump_00b_40e1:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], h
    nop
    db $fd
    cp $ff
    rst $38
    db $eb
    rst $30
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc c
    inc bc
    rlca
    rrca
    add a
    adc a
    db $e3
    rst $08
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc a
    rst $38
    rst $38
    rst $38
    add c
    rst $38
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
    add b
    nop
    nop
    add b
    nop
    add b
    nop
    nop
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    ld bc, $0001
    ld bc, $0101
    ld bc, $d001
    ret nz

    ldh [$c0], a
    ret nc

    ret nz

    ld sp, hl
    rst $00
    rst $38
    rst $38
    db $fc
    rst $38
    ret nc

    ldh [$90], a
    ret nz

    jr c, @+$72

    jr c, jr_00b_41b4

    inc a
    ld [hl], b
    ld hl, sp-$10
    ld hl, sp-$10
    ld [hl], h
    ldh a, [$38]
    ld [hl], b
    inc [hl]
    ld [hl], b
    ld l, b
    ld [hl], b
    ldh [rSVBK], a
    ld l, b
    ld [hl], b
    ldh [rSVBK], a
    add sp, $70
    ld h, b
    ld [hl], b
    add sp, $70
    ld h, b
    ld [hl], b
    ld a, [de]
    inc a
    ld a, h
    jr c, jr_00b_419d

    ld [hl], b
    ld a, c
    ld [hl], b
    rst $28
    ld [hl], e
    rst $30
    ld l, a
    or $6f
    ld [hl], h
    ldh [rP1], a
    ld bc, $0100
    nop
    ld bc, $29d4
    ld sp, hl
    db $fd
    ld hl, sp-$03
    db $fd
    add hl, sp
    ld [hl], c
    add hl, sp
    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    cp c
    rst $00
    rst $38
    rst $38
    db $fc
    rst $38
    ld hl, sp-$40
    add b
    ret nz

    jr c, jr_00b_4202

    jr nc, @+$72

    jr c, jr_00b_4206

    ldh a, [$f0]
    ldh a, [$f0]
    ld [hl], b
    ldh a, [$30]

jr_00b_419d:
    ld [hl], b
    jr nc, jr_00b_4210

    nop
    nop
    ld bc, $0000
    ld bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    nop
    pop af
    ldh [$e0], a
    ret nz

jr_00b_41b4:
    call nc, $fee0
    rst $38
    cp a
    ld a, a
    ccf
    ld bc, $0001
    nop
    nop
    add e
    inc bc
    inc bc
    rlca
    rrca
    rlca
    add [hl]
    rrca
    sbc $ce
    call c, $dcee
    xor $ec
    xor $ab
    add $82
    add b
    add b
    nop
    nop
    nop
    ld bc, $0000
    nop
    ld bc, $1200
    inc c
    jr c, jr_00b_425e

    ldh a, [$78]
    ld [hl], b
    ldh a, [$e0]
    ldh a, [$f0]
    ldh [$e0], a
    ldh [rSVBK], a
    ldh [$e0], a
    ldh a, [rNR33]
    ld c, $0e
    rra
    ld e, $0f
    ld c, $1f
    rrca
    ld e, $1f
    ld e, $1d
    ld a, $3f
    inc a
    ld a, [c]
    pop hl

jr_00b_4202:
    ld [hl], c
    ldh [$f0], a
    pop hl

jr_00b_4206:
    ld [hl], e
    pop hl
    db $e3
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld l, a
    rst $38

jr_00b_4210:
    rst $00
    rst $28
    ld [hl], e
    rst $28
    ld [hl], a
    rst $28
    rst $30
    rst $28
    rst $20
    rst $28
    and a
    rst $08
    adc a
    rrca
    rst $00
    adc a
    nop
    add b
    nop
    add b
    ld a, l
    add d
    cp a
    rst $38
    cp $ff
    ld a, b
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
    and b
    ret nz

    and b
    ret nz

    add b
    ret nz

    ldh [$80], a
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_425e:
    nop
    nop
    jr c, jr_00b_42d2

    jr c, jr_00b_42d7

    dec sp
    ld [hl], a
    ld l, e
    inc sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $ec
    ld [hl], b
    ld a, a
    cp $fe
    rst $38
    inc bc
    db $fc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [rSVBK], a
    ld a, [c]
    ld a, l
    ld a, a
    ccf
    ccf
    rra
    ld c, $00
    nop
    nop
    nop
    nop
    nop
    nop
    ld sp, hl
    ld [hl], c
    pop hl
    pop af
    jp Jump_00b_40e1


    add c
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
    ret nz

    add b
    ret nz

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
    jr nc, jr_00b_4322

    jr c, jr_00b_4324

    jr nc, @+$72

    ld h, b
    jr nc, jr_00b_42b9

jr_00b_42b9:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0303
    inc bc
    inc bc
    ld bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    add c

jr_00b_42d2:
    or a
    rst $08
    rst $38
    rst $38
    ld a, l

jr_00b_42d7:
    cp $28
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $08
    xor $ef
    rst $00
    rst $00
    add e
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, $1e
    db $fc
    cp $fc
    ld hl, sp+$10
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, sp+$70
    ld a, b
    ccf
    rra
    ccf
    rlca
    rrca
    ld [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld sp, hl
    ld a, h
    ld [hl], c
    ld hl, sp-$07
    ldh a, [$80]
    ldh [$80], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    push af
    db $e3

jr_00b_4322:
    ldh a, [$e1]

jr_00b_4324:
    ld [hl], b
    ldh [$a0], a
    ld h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $00
    rst $28
    rst $20
    rst $38
    or c
    ld a, a
    ld d, l
    inc hl
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
    jp c, $fe00

    rst $38
    rst $38
    rst $38
    xor a
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
    cp b
    ld b, b
    ld e, b
    ldh [$58], a
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
    rst $38
    ld b, b
    ld e, a
    rst $38
    rst $38
    rst $18
    nop
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
    nop
    ei
    pop hl
    rst $38
    db $e3
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
    db $f4
    ld hl, sp-$05
    db $fc
    sbc e
    db $fc
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
    ldh a, [$c0]
    ldh a, [$c0]
    ldh a, [$c0]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00b_43da

jr_00b_43da:
    jr z, jr_00b_444c

    ld l, b
    ld [hl], b
    ld hl, sp+$60
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, d
    inc a
    cp $ff
    cp $ff
    nop
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
    ld bc, $0307
    adc a
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add sp, $10
    db $fc
    ld hl, sp-$04
    ld hl, sp-$44
    ld hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$1f07], sp
    ccf
    ccf
    ld a, a
    ld [hl], a
    ld hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    add b
    pop af
    ldh [$f0], a
    ld sp, hl
    db $fc
    ld a, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [$fffc]
    rst $38

jr_00b_444c:
    rst $38
    rst $38
    rst $08
    db $e3
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0301
    add c
    inc bc
    add c
    jp $e3c1


    nop
    nop
    nop
    nop
    nop
    nop
    rra
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ldh [$c0], a
    add b
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ldh [$e0], a
    ldh a, [$f0]
    ldh [$e0], a
    nop
    nop
    nop
    nop

Jump_00b_4481:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ldh [$58], a
    ldh [$58], a
    ldh [$73], a
    rst $08
    ld a, a
    rst $38
    ld a, b
    rst $38
    ld e, b
    ldh [$f8], a
    ret nz

    rst $38
    jp $c3ff


    rst $38
    jp $c3ff


    rst $38
    jp $c3ff


    rst $38
    jp $c3ff


    and e
    ld b, a
    add $07
    rst $08
    ld b, $c5
    ld c, $cc
    rrca
    call $df0f
    dec c
    rst $18
    inc c
    add sp, $00
    ret nz

    nop
    add b
    nop
    di
    inc c
    db $fd
    cp $fd
    cp $af
    call c, $1c9f
    ldh a, [$c0]
    ldh a, [$c0]
    ldh a, [$c0]
    di
    rst $08
    rst $38
    rst $38
    cp $ff
    ret c

    ldh [$f0], a
    ret nz

    ld hl, sp+$60
    ld hl, sp+$60
    ld hl, sp+$60
    ld hl, sp-$20
    ld hl, sp-$20
    ld a, b
    ldh [$f8], a
    ld h, b
    ld hl, sp+$60
    inc bc
    inc bc
    rlca
    inc bc
    inc bc
    rlca
    rlca
    inc bc
    inc bc
    ld bc, $0000
    nop
    nop
    ld b, $00
    and [hl]
    ret nz

    ret nz

    nop
    ld h, b
    add b
    db $fd
    cp $fe
    rst $38
    rst $30
    rrca
    rlca

jr_00b_451d:
    inc bc

jr_00b_451e:
    rlca
    inc bc

jr_00b_4520:
    ld e, $0f
    dec e
    ld e, $3e
    inc e
    inc a
    jr c, jr_00b_451d

    jr c, @-$46

    ld [hl], b
    jr c, jr_00b_451e

    jr c, jr_00b_4520

    cp l
    jr @+$03

    ld bc, $0103
    ld bc, $0303
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    dec hl
    inc de
    ldh [$f0], a
    ret nz

    ldh [$e0], a
    ret nz

    add b
    ret nz

    ret nz

    add b
    ret nz

    add b
    ret nz

    add b
    ret nz

    add b
    jr c, jr_00b_458f

    jr c, jr_00b_4571

    inc a
    dec e
    inc a
    dec e
    jr c, jr_00b_4577

    jr jr_00b_4599

    inc a
    add hl, sp
    jr c, jr_00b_45d9

    ret nz

    pop hl
    ret nz

    ldh [$c0], a
    ldh [$c1], a
    ldh [$db], a
    rst $20
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    pop af

jr_00b_4571:
    db $e3
    pop hl
    di
    ld h, c
    di
    pop hl

jr_00b_4577:
    di
    pop af
    db $e3
    pop hl
    jp $8303


    inc bc
    add e
    add b
    ret nz

    add b
    ret nz

    cp b
    rst $00
    rst $38
    rst $38
    rst $38
    rst $38
    jp $c0fc


    add b
    ret nz

jr_00b_458f:
    add b
    nop
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    ldh [$e0], a

jr_00b_4599:
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
    ld hl, sp-$40
    ld hl, sp-$40
    ld a, b
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
    ei
    rst $00
    rst $38
    rst $18
    rst $38
    rst $18
    ld c, h
    nop
    nop

jr_00b_45d9:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec a
    adc $ff
    rst $28
    rst $38
    rst $20
    nop
    inc bc
    nop
    nop

jr_00b_45ea:
    nop
    nop
    nop
    nop
    nop
    nop
    rst $18
    jr c, jr_00b_45ea

    ld hl, sp-$17
    ldh a, [rNR41]
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [$c0]
    ldh a, [$c0]
    ldh a, [$c0]
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
    ld hl, sp+$60
    ld hl, sp+$60
    ld hl, sp+$60
    db $10
    ld h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    ld c, $07
    rrca
    rrca
    rlca
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
    rrca
    rlca
    rrca
    rst $38
    rst $38
    cp $f8
    db $fc
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, h
    cp b
    cp a
    ccf
    rra
    rra
    rlca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld sp, $f17b
    ld sp, hl
    pop af
    ldh [$80], a
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [$c0], a
    xor $f1
    rst $38
    rst $38
    cp a
    ld a, a
    inc h
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, sp+$71
    ldh [$f1], a
    ldh [$e1], a
    add b
    pop bc
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $10
    rst $28
    pop bc
    db $e3
    pop bc
    ldh [$c0], a
    ldh [rP1], a
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    db $e3
    jp $e3f3


    ld sp, hl
    di
    ld a, e
    ld [hl], c
    db $10
    ld hl, $0000
    nop
    nop
    nop
    nop
    ret nz

    add b
    ret nz

    add b
    cp a
    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    add b
    ld a, a
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
    ldh [$c0], a
    ldh [$c0], a
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
    ld [bc], a
    rlca

jr_00b_46fe:
    inc bc
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
    inc d
    nop
    scf
    rst $18
    rst $30
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
    ld b, $03
    cp a
    rst $00
    xor $df
    nop
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
    sbc b
    sbc a
    ld hl, sp-$55
    call c, RST_00
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    add l
    ld a, [hl-]
    cp [hl]
    jr nc, jr_00b_46fe

    jr nc, jr_00b_4741

jr_00b_4741:
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
    rlca
    inc bc
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
    nop
    sbc h
    ldh [$fe], a
    ldh a, [$fe]
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec de
    ld b, $7e
    ccf
    cp [hl]
    ld a, a
    rst $20
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp $ff07


    rrca
    rst $38
    rra
    rst $18
    inc a
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    db $ec
    ldh a, [rIE]
    ld hl, sp-$05
    db $fc
    ld a, a
    inc e
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    ld a, b
    ld a, a
    rst $38
    rst $38
    rst $38
    rst $28
    rst $38
    rst $38
    pop hl
    nop
    nop
    nop
    nop
    nop
    ld bc, $0301
    pop hl
    inc bc
    or e
    pop bc
    ei
    pop bc
    rst $38
    pop hl
    nop
    nop
    rrca
    nop
    ld a, $ff
    rst $38
    rst $38
    rst $38
    rst $38
    rst $08
    ldh a, [$e8]
    ret nz

    ldh a, [$c0]
    nop
    nop
    add b
    nop
    add sp, -$10
    db $fc
    ldh a, [$f4]
    ldh a, [$94]
    ld h, b
    nop
    nop

jr_00b_47ce:
    nop
    nop
    nop
    nop

jr_00b_47d2:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld b, $04

jr_00b_4813:
    rlca
    inc bc
    ld b, $04
    rlca
    inc bc
    rlca
    rlca
    rlca
    inc bc

jr_00b_481d:
    ld b, $05
    ld b, $53
    cp a
    sbc a
    ld [hl], e
    rst $38
    inc sp
    ei
    rst $30
    rst $38
    di
    ld a, e
    or a
    rst $38
    inc sp
    ld e, e
    or a
    ccf
    call z, Call_00b_58be
    rst $38
    jr jr_00b_47ce

    ld a, b
    db $d3
    ccf
    rst $10
    ccf
    sub l
    ld a, [hl]
    sub $39
    rst $08
    jr jr_00b_47d2

    jr @+$11

    jr jr_00b_4880

    rst $18
    rst $18
    rst $38
    rst $08
    rst $38
    ei
    call c, $d8ef
    cp [hl]
    jr nc, @-$3f

    jr nc, jr_00b_4813

    jr nc, @+$01

    ldh a, [$fe]
    ldh a, [$3e]
    ldh a, [$7f]
    jr nc, jr_00b_481d

    jr nc, jr_00b_4868

    ld c, $0f
    inc c
    inc c
    rrca
    rrca
    rrca

jr_00b_4868:
    rrca
    rlca
    inc bc
    nop
    nop
    nop
    rra
    nop
    and b
    ld bc, $0181
    ld h, c
    add e
    rst $20
    ei
    rst $30
    ei
    or e
    ld a, a
    dec de
    ccf
    dec de
    ccf

jr_00b_4880:
    db $db
    and $f0
    ret nz

    add sp, -$80
    ldh a, [$80]
    ret nz

    nop
    ldh [rP1], a
    ldh [rP1], a
    rst $30
    nop
    cp $38
    ld a, [hl]
    ld [hl], b
    ld l, d
    ld [hl], b
    db $ec
    ld [hl], b
    ld [hl], h
    ldh [$7c], a
    ldh [$7c], a
    ldh [$7c], a
    ldh [$0d], a
    ld e, $1d
    ld c, $1d
    ld c, $1d
    ld c, $1d
    ld c, $0c
    ld e, $1f
    inc e
    ld a, $1c
    push af
    ldh [$fc], a
    ldh [$f4], a
    ldh [$fd], a
    ldh [$f1], a
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    db $ed
    di
    ld a, c
    di
    db $ed
    ld [hl], e
    push af
    di
    db $fd
    db $e3
    pop de
    db $e3
    jp hl


    add e
    ld [hl], c
    add e
    xor b
    ret nz

    add sp, -$40
    jp $ffff


    rst $38
    rst $38
    rst $38
    ld hl, sp-$01
    and b
    ret nz

    or b
    ret nz

    nop
    nop
    nop
    nop
    ret c

    ldh [$fc], a
    ldh [$f0], a
    ldh [$e0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

jr_00b_4931:
    rlca
    dec b
    ld b, $05
    nop
    nop
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
    ccf
    rst $10
    ccf
    jr z, jr_00b_495d

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    reti


    rst $38
    rst $38
    rst $18
    ld e, a
    adc a
    inc c
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_495d:
    nop
    nop
    nop
    rst $38
    sbc b
    rst $18
    sbc b
    xor a
    jr jr_00b_4977

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
    jr nc, jr_00b_4931

    jr nc, jr_00b_49b3

    jr nc, jr_00b_49a9

jr_00b_4977:
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

jr_00b_4981:
    jr jr_00b_49bf

    rra
    rrca
    rra
    rlca
    rrca
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp a
    dec sp
    push af
    ei
    ld sp, hl
    di
    ret


    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], a
    adc [hl]
    rst $18
    cp $ff
    db $fc
    cp $f8
    ld h, b

jr_00b_49a9:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, [hl]
    ldh a, [$f9]

jr_00b_49b3:
    ld a, [hl]
    ld a, a
    ccf
    cp a
    rra
    rla
    rrca
    inc bc
    nop
    nop
    nop
    nop

jr_00b_49bf:
    nop
    ld a, a
    jr c, jr_00b_4981

    ld a, b
    db $fc
    ldh a, [$ea]
    ldh a, [$e0]
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    rst $28
    rst $38
    ei
    rst $20
    db $f4
    pop hl
    db $fc
    ldh [rBCPS], a
    ldh [$60], a
    nop
    nop
    nop
    nop
    nop
    ei
    jp $e3ff


    db $fd
    di
    ld [hl], l
    ei
    scf
    ld a, c
    jr nc, jr_00b_49ed

    nop

jr_00b_49ed:
    nop
    nop
    nop
    xor b
    ret nz

    or b
    ret nz

    xor b
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    sbc a
    ld a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr c, @-$3e

    ret c

    ldh [$f4], a
    ldh [$e8], a
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
    dec bc
    dec b
    dec bc
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
    rlca
    nop
    ld c, a
    rst $30
    rst $30
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
    or h
    ld c, a
    add $fd
    ld b, h
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
    dec hl
    add $af
    ld c, a
    adc a
    ld e, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [bc]
    rlca
    ld l, a
    sbc a
    ld e, $ff
    jp c, Jump_000_003f

    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    rra
    rst $38
    cp a
    ld a, a
    dec sp
    rst $38
    rst $28
    ld [hl], c
    nop
    nop
    nop
    nop
    ld a, [bc]
    nop
    ld e, a
    rra
    rra
    rst $38
    sbc a
    rst $38
    sbc c
    rst $38
    call c, Call_000_00fb
    nop
    ld bc, $0302
    rlca
    rrca
    rst $30
    add a
    rst $38
    rst $00
    rst $38
    db $e3
    rst $38
    rst $30
    rst $28
    inc a
    nop
    cp $ff
    rst $38
    rst $38
    cp $ff
    add a
    cp $f8
    nop
    db $fc
    nop
    db $fc
    nop
    nop
    nop
    ld [$bcf0], sp
    ld b, b
    ld hl, sp+$00
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
    add hl, bc
    rrca
    inc bc
    rrca
    add hl, bc
    rrca
    dec bc
    rrca
    rrca
    rrca
    dec bc
    dec c
    inc bc
    rrca
    add hl, bc
    rrca
    ld a, e
    db $ec
    ld c, a
    ld hl, sp+$5f

jr_00b_4ba5:
    ld hl, sp+$4c
    ei
    ld e, a
    rst $38
    ld e, a
    rst $38
    ld d, c
    rst $38
    ld e, [hl]
    rst $38
    add $7d
    ld b, h
    rst $38
    ld h, l
    sbc $5c
    rst $38
    db $fd
    cp $64
    rst $38
    ld d, l
    xor $64
    rst $18
    ld a, a
    sbc b
    cp a
    ld d, b
    jr c, jr_00b_4ba5

    ccf
    rst $18
    ld a, a
    adc a
    dec c
    jp $c121


    ld e, a
    and c
    inc a
    inc sp
    db $eb
    jr nc, jr_00b_4c13

    ldh [$7f], a
    ldh [$7e], a
    ldh [$df], a
    ldh [$74], a
    ld [$ffc0], a
    ld a, [$d761]
    ld h, b
    rst $38
    ret nz

    ld a, a
    ret nz

    rst $38
    ret nz

    db $eb
    call nc, $ebd4
    jp $9ffd


    ld hl, sp-$23
    ld a, [$d8ff]
    db $dd
    ld a, [$dff9]
    sbc a
    rst $38
    cp a
    rst $18
    cp a
    rst $18
    ld l, a
    rst $30
    ld l, a
    rst $30
    ld l, a
    rst $30
    rst $38
    rst $20
    ei
    rst $20
    rst $08
    rst $20
    or a
    rst $00
    xor $97
    call c, $e520

jr_00b_4c13:
    jr jr_00b_4c94

    cp $ff
    cp $ff
    cp $e2
    db $fc
    ld hl, sp+$00
    db $ec
    stop
    nop
    ld d, b
    nop
    ld e, b
    and b
    ld hl, sp+$00
    ldh a, [rP1]
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

jr_00b_4c94:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rrca
    rlca
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
    nop
    ld a, [$efff]
    cp $c7
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
    ld b, h
    rst $38
    push bc
    ld a, [hl]
    or [hl]
    ld c, l
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
    scf
    rst $38
    scf
    rst $38
    rst $18
    ccf
    ld e, l
    ld e, $08
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, [hl]
    rst $38
    cp [hl]
    ld a, a
    db $fd
    ld a, $be
    inc a
    jr jr_00b_4cfa

jr_00b_4cfa:
    nop
    nop
    nop
    nop
    nop
    nop
    pop bc
    rst $38
    ld h, e
    rst $38
    rst $38
    ld a, a
    cp [hl]
    ld a, a
    rra
    ld a, $16
    ld [$0000], sp
    nop
    nop
    rst $38
    sbc a
    ld a, a
    sbc e
    ld a, [hl]
    sbc c
    cp l
    ld a, [de]
    rst $38
    jr jr_00b_4d20

    jr jr_00b_4d1d

jr_00b_4d1d:
    nop
    nop
    nop

jr_00b_4d20:
    rst $00
    rst $38
    and $ff
    rst $20
    rst $38
    or $ff
    ei
    ld [hl], a

jr_00b_4d2a:
    ld l, e
    scf
    inc bc
    inc bc
    nop
    ld bc, $40b8
    ldh a, [$08]
    call c, Call_000_2c20
    ret nc

    db $fc
    rst $38
    db $fc
    rst $38
    rst $38
    cp $7c
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_00b_4d2a

    ldh [rNR10], a
    ld hl, sp+$00
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
    ld bc, $0b00
    rlca
    dec c
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0700
    inc bc
    ld b, a
    rst $38
    cp l
    rst $38
    db $e3
    cp $00
    inc bc
    inc bc
    rlca
    ccf
    rlca
    or a
    ld a, a
    cp a
    db $fc
    ld hl, sp-$01
    ld e, h
    rst $38
    ld [hl], h
    rst $38
    ld [bc], a
    db $fd
    and l
    rst $38
    nop
    rst $38
    ld a, a
    add b
    xor c
    nop
    inc b
    ld hl, sp+$04
    ld hl, sp+$04
    ld hl, sp+$00
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

Call_00b_4ebd:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_00b_4f21

    inc c
    rrca
    inc c
    rrca
    rla
    rrca
    dec c
    rrca
    ld b, $0f
    dec e
    rrca
    ld c, $0f
    cp c

jr_00b_4f21:
    and $c5
    ld a, [$faf5]
    ld [hl], h
    ei
    ld hl, sp-$01
    ld l, d
    rst $38
    ld [hl], l
    rst $38
    rst $38
    rst $38
    inc e
    rst $38
    ld l, b
    rst $38
    ld d, a
    rst $38
    ld d, a
    rst $38
    ld e, a
    rst $30
    cp [hl]
    rst $30
    xor c
    or $a4
    rst $38
    inc b
    ld hl, sp-$69
    ld hl, sp-$26
    rst $38
    nop
    rst $38
    rst $38
    nop
    ld d, l
    nop
    ld d, b
    xor b
    inc b
    ld hl, sp+$00
    nop
    nop
    nop
    add b
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
    nop
    nop
    nop
    ld e, $0f
    nop
    rrca
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
    db $fd
    rst $38
    push de
    rst $38
    and c
    ld a, a
    inc de
    dec l
    dec b
    ld bc, $0001
    nop
    nop
    nop
    nop
    cp h
    rst $38
    ld hl, sp-$41
    inc e
    rst $38
    ld l, l
    cp a
    ld d, [hl]
    cp a
    ld [hl], a
    rrca
    dec bc
    rlca
    inc bc
    rlca
    inc b
    ld hl, sp+$04
    ld hl, sp+$04
    ld hl, sp+$54
    ld hl, sp-$15
    db $fc
    or l
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

jr_00b_50f3:
    nop
    nop
    nop
    nop
    nop

jr_00b_50f8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0003
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $fcfe
    cp $ed
    cp $d7
    jr z, jr_00b_50f3

    nop
    ld a, [bc]
    ccf
    rra
    ccf
    rra
    ccf
    nop
    nop
    ret nz

    nop
    ld e, b
    nop
    ld a, a
    jr jr_00b_50f8

    ld sp, $d1ba
    cp d
    push de
    adc [hl]
    push af
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_5166:
    add b
    nop
    ld [hl], b
    jr nz, jr_00b_5166

    dec h
    ld e, [hl]
    dec h
    sbc e
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
    or b
    ret nz

    xor e
    db $f4
    xor e
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0102
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    dec e
    ccf
    sbc $3f
    rst $38
    cp $fd
    cp $ab
    ld d, h
    ld c, d
    nop
    nop
    ccf
    rra
    ccf
    and a
    call c, $dca7
    xor $15
    ld a, a
    inc b
    ld c, e
    inc d
    xor e
    nop
    cpl
    ret nz

    xor e
    ret nc

    db $eb
    nop
    ld sp, hl
    ld b, $3a
    rst $00
    inc hl
    call c, $dce3
    rst $38
    reti


    ld e, a
    ei
    db $fd
    db $db
    cp [hl]
    pop hl
    xor l
    rst $30
    ld [c], a
    rst $38
    add c
    cp $b9
    add $98
    add $da
    rst $20
    xor c
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0101
    ld bc, $1b00
    ccf
    ld e, $3f
    rra
    ccf
    rra
    ccf
    ld a, [hl]
    cp a
    rst $38
    cp $fd
    cp $eb
    inc d
    cp a
    ret nc

    cp a
    ret nc

    rst $28
    call nc, $f48f
    ld [hl], d
    adc h
    ld a, h
    nop
    add b
    nop
    ld b, b
    nop
    ld c, l
    ei
    ld a, a
    ret nz

    push de
    nop
    ld d, l
    nop
    add b
    nop
    ld b, b
    nop
    nop
    nop
    nop
    nop
    cp [hl]
    pop hl
    ei
    ldh [$30], a
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
    ld bc, $0f07
    rrca
    rlca
    rrca
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
    rst $18
    ldh [$f5], a
    ret nz

    ccf
    ret nz

    push de
    nop
    add hl, bc
    ld b, $07
    rrca
    rlca
    rrca
    nop
    nop
    jr nz, jr_00b_5484

jr_00b_5484:
    ldh [rP1], a
    ld a, c
    rlca
    xor a
    rrca
    ccf
    rst $08
    sbc $cf
    rst $38
    adc $00
    nop
    nop
    nop
    nop
    nop
    ld a, l
    ret nz

    rst $30
    add c
    db $dd
    ld bc, $19e7
    ld a, l
    add hl, sp
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, b
    nop
    cp $c1
    xor e
    ret nz

    rst $38
    add b
    ld b, d
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [$e0]
    rst $38
    ldh [$75], a
    pop hl
    rst $28
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
    ld e, b
    and b
    or $e0
    ld e, d
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
    db $fc
    ld a, e
    rst $38
    ld a, e
    rst $38
    ld a, e
    nop
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
    add b
    sbc a
    ldh a, [$97]
    pop af
    nop
    nop
    nop
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
    sub [hl]
    and $1e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    rlca
    rrca
    rlca
    inc b
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rrca
    ld h, a
    rrca
    rst $38
    ldh [$d7], a
    ldh [$ba], a
    ld b, b
    ld c, l
    nop
    rrca
    rlca
    rrca
    rlca
    xor l
    adc $f5
    adc $75
    adc [hl]
    ret nc

    ld c, $bb
    inc b
    rst $28
    nop
    ld [hl], b
    ret nz

    rst $30
    rst $08
    cp a
    ld a, c
    db $fd
    ld a, c
    rst $38
    ld a, c
    cp a
    ld a, c
    push hl
    add hl, de
    ld a, a
    ld bc, $01da
    db $76
    add c
    ld a, a
    add b
    db $e3
    inc e
    ret nz

    rra
    adc $1f
    rst $08
    rra
    rst $08
    rra
    ld c, a
    sbc a
    ld l, a
    sbc a
    db $fd
    nop
    db $fd
    ld [bc], a
    and e
    inc e
    ldh [$1f], a
    ld e, h
    sbc a
    ld c, a
    sbc a
    ld e, a
    sbc a
    ld l, a
    sbc a
    ld d, $00
    ld c, e
    inc a
    db $fd
    ld a, $ad
    ld [hl], b
    or [hl]
    ld h, b
    sub b
    ld h, b
    or b
    ld b, b
    or c
    ld c, [hl]
    ld sp, hl
    ld a, a
    rst $38
    ld a, e
    rst $38
    ld a, e
    ld a, a
    ld a, b
    ei
    ld a, h
    cp $78
    db $fc
    ld a, e
    rst $38
    ld a, e
    xor [hl]
    pop de
    and e
    db $dd
    sub [hl]
    db $fd
    add h
    rst $38
    db $dd
    ld [hl+], a
    ld a, c
    ld [bc], a
    sbc e
    and $af
    sub $67
    sbc [hl]
    cp [hl]
    or $bf
    or $9b
    or $fa
    ldh a, [$9b]
    ldh a, [$df]
    or $bf
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_5694:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    rlca
    rlca
    nop
    rlca
    nop
    nop
    rrca
    rlca
    rrca
    rlca
    rlca
    rrca
    daa
    rrca
    rst $38
    ldh [$fe], a
    ldh [rNR22], a
    ldh [$94], a
    nop
    rst $20
    rst $08
    or $cf
    push af
    adc $ee
    call z, $0cb3
    xor $00
    ld h, b
    nop
    add b
    nop
    db $f4
    add hl, bc
    xor [hl]
    add hl, de
    rst $38
    jr c, jr_00b_5694

    ld a, b
    ld l, $f8
    ld d, b
    nop
    nop
    nop
    nop
    nop
    ld e, a
    sbc a
    cp $0f
    rst $38
    nop
    rst $28
    nop
    ld a, [de]
    nop
    ld b, b
    nop
    nop
    nop
    nop
    nop
    rst $38
    daa
    db $dd
    ld [hl+], a
    ld e, e
    nop
    ld c, [hl]
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
    ld c, a
    add hl, sp
    ld b, [hl]
    push de
    nop
    ld l, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld sp, hl
    ld a, a
    rst $38
    ld a, e
    cp [hl]
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
    adc b
    rst $30
    ei
    ret nz

    ld c, d
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
    rst $20
    ld e, $c9
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0103
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop

jr_00b_57b2:
    nop
    nop
    cp l
    ld b, d
    rst $28
    sub b
    dec [hl]
    jp z, $0075

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add sp, $00
    ld a, h
    add b
    sub $28
    db $ec
    db $10
    ld [hl], l
    add sp, $7b
    push hl
    nop
    nop
    nop
    nop
    nop
    nop
    dec b
    nop
    dec de
    inc a
    ld [$cd75], a
    ld a, [c]
    db $ed
    db $d3
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    and d
    ld d, c
    rst $18
    daa
    ld a, $cf
    sbc l
    xor $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [hl]
    add b
    rst $18
    jr nz, jr_00b_57b2

    ld c, d
    ld d, a
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $38
    ccf
    ld a, b
    cp [hl]
    ld a, c
    inc sp
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
    ld b, e
    add b
    rst $28
    rlca
    reti


    daa
    nop
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
    ld [hl], h
    adc b
    cp d
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
    rrca
    rlca
    rrca
    rlca
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
    nop
    inc de
    adc [hl]
    ld c, a
    sbc [hl]
    ld c, a
    sbc [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call c, Call_00b_7e20
    pop hl
    ld c, [hl]
    pop af
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $3900
    rst $00
    sbc $e1
    nop
    nop
    nop
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
    cp h
    ld a, [hl]
    cp h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_00b_58be:
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_58c4:
    ld bc, $0000
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
    rst $18
    ldh [$d5], a
    ld [$11ee], a
    rla
    nop
    nop
    nop
    nop
    nop
    push af
    db $eb
    ld a, e
    rst $20
    scf
    db $eb
    cp b
    ld b, a

jr_00b_58e8:
    sub $29
    ret c

    inc h
    xor $70
    ld l, b
    db $f4
    cp e
    pop bc
    db $d3
    and c
    pop hl
    sub e
    db $db
    and c
    cp a
    ld b, c
    xor d
    dec d
    ld e, l
    ld [bc], a
    or $79
    db $fd
    adc $9e
    db $ed
    xor a
    call c, $cdfe
    daa
    call c, Call_00b_4ebd
    pop de
    ld l, $b1
    ld c, [hl]
    adc e
    nop
    add d
    dec b
    add h
    inc bc
    add d
    inc bc
    add e
    inc bc
    add e
    inc bc
    inc bc
    add e
    rst $00
    inc bc
    rst $10
    jr z, jr_00b_58c4

    ld b, b
    ld [hl], b
    add b
    jr nc, jr_00b_58e8

    ldh a, [$80]
    sub b
    ldh [$b0], a
    ret nz

    and d
    call c, Call_000_00f8
    add sp, $10
    inc a
    ret nz

    adc a
    ld [hl], e
    rst $00
    ld a, e
    rst $38
    ld [hl], e
    db $76
    ld a, e
    or $7b
    ld e, a
    nop
    ld hl, $5e1e
    dec a
    cp l
    jp nz, $946a

    add sp, $00
    ret nz

    nop
    pop bc
    ld c, $0f
    rlca
    rrca
    rlca
    rrca
    rlca
    rlca
    rlca
    rrca
    rlca
    rlca
    rlca
    rrca
    rlca
    add a
    rlca
    ld c, a
    sbc [hl]
    ld c, a
    sbc [hl]
    ld c, [hl]
    sbc a
    ld [hl], a
    adc [hl]
    ld e, l
    and d
    ld a, [hl]
    add c
    ld d, e
    adc [hl]
    ld e, $cf
    ei
    inc b
    add c
    ld e, $90
    rrca
    xor $0f
    ld a, h
    jp $d12f


    ld a, c
    rst $00
    rst $18
    ld l, a
    inc bc
    rst $38
    ld [hl], e
    rst $38
    ld [hl], e
    rst $38
    di
    ld a, a
    di
    ld a, a
    di
    ld a, a
    di
    ld a, a
    di
    ld a, a
    ld a, d
    cp h
    ld a, [hl]
    cp h
    ld a, d
    cp h
    ld c, [hl]
    cp h
    ld a, [hl]
    add b
    ld a, [hl]
    add b
    ld e, [hl]
    cp h
    ld a, [hl]
    cp h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld a, [$ede5]
    jp nc, Jump_00b_6897

    rra
    nop
    nop
    nop
    rst $28
    ld [hl], b
    ld l, c
    rst $30
    ld l, a
    di
    rla
    db $eb
    rst $38
    nop
    ld e, b
    and b
    ld d, b
    nop
    nop
    nop
    ld a, [$ade5]
    db $d3
    db $db
    and c
    or e
    ld b, c
    pop hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld de, $feee
    pop bc
    sub a
    ldh [$a0], a
    ret nc

    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, e
    add a
    or $0f
    or l
    ld c, d
    ei
    inc b
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    sbc b
    ld h, l
    sbc d
    adc e
    ld b, b
    jp RST_00


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, h
    di
    sub h
    ld l, e
    ld e, l
    and b
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $0f
    pop hl
    ld e, $db
    inc h
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
    adc a
    rlca
    rrca
    add a
    add a
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
    ld e, [hl]
    adc a
    ld e, [hl]
    adc a
    ld d, b
    adc a
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
    sbc [hl]
    ld h, a
    or $09
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
    db $dd
    ld h, e
    ld [$ab55], a
    nop
    nop
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
    cp h
    ld e, d
    cp h
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
    ld b, $01
    ld [$0a07], sp
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
    rra
    ldh [rNR10], a
    rst $38
    xor d
    rst $38
    dec l
    inc bc
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
    add b
    pop bc
    add b
    inc b
    add e
    add hl, bc
    add a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    inc c
    ld hl, $95fe
    cp $23
    adc $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    nop
    db $10
    rrca
    ld a, [hl+]
    ccf
    ld d, e
    ld a, h
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
    ld d, b
    ldh [rNR50], a
    ld hl, sp-$38
    inc a
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
    ld d, b
    cp $a1
    rst $38
    add b
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
    ld bc, $8000
    rlca
    ld b, c
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
    ldh a, [rP1]
    nop
    db $fc
    db $10
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
    nop
    nop
    nop
    nop
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
    ldh a, [$c8]
    ldh a, [rLCDC]
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
    ld h, b
    ld a, c
    db $e3
    ld a, a
    ld h, d
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
    nop
    nop
    ld hl, sp+$03
    db $fc
    db $10
    rst $28
    nop
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
    ld b, c
    rst $38
    ret z

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
    sub b
    ld h, b
    ld c, b
    pop af
    ld l, b
    pop af
    nop
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
    ldh [$f0], a
    ret z

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
    ld b, $01
    ld b, $03
    inc b
    inc bc
    ld bc, $0000
    nop
    nop
    nop
    ld [bc], a
    inc bc
    inc b
    inc bc
    ld a, [$4403]
    rst $38
    and d
    rst $38
    ld a, b
    rlca
    nop
    inc bc
    nop
    inc bc
    adc b
    adc a
    dec d
    adc [hl]
    add b
    sbc [hl]
    sub l
    adc [hl]
    ld b, c
    adc a
    add b
    add a
    jp nz, Jump_00b_4481

    add e
    adc c
    ld c, $05
    ld c, $09
    ld c, $03
    ld c, $75
    adc [hl]
    ld c, c
    cp $83
    cp $55
    cp $c0
    ld a, b
    ret z

    ld [hl], b
    and b
    ld [hl], b
    db $10
    ldh a, [$a8]
    ld [hl], b
    adc b
    ld [hl], b
    db $10
    ld a, b
    ld b, h
    jr c, jr_00b_5ca1

    ld c, $11
    ld c, $04
    rrca
    nop
    rrca
    dec c
    rlca
    inc c
    rlca
    inc b
    rrca
    inc c
    rrca
    add d
    ld [hl], c
    inc hl
    nop
    ld bc, $0000
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    sub b
    ld h, b
    and c
    ret nz

    nop
    ldh [rNR10], a
    ldh [rDIV], a
    di
    ld e, $f7
    call z, $cc7f
    ld a, a
    ld d, l
    rst $38
    and b

jr_00b_5ca1:
    rrca
    jr jr_00b_5cab

    inc e
    rrca
    ld c, b
    rst $38
    ld hl, $f4fe

jr_00b_5cab:
    add b
    add b
    nop
    add l
    ld [bc], a
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

jr_00b_5cba:
    nop
    nop
    nop
    nop
    add b
    nop
    ld l, b
    ldh a, [$58]
    ldh a, [$60]
    ld hl, sp+$41
    cp $60
    rst $38
    ld d, h
    ei
    ld h, b
    ld hl, sp+$40
    ld hl, sp-$14
    ld a, b
    ld h, h
    ld a, b
    db $e4
    ld a, b
    push af
    ld a, d
    ld b, $ff
    db $10
    rst $38
    ld [hl+], a
    ld a, a
    ld l, b
    ld a, a
    or c
    ld c, $18
    rlca
    db $10
    rrca
    ldh [rIF], a
    ld b, $ff
    ld [bc], a
    rst $38
    ld [hl-], a
    rst $08
    ld b, $cf
    sbc c
    ld a, $19
    ld a, $99
    ld a, $18
    cp [hl]
    add hl, de
    cp [hl]
    jr jr_00b_5cba

    ld e, d
    cp [hl]
    add hl, de
    cp [hl]
    ldh [$f9], a
    ldh [$f9], a
    pop hl
    ld hl, sp-$1e
    db $fd
    ldh [rIE], a
    and $f9
    pop hl
    ld hl, sp-$1f
    ld hl, sp-$20
    ldh a, [$c8]
    ldh a, [$e0]
    ldh a, [$c8]
    ldh a, [rNR41]
    ldh a, [$08]
    ldh a, [rOBP0]
    ldh a, [$e8]
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
    inc bc
    inc b
    inc bc
    ld b, $03
    ld bc, $0000
    nop
    nop
    nop
    ld bc, $0003
    inc bc
    and c
    ld e, a
    and d
    rst $38
    ld c, b
    rst $38
    add sp, $00
    nop
    nop
    nop
    nop
    ld b, c
    adc a
    add h
    sbc a
    ld l, c
    sbc [hl]
    nop
    sbc h
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    add hl, hl
    adc $03
    adc [hl]
    add hl, bc
    ld c, $0b
    ld b, $04
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    inc a
    dec b
    ld e, $00
    rrca
    dec b
    inc bc
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    ld [$eb1f], sp
    ld a, $42
    db $fc
    db $10
    ld hl, sp-$20
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    push de
    ld a, b
    ld b, c
    ccf
    inc d
    rrca
    inc c
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    rst $38
    inc b
    di
    ld b, d
    pop hl
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
    ld b, [hl]
    add a
    dec d
    rst $28
    nop
    rst $38
    ret


    ld a, $00
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
    ld h, b
    ld hl, sp+$48
    ldh a, [$d8]
    ld [hl], b
    jr nc, jr_00b_5de8

jr_00b_5de8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, d
    ld a, l
    ld [hl], a
    ld a, b
    inc b
    ld a, b
    jr jr_00b_5df8

jr_00b_5df8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld e, $ef
    add b
    ld a, a
    ld b, d
    ccf
    ld e, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc c
    cp $c0
    rst $38
    ldh [$1f], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, c
    ld hl, sp+$69
    ldh a, [$08]
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
    add sp, -$10
    add sp, -$10
    ldh [rNR10], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ccf
    ld a, a
    ld a, a
    dec [hl]
    ld a, a
    jr nz, jr_00b_5e80

jr_00b_5e80:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], b
    add b
    add sp, -$10
    add sp, -$10
    ld h, b
    ld [hl], c
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
    rra
    ccf
    ld a, a
    rst $38
    db $e3
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
    add c
    rlca
    sbc a
    rrca
    cp $1f
    nop
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

    ldh [$f0], a
    ld hl, sp+$38
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
    ld [hl+], a
    ld a, h
    ld a, [hl]
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
    nop
    nop
    nop
    nop
    add e
    ld bc, $8341
    nop
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
    ld hl, sp-$04
    db $fd
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$3c00], sp
    jr jr_00b_5f25

    inc e
    inc e
    inc e
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
    ld c, $07
    ld c, $07
    ld c, $07
    nop
    nop
    nop
    nop
    nop

jr_00b_5f25:
    nop
    nop
    nop
    rlca
    nop
    rrca
    rra
    ccf
    ccf
    rla
    jr c, jr_00b_5f31

jr_00b_5f31:
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
    ret nz

    jp $f7e3


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
    add b
    ld a, a
    rst $38
    rst $38
    db $fd
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00b_5f5a

jr_00b_5f5a:
    ld [hl], b
    ldh a, [$b8]
    ldh a, [rSVBK]
    ld hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$1e00], sp
    inc a
    ld a, $3c
    ld e, $3c
    nop
    nop

jr_00b_5f72:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_5f83:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc d
    ld a, a
    ccf
    ccf
    ccf
    dec bc
    nop
    nop
    nop
    nop
    nop
    ld l, e
    ld [hl], c
    ld l, e
    ld [hl], e
    db $e3
    ld [hl], e
    db $eb
    di
    pop af
    di
    jp hl


    ld [hl], b
    jr c, jr_00b_601e

    ld [hl], c
    ld [hl], b
    rst $30
    jp $83c7


    ld b, e

jr_00b_5fb5:
    add e
    rst $00

jr_00b_5fb7:
    add e
    db $e3
    rst $38
    rst $38

jr_00b_5fbb:
    rst $38
    rst $38

jr_00b_5fbd:
    ld a, a
    ei
    rst $38
    sbc h
    jr c, jr_00b_5fbb

    jr c, jr_00b_5fb5

    jr c, jr_00b_5fb7

    jr c, jr_00b_5fbd

    jr c, jr_00b_5f83

    jr c, jr_00b_5fe9

    cp b
    cp [hl]
    inc e
    inc l
    ld e, $0f
    ld c, $0e
    rlca
    ld b, $07
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    rlca
    rlca
    ld h, c
    ld [hl], e
    jr nz, jr_00b_5fe5

    nop

jr_00b_5fe5:
    nop
    nop
    nop
    add b

jr_00b_5fe9:
    nop
    add b
    nop
    add b
    nop
    ld c, b
    jr nc, jr_00b_5f72

    ret nz

    ret nz

    ldh [$e0], a
    ldh [$e0], a
    ld [hl], c
    inc sp
    ld [hl], e
    ccf
    ld [hl], e
    ld a, e
    scf
    dec sp
    ld [hl], a
    or [hl]
    rrca
    rlca
    inc bc
    dec bc
    rlca
    ld a, a
    rst $38
    db $fd
    cp $38
    ret nz

    add b
    nop
    ld bc, $0000
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

jr_00b_601e:
    ret nz

    nop
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    rra
    rra
    rrca
    rra
    ld c, $1d
    inc e
    inc e
    inc c
    inc e
    ld c, $07
    ld c, $07
    ld a, [bc]
    rlca
    ld a, $c7
    cp $ff
    ld a, $ff
    rra
    rlca
    dec bc
    rlca
    ld [$0000], sp
    nop
    nop
    nop
    ld a, $40
    ld a, a
    rst $38
    ccf
    ld a, a
    ld a, $79
    ld e, h
    jr c, @-$0e

    ld [hl], b
    jr nc, jr_00b_60cc

    ld e, h
    jr c, jr_00b_60b3

    jr c, jr_00b_60b1

    cp h
    call c, $dcfc
    db $fc
    inc e
    inc a
    db $fc

jr_00b_6061:
    jr c, jr_00b_60df

    jr c, jr_00b_60e1

    jr c, jr_00b_60c3

    jr c, jr_00b_60e5

    jr c, jr_00b_60e7

    jr c, @+$7e

    jr c, jr_00b_60eb

    jr c, jr_00b_6061

    ld a, b
    or b
    ld a, b
    ldh a, [$78]
    cp b
    ld a, a
    rst $38
    ld a, a
    cp h
    ld a, e
    ldh a, [$78]
    or b
    ld a, b
    ld e, $3c
    ld e, $3c
    ld e, $3c
    ld c, [hl]
    cp h
    cp $fc
    db $fc
    cp $4e
    inc a
    inc c
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_60b1:
    nop
    ccf

jr_00b_60b3:
    nop
    ccf
    ccf
    ccf
    ccf
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, sp
    ld [hl], e
    db $eb

jr_00b_60c3:
    ld [hl], a
    db $e3
    rst $30
    ret nc

    ld [c], a
    add b
    nop
    nop
    nop

jr_00b_60cc:
    nop
    nop
    nop
    nop
    rst $30
    db $e3
    add e
    jp Jump_000_0387


    ld bc, $0002
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_60df:
    nop
    dec e

jr_00b_60e1:
    adc [hl]
    adc a
    rrca
    inc bc

jr_00b_60e5:
    add a
    add d

jr_00b_60e7:
    ld bc, $0000
    nop

jr_00b_60eb:
    nop
    nop
    nop
    nop
    nop
    ld d, $0f
    sbc l
    cp $fa
    db $fc
    ret z

    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [hl]
    jr c, jr_00b_6142

    ccf
    rra
    rrca
    dec b
    ld [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $e3
    ld [hl], a
    rst $30
    db $e3
    ldh [$c1], a
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
    pop bc
    add c
    db $e3
    rst $38
    rst $38
    rst $38
    db $dd
    ld a, $00
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
    inc e
    inc e

jr_00b_6142:
    inc e
    inc e
    inc e
    inc e
    inc d
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    dec bc
    rlca
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
    ld a, $1c
    ld c, $1f
    rrca
    rlca
    rlca
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    dec sp
    inc a
    ld a, e
    rst $38
    rst $30
    ld sp, hl
    pop bc
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $fc

jr_00b_6181:
    jr c, jr_00b_6181

    rst $38
    rst $38
    rst $38
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [$78]
    ld [hl], b
    ld hl, sp-$50
    ld hl, sp+$68
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc a
    ld e, $3c
    ld e, $2c
    ld e, $1a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rla
    rrca
    rrca
    rra
    inc de
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
    ld hl, sp-$20
    db $ed
    ldh a, [$67]
    pop af
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_6208:
    nop
    nop
    ld b, h
    jr c, jr_00b_6208

    db $fc
    ld hl, sp-$03
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $38
    ld a, [hl]
    rst $38
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
    nop
    ld de, $cf0e
    rra
    ld c, a
    sbc a
    nop
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
    ldh [$81], a
    pop af
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
    ld a, b
    nop
    cp $fc
    rst $38
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
    jr jr_00b_626a

jr_00b_626a:
    inc a
    jr jr_00b_62ab

    jr jr_00b_62a7

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
    ld b, $0e
    rlca
    ld a, [bc]
    rlca
    ld c, $07
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
    cpl
    rra
    rra
    ccf
    inc [hl]
    jr jr_00b_6291

jr_00b_6291:
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

    ldh [$f1], a
    ldh [$78], a
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_62a7:
    nop
    ccf
    nop
    rst $38

jr_00b_62ab:
    rst $38
    rst $38
    rst $38
    xor [hl]
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc $0c
    sbc $ee
    rst $08
    xor $cf
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
    ld b, b
    nop
    ret nz

    ldh [$e0], a
    ldh [$e0], a
    ldh [$e0], a
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
    rrca
    nop
    rrca
    rrca
    rrca
    rrca
    ld bc, $0000
    nop
    nop
    nop
    cpl
    ld [hl], e
    dec hl
    ld [hl], a
    xor [hl]
    ld [hl], a
    db $eb
    rst $30
    rst $28
    di
    xor a
    ld [hl], c
    ld l, h
    ld sp, $732d
    db $eb
    sbc l
    rr l
    ld c, c
    rra
    db $eb
    dec e
    db $db
    db $fd
    ei
    db $fd
    ei
    db $fd
    db $db
    db $fc
    rst $20
    jp $81e1


    ret nc

    add c
    ldh [$80], a
    ret nc

    add b
    ldh [$80], a
    ldh a, [$c0]
    ld sp, hl
    ret nz

    db $eb
    sbc h
    cp h
    ret nz

    ldh a, [$c0]
    ret nc

    ldh [$d0], a
    ldh [$58], a
    ldh [$d0], a
    ldh [$dd], a
    xor $f9
    ldh [$f8], a
    ld [hl], b
    inc a
    ld [hl], b
    dec a
    jr c, jr_00b_6378

    add hl, sp
    dec a
    dec de
    rra
    dec de
    ccf
    dec de
    rst $30
    rrca
    rlca
    inc bc
    inc de
    rlca
    ld a, a
    rst $38
    rst $38
    cp $98
    ldh [$c0], a
    add b
    ld b, c
    add b
    add b
    nop
    ret nz

    nop
    nop
    add b
    ret nz

    nop

jr_00b_6378:
    add b
    nop
    nop
    nop
    nop
    nop
    ld b, b
    add b
    ld a, [de]
    inc e
    ld a, [hl-]
    inc e
    ld a, [de]
    inc e
    rra
    rra
    rra
    rra
    inc e
    rra
    ld a, [de]
    inc e
    ld a, [de]
    inc e
    ld b, $07
    ld c, $07
    ld b, $07
    cp [hl]
    rst $00
    cp $ff
    cp $ff
    ld [hl], $0f
    ld b, $07
    nop
    nop
    add b
    nop
    nop
    nop
    ld c, e
    inc [hl]
    rst $38
    ld a, a
    ld a, a
    ld a, a
    db $fc
    dec sp
    inc a
    jr c, jr_00b_6429

    ld a, b
    inc a
    jr c, @+$3e

    inc e
    ld e, $1c
    xor [hl]
    call c, $eedc
    adc $fe
    call c, $1e0e
    ld c, $0e
    ld c, $0e
    ld c, $1f
    ld c, $0e
    ld c, $0e
    ld c, $0e
    ld c, $1f
    ld c, $0f
    ld c, $0f
    ld c, $0f
    ld c, $07
    rrca
    rlca
    rrca
    rlca
    rrca
    rlca
    ld c, $07
    ld c, $01
    nop
    nop
    nop
    nop
    nop
    db $ec
    ldh a, [rIE]
    rst $38
    ld a, a
    rst $38
    add hl, de
    rlca
    nop
    nop
    ldh [$e0], a
    ldh [$e0], a
    ldh [$e0], a
    ldh [$e0], a
    ldh [$e0], a
    ldh [$e0], a
    ldh a, [$e0]
    ldh [$e0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rrca
    rrca
    rrca
    ld c, $01
    nop

jr_00b_6429:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec hl
    ld [hl], a
    and $ff
    ld hl, sp-$1a
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
    res 3, h
    ld c, c
    inc e
    adc d
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
    rst $28
    pop af
    ld a, a
    ld a, a
    ld a, a
    ccf
    ld a, [de]
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [hl]
    rst $08
    xor a
    rst $00
    add a
    inc bc
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    ei
    rst $38
    pop af
    jp hl


    ldh a, [$c0]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sub c
    pop hl
    rst $38
    rst $38
    rst $38
    rst $38
    ld e, a
    ld a, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and b
    ret nz

    and b
    ret nz

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
    nop
    nop
    ld a, [de]
    inc e
    ld a, [de]
    inc e
    jr c, jr_00b_64c2

    ld c, $18
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
    rlca
    rlca
    rlca
    rlca
    ld [bc], a
    rlca
    ld [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc [hl]
    inc a

jr_00b_64c2:
    ld e, $1f
    sbc a
    rrca
    inc bc
    rlca
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    inc e
    ld c, $fc
    ld e, $fd
    db $fc
    db $fd
    ld hl, sp+$10
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    ld c, $0e
    ld a, [hl]
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rla
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    ld c, $c7
    ld c, $cf
    xor $c7
    xor $4a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [$e0]
    ldh a, [$e0]
    ld [hl], b
    ldh [rSVBK], a
    ldh [$c0], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, $00
    ld a, h
    ld a, a
    ld a, a
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
    nop
    ld [$3c00], sp
    rst $38
    ei
    ld a, l
    nop
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
    nop
    ld sp, hl
    cp $f8
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
    ldh a, [rP1]
    pop af
    cp $fb
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
    inc e
    nop
    inc a
    ld a, a
    cp $7f
    nop
    nop
    nop
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
    ld h, b
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc [hl]
    ld b, b
    db $fc
    ld h, b
    ld l, [hl]
    ld [hl], b
    ld l, h
    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec a
    jr nc, jr_00b_665a

    ld sp, $337d
    ld a, [hl]
    ld sp, $0000
    nop
    nop
    nop
    nop
    ld a, b
    nop
    ld a, c
    cp $fd
    cp $df
    cp $57
    adc a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc de
    rrca
    sbc a
    rra
    rst $38
    rra
    rst $38
    ld bc, $0000
    nop
    nop
    nop
    nop
    ld b, c
    ld bc, $fff9
    ei
    db $fd
    rst $38
    ld sp, hl
    ld sp, hl
    pop bc
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [$80], a
    ldh a, [$c0]
    ld hl, sp-$40
    add sp, -$40
    ld hl, sp-$40
    nop
    nop
    nop
    nop
    inc b
    ld [$1c1f], sp
    rra
    inc e
    rra
    inc e
    rra
    inc e
    dec e
    ld e, $00
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

jr_00b_665a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld b, $06
    rlca
    inc [hl]
    rlca
    ld a, [hl]
    ld a, a
    ld a, h
    ccf
    rrca
    ld b, $05
    ld b, $07
    ld b, $dd
    rst $28
    ld sp, hl
    rst $08
    rst $38
    adc a
    reti


    rst $28
    db $fd
    rst $38
    ld a, l
    rst $38
    ld a, c
    rst $38
    rst $38
    db $ed
    db $ec
    sbc a
    ld h, h
    adc a
    rst $30
    ld b, $f7
    ld b, $56
    and e
    ld [hl-], a
    rst $00
    jp nc, $8fa7

    or $be
    db $dd
    ld a, l
    adc [hl]
    ld b, a
    adc [hl]
    and a
    ld b, [hl]
    ld [c], a
    rlca
    ld [c], a
    rlca
    and $03
    add $ff
    cp a
    ld b, a
    jp $cf03


    inc bc
    ccf
    rst $38
    ld a, a
    cp $ec
    ldh a, [$f8]
    ret nz

    db $dd
    ldh [$e0], a
    nop
    ld [hl], b
    add b
    ld [hl], b
    add b
    ldh [rP1], a
    add b
    nop
    nop
    nop
    nop
    nop
    ld [hl], b
    add b
    ld l, [hl]
    ld [hl], b
    ld l, h
    ld [hl], b
    ld l, [hl]
    ld [hl], b
    ld a, [hl]
    ld a, a
    ld a, a
    ld a, a
    ccf
    ld a, a
    ld l, a
    ld [hl], b
    ld l, h
    ld [hl], b
    ld a, [hl]
    jr nc, jr_00b_6771

    jr nc, jr_00b_6773

    jr nc, jr_00b_6773

    or e
    ei
    rst $30
    ei
    rst $30
    dec sp
    rst $30
    ld a, a
    inc sp
    rlca
    rlca
    rlca
    inc bc
    inc bc
    inc bc
    ld e, e
    and c
    ld sp, hl
    rst $38
    rst $38
    db $fd
    cp l
    rst $38
    push af
    adc c
    ld h, c
    add c
    pop af
    add c
    pop af
    add c
    or c
    pop bc
    ld sp, hl
    pop bc
    pop af
    pop bc
    ld sp, hl
    pop bc
    reti


    pop bc
    pop af
    pop bc
    jp hl


    pop bc
    ld sp, hl
    pop bc
    jp hl


    pop bc
    pop af
    pop bc
    ld hl, sp-$3f
    jp hl


    pop bc
    ldh a, [$c1]
    ldh a, [$c0]
    ld hl, sp-$40
    ret c

    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp $c1
    ret nc

    ldh [$1f], a
    inc e
    inc e
    ld e, $1f
    inc e
    ld a, l
    sbc [hl]
    rst $38
    db $fc
    db $fd
    cp $fc
    cp $3d
    ld e, $00
    nop
    add b
    nop
    nop
    nop
    add b
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

jr_00b_6771:
    nop
    nop

jr_00b_6773:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    inc a
    ld a, a
    ld a, e
    inc a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$ffcd], a
    adc h
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
    rst $08
    cp $ff
    db $fc
    cp l
    ld a, b
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, a
    cp $fd
    ld a, [hl]
    ld a, [hl-]
    inc a
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [c], a
    db $fd
    rst $38
    ld a, a
    rst $38
    ccf
    ld b, $1f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp b
    ret nz

    or b
    ret nz

    ret nc

    add b
    jr nz, jr_00b_67f8

jr_00b_67f8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, h
    ld [hl], b
    ld l, [hl]
    ld [hl], b
    ld l, d
    ld [hl], b
    inc a
    ld h, b
    jr nz, jr_00b_680a

jr_00b_680a:
    nop
    nop
    nop
    nop
    nop
    nop
    dec [hl]
    dec sp
    scf
    add hl, sp
    scf
    jr c, jr_00b_6854

    jr nc, jr_00b_6849

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld sp, hl
    pop bc
    rst $30
    jp hl


    rst $38
    rst $38
    rst $38
    ld a, a
    ld e, $3f
    ld [$0000], sp
    nop
    nop
    nop
    jp hl


    pop bc
    rst $38
    pop bc
    cp a
    rst $18
    rst $38
    sbc a
    sub l
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    jp hl


    pop bc
    ld sp, hl
    pop bc
    di
    db $fd
    ei
    db $fd
    ei

jr_00b_6849:
    db $fd
    add hl, sp
    nop
    nop
    nop
    nop
    nop
    ld hl, sp-$40
    ldh a, [$c0]

jr_00b_6854:
    ld hl, sp-$40
    ldh a, [$c0]
    ld hl, sp-$40
    ld b, b
    add b
    nop
    nop
    nop
    nop
    dec c
    ld e, $0d
    ld e, $0e
    ld e, $0f
    ld e, $0d
    ld e, $0d
    ld c, $04
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

Jump_00b_6897:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    db $76
    rst $38
    rst $20
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
    inc bc
    nop
    or e
    rst $38
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
    nop
    ld b, [hl]
    nop
    cp [hl]
    rst $38
    sbc a
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
    inc bc
    add d
    inc bc
    ld d, e
    db $e3
    inc bc
    di
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    call c, $082f
    rst $38
    rrca
    db $fd
    xor c
    ld e, [hl]
    nop

jr_00b_6931:
    nop
    nop
    nop
    nop
    nop
    rst $20
    jr c, jr_00b_6931

jr_00b_6939:
    rst $38
    ld hl, sp-$01
    sbc h
    rst $38
    ld a, h
    adc a
    nop
    nop
    nop
    nop
    nop
    nop
    and h
    rra
    rst $38
    rst $38
    rst $38
    rst $38
    db $fc
    rst $38
    add hl, de
    cp $00
    nop
    nop
    nop
    ld e, a
    jr nz, jr_00b_6939

    ld a, l
    ld a, d
    push af
    rst $38
    ld [hl], b
    ei

jr_00b_695d:
    ld [hl], h
    cp $71
    nop
    nop
    ld e, $00
    ld a, [de]
    dec e
    cp e
    inc e
    cp e
    inc e
    dec sp
    sbc h
    cp c
    ld e, $db
    inc e
    nop
    nop
    add b
    nop
    and b
    ld b, b
    ldh [rP1], a
    ld h, b
    add b
    ret nz

    jr nz, jr_00b_695d

    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ccf
    inc c
    dec sp
    ld e, c
    ccf
    ld l, a
    rst $38
    cp $7f
    rrca
    ccf
    ld c, $3f
    add hl, sp
    rra
    cp [hl]
    rst $18
    xor c
    sbc $8d
    rst $38
    adc h
    rst $38
    call z, $b8ff
    rst $38
    add sp, -$01
    jp c, $e9ff

    rst $38
    db $d3
    db $fd
    ret


    rst $38
    ld l, a
    rst $38
    cp $ff
    ld d, d
    db $fc
    db $76
    ld sp, hl
    ld e, b
    rst $38
    and e
    ei
    dec bc
    di
    inc hl
    db $db
    ei
    inc bc
    db $d3
    inc bc
    add e
    inc bc
    add e
    inc bc
    ld a, d
    add e
    xor [hl]
    ld e, l
    xor c
    ld e, [hl]
    sbc [hl]
    ld l, l
    ret c

    rst $38
    db $fd
    rst $38
    db $fd
    rst $38
    sbc l
    ld a, a
    ld e, a
    xor l
    adc h
    ld c, a
    ld h, [hl]
    adc a
    xor a
    ld b, [hl]
    cp [hl]
    rst $00
    or $ff
    cp $ff
    ei
    rst $38
    sub d
    rst $38
    ld a, [de]
    db $fd
    ld e, c
    cp [hl]
    dec sp
    call c, $bc5f
    cp c
    ld e, [hl]
    ld e, d
    cp l
    cp c
    ld e, [hl]
    ei
    inc e
    db $fd
    ld [hl], d
    rst $38
    ld [hl], b
    ld sp, $fffe
    ld a, a
    rst $38

jr_00b_6a79:
    ld a, a
    cp a
    ld a, a
    ld sp, hl
    ld [hl], a
    dec sp
    db $f4
    cp d
    dec e
    dec sp
    sbc h
    ld a, c
    sbc [hl]
    sbc e
    db $fc
    ld a, [$fffd]
    db $fc
    ei
    db $fc
    ld e, c
    cp [hl]
    ldh [rP1], a
    ret nz

    jr nz, @-$1e

    nop
    ret nz

    jr nz, jr_00b_6a79

    nop
    ldh [rP1], a
    or b
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
    xor l
    ld a, e
    ld h, [hl]
    ld sp, hl
    ld [hl+], a
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
    ld a, a
    ei
    ld [hl], l
    ei
    ld c, d
    ld sp, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $db
    rst $38
    rst $28
    rst $18
    rst $38
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
    add a
    ei
    rst $38
    add e
    ld a, d
    add e
    ld b, d
    inc bc
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    xor c
    ld e, a
    xor [hl]
    ld e, l
    ld e, l
    xor [hl]
    rst $38
    inc c
    ld a, [bc]
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    add $ff
    add $ff
    cp $ff
    ld a, a
    cp $bc
    ld a, [hl]
    dec h
    jr jr_00b_6b7d

jr_00b_6b7d:
    nop
    nop
    nop
    ld a, c
    sbc [hl]
    jp c, Jump_00b_7c3d

    rst $38
    rst $38
    rst $38
    ld a, a
    rst $38
    ld [hl], a
    rrca
    nop
    nop
    nop
    nop
    cp a
    ld [hl], b
    db $fd
    ld [hl], d
    ccf
    ldh a, [$7b]
    db $f4
    ld a, $f1
    cp a
    ld [hl], b
    nop
    jr nz, jr_00b_6b9f

jr_00b_6b9f:
    nop
    rst $18
    inc e
    sbc a
    inc e
    rra
    sbc h
    rst $18
    inc e
    sbc a
    inc e
    sbc a
    inc e
    dec bc
    inc e
    ld [$7000], sp
    add b
    ldh [rP1], a
    or b
    ld b, b
    ldh a, [rP1]
    ld h, b
    add b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    cpl
    rst $38
    ld a, e
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    inc bc
    dec bc
    ccf
    ld a, a
    ccf
    reti


    rst $38
    rst $28
    db $fd
    nop
    nop
    rlca
    nop
    dec d
    rrca
    db $fd
    rst $38
    ld a, [$e9ff]
    rst $38
    xor b
    rst $38
    ret


    rst $38
    ld d, d
    nop
    xor l
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc $7f
    ld c, e
    ld a, a
    cp a
    ld a, a
    ld a, a
    rst $38
    ld a, [hl]
    rst $38
    cp l
    ld a, [hl]
    db $76
    ld a, a
    sbc a
    ld a, a
    push af
    rst $38
    db $eb
    rst $38
    cp c
    rst $38
    sub [hl]
    ld a, a
    cp a
    ccf
    ld e, a
    ccf
    dec hl
    rst $38
    xor $ff
    add sp, -$01
    ld l, d
    rst $38
    db $ed
    rst $38
    adc $ff
    xor a
    rst $38
    ld l, a
    rst $38
    xor e
    rst $38
    xor c
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    nop
    rst $38
    nop
    add b
    add b
    nop
    nop
    add b
    add b
    nop
    nop
    add b
    add b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    ld e, h
    or a
    inc de
    dec b
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    rst $28
    rst $38
    dec hl
    rst $38
    rst $18
    ccf
    ld h, e
    rra
    dec c
    inc bc
    ld [bc], a
    ld bc, $0000
    nop
    nop
    jr z, @+$01

    jr z, @+$01

    ld l, b
    rst $38
    ld a, b
    rst $38
    add sp, $7f
    xor b
    ld a, a
    dec e
    nop
    nop
    nop
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add h
    rst $38
    add b
    rst $38
    add b
    rst $38
    jp nz, $d5bd

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0100
    nop
    ld bc, $00fe
    cp $ff
    rst $28
    cp $ff
    cp $f7
    cp $df
    cp $fb
    cp $ef
    cp $00
    nop
    ldh [rP1], a
    jp nc, $dee0

    db $e3
    ld e, e
    ld [c], a
    rst $10
    ld [c], a
    ld l, l
    jp nc, $fec7

    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop
    or b
    ld h, b
    cp l
    ld h, b
    xor b
    ld a, a
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
    nop
    nop
    nop
    nop
    ld d, b
    and b
    sub b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

jr_00b_70c4:
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0101
    rst $38
    cp $b7
    cp $fd
    cp $db
    cp $ef
    cp $ff
    cp $ed
    cp $bf
    cp $42
    rst $38
    db $e4
    rst $18
    dec b
    rst $38
    ld e, h
    sub a
    and a
    inc e
    and c
    ld e, $e7
    inc e
    ret nz

    ld a, a
    xor b
    rst $38
    xor [hl]
    rst $38
    xor e
    rst $38
    dec [hl]
    set 3, e
    ld bc, $016f
    adc b
    ld a, a
    dec l
    rst $38
    ld [hl], b
    add b
    jr nc, jr_00b_70c4

    sub b
    ldh [$d0], a
    ldh [$f0], a
    ret nz

    ldh a, [$c0]
    ld [hl], b
    ret nz

    ld [hl], b
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
    ld bc, $0101
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0100
    ld bc, $ff00
    cp $fb
    cp $ff
    cp $df
    cp $ff
    cp $b7
    cp $49
    cp $fe
    nop
    ld a, a
    push de
    ld sp, hl
    rst $10
    ld b, [hl]
    ld sp, hl
    ld l, d
    ret nc

    ld e, e
    ldh [$7a], a
    ret nz

    ldh [rP1], a
    nop
    nop
    add hl, hl
    cp $ae
    ld a, b
    cp [hl]
    ld h, b
    jr nc, @-$1e

    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [rP1]
    ldh [rP1], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rra
    ccf
    rra
    ccf
    rra
    ccf
    rra
    rra
    ccf
    ccf
    rra
    rra
    ccf
    nop
    nop
    ret nz

    add b
    ld b, a
    add a
    ld l, a
    add a
    daa
    adc a
    ld c, a
    adc a
    rst $28
    rrca
    ld c, a
    adc a
    nop
    nop
    nop
    nop
    ldh a, [$e0]
    db $d3
    db $ec
    db $e3
    call z, $c8f5
    ldh [$cf], a
    rst $30
    rst $08
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, a
    rrca
    rst $38
    rlca
    ld d, a
    rlca
    rst $18
    rlca
    cp $3f
    nop
    nop
    nop
    nop
    nop
    nop
    or a
    ret nz

    rst $28
    add a
    sbc $03
    db $d3
    rlca
    ld h, [hl]
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp [hl]
    ld a, h
    cp $7c
    ld a, [$b87c]
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
    ld a, $00
    ld a, e
    ld a, h
    ld a, [hl]
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
    ld a, h
    nop
    rst $38
    ld [hl], c
    jp hl


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
    db $fd
    sbc e
    rst $38
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
    nop
    ldh [$80], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rra
    rra
    ccf
    ccf
    rra
    rra
    ccf
    ccf
    rra
    rra
    ccf
    rra
    ccf
    rra
    ccf
    rst $28
    rrca
    ld c, a
    adc a
    rst $30
    rrca
    ld h, e
    sbc h
    db $dd
    nop
    scf
    add b
    cp $01
    ld b, a
    adc a
    rst $18
    rst $08
    rst $28
    rst $08
    scf
    rst $08
    cp a
    rrca
    ld l, a
    rrca
    rst $18
    rrca
    ccf
    rst $08
    rst $28
    rst $08
    rst $38
    ld a, $be
    ld a, $fd
    ld a, $ff
    inc a
    cp a
    inc a
    rst $38
    inc a
    cp l
    inc a
    rst $18
    inc a
    sbc [hl]
    ccf
    sbc [hl]
    ccf
    ld e, $3f
    add [hl]
    ld a, e
    rst $28
    add c
    ld [hl], h
    add e
    ld c, h
    sub e
    cp [hl]
    ld [hl], e
    ld a, [$fa7c]
    ld a, h
    ld sp, hl
    ld a, h
    sbc [hl]
    ld h, b
    or h
    nop
    sbc $00
    ret c

    inc a
    ei
    ld a, h
    cp $f9
    push af
    ei
    rst $30
    ei
    dec b
    ld hl, sp-$09
    nop
    ld a, [bc]
    nop
    rra
    rrca
    cpl
    rst $18
    ld l, l
    di
    ld a, [c]
    rst $28
    cp $ef
    ld c, a
    cp $ef
    ld e, [hl]
    cp a
    ld e, [hl]
    cp a
    ld e, [hl]
    ld l, c
    sbc [hl]
    cp e
    ld [$68f7], sp
    ld [hl], e
    xor $e3
    cp $e7
    ld hl, sp-$02
    jp hl


    ei
    jp hl


    db $fd
    add sp, -$80
    add b
    ret nz

    add b
    add b
    add b
    ldh a, [$80]
    ret nz

    add b
    add b
    add b
    add b
    add b
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
    nop
    nop
    nop
    nop
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
    ccf
    rra
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    jr c, jr_00b_7525

    nop
    nop
    rst $28
    rrca

jr_00b_7522:
    rst $08
    rrca
    rst $08

jr_00b_7525:
    rrca
    rst $00
    rrca
    rst $08
    rrca
    xor b
    rlca
    jp nz, RST_00

    nop
    cp a
    rst $08
    rst $28
    rst $08
    or [hl]
    rst $08
    rst $28
    call z, $c8be
    and a
    ret z

    ld d, b
    nop
    nop
    nop
    rst $18
    inc a
    cp e
    inc a
    ei
    inc b
    ld e, a
    nop
    or $00
    ld c, c
    nop
    nop
    nop
    nop
    nop
    cp $f3
    xor $f3
    adc [hl]
    ld h, a
    cp $07
    xor a
    nop
    ld b, b
    nop
    nop
    nop
    nop
    nop
    ld sp, hl
    ld a, l
    ld a, d
    ld a, l
    ld sp, hl
    ld a, h
    xor [hl]
    ld a, b
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    ei
    rst $30
    push af
    ld a, [c]
    sbc $20
    ld d, l
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
    jr z, @+$01

    nop
    ld [$0000], a
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
    ld e, b
    cp e
    jr @-$2a

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00b_7522

    ld d, b
    add b
    jr nz, jr_00b_75a6

jr_00b_75a6:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, $18
    ld [hl], a
    jr c, jr_00b_768c

    inc a
    ld [hl], a
    jr c, jr_00b_7691

    ld a, [hl-]
    ld [hl], a
    jr c, jr_00b_7621

jr_00b_7621:
    nop
    nop
    nop
    nop
    nop
    inc bc
    ld bc, $0303
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
    ret nz

    nop
    sbc l
    ldh [$b9], a
    adc $eb
    sbc h
    cp $81
    inc sp
    jp RST_00


    nop
    nop
    nop
    nop
    ld b, b
    nop
    rst $10
    jr z, jr_00b_76ba

    sub b

jr_00b_764c:
    ld [hl], l
    adc d
    and d
    ret nc

    nop
    nop
    nop
    nop
    nop
    nop
    dec de
    inc b
    add hl, de
    ld a, $3f
    ld a, b
    ei
    ld [hl], h
    xor $f0
    nop
    nop
    nop
    nop
    nop
    nop
    add d
    nop
    cp a
    ld c, a
    db $76
    adc a
    and $1f
    ld e, $0f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $00
    inc bc
    rst $00
    rlca
    rst $08
    rlca
    rst $08
    rlca
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
    jr nz, jr_00b_764c

jr_00b_768c:
    ld b, b
    add b
    ld h, b
    add b
    nop

jr_00b_7691:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld e, $00
    ld a, e
    inc a
    or $79
    nop
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
    nop
    xor $0f
    rst $38
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

jr_00b_76ba:
    and $00
    ld l, [hl]
    sbc a
    db $ed
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
    sbc [hl]
    nop
    call $f53e
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
    ld a, $00
    cp e
    ld a, h
    db $db
    inc a
    nop
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
    and b
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
    ld [hl], l
    ld a, [hl-]
    scf
    ld a, b
    db $76
    jr c, @+$37

    ld a, d
    db $76
    add hl, sp
    scf
    ld a, b
    ld a, [hl-]
    ld [hl], l
    scf
    ld a, b
    rlca
    inc bc
    rlca
    inc bc
    rrca
    inc bc
    dec bc
    db $f4
    xor $11
    ld [hl], l
    adc d
    di
    rlca
    rlca
    inc bc
    inc sp
    jp $83f3


    ld [hl], e
    add e
    or e
    ld b, e
    db $d3
    inc hl
    ld [hl], e
    add e
    ld b, a
    and e
    inc sp
    jp $a1d0


    or c
    pop bc
    db $e3
    sub c
    or c
    jp $93e3


    or e
    jp $83f3


    rst $10
    and e
    db $f4
    add sp, -$24
    ldh [$d8], a
    ldh [$ef], a
    ret nc

    cp l
    adc $9e
    jp hl


    and e
    call c, $83f9
    ld c, $0f
    ld e, $0f
    ld c, $0f
    or $0f
    ld a, [c]
    rrca
    xor [hl]
    ld d, e
    ld e, [hl]
    rst $20
    sub $ef
    ld c, a
    add a
    rst $08
    rlca
    rst $00
    rrca
    add l
    ld a, d
    ei
    inc b
    call c, $f723
    rrca
    rst $08
    rlca
    ldh [rP1], a
    ld b, c
    add b
    add c
    ld b, b
    add c
    ld b, b
    ldh [rP1], a
    ld b, b
    add b
    add b
    ld b, b
    ldh [rSB], a
    cp $f0
    db $ec
    ldh a, [$ec]
    ldh a, [$0e]
    pop af
    ld e, a
    nop
    rlca
    nop
    ld [bc], a
    inc bc
    ld h, a
    add e
    cp a
    inc a
    ld a, c
    ld a, $3a
    ld a, h
    cp [hl]
    ld a, b
    sub h
    ld a, b
    ldh a, [rNR32]
    and h
    ret c

    or a
    db $db
    rrca
    db $fc
    dec de
    ld a, h
    ld a, [hl]
    ld a, b
    ld a, [hl]
    ld a, b
    db $fc
    ld a, b
    db $f4
    ld a, c
    ldh a, [$7d]
    rst $30
    reti


    push af
    ld c, $ed
    or $ec
    rst $30
    db $fc
    rst $30
    db $fd
    or $e7
    db $fc
    db $ed
    or $f5
    xor $fa
    inc e
    xor d
    ld e, h
    jp c, $dbec

    db $ec
    dec hl
    call c, Call_000_3cda
    ld e, b
    cp h
    ld a, [$001c]
    nop
    nop
    nop
    add b
    nop
    ldh [rP1], a
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
    inc a
    ld [hl], d
    ld a, a
    ld [hl], b
    ld a, d
    ld [hl], h
    ld a, h
    ld [hl], d
    ld a, d
    ld [hl], h
    ld a, [hl]
    nop
    ld [$0000], sp
    nop
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    dec b
    inc bc
    ld bc, $0000
    nop
    nop
    nop
    ld [hl], e
    add e
    db $d3
    and e
    ld h, h
    sbc a
    cpl
    call c, $aa5d
    rst $20
    nop
    nop
    nop
    nop
    nop
    db $d3
    and e
    db $e4
    sub e
    ld [hl], $c9
    rst $18
    jr nz, jr_00b_78f8

    sub b
    ld b, b
    nop
    nop
    nop
    nop
    nop
    or e
    jp $d7ab


    jr c, @-$37

    rst $28
    db $10
    ld a, d
    dec b
    inc b
    nop
    nop
    nop
    nop
    nop
    rst $30
    adc $de
    xor a
    rst $28
    ld e, $7f
    adc [hl]
    push bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $08
    rlca
    adc a
    rlca
    rrca
    add a
    ret z

    rlca
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, e
    add c
    add e
    ld b, c
    ld h, c
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
    rst $08
    rst $30
    ret c

    rst $20
    rst $30
    ld [$003f], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    push bc
    cp e
    rst $30
    ld [$01f6], sp
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
    db $e4
    sbc e
    cp [hl]
    ld b, c
    rst $10
    nop
    nop
    nop

jr_00b_78f8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $ed
    sbc $ef
    inc e
    cp e
    ld b, h
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
    ld a, d
    inc c
    di
    inc c
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
    nop
    add b
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
    ld b, $00
    ld [bc], a
    rlca
    ld [$0a07], sp
    rlca
    inc b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00b_7988

jr_00b_7988:
    ld d, a
    jr nc, jr_00b_79d7

    ld [hl], e
    sub [hl]
    ld [hl], e
    add c
    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld e, [hl]
    and b
    nop
    rst $38
    xor d
    rst $38
    ld b, a
    ld a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    ld bc, $8700
    dec b
    adc a
    sbc b
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    ld [$42f0], sp
    db $fc
    ld c, d
    cp h
    adc b
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
    ld [hl], b
    ld c, b
    ldh a, [$c8]
    ld [hl], b
    ld c, b
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_79d7:
    nop
    ld d, $08
    jr jr_00b_79fa

    db $10
    ld a, $12
    inc a
    nop
    nop
    nop

Jump_00b_79e3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_79fa:
    rrca
    nop
    jr nc, jr_00b_7a3d

    jp hl


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
    nop
    add b
    nop
    inc hl
    pop bc
    rlca
    db $e3
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [c], a
    inc e
    add b
    cp $40
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
    dec sp
    inc b
    ldh a, [$7f]
    ret nz

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
    add c
    ld e, $1c

jr_00b_7a3d:
    rst $38
    jr @+$01

    nop
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
    rlca
    rrca
    rst $20
    ld b, $ff
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    ld bc, $01fe
    cp $3e
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
    ld [$0807], sp
    rlca
    ld [$0807], sp
    rlca
    ld [$0907], sp
    rlca
    ld [$0b07], sp
    ld b, $00
    nop
    nop
    nop
    nop
    nop

jr_00b_7a96:
    ld sp, $400f
    rst $38
    inc h
    rst $38
    jr nc, @-$3e

    nop
    nop
    and b
    ld [hl], b
    add b
    ld [hl], b
    jr nz, jr_00b_7a96

    nop
    ldh a, [rLCDC]
    ldh a, [rP1]
    ldh a, [$a0]
    ld [hl], b
    ret nc

    ld h, b
    ld c, b
    ld [hl], b
    sbc b
    ld [hl], b
    ld c, b
    ld [hl], b
    xor b
    ld [hl], b
    adc b
    ld [hl], b
    ld e, b
    ld [hl], b
    adc b
    ld [hl], b
    ld c, b
    ld [hl], b
    ld de, $101e
    ld a, $20
    inc a
    ld l, h
    jr c, jr_00b_7add

    ld a, e
    ld h, $7f
    inc b
    ld a, e
    inc hl
    ld a, b
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    inc d
    rst $38
    or c

jr_00b_7add:
    sbc $30
    ld e, $48
    ldh a, [$08]
    ldh a, [$50]
    ldh a, [$ce]
    ld [hl], c
    ld b, b
    rst $38
    ld d, h
    rst $38
    ld b, [hl]
    ld hl, sp+$40
    ldh a, [rNR10]
    ld a, $12
    inc a
    ld [de], a
    inc a
    ld b, $fc
    ld [de], a
    db $fc
    ld [hl+], a
    db $fc
    ld d, $3c
    ld [de], a
    inc a
    nop
    nop
    ld bc, $0100
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    inc bc
    nop
    call nz, $c0f8
    ldh a, [$cc]
    ldh a, [$80]
    ld a, a
    inc h
    rra
    dec bc
    nop
    nop
    ld bc, $01c1
    adc $07
    ld c, $0f
    inc e
    rrca
    ld e, h
    sbc a
    jr @+$01

    add hl, de
    cp $09
    cp $c9
    cp $11
    rst $28
    ld b, a
    add e
    inc bc
    add e
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld sp, $c93f
    ldh a, [$91]
    pop hl
    add c
    pop hl
    ld hl, $01c1
    pop bc
    inc hl
    pop bc
    ld bc, $27c3
    jp Jump_00b_7e99


    dec c
    cp $c9
    cp $cd
    cp $c8
    rst $38
    ret c

    rst $38
    sbc h
    rst $38
    sbc b
    rst $38
    ld b, a
    ccf
    rst $20
    rra
    rst $30
    ld a, a
    ld h, [hl]
    rst $38
    add a
    rst $38
    ld c, $ff
    rla
    rst $28
    ld b, $ff
    ld b, b
    add b
    ld b, b
    add b
    db $76
    add b
    nop
    cp $00
    cp $20
    ret nz

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$0d07], sp
    ld b, $01
    ld c, $01
    ld c, $09
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
    add b
    ld [hl], b
    jp $8070


    ld [hl], a
    sub b
    ld [hl], a
    db $10
    ld h, e
    nop
    nop
    nop
    nop
    nop
    nop
    xor b
    ld [hl], b
    sub l
    ld a, d
    ld hl, $84ff
    rst $38
    ld a, [$0000]
    nop
    nop
    nop
    nop
    nop
    ld [$4678], sp

Jump_00b_7be3:
    jr c, jr_00b_7be5

jr_00b_7be5:
    cp a
    add hl, de
    adc a
    inc c
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    db $76
    inc a
    nop
    db $fc
    ld b, h
    ld hl, sp+$00
    ldh a, [$60]
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    ret z

    ldh a, [$80]
    ldh a, [$c0]
    ldh a, [$80]
    ld [hl], b
    jr nz, jr_00b_7c0a

jr_00b_7c0a:
    nop
    nop
    nop
    nop
    nop
    nop
    ld [de], a
    inc a
    ld [de], a
    inc a
    ld [de], a
    inc a
    ld [hl-], a
    inc c
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0303
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
    and l
    jp $f708


    add d
    ld a, a
    ld c, b
    ccf
    inc b
    nop
    nop
    nop
    nop

Jump_00b_7c3d:
    nop
    nop
    nop
    add b
    rst $38
    inc d
    db $eb
    ld h, $c1
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
    ldh a, [$7f]
    inc bc
    db $fc
    ld [$e0f0], sp
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
    rst $20
    add b
    ld a, a
    ld b, b
    ccf
    dec de
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, sp
    cp $1d
    cp $21
    sbc [hl]
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
    ld b, a
    ccf
    ld [hl], d
    rrca
    jr c, jr_00b_7c8d

    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00b_7c8d:
    nop
    nop
    nop
    ld b, b
    add b
    ld [hl+], a
    call c, $fe00
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

    INCBIN "gfx/image_00b_7d2c.2bpp"

    jr nc, @+$7e

    ld e, [hl]
    ld h, b
    ld [hl+], a
    ld b, h
    ld [hl], h
    ld [$6040], sp
    ld b, b
    ld h, b
    nop
    ld h, b
    nop
    nop
    ld b, h
    adc c
    push bc
    adc c
    ld c, h
    add c
    push bc
    ld [$cd08], sp
    ld sp, $84fd
    ld a, c
    nop
    nop
    jp nc, Jump_00b_79e3

    add d
    adc b
    ld de, $0099
    ld de, $1199
    sbc c
    nop
    sbc c
    nop
    nop
    ld e, l
    adc [hl]
    rst $10
    jr @-$75

    db $10
    sub b
    add hl, bc
    ld bc, $0699
    sbc a
    db $10
    adc a
    nop
    nop
    ld [de], a
    inc a
    xor [hl]
    jr nc, @-$6e

    jr nz, @-$6c

    inc c
    inc c
    add [hl]
    ld [$a2be], sp
    inc e
    nop
    nop
    jp nc, Jump_00b_7be3

    add d
    adc c
    ld [de], a
    sbc e
    nop
    ld [de], a
    sbc e
    ld [de], a
    sbc e
    nop
    sbc e
    nop
    nop
    inc b
    scf
    ld d, e
    inc h

Call_00b_7e20:
    and c
    ld b, d
    jp Jump_000_1200


    db $e3
    ld h, d
    inc sp
    nop
    inc sp
    nop
    nop

    INCBIN "gfx/image_00b_7e2c.2bpp"

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_00b_7e99:
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

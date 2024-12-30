; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $011", ROMX[$4000], BANK[$11]

    nop
    nop
    nop
    nop
    nop
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

jr_011_401c:
    nop
    nop
    adc $86

Call_011_4020:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_011_4035

    ccf
    ccf
    nop
    nop
    nop
    nop
    nop

jr_011_4035:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop

jr_011_403e:
    call nz, Call_000_00ff
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_011_401c

    nop
    nop
    nop
    nop
    nop
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
    rlca
    nop
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
    nop
    nop
    nop
    nop
    jr nc, jr_011_403e

    db $fc
    ld a, [c]
    nop
    nop
    nop
    nop
    nop
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
    db $f4
    ld a, b
    nop

Jump_011_40a1:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    ld b, d
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
    nop
    nop
    ld c, c
    pop af
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_011_40f7:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [$f8], a
    nop
    nop
    nop
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
    ld [bc], a
    ld a, a
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
    add b
    nop
    add b
    ret nz

    inc bc
    ld bc, $0301
    ld bc, $0303
    inc bc
    rlca
    inc bc
    ld b, $03
    ld b, $07
    rlca
    ld b, $cf
    add [hl]
    and a
    adc $9e
    rst $08
    cp $cf
    rst $28
    rst $18
    ld e, a
    ei
    ld [hl], l
    ei
    pop af
    ld a, e
    inc de
    inc a
    sub b
    jr c, jr_011_415d

    jr nc, jr_011_4157

    ccf
    cp a
    ccf
    inc sp
    inc a
    cp b
    jr nc, jr_011_4187

    or b
    ccf
    rst $18
    ld a, [bc]
    rlca
    ld b, $03
    ld [bc], a

jr_011_4157:
    rst $00
    and $c3
    add d
    rlca
    ld [bc], a

jr_011_415d:
    rlca
    ld b, $03
    call c, $f8ec
    inc c
    ld a, [de]
    inc c
    jr jr_011_4174

    jr jr_011_4176

    ld [$181c], sp
    inc c
    ld [$0c1c], sp
    inc c
    inc e
    inc c

jr_011_4174:
    inc c
    inc c

jr_011_4176:
    inc e
    inc c
    inc c
    inc c
    ld a, [de]
    inc c
    jr jr_011_418a

    jr @+$0e

    inc b
    rrca
    ld b, $0c
    ld b, $0c
    dec b

jr_011_4187:
    ld c, $07
    rrca

jr_011_418a:
    dec c
    ld c, $0e
    inc c
    inc c
    inc c
    rst $08
    ld [hl-], a
    inc bc
    ld b, $03
    ld b, $03
    or $e3
    or $e3
    ld b, $02
    rlca
    ld b, $03
    ld b, $06
    ld b, $06
    ld b, $06
    ld c, $06
    inc c
    ld b, $0c
    ld b, $06
    inc c
    jr jr_011_41bc

    db $fc
    ld a, [hl]
    ld l, a
    rst $00
    ld h, e
    jp Jump_011_43e3


    ld e, e
    rst $20
    rst $38
    ld a, [hl]

jr_011_41bc:
    ld a, [hl]
    db $fc
    rst $38
    ld c, [hl]
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
    ld bc, $1f00
    ccf
    ld [hl], $79
    ldh a, [$60]
    xor $70
    ld a, a
    ccf
    dec e
    inc bc
    ld bc, $0301
    pop bc
    rrca
    add a

Jump_011_41e2:
    sub a
    ld c, $1e
    inc e
    inc a
    jr @-$46

    jr c, @-$46

    ldh a, [$b8]
    ldh a, [$90]
    ld sp, hl
    db $e3
    rst $20
    and $6f
    ld e, [hl]
    ld c, $0e
    inc e
    inc e
    inc e
    jr jr_011_4218

    ld e, b
    inc e
    cp $cc
    ei
    db $fd
    add a
    dec e
    dec e
    rrca
    rla
    rrca
    dec e
    rrca
    dec c
    rra
    rra
    dec e
    ld a, [hl-]
    dec a
    cp $fc
    sub a
    adc $ca
    rst $00
    adc [hl]
    rst $00

jr_011_4218:
    cp $cf
    call c, $f8fe
    db $fc
    xor l
    sbc $ef
    ld [hl], b
    ldh [rSVBK], a
    ldh [rSVBK], a
    ld h, b
    rst $38
    ld a, a
    rst $38
    ld l, a
    ldh a, [rSVBK]
    ldh [rNR41], a
    ldh a, [rLCDC]
    add b
    nop
    nop
    nop
    nop
    ld b, b
    add b
    ret nz

    add b
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    ld b, $0d
    ld b, $02
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
    ld a, c
    ld [hl], e
    add hl, hl
    ld [hl], c
    jr nz, jr_011_4257

    nop

jr_011_4257:
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
    or b
    sbc $bf
    add d
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
    sub a
    rrca
    rst $38
    rst $18
    call c, $0080
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$efdd], a
    rst $18
    sub b
    rrca

jr_011_4286:
    nop
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
    db $ec
    rst $08
    rst $38
    add b
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
    ld [hl], a
    db $ec
    rst $38
    rst $20
    ret nz

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
    db $e3
    inc bc
    or e
    pop af
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
    ld a, h
    sbc b
    ld hl, sp-$10
    jr nc, jr_011_4286

    nop
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
    jp Jump_011_41e2


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
    db $d3
    rst $28
    cp $7f
    db $76
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $dd
    sbc a
    sub a
    rrca
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
    and $cf
    ld b, a
    add e
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
    ei
    ld a, c
    add sp, -$0f
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
    jp z, $85c7

    jp Jump_000_0081


    nop
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
    ldh a, [$3f]
    rst $38
    jr nz, jr_011_4365

    nop
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

jr_011_4365:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, d
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
    ld [$be00], sp
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
    nop
    nop
    ld e, l
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
    nop
    nop
    nop
    nop
    nop
    rst $00
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
    rlca
    nop
    adc l
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
    ldh a, [rP1]
    ld a, [$00f4]
    nop
    nop

Jump_011_43e3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $09
    nop
    nop
    nop
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
    add sp, -$10
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    ld bc, $0f00
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
    add c
    nop
    add l
    jp RST_00


    nop
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
    db $f4
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
    sbc b
    ld h, b
    db $fc
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
    inc bc
    nop
    rra
    rrca
    rrca
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
    ldh a, [rP1]
    db $fc
    ld hl, sp-$04
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
    ld bc, $0100
    nop
    nop
    ld bc, $0101
    ld bc, $7501
    adc $d7
    xor $ff
    xor $df
    xor $ef
    cp $ba
    rst $38
    cp [hl]
    ei
    ld [hl], a
    cp e
    cp $7f
    ret nc

    ld h, b
    ret c

    ld h, b
    pop hl
    ld a, [hl]
    rst $38
    ld a, [hl]
    db $ec
    ld [hl], b
    ret nc

    ld h, b
    ret nc

    ld h, b
    db $fd
    rst $38
    or e
    ld a, l
    ld l, e
    ld sp, $3163
    db $eb
    ld sp, $316b
    ld a, c
    inc hl
    ld l, a
    ld sp, $8227
    ld b, a
    add d
    jp $2306


    add [hl]
    ld b, e
    add [hl]
    jp $c306


    ld b, $d3
    ld b, $8e
    rlca
    adc l
    ld b, $8c
    ld b, $8e
    rlca
    rrca
    rlca
    adc h
    rlca
    adc l
    ld b, $27
    inc c
    dec c
    or $0d
    ld b, $0d
    ld b, $5d
    and $e5
    cp $ec
    ld b, $0f
    ld b, $07
    ld b, $1b
    dec c
    dec de
    dec c
    dec de
    dec c
    dec de
    dec c
    dec bc
    dec e
    rrca
    add hl, de
    dec e
    add hl, de
    dec d
    add hl, sp
    db $fc
    ld hl, sp-$12
    sbc h
    adc h
    adc [hl]
    push bc
    adc [hl]
    xor $9c
    ld a, [$f4fc]
    ld hl, sp-$06
    cp h
    nop
    nop
    ld bc, $0100
    ld bc, $0101
    ld bc, $0000
    nop
    nop
    nop
    nop
    inc bc
    ld a, [hl]
    cp $df
    ldh [$c0], a
    add b
    call c, $fde0
    cp $46
    ccf
    ld [bc], a
    rlca
    add e
    rlca
    rra
    rrca
    dec sp
    inc e
    jr nc, @+$3a

    jr c, jr_011_45b8

    ld [hl], b
    ld h, b
    ldh [$60], a
    ld h, b
    ldh [$f0], a
    ld h, c
    rst $08
    rst $00
    xor a
    adc $8c
    inc e
    jr c, jr_011_4574

    jr c, jr_011_4572

    jr c, jr_011_4574

jr_011_455c:
    jr jr_011_4596

    db $fc
    sbc b
    cp h
    db $fc
    ld e, $0c
    inc b
    ld c, $06
    ld c, $04
    ld c, $0c
    ld c, $1e
    inc c
    inc e
    inc e
    rst $28
    rst $38

jr_011_4572:
    db $e3
    rst $00

jr_011_4574:
    db $e3
    pop bc
    db $e3
    pop bc
    rst $08
    db $e3
    rst $38
    rst $38
    db $fd
    cp $de
    rst $38
    ld e, $0c
    sbc h
    adc h
    call z, $de9c
    adc l
    adc a
    sbc a
    adc h
    rra
    ld [$0c1c], sp
    inc e

jr_011_4590:
    stop
    nop
    nop
    nop
    nop

jr_011_4596:
    jr nz, jr_011_4590

    ldh a, [$f8]
    jr c, jr_011_455c

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0101
    nop
    nop
    nop
    nop

jr_011_45b8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, l
    or e
    and c
    inc de
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld sp, hl
    ld a, [hl]
    cp a
    ld a, [hl]
    jr jr_011_45d6

jr_011_45d6:
    nop
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
    push bc
    ei
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
    cp [hl]
    rst $38
    ei
    rst $30
    pop bc
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
    ld [hl], h
    rst $38
    rst $28
    rst $30
    add $01
    nop
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
    rlca
    ei
    db $e3
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
    dec sp
    pop af
    ld sp, hl
    pop hl
    ld hl, $00c0
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc $8e
    ld c, a
    add [hl]
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
    inc bc
    inc bc
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
    ld a, [hl]
    adc a
    db $fd
    cp $40
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
    ld [hl], e
    ld a, a
    ld a, a
    ccf
    ld [bc], a
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
    call z, $9f9e
    rrca
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
    call c, $f838
    ldh a, [$d0]
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
    db $eb
    rst $00
    pop hl
    jp $c061


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret z

    sbc h
    call z, $9fdf
    rst $08
    dec c
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
    ld b, b
    or b
    ldh a, [$f8]
    ld e, b
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
    ld d, e
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
    nop
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
    nop
    inc e
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
    ld [hl], b
    nop
    ei
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
    dec bc
    rla
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop

jr_011_477e:
    pop hl
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
    ret nc

    jr nz, jr_011_477e

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
    ld h, $f8
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
    jr nz, jr_011_47ac

jr_011_47ac:
    ld a, l
    ld a, [hl]
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
    dec c
    rlca
    add a
    rrca
    add $0f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, b
    nop
    rst $38
    db $fc
    db $fd
    cp $76
    adc h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    inc bc
    ld b, $06
    rlca
    rlca
    rlca
    rrca
    rlca
    dec c
    rlca
    dec c
    rlca
    rst $18
    rst $38
    rst $30
    ret c

    db $fc
    jp c, $ffda

    sbc $ff
    ld d, d
    db $fc
    ld d, d
    db $fc

jr_011_482e:
    jr nc, jr_011_482e

    push af
    cp $f5
    ld a, [hl]
    dec a
    ld h, [hl]
    or l
    ld l, [hl]
    or a
    ld l, h
    dec a
    ld h, [hl]
    ld [hl], $6d
    and a
    ld a, h
    db $ed
    ld sp, $31ac
    xor h
    ld sp, $21fd
    xor l
    ld sp, $21fd
    xor l
    ld sp, $e53b
    sub e
    cp $f3
    add [hl]
    db $e3
    add [hl]
    cp a
    or $f3
    cp $93
    and $63
    add [hl]
    ld h, [hl]
    add e
    di
    rra
    db $d3

jr_011_4863:
    ld e, $b7
    ld e, $f3
    ld e, $bf
    ld d, $fb
    rla
    db $db
    scf
    xor d
    ld [hl], a
    ret c

    ldh [$6c], a
    ldh a, [$fc]
    jr nc, jr_011_4863

    jr nc, jr_011_48e5

    ldh a, [$f0]
    ldh [$f8], a
    ret nz

    db $ec
    ldh a, [$1f]
    rrca
    dec bc
    inc e

jr_011_4884:
    ld a, $18
    jr c, jr_011_48a7

    rrca
    rra
    ld [$0007], sp
    nop
    inc c
    jr nc, jr_011_4884

    rst $00
    ld c, [hl]
    add a
    dec c
    ld c, $df
    inc c
    xor c
    call c, $f8de
    ld e, [hl]
    ld hl, sp+$5f
    ld hl, sp-$11
    di
    ei
    daa
    cpl
    ld b, $05

jr_011_48a7:
    ld c, $0c
    ld c, $0f
    inc c
    rrca
    inc c
    dec e
    ld l, [hl]
    adc a
    cp $cf
    ld b, $82
    rlca
    add e
    rlca
    add d
    rlca
    ld b, $07
    adc a
    ld b, $07
    ld c, $e3
    ld a, a
    rst $30
    ld h, c
    ld sp, hl
    ld h, b
    ld sp, hl
    ld h, b
    rst $38
    ld h, c
    rst $30
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $20
    adc [hl]
    or $ce
    rst $28
    adc $f6
    rst $08
    rst $28
    rst $08
    rst $28
    adc a
    call $cd0e
    ld c, $00
    nop
    add b
    nop
    nop

jr_011_48e5:
    nop
    ld a, [hl]
    db $fc
    cp $fc
    push bc
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
    inc bc
    dec c
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
    cp [hl]
    ld a, a
    inc sp
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
    rst $38
    rst $38
    rst $30
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
    db $fd
    rst $38
    ld a, [hl]
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
    xor a
    di
    push af
    ei
    pop de
    jr nz, jr_011_4977

jr_011_4977:
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
    and $d3
    and $c2
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $70
    sbc $30
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
    ld a, [hl]
    ld sp, $3f3f
    rrca
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
    db $ec
    rst $18
    cp a
    rst $08
    rlc a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or $ef
    rst $08
    rst $20
    ld h, e
    add e
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $dd
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
    rst $38
    ld h, a
    ld a, c
    ld h, e
    ld sp, hl
    ld h, b
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
    xor l
    adc $dd
    xor $d7
    rst $28
    adc a
    ld h, a
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
    ld a, [$fafc]
    db $fc
    pop af
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc b
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    xor [hl]
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
    nop
    nop
    nop
    nop
    and c
    jp RST_00


    nop
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
    rst $00
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
    inc b
    nop
    ld e, a
    cp a
    ld e, a
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
    inc bc
    inc a
    inc a
    rst $38
    ccf
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rra
    cp a
    ccf
    ccf
    rst $38
    or a
    ld a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call nc, $dee8
    ldh [$fc], a
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
    add hl, bc
    rlca
    rrca
    rlca
    rlca
    rrca
    rlca
    rrca
    rlca
    rrca
    rlca
    rrca
    dec c
    rrca
    add hl, bc
    rrca
    ld sp, hl
    rst $38
    cp h
    rst $38
    inc d
    rst $38
    db $f4
    rst $38
    push af
    rst $18
    sub h
    rst $38
    sub h
    rst $38
    db $fd
    rst $38
    sbc e
    rst $38
    sub c
    rst $38
    sub c
    rst $38
    sbc l
    rst $38
    sbc l
    rst $38
    sub e
    db $fd
    sub c
    rst $38
    sub c
    rst $38
    cpl
    rst $38
    dec de
    rst $38
    ld l, c
    cp a
    dec de
    db $fd
    dec hl
    rst $38
    ld l, $ff
    ld l, $ff
    cp e
    rst $28
    rlca
    db $e3
    rla
    and $07
    db $f4
    ld e, a
    and a
    rst $30
    rlca
    ret nz

    inc bc
    ldh [rP1], a

jr_011_4bde:
    ld e, e
    db $e4
    xor a
    rst $18
    rst $08
    add hl, de
    rst $18
    jr jr_011_4c04

    ldh a, [$bf]
    ldh a, [$fe]
    ldh a, [$df]
    ld [hl], b
    ld [hl], b
    rst $38
    or a
    ld a, e
    cp a
    ld h, c
    ld [hl], l
    ld h, c
    db $dd
    ld h, c
    db $fd
    ld b, c
    db $fd
    ld b, c
    db $db
    ld h, l
    ld b, l
    ei
    daa
    rst $38
    xor a
    di

jr_011_4c04:
    xor l
    di
    push hl
    cp e
    xor e
    rst $30
    rst $38
    cp a
    ccf
    cp $7e
    cp a
    ld [hl], a
    cp b
    ld [hl], a
    cp b
    rst $38
    or b
    rst $18
    cp a
    ld e, a
    cp a
    rst $18
    ccf
    or a
    jr c, jr_011_4bde

    ld [hl], b
    nop
    nop
    add b
    nop
    add b
    nop
    add $f8
    db $fc
    ret nz

    ld [$80c0], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or $ff
    push de
    ld [bc], a
    nop
    nop

jr_011_4cc6:
    nop
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
    rst $38
    inc e
    rst $28
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
    ld sp, hl
    rst $28
    db $ec
    res 5, c
    nop
    nop
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
    rst $38
    daa
    rst $18
    adc e
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
    nop
    db $d3
    rst $38
    cp [hl]
    rst $18
    ld c, l
    sbc [hl]
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
    ld h, e
    rst $38
    or a
    ld a, a
    ccf
    ld a, [hl]
    ccf
    inc e
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    rst $28
    ccf
    dec hl
    ld [hl], a
    rst $28
    inc sp
    ld l, [hl]
    ld sp, $0021
    nop
    nop
    nop
    nop
    nop
    nop
    scf
    ld hl, sp+$3f
    ldh a, [$b1]
    cp $df
    cp a
    cp a
    rra
    dec e
    rlca
    nop
    nop
    nop
    nop
    add b
    nop
    nop
    nop
    jr z, jr_011_4cc6

    db $ec
    ret nc

    db $fc
    ret nz

    call nc, $0080
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_011_4df4:
    nop
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
    ld bc, $ff00
    ld a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $1d00
    rlca
    cp $7f
    ld [hl], a
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    ld b, b
    ret nz

    rst $38
    ret


    or $3b
    ret nz

    jr c, jr_011_4df4

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    rlca
    rrca
    rrca
    rlca
    rlca
    rrca
    ld bc, $070f
    rrca
    rlca
    rrca
    ld b, $0f
    cp [hl]
    rst $38
    db $ed
    cp $fc
    rst $38
    xor d
    rst $38
    or e
    rst $38
    pop hl
    ei
    or b
    rst $38
    rst $28
    rst $38
    dec bc
    rst $38
    ld a, [de]
    rst $28
    ld e, e
    xor a
    ld e, b
    xor a
    adc d
    ld a, a
    inc b
    rst $38
    ld d, h
    rst $38
    db $f4
    rst $38
    inc b
    ld hl, sp+$28
    call nc, $fc02
    push bc
    rst $38
    push de
    ld [$c0b5], a
    ld a, h
    add b
    nop
    db $fc
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
    nop
    nop
    nop
    nop
    nop
    add hl, bc
    rlca
    inc bc
    nop
    nop
    nop

jr_011_5036:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, [hl]
    rst $38
    ld [de], a
    rst $28
    dec hl
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
    rst $10
    rst $38
    cp e
    rst $30
    ld h, e
    cp a
    adc b
    scf
    rla
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr z, jr_011_5036

    nop
    db $fc
    nop
    db $fc
    call nc, $c0ff
    rst $38
    rst $38
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
    ld bc, $0300
    ld bc, $0102
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $fc
    nop
    ld a, [$05f8]
    ld hl, sp-$05
    nop
    ld b, c
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
    ld l, b
    ret nz

    ld [hl], $cb
    xor $91
    nop
    nop
    nop
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
    rst $28
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
    ld hl, sp-$80
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0100
    ld bc, $0000
    nop
    nop
    nop
    ld c, e
    ld a, $75
    ld a, $2b
    ld a, [hl]
    rst $38
    ld hl, sp+$05
    ld hl, sp-$06
    nop
    ld [hl], c
    ld c, $53
    ld a, $da
    and c
    ld c, a
    or b
    dec c
    ldh a, [$7b]
    and h
    reti


    ld h, $bc
    rlca
    ld c, h
    rla
    inc a
    rst $00
    ld l, [hl]
    ld e, l
    cp b
    rrca
    ret z

    ccf
    adc d
    ld a, a
    ld [hl-], a
    call $c11e
    add $b9
    sbc [hl]
    db $fd
    db $f4
    cp d
    ld a, c
    or $f5
    cp $b5
    cp $bf
    cp b
    ld sp, $fdfe
    cp $49
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld l, l
    ld a, $77
    ld a, $7f
    ld a, $fb
    db $fc
    db $dd
    ld hl, sp-$03
    nop
    nop
    nop
    nop
    nop
    db $fd
    add [hl]
    res 4, h
    ld d, h
    and b
    call nc, Call_011_4020
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, c
    cp [hl]
    ret c

    ld c, $a0
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, $c0
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
    rlca
    ld e, $1f
    ld a, $37
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call nc, Call_011_7a00
    nop
    sbc $01
    dec d
    ld l, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [$ff00]
    ldh [$fb], a
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
    rst $38
    pop hl
    or $c1
    nop
    nop
    nop
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
    rst $38
    jp RST_00


    nop
    nop
    nop
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

    nop
    nop
    nop
    nop
    nop
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
    rst $30
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
    nop
    nop
    nop
    nop
    cp e
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
    ld a, [bc]
    nop
    ld e, $1f
    rla
    ld e, $0a
    nop
    nop
    nop
    nop
    nop
    rst $38
    ld a, c
    ld a, a
    ld a, c
    db $fd
    ld a, c
    or $09
    or [hl]
    ld bc, $00ed
    ld d, $78
    ld a, a
    ld a, c
    or a
    call z, $9cef
    rst $38
    sbc h
    ld a, a
    sbc h
    ld a, a
    adc h
    cp a
    nop
    ld e, e
    nop
    rst $18
    ldh [$9b], a
    ret nz

    db $ed
    add b
    db $dd
    add d
    pop de
    adc [hl]
    call c, Call_011_6f8f
    adc a
    ld d, a
    adc a
    ld a, a
    adc a
    db $ed
    jp Jump_000_00fa


    cp [hl]
    nop
    adc e
    inc [hl]
    and d
    dec e
    cp a
    inc e
    cp l
    ld e, $dd
    ld a, $f9
    add b
    ld c, c
    ld bc, $71bd
    ld c, e
    pop af
    ld hl, sp-$7f
    pop bc
    add b
    ld b, b
    add b
    ld [hl], h
    cp c
    db $ec
    di
    pop af
    xor $de
    db $ed
    ret z

    rst $38
    ld d, b
    rst $28
    xor $01
    rrca
    pop af
    ld a, [$fce5]
    pop hl
    rst $38
    xor $7f
    xor $78
    rst $28
    ld [hl], a
    add sp, $71
    xor $7f
    xor $ef
    ld a, [hl]
    ld sp, hl
    sbc $d9
    cp $db
    rst $38
    jp c, $dbff

    rst $38
    db $db
    rst $38
    db $db
    rst $38
    ret


    cp $f8
    ld c, $ba
    ld l, [hl]
    xor $fa
    call $2cfa
    jp z, Jump_011_78ef

    ld [c], a
    db $fd
    ld h, [hl]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld e, $1f
    inc bc
    ld e, $00
    nop
    nop
    nop
    nop
    nop
    ld a, a
    ld a, c
    ld a, a
    ld a, c
    rst $38
    ld a, c
    jp c, $ec01

    nop
    sub b
    nop
    nop
    nop
    nop
    nop
    db $eb
    call nz, $8cff
    rst $38
    inc e
    or a
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    cp a
    ld c, [hl]
    ld sp, hl
    ld b, $5d
    nop
    dec c
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
    ld c, h
    ld [hl], a
    nop
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
    rst $18
    add hl, sp
    ei
    ld bc, $0028
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp c, $ebed

    call c, RST_00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp hl


    ld e, $e6
    jr jr_011_5715

jr_011_5715:
    nop
    nop
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
    ei
    inc b
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
    ld bc, $1a0e
    dec c
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
    ld e, [hl]
    and b
    xor a
    ld d, b
    ld a, e
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
    ld [de], a
    dec c
    ld [hl], l
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
    nop
    nop
    nop
    and l
    ld b, d
    rst $28
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
    ld [c], a
    ld bc, $13eb
    nop
    nop
    nop
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
    ld e, h
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
    sbc [hl]
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
    ld d, l
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
    nop
    ld bc, $8600
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
    nop
    nop
    cp d
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
    nop
    ld e, $80
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, [hl]
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
    rlca
    ld c, $02
    dec c
    ld [bc], a
    nop
    nop
    nop
    nop
    nop
    dec bc
    inc e
    dec bc
    inc e
    ld a, [bc]
    dec e
    ld [c], a
    dec e
    or a
    ld c, b
    ei
    inc b
    add hl, bc
    ld e, $1b
    inc c
    rst $30
    ld l, c
    ld e, a
    pop hl
    db $eb
    pop de
    di
    pop bc
    sub a
    ld l, c
    ld a, [hl]
    ld bc, $0a15
    db $76
    add hl, sp
    ld a, [hl-]
    db $dd
    sbc $b8
    or $98
    ret nc

    cp h
    ld [hl], $d8
    add $38
    or d
    ld e, h
    ld h, a
    sbc b
    rst $38
    inc bc
    inc a
    inc bc
    ld d, $08
    inc bc
    inc e
    dec bc
    inc e
    dec bc
    inc e
    rrca
    inc e
    jr jr_011_592f

    ld l, l
    sub b
    ld a, [hl]
    add b
    dec e
    ld [bc], a
    dec de
    inc b
    ld [bc], a
    dec c
    dec b
    ld c, $07
    ld c, $ef
    adc [hl]
    rst $10
    add sp, -$55
    nop
    ld a, [bc]
    rlca
    ld [hl], b
    rrca
    db $db
    db $e4
    ld l, d
    ret nc

    ld h, b
    ret nz

    rla

jr_011_592f:
    db $e3
    inc bc
    ld bc, $0383
    add a
    inc bc
    add a
    inc bc
    add b

jr_011_5939:
    inc bc
    inc bc
    nop
    ld bc, $4300
    add e
    xor [hl]
    db $d3
    sbc [hl]
    ei
    ld e, [hl]
    cp e
    ld e, [hl]
    cp e
    ld e, [hl]
    cp e
    ld sp, hl
    rlca
    dec d
    db $eb
    xor h
    db $db
    sbc c
    ld a, $1c
    cp b
    sbc d
    inc a
    inc e
    cp e
    sbc h
    dec sp
    jp c, $dc3c

    jr c, jr_011_59db

    cp b
    ei
    inc bc
    db $eb
    ld [hl], e
    db $e3
    ld [hl], e
    xor e
    ld [hl], e
    cp e
    ld b, e
    adc e
    ld [hl], e
    db $eb
    ld [hl], e
    db $ed
    ld [hl], e
    rst $18
    sbc l
    rst $18
    sbc l
    rst $18
    sbc l
    rst $18
    sbc l
    rst $18
    sbc l
    rst $18
    sbc l
    rst $18
    sbc l
    xor a
    db $dd
    rst $20
    jr jr_011_5939

    ld b, a
    add a
    rst $00
    add d
    rst $38
    sub a
    ld hl, sp-$5a
    rst $00
    and a
    rst $00
    and a
    rst $00
    ld l, b
    db $fc
    ld c, d
    db $fc
    ld c, d
    db $fc
    ld a, [hl]
    ret z

    ld e, [hl]
    add sp, $60
    sbc $49
    or $5d
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

jr_011_59db:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0f00
    ld b, $0d
    ld b, $01
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, bc
    ld e, $1a
    dec e
    inc [hl]
    set 3, d
    inc h
    ld hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, e
    push hl
    db $eb
    pop de
    jp nc, Jump_011_40a1

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
    and d
    rst $28
    add b
    ld hl, $a0c0
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
    add hl, sp
    sub [hl]
    ld l, b
    ld l, h
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
    dec a
    adc $9f
    jr nz, @+$20

    nop
    nop
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
    jp $047b


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
    rst $00
    rlca
    ld b, $83
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call c, $f63b
    jr jr_011_5a69

    nop
    nop
    nop
    nop

jr_011_5a69:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ccf
    ld [$2017], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and d
    ld a, l
    ld a, a
    add b
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
    ld d, h
    xor e
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
    rst $28
    jr jr_011_5b02

    nop
    nop
    nop
    nop
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
    or $c2
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_011_5ade:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_011_5b02:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [bc]
    nop
    ld d, h
    ccf
    ld [de], a
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
    jr nz, jr_011_5ade

    add c
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
    ld a, b
    nop
    ld [$00fc], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$1400], sp
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
    nop
    nop
    inc e
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
    nop
    nop
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
    nop
    nop
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
    add d
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
    nop
    nop
    nop
    nop
    add [hl]
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
    jr z, jr_011_5bae

jr_011_5bae:
    call nz, Call_000_00ff
    nop
    nop
    nop
    nop
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
    dec h
    jr jr_011_5bd1

jr_011_5bd1:
    nop
    nop
    nop
    nop
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
    nop
    nop
    ld a, $c0
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, $0000
    nop
    nop
    nop
    dec b
    ld a, [hl-]
    jr z, jr_011_5c69

    ld a, $01
    nop
    nop
    nop
    nop
    ret nz

    ld h, e
    add l
    ld h, e
    add l
    ld h, [hl]
    dec b
    and $82
    rst $20
    nop
    db $e3
    and b
    ld h, c
    and h

Call_011_5c3f:
    ld h, e
    ld bc, $98fc
    dec c
    inc d
    dec c
    ld de, $c40d
    dec e
    sub b
    db $fd
    ld c, c
    db $fc
    add h
    db $fc
    jr nz, @+$01

    ld h, d
    pop bc
    pop bc
    add b
    ld b, b
    add b
    ret nz

    add b
    nop
    ret nz

    and b
    ret nz

    nop
    ldh [rSC], a
    sbc a
    sub d
    call z, $c028
    nop
    ldh [$a0], a

jr_011_5c69:
    ld h, b
    ret nc

    ld h, b
    db $10
    ldh [$9a], a
    db $ec
    add [hl]
    jp $e013


    sub b
    ld h, b
    ld e, c
    jr nc, jr_011_5c85

    inc sp
    ld [de], a
    ccf
    inc h
    ccf
    ld h, h
    ccf
    ld b, b
    ld hl, sp-$20
    inc e
    ld [de], a

jr_011_5c85:
    inc c
    ld [$001c], a
    db $fc
    ld a, b
    add b
    nop
    nop
    adc h
    ld b, $01
    ld bc, $0303
    ld b, $03
    ld b, $03
    rlca
    ld bc, $0001
    ld bc, $0300
    inc bc
    inc bc
    rst $38
    dec sp
    rst $18
    inc de
    sbc a
    ld a, [de]
    sbc a
    ld l, c
    sbc a
    nop
    rst $38
    ld d, d
    db $fd
    dec bc
    db $fc
    ld b, [hl]
    add a
    ld b, [hl]
    add a
    ld c, h
    add a
    ld b, [hl]
    add a
    ld b, [hl]
    add a
    add [hl]
    rst $00
    inc c
    rst $00
    ld h, $cf
    ld d, c
    xor a
    inc c
    rlca
    adc [hl]
    rlca
    inc e
    rst $20
    nop
    rst $38
    xor [hl]
    rlca
    ld b, $07
    inc c
    rlca
    dec e
    ld c, $1c
    ld c, $99
    ld c, $0c
    ld c, $9d
    ld c, $0d
    ld c, $9c
    ld c, $cc
    rrca
    ld [de], a
    ccf
    ld a, [de]
    dec a
    db $10
    dec a
    jr c, jr_011_5d05

    db $10
    dec a
    jr c, jr_011_5d09

    add hl, sp
    dec e
    or d
    dec e
    ld [$98ff], sp
    ldh [$81], a
    ldh [$f3], a
    call z, $ef90
    ld [c], a
    ret nz

    add b
    ldh [$80], a
    ldh [rNR32], a
    rst $28
    call c, $ccff

jr_011_5d05:
    rst $38
    call c, $1cff

jr_011_5d09:
    rst $38
    reti


    rst $38
    jp c, $d9ff

    rst $38
    ldh a, [$e0]
    ret z

    ldh a, [$c8]
    ldh a, [$c8]
    ldh a, [$c8]
    ldh a, [rLCDC]
    ld hl, sp+$14
    ld hl, sp+$34
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
    inc h
    dec de
    inc h
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
    adc c
    ld h, a
    ld bc, $2eee
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
    ret nc

    inc c
    inc d
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
    adc a
    ld [hl], c
    ld b, b
    ccf
    nop
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
    ld l, d
    rst $00
    ld b, h
    add e
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
    inc e
    di
    ld d, b
    pop hl
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
    ld a, c
    adc [hl]
    ld b, [hl]
    db $fc
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
    ld b, $07
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
    ld e, b
    sbc h
    add d
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
    add hl, bc
    cp $40
    ld a, $18
    nop
    nop
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
    ld b, a
    add b
    rst $38
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
    add c
    rst $38
    ret


    ld a, $06
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, $ff
    add e
    ld a, h
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
    ld b, $fd
    ret nz

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
    ld e, b
    rst $38
    rla
    add sp, -$80
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc [hl]
    ld hl, sp-$08
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    cp h
    ld b, b
    cp $fc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, $1f
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    adc b
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

Jump_011_5ee7:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld e, b
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
    nop
    nop
    nop
    nop
    ld bc, $0080
    nop
    nop
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
    nop
    rst $38
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
    ld b, b
    nop
    add c
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
    add c
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
    cp h
    jp RST_00


    nop
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
    nop
    rla
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
    and b
    nop
    and $e3
    nop
    nop
    nop
    nop
    nop
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
    ld [bc], a
    ld bc, $0000
    nop
    nop
    nop
    ld bc, $0103
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, a
    cp h
    ld b, $0c
    rlca
    inc c
    ld b, $fc
    db $fc
    cp $fc
    ld c, $0c
    ld b, $05
    ld c, $7f
    ccf
    rst $28
    ld [hl], e
    ld b, e
    db $e3
    db $e3
    jp $f36f


    cp a
    ld a, a
    ccf
    ccf
    rst $30
    ld a, e
    cp a
    ccf
    dec sp
    ld [hl], b
    ld [hl], b
    ld h, b
    ldh a, [$60]
    ld [hl], b
    ld h, b
    or b
    ld h, b
    jr z, jr_011_602e

    jr nc, jr_011_5ff8

    rst $00
    adc a
    push hl
    adc $f4
    ld h, b
    ld [hl], b
    ld h, b
    ld h, b
    jr nc, jr_011_603b

    jr nc, jr_011_6031

    jr nc, jr_011_603e

    db $76
    jp Jump_011_62c1


    pop hl
    ld h, b
    ld [hl], b
    ld a, b
    jr nc, jr_011_5fec

    add hl, sp
    rla
    dec de
    ld a, $1b
    rla
    dec sp
    ld hl, sp-$10
    ld e, h
    cp b
    inc e
    inc c
    db $ec
    inc e
    db $fc
    ld hl, sp+$70
    add b

jr_011_5fec:
    nop
    nop
    add [hl]
    ld b, $01
    nop
    ld bc, $0301
    ld bc, $0301

jr_011_5ff8:
    inc bc
    ld bc, $0100
    nop
    nop
    nop
    ld bc, $fc7f
    and a
    call z, $8c05
    rrca
    adc h
    or l
    call z, $fcde
    ld a, h
    db $fc
    sub $ec
    add e
    pop bc
    add c
    pop bc
    add c
    pop bc
    add e
    pop bc
    add c
    pop bc
    pop bc
    pop bc
    ld h, e
    pop bc
    pop bc
    ld h, e
    adc e
    or l
    add c
    add b
    add c
    add b
    and d
    sbc l
    sbc a
    cp a
    sbc [hl]
    add c
    add c
    add b

jr_011_602e:
    ld bc, $c180

jr_011_6031:
    ret nz

    add c
    ret nz

    add c
    ret nz

    pop bc
    ret nz

    pop bc
    ret nz

    pop bc

jr_011_603b:
    ret nz

    pop bc
    ret nz

jr_011_603e:
    pop de
    ret nz

    ret nz

    pop bc
    pop bc
    ret nz

    ret nz

    pop bc
    pop hl
    ret nz

    pop bc
    ret nz

    pop bc
    ret nz

    ld h, c
    ret nz

    pop hl
    ret nz

    rst $38
    rst $18
    ei
    rst $00
    jp $c3c7


    rst $00
    db $e3
    rst $00
    jp $e3c7


    rst $00
    db $e3
    rst $00
    jp nz, $c0fd

    nop
    nop
    nop
    ld [hl+], a
    dec e
    adc a
    rra
    rrca
    nop
    add b
    nop
    nop
    nop
    ld h, a
    rst $20
    rst $28
    rst $20
    rst $28
    rst $20
    rst $20
    rst $28
    rst $20
    rst $28
    ld a, [hl]
    rst $28
    ld a, [hl]
    rst $28
    db $ed
    cp $1e
    cp h
    ld e, $bc
    db $fc
    cp [hl]
    cp [hl]
    cp $ff
    cp $f7
    cp $7a
    rst $38
    ld [hl], e
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
    ld bc, $0100
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
    rst $30
    inc c
    rst $38
    db $fc
    inc c
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
    db $d3
    db $e3
    add e
    jp RST_00


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp h
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
    nop
    nop
    db $e3
    rst $20
    add e
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
    ei
    di
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
    nop
    nop
    nop
    nop
    add $fe
    cp $fc
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
    nop
    inc bc
    inc bc
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
    nop
    nop
    ld b, h
    adc h
    ld b, $0c
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
    inc hl
    ld a, a
    ccf
    ld a, $1e
    nop
    nop
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
    nop
    rra
    ccf
    ld [bc], a
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
    ei
    call c, $df8f
    add [hl]
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [$effd]
    rst $18
    ld b, [hl]
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
    rst $38
    rst $28
    rst $18
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
    ccf
    ret nz

    rst $18
    rst $38
    sbc c
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
    ld a, h
    cp $ce
    db $fc
    ld c, h
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
    ld l, e
    rst $30
    and e
    ld [hl], a
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
    ld a, a
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
    sbc e
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
    inc e
    jr nz, jr_011_6211

jr_011_6211:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_011_6280

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_011_6230

jr_011_6230:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    ld b, b
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
    ld hl, $bf1e
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
    ret nz

    nop
    add c
    ret nz

jr_011_6280:
    nop
    nop
    nop
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
    ld b, b
    nop
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
    nop
    nop
    nop
    nop
    adc e
    rlca
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
    nop
    nop
    db $ec
    ld hl, sp-$04
    ld hl, sp+$00

Jump_011_62c1:
    nop
    nop
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
    jr nz, jr_011_632f

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
    ret nz

    nop
    ret nz

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

Jump_011_62f3:
    nop
    nop
    nop
    nop
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
    ld a, [hl]
    rlca
    ld [bc], a
    ld b, $03
    ld b, d
    ccf
    ld a, [hl]
    ccf
    ld e, $03
    ld [bc], a
    inc bc
    ld b, $03
    db $dd
    ld a, $e7
    ld a, [hl]
    call nc, Call_011_7667
    rst $00
    db $f4
    ld a, a
    cp [hl]
    ld a, a
    db $fd
    ld a, $ef
    db $76
    ld a, l
    cp $d7
    xor $e2
    add a
    db $e3
    add e
    pop hl
    add e
    and c
    jp $c3f1


    ld a, a

jr_011_632f:
    db $e3
    cp $78
    rst $08
    ld a, h
    and l
    ld c, [hl]
    rst $00
    ld b, $c6
    inc bc
    jp $e303


    inc bc
    ld [c], a
    ld a, a
    inc a
    ld a, [hl]
    daa
    ld a, [hl]
    ld b, $03
    cp a
    rlca
    rst $38
    ld a, [hl]
    ld l, h
    ldh a, [rSVBK]
    ret nz

    ld a, e
    pop hl
    nop
    nop
    add c
    nop
    add c
    ld bc, $0101
    add b
    ld bc, $0000
    nop
    nop
    ld b, c
    add b
    rst $38
    ld a, h
    sub $ed
    add $8d
    add $8d
    push de
    xor $ff
    db $fc
    cp $7c
    db $f4
    xor $83
    pop bc
    and e
    pop bc
    add e
    pop bc
    and e
    pop bc
    jp $e3c1


    pop bc
    db $e3
    pop bc
    db $d3
    ld h, e
    ld c, l
    or e
    ld b, b
    add c
    nop
    add c
    pop de
    cp a
    ld a, a
    cp a
    inc e
    add e
    pop bc
    add b
    add b
    ld bc, $c081
    pop bc
    add b
    add c
    ret nz

    add c
    ret nz

    add b
    ret nz

    and c
    ret nz

    add b
    ret nz

    and b
    ret nz

    ld b, b
    ret nz

    ldh [$c0], a
    ret nz

    ret nz

    ld b, b
    ret nz

    ldh [$c0], a
    ret nz

    ret nz

    ldh [$c0], a
    ret nz

    ret nz

    rst $38
    rst $08
    ld c, a
    pop hl
    ld b, e
    pop hl
    ld b, e
    pop hl

jr_011_63b8:
    ld b, e
    pop hl
    ld b, c
    pop hl
    ld b, e
    pop hl
    ld b, e
    pop hl
    rst $28
    ldh a, [$a0]
    add b
    add b
    add b
    add d
    add a
    rst $08
    add a
    add a
    add b
    add b
    add b
    ret nz

    add b
    ld a, h
    jr jr_011_63ef

    jr @+$1e

    jr jr_011_640f

    call c, $f8fc
    jr @-$02

    add hl, bc
    inc e
    add hl, de
    inc e
    ld a, c
    ld [hl], b
    ld hl, sp+$71
    ldh a, [$79]
    ld a, c
    ld sp, hl
    ld a, a
    ld sp, hl
    db $eb
    db $dd
    rst $38
    rst $08
    rst $08

jr_011_63ef:
    rst $08
    ldh [$e0], a
    ldh a, [$e0]
    ldh a, [$e0]
    ldh [$f0], a
    ldh a, [$f0]
    cp b
    ldh a, [$30]
    cp b
    jr c, jr_011_63b8

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_011_640f:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld a, $3c
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
    push af
    add $c6
    nop
    nop
    nop
    nop
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
    ld a, [hl]
    ld a, [de]
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
    nop
    nop
    rst $38
    ld a, $0a
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
    ei
    ld a, a
    ld e, $3f
    ld [$0000], sp

Call_011_6467:
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
    add c
    add e
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
    and a
    call z, $048e
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
    ld h, e
    ld a, a
    ld a, a
    ld a, $16
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp d
    ld bc, $3f2f
    ld e, $3f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc e
    db $fc
    rst $18
    cp a
    dec de
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
    jp c, $fffc

    rst $18
    sbc e
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
    nop
    ld d, c
    rst $28
    rst $18
    rst $28
    push hl
    jp z, RST_00

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [$80], a
    rst $20
    rst $30
    scf
    rst $20
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
    add hl, bc
    dec e
    ld a, l
    ld sp, hl
    ei
    ld sp, hl
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
    add a
    rst $08
    adc a
    rst $00
    rst $00
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
    sbc b
    jr c, jr_011_654f

    jr jr_011_6551

    jr jr_011_651f

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_011_651f:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_011_654f:
    nop
    nop

jr_011_6551:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec c
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
    nop
    ld h, l
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
    and e
    ld a, h
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
    ld c, $00
    adc a
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
    ld bc, $1f0c
    dec c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and $19
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
    nop
    nop
    rst $00
    jr c, @+$01

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
    inc b
    nop
    ld b, l
    adc [hl]
    rst $18
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
    ld [$1a00], sp
    inc e
    sbc a
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
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    ei
    rst $30
    and a
    ccf
    ld c, $3d
    dec sp
    db $fd
    rst $20
    rst $38
    ld d, a
    ccf
    rlca
    ccf
    adc $3d
    cp h
    rst $38
    ld h, $ff
    jp c, Jump_011_5ee7

    db $e3
    jp z, Jump_011_62f3

    ei
    and [hl]
    ei
    rst $30
    cp [hl]
    push hl
    ei
    rst $30
    ei
    ld [hl], d
    sbc h
    db $dd
    ld a, [de]

jr_011_66a8:
    ld c, a
    sbc e
    sbc d
    ld c, a
    ccf
    adc $da
    rst $38
    ret nc

    ldh [rLCDC], a
    ld hl, sp+$3c
    ld h, b
    db $fc
    ld h, b
    ret nc

    ldh [$c0], a
    nop
    call nc, Call_011_6c00
    or b
    inc a
    ccf
    ld l, [hl]
    ld [hl], a
    ld e, h
    ld h, a
    call c, Call_011_6467
    ld a, a
    ld a, h
    ccf
    dec a
    ld a, $7f
    db $76
    di
    add [hl]
    and e
    add $f3
    add [hl]
    or e
    add $b3
    add $b3
    add $f3
    add $5f
    and $b5
    adc $8d
    ld b, $c5
    ld b, $4f
    cp $fd
    cp $a7
    ld e, [hl]
    add a
    ld b, $86
    ld b, $8f
    inc c
    adc a
    inc c
    adc a
    inc c
    add a
    inc c
    adc a
    inc c
    add a
    inc c
    adc a
    inc c
    add a
    inc c
    rrca
    dec c
    rra
    inc c
    ld c, $0c
    rra
    inc c
    adc l
    inc c
    rrca
    inc c
    rrca
    inc c
    adc a
    inc c
    rst $38
    db $fc
    ld a, h
    jr nc, jr_011_674d

    jr nc, jr_011_6754

    jr nc, jr_011_6796

    jr nc, jr_011_6757

    jr nc, jr_011_6759

    jr nc, jr_011_675b

    jr nc, jr_011_66a8

    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    ld l, e
    rst $38
    rst $38
    rst $38
    rst $08
    ccf
    inc bc
    inc bc
    inc bc
    inc bc
    sbc a
    ld c, $de
    rrca
    rst $08
    rra
    rst $08
    rra
    ccf
    sbc a
    ld e, e
    sbc a
    db $fd
    dec de
    rra
    cp c
    cp l
    ld e, $5c
    ld a, $9f
    ld a, $ff
    ld a, $ff
    ld a, $36
    rst $38
    rst $38

jr_011_674d:
    rst $30
    rst $30
    rst $30
    nop
    nop
    add b
    nop

jr_011_6754:
    nop
    nop
    nop

jr_011_6757:
    nop
    add b

jr_011_6759:
    nop
    add b

jr_011_675b:
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
    ld bc, $0000
    nop
    nop
    nop

jr_011_6796:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor $f9
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
    ld e, l
    cp [hl]
    inc d
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
    rst $30
    ld a, e
    ld [hl], b
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
    db $ec
    ldh a, [$d8]
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
    ld e, l
    and $a5
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
    ld l, l
    cp $fe
    inc a
    ld [hl+], a
    jr jr_011_67f7

jr_011_67f7:
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
    rlca
    db $fc
    rst $38
    rst $38
    ld a, h
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sub h
    rst $28
    db $fd
    rst $38
    cp $7d
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
    ccf
    call z, $fdff
    cp $fd
    inc l
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp h
    ld [hl], b
    db $fd
    cp $fd
    cp $1e
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
    rst $18
    inc hl
    rst $38
    rst $38
    ld a, [hl]
    rst $38
    jr z, jr_011_684a

jr_011_684a:
    nop
    nop
    nop
    nop
    nop

jr_011_684f:
    nop
    ld a, e
    cp c
    db $f4
    add hl, sp
    db $fd
    jr nc, jr_011_684f

    jr nc, jr_011_6869

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $eb
    rst $30
    rst $38
    db $e3
    di
    db $e3
    ld b, e
    db $e3
    inc bc

jr_011_6869:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop
    ld b, b
    add b
    and b
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
    ld a, [bc]
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
    rlca
    inc bc
    daa
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
    nop
    nop
    cp l
    jp nz, $f68f

    nop
    nop
    nop
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
    rra
    ld [hl], a
    sbc a
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
    rrca
    rst $18
    rst $38
    add sp, -$01
    nop
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
    and $f6
    rst $08
    or $cf
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_011_696a:
    rst $30
    jr jr_011_696a

    ld a, [hl-]
    ei
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
    ld bc, $0101
    nop
    nop
    nop
    ld bc, $0000
    ld bc, $0000
    nop
    nop
    ld bc, $ff00
    rst $38
    dec a
    rst $38
    ei
    ld l, l
    ld e, l
    rst $38
    db $fd
    rst $38
    rst $38
    ld a, a
    or a
    ld a, a
    rst $08
    ld a, a
    ld a, [hl]
    rst $38
    rst $28
    rst $38
    or l
    rst $38
    cp a
    rst $38
    cp a
    cp $1a
    db $fc
    ret c

    rst $38
    ld l, l
    rst $38
    rrca
    rst $08
    ld l, [hl]
    db $db
    ld h, [hl]
    db $db
    ld [hl], e
    sbc a
    sbc $1f
    ld e, $0f
    adc $0f
    ld a, [de]
    rst $38
    sub h
    rst $38
    db $d3
    cp h
    or d
    db $dd
    rla
    rst $38
    sub a
    rst $38
    sub c
    rst $38
    sub e
    db $fc
    sub a
    ld hl, sp-$4d
    adc $5a
    rst $20
    ld h, e
    sbc $9b
    and $ef
    sub $92
    rst $28
    ld l, e
    sub $73
    adc $b7
    ld e, a
    rst $30
    add hl, de
    ld [hl], l
    sbc e
    ld [hl], a
    sbc c
    or e
    ld e, l
    push af
    dec de
    ld [hl], a
    sbc c
    ld [hl], e
    sbc l
    sbc b
    ldh [$f8], a
    add b
    ret c

    and b
    xor $9f
    rst $28
    sbc a
    db $e3
    sbc a
    ld hl, sp-$80
    ret c

    and b
    or $cf
    ld [hl], a
    rst $08
    rst $30
    rst $08
    rst $18
    rst $28
    rst $38
    rst $08
    db $dd
    rst $28
    ld a, l
    rst $08
    ld c, a
    db $fd
    ei
    inc a
    cp e
    ld a, h
    cp a
    ld a, h
    ld a, a
    cp h
    ccf
    db $fc
    cp l
    cp $ed
    cp $fd
    xor $c0
    nop
    ret nz

    nop
    ret nz

    nop
    ret nz

    nop
    ret nz

    nop
    ldh [rP1], a
    ldh [rP1], a
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
    or d
    rst $08
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
    and a
    ld a, a
    ld hl, $0006
    nop
    nop
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
    ld [de], a
    ld c, e
    ld [de], a
    nop
    nop
    nop
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
    ldh a, [$7b]
    rst $30
    ld d, e
    daa
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
    ld h, $ff
    cp a
    rst $38
    sbc $bf
    ld a, [bc]
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc de
    db $fd
    rst $30
    rst $38
    rst $30
    rst $38
    sbc [hl]
    ld [hl], c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, sp-$80
    add $f8
    rst $28
    rst $38
    ld e, a
    rst $28
    ld [bc], a
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, d
    db $dd
    ld c, d
    db $fd
    ld a, [$ffdd]
    ret c

    ld b, h
    sbc b
    nop
    nop
    nop
    nop
    nop
    nop
    rst $30
    xor $f7
    xor $de
    rst $20
    rst $08
    and $3f
    add $06
    nop
    nop
    nop
    nop
    nop
    ldh [rP1], a
    and b
    ld b, b
    ldh a, [rP1]
    ldh [rP1], a
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

Call_011_6c00:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $6b00
    ccf
    ld l, e
    rst $38
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
    dec [hl]
    ld a, a
    push af
    rst $38
    or l
    rst $18
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $fc
    nop
    nop
    db $fc
    ld c, b
    db $fc
    ld [bc], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0100
    nop
    nop
    nop
    nop
    nop
    ld bc, $ff00
    rst $38
    ld a, l
    rst $38
    dec a
    rst $38
    ei
    rst $38
    push af
    ei
    rst $28
    di
    db $fd
    rst $38
    ld e, l
    rst $38
    xor d
    rst $38
    push de
    rst $38
    ld l, d
    rst $38
    xor d
    rst $38
    ld a, [$aaff]
    rst $38
    xor d
    rst $38
    sub l
    rst $38
    push af
    sbc a
    ld b, l
    rst $38
    sub a
    rst $38
    or l
    rst $38
    ld [hl], a
    rst $38
    or a
    rst $38
    sub [hl]
    rst $38
    ld [de], a
    rst $38
    nop
    db $fc
    ld [bc], a
    db $fc
    ld [bc], a
    db $fc
    add d
    db $fc
    ld [bc], a
    db $fc
    add d
    db $fc
    add b
    cp $80
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    and b
    ld e, a
    ld a, [de]
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
    adc d
    rst $38
    cp a
    rst $38
    call Call_011_5c3f
    inc bc
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
    ld e, d
    rst $38
    db $e3
    cp $37
    ld a, [$3ae5]
    ld [hl+], a
    nop
    nop
    nop
    nop
    nop
    adc b
    cp $80
    cp $80
    cp $84
    ld a, [$8af4]
    ld a, h
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

Call_011_6f8f:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    ld e, [hl]
    and c
    push af
    rst $38
    ld a, [$fef5]
    push af
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
    nop
    push af
    rrca
    reti


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
    add b
    nop
    db $e4
    jr nc, jr_011_6fe1

jr_011_6fe1:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc bc
    inc bc
    rlca
    inc bc
    dec b
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    inc bc
    rlca
    ld a, [c]
    push af
    ld l, e
    push af
    ld [$eef5], a
    pop af
    xor $f1
    rst $28
    ldh a, [$ee]
    pop af
    ld [$9df1], a
    ld h, a
    push af
    ld l, a
    ld h, l
    rst $38
    and c
    ccf
    add l
    ccf
    push hl
    ccf
    push af
    ld l, a
    push hl
    ld a, a
    inc [hl]
    rst $28
    db $76
    db $ed
    db $76
    rst $28
    ld h, a
    cp a
    rst $30
    add hl, hl
    cp a
    ld h, c
    ld [hl], l
    rst $28
    dec c
    or $60
    ret nz

    ldh [rP1], a
    ld h, b
    add b
    and b
    ret nz

    ldh [$80], a
    ldh [$80], a
    ld h, b
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
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    ld bc, $0707
    nop
    nop
    nop
    nop
    nop
    cp $e1
    xor a
    ldh a, [rIE]
    ldh [$b5], a
    ld [$e03e], a
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    ldh [$7f], a
    ld e, a
    ldh [$ba], a
    ld b, b
    xor l
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, hl
    call nc, $00f4
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
    ld [$3f00], sp
    ld a, h
    ld a, e
    ld a, h
    ld a, e
    ld a, h
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
    rst $38
    rst $30
    rst $28
    di
    ld a, a
    db $e3
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
    ld a, h
    add b
    ld d, [hl]
    add c
    ld e, d
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
    ld [$f500], sp
    ld c, $bb
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
    di
    rst $30
    rst $38
    rst $30
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add sp, -$80
    ld a, [$0085]
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $78fe
    rst $38
    ld a, b
    ld a, l
    ld hl, sp+$7b
    ld hl, sp-$0a
    ld hl, sp-$09
    ld hl, sp-$01
    ldh a, [$f9]
    ld a, [c]
    rst $30
    db $e3
    ld a, a
    db $e3
    rst $10
    ld h, e
    db $dd
    ld h, e
    ei
    ld b, e
    push hl
    ld c, e
    rst $30
    add hl, bc
    rst $30
    add hl, bc

jr_011_7410:
    ld b, h
    add e
    rlca
    add e
    ld d, a
    add e
    ld a, a
    add c
    ld a, a
    add c
    dec h
    add e
    ld b, a
    add e
    rst $00
    inc bc
    rra
    call nz, $dcbf
    rst $28
    call c, $dcaf
    cp a
    call c, $dcaf
    cp a
    call c, $dcaf
    rst $30
    rst $30
    rst $38
    rst $30
    rst $28
    rst $30
    rst $30
    rst $30
    rst $38
    rst $30
    rst $28
    rst $30
    rst $28
    rst $30
    rst $28
    rst $30
    rst $38
    add l
    rst $18
    cp l
    cp a
    cp l
    xor $95
    db $eb
    add l
    xor a
    sbc l
    rst $18
    cp l
    ld a, a
    sbc l
    db $ec
    ret nc

    db $eb
    ret nc

    ld [$ced5], a
    db $fd
    ld [c], a
    call c, $f0ca
    adc h
    ldh a, [$8b]
    pop af
    ld a, a
    di
    cp $e3
    rst $38
    xor $fe
    rst $28
    rst $38
    inc bc
    ccf
    ld bc, $3bfd
    rst $18
    ld hl, sp-$49
    ld l, l
    sub a
    ld h, h
    ld h, e
    call c, $ffd9
    db $db
    db $fc
    db $db
    db $fc
    sub h
    db $fd
    ccf
    call nc, $80e0
    add b
    add b
    ld b, b
    add b
    ld b, b
    add b
    and b
    add b
    add b
    add b
    add b
    add b
    jr nz, jr_011_7410

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_011_74e7:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0100
    nop
    nop
    nop
    nop
    nop
    nop
    db $fd
    ld a, [c]
    db $ec
    di
    db $e4
    di
    db $ec
    di
    rra
    ldh [rNR41], a
    nop
    nop
    nop
    nop
    nop
    and a
    add hl, de
    add $19
    db $76
    add hl, de
    rst $20
    jr jr_011_74e7

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, a
    add e
    rst $00
    rrca
    dec l
    sub e
    rst $38
    nop
    and h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp [hl]
    db $dd
    ld a, e
    add h
    db $d3
    inc b
    ld e, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call c, Call_011_7ff7
    add b
    ld a, l
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
    ld h, d
    sbc l
    ld a, a
    add b
    cp c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, h
    or c
    and $30
    nop
    nop
    nop
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
    ret nz

    xor b
    nop
    nop
    nop
    nop
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
    inc c
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
    ld [hl], b
    nop
    ld c, c
    ldh a, [$dc]
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
    ld [c], a
    ld bc, $c3f3
    sbc c
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
    rst $38
    nop
    ld a, a
    add b
    ld e, a
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
    dec a
    ret nz

    sbc l
    ld h, d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, b
    ld [hl], b
    cp b
    ld h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_011_7667:
    nop
    nop
    nop
    nop
    nop
    jr jr_011_76ce

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
    nop
    nop
    rra
    ldh [$fb], a
    db $e4
    nop
    nop
    nop
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
    sub h
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
    inc l
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

jr_011_76ce:
    add hl, hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

jr_011_7705:
    nop
    nop

jr_011_7707:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_011_7714:
    nop
    nop
    nop
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
    ld bc, $0100
    ld bc, $0301
    ld bc, $0301
    inc bc
    inc bc
    db $ed
    pop de
    rst $38
    pop bc
    xor l
    db $d3
    xor c
    rst $10
    cp e
    rst $00
    push hl
    sbc e
    inc h
    db $db
    ld b, a
    cp b
    xor c
    db $d3
    ei
    add e
    db $db
    and e
    ld d, e
    xor e
    ld e, a
    and e
    rst $08
    inc sp
    or a
    ld l, e
    ld l, a
    or e
    ld h, b
    add b
    jr nz, jr_011_7714

    ld h, b
    add b
    ld a, a
    add b
    ld d, l
    xor d
    ld a, [hl]
    add b
    and b
    ld b, b
    ld b, b
    add b
    rst $20
    jr @+$20

    jr c, jr_011_7783

    jr c, jr_011_7705

    jr c, jr_011_7707

    jr c, jr_011_7789

    jr c, jr_011_778b

    jr c, jr_011_778d

    jr c, jr_011_7799

    ldh a, [$f0]
    ld l, b
    add sp, $70
    ldh a, [rBCPS]
    ld a, b
    ldh [$f0], a
    ld l, b
    ld a, b
    ldh [$f8], a
    ld h, b
    ld hl, sp+$60
    ld l, b

jr_011_7783:
    ldh a, [$f8]
    ld h, b
    ld a, b
    ldh [$78], a

jr_011_7789:
    ldh [$78], a

jr_011_778b:
    ldh [$79], a

jr_011_778d:
    ldh [$78], a
    ldh [$cb], a
    ldh a, [$f1]
    ldh [$f9], a
    ldh [$cf], a
    ldh a, [$fe]

jr_011_7799:
    pop hl
    rst $18
    ldh [$c1], a
    ldh a, [$f0]
    ldh [$57], a
    db $e3
    rst $10
    db $e3
    db $d3
    rst $20
    ld d, a
    db $e3
    db $d3
    ld h, a
    rst $10
    rst $20
    rst $10
    rst $20
    sub [hl]
    rst $28
    dec sp
    db $e4
    ccf
    ldh [$3a], a
    push hl
    ld [hl], $ef
    cp l
    ld l, [hl]
    rst $38
    ld h, b
    rst $30
    ld l, b
    ld a, a
    ldh [$03], a
    rlca
    ld b, $0f
    adc a
    ld c, $9f
    ld c, $8f
    nop
    nop
    nop
    ld [$1d00], sp
    ld e, $7b

jr_011_77d1:
    adc [hl]
    db $ed
    ld e, $3f
    inc e
    sbc c
    inc a
    call z, $ed39
    jr jr_011_77d1

    db $eb
    rst $18
    db $eb
    ld a, e
    or l
    xor a
    ld [hl], b
    db $f4
    rst $28
    cp $e7
    sbc $e7
    add $ef
    rst $18
    xor $9c
    ld l, a
    xor l
    sbc $bd
    add $d5
    xor [hl]
    dec [hl]
    cp $8d
    or $b5
    adc $bc
    adc $bd
    add $c0
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    ret nz

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
    rlca
    inc bc
    ld b, $03
    ld b, $03
    inc b
    inc bc
    ld bc, $0000
    nop
    nop
    nop

jr_011_784e:
    nop
    nop
    ld [c], a
    dec e
    ld h, l
    sbc d
    sub e
    ld c, h
    ld e, [hl]
    add c
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $28
    inc sp
    push bc
    dec sp
    sbc d
    dec [hl]
    ccf
    nop
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and b
    ld b, b
    ld l, [hl]
    add b
    ld l, [hl]
    sub c
    ld e, a
    jr nz, jr_011_788d

    nop
    nop
    nop

Jump_011_787c:
    nop
    nop
    nop
    nop
    rra
    jr c, jr_011_784e

    db $f4
    ld e, l
    ld [c], a
    sub h
    nop
    nop
    nop
    nop
    nop
    nop

jr_011_788d:
    nop
    nop
    nop
    db $ec
    ld [hl], e

jr_011_7892:
    add hl, sp
    and $cf
    jr nc, jr_011_78f5

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc [hl]
    db $eb
    ld a, [$5725]
    xor b
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
    jr jr_011_7892

    sub h
    ld l, e
    rst $38
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
    rla
    xor $ff
    nop
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
    nop
    ld a, e
    ldh [rPCM34], a
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
    add d
    dec e
    adc a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_011_78ef:
    nop
    ld e, a
    and b
    rst $20
    nop
    nop

jr_011_78f5:
    nop
    nop
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
    ld bc, $001d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld sp, hl
    add [hl]
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
    inc c
    nop
    ld d, $0c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_011_797e

jr_011_797e:
    inc l
    jr jr_011_7981

jr_011_7981:
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
    ld b, b
    ccf
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
    nop
    nop
    nop
    dec h
    ret nz

    add d
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
    ld c, $00
    db $10
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
    ld b, $00
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
    rlca
    nop
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
    call c, Call_000_1020
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
    dec b
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
    nop
    ld h, d
    db $fc

Call_011_7a00:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr c, jr_011_7a20

jr_011_7a20:
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp l
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
    ld h, e
    call c, RST_00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld e, $2a
    ld e, $23
    ld e, $21
    ld e, $10
    ccf
    ld c, h
    inc sp
    ld d, d
    inc sp
    inc [hl]
    jr jr_011_7a93

jr_011_7a93:
    inc a
    ld d, b
    inc a
    ld c, d
    inc a
    ld [hl+], a
    ld a, h
    sub d
    ld l, h
    ld c, h
    and $28
    add $01
    ld [hl], b
    nop
    ld [hl], b
    nop
    ld [hl], b
    inc c
    ld [hl], e
    ld b, b
    ld a, a
    daa
    ld a, b
    ld d, b
    ld h, b
    sub b
    ld h, b
    ld b, b
    rra
    ld b, $03
    inc b
    inc bc
    ld b, [hl]
    add e
    inc b
    jp Jump_000_0386


    inc b
    inc bc
    nop
    rlca
    sub b
    xor $a2
    ld c, $80
    ld c, $84
    ld c, $80
    ld c, $88
    ld c, $88
    ld c, $88
    ld c, $0d
    ld b, $08
    rlca
    inc c
    rlca
    add hl, bc
    ld b, $0c
    rlca
    add hl, bc
    ld b, $0d
    ld b, $0d
    ld b, $00
    rlca
    ld [bc], a
    rlca
    ld [bc], a
    rlca
    nop
    rlca
    ld b, $07
    inc b
    rlca
    inc b
    rlca
    dec b
    rlca
    ld l, a
    add e
    add d
    inc bc
    inc bc
    inc bc
    ld d, [hl]
    xor e
    inc bc
    rst $38
    ld a, d
    add e
    ld bc, $0203
    ld bc, $8706
    ld b, d
    add a
    ld b, h
    add a
    ld b, $87
    ld b, [hl]
    add a
    inc c
    add a
    ld c, h
    add a
    ld c, l
    adc [hl]
    pop bc
    cp $44
    di
    sub $e1
    rst $00
    di
    jp z, Jump_011_40f7

    rst $38
    ld b, c
    cp $c8
    ld [hl], a
    nop
    nop
    add c
    nop
    ld bc, $4081
    add c
    nop
    add b
    nop
    nop
    nop
    nop
    add c
    inc bc
    pop bc
    ld a, [hl]
    call z, $80f2
    ldh [$99], a
    ldh [$c1], a
    ccf
    jr @+$09

    inc c
    rlca
    ld d, [hl]
    adc a
    ld [hl], b
    ccf
    ldh [$7f], a
    jp z, $d1f1

    pop hl
    add e
    pop hl
    and e
    pop bc
    xor a
    pop bc
    inc e
    rst $28
    ldh [$7f], a
    adc $f1
    call nc, $87e3
    db $e3
    and a
    jp $c7a3


    and [hl]
    rst $00
    ld [hl], $cf
    db $e3
    db $fc
    ld c, h
    di
    ld l, h
    di
    ld c, [hl]
    rst $30
    ld h, h
    rst $38
    ld b, b
    rst $38
    ld h, b
    rst $38
    call z, $c8f3
    rst $30
    ret nc

    ldh [$d0], a
    ldh [$df], a
    ldh [$c1], a
    cp $da
    ldh [$d0], a
    ldh [$c0], a
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
    ld [hl], e
    ld b, d
    ld [hl], c
    ld de, $6061
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor c
    add $03
    add $44
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
    jr nc, jr_011_7c22

    inc b
    ld a, e
    ld b, h
    ccf
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
    ld e, $03
    ld d, b
    sbc a
    ld de, $80ce
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
    adc [hl]
    add hl, de
    rst $28
    cp b
    ld b, a
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
    push bc
    ld a, $24
    rst $38
    dec [hl]
    jp $0080


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_011_7c00:
    ret nz

    ccf
    nop
    rst $38
    ld [de], a
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
    xor d
    ld bc, $f804
    inc b
    ld hl, sp+$20
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr z, jr_011_7c00

jr_011_7c22:
    jp nz, Jump_011_787c

    nop
    nop
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
    pop hl
    add c
    ld [hl], b
    jr nz, jr_011_7c36

jr_011_7c36:
    nop
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
    nop
    nop
    nop
    nop
    add hl, bc
    cp $82
    ld a, h
    jr z, jr_011_7c56

jr_011_7c56:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $24fe
    jr jr_011_7c65

jr_011_7c65:
    nop
    nop
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
    ld [hl+], a
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
    ld h, [hl]
    pop af
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
    nop
    ld c, e
    db $f4
    pop hl
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_011_7d80

    ld c, a
    ld d, d
    ld d, d
    ld c, c
    ld d, e
    jr nz, jr_011_7d5a

    jr nz, @+$22

    inc b
    jr nz, jr_011_7d5f

    jr nz, jr_011_7d61

    jr nz, jr_011_7d95

    ld d, l
    ld d, h
    ld c, b
    jr nz, jr_011_7d8a

    ld b, c
    ld c, e
    ld b, l
    ld d, d
    jr nz, jr_011_7d6e

    jr nz, @+$22

    jr nz, jr_011_7d52

jr_011_7d52:
    jr nz, jr_011_7d74

    ld c, h
    ld c, c
    ld c, [hl]
    ld b, h
    ld d, e
    ld b, c

jr_011_7d5a:
    ld e, c
    jr nz, jr_011_7da8

    ld b, l
    ld d, d

jr_011_7d5f:
    ld c, [hl]
    ld c, a

jr_011_7d61:
    ld c, b
    ld b, c
    ld c, [hl]
    jr nz, jr_011_7d86

    nop
    jr nz, @+$22

    jr nz, jr_011_7db6

    ld b, c
    ld d, d
    ld b, l

jr_011_7d6e:
    ld c, [hl]
    jr nz, @+$4d

    ld b, l
    ld d, d
    ld c, [hl]

jr_011_7d74:
    ld c, a
    ld c, b
    ld b, c
    ld c, [hl]
    jr nz, jr_011_7d9a

    jr nz, jr_011_7d7c

jr_011_7d7c:
    jr nz, jr_011_7d9e

    jr nz, jr_011_7da0

jr_011_7d80:
    jr nz, jr_011_7dd4

    ld c, a
    ld c, [hl]
    jr nz, jr_011_7dc7

jr_011_7d86:
    ld c, [hl]
    ld b, h
    jr nz, @+$4d

jr_011_7d8a:
    ld b, c
    ld b, [hl]
    jr nz, jr_011_7dae

    jr nz, jr_011_7db0

    inc b
    jr nz, @+$22

    jr nz, jr_011_7db5

jr_011_7d95:
    jr nz, @+$55

    ld d, l
    ld c, [hl]
    ld c, [hl]

jr_011_7d9a:
    ld e, c
    jr nz, @+$4f

    ld c, a

jr_011_7d9e:
    ld c, h
    ld c, h

jr_011_7da0:
    ld e, c
    jr nz, jr_011_7dc3

    jr nz, jr_011_7dc5

    inc b
    jr nz, jr_011_7dc8

jr_011_7da8:
    jr nz, jr_011_7dfe

    ld b, l
    ld d, e
    ld d, e
    ld b, c

jr_011_7dae:
    jr nz, jr_011_7df1

jr_011_7db0:
    ld c, [hl]
    ld b, h
    jr nz, jr_011_7e07

    ld c, c

jr_011_7db5:
    ld c, l

jr_011_7db6:
    ld c, a
    ld c, [hl]
    jr nz, jr_011_7dda

    inc b
    jr nz, jr_011_7ddd

    jr nz, jr_011_7ddf

    jr nz, jr_011_7de1

    jr nz, jr_011_7de3

jr_011_7dc3:
    ld c, e
    ld b, c

jr_011_7dc5:
    ld d, h
    ld c, c

jr_011_7dc7:
    ld b, l

jr_011_7dc8:
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_011_7dd4

    nop
    nop
    nop
    nop

jr_011_7dd4:
    jr nz, jr_011_7df6

    ld b, c
    jr nz, jr_011_7e29

    ld d, l

jr_011_7dda:
    ld c, e
    ld c, e
    ld b, c

jr_011_7ddd:
    jr nz, @+$49

jr_011_7ddf:
    ld b, c
    ld c, l

jr_011_7de1:
    ld b, l
    ld d, e

jr_011_7de3:
    jr nz, jr_011_7e31

    ld b, l
    jr nz, jr_011_7e08

    nop
    jr nz, jr_011_7e0b

    jr nz, @+$22

    jr nz, jr_011_7e0f

    jr nz, @+$22

jr_011_7df1:
    inc bc
    jr nz, jr_011_7e14

    jr nz, jr_011_7e16

jr_011_7df6:
    jr nz, jr_011_7e18

    jr nz, jr_011_7e1a

    jr nz, jr_011_7e1c

    jr nz, jr_011_7dfe

jr_011_7dfe:
    jr nz, jr_011_7e20

    ld b, a
    ld d, l
    ld d, e
    ld d, h
    ld b, c
    ld d, d
    ld c, c

jr_011_7e07:
    ld b, c

jr_011_7e08:
    jr nz, @+$46

    ld b, c

jr_011_7e0b:
    ld d, d
    jr nz, jr_011_7e5a

    ld b, c

jr_011_7e0f:
    ld d, e
    jr nz, jr_011_7e32

    nop
    nop

jr_011_7e14:
    jr nz, jr_011_7e36

jr_011_7e16:
    jr nz, jr_011_7e5f

jr_011_7e18:
    ld d, d
    ld b, c

jr_011_7e1a:
    ld b, e
    ld c, c

jr_011_7e1c:
    ld b, c
    ld d, e
    jr nz, jr_011_7e61

jr_011_7e20:
    jr nz, jr_011_7e76

    ld c, a
    ld b, h
    ld c, a
    jr nz, jr_011_7e47

    jr nz, jr_011_7e29

jr_011_7e29:
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    ld b, l

jr_011_7e31:
    ld c, h

jr_011_7e32:
    jr nz, jr_011_7e81

    ld d, l
    ld c, [hl]

jr_011_7e36:
    ld b, h
    ld c, a
    ld a, [bc]
    jr nz, @+$22

    jr nz, jr_011_7e5d

    jr nz, jr_011_7e3f

jr_011_7e3f:
    nop
    nop
    jr nz, jr_011_7e63

    jr nz, jr_011_7e65

    jr nz, jr_011_7e67

jr_011_7e47:
    jr nz, jr_011_7e69

    jr nz, jr_011_7e6b

    jr nz, @+$22

    jr nz, @+$05

    jr nz, jr_011_7e71

    jr nz, jr_011_7e73

    jr nz, jr_011_7e75

    nop
    jr nz, jr_011_7e78

    jr nz, jr_011_7e7a

jr_011_7e5a:
    jr nz, jr_011_7eac

    ld b, l

jr_011_7e5d:
    ld d, d
    ld c, a

jr_011_7e5f:
    jr nz, @+$55

jr_011_7e61:
    ld b, l
    ld d, d

jr_011_7e63:
    ld c, c
    ld b, c

jr_011_7e65:
    jr nz, jr_011_7e87

jr_011_7e67:
    jr nz, jr_011_7e89

jr_011_7e69:
    jr nz, jr_011_7e6b

jr_011_7e6b:
    nop
    jr nz, jr_011_7e8e

    jr nz, jr_011_7e90

    ld c, c

jr_011_7e71:
    ld c, [hl]
    ld d, h

jr_011_7e73:
    ld b, l
    ld d, d

jr_011_7e75:
    ld c, l

jr_011_7e76:
    ld c, c
    ld c, [hl]

jr_011_7e78:
    ld b, c
    ld b, d

jr_011_7e7a:
    ld c, h
    ld b, l
    jr nz, @+$22

    jr nz, jr_011_7ea0

    nop

jr_011_7e81:
    nop
    nop
    nop
    nop
    nop
    nop

jr_011_7e87:
    nop
    nop

jr_011_7e89:
    nop
    nop
    nop
    nop
    nop

jr_011_7e8e:
    nop
    nop

jr_011_7e90:
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

jr_011_7ea0:
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

jr_011_7eac:
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

Call_011_7ff7:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

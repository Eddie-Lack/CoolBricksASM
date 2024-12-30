; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $005", ROMX[$4000], BANK[$5]

    db $c0, $48, $4a, $46, $cc, $54, $0f, $47

    sbc $48
    xor h
    ld b, a
    cp c
    ld l, h
    and $49
    db $e4
    ld c, b
    cp b
    ld b, a
    ld b, l
    ld l, l
    db $fc
    ld c, c
    ret nz

    ld c, b
    inc a
    ld b, l
    and c
    ld b, e
    inc c
    ld b, h
    sbc $48
    inc h
    ld b, l
    push de
    ld b, d
    ret nz

    ld b, e
    db $e4
    ld c, b
    ld d, h
    ld b, l
    pop hl
    ld b, h
    ld d, h
    ld b, h
    ret c

    ld c, b
    ld c, b
    ld b, l
    ld d, l
    ld b, h
    ld a, [hl-]
    ld b, h
    ret nz

    ld c, b
    ld [hl], d
    ld c, b
    inc d
    ld [hl], a
    pop hl
    ld c, e
    sbc $48
    ld c, [hl]
    ld b, l
    sub [hl]
    ld b, h
    ld b, e
    ld b, h
    db $e4
    ld c, b
    ld a, b
    ld b, l
    db $fd
    ld b, [hl]
    add $44
    ret nz

    ld c, b
    call nz, $9d47
    ld l, l
    ld [de], a
    ld c, d
    sbc $48
    ld e, d
    ld b, l
    ld b, d
    ld b, l
    ld h, l
    ld b, h
    db $e4
    ld c, b
    ld c, [hl]
    ld c, b
    sbc $75
    add e
    ld c, e
    ret nz

    ld c, b
    cp [hl]
    ld b, a
    ld l, d
    ld l, l
    dec b
    ld c, d
    sbc $48
    ld [c], a
    ld b, a
    ld [hl], d
    ld l, a
    ld h, e
    ld c, d
    db $e4
    ld c, b
    call z, $8745
    ld c, h
    and $45
    ret nz

    ld c, b
    db $f4
    ld b, a
    rlca
    ld [hl], c
    sub d
    ld c, d
    sbc $48
    sub b
    ld b, l
    xor e
    ld c, b
    ld a, [bc]
    ld b, l
    db $e4
    ld c, b
    xor $47
    adc d
    ld [hl], b
    ld a, l
    ld c, d
    ret nz

    ld c, b
    and d
    ld b, l
    or d
    ld c, c
    ld b, e
    ld b, l
    sbc $48
    ld a, $46
    jr z, jr_005_40fa

    ld sp, hl
    ld b, [hl]
    db $e4
    ld c, b
    jr nc, jr_005_40f1

    ld c, c
    ld b, e
    ld [c], a
    ld b, e
    ret nz

    ld c, b
    ld l, h
    ld b, l
    ld c, l
    ld b, [hl]
    and b
    ld b, h
    sbc $48
    call c, $fd47
    ld l, [hl]
    ld d, d
    ld c, d
    db $e4
    ld c, b
    ld d, b
    ld b, [hl]
    rst $10
    ld d, h
    ld d, $47
    ret nz

    ld c, b
    jp z, $c847

    ld l, l
    inc hl
    ld c, d
    sbc $48
    ld hl, sp+$46
    sub l
    ld e, a
    or [hl]
    ld c, b
    db $e4
    ld c, b
    ld d, $47
    ld l, b
    ld h, c
    di
    ld c, b
    ret nz

    ld c, b
    adc d
    ld c, b
    inc l
    ld a, b
    ld hl, $de4c
    ld c, b
    inc c
    ld b, l
    rst $28
    ld b, b
    add d
    ld b, e
    db $e4

jr_005_40f1:
    ld c, b
    ld a, d
    ld b, [hl]
    ld b, h
    ld d, a
    adc l
    ld b, a
    ret nz

    ld c, b

jr_005_40fa:
    sub $47
    sbc [hl]
    ld l, [hl]
    ld b, c
    ld c, d
    sbc $48
    ld [hl], $45
    add h
    ld b, e
    rst $30
    ld b, e
    db $e4
    ld c, b
    jr jr_005_4151

    rst $38
    ld b, c
    sbc [hl]
    ld b, e
    ret nz

    ld c, b
    xor b
    ld b, l
    inc bc
    ld c, d
    ld d, b
    ld b, l
    sbc $48
    cp $46
    xor $5f
    cp a
    ld c, b
    db $e4
    ld c, b
    ld a, [bc]
    ld b, a
    add [hl]
    ld h, b
    pop de
    ld c, b
    ret nz

    ld c, b
    db $e4
    ld b, l
    add hl, sp
    ld c, [hl]
    jr nz, jr_005_4176

    sbc $48
    ld e, d
    ld c, b
    inc [hl]
    db $76
    sbc c
    ld c, e
    db $e4
    ld c, b
    add sp, $47
    rst $30
    ld l, a
    ld [hl], b
    ld c, d
    ret nz

    ld c, b
    ld d, h
    ld c, b
    ei
    ld [hl], l
    sub d
    ld c, e
    sbc $48
    xor [hl]
    ld b, l
    ld b, d
    ld c, d
    ld h, c
    ld b, l
    db $e4

jr_005_4151:
    ld c, b
    add h
    ld b, l
    and e

Call_005_4155:
    ld b, a
    add sp, $44
    ret nz

    ld c, b
    ret nc

    ld b, a
    ld hl, $2c6e
    ld c, d
    sbc $48
    sbc h
    ld b, l
    ld e, c
    ld c, c
    ld a, [hl+]
    ld b, l
    db $e4
    ld c, b
    ld a, [c]
    ld b, [hl]
    inc h
    ld e, a
    xor c
    ld c, b
    ret nz

    ld c, b
    ld [hl], b
    ld b, a
    rra
    ld l, c

jr_005_4176:
    adc [hl]
    ld c, c
    sbc $48
    inc b
    ld b, a
    dec [hl]
    ld h, b
    ret z

    ld c, b
    db $e4
    ld c, b
    ld a, [hl]
    ld c, b
    adc b
    ld [hl], a
    inc bc
    ld c, h
    ret nz

    ld c, b
    nop
    ld b, l
    ld b, a
    ld b, b
    ld h, b
    ld b, e
    sbc $48
    ldh [rDMA], a
    and a
    ld e, l
    ld a, [hl]
    ld c, b
    db $e4
    ld c, b
    ld [de], a
    ld c, b
    ld l, $73
    db $eb
    ld c, d
    ret nz

    ld c, b
    ld [$ce45], a
    ld c, [hl]
    ld sp, $de46
    ld c, b
    db $10
    ld b, a
    rlca
    ld h, c
    jp c, $e448

    ld c, b
    or [hl]
    ld b, [hl]
    db $fc
    ld e, d
    dec hl
    ld c, b
    ret nz

    ld c, b
    ld [hl+], a
    ld b, a
    ld b, [hl]
    ld h, d
    inc bc
    ld c, c
    sbc $48
    jr z, jr_005_420b

    db $e3
    ld h, d
    db $10
    ld c, c
    db $e4
    ld c, b
    cp h
    ld b, [hl]
    ld [hl], c
    ld e, e
    jr c, jr_005_4218

    ret nz

    ld c, b
    ld h, [hl]
    ld b, l
    jp c, $8b45

    ld b, h
    sbc $48
    or h
    ld b, l
    and e
    ld c, d
    adc [hl]
    ld b, l
    db $e4
    ld c, b
    ldh a, [rLYC]
    ld c, e
    ld c, a
    ld b, d
    ld b, [hl]
    ret nz

    ld c, b
    db $ec
    ld b, [hl]
    push bc
    ld e, [hl]
    sbc b
    ld c, b
    sbc $48
    sub [hl]
    ld b, l
    or $48
    rla
    ld b, l
    db $e4
    ld c, b
    inc c
    ld c, b
    db $dd
    ld [hl], d
    jp c, $c04a

    ld c, b
    ld h, b
    ld c, b
    ld d, e
    db $76
    and d
    ld c, e
    sbc $48
    ld a, [hl+]

jr_005_420b:
    ld b, l
    db $ec
    ld b, d
    push de
    ld b, e
    db $e4
    ld c, b
    jr @+$4a

    add e
    ld [hl], e
    db $fc
    ld c, d

jr_005_4218:
    ret nz

    ld c, b
    ld l, b
    ld b, [hl]
    add hl, bc
    ld d, [hl]
    ld c, [hl]
    ld b, a
    sbc $48
    and $46
    inc h
    ld e, [hl]
    adc a
    ld c, b
    db $e4
    ld c, b
    nop
    ld c, b
    sbc c
    ld [hl], c
    cp b
    ld c, d
    ret nz

    ld c, b
    db $76
    ld b, a
    ld e, [hl]
    ld l, c
    sbc e
    ld c, c
    sbc $48
    ld a, [hl]
    ld b, l
    ld c, d
    ld b, a
    db $db
    ld b, h
    db $e4
    ld c, b
    inc d
    ld b, [hl]
    db $d3
    ld d, c
    xor d
    ld b, [hl]
    ret nz

    ld c, b
    sub [hl]
    ld c, b
    jp c, Jump_005_4378

    ld c, h
    sbc $48
    ld b, $45
    add h
    ld b, b
    ld [hl], e
    ld b, e
    db $e4
    ld c, b
    jp c, $4e46

    ld e, l
    ld l, l
    ld c, b
    ret nz

    ld c, b
    ld a, [hl-]
    ld b, a
    sub h
    ld h, h
    inc sp
    ld c, c
    sbc $48
    ld h, d
    ld b, [hl]
    call z, Call_005_4155
    ld b, a
    db $e4
    ld c, b
    or b
    ld b, [hl]
    ld a, e
    ld e, d
    ld a, [de]
    ld c, b
    ret nz

    ld c, b
    ld c, b
    ld c, b
    or l
    ld [hl], l
    ld [hl], b
    ld c, e
    sbc $48
    and h
    ld b, [hl]
    db $dd
    ld e, c
    ld hl, sp+$47
    db $e4
    ld c, b
    or d
    ld b, a
    call z, $ef6c
    ld c, c
    ret nz

    ld c, b
    ld [$d546], sp
    ld d, b
    adc d
    ld b, [hl]
    sbc $48
    jr c, jr_005_42e2

    rst $20
    ld d, e
    ldh a, [rDMA]
    db $e4
    ld c, b
    inc [hl]
    ld b, a
    di
    ld h, e
    ld e, $49
    ret nz

    ld c, b
    ld b, h
    ld b, [hl]
    ld a, a
    ld d, h
    ld [bc], a
    ld b, a
    sbc $48
    or $45
    or b
    ld c, a
    ld d, e
    ld b, [hl]
    db $e4
    ld c, b
    sub b
    ld c, b
    add a
    ld a, b
    ld [hl-], a
    ld c, h
    ret nz

    ld c, b
    adc $46
    sbc [hl]
    ld e, h
    ld e, c
    ld c, b
    sbc $48
    call nc, $df46
    ld e, h
    ld h, b
    ld c, b
    db $e4
    ld c, b
    inc a
    ld c, b
    ld d, l
    ld [hl], l
    ld d, [hl]
    ld c, e
    ret nz

    ld c, b
    ld b, $48
    ld d, b
    ld [hl], d
    call $de4a
    ld c, b

jr_005_42e2:
    ld c, $46
    inc l
    ld d, c
    sub c
    ld b, [hl]
    db $e4
    ld c, b
    sbc [hl]
    ld b, [hl]
    xor b
    ld e, c
    rst $20
    ld b, a
    ret nz

    ld c, b
    ld h, [hl]
    ld c, b
    sub d
    db $76
    or a
    ld c, e
    sbc $48
    ld e, $45
    ld [hl], b
    ld b, d
    or e
    ld b, e

Call_005_4300:
    db $e4
    ld c, b
    add b
    ld b, [hl]
    ld [hl], l
    ld d, a
    sub [hl]
    ld b, a
    ret nz

    ld c, b
    cp d
    ld b, l
    jr @+$4d

    or c
    ld b, l
    sbc $48
    ld b, d
    ld c, b
    adc d
    ld [hl], l
    ld h, a
    ld c, e
    db $e4
    ld c, b
    xor b
    ld c, b
    db $dd
    ld a, c
    ld [hl], d
    ld c, h
    ret nz

    ld c, b
    xor d
    ld b, [hl]
    ld h, $5a
    dec c
    ld c, b
    sbc $48
    ld a, b
    ld c, b
    ld c, e
    ld [hl], a
    ld [$e44b], a
    ld c, b
    ld [hl], d
    ld b, l
    or h
    ld b, [hl]
    or c
    ld b, h
    ret nz

    ld c, b
    ld l, [hl]
    ld b, [hl]
    db $76
    ld d, [hl]
    ld h, e
    ld b, a
    sbc $48
    ret c

    ld b, l
    inc sp
    ld c, l
    ld a, [$e445]
    ld c, b
    add h
    ld c, b
    pop hl
    ld [hl], a
    db $10
    ld c, h
    ret nz

    ld c, b
    sbc $45
    cp h
    ld c, l
    rrca
    ld b, [hl]
    sbc $48
    ld [de], a
    ld b, l
    ld c, d
    ld b, c
    sub a
    ld b, e
    db $e4
    ld c, b
    sbc d
    ld b, a
    sub [hl]
    ld l, e
    rst $08
    ld c, c
    ret nz

    ld c, b
    ld l, h
    ld c, b
    or e
    db $76
    call z, $de4b
    ld c, b
    and [hl]
    ld b, a
    ld h, b
    ld l, h
    rst $18
    ld c, c

Jump_005_4378:
    db $e4
    ld c, b
    ld d, [hl]
    ld b, [hl]
    ld h, $55
    dec hl
    ld b, a
    ret nz

    ld c, b
    sbc b
    ld b, [hl]
    dec [hl]
    ld e, c
    jp c, $de47

    ld c, b
    ld h, b
    ld b, l
    ld l, e
    ld b, l
    db $76
    ld b, h
    db $e4
    ld c, b
    inc e
    ld b, a
    pop bc
    ld h, c
    ld a, [$c048]
    ld c, b
    ld e, $48
    jp nc, Jump_000_0d73

    ld c, e
    sbc $48
    add [hl]
    ld b, [hl]
    ld [c], a
    ld d, a
    xor e
    ld b, a
    db $e4
    ld c, b
    and b
    ld b, a
    push af
    ld l, e
    sub $49
    ret nz

    ld c, b
    ld [hl], $48
    inc d
    ld [hl], l
    ld b, l
    ld c, e
    sbc $48
    ld a, [de]
    ld b, [hl]
    ld [hl], $52
    or e
    ld b, [hl]
    db $e4
    ld c, b
    ld [hl-], a
    ld b, [hl]
    sub d
    ld d, e
    rst $18
    ld b, [hl]
    ret nz

    ld c, b
    ld a, h
    ld b, a
    sbc e
    ld l, c
    and h
    ld c, c
    sbc $48
    cp d
    ld c, b
    inc h
    ld a, e
    sub a
    ld c, h
    db $e4
    ld c, b
    sub d
    ld b, [hl]
    ret z

    ld e, b
    call $c047
    ld c, b
    jr nc, jr_005_442c

    jp hl


    ld [hl], h
    jr nc, @+$4d

    sbc $48
    ld e, h
    ld b, [hl]
    ld h, e
    ld d, l
    inc [hl]
    ld b, a
    db $e4
    ld c, b
    add d
    ld b, a
    ld a, [bc]
    ld l, d
    xor e
    ld c, c
    ret nz

    ld c, b
    ld a, [$6a47]
    ld [hl], c
    and e
    ld c, d
    sbc $48
    xor [hl]
    ld c, b
    ld c, d
    ld a, d
    ld a, a
    ld c, h
    db $e4
    ld c, b
    ret z

    ld b, [hl]
    dec a
    ld e, h
    ld c, [hl]
    ld c, b
    ret nz

    ld c, b
    or h
    ld c, b
    or e
    ld a, d
    add [hl]
    ld c, h
    sbc $48
    ld h, $46
    xor $52
    push bc
    ld b, [hl]
    db $e4
    ld c, b
    ld e, b
    ld b, a
    dec b
    ld h, a
    ld e, b
    ld c, c
    ret nz

    ld c, b
    adc h
    ld b, [hl]

jr_005_442c:
    ccf
    ld e, b
    cp h
    ld b, a
    sbc $48
    jp nz, $d846

    ld e, e
    ld b, l
    ld c, b
    db $e4
    ld c, b
    ld [bc], a
    ld b, [hl]
    ld d, b
    ld d, b
    add c
    ld b, [hl]
    ret nz

    ld c, b
    and d
    ld c, b
    add b
    ld a, c
    ld h, l
    ld c, h
    sbc $48
    sub h
    ld b, a
    add hl, sp
    ld l, e
    ret z

    ld c, c
    db $e4
    ld c, b
    inc h
    ld c, b
    ld hl, $1674
    ld c, e
    ret nz

    ld c, b
    ld [hl], h
    ld b, [hl]
    rst $10
    ld d, [hl]
    ld [hl], h
    ld b, a
    sbc $48
    ld a, [hl+]
    ld c, b
    adc d
    ld [hl], h
    rra
    ld c, e
    db $e4
    ld c, b
    jp nc, $de45

    ld c, h
    di
    ld b, l
    ret nz

    ld c, b
    sbc h
    ld c, b
    daa
    ld a, c
    ld e, b
    ld c, h
    sbc $48
    adc b
    ld b, a
    ld [hl], l
    ld l, d
    or h
    ld c, c
    db $e4
    ld c, b
    ld l, d
    ld b, a
    sub [hl]
    ld l, b
    ld a, c
    ld c, c
    ret nz

    ld c, b
    adc d
    ld b, l
    jr jr_005_44d6

    ld sp, hl
    ld b, h
    sbc $48
    ld b, d
    ld b, l
    inc d
    ld b, h
    add hl, hl
    ld b, h
    db $e4
    ld c, b
    adc [hl]
    ld b, a
    ldh a, [rOCPS]
    pop bc
    ld c, c
    ret nz

    ld c, b
    db $fc
    ld b, l
    ld sp, hl
    ld c, a
    ld l, h
    ld b, [hl]
    sbc $48
    ld d, d
    ld b, a
    sbc d
    ld h, [hl]
    ld d, c
    ld c, c
    db $e4
    ld c, b
    jr nz, jr_005_44fa

    add a
    ld d, d
    cp h
    ld b, [hl]
    ret nz

    ld c, b
    ld e, [hl]
    ld b, a
    ld b, h
    ld h, a
    ld e, a
    ld c, c
    sbc $48
    ld l, $47
    ld d, [hl]
    ld h, e
    rla
    ld c, c
    db $e4
    ld c, b
    ld h, h
    ld b, a
    push de
    ld h, a
    ld l, h
    ld c, c
    ret nz

    ld c, b
    ld b, [hl]
    ld b, a
    sub h
    ld h, l

jr_005_44d6:
    ld b, e
    ld c, c
    sbc $48
    inc l
    ld b, [hl]
    dec a
    ld d, e
    jp nc, $e446

    ld c, b
    ld b, b
    ld b, a
    ld sp, $3a65
    ld c, c
    ret nz

    ld c, b
    ld c, h
    ld b, a
    rst $38
    ld h, l
    ld c, d
    ld c, c
    sbc $48
    ret nz

    ld b, l
    sub l
    ld c, e
    add $45
    db $e4
    ld c, b

jr_005_44fa:
    add $45
    inc h
    ld c, h
    rst $18
    ld b, l
    ld [hl], b
    ld b, [hl]
    ret nc

    ld c, b
    ld [bc], a
    nop
    ld [hl], b
    ld b, [hl]
    ldh [rOBP0], a
    ld bc, $7038
    ld b, [hl]
    ret nc

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ret nc

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    nop
    ld c, c
    ld [bc], a
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ret nc

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    nop
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    nop
    ld c, c
    ld [bc], a
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    ld bc, $7020
    ld b, [hl]
    ret nz

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ld h, b
    ld c, b
    ld bc, $7020
    ld b, [hl]
    or b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ld d, b
    ld c, c
    ld [bc], a
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ret nz

    ld c, b
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    and b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    sub b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh [rOBP0], a
    ld bc, $7020
    ld b, [hl]
    ld b, b
    ld c, b
    ld bc, $7050
    ld b, [hl]
    ldh [rOBP0], a
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ret nc

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    sub b
    ld c, b
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    sub b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    ld bc, $7020
    ld b, [hl]
    and b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    sub b
    ld c, b
    ld bc, $7038
    ld b, [hl]
    ld h, b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    jr nz, jr_005_4619

    nop
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    ld bc, $7020
    ld b, [hl]
    ld h, b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ld d, b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    add b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ld b, b
    ld c, b
    nop
    nop
    or b
    ld b, [hl]
    ld h, b
    ld c, b
    nop
    nop
    or b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    or b
    ld b, [hl]
    ldh a, [rOBP0]
    nop
    nop
    or b
    ld b, [hl]
    ret nz

    ld c, b
    nop
    nop
    or b
    ld b, [hl]
    and b
    ld c, c
    nop
    nop
    or b
    ld b, [hl]
    ret nc

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ret nz

    ld c, b
    ld [hl], d

jr_005_4619:
    nop
    ld [hl], b
    ld b, [hl]
    ret nz

    ld c, b
    ld bc, $7030
    ld b, [hl]
    ret nc

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    ld bc, $7020
    ld b, [hl]
    db $10
    ld c, c
    ld bc, $7030
    ld b, [hl]
    ld b, b
    ld c, c
    ld bc, $7020
    ld b, [hl]
    ret nz

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ld d, b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh [rOBP0], a
    db $01
    db $38

    db $70, $46, $d0, $48, $00, $00

    ld [hl], b
    ld b, [hl]
    ld h, b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ret nz

    ld c, b
    ld bc, $7020
    ld b, [hl]
    sub b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    nop
    nop
    ld [hl], b
    ld b, [hl]
    and b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh [rOBP0], a
    nop
    nop
    ld [hl], b
    ld b, [hl]
    and b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ld b, b
    ld c, c
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    ret nz

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    add b
    ld c, b
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    ld h, b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    nop
    nop
    ld [hl], b
    ld b, [hl]
    nop
    ld c, c
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    jr nz, jr_005_4703

    nop

jr_005_46bb:
    nop
    ld [hl], b
    ld b, [hl]
    jr nz, jr_005_4709

    nop
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    ld [de], a
    nop
    ld [hl], b
    ld b, [hl]
    sub b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ret nz

    ld c, b
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    ret nz

    ld c, b
    ld bc, $7020
    ld b, [hl]
    ret nc

    ld c, b
    ld bc, $f020
    ld b, [hl]
    ld d, b
    ld c, c
    ld [hl], d
    nop
    ldh a, [rDMA]
    ld [hl], b
    ld c, c
    ld [hl], d
    nop
    ldh a, [rDMA]
    ret nz

    ld c, b
    nop
    nop
    ldh a, [rDMA]
    ld d, b
    ld c, c
    nop

jr_005_4703:
    nop
    ldh a, [rDMA]
    ld [hl], b
    ld c, c
    nop

jr_005_4709:
    nop
    ldh a, [rDMA]
    ldh a, [rOBP0]
    nop
    nop
    jr nc, jr_005_4759

    ld h, b
    ld c, c
    nop
    nop
    jr nc, jr_005_475f

    ret nc

    ld c, b
    nop
    nop
    jr nc, jr_005_4765

    ld [hl], b
    ld c, c
    nop
    nop
    jr nc, jr_005_476b

    ldh [rOBP0], a
    nop
    nop
    jr nc, jr_005_4771

    sub b
    ld c, b
    ld [hl], d
    nop
    jr nc, jr_005_4777

    jr nz, jr_005_477b

    nop
    nop
    ld [hl], b
    ld b, a
    ld d, b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, a
    ld d, b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    jr nz, jr_005_478d

    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh [rOBP0], a
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ld h, b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    jr nz, jr_005_479f

    nop
    nop
    ld [hl], b

jr_005_4759:
    ld b, [hl]
    ret nc

    ld c, b
    ld [hl], d
    nop
    ld [hl], b

jr_005_475f:
    ld b, [hl]
    ret nz

    ld c, b
    nop
    nop
    ld [hl], b

jr_005_4765:
    ld b, [hl]
    ret nc

    ld c, b
    nop
    nop
    ld [hl], b

jr_005_476b:
    ld b, [hl]
    ldh a, [rOBP0]
    nop
    nop
    ld [hl], b

jr_005_4771:
    ld b, [hl]
    ld h, b
    ld c, b
    ld bc, $7020

jr_005_4777:
    ld b, [hl]
    ldh a, [rOBP0]
    nop

jr_005_477b:
    nop
    ld [hl], b
    ld b, [hl]
    ret nc

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    sub b
    ld c, b
    nop
    nop
    or b
    ld b, a
    ld d, b
    ld c, c
    nop

jr_005_478d:
    nop
    or b
    ld b, a
    ld h, b
    ld c, b
    nop
    nop
    or b
    ld b, a
    or b
    ld c, b
    ld [hl], d
    nop
    or b
    ld b, a
    ldh a, [rOBP0]
    nop

jr_005_479f:
    nop
    ldh a, [rBGP]
    ldh a, [rOBP0]
    nop
    nop
    ldh a, [rBGP]
    nop
    ld c, c
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    ret nz

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    or b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ld d, b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    and b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    or b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    jr nc, jr_005_481d

    nop
    nop
    ld [hl], b
    ld b, [hl]
    ld h, b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    jr nz, jr_005_4829

    nop
    nop
    ld [hl], b
    ld b, [hl]
    ret nz

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    jr nz, jr_005_483b

    nop
    nop
    ld [hl], b
    ld b, [hl]
    and b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    nop
    nop
    ld [hl], b
    ld b, [hl]
    or b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ld h, b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    or b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    db $10
    ld c, c
    nop

jr_005_481d:
    nop
    ld [hl], b
    ld b, [hl]
    ld d, b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ret nc

    ld c, b
    nop

jr_005_4829:
    nop
    ld [hl], b
    ld b, [hl]
    jr nz, @+$4b

    nop
    nop
    ld [hl], b
    ld b, [hl]
    add b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    and b
    ld c, c
    nop

jr_005_483b:
    nop
    ld [hl], b
    ld b, [hl]
    and b
    ld c, c
    ld bc, $7020
    ld b, [hl]
    ret nz

    ld c, b
    ld bc, $7030
    ld b, [hl]
    ld h, b
    ld c, c
    ld bc, $7030
    ld b, [hl]
    sub b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    ld bc, $7020
    ld b, [hl]
    ld d, b
    ld c, c
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    ld d, b
    ld c, b
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    ld h, b
    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    jr nz, jr_005_48b9

    nop
    nop
    ld [hl], b
    ld b, [hl]
    and b
    ld c, b
    ld bc, $7020
    ld b, [hl]
    ret nc

    ld c, b
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    ld h, b
    ld c, c
    ld bc, $7020
    ld b, [hl]
    ldh a, [rOBP0]
    nop
    nop
    ld [hl], b
    ld b, [hl]
    sub b
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ret nz

    ld c, b
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    ld [hl], d
    nop
    ld [hl], b
    ld b, [hl]
    jr nz, @+$4b

    nop
    nop
    ld [hl], b
    ld b, [hl]
    jr nz, jr_005_48ef

    ld bc, $f020
    ld b, a
    ret nc

    ld c, b
    nop
    nop
    ldh a, [rBGP]
    nop
    ld c, c
    nop
    nop
    ld [hl], b
    ld b, [hl]
    ldh [rOBP0], a
    nop

jr_005_48b9:
    nop
    ld [hl], b
    ld b, [hl]
    ldh a, [rOBP0]
    nop
    nop

    db $00, $40, $04, $20, $41, $03

    ld [hl], b
    ld c, a
    inc b
    ld b, b
    ld b, d
    inc bc
    db $10
    ld e, d
    inc b
    ld h, b
    ld b, e
    inc bc
    ldh [rBCPD], a
    inc b
    add b
    ld b, h
    inc bc

    db $40, $79, $04, $a0, $45, $03, $00, $40, $0a, $c0, $46, $03, $d0, $4f, $0a, $e0
    db $47, $03

    or b
    ld e, a
    ld a, [bc]
    nop
    ld c, c

jr_005_48ef:
    inc bc
    nop
    sbc c
    nop
    ld [bc], a
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$49

    ld b, c
    ld c, l
    ld b, l
    jr nz, @+$22

    ld c, a
    ld d, [hl]
    ld b, l
    ld d, d
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$01

    db $00, $99, $00, $02, $20, $20, $50, $41, $52, $54, $49, $45, $20, $20, $54, $45
    db $52, $4d, $49, $4e, $45, $45, $20, $20, $ff

    db $00, $99, $00, $02, $20, $20, $20, $20, $46, $49, $4e, $20, $44, $45, $4c, $20
    db $4a, $55, $45, $47, $4f, $20, $20, $ff

    db $00, $99, $00, $02, $20, $20, $20, $20, $20, $47, $41, $4d, $45, $20, $20, $4f
    db $56, $45, $52, $20, $20, $20, $20, $20, $ff

    db $00, $99, $00, $02, $20, $20, $20, $20, $20, $46, $49, $4e, $20, $20, $47, $49
    db $4f, $43, $4f, $20, $20, $20, $20, $20, $ff

    INCBIN "gfx/image_005_496c.2bpp"

    INCBIN "gfx/image_005_616c.2bpp"

    db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f
    db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f
    db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f
    db $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f
    db $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f
    db $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $5e, $5f
    db $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6a, $6b, $6c, $6d, $6e, $6f
    db $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $7a, $7b, $7c, $7d, $7e, $7f
    db $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $8f
    db $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $9c, $9d, $9e, $9f
    db $a0, $a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $ae, $af
    db $b0, $b1, $b2, $b3, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30
    db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40
    db $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50
    db $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $5e, $5f, $60
    db $61, $62, $63, $64, $65, $66, $67, $68, $69, $6a, $6b, $6c, $6d, $6e, $6f, $70
    db $71, $72, $73, $74, $75, $76, $77, $78, $79, $7a, $7b, $7c, $7d, $7e, $7f, $80
    db $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $8f, $90
    db $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $9c, $9d, $9e, $9f, $a0
    db $a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $ae, $af, $b0
    db $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8, $b9, $ba, $bb, $bc, $bd, $be, $bf, $c0
    db $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8, $c9, $ca, $cb, $cc, $cd, $ce, $cf, $d0
    db $d1, $d2, $d3, $d4, $d5, $d6, $d7, $d8, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $09, $09, $09, $09
    db $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01
    db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    INCBIN "gfx/image_005_650c.2bpp"

    cp a
    nop
    ld a, [$4800]
    nop
    dec h
    nop
    sub b
    nop
    ld b, h
    nop
    jr z, jr_005_721a

jr_005_721a:
    ld b, c
    nop
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
    jr nz, jr_005_721a

    ld c, b
    xor a
    ld d, b
    ld e, l
    and b
    ld a, a

jr_005_7269:
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
    jr c, jr_005_7269

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
    call nz, Call_005_4300
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

jr_005_73d9:
    ld a, d
    dec d
    ld [$748b], a
    ld d, l
    xor d
    ld a, l
    add b
    reti


    jr nz, jr_005_73d9

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
    jr nz, jr_005_7442

jr_005_7442:
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

Call_005_75ea:
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
    jr nz, jr_005_7600

jr_005_7600:
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
    jr nz, jr_005_7646

jr_005_7646:
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
    jp c, $6d00

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
    jr z, jr_005_77f2

jr_005_77f2:
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
    jr z, jr_005_7810

jr_005_7810:
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
    jr nz, jr_005_7830

jr_005_7830:
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
    jr z, jr_005_7844

jr_005_7844:
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
    jr nz, jr_005_786a

jr_005_786a:
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

jr_005_7886:
    rst $38
    nop
    rst $18
    jr nz, @+$01

    nop
    rst $18
    jr nz, jr_005_7886

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
    jr z, jr_005_7906

jr_005_7906:
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
    jr nz, jr_005_7922

jr_005_7922:
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

jr_005_7975:
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
    jr nz, jr_005_7975

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

jr_005_79a8:
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

jr_005_79c9:
    dec d
    xor d
    ld [hl], l
    rst $30
    ld c, d
    ld e, d
    and l
    rst $38
    jr nz, jr_005_79a8

    xor d
    rst $38

jr_005_79d5:
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
    jr z, jr_005_79c9

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
    jr nz, jr_005_79d5

    ld d, l
    rst $30
    ld [$a55a], sp
    rst $38
    nop

jr_005_7a32:
    ld d, l
    xor d
    rst $38
    nop
    xor e
    ld d, l

jr_005_7a38:
    rst $38

jr_005_7a39:
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
    call nc, Call_005_75ea
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
    jr z, jr_005_7a39

    and l
    rst $38
    jr nc, jr_005_7a38

    xor d
    rst $38
    ld b, b
    ld [$ff55], a
    nop
    xor d
    ld d, l
    rst $30
    ld [$a55a], sp
    jr c, jr_005_7a32

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

    jr c, jr_005_7a9e

    nop

jr_005_7a9e:
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

jr_005_7acb:
    nop
    jr jr_005_7acb

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
    jr nc, jr_005_7b32

    nop
    ld a, [hl-]
    ret nz

jr_005_7b16:
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
    jr jr_005_7b33

    sbc b
    ld b, $98

jr_005_7b32:
    inc c

jr_005_7b33:
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
    jr nc, jr_005_7b5f

    ld h, h
    jr jr_005_7b16

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

jr_005_7b5f:
    add b
    or c
    ld b, b
    jr @+$62

    ld sp, $5ac0
    jr nz, jr_005_7b7e

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

jr_005_7b7e:
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
    jr jr_005_7be9

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

jr_005_7be9:
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
    jr jr_005_7cde

    ld a, [de]
    dec de
    nop
    nop
    inc e
    dec e
    ld e, $1f
    jr nz, jr_005_7cf0

    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $27
    jr z, jr_005_7d00

    ld a, [hl+]
    dec hl
    inc l
    dec l
    nop
    nop
    nop

jr_005_7cde:
    ld l, $2f
    jr nc, jr_005_7d13

    ld [hl-], a
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, jr_005_7d23

    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $00

jr_005_7cf0:
    nop
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

jr_005_7d00:
    nop
    nop
    nop
    nop
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

jr_005_7d13:
    nop
    nop
    nop
    nop
    nop
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

jr_005_7d23:
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

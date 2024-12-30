; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00d", ROMX[$4000], BANK[$d]

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
    ldh a, [$e0]
    ldh [$c0], a
    pop bc
    add b
    sub c
    add b
    sbc e
    add b
    sbc e
    add b
    sbc d
    add c
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    db $20, $9f
    cp c
    ld b, $ff
    rst $38
    rlca
    rlca
    rrca
    inc bc
    sbc c
    rlca
    reti


    rlca
    reti


    rlca
    ld sp, hl
    rlca
    ld a, c
    rlca
    rst $38
    rst $38
    ldh a, [$e0]
    ldh [$c0], a
    ret nz

    add b
    sub c
    add b
    sub e
    add b
    sub e
    add b
    sbc d
    add c
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    rst $00
    nop
    rst $28
    nop
    rst $38
    nop
    ld [hl], b
    di
    or l
    ld a, [bc]
    rst $38
    rst $38
    rlca
    rlca
    rrca
    inc bc
    add hl, de
    rlca
    add hl, de
    rlca
    sbc c
    rlca
    sbc c
    rlca
    reti


    rlca
    rst $38
    rst $38
    ldh a, [$e0]
    ldh [$c0], a
    ret z

    add b
    sbc h
    add b
    sbc h
    add b
    sbc l
    add b
    sbc h
    add c
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    rst $30
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, h
    cp a
    or l
    ld a, [bc]
    rst $38
    rst $38
    rlca
    rlca
    rrca
    inc bc
    adc c
    rlca
    adc l
    inc bc
    adc c
    rlca
    ret


    rlca
    ret


    rlca
    rst $38
    rst $38
    add c
    add b
    add d
    add c
    sub b
    add e
    sub b
    add e
    sub c
    add d
    sub b
    add e
    sbc c
    add d
    sbc [hl]
    add b
    sbc d
    add b
    sbc [hl]
    add b
    sbc d
    add b
    adc a
    sub b
    sbc a
    add b
    adc a
    sub b
    sub [hl]
    adc c
    ld a, $7e
    rst $38
    ld a, [hl]
    rst $38
    ld a, a
    rst $38
    ld a, a
    ld a, a
    rst $38
    rst $38
    ld a, a
    ld a, [hl]
    cp $7f
    cp $81
    ld a, a
    ld bc, $ffff
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    ld bc, $0107
    sbc e
    add b
    sbc e
    add b
    sbc e
    add b
    sbc a
    add b
    sbc e
    add b
    sbc a
    add b
    sbc a
    add b
    sbc [hl]
    add c
    ccf
    ld a, [hl]
    cp $7e
    cp $7e
    ld a, [hl]
    cp $fe
    ld a, [hl]
    ld a, [hl]
    cp $7e
    cp $7e
    cp $5b
    dec b
    ld e, c
    rlca
    ld a, a
    ld bc, $055b
    ld e, a
    ld bc, $017b
    ld a, l
    ld bc, $0955
    sbc l
    add b
    sbc l
    add b

jr_00d_4114:
    sbc l
    add b
    sbc l
    add b
    sbc [hl]
    add c
    adc a
    sub b
    sbc a
    add b
    adc [hl]
    sub c
    ld c, e
    dec b
    ld e, l
    inc bc
    ld e, e
    dec b
    ld e, a
    ld bc, $015f
    ld e, a
    ld bc, $017d
    ld d, a
    add hl, bc
    sbc c
    add d
    sbc b
    add d
    sbc b
    add d
    sbc c
    add d
    sbc d
    add c
    adc e
    sub b
    sbc [hl]
    add c
    adc b
    sub e
    adc d
    sub l
    add l
    sbc d
    add d
    sbc l
    add b
    sbc a
    or b
    adc a
    ldh [$d1], a
    ldh [rIE], a
    rst $38
    rst $38
    pop bc
    nop
    add b
    nop
    or e
    ld b, b
    ld d, h
    and e
    nop
    rst $38
    sub b
    jr nz, jr_00d_4114

    ld c, b
    rst $38
    rst $38
    push af
    dec bc
    pop hl
    rra
    swap c
    adc l
    ld h, e
    inc sp
    call $0b01
    ld b, e
    rlca
    rst $38
    rst $38
    sbc [hl]
    add c
    adc a
    sub b
    add a
    sbc b
    add c
    sbc [hl]
    or b
    adc a
    db $e3
    ret nc

    pop hl
    cp $ff
    rst $38
    ret nz

    nop
    add b
    nop
    rst $20
    nop
    add $39
    nop
    rst $38
    ldh a, [$38]
    ld l, [hl]
    sub b
    rst $38
    rst $38
    ld [hl], a
    add hl, bc
    push hl
    add hl, de
    adc c
    ld [hl], c
    add hl, bc
    push hl
    ld [hl], l
    adc c
    add hl, bc
    inc de
    add e
    rlca
    rst $38
    rst $38
    sub [hl]
    adc c
    adc d
    sub l
    add l
    sbc d
    add b
    sbc a
    or b
    adc a
    db $e3
    ret nc

    ldh [rIE], a
    rst $38
    rst $38
    ret nz

    nop
    add b
    nop
    ld a, e
    add b
    sbc d
    ld h, c
    nop
    rst $38
    ldh a, [$71]
    ld e, e
    and h
    rst $38
    rst $38
    ld [hl], l
    add hl, bc
    push hl
    add hl, de
    adc e
    ld [hl], c
    add hl, bc
    push hl
    ld [hl], l
    adc c
    adc c
    inc sp
    and e
    rlca
    rst $38
    rst $38
    sub l
    adc d
    adc d
    sub h
    add l
    sbc d
    add d
    sbc l
    or b
    adc a
    pop hl
    ret nc

    ldh [rIE], a
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    ld d, l
    xor b
    dec bc
    db $f4
    nop
    rst $38
    inc bc
    add b
    dec d
    ld [$ffff], a
    ld bc, $0101
    inc bc
    pop bc
    ccf
    add hl, bc
    di
    dec hl
    pop bc
    pop af
    ld sp, $01e9
    rst $38
    rst $38
    rst $38
    rst $38
    add b
    add b
    sbc a
    and b
    xor $91
    sub l
    xor d
    jp z, $84b5

    cp e
    and d
    sbc l
    rst $38
    rst $38
    ld h, l
    nop
    ld hl, $82da
    ld a, l
    ld b, c
    cp [hl]
    add h
    ld a, e
    ld a, [hl]
    rst $38
    ld a, a
    rst $38
    rst $38
    rst $38
    ld [hl], a
    rrca
    inc de
    rst $28
    add hl, bc
    rst $30
    ld d, l
    xor e
    and c
    ld e, a
    ld d, l
    xor e
    ld hl, $ffdf
    rst $38
    add b
    add b
    sub l
    add b
    xor [hl]
    add b
    ei
    add h
    sub c
    xor [hl]
    add sp, -$69
    sub d
    xor l
    rst $38
    rst $38
    inc h
    nop
    ld l, b
    rla
    ret nc

    cpl
    ld l, b
    rla
    or h
    dec bc
    cp $7f
    ld a, a
    rst $38
    rst $38
    rst $38
    or a
    rrca
    add e
    ld a, a
    ld b, c
    cp a
    add hl, hl
    sub a
    dec d
    rlc e
    db $fd
    add e
    ld a, l
    rst $38
    rst $38
    add c
    add b
    xor d
    sub l
    sub l
    xor d
    and b
    sbc a
    add c
    cp [hl]
    adc d
    or l
    push de
    xor d
    rst $38
    rst $38
    ld d, l
    nop
    sub l
    ld l, d
    ld a, [bc]
    push af
    inc d
    db $eb
    ld [hl+], a
    db $dd
    sub b
    ld l, a
    ld b, c
    cp [hl]
    rst $38
    rst $38
    inc bc
    ld bc, $817d
    xor a
    ld d, c
    ld d, a
    xor c
    adc e
    ld [hl], l
    ld d, l
    xor e
    ld bc, $ffff
    rst $38
    ldh [$e0], a
    pop bc
    ret nz

    and d
    add b
    sub l
    add b
    cp a
    add b
    or l
    adc d
    xor d
    sub l
    rst $38
    rst $38
    rla
    nop
    ld [hl], l
    ld a, [bc]
    ld [c], a
    dec e
    push de
    ld a, [hl+]
    and d
    ld e, l
    ld b, b
    cp a
    nop
    rst $38
    rst $38
    rst $38
    ld c, a
    rlca
    ld d, e
    xor a
    ld bc, $55ff
    xor e
    xor e
    ld d, l
    dec b
    ei
    inc bc
    db $fd
    rst $38
    rst $38
    add l
    add b
    sub l
    xor d
    and d
    sbc l
    sub h
    xor e
    ld [$9595], a
    xor d
    ld [c], a
    sbc l
    rst $38
    rst $38
    ld a, [hl]
    cp $7e
    cp $7e
    cp $7e
    cp $fe
    ld a, [hl]
    ld a, [hl]
    cp $7c
    cp $ff
    rst $38
    ld d, l
    inc bc
    ld bc, $a5ff
    ld e, e
    ld c, c
    or a
    sub l
    ld l, e
    dec hl
    push de
    ld d, c
    xor e
    rst $38
    rst $38
    pop hl
    ldh a, [$cd]
    ld [c], a
    sub d
    call $9ba4
    adc b
    or a
    sub l
    xor d
    adc d
    or l
    rst $38
    rst $38
    dec l
    nop
    ld d, l
    xor d
    and d
    ld e, l
    ld d, [hl]
    xor c
    and l
    ld e, b
    ld [hl], a
    adc b
    cp $7f
    rst $38
    rst $38
    ld [hl], a
    rrca
    ld d, e
    xor a
    xor c
    ld d, a
    ld bc, $01ff
    rst $30
    ld h, l
    adc e
    xor e
    ld d, l
    sub h
    xor e
    jp z, $94b5

    xor e
    adc l
    or d
    sbc d
    and c
    and l
    sbc d
    add b
    cp a
    add c
    cp [hl]
    ld a, a
    rst $38
    ld a, a
    cp $3c
    ret nz

    nop
    rst $38
    sub l
    ld l, d
    ld [bc], a
    db $fd
    ld a, [hl]
    rst $38
    ld a, a
    rst $38
    sub l
    ld l, e
    add hl, hl
    ld d, a
    inc de
    rst $28
    daa
    rst $18
    ld d, a
    xor a
    inc hl
    rst $18
    ld d, c
    xor a
    add hl, hl
    rst $10
    adc b
    or a
    jp nc, $89ad

    or [hl]
    sub d
    xor l
    and l
    sbc d
    add e
    cp h
    add [hl]
    cp b
    db $fd
    add b
    rst $38
    ld a, a
    ld a, [hl]
    cp $35
    ret nz

    add c
    ld a, [hl]
    ld d, d
    xor l
    xor b
    ld d, a
    db $fc
    ld a, a
    ld a, [hl]
    ld a, a
    add hl, hl
    ld d, a
    ld d, c
    cpl
    and e
    rra
    ld d, a
    adc a
    cp a
    ld b, a
    ld d, a
    xor e
    xor e
    ld d, l
    ld d, l
    xor e
    ld [hl+], a
    db $dd
    add b
    ld a, a
    ld a, [hl+]
    ld d, l
    call nc, $4a2b
    dec [hl]
    dec a
    ld b, d
    ld d, [hl]
    ld bc, $058a
    sub l
    xor d
    ld [$8595], a
    cp d
    xor d
    sub l
    add a
    cp b
    jp z, $85b5

    cp d
    add sp, -$69
    ld a, a
    cp $7f
    cp $7f
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, [hl]
    cp $7f
    cp $01
    rst $38
    add hl, de
    rst $20
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld c, l
    inc bc
    ld bc, $90ff
    xor a
    ret


    or [hl]
    add b
    cp a
    push de
    xor d
    xor b
    sub a
    pop de
    xor [hl]
    adc d
    or h
    db $fd
    add b
    cp $7c
    ld a, l
    ld hl, sp+$6a
    add c
    sub l
    ld l, d
    jp nz, $813d

    ld a, [hl]
    db $fc
    ld a, e
    ld a, l
    ld a, h
    add e
    ld a, a
    ld d, e
    xor a
    daa
    rst $18
    ld c, a
    cp a
    adc a
    ld a, a
    ld d, a
    xor a
    adc e
    ld [hl], a
    ld d, e
    xor a
    reti


    and [hl]
    db $d3
    adc h
    and l
    jp z, $f5ca

    push hl
    ld a, [$f5fa]
    rst $38
    rst $38
    adc c
    add b
    ld a, [hl]
    rst $38
    ld a, a
    rst $38
    sbc a
    ld b, b
    ld d, c
    xor [hl]
    ld [$ff15], a
    nop
    rst $38
    cp $fe
    ld a, [hl]
    ld d, l
    xor e
    rst $38
    rst $38
    rst $30
    rrca
    ld d, e
    xor a
    add hl, bc
    rst $30
    ld d, l
    xor e
    xor c
    ld d, a
    ld d, l
    xor e
    adc d
    or l
    call nz, $eabb
    sub l
    sub h
    xor e
    ld [$9195], a
    xor [hl]
    xor d
    push de
    rst $38
    rst $38
    ld a, a
    rst $38
    ld a, a
    cp $3c
    ret nz

    dec b
    ld a, [$758a]
    ld d, l
    xor d
    xor a
    ld d, b
    rst $38
    rst $38
    sub l
    ld l, e
    dec bc
    ld [hl], l
    dec d
    db $eb
    cpl
    pop de
    rst $38
    ld bc, $07db
    or a
    rrca
    rst $38
    rst $38
    xor d
    add b
    sub a
    add b
    cp a
    add b
    ld [$8595], a
    cp d
    jp z, $80b5

    rst $38
    rst $38
    rst $38
    cp $7e
    cp $7e
    ld a, [hl]
    cp $ff
    ld a, [hl]
    ld a, [hl]
    cp $7f
    cp $7e
    rst $38
    rst $38
    rst $38
    ld hl, $95df
    ld l, e
    add hl, hl

jr_00d_4475:
    rst $10
    sub l
    ld l, e
    ld c, c
    or a
    sub l
    ld l, e
    inc hl
    db $dd
    rst $38
    rst $38
    or l

Jump_00d_4481:
    add b
    push bc
    cp d
    jp z, $d5b5

    xor d
    jp z, $d1b5

    xor [hl]
    add b
    rst $38
    rst $38
    rst $38
    ld b, l
    nop
    xor d
    nop
    push de
    nop
    ld l, [hl]
    add b
    cp e
    ld b, h
    ld d, l
    xor d
    jr z, jr_00d_4475

    rst $38
    rst $38
    db $dd
    inc bc
    pop de
    cpl
    ld l, c
    rla
    pop de
    cpl
    ld l, c
    rla
    or l
    dec bc
    db $db
    dec b
    rst $38
    rst $38
    sub c
    xor [hl]
    jp z, $a4b5

    sbc e
    pop de
    xor [hl]
    xor d
    push de
    pop de
    xor $ea
    push af
    rst $38
    rst $38
    ld hl, $88c0
    ld [hl], a
    ld d, b
    xor a
    dec h
    jp c, $f50a

    ld d, l
    xor d
    xor a
    ld d, b
    rst $38
    rst $38
    ld b, c
    cp a
    adc e
    ld [hl], l
    dec d
    db $eb
    cpl
    pop de
    rst $38
    ld bc, $07db
    or a
    rrca
    rst $38
    rst $38
    xor d
    add b
    sub a
    add b
    cp a
    add b
    ld [$9595], a
    xor d
    jp nz, $80bd

    rst $38
    rst $38
    rst $38
    cp $7c
    cp $7e
    ld a, [hl]
    cp $fe
    ld a, [hl]
    ld a, [hl]
    cp $fe
    ld a, [hl]
    ld a, a
    cp $ff
    rst $38
    dec c
    di
    sbc a
    ld h, c
    dec l

jr_00d_4505:
    db $d3
    sub a
    ld l, c
    ld b, l
    cp e
    xor a
    ld d, c
    ld d, a
    xor c
    rst $38
    rst $38
    xor e
    sub h
    add l
    cp d
    ld [$c595], a
    cp d
    jp z, $f4b5

    set 5, d
    push af
    rst $38
    rst $38
    ld a, [hl]
    ld a, h
    and c
    nop
    push de
    nop
    ld l, [hl]
    add b
    cp e
    ld b, h
    ld d, l
    xor d
    jr z, jr_00d_4505

    rst $38
    rst $38
    and c
    ld e, a
    push de
    dec hl
    ld l, c
    rla
    push de
    dec hl
    ld l, c
    rla
    or a
    dec bc
    rst $18
    rlca
    rst $38
    rst $38
    rst $38
    rst $38
    add c
    add c
    rst $20
    rst $20
    rst $20
    rst $20
    rst $20
    rst $20
    rst $20
    rst $20
    rst $20
    rst $20
    rst $38
    rst $38
    rst $38
    rst $38
    sbc h
    sbc h
    sbc h
    sbc h
    add b
    add b
    sbc h
    sbc h
    sbc h
    sbc h
    sbc h
    sbc h
    rst $38
    rst $38
    rst $38
    rst $38
    add c
    add c
    rst $20
    rst $20
    rst $20
    rst $20
    rst $20
    rst $20
    rst $20
    rst $20
    add c
    add c
    rst $38
    rst $38
    rst $38
    rst $38
    pop bc
    add c
    sbc a
    sbc a
    pop bc
    add b
    db $fc
    db $fc
    sbc h
    sbc h
    pop bc
    add b
    rst $38
    rst $38
    rst $38
    rst $38
    pop bc
    add c
    adc a
    sbc a
    sub b
    sub b
    sbc h
    sbc h
    adc h
    sbc h
    pop bc
    add b
    rst $38
    rst $38
    rst $38
    rst $38
    pop bc
    add b
    adc b
    sbc h
    add b
    add b
    sbc h
    sbc h
    sbc h
    sbc h
    sbc h
    sbc h
    rst $38
    rst $38
    rst $38
    rst $38
    adc b
    sbc h
    add b
    adc b
    sub h
    add b
    adc b
    sub h
    sbc h
    sbc h
    sbc h
    sbc h
    rst $38
    rst $38
    rst $38
    rst $38
    add b
    add b
    sbc a
    sbc a
    add e
    add e
    sbc a
    sbc a
    sbc a
    sbc a
    add b
    add b
    rst $38
    rst $38
    rst $38
    rst $38
    add c
    add b
    sbc h
    sbc h
    sbc h
    sbc h
    add c
    add b
    sbc a
    sbc a
    sbc a
    sbc a
    rst $38
    rst $38
    rst $38
    rst $38
    sub c
    sbc c
    add e
    sub e
    add a
    add a
    add e
    sub e
    sub c
    sbc c
    sbc b
    sbc h
    rst $38
    rst $38
    rst $38
    rst $38
    pop bc
    add b
    adc b
    sbc h
    sbc a
    sbc a
    sbc a
    sbc a
    adc b
    sbc h
    pop bc
    add b
    rst $38
    rst $38
    rst $38
    rst $38
    sbc a
    sbc a
    sbc a
    sbc a
    sbc a
    sbc a
    sbc a
    sbc a
    sbc a
    sbc a
    add b
    add b
    rst $38
    rst $38
    rst $38
    rst $38
    sbc h
    sbc h
    sbc h
    sbc h
    ret nz

    add b
    db $fc
    db $fc
    sbc h
    sbc h
    pop bc
    add b
    rst $38
    rst $38
    rst $38
    rst $38
    add d
    add c
    sub l
    sbc b
    sbc b
    sbc h
    sbc h
    sbc h
    sbc l
    sbc b
    add d
    add c
    rst $38
    rst $38
    rst $38
    rst $38
    adc h
    sbc h
    add h
    adc h
    add b
    add h
    add b
    sub b
    sub b
    sbc b
    sbc b
    sbc h
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $3f01
    ccf
    rlca
    rlca
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    rst $38
    rst $38
    rst $38
    rst $38
    add e
    ld bc, $3911
    add hl, sp
    add hl, sp
    add hl, sp
    add hl, sp
    ld de, $8339
    ld bc, $ffff
    rst $38
    rst $38
    inc bc
    ld bc, $3939
    add hl, sp
    add hl, sp
    inc bc
    ld bc, $3939
    add hl, sp
    add hl, sp
    rst $38
    rst $38
    rst $38
    rst $38
    add e
    inc bc
    rra
    ccf
    ld hl, $3921
    add hl, sp
    add hl, de
    add hl, sp
    add e
    ld bc, $ffff
    rst $38
    rst $38
    add e
    ld bc, $3911
    ld bc, $3901
    add hl, sp
    add hl, sp
    add hl, sp
    add hl, sp
    add hl, sp
    rst $38
    rst $38
    rst $38
    rst $38
    ld de, $0139
    ld de, $0129
    ld de, $3929
    add hl, sp
    add hl, sp
    add hl, sp
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $3f01
    ccf
    rlca
    rlca
    ccf
    ccf
    ccf
    ccf
    ld bc, $ff01
    rst $38
    rst $38
    rst $38
    inc bc
    ld bc, $3939
    inc bc
    inc bc
    add hl, sp
    add hl, sp
    add hl, sp
    add hl, sp
    inc bc
    ld bc, $ffff
    rst $38
    rst $38
    add hl, sp
    add hl, sp
    add hl, sp
    add hl, sp
    add c
    ld bc, $f9f9
    add hl, sp
    add hl, sp
    add e
    ld bc, $ffff
    rst $38
    rst $38
    add e
    ld bc, $3911
    ccf
    ccf
    ccf
    ccf
    ld de, $8339
    ld bc, $ffff
    rst $38
    rst $38
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ld bc, $ff01
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $08
    rst $38
    add a
    rst $08
    add a
    rst $08
    rst $08
    rst $38
    rst $38
    rst $38
    sbc h
    sbc h
    sbc h
    sbc h
    sbc h
    sbc h
    sbc h
    sbc h
    sbc h
    sbc h
    pop bc
    add b
    rst $38
    rst $38
    rst $38
    rst $38
    db $fc
    ld hl, sp-$08
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld hl, sp-$07
    db $fc

jr_00d_470d:
    ld hl, sp-$01
    rst $38
    rst $38
    rst $38
    inc e
    jr jr_00d_470d

    ld sp, hl
    ld [$c908], sp
    ret


    ret


    ret


    add hl, de
    add hl, bc
    rst $38
    rst $38
    rst $38
    rst $38
    jr jr_00d_472d

    adc b
    ret z

    add hl, bc
    ld [$c9c8], sp
    ret


    ret


    ret


jr_00d_472d:
    ret


    rst $38
    rst $38
    rst $38
    rst $38
    adc b
    ret z

    add hl, bc
    adc c
    ld c, b
    ld [$4989], sp
    ret


    ret


    ret z

    ret z

    rst $38
    rst $38
    rst $38
    rst $38
    rrca
    rrca
    rst $38
    rst $38
    ccf
    ccf
    rst $38
    rst $38
    rst $38
    rst $38
    rrca
    rrca
    rst $38
    rst $38
    rst $38
    rst $38
    ld hl, sp-$08
    ld sp, hl
    ld sp, hl
    ld hl, sp-$08
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld hl, sp-$08
    rst $38
    rst $38
    rst $38
    rst $38
    inc e
    ld [$c9c8], sp
    add hl, de
    add hl, de
    ret


    ret


    ret z

    ret


    inc e
    ld [$ffff], sp
    rst $38
    rst $38
    add hl, de
    add hl, bc
    adc c
    ret


    call z, $cfc8
    rst $08
    adc c
    ret


    inc e
    ld [$ffff], sp
    rst $38
    rst $38
    rst $08
    rst $08
    rst $08
    rst $08
    rrca
    rrca
    rst $08
    rst $08
    rst $08
    rst $08
    rra
    rrca
    rst $38
    rst $38
    rst $38
    rst $38
    inc e
    ld [$c988], sp
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld sp, hl
    adc b
    ret


    inc e
    ld [$ffff], sp
    rst $38
    rst $38
    add hl, de
    add hl, bc
    adc c
    ret


    ret


    ret


    ret


    ret


    adc c
    ret


    jr jr_00d_47b6

    rst $38
    rst $38
    rst $38
    rst $38
    db $fc
    ld hl, sp-$08
    ld sp, hl

jr_00d_47b6:
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld hl, sp-$07
    inc c
    ld [$ffff], sp
    rst $38
    rst $38
    jr jr_00d_47cc

    adc c
    ret


    ret


    ret


    ret z

    ret z

    adc c
    ret


jr_00d_47cc:
    add hl, de
    add hl, bc
    rst $38
    rst $38
    rst $38
    rst $38
    rra
    rrca
    rst $08
    rst $08
    rst $08
    rst $08
    rra
    rrca
    rst $08
    rst $08
    rst $08
    rst $08
    rst $38
    rst $38
    rst $38
    rst $38
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld sp, hl
    ld sp, hl
    db $fc
    ld hl, sp-$01
    rst $38
    rst $38
    rst $38
    ret z

    ret


    ret z

    ret z

    ret z

    ret z

    ret z

    ret


    ret


    ret


    add hl, de
    add hl, bc
    rst $38
    rst $38
    rst $38
    rst $38
    ret z

    ret z

    ld c, [hl]
    adc $0e
    ld c, [hl]
    ld c, $0e
    ld c, $8e
    adc b
    ret z

    rst $38
    rst $38
    rst $38
    rst $38
    jr jr_00d_482c

    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    ld e, $1e
    rst $38
    rst $38
    rst $38
    rst $38
    rra
    rra
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a

jr_00d_482c:
    ld a, a
    ld a, a
    rst $38
    rst $38
    rst $38
    rst $38
    pop bc
    add b
    adc b
    sbc h
    sbc h
    sbc h
    sbc h
    sbc h
    adc b
    sbc h
    pop bc
    add b
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
    rst $20
    rst $38
    jp $c3e7


    rst $20
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
    nop
    nop
    nop
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
    nop
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
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $120f
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
    inc d
    dec d
    ld d, $17
    jr jr_00d_48af

    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $1f
    nop
    nop
    nop
    nop
    nop
    jr nz, @+$23

    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $27
    jr z, jr_00d_48d4

    ld a, [hl+]
    dec hl
    inc l
    dec l

jr_00d_48af:
    ld l, $2f
    jr nc, jr_00d_48e4

    nop
    nop
    ld [hl-], a
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    nop
    jr c, jr_00d_48be

jr_00d_48be:
    add hl, sp
    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $3f
    ld b, b
    ld b, c
    nop
    nop
    ld b, d
    ld b, e
    ld b, h
    ld b, l
    ld b, [hl]
    ld b, a
    ld c, b
    ld c, c
    ld c, d
    ld c, e
    ld c, h

jr_00d_48d4:
    ld c, l
    ld c, [hl]
    ld c, a
    ld d, b
    ld d, c
    ld d, d
    ld d, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_48e4:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld d, l
    ld d, [hl]
    ld d, a
    nop
    ld e, b
    ld e, c
    ld e, d
    ld e, e
    nop
    ld e, h
    ld e, c
    ld e, l
    nop
    ld d, [hl]
    ld d, a
    nop
    nop
    nop
    ld d, a
    ld e, h
    ld e, e
    ld e, [hl]
    ld d, [hl]
    ld e, c
    ld e, a
    ld e, a
    ld h, b
    nop
    ld h, c
    ld e, e
    ld d, a
    ld d, [hl]
    ld e, b
    ld h, d
    ld e, e
    ld h, c
    nop
    nop
    ld h, e
    ld h, h
    ld h, l
    nop
    ld h, [hl]
    ld h, a
    ld l, b
    ld l, c
    nop
    ld l, d
    ld h, h
    ld l, e
    nop
    ld l, h
    ld h, h
    ld l, l
    ld h, h
    ld h, l
    ld l, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld e, h
    ld e, a
    ld e, e
    ld e, c
    ld d, a
    ld e, e
    nop
    ld l, a
    ld d, a
    ld e, e
    nop
    ld e, c
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
    ld [hl], b
    ld a, c
    ld a, d
    ld a, e
    ld a, h
    ld a, l
    ld a, [hl]
    ld a, a
    add b
    add c
    add d
    nop
    ld d, h
    add e
    nop
    ld e, h
    ld e, a
    ld e, c
    ld h, b
    nop
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
    nop
    ld e, b
    ld e, c
    ld e, d
    ld e, e
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    INCBIN "gfx/image_00d_49b8.2bpp"

    db $00
    
    INCBIN "gfx/image_00d_4fb8.2bpp"

    db $01, $02, $03, $04, $05, $06, $07, $07, $07, $07, $07, $08, $09, $0a, $0b
    db $0c, $0d, $0e, $0f, $07, $10, $11, $12, $13, $14, $07, $15, $16, $16, $16, $17
    db $07, $18, $19, $1a, $1b, $07, $1c, $1d, $07, $07, $07, $1e, $1f, $20, $07, $21
    db $22, $23, $24, $25, $07, $07, $07, $07, $07, $07, $26, $27, $07, $07, $07, $07
    db $07, $07, $07, $21, $28, $29, $2a, $25, $2b, $07, $07, $07, $07, $07, $2c, $2d
    db $2e, $07, $07, $07, $07, $07, $07, $2f, $30, $30, $30, $31, $07, $07, $07, $07
    db $07, $07, $32, $33, $34, $07, $07, $07, $07, $07, $07, $21, $35, $35, $35, $25
    db $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $21
    db $36, $36, $36, $25, $2b, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07
    db $07, $07, $07, $2f, $30, $30, $30, $31, $07, $07, $07, $07, $07, $07, $07, $07
    db $07, $07, $07, $07, $07, $07, $07, $21, $37, $38, $07, $25, $07, $07, $07, $07
    db $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $21, $37, $38, $07, $25
    db $2b, $07, $07, $07, $07, $07, $07, $39, $3a, $3b, $07, $07, $07, $07, $07, $2f
    db $30, $30, $30, $31, $07, $07, $07, $07, $07, $07, $07, $3c, $3d, $3e, $3f, $07
    db $07, $07, $07, $21, $40, $40, $40, $25, $07, $07, $07, $07, $07, $07, $41, $42
    db $43, $44, $45, $07, $07, $07, $07, $21, $46, $46, $46, $25, $2b, $07, $07, $07
    db $07, $07, $47, $48, $07, $49, $4a, $07, $07, $07, $07, $2f, $30, $30, $30, $31
    db $07, $07, $07, $07, $07, $07, $4b, $4c, $4d, $4e, $4f, $07, $07, $07, $07, $21
    db $50, $38, $07, $25, $07, $07, $07, $07, $07, $07, $07, $07, $0c, $0d, $07, $07
    db $07, $07, $07, $21, $50, $38, $07, $25, $2b, $07, $07, $07, $07, $07, $07, $07
    db $1b, $07, $07, $15, $51, $52, $53, $54, $55, $55, $55, $56, $07, $07, $07, $57
    db $58, $07, $07, $07, $07, $07, $59, $5a, $5b, $5c, $5d, $07, $07, $07, $07, $07
    db $07, $07, $5e, $5f, $60, $61, $62, $07, $05, $05, $05, $05, $05, $05, $05, $00
    db $00, $00, $00, $00, $06, $06, $06, $06, $06, $06, $07, $07, $00, $05, $05, $05
    db $05, $05, $00, $00, $00, $00, $00, $00, $00, $06, $06, $06, $06, $00, $07, $07
    db $00, $00, $00, $05, $05, $05, $00, $00, $02, $02, $02, $00, $00, $00, $00, $00
    db $00, $00, $07, $07, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $00
    db $04, $00, $00, $00, $00, $00, $07, $07, $03, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $03, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $02, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $02, $02, $02, $00, $01, $00, $00, $00, $00, $00, $00, $04
    db $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $04, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $04, $04, $06, $06, $06, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $04, $04, $06, $06, $06, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04
    db $06, $06, $06, $00, $00, $00, $00, $00, $02, $02, $02, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $06, $06, $00, $00, $00, $00, $00, $00, $02, $02, $02, $00
    db $01, $00, $00, $00, $00, $00, $00, $00, $06, $00, $00, $05, $05, $05, $05, $00
    db $00, $00, $00, $00, $00, $00, $00, $03, $03, $00, $00, $00, $00, $00, $05, $05
    db $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $03, $03, $03, $03, $03, $00
    
    nop
    inc sp
    nop
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    nop
    nop
    nop
    nop
    ld [$2004], sp
    inc e
    ld [$30fc], sp
    db $fc
    db $e4
    ld hl, sp-$78
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], b
    add b
    jr c, @-$3e

    inc a
    ret nz

    ld a, h
    add b
    ld hl, sp+$00
    ldh a, [rP1]
    db $10
    jr nz, jr_00d_52eb

    jr c, jr_00d_52f9

    ccf
    inc c

jr_00d_52eb:
    ccf
    daa
    rra
    ld de, $000f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_52f9:
    call z, $cc00
    call z, $cccc
    call z, RST_00
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
    rst $38
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
    inc sp
    nop
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    nop
    nop
    nop
    nop
    ld [$2004], sp
    inc e
    ld [$30fc], sp
    db $fc
    db $e4
    ld hl, sp-$78
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
    inc bc
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
    nop
    nop
    nop
    nop
    nop
    add b
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
    ret nz

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

jr_00d_53bb:
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
    add b
    nop
    nop
    add b
    add b
    add b
    add b
    add b
    ld bc, $0101
    ld bc, $0100
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    ld bc, $0004
    inc bc
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    ld [$0000], sp
    db $10
    jr nz, jr_00d_5430

    ld b, b
    ld b, b
    add b
    add b
    ld bc, $0201
    ld [bc], a
    inc b
    inc b
    nop
    ld [$0010], sp
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
    jr nz, jr_00d_53bb

    nop
    nop
    nop
    nop
    nop

jr_00d_5430:
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
    add hl, bc
    ld bc, $0501
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_544a:
    nop
    nop
    stop
    nop
    jr nz, jr_00d_5491

    ld b, b
    di
    db $fc
    rst $08
    ccf
    ld [bc], a
    ld [bc], a
    nop
    inc b
    ld [$0000], sp
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
    and b
    sub b
    add b
    add b
    add b
    nop
    add b
    add b
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    ld b, b
    nop
    ld bc, $0120
    db $10
    ld [$0409], sp
    dec b
    inc bc
    inc bc
    ld h, a
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$0000], sp
    db $10
    add b
    jr nz, jr_00d_54d1

jr_00d_5491:
    ret nz

    and b
    ret nz

    dec b
    inc bc
    ld [bc], a
    inc bc
    ld bc, $0004
    ld [$0010], sp
    nop
    nop
    nop
    nop
    nop
    nop
    and $f8
    ret nz

    ret nz

    jr nz, jr_00d_544a

    db $10
    sub b
    add b
    ld [$0480], sp
    ld [bc], a
    nop
    ld bc, $0100
    nop
    ld bc, $0000
    ld bc, $0100
    add hl, bc
    ld bc, $0501
    inc bc
    inc bc
    ld h, a
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$0000], sp
    db $10
    and b
    jr nz, jr_00d_5511

jr_00d_54d1:
    ret nz

    and b
    ret nz

    dec b
    inc bc
    ld [bc], a
    inc bc
    dec b
    inc b
    ld [$1008], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and $f8
    ret nz

    ret nz

    add b
    and b
    sub b
    add b
    nop
    add b
    nop
    add b
    add b

jr_00d_54f1:
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
    ld [$0000], sp
    inc b
    inc bc
    ld [bc], a
    inc bc
    ld bc, $0000
    nop
    nop
    nop
    nop
    ld [$0000], sp
    stop
    jr nz, jr_00d_54f1

jr_00d_5511:
    ld b, b
    ret z

    ldh a, [rNR13]
    rrca
    rlca
    ld [bc], a
    nop
    inc b
    nop
    ld [$0010], sp
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    add b
    ret nz

    ld b, b
    nop
    jr nz, jr_00d_553b

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_553b:
    nop
    nop
    nop
    ld [bc], a
    nop
    nop
    ld bc, $0f33
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    call z, Call_000_00f0
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
    db $10
    db $10
    jr nc, jr_00d_55b0

    ld [hl], b
    ld a, h
    ld c, $f0
    inc e
    ld h, b
    jr jr_00d_55a0

    stop
    nop
    nop
    ld [de], a
    inc h
    nop
    nop
    ld [hl+], a
    ld b, h
    ld h, [hl]
    ld b, h
    inc b
    ld h, [hl]
    jr jr_00d_560e

    ld b, d
    inc a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, [hl]
    ld a, b
    ld a, $40
    nop
    nop

jr_00d_55a0:
    nop
    nop
    nop
    nop
    ld [de], a
    inc h
    nop
    nop
    ld a, [de]
    inc a
    ld [hl+], a
    ld b, h
    ld a, [hl]
    nop
    ld b, b
    ld a, [hl]

jr_00d_55b0:
    nop
    ld h, [hl]
    nop
    nop
    jr nc, @+$12

    jr jr_00d_55c0

    ld h, [hl]
    ld a, b
    ld a, $40
    nop
    jr jr_00d_5623

    ld a, d

jr_00d_55c0:
    nop
    ld a, [hl]
    nop
    nop
    inc c
    ld [$1018], sp
    ld h, $40
    ld [hl+], a
    ld b, h
    ld h, d
    ld b, h
    jr jr_00d_564e

    ld b, d
    inc a
    nop
    nop
    inc c
    ld [$1018], sp
    ld h, [hl]
    ld a, b
    ld a, $40
    nop
    jr jr_00d_5643

    ld a, d
    nop
    ld a, [hl]
    nop
    nop
    ld a, d
    ld [hl-], a
    ld l, [hl]
    ld c, h
    inc c
    jr nc, @+$60

    ld h, b
    ld [hl+], a
    ld b, h
    ld b, h
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    inc c
    ld [$1018], sp
    ld [hl+], a
    ld a, h
    jr nz, jr_00d_563c

    ld l, h
    jr jr_00d_55ff

jr_00d_55ff:
    ld h, b
    ld b, b
    ld a, $00
    nop
    inc c
    ld [$1018], sp
    ld [bc], a
    inc a
    ld [hl+], a
    ld b, h
    ld a, [hl]
    nop

jr_00d_560e:
    ld b, b
    ld a, [hl]
    nop
    ld h, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0102
    inc bc
    ld bc, $0403
    nop
    nop

jr_00d_5623:
    nop
    nop
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
    ld b, $07
    ld [$0807], sp
    add hl, bc
    ld a, [bc]
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_563c:
    nop
    nop
    nop
    nop
    nop
    dec bc
    inc c

jr_00d_5643:
    dec c
    ld c, $0f
    db $10
    ld de, $1312
    inc d
    nop
    nop
    nop

jr_00d_564e:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec d
    ld d, $17
    jr jr_00d_5673

    ld a, [de]
    dec de
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_5673:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_00d_576a

    ld hl, $2121
    ld [hl+], a
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
    inc h
    dec h
    ld h, $26
    ld h, $26
    daa
    jr z, jr_00d_5763

jr_00d_5763:
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_576a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
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
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    nop
    nop
    nop
    nop
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0000
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
    nop
    nop
    nop
    ld [bc], a
    ld [bc], a

jr_00d_58c4:
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
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
    nop
    nop
    nop
    scf
    db $eb
    cp b
    ld b, a

jr_00d_58e8:
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
    call c, $4ebd
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
    jr z, jr_00d_58c4

    ld b, b
    ld [hl], b
    add b
    jr nc, jr_00d_58e8

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
    jp nc, Jump_00d_6897

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
    jp nz, Jump_00d_4481

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
    jr c, jr_00d_5ca1

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

jr_00d_5ca1:
    rrca
    jr jr_00d_5cab

    inc e
    rrca
    ld c, b
    rst $38
    ld hl, $f4fe

jr_00d_5cab:
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

jr_00d_5cba:
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
    jr jr_00d_5cba

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
    jr nc, jr_00d_5de8

jr_00d_5de8:
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
    jr jr_00d_5df8

jr_00d_5df8:
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
    jr nz, jr_00d_5e80

jr_00d_5e80:
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
    jr jr_00d_5f25

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

jr_00d_5f25:
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
    jr c, jr_00d_5f31

jr_00d_5f31:
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
    jr nz, jr_00d_5f5a

jr_00d_5f5a:
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

jr_00d_5f72:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_5f83:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr c, jr_00d_601e

    ld [hl], c
    ld [hl], b
    rst $30
    jp $83c7


    ld b, e

jr_00d_5fb5:
    add e
    rst $00

jr_00d_5fb7:
    add e
    db $e3
    rst $38
    rst $38

jr_00d_5fbb:
    rst $38
    rst $38

jr_00d_5fbd:
    ld a, a
    ei
    rst $38
    sbc h
    jr c, jr_00d_5fbb

    jr c, jr_00d_5fb5

    jr c, jr_00d_5fb7

    jr c, jr_00d_5fbd

    jr c, jr_00d_5f83

    jr c, jr_00d_5fe9

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
    jr nz, jr_00d_5fe5

    nop

jr_00d_5fe5:
    nop
    nop
    nop
    add b

jr_00d_5fe9:
    nop
    add b
    nop
    add b
    nop
    ld c, b
    jr nc, jr_00d_5f72

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

jr_00d_601e:
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
    jr nc, jr_00d_60cc

    ld e, h
    jr c, jr_00d_60b3

    jr c, jr_00d_60b1

    cp h
    call c, $dcfc
    db $fc
    inc e
    inc a
    db $fc

jr_00d_6061:
    jr c, jr_00d_60df

    jr c, jr_00d_60e1

    jr c, jr_00d_60c3

    jr c, jr_00d_60e5

    jr c, jr_00d_60e7

    jr c, @+$7e

    jr c, jr_00d_60eb

    jr c, jr_00d_6061

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

jr_00d_60b1:
    nop
    ccf

jr_00d_60b3:
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

jr_00d_60c3:
    ld [hl], a
    db $e3
    rst $30
    ret nc

    ld [c], a
    add b
    nop
    nop
    nop

jr_00d_60cc:
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

jr_00d_60df:
    nop
    dec e

jr_00d_60e1:
    adc [hl]
    adc a
    rrca
    inc bc

jr_00d_60e5:
    add a
    add d

jr_00d_60e7:
    ld bc, $0000
    nop

jr_00d_60eb:
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
    jr c, jr_00d_6142

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

jr_00d_6142:
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

jr_00d_6181:
    jr c, jr_00d_6181

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

jr_00d_6208:
    nop
    nop
    ld b, h
    jr c, jr_00d_6208

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
    jr jr_00d_626a

jr_00d_626a:
    inc a
    jr jr_00d_62ab

    jr jr_00d_62a7

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
    jr jr_00d_6291

jr_00d_6291:
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

jr_00d_62a7:
    nop
    ccf
    nop
    rst $38

jr_00d_62ab:
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
    jr c, jr_00d_6378

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

jr_00d_6378:
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
    jr c, jr_00d_6429

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

jr_00d_6429:
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
    jr c, jr_00d_64c2

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

jr_00d_64c2:
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
    jr nc, jr_00d_665a

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

jr_00d_665a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nc, jr_00d_6771

    jr nc, jr_00d_6773

    jr nc, jr_00d_6773

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

jr_00d_6771:
    nop
    nop

jr_00d_6773:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_00d_67f8

jr_00d_67f8:
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
    jr nz, jr_00d_680a

jr_00d_680a:
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
    jr c, jr_00d_6854

    jr nc, jr_00d_6849

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

jr_00d_6849:
    db $fd
    add hl, sp
    nop
    nop
    nop
    nop
    nop
    ld hl, sp-$40
    ldh a, [$c0]

jr_00d_6854:
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

Jump_00d_6897:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

jr_00d_6931:
    nop
    nop
    nop
    nop
    nop
    rst $20
    jr c, jr_00d_6931

jr_00d_6939:
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
    jr nz, jr_00d_6939

    ld a, l
    ld a, d
    push af
    rst $38
    ld [hl], b
    ei

jr_00d_695d:
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

    jr nz, jr_00d_695d

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

jr_00d_6a79:
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

    jr nz, jr_00d_6a79

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
    jr jr_00d_6b7d

jr_00d_6b7d:
    nop
    nop
    nop
    ld a, c
    sbc [hl]
    jp c, Jump_00d_7c3d

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
    jr nz, jr_00d_6b9f

jr_00d_6b9f:
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

jr_00d_70c4:
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
    jr nc, jr_00d_70c4

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
    jr c, jr_00d_7525

    nop
    nop
    rst $28
    rrca

jr_00d_7522:
    rst $08
    rrca
    rst $08

jr_00d_7525:
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
    jr nz, jr_00d_7522

    ld d, b
    add b
    jr nz, jr_00d_75a6

jr_00d_75a6:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr c, jr_00d_768c

    inc a
    ld [hl], a
    jr c, jr_00d_7691

    ld a, [hl-]
    ld [hl], a
    jr c, jr_00d_7621

jr_00d_7621:
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
    jr z, jr_00d_76ba

    sub b

jr_00d_764c:
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
    jr nz, jr_00d_764c

jr_00d_768c:
    ld b, b
    add b
    ld h, b
    add b
    nop

jr_00d_7691:
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

jr_00d_76ba:
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
    jr nz, jr_00d_78f8

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

jr_00d_78f8:
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
    jr nz, jr_00d_7988

jr_00d_7988:
    ld d, a
    jr nc, jr_00d_79d7

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

jr_00d_79d7:
    nop
    ld d, $08
    jr jr_00d_79fa

    db $10
    ld a, $12
    inc a
    nop
    nop
    nop

Jump_00d_79e3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_79fa:
    rrca
    nop
    jr nc, jr_00d_7a3d

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

jr_00d_7a3d:
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

jr_00d_7a96:
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
    jr nz, jr_00d_7a96

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
    jr c, jr_00d_7add

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

jr_00d_7add:
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
    jp Jump_00d_7e99


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

Jump_00d_7be3:
    jr c, jr_00d_7be5

jr_00d_7be5:
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
    jr nz, jr_00d_7c0a

jr_00d_7c0a:
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

Jump_00d_7c3d:
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
    jr c, jr_00d_7c8d

    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_7c8d:
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
    jr jr_00d_7cf3

    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $1f
    jr nz, jr_00d_7d03

    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $27
    jr z, jr_00d_7d13

    ld a, [hl+]
    dec hl
    inc l
    dec l
    ld l, $2f
    jr nc, jr_00d_7d23

    ld [hl-], a

jr_00d_7cf3:
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

jr_00d_7d03:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_7d13:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_7d23:
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
    inc h
    nop
    nop
    ld [hl+], a
    ld b, h
    ld h, [hl]
    ld b, h
    inc b
    ld h, [hl]
    jr jr_00d_7db6

    ld b, d
    inc a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, [hl]
    ld a, b
    ld a, $40
    nop
    nop
    nop
    nop
    nop
    nop
    ld [de], a
    inc h
    nop
    nop
    ld a, [de]
    inc a
    ld [hl+], a
    ld b, h
    ld a, [hl]
    nop
    ld b, b
    ld a, [hl]
    nop
    ld h, [hl]
    nop
    nop
    jr nc, @+$12

    jr jr_00d_7d68

    ld h, [hl]
    ld a, b
    ld a, $40
    nop
    jr jr_00d_7dcb

    ld a, d

jr_00d_7d68:
    nop
    ld a, [hl]
    nop
    nop
    inc c
    ld [$1018], sp
    ld h, $40
    ld [hl+], a
    ld b, h
    ld h, d
    ld b, h
    jr @+$80

    ld b, d
    inc a

jr_00d_7d7a:
    nop
    nop
    inc c
    ld [$1018], sp
    ld h, [hl]
    ld a, b
    ld a, $40
    nop
    jr jr_00d_7deb

    ld a, d
    nop
    ld a, [hl]
    nop
    nop
    ld a, d
    ld [hl-], a
    ld l, [hl]
    ld c, h
    inc c

jr_00d_7d91:
    jr nc, jr_00d_7df1

    ld h, b
    ld [hl+], a

jr_00d_7d95:
    ld b, h
    ld b, h
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    inc c
    ld [$1018], sp
    ld [hl+], a
    ld a, h
    jr nz, jr_00d_7de4

    ld l, h
    jr jr_00d_7da7

jr_00d_7da7:
    ld h, b
    ld b, b
    ld a, $00
    nop
    inc c
    ld [$1018], sp
    ld [bc], a
    inc a
    ld [hl+], a
    ld b, h
    ld a, [hl]
    nop

jr_00d_7db6:
    ld b, b
    ld a, [hl]
    nop
    ld h, [hl]
    nop
    nop
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

jr_00d_7dcb:
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
    jp nc, Jump_00d_79e3

    add d
    adc b
    ld de, $0099

jr_00d_7de4:
    ld de, $1199
    sbc c
    nop
    sbc c
    nop

jr_00d_7deb:
    nop
    ld e, l
    adc [hl]
    rst $10
    jr jr_00d_7d7a

jr_00d_7df1:
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
    jr nc, jr_00d_7d91

    jr nz, jr_00d_7d95

    inc c
    inc c
    add [hl]
    ld [$a2be], sp
    inc e
    nop
    nop
    jp nc, Jump_00d_7be3

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
    sub d
    inc a
    xor [hl]
    jr nc, jr_00d_7e41

    jr nz, jr_00d_7e67

    ld [$3000], sp
    inc c
    ld a, $20
    ld e, $00
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_7e41:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00d_7e67:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_00d_7e99:
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

; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00a", ROMX[$4000], BANK[$a]

    INCBIN "gfx/image_00a_4000.2bpp"

    INCBIN "gfx/image_00a_5f00.2bpp"

    add $b8
    push de
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
    xor d
    nop
    ld l, c
    nop
    ld a, [de]
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sub c
    nop
    add hl, de
    nop
    xor c
    nop
    jr jr_00a_5ff9

    xor c

jr_00a_5ff9:
    nop
    add hl, de
    nop
    ld c, b
    ld bc, $0019
    ld h, b
    sbc a
    ld [c], a
    dec e
    and b
    ld e, a
    ldh [$1f], a
    ld h, b
    sbc a
    db $e4
    rra
    add sp, $1f
    ld h, b
    sbc a
    ld a, [bc]
    ld hl, sp-$6e
    ld l, b
    ld [hl+], a
    ret c

    ld [bc], a
    ld hl, sp+$09
    ld hl, sp+$1d
    ld hl, sp+$02
    ld hl, sp+$21
    ret c

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
    xor d
    nop
    ld d, l
    nop
    xor [hl]
    nop
    rst $30
    nop
    xor l
    nop
    ld a, e
    nop
    sub $00
    cp a
    nop
    ldh [rP1], a
    or h
    nop
    call nc, $df00
    nop
    ld [hl], l
    nop
    xor b
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00a_604e

jr_00a_604e:
    nop
    nop
    ld l, l
    nop
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
    ld c, b
    nop
    xor b
    nop
    ld c, b
    nop

jr_00a_6066:
    jr nz, jr_00a_6068

jr_00a_6068:
    stop
    ld [$0000], sp
    nop
    nop
    nop
    ldh a, [rP1]
    ldh a, [rP1]
    pop de
    nop
    ldh a, [rP1]
    ld a, [c]
    nop
    ret nc

    nop
    ldh a, [rP1]
    ldh a, [rP1]
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
    add b
    nop
    nop
    nop
    ld b, h
    dec sp
    ld a, e
    inc b
    rra
    nop
    dec b
    ld [bc], a
    jr nz, jr_00a_609a

jr_00a_609a:
    jr nc, jr_00a_609c

jr_00a_609c:
    inc e
    ld [bc], a
    ld b, h
    inc bc
    add hl, bc
    or $4d
    or d
    dec hl
    call nc, Call_000_00ff
    ld d, $0c
    and l
    jr jr_00a_60b7

    jr nc, jr_00a_6066

    ldh [$da], a
    nop
    or l
    nop
    ld d, [hl]
    nop
    xor d

jr_00a_60b7:
    nop
    or l
    nop
    ld e, e
    nop
    db $ed
    nop
    ld [hl], $00
    ld c, b
    nop
    jr nz, jr_00a_60c4

jr_00a_60c4:
    sub b
    nop
    add sp, $00
    ld b, b
    nop
    nop
    nop
    xor b
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
    ld [de], a
    nop
    nop
    nop
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
    add h
    nop
    ld l, e
    nop
    dec b
    ld [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $4800
    nop
    ld [bc], a
    nop
    ret nz

    nop
    dec e
    ldh [$08], a
    ld bc, $0009
    ld [$0001], sp
    ld bc, $0009
    nop
    ld bc, $0001
    ld bc, $e000
    rra
    ld [c], a
    dec e
    db $f4
    rrca
    ret nz

    ccf
    ldh a, [rIF]
    ldh [$1f], a
    ldh a, [rIF]
    ld d, b
    xor a
    ret nc

    nop
    ld h, b
    nop
    add b
    nop
    ld b, b
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
    ld d, $00
    ld b, $09
    jr jr_00a_613f

    db $10
    rrca
    and b
    rrca
    nop
    rrca
    ld [de], a

jr_00a_613f:
    dec c
    adc b
    nop
    sbc d
    ld h, b
    ld c, l
    or b
    ld a, [bc]
    db $f4
    inc bc
    db $fc
    ld bc, $00fe
    rst $38
    ld bc, $00fe
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    and b
    nop
    add b
    nop
    ret nz

    nop
    ret nz

    ld bc, $00e1
    ldh a, [rP1]
    ret nc

    nop
    ldh a, [rP1]
    pop af
    nop
    ldh a, [rP1]
    pop af
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
    ld b, b
    nop
    add b
    nop
    jr z, jr_00a_6182

jr_00a_6182:
    ld d, l
    nop
    ld a, [hl+]
    nop

jr_00a_6186:
    dec l
    nop
    add l
    nop
    add hl, hl
    nop
    sub d
    nop
    add hl, hl
    nop
    ld a, [bc]
    nop
    ld d, l
    nop
    xor l
    nop
    ld d, l

jr_00a_6197:
    nop
    xor b
    nop
    ld d, l
    nop
    ld l, b
    nop
    ld b, l
    nop
    or [hl]
    nop
    ld [$b400], a
    nop
    ld a, e
    nop
    db $ed
    nop
    ld l, d
    nop
    or [hl]
    nop
    ei
    nop
    ld [hl], c
    nop
    ld b, b
    ld bc, $0102
    nop
    ld bc, $0100
    nop
    ld bc, $0041
    add c
    nop
    nop
    ret nz

    nop
    ret nz

    jr nz, jr_00a_6186

    ld b, b
    ret nz

    inc hl
    ret nz

    dec l
    jp nz, $c36c

    jr jr_00a_6197

    jr nc, jr_00a_61d9

    ld [hl], b
    rrca
    jr nc, jr_00a_61e5

    ld h, b
    rra
    nop

jr_00a_61d9:
    rst $38
    ld bc, $20ff
    rst $18
    sub l
    ld l, d
    daa
    ld hl, sp-$60
    rst $38
    ld d, b

jr_00a_61e5:
    rst $38
    add b
    rst $38
    nop
    rst $38
    jr nz, @+$01

    ret nz

    rst $38
    ld h, b
    rra
    ld b, c
    nop
    add c
    nop
    pop hl
    nop
    ld sp, $69c0
    add b
    xor c
    ld b, b
    ret


    nop
    ld c, l
    add b
    ldh [$1f], a
    ld [c], a
    dec e
    and b
    ld e, a
    or b
    ld c, a
    ret nz

    ccf
    and b
    ld e, a
    ret nz

    ccf
    and h
    ld e, e
    add b
    nop
    ld b, h
    nop
    or b
    ld [bc], a
    ld [hl], b
    ld [bc], a
    sub e
    nop
    xor b
    ld bc, $00a1
    ld e, e
    nop
    jr z, jr_00a_6239

    jp c, $ff05

    nop
    ld l, e
    nop
    cp [hl]
    ld b, c
    ld [hl], c
    ld c, $d1
    ld l, $e9
    ld d, $24
    ld a, [$e213]
    call c, Call_000_1d20
    ld h, d
    ld [de], a

jr_00a_6239:
    ld l, l
    sbc b
    ld h, a
    ret c

    daa
    adc l
    ld [hl], d
    ret c

    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    sbc $22
    ld a, h
    add d
    ld e, $e0
    ld e, h
    and b
    ld d, b
    xor b
    ld [bc], a
    nop
    ld d, h
    nop
    ld bc, $e100
    ld h, b
    add c
    ld h, b
    and c
    ld b, b
    add b
    ld h, b
    nop
    nop
    ld de, $a000
    nop
    ld bc, $0000
    nop
    add d
    nop
    inc b
    nop
    ld a, [bc]
    nop
    ld [$0500], sp
    nop
    ld d, d
    nop
    ld a, [hl+]
    nop
    adc c
    nop
    ld d, h
    nop
    ld [bc], a
    nop
    xor c
    nop
    ld b, h
    nop
    and d
    nop
    ld c, c
    nop
    and h
    nop
    ld [bc], a
    nop
    ld l, c
    nop
    nop
    nop
    ld d, d
    nop
    adc d
    nop
    ld [de], a
    nop
    xor c
    nop
    ld b, h
    nop
    cp e
    nop
    sub $00
    ld l, e
    nop
    sub c
    ld b, $aa
    rlca
    jr nz, jr_00a_62a3

    inc bc

jr_00a_62a3:
    nop
    add [hl]
    ld bc, $016e
    adc d
    dec b
    jr z, jr_00a_62c3

    ld [hl], l
    ld a, [bc]
    adc b
    ld [hl], a
    ld c, h
    add e
    ld l, d
    add l
    ld a, b
    add a
    ld h, l
    sbc d
    ld [hl], h
    adc e
    ld h, b
    sbc a
    ld a, [hl-]
    push bc
    add hl, sp
    add $19
    and $09

jr_00a_62c3:
    ldh a, [rSB]
    cp $00
    rst $38
    nop
    rst $38
    ld [bc], a
    db $fd
    ld de, $20ee
    rst $18
    ldh a, [rIF]
    rrca
    ldh a, [$0c]
    ldh a, [$0e]
    ldh a, [$0e]
    ldh a, [rNR33]
    ldh a, [$0c]
    ldh a, [$8a]
    ld [hl], b
    xor c
    nop
    add hl, bc
    nop
    add hl, hl
    nop
    adc c
    nop
    jr z, jr_00a_62ea

jr_00a_62ea:
    dec c
    nop
    xor b
    nop
    cp a
    nop

jr_00a_62f0:
    and b
    nop
    ld d, b
    nop
    jr nz, jr_00a_62f6

jr_00a_62f6:
    inc h
    nop
    ld c, d
    nop
    ld d, l
    nop
    xor b
    nop
    xor h
    nop
    ld h, l
    ld a, [de]
    ld l, a
    db $10
    ld d, $28
    dec [hl]
    ld a, [bc]
    dec c
    ld [de], a
    ld b, $09
    ld b, $01
    dec b
    nop

jr_00a_6310:
    rst $18
    jr nz, jr_00a_62f0

    nop
    sbc a
    nop
    and $79
    db $fc
    inc bc
    ld [hl], a
    adc b
    adc l
    ld [hl], d
    rst $38
    nop
    xor d
    ld d, b
    jr z, jr_00a_6374

    ld e, b
    and b
    cp b
    ld b, b
    db $fc
    nop
    ld a, [$7500]
    nop
    ld d, l
    nop
    ld b, b
    ld b, c
    ld b, b
    nop
    add b
    nop
    add b
    nop
    ld [bc], a
    nop
    and l
    nop
    ld [de], a
    nop
    ld d, h
    nop
    dec d
    nop
    ld a, [hl+]
    nop
    ld c, l
    nop
    dec h
    nop
    and l
    nop
    ld [hl-], a
    nop
    xor d
    nop
    ld b, l
    nop
    xor d
    nop
    db $eb
    nop
    ld l, d
    nop
    xor d
    nop
    adc e
    jr nz, jr_00a_6310

    nop
    ld l, d
    nop
    ld a, e
    nop
    ld c, d
    dec e
    ld b, $0f
    rlca
    inc bc
    ld bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and h
    ld e, e
    db $10
    rst $28

jr_00a_6374:
    add b
    ld a, a
    add b
    rst $38
    ret nz

    ld a, a
    jr nc, jr_00a_63bb

    ld [$061f], sp
    rlca
    inc a
    jp $e51a


    ld b, $f9
    inc bc
    db $fc
    rlca
    ld hl, sp+$00
    rst $38
    nop
    rst $38
    nop
    rst $38
    cp b
    ld b, a
    adc a
    ld [hl], b
    rrca
    ldh a, [$97]
    ld l, b
    xor d
    ld d, h
    ld [$b814], a
    ld c, b
    and b
    ld d, b
    rst $00
    jr nc, @-$39

    nop
    ld b, d
    nop
    dec c
    nop
    dec bc
    nop
    ld bc, $0000
    nop
    nop
    nop
    rla
    nop
    xor $00
    ld h, e
    nop
    ld e, e
    add h
    ld h, [hl]
    nop
    ld e, e

jr_00a_63bb:
    nop
    ccf
    nop
    ld b, $00
    ldh [$1f], a
    ld h, h
    sbc e
    ld [hl], b
    adc a
    jp c, $7025

    adc a
    ld [hl], h
    adc e
    ldh a, [rIF]
    ld [hl], b
    adc a
    add h
    ld a, b
    inc d
    add sp, $04
    ld hl, sp+$2c
    ret nc

    rlca
    ld hl, sp-$6f
    ld l, h
    ld [bc], a
    db $fc
    ld d, h
    xor a
    inc d
    add b
    xor d
    nop
    xor b
    nop
    inc e
    nop
    inc b
    nop
    or b
    ld b, b
    add d
    db $10
    ld d, d
    jr nz, jr_00a_6435

    jr nz, jr_00a_6419

    nop
    inc hl
    nop
    ld a, [hl+]
    ld bc, $0097
    xor e
    nop
    xor c
    nop
    ld d, [hl]
    nop

Jump_00a_6400:
    db $fc
    nop
    ld [bc], a
    nop
    jp c, $8b00

    ld h, b
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    ld e, d
    nop
    push de
    nop
    ld d, h
    nop
    xor d
    nop
    ld d, l
    nop
    or l

jr_00a_6419:
    nop
    ld d, h
    nop
    xor d
    nop
    xor d
    nop
    ld c, d
    nop
    and l
    nop
    ld d, h
    nop
    ld c, d
    nop
    ld d, l
    nop
    xor d
    nop
    sub l
    nop
    xor d
    nop
    or d
    nop
    ld c, d
    nop
    or d

jr_00a_6435:
    nop
    ld d, l
    nop
    ld d, d
    nop
    xor c
    nop
    dec h
    nop
    or d
    nop
    inc b
    nop
    ld d, c
    nop
    ld [hl+], a
    ld bc, $0093
    ld bc, $4b06
    inc b
    add l
    ld a, [bc]
    dec d
    ld a, [bc]
    ld [$f400], a
    nop
    jp hl


    ld d, $35
    jp z, $55aa

    add hl, bc
    or $e4
    dec de
    xor d
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
    nop
    nop
    nop
    nop
    ld [$e1ff], sp
    ld a, a
    rra
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
    add b
    ld h, b
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
    ld c, $00
    ld [bc], a
    nop
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
    ld [hl], h
    adc e
    ld [hl], d
    adc l
    db $f4
    dec bc
    db $f4
    dec bc
    or l
    ld c, d
    ld [hl], b
    adc a
    db $fd
    ld [bc], a
    ld [hl], h
    adc e
    inc de
    rst $28
    ld d, b
    xor b
    inc b
    ld hl, sp+$50
    xor b
    db $10
    add sp, $14
    add sp, $40
    cp b
    inc d
    add sp, -$80
    ld bc, $0000
    nop
    nop
    ld [bc], a
    nop
    ld a, [bc]
    nop
    ld de, $2500
    nop
    ld a, [hl+]
    nop
    add hl, hl
    ret nz

    dec h
    nop
    sub h
    nop
    and d
    nop
    ld e, d
    nop
    ld c, d
    nop
    ld d, l
    nop
    xor d
    nop
    ld c, c
    nop
    ld a, [hl+]
    nop
    and l
    nop
    xor d
    nop
    xor d
    nop
    xor d
    nop
    ld c, d
    nop
    xor d
    nop
    ld l, d
    nop
    sub l
    nop
    ld d, d
    nop
    xor l
    nop
    xor d
    nop
    xor d
    nop
    or l
    nop
    jp nc, $aa00

    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    xor d
    nop
    ld d, l
    nop
    or [hl]
    nop
    sub l
    nop
    ld d, d
    nop
    push de
    nop
    ld c, c
    nop
    xor h
    nop
    jp nc, $4a00

    nop
    and b
    nop
    ld b, b
    nop
    xor d
    nop
    ld b, c
    nop
    ld d, h
    nop
    and b
    nop
    and d
    nop
    xor b
    nop
    ld b, b
    nop
    ld e, [hl]
    ld bc, $043b
    ld a, [hl+]
    dec d
    ld h, c
    nop
    ld h, l
    ld [bc], a
    rst $38
    nop
    add l
    ld [bc], a
    add l
    ld a, [bc]
    xor c
    ld d, [hl]
    ld d, h
    xor e
    jp nc, $502d

    xor a
    ld e, c
    and [hl]
    ld c, d
    or l
    ld c, d
    or l
    dec [hl]
    jp z, RST_00

    nop
    nop
    nop
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
    jr jr_00a_6585

    jr nz, @+$01

    nop
    nop
    nop
    nop
    nop

jr_00a_6585:
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00a_658c:
    xor d
    rst $38
    add hl, bc
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
    ld a, [hl+]
    rst $38
    ld d, b
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
    ld b, b
    add b
    nop
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
    ld bc, $e400
    dec bc
    db $f4
    dec bc
    ld [hl], h
    dec bc
    jr c, jr_00a_660f

    ld [hl], d
    dec c
    inc [hl]
    ld c, e
    ld [hl], d
    dec c
    ld a, d
    add l
    ld b, b
    cp b
    inc b
    ld hl, sp-$50
    ld c, b
    add h
    ld a, b
    inc b
    ld hl, sp+$14
    add sp, $0c
    ldh a, [rDIV]
    ld hl, sp+$12
    nop
    ld a, [hl+]
    nop
    add hl, hl
    nop
    dec d
    nop
    ld a, [hl+]
    nop
    dec h
    nop
    ld d, l
    nop
    ld a, [hl+]
    nop
    sub l
    nop
    ld d, d
    nop
    xor d
    nop
    ld d, h
    nop
    xor d
    nop
    ld a, [hl+]
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    sub l
    db $10
    ld a, [bc]
    jr jr_00a_658c

    ret c

    add c
    ld a, h
    ld d, c
    inc l
    sbc [hl]
    ld e, $8e

jr_00a_660f:
    inc de
    ld b, b
    inc b
    ld a, [hl]
    ld c, $1c
    ld e, $e7
    ldh [$66], a
    ld h, c
    ld hl, $7771
    or e
    ret c

    sbc e
    xor d
    nop
    or l
    nop
    ld a, [hl+]
    add b
    sub $b8
    cp b
    inc a
    ret c

    ldh [rP1], a
    ldh a, [rSB]
    ldh a, [$a8]
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
    dec bc
    nop
    db $dd
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
    cp a
    nop
    ei
    inc b
    ld c, d
    or l
    xor c
    nop
    nop
    ld bc, $0201
    inc bc
    nop
    ld [bc], a
    ld bc, $0001
    ret nz

    nop
    ldh [rP1], a
    ld e, d
    and l
    or $09
    cp d
    ld b, l
    push de
    ld a, [hl+]
    xor b
    ld d, a
    ld d, h
    xor e
    ld d, b
    xor a
    ld a, h
    inc bc
    nop
    rst $38
    ld b, [hl]
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
    add e
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
    sub b
    ld a, a
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
    pop hl
    add e
    ld [bc], a
    db $e3
    and d
    ld h, b
    dec b
    nop
    nop
    rra
    db $10
    rra
    inc b
    nop
    nop
    jr jr_00a_673b

    add l
    ld a, d
    dec b
    ld [hl], l
    ld a, [bc]
    ld a, d
    add l
    ld d, d
    adc l
    ld a, [bc]
    dec d
    ld a, [de]
    dec b
    dec de
    inc b
    inc b
    ld hl, sp-$2c
    jr z, jr_00a_66e6

    db $ec
    dec h
    ret c

    add h
    ld a, b
    sub l
    ld l, b
    db $76
    adc b
    sbc l
    ld h, b
    xor d
    nop
    ld d, l
    nop
    ld b, l
    nop

jr_00a_66e6:
    ld [hl-], a
    nop
    xor d
    nop
    ld c, c
    nop
    xor d
    nop
    ld a, [hl+]
    nop
    sub h
    nop
    ld b, d
    nop
    ld h, e
    ld [bc], a
    sub b
    rrca
    ld h, h
    rrca
    sbc c
    nop
    ld d, h
    nop
    ld c, d
    nop
    cp d
    ccf
    ld d, l
    adc [hl]
    ld c, $8e
    sbc h
    inc e
    dec sp
    dec e
    ld b, c
    rra
    rr a
    xor [hl]
    jr nz, jr_00a_6780

    call z, $e5cd
    ld b, c
    rst $10
    ld c, h
    sbc $fe
    sbc [hl]
    cp h
    sbc h
    or [hl]
    sbc a
    db $f4
    inc de
    pop bc
    jr nc, jr_00a_6766

    ret nc

    ld d, e
    ret nc

    ld hl, $a632
    ld b, c
    rst $00
    nop
    ld a, [c]
    ld de, $f004
    ldh a, [rIF]
    ld b, b
    cp a
    inc b
    ei
    ld d, b
    xor a
    add b
    ld a, a
    nop

jr_00a_673b:
    rst $38
    ld b, c
    cp [hl]
    db $10
    rrca
    add l
    ld a, d
    ld bc, $00fe
    rst $38
    nop
    rst $38
    ld h, $f9
    ld a, a
    add b
    ret nz

    ccf
    ld a, a
    add b
    ld b, b
    and b
    ld [hl], b
    add b
    cp c
    ld b, b
    ld b, b
    and b
    and h
    ld d, b
    ld e, b
    and b
    xor b
    ld d, b
    ld de, $7fe8
    nop
    nop
    nop
    nop
    nop

jr_00a_6766:
    nop
    nop
    dec hl
    nop
    dec d
    nop
    ld b, b
    nop
    xor b
    ld b, b
    nop
    rlca
    rlca
    rlca
    inc bc
    inc b
    ld bc, $0406
    inc bc
    and b
    nop
    inc d
    nop
    ld [bc], a
    nop

jr_00a_6780:
    db $10
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
    ld [$0907], sp
    nop
    inc b
    nop
    ld [bc], a
    nop
    nop
    rrca
    add hl, bc
    ld b, $02
    dec b
    nop
    rlca
    dec b
    ld hl, sp+$25
    nop
    sub l
    nop
    ld a, [bc]
    nop
    push bc
    ldh a, [$95]
    ld h, b
    adc d
    ld h, b
    add l
    ld h, b

jr_00a_67b0:
    ld d, l
    nop
    dec h
    nop
    ld d, l
    nop
    sub d
    nop
    ld a, [hl+]
    nop
    ld c, c
    nop
    ld a, [hl+]
    nop
    ld c, c
    nop
    jr z, jr_00a_67c2

jr_00a_67c2:
    ld d, l
    nop
    dec h
    nop
    sub h
    inc bc
    cp e
    nop
    ld [bc], a
    db $10
    and l
    nop
    ld c, b
    nop
    ld h, l
    ld b, b
    ld l, d
    ret nz

    ld c, l
    and b
    adc d
    ld h, b
    dec [hl]
    ret nz

    sub l
    nop
    ld d, l
    nop
    ld d, l
    nop
    ld c, e
    nop
    or d
    dec b
    ld e, a
    rrca
    cp h
    ld c, $41
    nop
    cp l
    nop
    ld b, l
    nop
    halt
    nop
    ld b, d
    add c
    sbc c
    jr c, jr_00a_67b0

    jr c, jr_00a_683a

    nop
    cp d
    ld bc, $0053
    ld e, e
    nop
    xor b
    ld bc, $c23d
    ld a, h
    inc bc
    cp $01
    db $fd
    ld [bc], a
    ret z

    scf
    and a
    ld d, b
    dec c

jr_00a_680d:
    ld a, [c]
    sbc [hl]
    ld h, c
    add a
    ld d, b
    jp nc, $a92d

    ld d, [hl]
    ld b, b
    cp a
    add b
    ld a, a
    add sp, $17
    ld h, b
    sbc a
    ld e, h
    and e
    cpl
    ret nc

    sub a
    ld l, b
    rla
    add sp, $2b
    call nc, $d22d
    rra
    ldh [$29], a
    sub $1e
    pop hl
    ld e, h
    and e
    ld d, $e9
    jr z, jr_00a_680d

    jp c, $9c25

    ld h, e

jr_00a_683a:
    or [hl]
    ld c, c
    ld h, b
    adc a
    ld a, [$8005]
    ld a, a
    xor [hl]
    ld d, c
    db $d3
    inc l
    adc h
    ld [hl], e
    and c
    ld e, [hl]
    jp z, $b635

    ld c, c
    ld d, a
    xor b
    ld [bc], a
    dec b
    nop
    rlca
    dec b
    ld [bc], a
    inc b
    inc bc
    ld [bc], a
    inc bc
    inc bc
    ld [bc], a
    nop
    inc bc
    ld bc, $aa02
    ld b, b
    dec d
    ret nz

    dec d
    ret nz

    ld a, [bc]
    ret nz

    ld d, l
    add b
    ld d, l
    add b
    ld a, [hl+]
    add b
    ld de, $2a80
    nop
    ld c, d
    nop
    add hl, hl
    nop
    sub l
    nop
    ld c, d
    nop
    ld a, [hl+]
    nop
    sub l
    nop
    ld d, l
    nop
    dec h
    nop
    adc c
    nop
    dec h
    nop
    ld b, c
    nop
    sub l
    nop
    ld b, d
    nop
    add hl, hl
    nop
    ld b, d
    nop
    ld d, l
    nop
    ld d, l
    nop
    ld d, l
    nop
    ld d, [hl]
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    xor d
    nop
    ld c, d
    nop
    ld l, d
    nop
    xor l
    nop
    xor e
    nop
    ld d, l
    nop
    xor d
    nop
    ld e, d
    nop
    ld [$b500], a
    nop
    push de
    nop
    ld e, b
    nop
    ld l, d
    nop
    ld d, [hl]
    nop
    xor d
    nop
    xor d
    nop
    db $db
    nop
    cp l
    ld b, d
    cp [hl]
    ld b, b
    rst $28
    db $10
    call nc, Call_00a_792b
    ld b, $b5
    ld a, [bc]
    cp l
    ld [bc], a
    ld c, $01
    ld b, b
    cp a
    ld [hl], b
    rrca
    inc b
    ei
    add c
    ld a, [hl]
    ld b, h
    cp e
    ld a, [hl+]
    push de
    ld b, h
    cp e
    add hl, hl
    sub $55
    xor d
    dec l
    jp nc, $a956

    ld a, [hl-]
    push bc
    xor h
    ld d, e
    cp c
    ld b, [hl]
    cp b
    ld b, a
    ld [hl-], a
    call $857a
    rst $38
    nop
    xor b
    ld d, b
    jp c, Jump_000_2a20

    ret nc

    ld a, [hl+]
    ret nc

    adc c
    ld [hl], b
    add hl, bc
    ldh a, [$30]
    rst $08
    ld e, h
    and e
    ld [hl+], a
    dec e
    add c
    nop
    jr nz, jr_00a_690a

jr_00a_690a:
    inc b
    nop
    sub c
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
    jr nz, jr_00a_692c

jr_00a_692c:
    ld d, h
    nop
    or l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00a_693c

jr_00a_693c:
    inc h
    nop
    ld d, d
    nop
    ld [bc], a
    ld bc, $0102
    nop
    ld bc, $0100
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    dec l
    add b
    or l
    nop
    and l
    nop
    ld a, [hl+]
    nop
    ld d, d
    nop
    ld c, d
    nop
    xor d
    nop
    ld d, l
    nop
    ld a, [hl+]
    nop
    ld d, l
    nop
    ld d, d
    nop
    xor d
    nop
    sub l
    nop
    xor d
    nop
    ld d, d
    nop
    adc d
    nop
    sub d
    nop
    add hl, bc
    nop
    ld d, l
    nop
    inc h
    nop
    ld c, c
    nop
    add l
    nop
    ld [de], a
    nop
    adc b
    nop
    xor d
    nop
    ld d, l
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, l
    nop
    ld d, l
    nop
    xor d
    nop
    xor [hl]
    nop
    xor d
    nop
    ld d, l
    nop
    ld d, [hl]
    nop
    xor d
    nop
    ld d, l
    nop
    ld d, l
    nop
    xor e
    nop
    xor d
    nop
    xor d
    nop
    ld d, l
    nop
    push de
    nop
    xor d
    nop
    ld d, l
    nop
    ld d, [hl]
    nop
    ld e, b
    nop
    and d
    nop
    jp nz, $5200

    nop
    ld e, c
    nop
    xor b
    nop
    ld b, d
    nop
    adc b
    nop
    ld [bc], a
    nop
    ld d, h
    nop
    db $f4
    dec bc
    jp hl


    ld d, $7e
    ld bc, $05fa
    db $fd
    ld [bc], a
    ld a, b
    rlca
    ld l, d
    dec d
    jr nc, jr_00a_69df

    ld c, b
    or a
    ld d, b
    xor a
    add b
    ld a, a
    ld b, b
    cp a
    nop
    rst $38
    add c
    ld a, a
    inc bc
    cp $04

jr_00a_69df:
    db $fc
    dec c
    ldh a, [rNR30]
    ldh [rNR33], a
    ldh [rNR21], a
    ldh [$dd], a
    add b
    cp $00
    ld [hl], h
    nop
    ld a, e
    nop
    add c
    nop
    ret z

    nop
    ld [bc], a
    nop
    and b
    nop
    ld c, d
    nop
    add c
    nop
    ld [hl+], a
    nop

jr_00a_69fe:
    ld c, c
    nop
    ld a, [bc]
    nop
    ld bc, $0000
    nop
    nop
    nop
    ld c, $01
    ld h, a
    nop
    dec hl
    ld b, b
    adc a
    ld h, b
    ld a, $00
    ld a, a
    nop
    ccf
    nop
    db $fd
    nop
    db $ed
    inc bc
    ld d, h
    xor e
    dec b
    ld a, [$bf42]
    sbc $00
    or l
    nop
    rst $20
    ld [$857a], sp
    ld e, b
    and a
    nop
    rst $38
    db $10
    rst $38
    ret z

    rst $38
    nop
    nop
    ld [$4000], a
    add b
    ld [$4000], a
    add b
    ld h, b
    add b
    jr nc, jr_00a_69fe

    ld [hl], b
    add b
    ld a, [hl+]
    nop
    ld d, l
    nop
    ld a, [hl+]
    nop
    ld d, l
    nop
    add hl, hl
    nop
    inc d
    nop
    ld a, [bc]
    nop
    ld a, [hl+]
    nop
    ld [hl], h
    nop
    ld c, d
    nop
    xor d
    nop
    ld d, h
    nop
    ld a, [hl+]
    nop
    xor c
    nop
    sub l
    nop
    jp nc, $4500

    nop
    ld d, b
    nop
    xor e
    nop
    ld d, l
    nop
    xor d
    nop
    ld c, d
    nop
    ld d, d
    nop
    xor c
    nop
    ld d, l
    nop
    add hl, hl
    nop
    ld b, h
    nop
    ld d, l
    nop
    xor d
    nop
    xor d
    nop
    xor d
    nop
    ld d, l
    nop
    ld e, d
    nop
    ld d, l
    nop
    xor d
    nop
    ld d, c
    nop
    and l
    nop
    sub l
    nop
    xor d
    nop
    sub l
    nop
    and b
    nop
    ld a, [bc]
    nop
    ld d, c
    nop
    dec h
    nop
    ld c, e
    nop
    sub a
    nop
    ld l, $00
    ld e, l
    nop
    add hl, bc
    nop
    db $f4
    nop
    ld e, b
    nop
    add sp, $00
    ld d, h
    nop
    jp c, $ac00

    nop
    or h
    nop
    inc a
    inc bc
    nop
    rrca
    ld b, b
    ld bc, $0000
    and l
    nop
    ld b, b
    nop
    and h
    nop
    ld [hl], d
    nop
    ld [$22f8], sp
    ldh a, [$a0]
    ldh [rTIMA], a
    nop
    inc h
    nop
    adc c
    nop
    ld [hl+], a
    nop
    adc b
    nop
    ld a, [c]
    nop
    ld [$6a00], a
    nop
    ld a, [hl+]
    nop
    xor d
    nop
    ld d, l
    nop
    and l
    nop
    xor d
    nop
    add d
    nop
    add hl, hl
    nop
    sub c
    nop
    ld c, b
    nop
    xor d
    nop
    ld d, h
    nop
    ld a, [hl+]
    nop
    and l
    nop
    sub a
    ld h, b
    cp a
    ld h, b
    sbc a
    ld h, b
    sbc [hl]
    ld h, c
    sbc h
    ld h, e
    ld e, [hl]
    ld hl, $010e
    inc d
    inc bc
    ld [bc], a
    rst $38
    pop hl
    rra
    cp [hl]
    ld b, c
    di
    inc c
    ld b, c
    cp [hl]
    ld bc, $12fe
    db $ed
    nop
    rst $38
    and b
    rst $38
    ld d, b
    rst $38
    jr nz, @+$01

    inc de
    ldh [rHDMA1], a
    xor $12
    db $ed
    db $10
    rst $28
    db $10
    rst $28
    add hl, sp
    jp nz, $8275

    and l
    ld b, d
    call nc, $7406
    ld b, $b8
    ld b, [hl]
    ld a, d
    add h
    jr z, @-$32

    dec d
    nop
    ld a, [bc]
    nop
    ld a, [bc]
    nop
    dec b
    nop
    dec b
    nop
    ld [bc], a
    nop
    inc b
    nop
    ld [bc], a
    nop
    ld a, [hl+]
    nop
    sub c
    nop
    and b
    nop
    ld d, b
    nop
    ld b, b
    nop
    and b
    nop
    add c
    nop
    ld b, b
    nop
    and h
    nop
    ld a, [hl+]
    nop
    xor d
    nop
    ld a, [bc]
    nop
    ld hl, $0000
    nop
    inc b
    nop
    jr nz, jr_00a_6b60

jr_00a_6b60:
    xor d
    nop
    xor b
    nop
    and l
    nop
    xor c
    nop
    ld d, [hl]
    nop
    add hl, bc
    nop
    dec h
    nop
    add b
    nop
    xor b
    nop
    xor d
    nop
    sub c
    nop
    and l
    nop
    sub d
    nop
    ld d, a
    nop
    xor l
    nop
    sub a
    nop
    cp [hl]
    nop
    db $eb
    nop
    ld a, l
    nop
    db $dd
    nop
    or $00
    db $db
    nop
    ld a, [$b600]
    nop
    jp c, $5700

    nop
    ld l, [hl]
    nop
    or l
    nop
    db $db
    nop
    ld d, [hl]
    nop
    db $db
    nop
    or [hl]
    nop
    ld b, b
    nop
    ld l, d
    nop
    add b
    nop
    jp z, Jump_00a_6400

    nop
    ld a, [c]
    nop
    ld hl, $3400
    nop
    ld b, h
    nop
    ld [hl+], a
    nop
    sub b
    nop
    inc h
    nop
    adc c
    nop
    ld [hl+], a
    nop
    ld [$a200], sp
    nop
    adc d
    nop
    ld d, l
    nop
    adc e
    nop
    ld d, l
    nop
    ld h, $00
    ld e, d
    nop
    ld h, $00
    sbc e
    nop
    sub $00
    ld e, d
    nop
    ld d, a
    nop
    xor l
    nop
    cp d
    nop
    rst $10
    nop
    cp l
    nop
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
    ld a, h

jr_00a_6bef:
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0000
    inc bc
    inc b
    inc bc
    ld [de], a
    dec c
    db $10
    rst $28
    ld e, $01
    dec b
    ld [de], a
    inc e
    inc bc
    ld a, h
    add e
    db $ec
    inc de
    and [hl]
    ld e, c
    ld [hl+], a
    db $dd
    ld h, d
    sbc l
    ld bc, $02fe
    db $fd
    add l
    ld a, d
    jr z, jr_00a_6bef

    sbc d
    ld h, l
    dec de
    rst $20
    rrca
    ldh a, [$84]
    ld a, e
    ld d, b
    rst $28
    or b
    rst $28
    add hl, sp
    add $a9
    ld d, [hl]
    inc c
    di
    add c
    xor $71
    adc [hl]
    inc de
    db $ec
    and b
    ld b, b
    ld b, b
    add b
    ld b, b
    add b
    ret nz

    ld bc, $0180
    add b
    ld bc, $0180
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
    add e
    add c
    ld c, b
    add a
    add b
    ld c, a
    ld [bc], a
    nop
    ld bc, $0100
    nop
    ld bc, $0000
    nop
    nop
    ret nz

    ld [bc], a
    ret nz

    ld b, c
    add [hl]
    and b
    nop
    ld b, d
    nop
    jr nz, jr_00a_6c66

jr_00a_6c66:
    add b
    nop
    ld b, h
    nop
    jr nz, jr_00a_6c6c

jr_00a_6c6c:
    add b
    nop
    ld b, d
    nop
    add d
    nop
    nop
    nop
    ld [$8200], sp
    nop
    jr nz, jr_00a_6c7a

jr_00a_6c7a:
    ld bc, $8800
    nop
    nop
    nop
    inc b
    nop
    ld de, $0200
    nop
    ld c, d
    nop
    inc bc
    nop
    ld bc, $0500
    nop
    ld b, $00
    sbc e
    nop
    xor a
    nop
    cp a
    nop
    sub a
    nop
    sbc $00
    ld d, a
    nop
    db $fd
    nop
    xor a
    nop
    db $eb
    nop
    sbc $00
    or a
    nop
    rst $18
    nop
    cp l
    nop
    ld l, a
    nop
    db $fd
    nop
    ld [hl], a
    nop
    jp c, $ef00

    nop
    ld e, d
    nop
    rst $30
    nop
    db $dd
    nop
    rst $30
    nop
    cp a
    nop
    rst $28
    nop
    ld h, d
    nop
    and h
    nop
    pop de
    nop
    call nz, $9200
    nop
    ret


    nop
    ld [hl+], a
    nop
    sub b
    nop
    inc d
    nop
    and c
    nop
    inc d
    nop
    ld b, d
    nop
    ld d, h
    nop
    ld [hl+], a
    nop
    adc c
    nop
    ld d, h
    nop
    ld l, l
    nop
    ld a, [hl+]
    nop
    cp a
    nop
    ld d, $00
    sbc e
    nop
    ld e, a
    nop
    dec bc
    nop
    ld d, a
    nop
    cp d
    nop
    sbc $00
    halt
    nop
    db $dd
    nop
    ld a, [hl]
    nop
    db $ed

jr_00a_6cfb:
    nop
    ld a, l
    nop
    db $fc
    nop
    sub b
    ld a, a
    ld c, l
    ld a, [c]
    ld a, [bc]
    rst $38
    ld [hl], h
    adc e
    cp h
    rst $38
    ld d, b
    rst $38
    ld b, h
    ei
    ld [$00f7], sp
    rst $38
    ld c, h
    or e
    add b

jr_00a_6d15:
    rst $38
    call z, Call_000_0003
    rst $38
    jr nc, jr_00a_6cfb

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    inc d
    rst $38
    ld [bc], a
    rst $38
    ld b, d
    rst $38
    ld bc, $10ff
    rst $38
    nop
    rst $38
    jr nz, @+$01

    add b
    ld a, a
    ld h, b
    sbc a
    jr nz, jr_00a_6d15

    adc b
    rst $30
    ld b, d
    db $fd
    nop
    rst $38
    ld bc, $01fe
    cp $46

jr_00a_6d41:
    cp b
    inc b
    ld hl, sp+$00
    ldh a, [rNR10]
    ldh [$e0], a
    db $10
    ret z

    jr nc, @-$56

    ld d, b
    or b
    ld c, b
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
    db $10
    rst $08
    add b
    rst $18
    add b
    rst $18
    ret nz

    sbc a
    ld b, b
    sbc a
    ld h, d
    sbc l
    add [hl]
    ld e, c
    add h
    ld e, c
    jr nc, jr_00a_6d41

    dec h
    jp c, $cb34

    ld a, e
    add h
    ld a, [hl-]
    push bc
    inc a
    jp $c239


    ld bc, $80ea
    nop
    add h
    nop
    add c
    nop
    add h
    nop
    ld bc, $9200
    nop
    add b
    nop
    add h
    nop
    ld c, b
    nop
    jr nz, jr_00a_6d94

jr_00a_6d94:
    ld bc, $4800
    nop
    ld bc, $2200
    nop
    adc b
    nop
    nop
    nop
    adc e
    nop
    ld a, [hl+]
    nop
    dec c
    nop
    ld c, l
    nop
    rrca
    nop
    ld e, d
    nop
    halt
    nop
    rst $38
    nop
    or a
    nop
    db $fd
    nop
    xor a
    nop
    ld a, e
    nop
    xor a
    nop
    sbc [hl]
    nop
    rst $10
    nop
    rst $28
    nop
    cp $00
    rst $28
    nop
    cp a
    nop
    ei
    nop
    xor $00
    rst $38
    nop
    push af
    nop
    db $dd
    nop
    db $fd
    nop
    ld l, a
    nop
    cp $00
    xor a
    nop
    ld [$4e00], a
    nop
    ld b, l
    nop
    inc l
    nop
    adc d
    nop
    inc h
    nop
    ld c, d
    nop
    jr nz, jr_00a_6de8

jr_00a_6de8:
    ld c, e
    nop
    stop
    ld c, d
    nop
    ld [hl+], a
    nop
    adc l
    nop
    ld d, a
    nop
    dec b
    nop
    and e
    nop
    ld a, [bc]
    nop
    sub c
    nop
    ld b, l
    nop
    sub c
    nop
    push de
    nop
    ld l, l
    nop
    cp e
    nop
    db $d3
    nop
    or e
    nop
    ld [$a501], a
    ld [bc], a
    xor b
    rlca
    and b
    rst $38
    ret nz

    rst $38
    ret nc

    rst $38
    ret nc

    rst $38
    ldh [rIE], a
    or h
    rst $38
    jp c, $5cff

    rst $38
    ld b, c
    cp a
    nop
    rst $38
    ld bc, $40ff
    cp a
    inc b
    ei
    ld [$00f7], sp
    rst $38
    or h
    ei
    ld [bc], a
    rst $38
    nop
    rst $38
    jr nz, @+$01

    inc bc
    db $fc
    add b
    rst $38
    nop
    rst $38

jr_00a_6e3c:
    sub c
    xor $00
    rst $38
    ld d, d
    xor l

jr_00a_6e42:
    ld [hl+], a
    db $dd
    rrca
    ldh a, [$0a]
    push af
    ld b, d
    cp l
    ld a, [bc]
    push af
    ld bc, $44fe
    cp e
    ld [c], a
    inc e
    xor h
    ld d, e
    ld a, [c]
    dec c
    xor l
    ld d, d
    jp nz, $a93d

    ld d, [hl]
    and h
    ld e, e
    sub d
    ld l, l
    nop
    nop
    nop
    nop
    nop
    ret nz

    add b
    ld h, b
    ld d, b
    and b
    jr z, jr_00a_6e3c

    ld c, h
    or b
    inc h
    ret c

    add c
    ld e, h
    jp hl


    inc d
    db $e4
    jr @-$57

    jr jr_00a_6ea4

    sub h
    adc c
    ld d, [hl]
    ld h, a
    sbc b
    rst $30
    nop
    ld [bc], a
    jp hl


    ld a, $c1
    ccf
    ret nz

    ld a, [de]
    ret nz

    ld a, $c0
    ld d, l
    adc b
    rst $10
    jr nz, jr_00a_6e42

    ld c, b
    add d
    nop
    adc b
    nop
    ld bc, $8480
    nop
    ld [$8200], sp
    nop
    sub b
    nop
    add hl, bc
    nop
    jr nz, jr_00a_6ea2

jr_00a_6ea2:
    add hl, bc
    nop

jr_00a_6ea4:
    ld b, c
    nop
    ld d, $00
    ld c, e
    nop
    add hl, bc
    nop
    dec l
    nop
    ld [de], a
    nop
    db $eb
    nop
    ld a, a
    nop
    add sp, $00
    inc bc
    nop
    db $fd
    nop
    nop
    nop
    rst $38
    nop
    db $db
    nop
    ld [hl], l
    nop
    xor a
    nop
    scf
    nop
    db $dd
    nop
    ld b, [hl]
    nop
    dec sp
    nop
    push de
    nop
    ld a, d
    nop
    ld [hl], h
    nop
    ld [$5100], a
    nop
    and h
    nop
    sub b
    nop
    ld b, d
    nop
    ld bc, $8200
    nop
    sbc c
    nop
    ld d, b
    nop
    ld a, [hl+]
    nop
    ld d, b
    nop
    add l
    nop
    ld d, b
    nop
    nop
    nop
    ld d, h
    nop
    ld c, d
    nop
    inc h
    nop
    ld d, d
    nop
    adc b
    nop
    ld a, [hl+]
    nop
    sub l
    nop
    ld c, c
    nop
    ld d, d
    db $01

    INCBIN "gfx/image_00a_6f00.2bpp"

    ld bc, $0100
    ld b, c
    ld bc, $0100
    ld b, c
    ld bc, $0100
    ld b, c
    ld [$0100], sp
    ld b, c
    ld bc, $0100
    ld b, c
    ld bc, $0100
    ld b, e
    ld bc, $0100
    ld b, c
    ld bc, $0800
    ld b, c
    ld bc, $0100
    ld sp, $0001
    ld bc, $0131
    nop
    ld bc, $0131
    nop
    ld bc, $0831
    nop
    ld bc, $0112
    nop
    ld bc, $0112
    nop
    ld bc, $0112
    nop
    ld bc, $0112
    nop
    ld [$8012], sp
    nop
    nop
    ld de, $0100
    ld [hl], d
    ld bc, $0131
    ld [hl], d
    ld bc, $0131
    nop
    ld bc, $0131
    ld [hl], d
    ld bc, $0831
    ld [hl], d
    ld bc, $0331
    nop
    ld bc, $0372
    nop
    ld [$0131], sp
    ld [hl], d
    inc bc
    nop
    ld bc, $0372
    nop
    ld [$0172], sp
    ld sp, $0002
    ld bc, $0131
    nop
    ld bc, $0231
    nop
    ld [$0131], sp
    ld [hl], d
    ld bc, $0100
    ld [hl], d
    inc bc
    nop
    ld bc, $0172
    nop
    ld [$0172], sp
    nop
    ld bc, $0231
    nop
    ld bc, $0252
    nop
    ld bc, $0b31
    nop
    ld bc, $0152
    ld b, e
    ld bc, $0c52
    nop
    ld bc, $0172
    nop
    ld bc, $0152
    nop
    ld bc, $0a72
    nop
    ld bc, $0572
    nop
    ld bc, $0872
    nop
    ld bc, $0372
    nop
    ld bc, $0361
    nop
    ld [$0172], sp
    nop
    ld bc, $0172
    nop
    inc bc
    ld h, c
    ld bc, $0100
    ld [hl], d
    ld a, [bc]
    nop
    ld bc, $0172
    nop
    ld bc, $0161
    nop
    ld bc, $4972
    nop
    nop
    ld de, $2000
    nop
    ld bc, $0161
    nop
    ld bc, $0151
    ld b, e
    ld bc, $0161
    nop
    ld bc, $0151
    ld b, h
    add hl, bc
    ld h, c
    ld bc, $0100
    ld d, c
    ld bc, $0100
    ld h, c
    ld bc, $0100
    ld d, c
    ld bc, $0900
    ld h, c
    ld bc, $0100
    ld d, c
    ld bc, $0100
    ld h, c
    ld bc, $0100
    ld d, c
    ld bc, $0900
    ld h, c
    ld bc, $0100
    ld d, c
    ld bc, $0100
    ld h, c
    ld bc, $0100
    ld d, c
    ld bc, $0900
    ld h, c
    ld bc, $0100
    ld d, c
    ld bc, $0100
    ld h, c
    ld bc, $0100
    ld d, c
    ld bc, $0900
    ld h, c
    ld bc, HeaderNewLicenseeCode
    ld d, c
    ld bc, $0100
    ld h, c
    ld bc, HeaderCGBFlag
    ld d, c
    ld bc, $0800
    ld h, c
    stop
    ld bc, $0172
    ld de, $7201
    ld bc, $0111
    ld [hl], d
    ld bc, $0111
    ld [hl], d
    ld bc, $0811
    ld [hl], d
    ld h, b
    nop
    nop
    ld de, $2000
    nop
    ld bc, $0f71
    nop
    ld bc, $0171
    ld h, c
    ld c, $00
    ld bc, $0171
    ld h, c
    ld bc, $0d51
    nop
    ld bc, $0171
    ld h, c
    ld bc, $0151
    ld [hl], c
    inc c
    nop
    ld bc, $0171
    ld h, e
    ld bc, $0151
    ld [hl], c
    ld bc, $0b61
    nop
    ld bc, $0171
    ld h, c
    ld bc, $0151
    ld [hl], c
    ld bc, $0161
    ld d, c
    ld a, [bc]
    nop
    ld bc, $0171
    ld h, c
    ld bc, $0151
    ld [hl], c
    ld bc, $0161
    ld d, c
    ld bc, $0971
    nop
    ld bc, $0171
    ld h, c
    ld bc, $0152
    ld [hl], c
    ld bc, $0161
    ld d, c
    ld bc, $0171
    ld h, e
    ld [$0800], sp
    inc d
    ld [$5051], sp
    nop
    nop
    ld de, $1000
    nop
    db $10
    ld h, c
    stop
    rlca
    ld e, [hl]
    ld bc, $0851
    ld d, d
    stop
    ld b, $61
    ld bc, $0962
    ld h, c
    stop
    ld bc, $0152
    ld d, c
    ld c, $5e
    stop
    ld [bc], a
    ld h, c
    ld bc, $0d62
    ld h, c
    stop
    rlca
    ld e, [hl]
    add hl, bc
    ld d, c
    ld b, b
    nop
    nop
    ld de, $0100
    ld [hl], h
    ld bc, $0100
    inc [hl]
    ld bc, $0100
    inc d
    ld bc, $0100
    inc [hl]
    ld bc, $0900
    ld [hl], h
    ld bc, $0100
    inc [hl]
    ld bc, $0100
    inc d
    ld bc, $0100
    inc [hl]
    ld bc, $0900
    ld [hl], h
    ld bc, $0100
    inc [hl]
    ld bc, $0100
    inc d
    ld bc, $0100
    inc [hl]
    ld bc, $0900
    ld [hl], h
    ld bc, $0100
    inc [hl]
    ld bc, $0100
    inc d
    ld bc, $0100
    inc [hl]
    ld bc, $0900
    ld [hl], h
    ld bc, $0100
    inc [hl]
    ld bc, $0100
    inc d
    ld bc, $0100
    inc [hl]
    ld bc, $0900
    ld [hl], h
    ld bc, $0100
    inc [hl]
    ld bc, $0100
    inc d
    ld bc, $0100
    inc [hl]
    ld bc, $0900
    ld [hl], h
    ld bc, $0100
    inc [hl]
    ld bc, $0100
    inc d
    ld bc, $0100
    inc [hl]
    ld bc, $0900
    ld [hl], h
    ld bc, $0100
    inc [hl]
    ld bc, $0100
    inc d
    ld bc, $0100
    inc [hl]
    ld bc, $0900
    ld [hl], h
    ld bc, $0100
    inc [hl]
    ld bc, $0100
    inc d
    ld bc, $0100
    inc [hl]
    ld bc, $0900
    ld [hl], h
    ld bc, $0100
    inc [hl]
    ld bc, $0100
    inc d
    ld bc, $0100
    inc [hl]
    ld bc, $0900
    ld [hl], h
    ld bc, $0100
    inc [hl]
    ld bc, $0100
    inc d
    ld bc, $0100
    inc [hl]
    ld bc, $0800
    ld [hl], h
    ld d, b
    nop
    nop
    ld de, $0200
    ld de, $6201
    inc bc
    nop
    ld bc, $0a62
    ld de, $6201
    ld [bc], a
    nop
    ld bc, $0262
    nop
    ld bc, $0862
    ld de, $6201
    ld [bc], a
    nop
    ld bc, $0162
    ld [hl], c
    ld bc, $0262
    nop
    ld [$0262], sp
    nop
    ld bc, $0162
    ld [hl], c
    ld bc, $0131
    ld [hl], c
    ld bc, $0a62
    nop
    ld bc, $0162
    ld [hl], c
    ld bc, $0131
    ld b, e
    ld bc, $0131
    ld [hl], c
    ld bc, $0a62
    nop
    ld bc, $0162
    ld [hl], c
    ld bc, $0131
    ld [hl], c
    ld bc, $0962
    nop
    ld bc, $0262
    nop
    ld bc, $0162
    ld [hl], c
    ld bc, $0262
    nop
    ld [$0162], sp
    ld de, $6201
    ld [bc], a
    nop
    ld bc, $0262
    nop
    ld bc, $0a62
    ld de, $6201
    inc bc
    nop
    ld bc, $0a62
    ld de, $6201
    dec b
    nop
    ld bc, $0862
    ld de, $6201
    rlca
    nop
    ld [$0362], sp
    nop
    ld bc, $016e
    nop
    ld bc, $4a6e
    nop
    nop
    ld de, $0500
    nop
    ld bc, $1043
    nop
    ld bc, $0943
    nop
    ld bc, $0543
    nop
    ld [bc], a
    ld b, e
    add hl, bc
    nop
    ld bc, $0443
    nop
    ld a, [bc]
    ld b, e
    ld bc, $0200
    ld b, e
    inc bc
    nop
    ld bc, $0b74
    nop
    dec b
    ld b, e
    dec bc
    nop
    ld bc, HeaderCGBFlag
    ld b, d
    inc bc
    ld b, e
    dec bc
    nop
    dec b
    ld b, e
    dec bc
    nop
    dec b
    ld b, e
    dec bc
    nop
    ld bc, $0343
    nop
    ld bc, $0b43
    nop
    ld bc, $0343
    nop
    ld bc, $0b43
    nop
    ld [bc], a
    ld b, e
    ld [bc], a
    nop
    ld [bc], a
    ld b, e
    ld c, b
    nop
    nop
    ld de, $0400
    ld h, d
    ld bc, $0e11
    ld h, d
    inc bc
    ld de, $620e
    ld bc, $0f11
    ld h, d
    ld bc, $0c13
    ld h, d
    ld bc, $0213
    ld h, d
    ld bc, $0211
    ld h, d
    ld bc, $0913
    ld h, d
    ld bc, $0211
    ld h, d
    ld bc, $0211
    ld h, d
    ld bc, $0911
    ld h, d
    ld bc, $0211
    ld h, d
    ld bc, $0211
    ld h, d
    ld bc, $0a11
    ld h, d
    ld bc, $0111
    ld h, d
    ld bc, $0111
    ld h, d
    ld bc, $0c11
    ld h, d
    inc bc
    ld de, $620a
    ld [bc], a
    ld b, c
    ld bc, $034e
    ld b, d
    ld bc, $094e
    ld b, c
    ld h, b
    nop
    nop
    ld de, $0200
    ld [hl], d
    dec b
    nop
    ld a, [bc]
    ld [hl], d
    inc bc
    nop
    ld bc, $0333
    nop
    ld [$0372], sp
    nop
    ld bc, $0133
    ld [hl], d
    ld bc, $0c33
    nop
    ld bc, $0333
    ld [hl], d
    ld bc, $0b33
    nop
    ld bc, $0133
    ld [hl], d
    ld bc, HeaderTitle
    ld [hl], d
    ld bc, $0b33
    nop
    ld bc, $0333
    ld [hl], d
    ld bc, $0c33
    nop
    ld bc, $0133
    ld [hl], d
    ld bc, $0e33
    nop
    ld bc, $1c33
    nop
    rlca
    ld [hl], d
    ld [$0100], sp
    ld [hl], d
    rlca
    ld a, $08
    ld [hl], d
    ld d, b
    nop
    nop
    ld de, $1000
    nop
    db $10
    ld b, d
    db $10
    inc sp
    db $10
    ld b, d
    ld [de], a
    nop
    dec b
    ld l, [hl]
    ld a, [bc]
    nop
    ld bc, $016e
    inc sp
    ld bc, $0131
    ld b, d
    ld [bc], a
    inc sp
    ld bc, $0a6e
    nop
    ld bc, $0133
    ld b, d
    ld bc, HeaderNewLicenseeCode
    ld b, d
    ld bc, $0933
    nop
    ld bc, $0233
    nop
    ld bc, $0133
    ld b, d
    ld bc, $0233
    nop
    ld [$0133], sp
    ld b, d
    ld bc, $0233
    nop
    ld bc, $0233
    nop
    ld bc, $0833
    ld b, d
    ld [bc], a
    ld l, [hl]
    dec b
    nop
    add hl, bc
    ld l, [hl]
    ld d, b
    nop
    nop
    ld de, $0200
    ld h, d
    dec b
    nop
    ld a, [bc]
    ld h, d
    rlca
    nop
    ld [$0162], sp
    nop
    rlca
    ld e, [hl]
    add hl, bc
    nop
    ld bc, $055e
    nop
    ld bc, $095e
    nop
    ld bc, $055e
    nop
    ld bc, $095e
    nop
    ld bc, $015e
    nop
    ld [bc], a
    ld e, [hl]
    ld [bc], a
    ld h, d
    ld bc, $095e
    nop
    ld bc, $015e
    nop
    ld bc, $025e
    ld [hl], d
    ld bc, $0100
    ld e, [hl]
    add hl, bc
    nop
    ld bc, $015e
    nop
    ld bc, $025e
    ld [hl], d
    ld bc, $0100
    ld e, [hl]
    add hl, bc
    nop
    ld bc, $015e
    nop
    ld bc, $025e
    ld [hl], d
    ld bc, $0100
    ld e, [hl]
    ld [$0100], sp
    ld h, d
    ld bc, $015e
    ld h, d
    dec b
    ld e, [hl]
    add hl, bc
    ld h, d
    ld bc, $0e5e
    ld h, d
    ld d, b
    nop
    nop
    ld de, $0100
    ld de, $4301
    ld bc, $0132
    nop
    ld bc, HeaderCGBFlag
    nop
    ld bc, $0132
    ld b, e
    ld [$0111], sp
    ld b, e
    ld bc, $0232
    nop
    ld bc, $0243
    nop
    ld bc, $0832
    ld b, e
    ld bc, $0232
    nop
    inc bc
    ld a, [hl]
    ld [bc], a
    nop
    ld [$1332], sp
    nop
    inc bc
    ld [hl-], a
    ld a, [bc]
    nop
    ld bc, HeaderCGBFlag
    nop
    dec b
    ld de, $0001
    ld [HeaderCGBFlag], sp
    ld [hl-], a
    ld bc, $0543
    ld a, [hl]
    ld bc, $0843
    ld [hl-], a
    ld bc, $0743
    nop
    ld [$0343], sp
    nop
    inc bc
    ld b, c
    inc c
    nop
    dec b
    inc d
    ld a, [bc]
    nop
    rlca
    ld [hl-], a
    add hl, bc
    nop
    rlca
    ld a, [hl]
    ld c, b
    nop
    nop
    ld de, $1000
    nop
    db $10
    inc de
    db $10
    ld h, e
    db $10
    inc de
    ld de, $0100
    ld a, [hl]
    dec b
    nop
    ld bc, $0c7e
    nop
    ld bc, $0b7e
    nop
    db $10
    ld h, d
    db $10
    ld [de], a
    ld [de], a
    nop
    ld bc, $037e
    ld h, d
    ld bc, $097e
    nop
    db $10
    ld de, $0040
    nop
    ld de, $0200
    nop
    dec b
    ld b, e
    dec bc
    nop
    dec b
    inc de
    ld a, [bc]
    nop
    rlca
    ld b, e
    add hl, de
    nop
    ld [bc], a
    inc de
    ld bc, $0100
    ld a, $01
    nop
    ld [bc], a
    inc de
    add hl, bc
    nop
    ld [bc], a
    ld b, e
    inc bc
    nop
    ld [bc], a
    ld b, e
    inc c
    nop
    ld bc, $0f43
    nop
    ld bc, $1d43
    nop
    ld bc, $033e
    ld b, e
    ld bc, $0b3e
    nop
    ld bc, $033e
    inc de
    ld bc, $0b3e
    nop
    dec b
    ld a, $49
    nop
    nop
    ld de, $3600
    nop
    ld bc, $0c33
    nop
    ld bc, $0133
    nop
    ld bc, $0133
    ld a, [hl]
    ld bc, $0a33
    nop
    inc bc
    inc sp
    ld bc, $0100
    inc sp
    dec bc
    nop
    ld bc, $0133
    ld a, [hl]
    ld bc, $0d33
    nop
    inc bc
    inc sp
    ld c, $00
    ld bc, $1c33
    nop
    inc b
    ld a, [hl]
    ld [bc], a
    nop
    ld a, [bc]
    ld a, [hl]
    ld d, b
    nop
    nop
    ld de, $1100
    nop
    ld bc, $056e
    nop
    ld bc, $286e
    nop
    db $10
    ld d, d
    db $10
    ld h, d
    inc b
    ld [hl], d
    ld bc, $0b73
    ld [hl], d
    ld bc, $0162
    ld h, e
    ld c, $62
    ld [$0852], sp
    ld d, e
    ld hl, $0100
    ld l, [hl]
    dec b
    nop
    ld bc, $486e
    nop
    nop
    ld de, $0100
    ld [hl], d
    ld bc, $0532
    nop
    ld bc, $0832
    ld [hl], d
    ld bc, $0332
    nop
    ld bc, $033e
    nop
    ld [$2032], sp
    nop
    db $10
    ld [hl], d
    db $10
    ld [de], a
    inc d
    nop
    ld bc, $1b3e
    nop
    db $10
    ld de, $7110
    ld d, b
    nop
    nop
    ld de, $3300
    nop
    ld bc, $0172
    nop
    ld bc, $0c72
    nop
    dec b
    ld [hl], d
    ld a, [bc]
    nop
    rlca
    ld [hl], d
    ld a, [de]
    nop
    dec b
    ld [hl], d
    inc c
    nop
    inc bc
    ld [hl], d
    ld a, d
    nop
    nop
    ld de, $1400
    nop
    ld bc, $0e31
    nop
    inc bc
    ld sp, $000c
    ld bc, $0131
    ld a, [hl]
    ld bc, $0132
    ld a, [hl]
    ld bc, $0b31
    nop
    dec b
    ld sp, $000c
    ld bc, $0131
    nop
    ld bc, $0c31
    nop
    ld bc, $0332
    nop
    ld bc, $3a32
    nop
    ld bc, $024e
    nop
    ld bc, $024e
    nop
    ld bc, $584e
    nop
    nop
    ld de, $2400
    nop
    ld bc, $0b6e
    nop
    db $10
    ld sp, $4104
    ld bc, $0b42
    ld b, c
    db $10
    ld sp, $6e01
    rlca
    nop
    ld [$246e], sp
    nop
    ld bc, $6b6e
    nop
    nop
    ld de, $1400
    nop
    ld bc, $0e32
    nop
    ld bc, $0132
    ld a, [hl]
    ld bc, $0e32
    nop
    ld bc, $3b33
    nop
    ld [bc], a
    ld [hl-], a
    ld bc, $037e
    ld [hl-], a
    ld bc, $097e
    ld [hl-], a
    ld [bc], a
    ld [de], a
    ld bc, $017e
    ld de, $1201
    ld bc, $0111
    ld a, [hl]
    add hl, bc
    ld [de], a
    ld [bc], a
    ld sp, $7e01
    inc bc
    ld [hl-], a
    ld bc, $097e
    ld sp, $1102
    dec b
    ld a, [hl]
    add hl, bc
    ld de, $0050
    nop
    ld de, $1000
    nop
    db $10
    ld [hl], c
    stop
    db $10
    ld h, d
    stop
    db $10
    ld [hl], c
    stop
    rlca
    ld l, [hl]
    add hl, bc
    ld h, d
    stop
    db $10
    ld [hl], c
    stop
    ld [bc], a
    ld h, d
    ld c, $6e
    ld b, b
    nop
    nop
    ld de, $1100
    nop
    ld [bc], a
    ld [de], a
    inc bc
    nop
    ld [bc], a
    ld [de], a
    add hl, bc
    nop
    ld bc, $0543
    nop
    ld bc, $0c43
    nop
    ld bc, $0e32
    nop
    ld bc, $0132
    ld a, [hl]
    ld bc, $0c32
    nop
    ld bc, $0132
    ld [hl], c
    ld bc, $011e
    ld [hl], c
    ld bc, $0a32
    nop
    ld bc, $0132
    ld [hl], c
    inc bc
    ld e, $01
    ld [hl], c
    ld bc, $0a32
    nop
    ld bc, $0132
    ld [hl], c
    ld bc, $011e
    ld [hl], c
    ld bc, $0c32
    nop
    ld bc, $0132
    ld a, [hl]
    ld bc, $0e32
    nop
    ld bc, $0c3e
    nop
    ld bc, $0543
    nop
    ld bc, $0943
    nop
    ld [bc], a
    ld [de], a
    inc bc
    nop
    ld [bc], a
    ld [de], a
    ld c, b
    nop
    nop
    ld de, $2700
    nop
    ld bc, $0e32
    nop
    ld a, [bc]
    ld [hl-], a
    ld b, $00
    ld bc, $0132
    inc sp
    ld [$0132], sp
    ld [de], a
    ld b, $00
    ld bc, $0832
    nop
    ld bc, $0112
    ld h, d
    inc b
    nop
    ld bc, $0132
    nop
    ld [$0132], sp
    ld [de], a
    ld bc, $0163
    ld h, d
    dec c
    nop
    inc b
    ld [de], a
    ld bc, $0300
    ld [hl], d
    ld a, b
    nop
    nop
    ld de, $1000
    nop
    db $10
    ld h, d
    ld bc, $0200
    ld b, c
    dec c
    nop
    inc b
    ld b, c
    inc c
    nop
    inc bc
    ld b, c
    dec c
    nop
    ld [bc], a
    ld b, c
    ld c, $00
    ld [bc], a
    ld b, c
    ld bc, $0100
    ld [hl], e
    ld bc, $0100
    ld [hl], e
    ld bc, $0100
    ld [hl], e
    ld [$0200], sp
    ld b, c
    ld c, $00
    inc bc
    ld b, c
    dec c
    nop
    inc b
    ld b, c
    dec c
    nop
    ld [bc], a
    ld b, c
    dec c
    nop
    db $10
    ld h, d
    ld b, b
    nop
    nop
    ld de, $0400
    nop
    ld bc, $0f71
    nop
    ld bc, $0b71
    nop
    ld [bc], a
    ld [hl], c
    ld bc, $0d43
    ld [hl], c
    ld [bc], a
    nop
    ld bc, $0161
    nop
    ld bc, $0d71
    nop
    ld bc, $0161
    nop
    ld bc, $0d71
    nop
    ld bc, $0161
    nop
    ld bc, $0d71
    nop
    ld bc, HeaderCGBFlag
    ld h, c
    ld bc, $016e
    ld h, c
    ld bc, $0d43
    nop
    ld bc, $0171
    nop
    ld bc, $0d61
    nop
    ld bc, $0171
    nop
    ld bc, $0d61
    nop
    ld bc, $0171
    nop
    ld bc, $0961
    nop
    ld b, $71
    ld bc, $0943
    ld [hl], c
    ld d, b
    nop
    nop
    ld de, $1000
    ld h, c
    ld bc, $071e
    ld h, c
    ld [$011e], sp
    ld h, c
    ld bc, $0512
    ld h, c
    ld bc, $0a12
    ld h, c
    ld bc, $031e
    ld h, c
    ld bc, $0c1e
    ld h, c
    ld bc, $0112
    ld h, c
    ld bc, $0e12
    ld h, c
    ld bc, $0e1e
    ld h, c
    ld bc, $0112
    ld h, c
    ld bc, $0c12
    ld h, c
    ld bc, $031e
    ld h, c
    ld bc, $0a1e
    ld h, c
    ld bc, $0512
    ld h, c
    ld bc, $0812
    ld h, c
    ld bc, $071e
    ld h, c
    ld [$101e], sp
    ld h, c
    ld d, b
    nop
    nop
    ld de, $0200
    ld [hl-], a
    dec b
    nop
    inc c
    ld [hl-], a
    inc bc
    nop
    ld a, [bc]
    ld [hl-], a
    ld bc, $0300
    ld [hl-], a
    ld bc, $0300
    ld [hl-], a
    add hl, bc
    nop
    ld [bc], a
    ld [hl-], a
    inc bc
    ld b, d
    ld [bc], a
    ld [hl-], a
    add hl, bc
    nop
    ld bc, $0132
    ld b, d
    ld bc, $0164
    ld b, d
    ld bc, $0164
    ld b, d
    ld bc, $0a32
    nop
    ld bc, $0142
    ld h, h
    ld bc, $017e
    ld h, h
    ld bc, $0b42
    nop
    ld [bc], a
    ld b, d
    ld bc, $027e
    ld b, d
    dec bc
    nop
    dec b
    ld b, d
    dec bc
    nop
    ld bc, $0342
    ld [hl], e
    ld bc, $0b42
    nop
    ld [bc], a
    ld b, d
    ld bc, $0273
    ld b, d
    inc c
    nop
    inc bc
    ld b, d
    ld e, d
    nop
    nop
    ld de, $0400
    nop
    ld bc, $0e31
    nop
    inc bc
    ld sp, $000d
    ld bc, $0273
    ld sp, $000c
    inc bc
    ld sp, $7301
    ld bc, $0b31
    nop
    ld bc, $0131
    ld h, e
    inc bc
    ld sp, $000b
    dec b
    ld sp, $000a
    inc b
    ld sp, $6301
    ld [bc], a
    ld sp, $0009
    ld [bc], a
    ld sp, $7301
    inc bc
    ld sp, $6301
    add hl, bc
    nop
    rlca
    ld sp, $0009
    ld bc, $0463
    ld sp, $7301
    ld bc, $0931
    nop
    rlca
    ld sp, $000c
    ld bc, $0e1e
    nop
    inc bc
    ld e, $3a
    nop
    nop
    ld de, $0400
    nop
    ld bc, $0f42
    nop
    ld bc, $0e42
    nop
    inc bc
    ld b, d
    dec c
    nop
    ld bc, $0142
    ld c, [hl]
    ld bc, $0b42
    nop
    inc bc
    ld b, d
    ld bc, $0313
    ld b, d
    ld [$0200], sp
    ld b, d
    ld bc, $034e
    inc de
    ld bc, $0c4e
    ld b, d
    inc bc
    inc de
    ld a, [bc]
    ld b, d
    ld bc, $0300
    ld b, d
    ld bc, $0313
    ld b, d
    dec bc
    nop
    ld bc, $0142
    ld c, [hl]
    ld bc, $0d42
    nop
    inc bc
    ld b, d
    ld c, $00
    ld bc, $0f42
    nop
    ld bc, $4b42
    nop
    nop
    ld de, $2000
    nop

Call_00a_792b:
    ld bc, $017e
    ld c, [hl]
    dec b
    nop
    ld bc, $084e
    ld a, [hl]
    ld bc, $0100
    ld c, [hl]
    dec b
    nop
    ld bc, $094e
    nop
    ld [bc], a
    ld c, [hl]
    inc bc
    ld b, c
    ld [bc], a
    ld c, [hl]
    add hl, bc
    nop
    ld bc, $054e
    nop
    ld bc, $1b4e
    nop
    ld bc, $016e
    ld [hl], d
    ld bc, $0a6e
    nop
    ld bc, $0172
    ld a, [hl]
    ld bc, $0300
    ld l, [hl]
    ld bc, $0100
    ld a, [hl]
    add hl, bc
    ld [hl], d
    ld bc, $057e
    nop
    ld bc, $097e
    ld [hl], d
    ld bc, $057e
    nop
    ld bc, $087e
    ld [hl], d
    inc bc
    nop
    ld bc, $013e
    ld [hl-], a
    ld bc, $4a3e
    nop
    nop
    ld de, $2300
    nop
    ld bc, $013e
    ld [hl-], a
    ld bc, $0a3e
    nop
    ld bc, $0172
    ld a, [hl]
    dec b
    nop
    ld bc, $097e
    ld [hl], d
    ld bc, $057e
    nop
    ld bc, $097e
    ld [hl], d
    ld bc, $017e
    nop
    inc bc
    ld l, [hl]
    ld bc, $0100
    ld a, [hl]
    ld [$0372], sp
    nop
    ld bc, $016e
    ld [hl], d
    ld bc, $1b6e
    nop
    ld bc, $054e
    nop
    ld bc, $094e
    nop
    ld [bc], a
    ld c, [hl]
    ld bc, $0141
    ld b, d
    ld bc, $0241
    ld c, [hl]
    add hl, bc
    nop
    ld bc, $054e
    nop
    ld bc, $084e
    nop
    ld bc, $017e
    ld c, [hl]
    dec b
    nop
    ld bc, $084e
    ld a, [hl]
    ld b, b
    nop
    nop
    ld de, $1100
    nop
    ld bc, $017e
    ld d, c
    inc bc
    nop
    ld bc, $0151
    ld a, [hl]
    dec bc
    nop
    ld bc, $0151
    nop
    ld bc, $0b51
    nop
    rlca
    ld h, c
    add hl, bc
    nop
    ld bc, $0661
    ld sp, $0008
    ld bc, $0131
    ld h, c
    ld [bc], a
    ld b, e
    ld bc, $0231
    ld b, e
    add hl, bc
    ld sp, $5101
    ld bc, $0261
    ld b, e
    ld bc, $0232
    ld b, e
    ld bc, $0931
    ld d, c
    ld bc, $0261
    ld sp, $6e01
    inc bc
    ld sp, $5108
    ld bc, $0100
    ld h, c
    ld bc, $0371
    ld sp, $7101
    ld bc, $0931
    nop
    ld bc, $0161
    ld sp, $7103
    ld [bc], a
    ld sp, $0009
    ld bc, $0661
    ld sp, $000b
    inc bc
    ld d, c
    dec c
    nop
    inc bc
    ld d, c
    ld a, [hl-]
    nop
    nop
    ld de, $1100
    nop
    ld bc, $0f51
    nop
    ld bc, $0531
    nop
    ld bc, $0951
    nop
    ld bc, $0262
    nop
    ld bc, $0251
    nop
    ld bc, $0931
    nop
    ld bc, $027e
    nop
    ld bc, $0231
    nop
    ld bc, $0962
    nop
    ld bc, $024e
    nop
    ld bc, $0262
    nop
    ld bc, $0c7e
    nop
    ld bc, $027e
    nop
    ld bc, $0a4e
    nop
    ld bc, $0151
    nop
    ld bc, $0d4e
    nop
    ld bc, $0331
    nop
    ld bc, $0b51
    nop
    ld bc, $0362
    nop
    ld bc, $0b31
    nop
    ld bc, $037e
    nop
    ld bc, $0b62
    nop
    ld bc, $034e
    nop
    ld bc, $0f7e
    nop
    ld bc, $394e
    nop
    nop
    ld de, $0200
    nop
    dec b
    ld d, d
    ld a, [bc]
    nop
    ld [bc], a
    ld d, d
    inc bc
    ld h, e
    ld [bc], a
    ld d, d
    add hl, bc
    nop
    rlca
    ld l, [hl]
    add hl, bc
    nop
    ld [bc], a
    ld d, d
    inc bc
    ld h, e
    ld [bc], a
    ld d, d
    ld a, [bc]
    nop
    dec b
    ld d, d
    inc c
    nop
    inc bc
    ld h, e
    dec bc
    nop
    ld bc, $0152
    nop
    inc bc
    ld l, [hl]
    ld bc, $0100
    ld d, d
    ld [$0100], sp
    ld d, d
    ld bc, $0263
    ld d, d
    ld bc, $0263
    ld d, d
    ld bc, $0863
    ld d, d
    ld bc, $0163
    ld l, [hl]
    ld bc, $0363
    ld d, d
    ld bc, $0163
    ld l, [hl]
    ld [$0163], sp
    ld d, d
    ld bc, $0263
    ld d, d
    ld bc, $0263
    ld d, d
    ld bc, $0863
    ld d, d
    ld bc, $0100
    ld d, d
    ld bc, $0100
    ld h, e
    ld bc, $016e
    ld h, e
    ld bc, $0100
    ld d, d
    inc c
    nop
    ld bc, $4b63
    nop
    nop
    ld de, $0200
    ld [de], a
    ld bc, $0332
    nop
    ld bc, $0a32
    ld [de], a
    ld bc, $0532
    nop
    ld bc, $0832
    ld [de], a
    ld bc, $0332
    nop
    ld bc, $0332
    nop
    ld [$0332], sp
    nop
    ld bc, $0132
    ld [de], a
    ld bc, $0c32
    nop
    ld bc, $0132
    ld [de], a
    ld bc, $013e
    ld [de], a
    ld bc, $0a32
    nop
    ld bc, $0232
    ld [de], a
    ld bc, $023e
    ld [de], a
    ld bc, $0832
    nop
    ld bc, $0732
    ld a, $08
    ld [hl-], a
    ld [bc], a
    ld [de], a
    ld bc, $033e
    ld [de], a
    ld bc, $093e
    ld [de], a
    ld bc, $0132
    ld [de], a
    ld bc, $033e
    ld [de], a
    ld bc, $013e
    ld [de], a
    ld [$0132], sp
    nop
    ld bc, $0132
    ld a, $03
    ld [de], a
    ld bc, $013e
    ld [hl-], a
    ld a, [bc]
    nop
    dec b
    ld [hl-], a
    ld e, c
    nop
    nop
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
    jr jr_00a_7be9

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

jr_00a_7be9:
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
    jr jr_00a_7cde

    ld a, [de]
    dec de
    nop
    nop
    inc e
    dec e
    ld e, $1f
    jr nz, jr_00a_7cf0

    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $27
    jr z, jr_00a_7d00

    ld a, [hl+]
    dec hl
    inc l
    dec l
    nop
    nop
    nop

jr_00a_7cde:
    ld l, $2f
    jr nc, jr_00a_7d13

    ld [hl-], a
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, jr_00a_7d23

    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $00

jr_00a_7cf0:
    nop
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

jr_00a_7d00:
    nop
    nop
    nop
    nop
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

jr_00a_7d13:
    nop
    nop
    nop
    nop
    nop
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

jr_00a_7d23:
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

; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $004", ROMX[$4000], BANK[$4]

    INCBIN "gfx/image_004_4000.2bpp"

    rst $38
    rst $38
    ret nz

    rst $18
    add b
    rst $30
    add b
    rst $28
    add h
    ei
    add h
    ei
    ld [$08f5], sp
    push af
    add b
    push af
    nop
    rst $38
    nop
    rst $38
    nop
    db $db
    nop
    cp $01
    db $fc
    nop
    ei
    ld [bc], a
    push af
    nop
    ld [de], a
    nop
    reti


    nop
    ei
    ld b, b
    cp e
    nop
    di
    nop
    ld sp, hl
    add b
    ld sp, $2180
    ld a, a
    xor d
    ccf
    adc b
    rrca
    jp c, $d80f

    rlca
    sbc d
    rlca
    ret c

    inc bc
    call c, $4e01
    pop af
    ld c, h
    add sp, -$70
    add sp, $10
    add sp, -$69
    call nc, $d23b
    ld l, h
    ld [hl], a
    adc b
    db $dd
    and d
    dec d
    jr z, jr_004_5053

jr_004_5053:
    ld sp, hl
    add sp, $17
    add c
    ld a, [hl]
    ret nz

    ccf
    sub b
    ld l, a
    ld c, d
    dec [hl]
    ld a, h
    add e
    ld e, a
    and b
    ld c, b
    or h
    ld [hl+], a
    db $dd
    db $f4
    ld [$e814], sp
    rst $38
    nop
    rst $38
    db $10
    cp a
    ld b, b
    ld a, [bc]
    push af
    ld d, c
    xor [hl]
    sbc h
    inc bc
    swap h
    ldh a, [rTIMA]
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld bc, $a37e
    ld e, h
    jr c, @+$46

    ld b, [hl]
    adc c
    ld e, e
    and h
    ret z

    scf
    and [hl]
    ld e, b
    xor b
    ld d, e
    rst $38
    rst $38
    rst $38
    rst $38
    cp $ff
    cp $ff
    cp $ff
    cp $ff
    cp $ff
    db $fc
    rst $38
    nop
    ei
    nop
    rst $38
    nop
    rst $38
    nop
    rst $18
    nop
    ld sp, hl
    nop
    ei
    ld [$2073], sp
    rst $18
    ld [bc], a
    db $fd
    nop
    di
    nop
    or a
    nop
    cp $00
    sbc e
    nop
    cp [hl]
    inc b
    ld hl, sp+$08
    ld h, b
    add b
    ld c, c
    nop
    db $fd
    add b
    ld a, c
    nop
    inc hl
    ld bc, $0048
    jr z, jr_004_50d4

    add b
    ccf
    nop
    ld bc, $0052
    db $ec

jr_004_50d4:
    nop
    ld a, a

jr_004_50d6:
    nop
    ld a, [hl]
    nop

jr_004_50d9:
    rst $38
    nop
    ld a, a
    nop
    ccf
    add b
    rra
    di
    jr z, jr_004_50d9

    jr z, jr_004_50d6

    inc e
    ld a, l
    jp nz, $4833

    inc l
    sub e
    jr @-$3e

    db $10
    jp z, $0cd3

    ld b, l
    or d
    or e
    nop
    ret


    ld [de], a
    inc l
    add e
    adc d
    ld [hl], l
    dec bc
    db $f4
    ld h, l
    ld [de], a
    db $fc
    nop
    rst $38
    nop
    cp $01
    db $ed
    db $10
    and h
    ld c, b
    ld d, b
    and e
    ld e, e
    and h
    db $dd
    ld [bc], a
    cp $00
    sub [hl]
    ld bc, $10a3
    db $fd
    nop
    ld e, $00
    add hl, hl
    inc b
    db $e3
    ld [$c038], sp
    db $fc
    rst $38
    db $fc
    cp $fc
    rst $38
    ld sp, hl
    db $fc
    ld a, [$fff9]
    ld hl, sp-$03
    ld a, [$f8fb]
    ld [bc], a
    db $fc
    ld [de], a
    ld l, h
    ld h, h
    sbc b
    db $eb
    db $10
    push hl
    db $10
    db $fc
    nop
    db $fd
    ld [bc], a
    rst $28
    nop
    adc b
    ld [bc], a
    ret z

    ld hl, $00d3
    di
    nop
    sub b
    inc hl
    ld bc, $c1e3
    and [hl]
    or l
    jp Jump_000_007f


    ccf
    add b
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rra
    ld h, b
    rra
    ldh [$df], a
    ldh [$80], a
    ld a, $80
    ld e, a
    nop
    sbc a
    add b
    ld a, a
    nop
    cp a
    ret nz

    ccf
    ret nz

    ccf
    add b
    rra
    ld [$05e0], sp

jr_004_5173:
    jp nc, $c007

    inc bc
    ldh [$03], a
    db $fc
    nop
    db $fd
    nop
    rst $38
    nop
    rst $30
    dec hl
    inc b
    adc d
    dec b
    ld hl, $81ca
    ld a, d
    push bc
    jr z, jr_004_5173

jr_004_518b:
    ld hl, $01d6
    cp [hl]
    ld b, c
    dec e
    ld [c], a
    and d

jr_004_5193:
    ld c, l
    ld e, [hl]
    and c
    ld [hl], e
    add h
    ld e, l
    and d
    or d
    ld c, l
    ld a, [hl+]
    ld d, h
    sub [hl]
    jr z, jr_004_518b

    nop
    ld h, b
    adc a
    sbc d

jr_004_51a5:
    ld h, h
    push hl
    ld [de], a
    jp z, Jump_004_7201

    add b
    cp $00
    db $fd
    ld [bc], a
    push af
    ld a, [c]
    ld sp, hl
    or $f2
    db $fd
    cp $f1
    db $ec
    db $e3
    xor $f1
    add sp, -$09
    pop hl
    db $fc
    db $ed
    ld [bc], a
    ret nz

    nop
    ld b, b
    add b
    and b
    ld b, a
    nop
    rst $08
    jr nz, jr_004_5193

    jr nz, jr_004_51a5

    nop
    di
    ld e, a
    and b
    rst $38
    nop
    ld a, a
    add b
    nop
    ccf
    db $10
    rrca
    nop
    rst $38
    ld [$10f7], sp
    xor [hl]
    rst $38
    nop
    rst $38
    nop
    cp $00
    ld a, h
    add d
    nop
    ld hl, sp+$00
    ld h, c
    nop
    ldh [rP1], a
    adc d
    nop
    ld c, a
    nop
    rst $30
    nop
    ld l, e
    nop
    cp e
    nop
    ld e, a
    nop
    rrca
    nop
    cp a
    nop
    rst $38
    nop
    db $fd
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_004_5208:
    nop
    rst $38
    ld bc, $03fe
    db $fc
    inc bc
    ld a, l
    ld a, $40
    ld a, d
    add b
    rst $18
    nop
    dec d

jr_004_5217:
    add sp, -$51
    ld b, b
    rst $20
    jr nc, jr_004_5208

    ld d, h
    xor l
    ld d, [hl]
    xor l
    ld [de], a
    adc l
    ld d, d
    ld [bc], a
    dec e
    pop bc
    ld h, $d7
    jr nz, jr_004_5217

    ld bc, $c43f
    db $fc
    ld [bc], a
    sbc $20
    cp a
    ld b, b
    cp [hl]
    ld b, c
    xor e
    ld d, h
    ld l, d
    add h
    and d
    ld d, h
    cpl
    ret nc

    ld e, e
    and h
    rst $38
    nop
    sbc e
    inc b
    sbc a
    nop
    adc a
    nop
    and l
    ld b, d
    xor [hl]
    ld b, b
    ld [c], a
    db $10
    ldh [rP1], a
    ldh [$ed], a
    ldh [$fb], a
    ldh [$ef], a
    ld hl, sp-$0d
    ld hl, sp-$09
    ldh a, [$fd]
    ld hl, sp-$07
    ld hl, sp-$07
    nop
    db $e3
    nop
    pop af
    db $10
    db $ed
    db $10
    add sp, $10
    ldh [rLCDC], a
    add d
    nop
    add h
    nop
    add d
    nop
    rst $38
    nop
    rst $18
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    db $fc
    nop
    ld a, b
    nop
    ld a, c
    nop
    call nz, $c200
    nop
    push de
    nop
    ret nz

    nop
    sub l
    nop
    dec bc
    nop
    ld [hl+], a
    nop
    dec hl
    nop
    ld a, a
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a

jr_004_529c:
    nop
    rst $38
    nop
    rst $38
    rlca
    ld hl, sp+$06
    ei
    rlca
    ld hl, sp+$07
    ld a, h
    rla
    ld [$ed17], a

jr_004_52ac:
    rra
    ldh [rTAC], a
    cp l
    xor $59
    rst $28
    inc [hl]
    rst $28
    ld d, d
    rst $28
    add hl, de
    rst $38
    ld b, d
    rst $28
    jr nc, jr_004_52ac

    sub h
    ld l, [hl]
    or c
    rst $38
    nop
    cp $00
    sub $29
    and $90
    rst $30

jr_004_52c9:
    ld c, b
    ei
    jr nz, jr_004_52c9

    sub d
    reti


    ld l, [hl]
    dec d
    ld [$1244], sp
    add a
    jr nz, jr_004_529c

    ld [bc], a
    ret z

    dec b
    ret c

    ld b, $79
    add d
    ld a, [hl]
    add b
    ld hl, sp+$00
    ld hl, sp+$04
    ld a, h
    inc bc
    ld a, d
    add c
    ld a, a
    add b
    dec e
    add d
    ld h, $d9
    add hl, de
    add [hl]
    ld hl, sp-$03
    db $fc
    cp $fc
    db $fd
    db $fc
    rst $38
    cp $ff
    cp $ff
    cp $ff
    rst $38
    rst $38
    ret nz

    dec d
    ld b, b
    adc b
    ld b, b
    sub l
    nop
    jp nz, $8840

    nop
    push de
    nop
    ld b, c
    ld b, b
    xor d
    nop
    db $fc
    nop
    ret c

    nop
    ret nz

    nop
    ld b, c
    nop
    ld c, b
    nop
    dec h
    nop
    ld d, b
    nop
    ld c, d
    nop
    ld hl, $5300
    nop
    dec hl
    nop
    ld e, e
    nop
    ld c, a
    nop
    inc de
    nop
    or a
    nop
    ld d, a
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
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rla
    ld [$f807], a
    rlca
    db $fd
    rrca
    ld a, [c]
    rlca
    db $fc
    rrca
    pop af
    rlca
    db $fc
    rlca
    ld a, [$9867]
    cp a
    add b
    db $ed
    db $10
    or d
    ld d, b
    ldh [$58], a
    push hl
    sbc b
    add sp, $15
    xor b
    ld [hl], l
    dec b
    sbc b
    add hl, de
    add d
    add a
    jr jr_004_5386

    ret nz

    dec [hl]
    ld a, [bc]
    add hl, de
    ld b, h
    ld [de], a
    add hl, bc
    inc l
    pop de
    nop
    push bc
    nop
    ld h, c
    add b
    add h
    add b
    set 7, b
    db $fd
    db $fc
    rst $38
    db $fc
    rst $38
    db $fc
    rst $38
    nop
    dec h
    nop
    ld e, a
    nop
    ld a, a

jr_004_5386:
    nop
    rst $38
    nop
    cp $00
    cp $00
    rst $38
    nop
    db $fd
    nop
    sbc a
    nop
    rst $20
    nop
    cpl
    nop
    rst $08
    nop
    rst $38
    nop
    db $eb
    nop
    ei
    nop
    rst $38
    nop
    cp a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    db $fd
    nop
    rst $38
    nop
    rst $38
    nop
    cp a
    rlca
    ld sp, hl
    rlca
    ld a, [$f907]
    inc bc
    db $fd
    inc bc
    db $fc
    inc bc
    db $fd
    ld bc, $00fe
    ldh [$fc], a
    rst $38
    cp $ff
    cp $ff
    cp $ff
    cp $ff
    cp $ff
    ld hl, sp-$01
    ldh [rIE], a
    nop
    cp a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $18
    nop
    rst $38
    nop
    rst $38
    nop
    rst $30
    nop
    rst $28
    nop
    ld c, a
    nop
    rst $08
    nop
    rst $38
    nop
    cp a
    nop
    cp a
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $28
    nop
    rst $00
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp a
    ld [bc], a
    db $fd
    nop
    rst $38
    nop
    rst $38
    nop
    rra
    nop
    pop af
    nop
    rst $38
    rrca
    db $f4
    inc bc
    db $fc
    nop
    rst $38
    nop
    call nz, $fd00
    nop
    rst $38
    nop
    db $fc
    nop
    rst $38
    db $dd
    ld [hl+], a
    reti


    cpl
    ld e, a
    and b
    dec de
    ld l, h
    ld bc, $001e
    rst $38
    nop
    adc a
    nop
    sbc $9a
    ld h, l
    sbc c
    ld [hl], h
    ld [hl], l
    adc d
    ld [hl], a
    adc b
    db $dd
    and [hl]
    ld bc, $00fe
    rst $38
    inc b
    ei
    adc e
    inc h
    adc d
    ld h, l
    dec c
    sub d
    dec h
    ld e, d
    rla
    add sp, $00
    sbc a
    nop
    rst $38
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
    ld hl, sp-$02
    ldh [$fd], a
    add b
    db $fc
    rst $38
    rst $38
    db $fc
    rst $38
    ldh a, [rIE]
    ret nz

    rst $38
    nop
    and c
    nop
    add c
    nop
    scf
    nop
    ld d, a
    nop
    rst $28
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp a
    nop
    ccf
    nop
    ld a, a
    nop
    xor $00
    rlc b
    rst $38
    nop
    ld e, e
    nop
    call c, $bf00
    nop
    ld h, a
    nop
    rst $30
    nop
    rst $38
    nop
    rst $18
    nop
    cp a
    nop
    ccf
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
    nop
    rst $38
    nop
    rst $38
    nop
    rst $18
    nop
    rst $38
    nop
    rst $18
    nop
    ld a, [$ff00]
    nop
    rst $38
    nop
    rst $38
    inc b
    ld sp, hl
    nop
    rra
    nop
    ld e, a
    nop
    rst $38
    nop
    db $d3
    nop
    pop af
    nop
    cp $00
    cp $00
    ld a, l
    nop
    rst $28
    nop
    rst $00
    nop
    rst $38
    nop
    ei
    nop
    and a
    nop
    rst $38
    ld [bc], a
    ld a, l
    nop
    ld a, a
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $18
    nop
    rst $38
    nop
    rst $38
    nop
    cp l
    nop
    ld e, l
    nop
    db $ed
    nop
    rst $38
    nop
    cp a
    nop
    rst $18
    nop
    rst $28
    nop
    rst $30
    rst $38
    rst $38
    ldh a, [rIE]
    ldh [rIE], a
    ldh [$fd], a
    ret nz

    ldh [$c0], a
    rst $38
    add b
    rst $38
    sub d
    db $ed

Call_004_5500:
    rst $38
    rst $38
    nop
    rst $38
    nop
    ld a, b
    nop
    call c, $fe00
    dec b
    ld hl, sp+$00
    db $dd
    nop
    call c, $ffc0
    nop
    cp $00
    ld b, d
    nop
    adc c
    nop
    daa
    db $10
    ld c, a
    nop
    call c, $ff00
    nop
    ld hl, sp+$00
    cp l
    nop

Jump_004_5525:
    ldh a, [rP1]
    ldh [rP1], a
    ret nc

    nop
    ld b, c
    nop
    inc bc
    db $10
    rlca
    nop
    ld l, [hl]
    nop
    adc a
    nop
    rrca
    nop
    sbc a
    nop
    ld a, a
    nop
    cp $00
    cp $00
    db $fd
    nop
    ld a, a
    nop
    ei
    nop
    rst $38
    nop
    sbc [hl]
    nop
    inc a
    nop
    ld a, l
    nop
    ld sp, hl
    nop
    di
    nop
    ld a, a
    nop
    sbc a
    nop
    ccf
    nop
    cpl
    nop
    ccf
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $28
    nop
    db $fd
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ei
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    db $fc
    nop
    ld sp, hl
    nop
    ei
    nop
    di
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    db $f4
    nop
    db $f4
    nop
    pop af
    nop
    ld [hl], l
    nop
    db $fc
    nop
    call $c200
    nop
    db $fc
    nop
    db $fd
    nop
    cp a
    nop
    ld e, b
    nop
    rst $28
    nop
    ld l, c
    ld b, c
    or [hl]
    nop
    ld a, [c]
    nop
    ld [hl-], a
    nop
    cp $00
    rst $28
    nop
    rst $38
    nop
    rst $18
    nop
    xor $00
    call Call_000_0900
    nop
    db $db
    rst $38
    ld l, l
    rst $38
    or l
    rst $38
    ld d, [hl]
    rst $38
    ld e, e
    rst $38
    xor l
    rst $38
    push de
    rst $38
    ld l, [hl]
    rst $38
    ld d, l
    rst $38
    ld l, l
    rst $38
    or l
    rst $38
    ld d, [hl]
    cp $5b
    cp $ad
    db $fc
    rst $10
    db $fc
    ld l, a
    db $fc
    ld d, a
    add b
    db $ed
    nop
    rst $38
    nop
    rst $38
    nop
    rst $30
    nop
    db $fc
    ld [bc], a
    db $fc
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld a, [hl+]
    push de
    nop
    rst $08
    nop
    rst $18
    ld bc, $00fe
    rst $38
    nop
    db $fc
    ld b, d
    cp h
    nop
    db $fc
    nop
    cp $00
    db $fd
    nop
    di
    add b
    ld a, a
    nop
    ld a, a
    nop
    ld a, h
    nop
    ld a, c
    nop
    ld a, a
    nop
    ld a, a
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
    nop
    rst $38
    nop
    ei
    nop
    rst $38
    ld [bc], a
    db $fd
    ld [$00f7], sp
    rst $38
    ld [hl+], a
    db $dd
    ld [$00f7], sp
    rst $38
    nop
    ld a, [c]
    nop
    call nz, $c100
    nop
    rst $38
    nop
    ld sp, hl
    nop
    xor a
    nop
    db $fd
    nop
    rst $38
    nop
    ld a, a
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
    nop
    rst $18
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    di
    nop
    db $e3
    nop
    rst $28
    nop
    rst $38
    nop
    ld sp, hl
    nop
    pop af
    nop
    db $fc
    ld b, $e8
    nop
    or $07
    ld hl, sp+$03
    db $f4
    ld [bc], a
    db $fc
    ld bc, $02fe
    db $fc
    nop
    ld e, [hl]
    nop
    ld e, $80
    ld c, a
    nop
    db $db
    add b
    ld c, c
    nop
    ld c, a
    nop
    rrca
    ld b, b
    inc bc
    nop
    add hl, bc
    ld b, b
    rla
    nop
    ei
    nop
    rst $38
    nop
    cp a
    nop
    rst $38
    nop
    and a
    nop
    rst $30
    ld [bc], a
    db $fd
    nop
    rst $38
    nop
    db $fd
    ld bc, $02fc
    db $f4
    nop
    ld a, [$ce00]
    nop
    ld c, [hl]
    ld hl, sp-$51
    ld hl, sp-$51
    db $fc
    xor e
    ld hl, sp-$51
    ld hl, sp+$57
    db $fc
    ld d, l
    db $fc
    ld d, a
    db $fc
    ld d, a
    nop
    rst $18
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    cp h
    nop
    ld sp, hl
    ld bc, $00e6
    rlc b
    rst $18
    nop
    rst $38
    nop
    cp a
    nop
    rst $10
    nop
    rst $38
    nop
    ld e, a
    add b
    ld a, e
    nop
    rst $38
    nop
    rst $38
    nop
    db $fc
    nop
    ld sp, hl
    nop
    ei
    nop
    rst $38
    nop
    ccf
    nop
    xor $00
    rst $18
    nop
    cp [hl]
    nop
    rst $38
    nop
    cp $00
    rst $18
    nop
    cp a
    nop
    ld a, a
    db $10
    ld l, a
    inc b
    ei
    nop
    rst $38
    ld [$00f7], sp
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    halt
    nop
    rst $38
    nop
    ld a, a
    db $10
    ld l, a
    nop
    cp $00
    rst $38
    nop
    rst $38
    ld b, b
    cp a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $28
    nop
    rst $28
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
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    db $fd
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $30
    nop
    rst $38
    nop
    rst $38
    nop
    rst $00
    nop
    and e
    nop
    rra
    nop
    rra
    nop
    rst $38
    inc b
    ei
    nop
    rst $38
    nop
    ei
    nop
    ldh a, [rP1]
    ldh a, [rSB]
    ldh a, [rNR41]
    ret nc

    inc b
    ld hl, sp+$00
    rlca
    nop
    rlca
    nop
    rst $30
    nop
    ld [hl], h
    add b
    jr nc, jr_004_574b

jr_004_574b:
    dec [hl]
    add b
    ld a, [de]
    ld b, b
    add hl, de
    nop
    rla
    nop
    or c
    nop
    sbc l
    nop
    xor a
    nop
    rst $18
    nop
    rst $18
    nop
    rst $38
    nop
    ld a, e
    nop
    ld a, [hl]
    nop
    cp h
    nop
    db $fc
    nop
    db $fc
    nop
    db $fc
    nop
    cp $00
    db $fc
    nop
    cp $fc
    xor e
    cp $6b
    cp $b5
    cp $db
    cp $6b
    rst $38
    xor l
    rst $38
    or l
    rst $38
    ld e, d
    nop
    di
    nop
    rst $30
    nop
    db $fd
    nop
    rst $30
    nop
    ei
    nop
    rst $38
    add b
    ld e, [hl]
    nop
    cp a
    nop
    ld a, a
    nop
    ld a, a
    nop
    rst $30
    nop
    xor $00
    rst $38
    nop
    ei
    nop
    db $fd
    nop
    jp hl


    nop
    ld a, a
    nop
    rst $18
    nop
    ccf
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    db $fd
    nop
    db $dd
    nop
    rst $38
    nop
    db $fd
    nop
    cp $00
    cp $00
    cp a
    nop
    ld a, a
    nop
    db $fc
    nop
    cp $00
    ld a, l
    nop
    ld e, a
    nop
    ei
    nop
    db $ed
    nop
    rst $38
    nop
    rst $38
    ld [bc], a
    db $fd
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp a
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    db $fd
    nop
    rst $38
    nop
    rst $28
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ccf
    nop
    rst $38
    nop
    cp l
    nop
    adc e
    nop
    db $fc
    nop
    db $fc
    nop
    db $db
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

jr_004_57fd:
    rst $18
    nop
    rst $38
    nop
    ld a, a
    nop
    ld a, a

Call_004_5804:
    nop
    rst $38
    nop
    rst $38
    ld bc, $00fe
    db $fd
    nop
    db $fd
    nop
    db $fd
    and d
    ld b, b
    ld de, $20c0
    call c, $e800
    db $10
    add e
    ld [bc], a
    add c
    ld c, b
    rlca
    nop
    ld bc, $0410
    nop
    db $e4
    ld b, d
    ld sp, $e000
    jr nz, jr_004_57fd

    nop
    ld [hl], d
    ld b, b
    and l
    nop
    or c
    nop
    db $fd
    nop
    db $db
    nop
    sbc a
    nop
    cp [hl]
    nop
    ret z

    nop
    sbc [hl]
    nop
    db $f4
    nop
    ld b, d
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, l
    nop
    ld h, h
    nop
    dec h
    nop
    cpl
    rst $38
    xor l
    rst $38
    xor d
    rst $38
    cp l
    cp $55
    cp $b5
    cp $db
    db $fc

jr_004_585d:
    xor a
    db $fc
    ld d, e
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ei
    nop
    rst $38
    nop
    rst $38
    nop
    di
    nop
    rst $38
    nop
    rst $38
    nop
    ei
    nop
    rlc b
    push hl
    nop
    rst $30
    jr nz, jr_004_585d

    nop
    db $db
    nop
    db $fd

jr_004_5884:
    nop
    db $fd
    nop
    db $db
    nop
    db $dd
    nop
    rst $38
    nop
    rst $38
    nop
    rst $30
    nop
    rst $28
    nop
    rst $38
    nop
    rst $38
    nop
    db $fd
    nop
    rst $28
    nop
    ld l, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $28
    nop
    rst $38
    nop
    cp a
    nop
    ei
    nop
    rst $38
    nop
    ei
    nop
    rst $30
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $30
    nop
    rst $30
    nop
    rst $38
    nop
    cp $00
    rra
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
    nop
    rst $38
    nop
    rst $38
    nop
    cp a
    nop
    rst $28
    nop
    ei
    nop
    db $e3
    nop
    push hl
    nop
    sbc [hl]
    nop
    dec e
    nop
    cp $00
    ld sp, hl
    nop
    add d
    nop
    sub b
    nop
    cpl
    nop
    ld e, [hl]
    nop
    or a
    nop
    add d
    ld d, c
    nop
    nop
    ld c, $00
    ld a, [hl+]
    nop
    ld d, $00
    adc d
    nop
    xor h
    ld [$10c6], sp
    dec bc
    nop
    ld d, [hl]
    inc b
    ret nz

    jr nz, jr_004_5884

    inc d
    ld bc, $1100
    nop
    nop
    nop
    ret nz

    db $10
    jp nz, Jump_000_3c00

    nop
    rst $18
    nop
    sbc a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $18
    nop
    rst $38
    nop
    rst $28
    nop
    rrca
    db $fc
    rst $28
    db $fd
    ld d, [hl]
    ld hl, sp-$53
    ld hl, sp+$55
    ld hl, sp+$6f
    ldh a, [$bf]
    ldh a, [$af]
    ldh a, [rOCPD]
    nop
    rst $30
    nop
    rst $38
    nop
    ei
    nop
    ei
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    db $fd
    nop
    ei
    nop
    db $fc
    nop
    db $fc
    nop
    ld sp, hl
    nop
    pop af
    nop
    db $f4
    nop
    cp $00
    rst $38
    nop
    rst $38
    add b
    ccf
    nop
    ld a, a
    nop
    rst $38
    nop
    cp $00
    ld a, [hl]
    nop
    rst $38
    nop
    rst $18
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
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $30
    nop
    rst $38
    nop
    ld a, b
    nop
    ld a, [c]
    nop
    adc e
    nop
    rst $38
    nop
    rst $38
    nop

jr_004_5985:
    rst $38
    nop
    db $db
    nop
    db $dd
    nop
    ld h, [hl]
    nop
    ld h, b
    nop
    ld c, b
    nop
    ld a, [hl]
    nop
    db $fc
    nop
    rst $38
    nop
    rst $38
    nop
    ld hl, sp+$00
    db $f4
    nop
    db $e3
    nop
    ld [hl], b
    ld bc, $083e
    ld [hl], a
    jr nz, jr_004_5985

    add b
    ld l, e
    nop
    ld [hl], l
    nop
    ld a, [de]
    nop
    ld l, [hl]
    ld [bc], a
    or b
    ld bc, $00f4
    cp h
    nop
    xor d
    ld a, [bc]

jr_004_59b7:
    ld h, b
    jr nz, jr_004_59ba

jr_004_59ba:
    adc d
    nop
    ld b, b
    nop
    ld [$0401], sp
    nop
    ld d, c
    nop
    add b
    ld b, $00
    ccf
    ld b, b
    ld a, $00
    jr jr_004_59cd

jr_004_59cd:
    jr nz, jr_004_59cf

jr_004_59cf:
    call $7a00
    nop
    ld e, c
    nop
    ld hl, sp+$10
    add sp, $02
    pop af
    ld b, $39
    inc b
    ld a, e
    nop
    ld c, c
    nop
    db $eb
    nop
    jp $5a80


    nop
    ld b, $00
    add b
    nop
    pop bc
    nop
    and a
    ld a, [bc]
    push af
    ld bc, $00f6
    db $fc
    add b
    ld a, [hl-]
    nop
    ld e, a
    nop
    ld a, a
    nop
    rst $28
    nop
    ld [hl], b
    ld b, b
    dec c
    nop
    ld a, a
    nop
    rst $38
    nop
    ret c

    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    jr nc, jr_004_59b7

    ld [$1580], sp
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
    ld [bc], a
    nop
    add b
    ld bc, $8005
    db $10
    ld b, d
    inc b
    xor b
    xor c
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
    stop
    jr z, jr_004_5a6e

    inc l

jr_004_5a3f:
    stop
    nop
    nop
    nop
    nop

jr_004_5a45:
    nop
    nop
    nop
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
    nop
    and b
    nop
    ld b, b
    nop
    nop
    ld [bc], a
    nop
    dec b
    ld bc, $0220
    nop
    ld bc, $0025
    ld bc, $0010
    nop
    stop
    nop
    nop
    ld l, d
    db $10
    cp [hl]
    ld d, l

jr_004_5a6e:
    ld h, b
    dec bc
    inc b
    ld e, e
    ld d, b
    rlca
    nop
    ld a, [bc]
    ld [bc], a
    nop
    sbc b
    ld bc, $4840
    ld b, d
    jr nz, @+$24

    ld hl, $ff00
    nop
    rst $38
    nop
    rst $38
    add b
    ccf
    jr nz, jr_004_5ae4

    nop
    xor l
    ld bc, $0054
    nop
    nop
    cp $00
    db $fc
    nop
    ld a, [$e400]
    ld bc, $a290
    ld [$0000], sp
    dec l
    nop
    call nz, Call_000_0928
    db $e4
    nop
    ld d, $20
    adc e
    jr nz, jr_004_5a3f

    ld bc, $0058
    inc l
    ld hl, $0094
    ld a, a
    nop
    or l
    inc b
    ret nc

    add b
    ld [hl+], a
    add b
    ld d, c
    ld [de], a
    ldh [rDIV], a
    ldh a, [rDIV]
    ldh a, [rSC]
    ld c, c
    jr jr_004_5a45

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
    ld [hl+], a
    ret nz

    add h
    ld b, c

jr_004_5ae4:
    ld de, $0442
    add hl, hl
    ld [$0806], sp
    inc bc
    nop
    inc b
    inc b
    nop
    jr @+$22

    and d
    ld [$d000], sp
    nop
    nop
    and b
    nop
    nop
    add b
    nop
    nop
    nop
    nop
    dec b
    ld c, b
    ld c, h
    and l
    inc b
    push hl
    adc d
    ld [hl], b
    add b
    ld a, l
    add b
    ld a, l
    add b
    ld a, h
    add b
    ld a, h
    ld bc, $0100
    inc bc
    ld bc, $0101
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld b, $0a
    inc c
    nop
    ld [bc], a
    inc d
    ld [hl], b
    adc e
    ld [bc], a
    cp h
    jr nz, jr_004_5b80

    ld c, $9c
    jr c, jr_004_5b3a

    jr c, jr_004_5b4a

    cp h
    inc e
    nop
    inc b
    ld d, c
    add b
    inc d
    nop
    inc [hl]
    adc d
    add b
    ld e, a

jr_004_5b3a:
    db $10
    ld l, l
    ld bc, $00b6
    ld b, b
    ld b, l

jr_004_5b41:
    rlca
    dec [hl]
    sbc $64
    sbc c
    add b
    ld h, d
    adc h
    ld d, c

jr_004_5b4a:
    db $10
    xor $00
    cp b
    ld c, $90
    ret nz

    stop
    ld h, b
    ld c, b
    or b
    ld [bc], a
    inc b
    jr nc, jr_004_5b5d

    ld h, h
    sbc c
    ld h, h

jr_004_5b5d:
    ld [hl], d
    inc b
    ld sp, $9022
    sub b
    ld d, c
    jr jr_004_5bae

    jr jr_004_5b94

    ld h, $14
    ld bc, $239b
    inc b
    ld b, h
    ld de, $8040
    nop
    ld b, b
    nop
    jr nz, jr_004_5b77

jr_004_5b77:
    nop
    inc bc
    nop
    db $fc
    ld bc, $fe13
    ld c, d
    adc b

jr_004_5b80:
    ld bc, $0000
    nop
    ld [bc], a
    nop
    add b
    nop
    push bc
    ld b, b
    ld h, d
    ld [c], a
    or b
    jr nc, jr_004_5bad

    ret c

    nop
    scf
    inc h
    sbc e

jr_004_5b94:
    nop
    dec c
    add hl, hl
    ld b, $08
    inc bc
    ld [de], a
    add h
    db $10
    inc bc
    nop
    add hl, bc
    inc b
    ldh a, [rP1]
    ldh [rP1], a
    ldh a, [rSC]
    ld l, b
    ld c, d
    and b
    nop
    and h
    xor b

jr_004_5bad:
    ld d, b

jr_004_5bae:
    nop
    jr c, jr_004_5bb3

    nop
    inc b

jr_004_5bb3:
    ld bc, $0202
    ld bc, $0001
    nop
    nop
    nop
    ld d, $0e
    inc h
    jr c, jr_004_5b41

    nop
    db $e4
    ld d, c
    dec h
    ld [hl], d
    dec bc
    ld [de], a
    sub h
    add l
    ld a, c
    ld c, d
    ld [hl+], a
    add hl, sp
    or h
    ld de, $60a0
    ld d, b
    ld d, b
    jr nc, jr_004_5bfe

    ld d, b
    jr @+$4a

    jr z, jr_004_5c27

    inc d
    inc d
    ld h, $4c
    adc d
    nop
    nop
    nop
    nop
    inc bc
    nop
    inc bc
    ld bc, $0101
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    inc l
    nop
    inc b
    push hl
    ld [bc], a
    or b
    pop af
    ld c, $d9
    ld b, $04
    inc bc
    nop

jr_004_5bfe:
    ld bc, $0f00
    jr @+$12

    add hl, bc
    ld e, $30
    jr nc, @+$20

    ld [hl], b
    ld [bc], a
    ld h, b
    sub b
    call nz, Call_004_6498
    xor h
    inc e
    ld e, [hl]
    ld h, $0e
    ld [$0103], sp
    nop
    nop
    nop
    ld c, b
    nop
    ld [bc], a
    jr nz, jr_004_5c23

    ld bc, $18a4
    nop

jr_004_5c23:
    ld e, [hl]
    ld d, b
    jr z, jr_004_5c67

jr_004_5c27:
    jr c, @+$73

    xor b
    and e
    ld [hl], c
    ld b, $37
    sbc [hl]
    dec c
    nop
    add b
    add c
    ld bc, $4302
    ld c, $2b
    ld c, h
    add hl, de

jr_004_5c3a:
    jr nc, jr_004_5c3a

    ld h, b
    pop hl
    add c
    ldh [$28], a
    rst $20
    add sp, -$6d
    add d
    ld l, h
    adc b
    ld [hl], a
    nop
    or a
    inc h
    db $db
    add b
    ccf
    jr nz, jr_004_5caf

    sub h
    ld [bc], a
    inc d
    ret nz

    db $10
    ret z

    add b
    ld l, b
    add hl, bc
    ld d, h
    ld d, c
    ld l, $40
    xor a
    nop
    or $04
    nop
    ld b, c
    ld [bc], a
    pop bc
    nop
    add c

jr_004_5c67:
    ld h, b
    add b
    jr nc, jr_004_5c8f

    ret c

    ld bc, $03e8
    call nc, Call_004_6512
    ret nz

    ld a, [hl+]
    add b
    ldh [rP1], a
    ret nc

    ret nz

    and b
    add l
    ld d, b
    and l
    ld b, b
    ld d, b
    jp nc, $0f8e

    rlca
    add a
    db $10
    ld b, e
    nop
    nop
    jr nz, jr_004_5c8a

jr_004_5c8a:
    nop
    db $10
    ld b, b
    nop
    ld d, c

jr_004_5c8f:
    nop
    ld c, h
    nop
    ld b, h
    ld h, $e9
    and b
    ld de, $0470
    ld [$0210], sp
    sub b
    ld [$4c00], sp
    nop
    nop
    stop
    ld [bc], a
    ld [$8102], sp
    ld b, b
    add c
    nop
    jr nz, jr_004_5cad

jr_004_5cad:
    nop
    ld b, c

jr_004_5caf:
    nop
    ld sp, $0826
    ld [de], a
    ld [bc], a
    rrca
    ld [bc], a
    nop
    dec bc
    ld bc, $0501
    inc bc
    ld [bc], a
    pop de
    ld [bc], a
    dec h
    ld a, [de]
    ld d, h
    inc de
    ld d, h
    dec bc
    db $10
    xor l
    and c
    ld e, $a0
    adc l
    ld [$00d6], sp
    xor a
    ld c, $86
    jr nz, @-$37

    ld c, $f0
    nop
    cp a
    jr nz, jr_004_5d29

    ld c, b
    sub a
    db $10
    xor e
    and d
    ld e, h
    nop
    nop
    nop
    nop
    ld [bc], a

jr_004_5ce5:
    nop

jr_004_5ce6:
    db $10
    ld bc, $1001
    rlca
    nop
    ld h, $83
    jr z, @-$3d

    nop
    inc b
    ld b, $10
    add hl, bc
    inc bc
    cpl
    inc b
    ld e, b
    sub l
    sub c
    xor d
    db $10
    call Call_000_3e41
    ccf
    nop
    adc d
    rra
    ret nc

    ld b, h
    nop
    ldh [$09], a
    ldh a, [rP1]

jr_004_5d0b:
    db $ec
    add hl, bc
    db $e4
    ld bc, $80d6
    ld h, b
    add b
    ret z

    nop
    nop
    ld d, d
    nop
    ld d, b
    nop
    ld b, b
    add hl, hl
    ld [$4130], sp
    adc d
    inc l
    or h
    and b
    ld b, [hl]
    jr nz, jr_004_5ce6

    ld h, c
    ld d, b
    ret nz

jr_004_5d29:
    ld hl, $6189
    add c
    ld [hl], c
    inc b
    pop af
    ld sp, $1612
    jr z, jr_004_5ce5

    rst $08
    nop
    pop de
    jp nz, $0208

    jr nz, jr_004_5d3f

    sub c
    add h

jr_004_5d3f:
    ld b, c
    inc d
    inc de
    inc a
    add c
    or c
    ld c, $24
    ld a, e
    ld b, b
    ei
    ld [hl], b
    dec b
    ld b, l
    ld a, d
    jr nc, jr_004_5d9f

    ld bc, $01c0
    ld h, h
    ld b, b
    sub e
    ld [bc], a
    xor b
    jr nz, @-$27

    inc b
    db $db
    nop
    rst $28
    ld [bc], a
    ldh [rP1], a
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
    nop
    rst $38
    nop
    rst $38
    add b
    ld b, c
    inc c
    ldh [rP1], a
    or [hl]
    jr nz, @-$24

    ld [bc], a
    db $fc
    nop
    db $fd
    ld hl, $00de
    ld a, [$a929]
    nop
    sub h
    add b
    nop
    sub h
    ld b, b
    add b
    jr z, jr_004_5d0b

    ld d, h
    db $10
    ld c, d
    ld [de], a
    and l
    ld [bc], a
    jr z, jr_004_5d94

    sub c

jr_004_5d94:
    sub l
    nop
    and b
    ld b, b
    call nz, TimerOverflowInterrupt
    ld h, b
    jr z, jr_004_5d9e

jr_004_5d9e:
    add d

jr_004_5d9f:
    stop

jr_004_5da1:
    add h
    dec b
    ld [bc], a
    jr nz, jr_004_5d29

    nop
    sub c
    inc d
    nop
    ld bc, $8008
    nop
    ld [$8400], sp
    jr nz, @+$0b

    nop
    ld h, b
    add h
    add hl, bc
    jr nc, @+$44

    jr @+$54

    ld [$0d12], sp
    nop
    ld bc, $a100
    add b
    nop
    nop
    add b

jr_004_5dc6:
    nop
    nop
    inc b
    nop
    inc d
    ld [bc], a
    ld [bc], a
    ld a, [bc]
    ld b, b
    add c
    ld [$b8f6], sp
    dec [hl]
    ld de, $080e
    ld a, [bc]
    adc b
    adc h
    dec b
    ld b, $04
    ld b, $03
    ld bc, $7481
    add h
    ld l, c
    ld bc, $10d6
    db $eb
    nop
    ld l, a
    ld c, b
    or a
    ld [bc], a
    dec l
    ld l, b
    sub a
    inc d
    db $eb
    nop
    ld a, [$e512]
    inc b
    ei
    nop
    rst $28
    ld [$80f7], sp
    ld d, [hl]
    inc d
    db $eb
    jr jr_004_5dc6

    ld bc, $80cc
    ld h, h
    nop
    ldh a, [rDIV]
    cp b
    jr nz, jr_004_5da1

    ld hl, $80da
    ld b, l
    nop
    ld a, [$ec00]
    ld [$00f4], sp
    sub $14
    jp hl


    ld bc, $04f6
    ei
    nop
    rst $38
    adc c
    ldh [$62], a
    inc d
    ld b, b
    ld l, e
    ld b, b
    ld [hl], l
    ld hl, $221a
    db $10
    inc b
    sub b
    inc b
    add b
    jr nz, jr_004_5e69

    inc h
    sbc c
    ld sp, $2426
    add hl, de
    ld sp, $2426
    add hl, hl
    ld c, c
    ld [hl], $b0
    dec c
    ld [bc], a
    pop hl
    nop
    ret nz

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
    add b
    ld a, a
    nop
    rst $38
    add c
    xor $80
    ld [hl], a
    inc b
    ld sp, hl
    ld b, c
    cp d
    ld b, d
    dec a
    ld h, b
    ld e, e
    nop
    ei
    ld [$09f5], sp
    or $00
    rst $38
    nop

jr_004_5e69:
    db $fd
    nop
    ld [$e508], a
    nop
    sub $82
    ld a, c
    ld [bc], a
    ld sp, hl
    nop
    db $ed
    ld bc, $00d4
    ld l, b
    ld bc, $82b0
    ld d, b
    inc bc
    and c
    ld l, $c0
    inc c
    push hl
    inc c
    ld b, [hl]
    ld d, h
    add h
    adc h
    jr z, @+$0a

    ret nz

    nop
    inc b
    inc c
    add [hl]
    ld b, e
    nop
    ld b, $00
    nop
    inc bc
    jr @+$03

    jr nz, jr_004_5e9e

    xor [hl]
    nop
    jr z, @+$09

jr_004_5e9e:
    ld [bc], a
    inc b
    db $10
    and b
    add b
    ld c, b
    ld [$2824], sp
    inc b
    ld [$9804], sp
    ld [bc], a
    nop
    adc h
    add c
    ld b, $a4
    ld c, e
    ret z

    ld d, e
    jp nz, $402d

    scf
    inc [hl]
    ld sp, $2a15
    inc c
    jr jr_004_5ed0

    inc b
    nop

jr_004_5ec1:
    rst $38
    nop
    ei
    ld [bc], a
    db $fd
    nop
    cp $00
    ret


    ld [bc], a
    and b
    ld a, [hl+]
    nop
    jr z, jr_004_5ed5

jr_004_5ed0:
    nop
    rst $38
    nop
    rst $38
    nop

jr_004_5ed5:
    ei
    ld [bc], a
    xor h
    jr z, jr_004_5f2c

    ld [bc], a
    inc c
    jr nc, jr_004_5ee2

    add c
    nop
    jr nz, jr_004_5ec1

jr_004_5ee2:
    nop
    db $fd
    nop
    ld a, [hl]
    ld b, b
    cp d
    ld [bc], a
    db $10
    and h
    ld bc, $4209
    db $10
    inc h
    dec e
    ld b, d
    db $10
    dec h
    ld hl, $a198
    ld b, h
    add c
    ld [hl+], a
    and b
    ld bc, $4001
    ld bc, $0080
    rst $00
    nop
    add e
    jr c, jr_004_5f07

    ld d, b

jr_004_5f07:
    sbc h
    inc l
    jr z, jr_004_5f0d

    ld d, $80

jr_004_5f0d:
    ld bc, $c006
    dec b
    ret nz

    rla
    pop hl
    inc b
    db $eb
    ld [$00f7], sp
    inc d
    nop
    nop
    add c
    nop
    ld h, b
    ld b, b
    ldh [$8e], a
    ld [$02f3], sp
    db $fd
    nop
    dec a
    ld bc, $500e
    inc bc

jr_004_5f2c:
    ld b, d
    add hl, hl
    ld [de], a

jr_004_5f2f:
    ld bc, $8001
    add b
    ld b, c
    dec bc
    ld [hl], a
    ld e, [hl]
    xor e
    nop
    rst $38
    nop
    cp $20
    db $fc
    adc a
    ld e, $42
    db $fd
    ret nz

    rst $38
    add b
    ld a, e
    ld b, d
    xor h
    nop
    push de
    ld bc, $5340
    nop
    sub b
    jr nz, jr_004_5f51

jr_004_5f51:
    jp z, $a01a

    ld [hl+], a
    ld c, c
    nop
    add b
    dec [hl]
    nop
    ld b, b
    ld [$0003], sp
    nop
    nop
    adc d
    ld de, $05a2
    inc h
    ld [bc], a
    jr z, jr_004_5f79

    ld bc, $1014
    add b
    nop
    nop
    ld [bc], a
    nop
    nop
    db $eb
    ld [bc], a
    add c
    nop
    nop
    inc c
    nop
    ld a, [hl]

jr_004_5f79:
    dec de
    ldh [$8d], a
    cp b
    ld b, $98
    ld e, e
    ld [$2c87], sp
    add hl, bc

jr_004_5f84:
    jr @+$1c

    ld a, [c]
    ld l, h
    nop
    or $f0
    ld a, [bc]
    pop bc
    ld l, h
    adc e
    inc [hl]
    ld b, b
    ld bc, $2011
    dec b
    jr jr_004_5f2f

    inc b
    nop
    ld [bc], a
    add b
    nop
    add c
    ld b, b
    inc d
    ldh [$a0], a
    ld d, b
    ld [bc], a
    cp b
    jr nz, @-$3d

    dec b
    ldh [$0d], a
    ld b, d
    sub b
    ld hl, $4013
    ld l, b
    xor c
    nop
    add c
    adc [hl]
    nop
    nop
    ld [bc], a
    ld [bc], a
    add b
    nop
    ret nz

    ld [$00c0], sp
    inc b
    ld b, c
    add b
    nop
    db $10
    jr nz, @-$76

    add b
    nop
    jr z, jr_004_5fc8

jr_004_5fc8:
    xor b
    db $10
    add b
    ld c, b
    ld [de], a
    ld b, h
    ld d, b
    ld a, [bc]
    ld [bc], a
    inc b
    ld [$0505], sp
    nop
    nop
    inc b
    ld [bc], a
    ld [bc], a
    inc b
    inc bc
    inc bc
    nop
    dec b
    ld c, $00
    sub [hl]
    nop
    nop
    inc bc
    nop
    rst $38
    add c
    ld a, [hl]
    ld a, a
    ld [$db3f], sp
    inc b
    db $10
    and l
    push bc
    ld b, b
    ld bc, $0160
    nop
    add h
    add b
    add [hl]
    jp nz, $42c4

    ld h, b
    ld h, d
    ld [hl+], a
    jr nc, jr_004_5f84

    nop
    ld [bc], a
    add b
    add h
    ld bc, $0384
    inc b
    add b
    inc b
    inc bc
    nop
    add c
    ld bc, $8480
    jp $e205


    inc d
    ld [de], a
    inc d
    ld a, [bc]
    nop
    ld a, [bc]
    nop
    nop
    nop
    nop
    ld bc, $8000
    nop
    inc b
    nop
    ld de, $2682
    add hl, bc
    ld b, b
    rla
    ld b, b
    dec hl
    adc d
    ld hl, $4122
    nop
    ld [$0020], sp
    ld h, h
    db $10
    ld b, h
    xor b
    ld bc, $0ce2
    ldh [rP1], a
    sub $00
    and d
    ld a, [hl+]
    ld b, a

Call_004_6042:
    ld [bc], a
    dec d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    xor b
    ld b, b
    nop
    inc h
    jr nz, @-$3e

    add b
    stop
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
    ld [bc], a
    nop
    jr nz, jr_004_6070

jr_004_6070:
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
    ld e, b
    nop
    ld a, [hl]
    xor d
    ld b, $65
    ld [bc], a
    inc bc
    nop
    nop
    nop
    nop
    inc bc
    nop
    nop
    ld bc, $0045
    nop
    jr nz, jr_004_60b1

    reti


    add l
    ldh a, [rSB]
    ld [bc], a
    ld a, [bc]
    nop
    add d
    inc b
    inc c
    pop bc
    ld de, $0000
    nop
    inc b
    ld [hl-], a
    nop
    adc d
    ld [hl-], a
    inc b
    inc b
    sub d
    or b
    ld [$0820], sp
    jr nz, @-$7e

    jr nz, jr_004_6100

    nop

jr_004_60b1:
    inc b
    add b
    ld [bc], a
    adc h
    nop
    nop
    ld [bc], a
    nop
    ld bc, $0000
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
    add b
    nop
    add b
    nop
    ld b, b
    nop
    nop
    nop
    jr nz, @+$01

    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0103
    ld [bc], a
    add hl, hl
    ld a, [hl]
    xor b
    call nz, $96a1
    ld bc, $4a12
    db $10
    ld [bc], a
    inc [hl]
    adc h
    ldh a, [$08]
    call nz, Call_004_6610
    inc b
    sub d
    sub h
    ld b, e
    jr c, jr_004_610b

    ld de, $3114
    ld [$9858], sp
    adc h
    inc c
    inc c
    add $06
    ld b, [hl]
    ld c, l
    inc bc

jr_004_6100:
    ld a, b
    ld [bc], a
    add d
    inc e
    jr nc, @-$78

    inc h
    adc d
    ld c, b
    ld [de], a
    nop

jr_004_610b:
    inc h
    nop
    ld [bc], a
    inc b
    ld bc, $0005
    ld [$0a02], sp
    ld bc, $0402
    inc d
    nop
    ld de, $2008
    nop
    adc d
    ld b, b
    inc c
    and b
    ld hl, $2094
    ld e, d
    nop
    xor l
    and c
    inc d
    inc b
    ld d, b
    nop
    add d
    add b
    nop
    nop
    add c
    ld bc, $0240
    and b
    nop
    nop
    ld bc, $0000
    nop
    nop
    nop
    ld a, b
    nop
    ld b, c
    db $10
    inc d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, $2000

jr_004_614d:
    db $10
    db $10
    stop
    add b
    nop
    add c
    inc b
    nop
    dec bc
    dec bc
    ld bc, $0706
    rlca
    add d
    add e
    add e
    ld b, e
    ld h, l
    ld h, b
    ldh a, [$63]
    jp nc, $85ab

    ldh a, [$03]
    ld hl, sp-$7e
    dec a
    jr nz, jr_004_614d

    nop
    ld d, a
    jp z, $ca41

    and b
    adc d
    ldh [$0a], a
    ld [hl], l
    ld b, b
    xor d
    ld a, [bc]
    push af
    nop
    sub $14
    db $e3
    nop
    nop
    nop
    add b
    add b
    ld b, b
    add b
    nop
    ld e, $c0
    ld [bc], a
    ld c, a
    ld b, e
    and c
    add c
    ld d, c
    inc b
    nop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    and b
    nop
    nop
    ld d, b
    ld b, h
    nop
    ld [$0082], sp
    jr nz, jr_004_61a3

jr_004_61a3:
    jr nz, jr_004_61a5

jr_004_61a5:
    nop
    nop
    nop
    nop
    nop
    inc d
    nop
    and d
    ld a, [bc]
    inc b
    ld b, l
    nop
    ld bc, $0000
    nop
    nop
    jr jr_004_61b8

jr_004_61b8:
    jr nc, jr_004_61c6

    ld [de], a
    jr jr_004_61c9

    add hl, bc
    db $10
    ld b, $c9
    sub b
    nop
    inc b
    add hl, hl
    ld [bc], a

jr_004_61c6:
    ld a, [bc]
    inc d
    nop

jr_004_61c9:
    ld a, [bc]
    nop
    inc b
    ld [hl], h
    nop
    nop
    ld a, [hl+]
    and b
    ld a, [bc]
    ld a, [hl+]
    push de
    add b
    jr nz, jr_004_61e2

    nop
    nop
    dec b
    ld c, b
    nop
    ld b, h
    inc h
    db $10
    ld [hl+], a
    inc b
    ld l, e

jr_004_61e2:
    ret z

    inc sp
    ld [bc], a
    ld d, b
    add h
    add hl, hl
    ret z

    jp nz, Jump_004_640c

    nop
    ld [bc], a
    ld l, b
    ld bc, $0646
    ld b, a
    inc hl
    ld b, [hl]
    inc bc
    ld b, [hl]
    inc bc
    call nz, Call_000_0c03
    jp nz, $a60a

    nop
    add h
    ld bc, $0082
    ld bc, $8002
    inc e
    ld bc, $0e28
    ld [$6a12], sp
    dec b
    adc b
    dec h
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc c
    rra
    sbc b
    inc [hl]
    jr nc, jr_004_6240

    pop hl
    ret z

    add b
    add b
    nop
    nop
    and b
    ldh [$a4], a
    ld d, b
    nop
    ret z

    ld a, [bc]
    ldh [$08], a
    ld [hl], b
    inc bc
    inc a
    jr nz, @+$1c

    ld b, b
    inc h
    ld c, b
    jr nz, @+$36

    inc h
    inc c
    ld a, [de]
    nop
    inc b
    nop
    nop
    ld bc, $4100
    add b

jr_004_6240:
    ld de, $9608
    ld [$0b14], sp
    adc h
    ld a, [bc]
    db $10
    ld b, $c0
    ld [$4010], sp
    nop
    xor b
    ld b, e
    ld b, c
    inc bc
    and b
    ld de, $5400
    ld [$2aa0], sp
    nop
    ld d, b
    nop
    nop
    nop
    nop
    ld b, h
    dec hl
    adc b
    ld [hl], $80
    sub a
    ld [hl], h
    adc e
    jr nz, jr_004_62bf

    ld e, c
    ld a, [bc]
    nop
    ld [$0413], sp
    nop
    ld h, b
    ld b, b
    sub b
    nop
    add sp, -$76
    ld h, b
    add b
    ld d, b
    inc bc
    xor b
    nop
    ld b, h
    nop
    add b
    add b
    add c
    ld b, b
    ld b, b
    nop
    jr nz, @+$08

    nop
    rlca
    ld [bc], a
    ld b, $01
    ld b, $00
    inc bc
    nop
    adc b
    ld [bc], a
    ld [hl], l
    ld b, h
    inc c
    ld [hl-], a
    jr jr_004_62a1

    ld [hl], d
    db $f4
    add b
    dec sp
    and b
    dec c
    add b
    ld d, $40

jr_004_62a1:
    nop
    sbc b
    jr nz, jr_004_62a8

jr_004_62a5:
    add h
    cp b
    ld b, d

jr_004_62a8:
    nop
    call c, Call_004_6400
    inc b
    add d
    ld [$a201], sp
    ld de, $1904
    pop hl
    inc bc
    ld bc, $03f1
    ld bc, $0103
    inc bc
    ld [bc], a
    rlca

jr_004_62bf:
    ld b, $e2
    jr nc, jr_004_62a5

    pop de
    ret nz

    or c
    add b
    ld [hl], b
    inc bc
    ldh a, [rSB]
    ld [hl], c
    ld b, h
    cp b
    nop
    ld a, [c]
    pop bc
    db $10
    db $10
    ld h, b
    add b
    nop
    jr nc, jr_004_6318

    adc b
    jr @+$12

    inc b
    nop
    adc b
    add a
    nop
    ld [bc], a
    ld b, b
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $2c00

jr_004_62ed:
    ccf
    pop hl
    ld [hl], $08
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    dec b
    rrca
    ld b, h
    db $10
    dec d
    ldh [$f0], a
    ld a, [bc]
    ld [$0042], sp
    dec b
    nop
    nop
    nop
    nop
    ld b, b
    stop
    jr nz, jr_004_62ed

    stop
    db $10
    inc b
    cp b
    and b
    ld de, $d184
    inc d
    ld h, c

jr_004_6318:
    jr nz, jr_004_6322

    ld a, [hl+]
    dec [hl]
    jr z, jr_004_633f

    ld b, c
    ld b, d
    ld b, b

jr_004_6321:
    dec e

jr_004_6322:
    nop
    ld h, b
    ld l, l
    ld d, b

jr_004_6326:
    ld b, b
    ld d, $64
    ld b, e
    ld c, b
    ld d, e
    ld a, [c]
    ld c, l
    ret nz

    add e
    nop
    ld b, b
    ld b, b
    add b
    db $10
    jr nz, jr_004_6397

    ld [$2000], sp
    inc h

jr_004_633b:
    sub b
    nop
    sbc b
    ld [hl+], a

jr_004_633f:
    ret z

    nop
    nop
    nop
    nop
    ld b, b
    add b
    nop
    nop
    nop

jr_004_6349:
    nop
    ld bc, $0202
    rlca
    ld b, $06
    ld b, h
    add hl, bc
    ld b, c
    ld h, [hl]
    ld c, h
    ld h, c
    jr nz, jr_004_639a

    ld [de], a
    jr jr_004_6349

    ld sp, $cf37
    cp a
    inc bc
    ld [$2095], sp
    adc [hl]
    jr z, @-$79

    ld [$8080], sp
    ld b, b
    add b
    ld h, b
    jp Jump_000_2250


    pop hl
    nop
    nop
    nop
    nop
    ld a, [bc]
    nop
    ld b, b
    nop
    nop

jr_004_6379:
    jr nz, jr_004_633b

    nop
    ld bc, $0240
    add c
    inc c
    ld [bc], a
    dec bc
    ld b, $84
    inc bc
    ld [de], a
    inc b
    ld a, [de]
    add hl, bc
    jr nc, jr_004_63c9

    ld h, c
    ld a, d
    sub h
    pop af
    jr nc, @-$36

    ld [bc], a
    ld a, b
    inc bc
    cp c
    inc b

jr_004_6397:
    pop bc
    rrca
    ld b, d

jr_004_639a:
    jr c, jr_004_6321

    add hl, bc
    sbc h
    jr jr_004_6326

    sbc h
    inc b
    ld hl, sp+$4e
    or d
    ld a, b
    ld c, b
    ret c

    ld hl, sp+$24
    nop
    ld a, [hl]
    nop
    xor [hl]
    nop

jr_004_63af:
    rst $00
    ld l, a
    inc e
    ld [$2032], sp
    ld [$0401], sp
    inc b
    nop
    ld d, l

jr_004_63bb:
    nop
    inc b
    ld a, [bc]
    inc b
    ld bc, $e000
    nop
    add b
    ld [de], a
    nop
    jr c, jr_004_63d0

    ret nz

jr_004_63c9:
    add b
    nop
    nop
    ld b, b
    add b
    nop
    ld b, b

jr_004_63d0:
    inc b
    inc bc
    inc c
    ld b, $24
    ld [$0a0c], sp
    jr nz, jr_004_63e6

    ld [$0008], sp
    inc b
    inc d
    nop
    add b
    ld l, b
    ld [bc], a
    nop
    ld d, h
    nop

jr_004_63e6:
    add b
    jr nz, @+$3e

    db $10
    ld l, b
    ld e, $3d
    inc [hl]
    jr c, @+$08

    nop
    xor b
    nop
    ld b, h
    nop
    jr nz, jr_004_6379

jr_004_63f7:
    stop
    ld b, b
    ld a, [bc]
    nop
    jr nz, jr_004_6402

    dec b
    db $10

Call_004_6400:
    stop

jr_004_6402:
    jr nz, jr_004_640c

    add b
    nop
    ld [$2000], sp
    nop
    nop
    nop

Jump_004_640c:
jr_004_640c:
    and b
    nop
    jr nz, jr_004_6410

jr_004_6410:
    ld d, b
    ld b, b
    ld b, c
    adc b
    ret


    and b
    ld a, [bc]

jr_004_6417:
    ldh [$28], a
    ld bc, $2469
    ld c, c
    jr nz, jr_004_63af

    dec h
    nop
    nop
    nop
    nop
    ld bc, $0b00
    ld bc, $1f0e
    ld [de], a
    jr c, @+$76

    add hl, sp
    ldh [rDMA], a
    jp z, $caa1

    sub b
    ld d, d
    add c
    jp nz, $1a89

    jr nz, jr_004_63bb

    inc d
    add b
    ld a, [bc]
    ld [de], a
    ld b, b
    nop
    push af
    nop
    or d
    and h
    ld d, c
    ld bc, $026a
    sub c
    inc b
    ld bc, $0255
    sub h
    inc bc
    inc b
    rrca
    rlca
    rrca
    inc bc
    inc b
    inc bc
    ld [bc], a
    ld bc, $0001
    ld bc, $0000
    nop
    nop
    ld [hl+], a
    ld d, a
    ld b, d
    sub c
    ld b, b
    ld hl, $0045
    nop
    ld [bc], a
    ret z

    nop
    add b
    db $e4
    ld b, b
    add b
    ld h, b
    sub b
    ld h, d
    jr nz, jr_004_63f7

    jr nz, jr_004_6417

    ld b, b
    ld b, c
    ret nc

    ld hl, $0020
    db $10
    ld b, $00
    inc hl
    inc bc
    inc bc
    inc bc
    inc bc
    ld bc, $0109
    ld a, [hl]
    inc b
    ld hl, $6e3f
    db $10
    ld [hl], a
    scf
    dec d
    ld c, b
    ld bc, $128a
    add h
    ret nz

    adc e

Call_004_6498:
    ld b, d
    ldh [$e4], a
    ld hl, $f205
    xor b
    ld bc, $8d08
    add hl, de
    add h
    ld [$488a], sp
    inc b
    add hl, bc
    ld [bc], a
    ld a, [hl+]
    nop
    ld bc, $0095
    ret nz

    inc c
    inc bc
    nop
    rlca
    ld b, h
    add e
    inc c
    inc hl
    add sp, $15
    ld bc, $02fa
    dec a
    inc b
    sbc a
    dec e
    add b
    add hl, bc
    call z, $c658
    inc b
    rst $08
    inc b
    jp $c229


    ld sp, $f7d0
    sbc b
    ld bc, $20a0
    ld b, b
    ld [$2290], sp
    ld b, h
    ld c, b
    or e
    nop
    dec a
    ld b, c
    inc e
    ld b, b
    ld b, $10
    nop
    inc d
    nop
    dec d
    nop
    nop
    dec bc
    nop
    dec b
    dec b
    nop
    dec d
    nop
    ld bc, $1588
    ld [$3a31], sp
    ld [hl], h
    ret z

    adc d
    ld [c], a
    ld [de], a
    dec b
    inc b
    add hl, bc
    jr c, jr_004_6500

    nop
    sbc h

jr_004_6500:
    dec [hl]
    nop
    jr nz, jr_004_650e

    ld [$0015], sp

jr_004_6507:
    ld [bc], a
    nop
    ld bc, $0000
    nop
    nop

jr_004_650e:
    add sp, $00
    nop
    nop

Call_004_6512:
    nop
    add b
    nop
    nop
    nop
    nop
    ld bc, $0100
    ld bc, $0e43
    inc e
    dec c
    ld d, h
    ld bc, $e091
    add h
    pop de
    sub b
    add c
    sub b

jr_004_6529:
    adc c
    db $10
    call z, $8410
    db $10
    ret z

    inc c
    ld [hl], c
    ld bc, $5802
    ld bc, $2491
    and b
    ld a, [de]
    and b
    ld c, c
    adc e
    ld [hl], b
    nop
    ld d, h
    inc d
    ld c, d
    ld d, b
    ld a, [bc]
    ld [de], a
    jr z, jr_004_6507

    jr @+$12

    ld h, b
    ld b, b
    add b
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    nop
    ld [bc], a
    nop
    dec b
    ld bc, $032a
    ld b, e
    ld b, $02
    rlca
    ld a, [bc]
    dec b
    nop
    nop
    nop
    nop
    ld bc, $6800
    rst $38
    add b
    and b
    ld h, b
    ld b, b
    add h
    jr nc, jr_004_65dd

    ld b, d
    jr nz, jr_004_65b2

    jr nz, jr_004_65c4

    ld h, b
    ld b, b
    ld a, [bc]
    ldh [$8a], a
    inc b
    nop

jr_004_657b:
    nop
    jr nc, jr_004_657e

jr_004_657e:
    ld bc, $bc18
    nop
    jr nz, jr_004_6584

jr_004_6584:
    ret nz

    nop
    add b
    nop
    add hl, de
    nop
    jr z, jr_004_6598

    or b
    inc d
    ld [hl], b
    ld e, b
    ld a, a
    ld sp, $3f55
    cp [hl]
    ld hl, $45fa

jr_004_6598:
    or d
    ld l, l
    ld a, d
    pop bc
    ld h, d
    add hl, sp
    ld b, d
    ld sp, $d40a
    jr nz, jr_004_6529

    call Call_000_1092
    ld h, l
    ld b, h
    ld a, [de]
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a

jr_004_65b2:
    sub b
    nop
    or c
    ld c, b
    inc bc
    xor b
    add d
    ld d, h
    sub b
    ld b, b
    nop
    jr nz, jr_004_65c5

    nop
    ld a, b
    ld a, b
    ld [hl], b
    inc [hl]

jr_004_65c4:
    ret nz

jr_004_65c5:
    ld a, [hl+]
    ld [$0291], sp
    ret z

    db $10
    ld h, h
    nop
    ld a, [de]
    add d
    dec b
    ld [bc], a
    nop
    ld [$0100], sp
    ld [$0403], sp
    inc b
    inc bc
    nop
    dec bc
    nop

jr_004_65dd:
    dec b
    ld b, c
    ld [bc], a
    ld bc, $9288
    ld b, b
    add d
    nop
    ld a, [de]
    ret nz

    ld [bc], a
    ld l, l
    ld c, b
    ld [hl+], a
    ld b, b
    add b
    rra
    jr nz, jr_004_65f2

    ld d, b

jr_004_65f2:
    ld d, h
    nop
    sub b
    jr nz, jr_004_657b

    jr jr_004_65f9

jr_004_65f9:
    ld b, h
    inc d
    ld [hl+], a
    inc h
    ld a, [bc]
    ld [$0102], sp
    ld c, $04
    inc bc
    call nz, $0002
    ld b, b
    sbc b
    jr nz, jr_004_662b

    ld d, b
    add b
    jr c, jr_004_6631

    ld d, h

Call_004_6610:
    nop
    ld l, h
    ld c, b
    sub b
    db $10
    jr nz, jr_004_6617

jr_004_6617:
    jr jr_004_6619

jr_004_6619:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add h
    stop
    ld b, b
    ld de, $0180
    add b
    nop
    ld b, b
    nop

jr_004_662b:
    nop
    ld b, b
    ld bc, $0000
    ld b, b

jr_004_6631:
    nop
    ld b, b
    nop
    nop
    jr nz, jr_004_667f

    nop
    ld [$00a0], sp
    ld d, b
    ret nc

    jr nz, @+$06

    ld h, b
    add hl, bc
    dec b
    ld bc, HeaderLogo
    nop
    ld [bc], a

jr_004_6647:
    nop
    dec b
    ld bc, $0200
    nop
    nop
    nop
    nop
    ld c, a
    scf
    ld a, [de]
    xor e
    ld a, [bc]
    adc c
    adc h
    add a
    ld c, $46
    inc bc

jr_004_665b:
    add a
    ld bc, $0101
    nop
    ret nz

    nop
    call c, $00e0
    ld a, h
    jr jr_004_6668

jr_004_6668:
    rra
    inc c
    dec a
    add a
    sbc b
    ld [hl], $98
    call nc, $b800
    ld b, b
    nop
    ld b, b
    jr nz, jr_004_6647

    jr nz, jr_004_65f9

    ld l, b
    adc b
    ret nz

    db $10
    ret nz

    inc b

jr_004_667f:
    nop
    ld b, e
    inc hl
    cp e
    jr nz, @+$7e

    ld b, b
    ld a, h
    jr nz, jr_004_66f6

    ld [hl], $68
    ld a, $38
    inc l
    ld [hl], c
    inc e
    add a

jr_004_6691:
    nop
    rst $28
    ld b, e
    inc a
    rst $30
    cp h
    ld c, [hl]
    ld [hl], d
    dec c
    inc bc
    dec a
    ld h, c
    nop
    add c
    jr nc, jr_004_6691

    ld d, b
    ld sp, $02f8
    sbc b
    nop
    ld bc, $0081
    pop hl
    ld b, b
    ret nz

    ld [hl], b
    pop bc
    ldh [rSB], a
    inc bc
    rlca
    nop
    inc hl
    inc bc
    rrca
    ld bc, $0757
    ld b, c
    inc hl
    nop
    and b
    ld hl, $c000
    ld b, b
    add d
    ldh [$c0], a
    ret nz

    ret nc

    ldh [$e0], a
    add sp, -$20
    ldh a, [$f1]
    ldh a, [$60]
    ld a, b
    ld [bc], a
    ld h, h
    inc b

jr_004_66d3:
    db $10
    ret nc

    ld [$4400], sp
    db $10
    jr nz, jr_004_665b

    nop
    nop
    nop
    nop
    nop
    ld b, b
    sub b
    nop
    ld [$0000], sp
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    inc bc
    ld bc, $8430
    ld bc, $505a
    add hl, bc

jr_004_66f6:
    ld de, $4328
    ld e, b
    ld d, b
    call nz, $e290
    ld [bc], a
    ret c

    call nz, $001a
    ld c, d
    ld [bc], a
    and b
    ld b, $90
    nop
    ld c, e
    ld [de], a
    add l
    sub h
    ld b, c
    add b
    ld c, d
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    inc h
    ld [$9648], sp
    db $10
    ld c, e
    db $10
    xor e
    inc h
    ret z

    nop
    ld d, d
    nop
    ld bc, $0000
    inc e
    nop
    ld b, b
    ld c, $81
    jr nz, jr_004_6771

    ret nz

    nop
    nop
    add b
    nop

jr_004_6734:
    jr z, jr_004_6736

jr_004_6736:
    nop
    inc b
    ld d, [hl]
    ld [bc], a
    xor b
    dec hl
    add b
    ld d, h
    nop
    add b
    add b
    jr nc, jr_004_6743

jr_004_6743:
    ld d, b
    ld [bc], a
    ld [$0048], sp
    and d
    jr nz, jr_004_66d3

    ld d, c
    ret nz

    ld b, b
    nop
    ld h, b
    rst $28
    add h
    rst $30
    ld h, b
    ld c, b
    ld [hl], b
    nop
    nop
    ld [bc], a
    add b
    cpl
    sub c
    ld a, l
    rlca
    dec e
    ld [hl-], a
    ld b, b
    nop
    ldh [$a0], a
    ld [hl], b
    ldh a, [rP1]
    jr c, @+$6a

    db $10
    adc h
    inc a
    jr nz, jr_004_6734

    inc c
    sub b
    inc e

jr_004_6771:
    jr c, @+$0b

    ld c, $02
    dec b
    dec b
    ld bc, $0202
    call c, Call_000_2401
    ld l, [hl]

jr_004_677e:
    db $10
    ld [de], a
    ld b, c
    ret nz

    add d
    jr nz, @+$05

    pop bc
    ld bc, $0001
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$18e0], sp
    add h
    cp c
    inc c
    add $dc
    inc b
    ld [c], a
    ld b, h
    ld [bc], a
    inc c
    ld bc, $02b8
    nop
    nop
    ld [bc], a
    nop
    ld b, d
    ld bc, $a143
    add d
    ld sp, $0904
    ld d, c
    ld [bc], a
    db $10
    adc c
    ld b, h
    or b
    sub b
    ld [hl+], a
    jr nz, @+$4a

    sbc b
    db $10
    reti


    call z, Call_004_6c81
    inc hl
    ret nz

    ld [$0060], sp
    nop
    nop
    nop
    nop
    nop
    inc bc
    ld b, $07
    ld a, [bc]
    rra
    ld d, $18
    ld [hl], $20
    ld e, l
    ld c, $03
    ld e, $2c
    ld a, b
    rst $30
    call nz, $9591
    xor b
    jr nz, jr_004_6826

    ld c, d
    and l
    add b
    rla
    db $10
    ld b, l
    nop
    jr z, jr_004_6806

    add h
    inc b
    sub b
    sub l

jr_004_67e9:
    ld [$8e31], sp
    add b
    rra
    jr nz, jr_004_677e

    ld [bc], a
    ld e, h
    ld b, b
    ld l, $88
    jr nc, jr_004_6817

    call nc, Call_004_5804
    ld b, b
    and d
    ld a, [bc]
    jr nz, jr_004_6841

    dec d
    sub e
    and c
    add c
    pop bc
    ld b, b
    ret nz

jr_004_6806:
    ld b, b
    jr nz, jr_004_6809

jr_004_6809:
    jr nz, jr_004_680c

    nop

jr_004_680c:
    jp nz, Jump_004_6e03

    push hl
    ld b, b
    nop
    ld d, b
    jr nz, jr_004_6815

jr_004_6815:
    jr nz, @-$7e

jr_004_6817:
    nop
    add b
    ld b, b
    nop
    ld b, b
    nop
    nop
    ld b, c
    nop
    ld a, [bc]
    ld b, b
    nop
    nop
    and c
    nop

jr_004_6826:
    add c
    ld d, b
    nop
    ld b, b
    nop
    nop
    ld [$1800], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc b
    add b
    ret nz

    call nz, Call_004_6042
    add [hl]
    ld hl, $4268
    inc e

jr_004_6841:
    ld [$0c0f], sp
    ld [$0505], sp
    inc b
    nop
    inc bc
    and b
    nop
    ld h, b
    ld d, b
    ld [bc], a
    jr nz, jr_004_67e9

    add [hl]
    sub b
    ld c, h
    ld c, b
    ret z

    nop
    jr nz, jr_004_685d

    add b
    ld [$0202], sp

jr_004_685d:
    inc b
    jr jr_004_6861

    nop

jr_004_6861:
    ld [$0000], sp
    add b
    nop
    add b
    ld b, b
    cpl
    ld b, b
    nop
    dec b
    add c
    ld [bc], a
    ld [bc], a
    ld b, c
    ld bc, $0100
    nop
    nop
    nop
    add e
    nop
    nop
    ld bc, $0041
    ld [bc], a
    nop
    ld b, [hl]
    ld bc, $5820
    nop
    jr nz, jr_004_68e5

    sub b
    inc c
    jr z, @+$63

    nop
    ld b, b
    stop
    add b
    xor b
    ld b, b
    ld [bc], a
    ld b, h
    inc e
    ld bc, $0e30

jr_004_6896:
    cp h
    rra
    ld h, $0f
    nop
    rlca
    nop
    nop
    ld b, $00
    ld c, b
    or b
    nop
    ld l, b
    ld c, b
    inc h
    nop
    ld [hl], $40
    ld bc, $200a
    ldh [rTIMA], a
    inc b
    jr nc, jr_004_68b1

jr_004_68b1:
    nop
    nop
    nop
    add b
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    add b
    nop
    nop
    ld b, b
    pop af
    ld h, $44
    pop af
    ld d, b
    ld a, [hl+]
    ld b, d
    ld l, b
    ld h, d
    inc b
    nop
    ld [de], a
    and d
    ld b, b
    jp z, Jump_000_20e0

    ld b, c
    dec b
    add b
    jr z, jr_004_6896

    add b
    inc [hl]
    and c
    ld [$5000], sp
    sub c
    nop
    ld hl, $8040
    ld d, d
    inc d
    pop bc
    nop

jr_004_68e5:
    ld l, d
    ld c, b
    inc d
    ld bc, $01a4
    ret nz

    adc a

jr_004_68ed:
    nop
    nop
    rst $00
    nop
    cp a
    and h
    add hl, bc
    dec h
    sub b
    ldh [rTIMA], a
    ret nz

    nop
    nop
    jr nz, jr_004_68fd

jr_004_68fd:
    nop
    nop
    ld d, $00
    and l
    inc b
    ld d, d
    inc b
    and c
    nop
    nop
    nop
    nop
    nop
    ld bc, $0000
    ld [bc], a
    sub h
    ld bc, $0380
    ld b, b
    add d
    ld bc, $0100
    nop
    nop
    ld a, [bc]
    nop
    nop
    nop
    nop
    inc c
    nop
    add h
    inc b
    add b
    nop
    add b
    nop
    nop
    nop
    nop
    ld bc, $1000
    ld bc, $4b00
    ld [$2000], sp
    nop
    add d
    db $10
    sub b
    ld b, b
    add b
    ld c, b
    nop
    add b
    nop
    nop
    nop
    nop
    nop
    inc c
    nop
    nop
    ld bc, $2600
    nop
    adc b
    ld bc, $0000
    nop
    ld bc, $0000
    ld [bc], a
    nop
    ld h, $00
    ld l, b
    ld bc, $b402
    nop
    nop
    nop
    ld b, b
    nop
    nop
    nop

jr_004_695f:
    jr c, jr_004_696b

    jr nc, jr_004_68ed

    inc c
    ld b, b
    ld b, d
    ld b, h
    ld bc, $0201
    ld b, h

jr_004_696b:
    add hl, bc
    nop
    add c
    ld [$0804], sp
    ld [bc], a
    ld a, [bc]
    ld bc, $044a
    ld e, b
    ld [bc], a
    ld [de], a
    inc b
    nop
    halt
    nop
    add h
    nop
    add hl, hl
    ld h, b
    ld a, [de]
    ld [bc], a
    jr jr_004_69f5

    dec b
    inc b
    jr nc, jr_004_69ae

    db $10
    ld h, b
    stop
    nop
    ld b, b
    xor c
    nop
    ld bc, $0100
    nop
    ld bc, $0140
    ld [$0021], sp
    add c
    db $10
    ld [$c100], sp
    sub b
    pop bc
    sub h
    ld b, b
    add b
    ld [hl+], a
    xor d
    pop bc
    add d
    and l
    add h
    sub c
    and b
    nop

jr_004_69ae:
    nop
    rlca
    ld b, b
    cp c
    ld bc, $01fc
    ld e, b
    ld [de], a
    inc h
    inc b
    nop
    db $10
    ld [bc], a
    inc b
    add b
    ld [hl+], a
    sbc c
    add c
    ld b, e
    nop
    ld b, c
    ld b, b
    jr nz, jr_004_6a07

    sub b
    nop
    ld l, b
    ld c, b
    inc d
    nop
    add d
    add b
    ld bc, $2150
    ld b, b
    or c
    add c
    ld h, b
    nop
    ld [hl], c
    ld b, b
    jr nz, jr_004_695f

    ld bc, $0120
    ld c, c
    ld h, $ff
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
    rst $38
    rst $38

jr_004_69f5:
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

Jump_004_6a00:
    rst $30
    ld hl, sp-$19
    ld hl, sp-$11
    ldh a, [$cf]

jr_004_6a07:
    ldh a, [$df]
    ldh [$9b], a
    db $e4
    cp a
    ret nz

    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp a
    ld b, b
    rst $38
    nop
    cp $00
    rst $30
    nop
    db $dd
    nop
    db $eb
    nop
    rst $38
    nop
    ld [$bf00], a
    nop
    or $00
    rst $18
    nop
    or l
    nop
    ld [$ff00], a
    nop
    rst $18
    nop
    push af
    nop
    cp a
    nop
    push de
    nop
    ld l, [hl]
    nop
    xor e
    nop
    db $dd
    nop
    rst $38
    nop
    ld [$f500], a
    nop
    ld e, d
    nop
    or [hl]
    nop
    jp c, Jump_004_6a00

    nop
    or l
    nop
    ld l, l
    nop
    xor e
    nop
    xor l
    nop
    xor d
    nop
    xor e
    nop
    xor d
    nop
    xor d
    nop
    ld d, l
    nop
    rst $30
    nop
    ld e, a
    nop
    cp a
    nop
    rst $38
    nop
    cpl
    nop
    db $db
    nop
    ld d, a
    nop
    ld e, l
    nop
    rst $20
    rra
    db $e3
    rrca
    reti


    rlca
    db $ed
    inc bc
    db $fc
    inc bc
    cp $01
    rst $30
    nop
    db $fd
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
    ccf
    rst $38
    adc a
    ld a, a
    db $e3
    rra
    cp $ff
    db $fd
    cp $fb
    db $fc
    rst $30
    ld hl, sp-$09
    add sp, -$21
    ldh [$9f], a
    ldh [$3f], a
    ret nz

    rst $28
    db $10
    db $fd
    nop
    rst $38
    nop
    ei
    nop
    cp $00
    rst $30
    nop
    db $fd
    nop
    rst $28
    nop
    ld l, a
    nop
    or [hl]
    nop
    ld a, l
    nop
    rst $10
    nop
    ld sp, hl
    nop
    xor l
    nop
    push de
    nop
    ld [$7500], a
    nop
    jp c, $ad00

    nop
    ld l, d
    nop
    xor a
    nop
    ld d, l
    nop
    ld d, [hl]
    nop
    xor a
    nop
    ld [hl], a
    nop
    cp a
    nop
    ld [hl], a
    nop
    db $dd
    nop
    ld a, a
    nop
    cp $01
    ld a, [$f005]
    rrca
    ld l, [hl]
    nop
    ei
    nop
    ld a, a
    nop
    rst $38
    nop
    nop
    rst $38
    add b
    ld a, a
    dec d
    rst $38
    xor $ff
    push de
    nop
    cp a
    nop
    rst $38
    nop
    add c
    ld a, [hl]
    nop
    rst $38
    jp c, Jump_004_6aff

    rst $38
    or l

Jump_004_6aff:
    rst $38
    ld d, [hl]
    nop
    ld l, d
    nop
    db $db
    nop
    ld [hl], l
    add b
    ccf
    ret nz

    rra
    ldh [rTAC], a
    ld hl, sp+$43
    db $fc
    rst $38
    nop
    rst $38
    nop
    ld e, a
    nop
    rst $38
    nop
    ld e, a
    nop
    rst $30
    nop
    cp [hl]
    nop
    db $db
    nop
    ld sp, hl
    rlca
    cp $01
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    sbc $00
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld a, a
    rst $38
    ccf
    rst $38
    sbc a
    ld a, a
    sbc a
    ld a, a
    rst $38
    ccf
    sbc a
    ld a, a
    cp $ff
    cp $ff
    db $fc
    rst $38
    db $fd
    cp $fd
    cp $fb
    db $fc
    di
    db $fc
    rst $30
    ld hl, sp+$7f
    add b
    ld a, a
    add b
    cp $00
    rst $38
    nop
    ei
    nop
    db $fd
    nop
    db $eb
    nop
    db $fd
    nop
    or a
    nop
    rst $18
    nop
    or [hl]
    nop
    ld a, a
    nop
    jp c, $7f00

    nop
    ld d, [hl]
    nop
    db $fd
    nop
    ld d, l
    nop
    db $db
    nop
    xor a
    nop
    rst $18
    nop
    or [hl]
    ld bc, $07f8
    ld hl, sp+$07
    ldh [$1f], a
    rst $38
    nop
    ld a, [hl]
    ld bc, $1fe0
    add c
    ld a, a
    dec d
    rst $38
    ld a, [hl-]
    rst $38
    ld l, a
    rst $38
    or l
    rst $38
    add e
    ld a, a
    dec c
    rst $38
    dec hl
    rst $38
    ld [hl], a
    rst $38
    xor l
    rst $38
    rst $38
    rst $38
    xor d
    rst $38
    rst $38
    rst $38
    ld a, e
    rst $38
    rst $18
    rst $38
    ld a, l
    rst $38
    rst $28
    rst $38
    ld a, e
    rst $38
    sbc $ff
    ei
    rst $38
    cp a
    rst $38
    jp c, Jump_004_6dff

    rst $38
    jp c, Jump_004_76ff

    rst $38
    db $db
    rst $38
    xor $ff
    cp e
    rst $38
    rst $18
    rst $38
    and e
    db $fc
    ld d, c
    cp $a8
    rst $38
    xor b
    rst $38
    ld d, h
    rst $38
    jp c, Jump_004_6dff

    rst $38
    or l
    rst $38
    rst $28
    nop
    ld a, [$7600]
    add b
    ld a, l
    add b
    ld a, $c0
    rrca
    ldh a, [rTMA]
    ld hl, sp+$43
    db $fc
    db $fd
    nop
    or a
    nop
    db $fd
    nop
    rst $10
    nop
    cp l
    nop
    ld l, a
    nop
    push de
    nop
    sbc $00
    rst $28
    ccf
    rst $08
    ccf
    rst $30
    rrca
    ld [hl], e
    rrca
    ld sp, hl
    rlca
    ld l, b
    rlca
    cp $01
    rst $38
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
    rst $38
    rst $38
    ld a, a
    rst $38
    rst $20
    ld hl, sp-$11
    ldh a, [$fb]
    db $e4
    adc $f0
    sbc a
    ldh [$bd], a
    ret nz

    ld a, $c0
    ld a, l
    add b
    xor d
    nop
    db $fd
    nop
    ld d, a
    nop
    ld [$7500], a
    nop
    xor l
    nop
    push de
    nop
    ld [$af00], a
    nop
    ld [hl], a
    nop
    cp a
    nop
    xor [hl]
    ld bc, $027d
    ld a, h
    inc bc
    ld [hl], h
    dec bc
    ldh a, [rIF]
    pop hl
    rra
    add e
    ld a, a
    add l
    ld a, a
    dec bc
    rst $38
    dec d
    rst $38
    ld d, $ff
    dec hl
    rst $38
    ld d, [hl]
    rst $38
    ld a, a
    rst $38
    xor e
    rst $38
    ld a, a
    rst $38
    db $dd
    rst $38
    ld l, a
    rst $38
    rst $38
    rst $38
    xor [hl]
    rst $38
    rst $30
    rst $38
    or $ff
    ld a, a
    rst $38
    db $ed
    rst $38
    rst $38
    rst $38
    or a
    rst $38
    cp $ff
    db $db
    rst $38
    rst $38
    rst $38
    db $ed
    rst $38
    rst $38
    rst $38
    cp e
    rst $38
    rst $38
    rst $38
    db $ed
    rst $38
    rst $38
    rst $38
    rst $30
    rst $38
    cp l
    rst $38
    push af

Call_004_6c81:
    rst $38
    cp a
    rst $38
    rst $30
    rst $38
    db $dd
    rst $38
    rst $38
    rst $38
    ld l, l
    rst $38
    rst $38
    rst $38
    or a
    rst $38
    jp c, Jump_004_76ff

    rst $38
    db $db
    rst $38
    db $ed
    rst $38
    ld [hl], l
    rst $38
    db $dd
    rst $38
    db $76
    rst $38
    jp c, $a3ff

    db $fc
    sub b
    rst $38
    ld d, h
    rst $38
    ld b, b
    rst $38
    ld d, h
    rst $38
    ld b, d
    rst $38
    xor b
    rst $38
    and b
    rst $38
    db $eb
    nop
    db $fd
    nop
    ld l, e
    add b
    ld [hl], l
    add b
    ld a, $c0
    ld a, [hl-]
    ret nz

    ld e, $e0
    dec c
    ldh a, [$5f]
    nop
    rst $38
    nop
    ld d, a
    nop
    xor l
    nop
    or [hl]
    nop
    db $db
    nop
    xor l
    nop
    halt
    nop
    ccf
    rst $38
    sbc a
    ld a, a
    adc a
    ld a, a
    rst $28
    rra
    rst $20
    rra
    rst $30
    rrca
    ld h, a
    rra
    di
    rrca
    cp $ff
    rst $38
    rst $38
    cp $ff
    db $fc
    rst $38
    db $fc
    rst $38
    ld hl, sp-$01
    db $fc
    rst $38
    ld sp, hl
    cp $3b
    ret nz

    db $fd
    nop
    rst $30
    nop
    ei
    nop
    db $fd
    nop
    or $00
    ld [$fd00], a
    nop

Jump_004_6d00:
    ld e, d
    nop
    db $eb
    nop
    ld d, l
    nop
    and a
    nop
    ld d, a
    nop
    xor e
    nop
    rst $10
    nop
    ld c, d
    ld bc, $1be4
    pop de
    cpl
    add d
    ld a, a
    ld b, c
    cp a
    inc b
    rst $38
    add c
    ld a, a
    ld [bc], a
    rst $38
    add c
    ld a, a
    cp e
    rst $38
    ld d, [hl]
    rst $38
    ld l, l
    rst $38
    ld d, [hl]
    rst $38
    xor e
    rst $38
    ld d, l
    rst $38
    ld e, e
    rst $38
    ld c, l
    rst $38
    cp l
    rst $38
    rst $28
    rst $38
    or a
    rst $38
    db $dd
    rst $38
    ld [hl], a
    rst $38
    cp [hl]
    rst $38
    ld l, a
    rst $38
    jp c, $daff

    rst $38
    ld a, a
    rst $38
    ld [$bfff], a
    rst $38
    or $ff
    rst $38
    rst $38
    db $ed
    rst $38
    rst $38
    rst $38
    rst $28
    rst $38
    db $fd
    rst $38
    xor a
    rst $38
    push af
    rst $38
    rst $18
    rst $38
    rst $38
    rst $38
    or a
    rst $38
    cp $ff
    db $fd
    rst $38
    or a
    rst $38
    xor $ff
    ld a, e
    rst $38
    rst $18
    rst $38
    db $76
    rst $38
    db $fd
    rst $38
    xor [hl]
    rst $38
    or l
    rst $38
    jp c, $edff

    rst $38
    ld d, l
    rst $38
    cp d
    rst $38
    db $ed
    rst $38
    or d
    rst $38
    add b
    rst $38
    sub h
    rst $38
    xor b
    rst $38
    ld d, b
    rst $38
    ld c, b
    rst $38
    and b
    rst $38
    ld d, h
    rst $38
    nop
    rst $38
    dec bc
    db $f4
    rlca
    ld hl, sp+$16
    add sp, $07
    ld hl, sp+$17
    add sp, $0b
    db $f4
    dec h
    jp c, $ec13

    ld d, l
    xor d
    xor e
    nop
    push de
    nop
    ld l, l
    nop
    or [hl]
    nop
    jp c, Jump_004_6a00

    nop
    db $dd
    nop
    or l
    nop
    jp hl


    rla
    ld [hl], c
    rrca
    cp $01
    cp h
    inc bc
    rst $18
    ld bc, $01be
    ld a, [hl]
    ld bc, $01de
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
    rst $38
    rst $38
    ld e, a
    rst $38
    ccf
    rst $38
    ld sp, hl
    cp $fb
    db $fc
    pop af
    cp $fb
    db $fc
    rst $30
    ld hl, sp-$1d
    db $fc
    rst $30
    ld hl, sp-$19
    ld hl, sp-$2b
    nop
    or $00
    xor d
    nop
    db $ed
    nop
    or l
    nop
    push de
    nop
    ld l, d
    nop
    db $dd
    nop
    or a
    nop
    sub $01
    xor [hl]
    ld bc, $0057
    xor a
    nop
    ld d, [hl]
    ld bc, $00af
    xor a

Jump_004_6dff:
    nop
    ld b, h
    cp a
    add c

Jump_004_6e03:
    ld a, a
    ld b, d
    cp a
    nop
    rst $38
    ld d, a
    xor b
    xor l
    ld d, d
    ld a, a
    add b
    ld a, a
    add b
    or [hl]
    rst $38
    ld c, d
    rst $38
    inc h
    rst $38
    nop
    rst $38
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    ld d, a
    xor b
    rst $38
    rst $38
    xor e
    rst $38
    or l
    rst $38
    nop
    rst $38
    push de
    ld a, [hl+]
    rst $38
    nop
    rst $28
    nop
    rst $38
    nop
    or a
    rst $38
    ld e, l
    rst $38
    xor $ff
    dec d
    rst $38
    dec bc
    rst $38
    add c
    ld a, a
    ret nz

    ccf
    ldh [$1f], a
    rst $28
    rst $38
    cp l
    rst $38
    rst $30
    rst $38
    ld e, d
    rst $38
    ld l, l
    rst $38
    db $10
    rst $38
    adc c
    rst $38
    ld b, h
    rst $38
    push af
    rst $38
    sub b
    rst $38
    ld b, c
    cp $87
    ld hl, sp+$1f
    ldh [$1f], a
    ldh [$3e], a
    pop bc
    dec [hl]
    jp z, $fd02

    ld e, a
    and b
    rst $38
    nop
    rst $38
    nop
    push af
    ld a, [bc]
    jp nz, $943d

    ld l, e
    ld d, l
    xor d
    cp [hl]
    ld b, c
    rst $38
    nop
    rst $38
    nop
    ld a, [$0405]
    ei
    db $10
    rst $28
    ld b, b
    cp a
    dec h
    jp c, Jump_000_14eb

    ei
    inc b
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    ld a, l
    add d
    db $76
    adc c
    sbc e
    ld h, h
    ld d, h
    xor e
    db $dd
    nop
    sub $00
    db $ed
    nop
    sub $00
    ld [$da00], a
    nop
    ld [$f500], a
    nop
    ld a, a
    nop
    cp a
    nop
    ld l, a
    nop
    ei
    nop
    xor a
    nop
    or l
    nop
    rst $10
    nop
    ld e, d
    nop
    ld e, a
    rst $38
    rrca
    rst $38
    rra
    rst $38
    ld b, a
    cp a
    rst $20
    rra
    pop hl
    rra
    ld sp, hl
    rlca
    db $fd
    inc bc
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
    cp a
    rst $38
    rst $38
    rst $38
    and $f8
    rst $28
    ldh a, [$ce]
    ldh a, [$cf]
    ldh a, [$9f]
    ldh [rNR31], a
    ldh [$7d], a
    add b
    ld a, a
    add b
    db $eb
    nop
    xor l
    nop
    db $eb
    nop
    db $ed
    nop
    or [hl]
    nop
    push de
    nop
    jp c, Jump_004_6a00

    nop
    ld d, [hl]
    ld bc, $00af
    ld b, [hl]
    ld bc, $00af
    and a
    nop
    ld d, a
    nop
    adc e
    nop
    rst $10
    nop
    cp h
    ld b, e
    ld a, h
    add e
    push af
    ld a, [bc]
    ld a, b
    add a
    ld d, a
    xor b
    ld [hl], h

jr_004_6f0b:
    adc e
    ld e, e
    and h
    ld d, [hl]
    xor c
    xor d
    ld d, l
    inc d
    db $eb
    ld c, c
    or [hl]
    inc [hl]
    bit 3, [hl]
    and c
    or a
    ld c, b
    rst $18
    jr nz, @+$01

    nop
    rst $38
    nop
    add hl, bc
    or $54
    xor e
    dec bc
    db $f4
    rst $38
    nop
    rst $18
    jr nz, @+$01

    nop
    ld e, a
    nop
    ldh a, [rIF]
    jr z, jr_004_6f0b

    cp b
    ld b, a
    ld d, [hl]
    xor c
    sbc $21
    ld [$f215], a
    dec c
    and c
    ld e, [hl]
    or h
    rst $38
    ld d, [hl]
    rst $38
    db $ec
    rst $38
    jr nz, @+$01

    jr z, @+$01

    db $10
    rst $38
    xor h
    ld a, a
    ld [hl], $ff
    ld d, b
    xor a
    and l
    ld e, d
    db $d3
    inc l
    ld c, a
    or b
    ld d, l
    xor d
    and l
    ld e, d
    jp nc, $e42d

    dec de
    xor l
    ld d, d
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, d
    add b
    rst $38
    nop
    xor a

jr_004_6f6d:
    ld d, b
    xor c
    ld d, [hl]
    xor c
    ld d, [hl]
    sub $29
    push af
    ld a, [bc]
    rst $38
    nop
    ld a, a
    nop
    cp $01
    jp c, Jump_004_5525

    xor d
    ld d, b
    xor a
    sub b
    ld l, a
    ld d, b
    xor a
    xor d
    ld d, a
    ld b, b
    cp a
    add b
    ld a, a
    ld [$42f7], sp
    cp l
    push de
    nop
    ld l, d
    add b
    ld d, l
    add b
    ld l, d
    add b
    ld [hl], l
    add b
    ld l, c
    add b
    db $f4
    nop
    or l
    ld b, b
    ld l, e
    nop
    xor l
    nop
    ld d, [hl]
    nop
    or e
    nop
    ld d, [hl]
    nop
    ld d, l
    nop
    xor e
    nop
    ld d, [hl]
    nop
    ld a, h
    inc bc
    cp a

jr_004_6fb3:
    ld bc, $01fe
    ld e, d
    ld bc, $01be
    rst $18
    nop
    ld d, [hl]
    ld bc, $00bb
    rst $38
    rst $38
    rst $38
    rst $38
    rst $28
    rst $38
    ld a, a
    rst $38
    cpl
    rst $38
    ccf
    rst $38
    rra
    rst $38
    rrca
    rst $38
    cp $ff
    db $fc
    rst $38
    ld sp, hl
    cp $f9
    cp $fb
    db $fc
    di
    db $fc
    rst $38
    ld hl, sp-$0d
    db $fc
    cp $00
    rst $20
    jr jr_004_6fb3

    jr nc, jr_004_6f6d

    ld a, b
    adc [hl]
    ld [hl], b
    adc d
    ld [hl], b
    dec de
    ldh [$b5], a
    ld b, b
    push de
    nop
    ld e, d

jr_004_6ff3:
    nop
    push de
    nop
    xor d
    nop
    xor c
    nop
    xor d
    nop
    ld c, c
    nop
    dec h
    nop
    daa
    nop
    sub a
    nop
    ld b, e
    nop
    ld d, a
    nop
    ld b, a
    nop
    ld d, e
    nop
    ld c, e
    nop
    daa
    nop
    dec c
    ld a, [c]
    dec bc
    db $f4
    dec d
    ld [$6e91], a
    ld d, b
    xor a
    jr z, jr_004_6ff3

    inc [hl]
    rl d
    db $ed
    rst $30
    ld [$00ff], sp
    ld a, a
    add b
    ld c, d
    or l
    sub l
    ld l, d
    ld bc, $00fe
    rst $38
    nop
    rst $38
    db $fd
    ld [bc], a
    db $f4
    dec bc
    push de
    ld a, [hl+]
    xor d
    ld d, l
    ld d, b
    xor a
    rlca
    rst $38
    daa
    rst $18
    rrca
    rst $38
    ld d, b
    xor a
    add d
    ld a, l
    add hl, hl
    sub $aa

jr_004_7047:
    ld d, l
    inc l
    db $d3
    ld d, $e9
    adc h
    di
    inc b
    ei
    inc e
    rst $38
    inc l
    rst $38
    ld e, $ff
    ld a, [hl+]
    rst $38
    dec d
    rst $38
    ld a, [hl+]
    rst $38
    jr z, @+$01

    dec d
    rst $38
    ld h, d
    sbc l
    ld l, c

jr_004_7063:
    sub [hl]
    ld a, [hl+]
    push de
    jr nz, jr_004_7047

    ld [$00f7], sp

jr_004_706b:
    rst $38
    nop
    rst $38
    ld b, b
    rst $38
    inc h
    db $db
    ld d, d
    xor l
    nop
    rst $38
    nop
    rst $38
    jr nz, @+$01

    inc d
    rst $38
    ld a, [bc]
    rst $38
    ld bc, $94ff
    ld l, e
    jr nz, jr_004_7063

    db $10
    rst $38
    inc a
    rst $38
    ld a, h
    rst $38
    ld a, [hl-]
    rst $38
    adc c
    rst $38
    ld d, d
    rst $38
    inc b
    ei
    jr z, jr_004_706b

    ld [hl+], a
    db $dd
    ld de, $00ee
    rst $38
    ld bc, $60fe
    rst $38
    jr nz, @+$01

    cp d
    ld b, b
    cp c
    ld b, b
    dec a
    ret nz

    ld e, c
    and b
    sbc l
    ld h, b
    add hl, hl
    ret nc

    inc e
    ldh [$aa], a
    ld d, b
    xor l
    nop
    ld d, [hl]
    nop
    ld e, e
    nop
    ld d, l
    nop
    ld d, a
    nop
    ld e, d
    nop
    xor d
    nop
    xor d
    nop
    xor a
    nop
    rst $10
    nop
    ld e, e
    nop
    ld l, l
    nop
    ld e, e
    nop
    or [hl]
    nop
    db $db
    nop
    xor d
    nop
    adc a
    ld a, a
    add a
    ld a, a
    rst $00
    ccf
    rst $28
    rra
    rst $20
    rra
    rst $28
    rra
    push hl
    rra
    rst $20
    rra
    di
    db $fc
    di
    db $fc
    di
    db $fc
    di
    db $fc
    di
    db $fc
    di
    db $fc
    di
    db $fc
    ld a, [c]
    db $fc
    ld a, d
    add b
    db $ed
    nop
    push af
    nop
    jp c, $ad00

    nop
    ld d, l
    nop
    ld l, l
    nop
    or l
    nop
    xor d
    nop
    ld d, h
    nop
    ld a, [hl+]
    nop
    and l
    nop
    ld d, h

jr_004_7109:
    nop
    ld c, d
    nop
    ld d, h
    nop
    ld d, c
    nop
    sub e
    nop
    and a
    nop
    ld b, e
    nop
    dec hl
    nop
    sub a
    nop
    ld c, e
    nop
    and l
    nop
    dec de
    nop
    ld e, c
    and [hl]
    inc b
    ei
    ld d, d
    xor l
    ld c, b
    or a
    jr nz, jr_004_7109

    and b
    ld e, a
    ld d, b
    xor a
    xor b
    ld d, a
    nop
    rst $38
    dec b
    rst $38
    nop
    rst $38
    inc b

jr_004_7137:
    rst $38
    nop
    rst $38
    nop
    rst $38
    inc b
    rst $38
    jr nz, @+$01

    jr nz, @+$01

    ld d, b
    rst $38
    ld a, [bc]
    rst $38
    add b
    rst $38
    ld [bc], a
    rst $38
    nop
    rst $38
    ld [bc], a
    db $fd
    add hl, bc
    or $80
    rst $38
    nop
    rst $38
    db $10
    rst $28
    jr nz, jr_004_7137

    ld b, b
    cp a
    ld b, h
    cp a
    and b
    ld e, a
    ld h, d
    sbc l
    ld c, d
    rst $38
    inc d
    rst $38
    ld a, [hl+]
    rst $38
    sub h
    rst $38
    dec hl

jr_004_7169:
    rst $38
    ld e, l
    rst $38
    dec b
    rst $38
    ld b, h
    cp a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    inc d
    rst $38
    ld b, b
    rst $38
    nop
    rst $38
    ld bc, $3ffe
    ret nz

    ld a, [bc]
    rst $38
    add b
    ld a, a
    inc b
    rst $38
    ld b, b
    cp a
    jr nz, jr_004_7169

    ld b, c
    cp [hl]
    ld d, d
    xor l
    ld b, b
    cp a
    ld e, d
    rst $38
    ld d, l
    rst $38
    ld [bc], a
    rst $38
    ld de, $0aff
    rst $38
    inc d
    rst $38
    ld [bc], a
    rst $38
    ld bc, $80ff
    rst $38
    ld b, c
    cp $00
    rst $38
    ld d, c
    cp $01
    cp $a0
    rst $38
    ld b, c
    cp $00
    rst $38
    add hl, sp
    ret nz

    ld e, $e0
    xor e
    ld d, b
    dec a
    ret nz

    ld c, l
    or b
    cp [hl]
    ld b, b
    ld c, l
    or b
    cp l
    ld b, b
    ld l, l
    nop
    jp c, Jump_004_6d00

    nop
    or [hl]
    nop
    ld a, [$d500]
    nop
    cp d
    nop
    ld a, l
    nop
    ld c, l
    nop
    xor e
    nop
    ld d, l
    nop
    xor e
    nop
    xor l
    nop
    or l
    nop
    push de
    nop
    halt
    nop
    ld l, a
    rra
    rst $20
    rra
    ld l, a
    rra
    ld [hl], a
    rra
    ld l, a
    rra
    adc a
    ccf
    ld a, a
    rra
    rst $28
    rra
    rst $30
    ld hl, sp-$09
    ld hl, sp-$09
    ld hl, sp-$1b
    ld hl, sp-$19
    ld hl, sp-$1f
    cp $fc
    rst $38
    cp $ff
    xor d

Jump_004_7201:
    nop
    ld d, l
    nop
    ld l, h
    nop
    or [hl]
    nop
    cp l
    nop
    xor [hl]
    nop
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
    jr z, jr_004_721a

jr_004_721a:
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
    jr nz, jr_004_721a

    ld c, b
    xor a
    ld d, b
    ld e, l
    and b
    ld a, a

jr_004_7269:
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
    jr c, jr_004_7269

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

jr_004_73d9:
    ld a, d
    dec d
    ld [$748b], a
    ld d, l
    xor d
    ld a, l
    add b
    reti


    jr nz, jr_004_73d9

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
    jr nz, jr_004_7442

jr_004_7442:
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
    jr nz, jr_004_7600

jr_004_7600:
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
    jr nz, jr_004_7646

jr_004_7646:
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

Jump_004_76ff:
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
    jp c, Jump_004_6d00

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
    jr z, jr_004_77f2

jr_004_77f2:
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
    jr z, jr_004_7810

jr_004_7810:
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
    jr nz, jr_004_7830

jr_004_7830:
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
    jr z, jr_004_7844

jr_004_7844:
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
    jr nz, jr_004_786a

jr_004_786a:
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

jr_004_7886:
    rst $38
    nop
    rst $18
    jr nz, @+$01

    nop
    rst $18
    jr nz, jr_004_7886

    ld [$0051], sp
    call nc, Call_004_5500
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
    jr z, jr_004_7906

jr_004_7906:
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
    jr nz, jr_004_7922

jr_004_7922:
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

    INCBIN "gfx/image_004_7940.2bpp"

    INCBIN "gfx/image_004_7f40.2bpp"

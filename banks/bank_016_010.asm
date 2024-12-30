; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $010", ROMX[$4000], BANK[$10]

    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
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
    ld c, b
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
    rra
    jr nz, jr_010_4041

jr_010_4041:
    nop
    nop
    nop
    nop
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
    ret nz

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
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    jr jr_010_40d1

jr_010_40d1:
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld h, b
    ret nz

    dec c
    rlca
    ld b, $0c
    inc b
    inc c
    inc b
    rrca
    rlca
    rrca
    ld b, $0c
    ld a, [bc]
    inc c
    inc b
    inc c
    sbc b
    ldh a, [$d8]
    ldh a, [$58]
    ldh a, [$98]
    ldh a, [rNR23]
    or b
    jr jr_010_416c

    jr nc, @+$1b

    rrca
    rra
    ld a, h
    ret c

    ld a, h
    call c, $de7d
    ld d, d
    rst $18
    pop af
    db $db
    sub l
    reti


    ret nc

    sbc b
    db $10
    sbc b
    cpl
    ccf
    dec hl
    ld sp, $3121
    ld hl, $a931
    ld sp, $b1e1
    ldh [$f1], a
    ld h, c
    ld [hl], c
    db $f4
    rst $38
    db $76
    adc h
    ld c, $84
    dec b
    adc a
    inc b
    adc a
    add h
    adc h

jr_010_416c:
    ld b, h
    adc h
    add h
    adc a
    dec bc
    rst $20
    ld b, $0c
    ld c, b
    inc c
    IsThisTheOne:
    call Call_010_6ff8
    sbc e
    dec d
    ld a, [de]
    add hl, bc
    jr @+$41

    rst $08
    xor $c7
    ld b, [hl]
    inc c
    jr jr_010_4192

    ld a, c
    sbc b
    di
    rst $38
    push de
    ld a, d
    pop af
    ret c

    call $ff9f
    rst $18

jr_010_4192:
    db $dd
    ld b, $0e
    inc b
    xor $04
    adc $e4
    ld l, [hl]
    call nz, $c48f
    cp a
    sbc a
    rrca
    sbc a
    cp h
    ld sp, $2070
    jr nz, jr_010_4208

    ld b, b
    ld h, b
    ld b, c
    ld h, b
    inc sp
    ld h, c
    ccf
    cp a
    nop
    add b
    ret nz

    add b
    add b
    ret nz

    ld b, c
    ret nz

    add c
    ret nz

    ret nz

    add c
    ld bc, $8181
    ld bc, $66c7
    ld c, e
    and $ee
    rst $20
    or $ef
    xor c
    rst $38
    db $fd
    cp e
    sbc e
    cp c
    inc sp
    sbc c
    ld l, [hl]
    ld a, [hl]
    db $76
    jr jr_010_4206

    jr jr_010_4210

    ld de, $1931
    cp e
    ld de, $19b5
    db $fd
    cp $af
    ld a, l
    ld b, a
    pop hl
    add c
    pop bc
    db $dd
    add e
    cp a
    rst $38
    ld d, a
    xor a
    sbc a
    adc l
    rst $18
    ld sp, hl
    adc l
    add a
    add c
    add e
    add e
    add c
    inc bc
    add c
    add e
    add c
    inc bc
    add c
    dec de
    add c
    cp a
    rst $38
    di
    rst $20
    ld l, l
    adc [hl]
    adc h
    sbc h

Jump_010_4206:
jr_010_4206:
    inc e
    sbc b

jr_010_4208:
    inc a
    sbc b
    inc c
    sbc b
    ret z

    sbc h
    rst $20
    rst $28

jr_010_4210:
    ld [hl], a
    rst $28
    rst $18
    inc a
    ld a, $3c
    ld l, [hl]
    inc a
    ld a, [hl]
    ccf
    cpl
    ld a, a
    rst $30
    ld l, h
    adc $ec
    sbc h
    rst $08
    call c, $bc6c
    ld a, h
    ld l, l
    rst $38
    call z, $88ff
    call c, $fc4c
    jr z, jr_010_42af

    nop
    ldh [rP1], a
    nop
    nop
    nop
    ret nz

    ldh [$e0], a
    nop
    nop
    nop

Jump_010_423c:
    nop
    nop
    nop
    ret nz

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
    nop
    ld bc, $000e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_010_4263

jr_010_4263:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add sp, -$39
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$0007], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_42af:
    nop
    rrca
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
    ld [de], a
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
    add b
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
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    sbc a
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
    ldh [$03], a
    nop
    nop
    nop
    nop
    nop
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
    ld a, [hl-]
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
    ld h, b
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
    nop
    nop
    nop
    nop
    nop
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
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld h, d
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
    ld e, l
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
    add l
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
    ret c

    jr nz, jr_010_4421

jr_010_4421:
    nop
    nop
    nop
    nop
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
    ld [$0007], sp
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    inc bc
    nop
    and e
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
    xor b
    ld d, b
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
    nop
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    ret c

    pop af
    ld a, h
    pop af
    reti


    ld [hl], c
    db $dd
    pop af
    reti


    or c
    cp a
    ld de, $1f91
    adc a
    ld e, $7b
    pop hl
    jp hl


    pop af
    ld [hl], l
    ld sp, hl
    ld e, a
    ld sp, hl
    ld a, a
    db $ed
    cp a
    ld h, a
    db $d3
    ld h, a
    ld d, c
    ld h, e
    rst $38
    rst $38
    db $10
    rst $38
    ret nc

    add hl, de
    call nc, $d019
    add hl, de
    call nc, $d419
    add hl, de
    sbc h
    ld de, $f9fe
    jp $9783


    add d
    rst $30
    cp $dd
    rst $20
    add h
    add a
    rst $00
    add [hl]
    di
    rst $38
    rst $30
    db $e3
    rst $38
    ld b, $86
    inc c
    db $db
    inc l
    ei
    rst $38
    ld sp, hl
    ld a, $fa
    ld l, h
    rst $30
    rst $08
    rst $10
    rst $38
    db $dd
    ld c, $06
    inc c
    and h
    ld c, h
    sub $ec
    ld l, h
    call z, $cee5
    rst $38
    sbc a
    sbc [hl]

jr_010_4501:
    ccf
    dec l
    ld [hl], e
    pop de
    ld h, c
    ld h, e
    pop bc
    ld h, c
    pop bc
    ld h, c
    jp Jump_010_63d7


    cp a
    ld a, [hl]
    add c
    ld bc, $0183
    inc bc
    add c
    ld bc, $4383
    add e
    add [hl]
    inc bc
    ld b, $03
    inc bc
    ld b, $c8
    sbc l
    ret


    sbc h
    db $fc
    sbc h
    cp [hl]
    call c, $fcd6
    ld a, h
    or $e4
    db $76
    db $76
    ld h, a
    db $fc
    ld sp, hl
    ld a, e
    ld h, c
    ld h, e
    ld h, e
    ld h, [hl]
    ld h, e
    ld h, d
    ld h, a
    ld h, e
    ld h, [hl]
    ld [hl], e
    ld h, [hl]
    rst $38
    ei
    or $fb
    sub d
    add e
    add [hl]
    inc bc
    ld l, [hl]
    inc de
    cp $ff
    cp d

jr_010_454b:
    rst $18
    ld [hl], $1b
    ld a, [hl]
    di
    rrca
    rrca
    dec b
    inc bc
    inc bc
    inc bc
    ld bc, $0303
    inc bc
    inc bc
    inc bc
    ld de, $7703
    rst $38
    rst $08
    rst $20
    call z, Call_000_080e
    inc e
    inc e
    jr jr_010_4501

    jr jr_010_4583

    jr jr_010_4589

    jr jr_010_454b

    rst $28
    di
    rst $30
    rla
    ld a, [hl-]
    inc sp
    ld e, $1b
    ld e, $33
    rra
    dec de
    scf
    ld [hl], e
    ld [hl], $73
    and $f3
    db $e3
    ld a, e

jr_010_4583:
    inc sp
    inc sp
    dec de
    inc de
    dec sp
    ld a, e

jr_010_4589:
    di
    db $e3
    db $e3
    db $76
    di
    dec sp
    dec sp
    db $fc
    nop
    nop
    nop
    stop
    db $fc
    ld hl, sp-$80
    ld hl, sp+$00
    nop
    nop
    nop
    ret c

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
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
    nop
    nop
    nop
    nop
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
    nop
    jr nz, jr_010_463e

    nop
    nop
    nop
    nop
    nop
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

jr_010_463e:
    nop
    nop
    ld h, $43
    nop
    nop
    nop
    nop
    nop
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
    nop
    rst $00
    db $e3
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
    add $ff
    nop
    nop
    nop
    nop
    nop
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
    rst $00
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
    nop
    nop
    nop
    dec c
    dec de
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
    ld hl, sp-$08
    db $10
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    ld a, [hl-]
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
    ld [bc], a
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
    or c
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
    nop
    nop
    nop
    ld [$af00], sp
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
    rst $20
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
    db $e3
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
    jp $ff00


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
    ld b, e
    add c
    db $eb
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
    jr nc, jr_010_47cc

jr_010_47cc:
    db $fc
    cp $ff
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
    inc c
    rrca
    rra
    rrca
    inc de
    rrca
    rra
    rrca
    dec de
    dec c
    inc de
    dec c
    rra
    add hl, bc
    dec c
    nop
    ld [$b81d], a
    ld a, a
    ld l, l
    cp a
    db $fd
    ccf
    daa
    rst $38
    dec hl
    rst $38
    push bc
    ei
    and [hl]
    reti


    rst $38
    rst $38
    rst $30
    cp $6b
    or [hl]
    inc hl
    rst $38
    ld l, d
    or a
    inc bc
    cp $22
    rst $38
    ld l, a
    sub e
    db $fd
    sbc $bb
    inc d
    xor c
    ld sp, $edb3
    ccf
    rst $38
    rst $28
    scf
    and l
    ccf
    cp d
    db $fd
    rst $28
    rst $38
    sbc $a7
    ld b, c
    add [hl]
    sbc e
    ld h, [hl]
    ei
    or $1b
    or $2e
    rst $30
    rst $38
    rst $28
    inc a
    rst $38
    xor a
    db $76
    bit 4, d
    ld [hl], a
    jp nz, $c277

    ld [hl], e
    add $4c
    or $3f
    db $fc
    add a
    inc c
    adc l
    ld c, $8c
    rrca
    sbc h
    rrca
    sbc a
    rrca
    adc e
    rra
    rrca
    dec de
    rla
    dec de
    rst $28
    rst $18
    db $fc
    rst $00
    push af
    add $dd
    and $d5
    and $dd
    ld h, [hl]
    db $fd
    ld h, [hl]
    rst $28
    ccf
    ld [hl], a
    cp [hl]
    ld [$3830], a
    ld h, b
    ld e, l
    ld h, d
    rst $18
    ld a, a
    jp nc, $f77f

    ld b, [hl]
    ld l, l
    cp $b3
    jp $c0c1


    or c
    ret nz

    and c
    ret nz

    and c
    ret nz

    and c
    ret nz

    and c
    ret nz

    adc a
    rst $38
    db $eb
    rst $30
    and a
    add $e5
    adc [hl]
    and $8c
    adc [hl]
    call z, $8ced
    and a
    call z, $ffc6
    cp l
    ei
    sbc a
    dec de
    dec de
    rrca
    rra
    dec bc
    dec bc
    rra
    rra
    dec de
    scf
    dec de
    dec a
    di
    ld a, a
    pop af
    ccf
    add hl, de
    adc l
    dec de
    ld a, l
    dec de
    or l
    ei
    jp hl


    di
    ld a, l
    di
    db $dd
    dec sp
    ld b, b
    add b
    nop
    add b
    ld a, h
    add b
    cp $fc
    db $e4
    ld hl, sp-$40
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
    ld e, b
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
    ld c, l
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
    jr nz, jr_010_499a

    nop
    nop
    nop
    nop
    nop
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
    ld [de], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_499a:
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, d
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
    cp d
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
    nop
    nop
    nop
    nop
    rst $38
    rst $38
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
    rst $28
    di
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
    nop
    db $e3
    di
    ld h, e
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
    rra
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
    ld [$fafc], a
    db $fc
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    sbc l
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
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
    ld a, d
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
    xor d
    nop
    sbc h
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
    ld e, l
    inc hl
    ei
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
    dec c
    inc bc
    or a
    rst $08
    call z, Call_000_00ff
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
    ldh [$dc], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc c
    rra
    rrca
    rra
    rrca
    ld a, [de]
    rrca
    inc de
    rrca
    ld e, $0f
    ld e, $0f
    rrca
    nop
    dec bc
    rst $38
    ld a, [$eeff]
    rst $38
    ei
    rst $38
    ld [$eeff], a
    rst $38
    xor e
    rst $38
    sbc a
    ld h, e
    ld a, $ff
    ld e, h
    db $eb
    scf
    ret z

    sub b
    rst $38
    cp $ff
    or d
    rst $38
    db $ec
    rst $38
    ld e, a
    db $ed
    jp c, $a4ff

    rst $38
    inc a
    rst $20
    sbc [hl]
    push hl
    or a
    db $ec
    ld c, e
    db $fc
    cp e
    db $fc
    db $fd
    ld hl, sp+$4b
    ld a, a
    ld sp, hl
    ld a, a
    db $dd
    ld a, e
    ld sp, hl
    ld a, a
    ld a, c
    rst $38
    ld [hl], c
    rst $38
    add hl, hl
    rst $38
    daa
    rst $38
    or h
    rst $38
    ld a, h
    and e
    or h
    ld h, e

jr_010_4be6:
    jp nc, $de6f

    ld a, a
    or $7f
    jp c, $f86f

    rst $38
    ld e, l
    cp [hl]
    cp $09
    ld a, a
    adc c
    rst $38
    add hl, bc
    db $dd
    dec bc
    cp l
    ld c, e
    rst $18
    add hl, bc
    ld a, c
    rst $38
    jp z, $daff

    adc a
    ld l, d
    adc a
    ld [$eb0f], a
    rrca
    ei
    rrca
    cpl
    db $db
    sbc d
    ei
    ld [hl], a
    db $ec
    xor a
    ld a, h
    rst $20
    inc a
    and a
    ld a, a
    rst $30
    rst $28
    rst $38
    call z, $fcce
    ld l, e
    db $fc
    add b
    nop
    add b
    nop
    jr c, jr_010_4be6

    add sp, -$40
    sub b
    ret nz

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

Call_010_4c7f:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    adc d
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
    rst $18
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
    nop
    nop
    nop
    nop
    ld [hl], a
    cp e
    ld [hl-], a
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
    db $fc
    rst $38
    ld a, [hl]
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
    cp $f3
    ei
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
    db $f4
    ccf
    add a
    ccf
    ld bc, $0007
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
    ld hl, sp-$40
    adc b
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
    cp h
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
    ld a, l
    inc bc
    ld e, a
    rst $38
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
    jr nc, jr_010_4eab

    rst $28
    ldh a, [$9e]
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

jr_010_4eab:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld c, $07
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
    rlca
    nop
    ld l, a
    rst $38
    adc l
    rst $38
    add a
    rst $38
    dec l
    rst $38
    or e
    rst $38
    sbc e
    rst $38
    pop de
    rst $38
    sbc c
    rst $30
    sub b
    rst $38
    ld b, b
    cp a
    ld d, e
    cp l
    nop
    rst $38
    ld l, c
    rst $38
    ld [bc], a
    rst $38
    xor l
    rst $38
    or h
    rst $38
    xor $d0
    db $76
    ret z

    ld b, c
    cp $2e
    pop af
    cp l
    ldh [$3e], a
    ret nz

    xor $d0
    sub [hl]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc [hl]
    rst $38
    ld a, d
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
    nop
    nop
    ld b, e
    db $fc
    ldh [$7f], a
    ld l, a
    jr nc, jr_010_5067

jr_010_5067:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_010_5098:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    ld a, a
    inc a
    ld d, c
    inc l
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
    ld b, b
    nop
    ccf
    ret nz

    ld a, b
    add l
    nop
    nop
    nop
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
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rrca
    jr jr_010_5273

    ld d, h
    ccf
    ld b, d
    inc a
    dec de
    nop
    db $10
    rrca
    db $10
    rrca
    ld a, [de]
    rrca
    db $76
    add c
    ld e, l

jr_010_5273:
    and e
    db $dd
    inc hl
    call nc, Call_010_712b
    rrca
    cp b
    rrca
    ld a, c
    adc a
    ld [hl], a
    adc b
    ld [hl], e
    adc [hl]
    ld h, e
    sbc [hl]
    ld h, d
    sbc a
    ld b, [hl]
    cp e
    db $76
    sbc e
    ld h, l
    sbc e
    ld b, l
    cp d
    rst $10
    jr z, jr_010_5300

    sub b
    push af
    dec bc
    inc c
    rst $38
    inc d
    rst $28
    ldh a, [$8f]
    db $dd
    xor a
    ld b, h
    cp a
    sbc $00
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

jr_010_5300:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_537c:
    nop
    nop
    nop
    nop
    inc l
    rra
    ld a, a
    inc a
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
    rst $08
    jr nz, jr_010_537c

    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc bc
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
    nop
    nop
    ld l, b
    add b
    ld a, [hl]
    add c
    cp a
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
    cp a
    ret nz

    rst $30
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
    adc b
    nop
    ld a, a
    jr jr_010_54a1

jr_010_54a1:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    halt
    nop
    or c
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
    nop
    nop
    nop
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
    rlca
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

jr_010_5568:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    dec [hl]
    dec sp
    ccf
    add hl, sp
    ld b, e
    cp l
    rst $38
    add b
    ld d, [hl]
    nop
    rra
    jr c, jr_010_55dc

    add hl, sp
    dec de
    dec a
    ld l, a
    sub h
    ld a, [$ba34]
    ld [hl], h
    cp $30
    cp $00
    sbc $00
    rst $38
    add b
    rst $18
    jr nc, jr_010_5568

    ld [$0ef5], sp
    ld [hl], l
    adc [hl]
    rla
    xor $7d
    and $ee
    or $e5
    cp $53
    db $ec

jr_010_55c0:
    ld a, e
    ld [hl], h
    scf
    ld a, b
    jr c, jr_010_5639

    scf
    ld a, b
    ccf
    ld [hl], b
    ld [hl], $78
    ccf
    ld [hl], c
    daa
    ret c

    rra
    ld h, d
    rst $18
    ld [hl], $7f
    or [hl]
    ld e, a
    or [hl]
    rst $18
    ld [hl], $9f
    db $76

jr_010_55dc:
    sbc a
    or $5c
    and e
    rst $28
    adc $7d
    adc $3c
    rst $08
    cp h
    ld c, a
    db $fd
    rrca
    ret c

    cpl
    ld b, c
    xor [hl]
    ld [hl], a
    and b
    cp a
    ld h, b
    ld c, a
    jr nc, jr_010_5645

    or a
    sbc c
    rst $30
    db $d3
    db $fc
    jp c, $8bf5

    push af
    rst $18
    jr nz, jr_010_55c0

    ret nc

    ld a, a
    adc h
    adc l
    ld a, a
    push bc
    ld a, e
    pop af
    rrca
    ld e, l
    xor a
    db $ed
    ccf
    adc $11
    call c, $9733
    ld a, [hl]
    ld a, e
    or $67
    cp $43
    cp $77
    rst $18
    ld [hl], e
    db $dd
    cp l
    ld d, b
    add b
    nop
    add b
    nop
    add b
    add b
    nop
    add b
    add b
    nop
    add b
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

jr_010_5639:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_5645:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
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
    cp c
    cp $80
    and b
    nop
    nop

jr_010_56b7:
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
    jr nc, jr_010_56b7

    nop
    nop
    nop
    nop
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
    ld [$0080], sp
    nop
    nop
    nop
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
    nop
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
    nop
    ld [c], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    jr nz, jr_010_57bc

jr_010_57bc:
    ld l, [hl]
    sub b
    ld hl, sp+$04
    nop
    nop
    nop
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
    nop
    ld d, [hl]
    jp hl


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_010_57de

jr_010_57de:
    xor a
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
    ld [bc], a
    nop
    inc [hl]
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
    db $fd
    ld [hl+], a
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_5897:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_58bf:
    nop
    nop

jr_010_58c1:
    nop
    nop

jr_010_58c3:
    nop
    ld bc, $0602
    inc bc
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    rla
    add hl, de
    ld de, $511f
    rra
    xor h
    ld d, e
    rst $30
    ld [$180e], sp
    inc de
    dec e
    dec e
    dec de
    and e
    db $dd
    ld a, e
    adc l
    reti


    rrca
    ld c, d
    sbc l
    call nc, $da2b
    dec h
    and d

jr_010_58ed:
    db $dd
    ld a, e
    adc h
    ccf

jr_010_58f1:
    ret nz

    add $01
    jp $0004


    add a
    jp Jump_010_4206


    add a
    rst $20
    ld b, $f9
    ld c, $2e
    ret nc

    ld h, b
    jr c, jr_010_58c1

    jr nc, jr_010_58bf

    jr nc, jr_010_58ed

    jr c, jr_010_58c3

    jr nc, jr_010_58f1

    jr c, jr_010_5897

    rst $30
    cpl
    ld [hl], h
    add hl, hl
    ld [hl], b
    ld l, b
    jr nc, @+$28

    ld a, b
    ld h, l
    ld a, [hl-]
    ld l, e
    inc [hl]
    ld h, e
    inc a
    ld c, a
    or b
    sub $39
    db $fd
    ld b, $bf
    ld b, [hl]
    inc e
    rst $20
    sub a
    ld l, [hl]
    push af
    ld l, $f4
    ld l, a
    inc bc
    db $fc
    xor a
    db $76
    rst $30
    ld l, [hl]
    ld a, a
    ld h, [hl]
    db $ec
    ld [hl], a
    ld b, b
    rst $38
    ld b, h
    ei

jr_010_593c:
    add $f9
    ld hl, $8fdf
    ld b, $8d
    ld c, $9e
    inc c
    sbc [hl]
    inc c

jr_010_5948:
    rst $08
    inc c
    rlca
    adc h
    ld c, e
    add h

jr_010_594e:
    ld b, a

jr_010_594f:
    add b
    ld e, d
    cp l
    pop af
    ld c, $dc
    ld l, $4c
    ld a, a
    ld h, h
    ld a, a
    ld h, h
    ld a, a
    ld a, h
    rst $28
    rst $28
    jr jr_010_5948

    ld e, [hl]
    ei
    inc b
    dec h
    jr jr_010_594e

    jr jr_010_593c

    xor h
    xor l
    jp c, $9a7d

    rst $30
    ld [$71ae], sp
    ld h, l
    adc [hl]
    inc l
    rst $08
    jr c, jr_010_594f

    sbc d
    ld h, l
    ld b, a
    rst $28
    db $f4
    rst $08
    jp c, $f735

    add hl, bc
    scf
    db $db
    db $db
    rst $38
    jp c, $daff

    rst $38
    reti


    rst $38
    db $dd
    ei
    scf
    reti


    inc [hl]
    srl b
    rst $18
    ld sp, hl
    ld e, a
    jr @+$01

    sbc e
    db $fc
    sbc c
    rst $38
    adc l
    ei
    ld a, d
    add c
    add b
    nop
    nop
    add b
    add b
    add b
    ld b, b
    add b
    add b
    nop
    ret nz

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    db $e4
    dec de
    cp h
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
    jp nc, $840c

    nop
    nop
    nop
    nop
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
    inc b
    jr jr_010_5a14

jr_010_5a14:
    nop
    nop
    nop
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
    xor c
    ld d, b
    jr nz, jr_010_5a34

jr_010_5a34:
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    jp nz, RST_00

    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc de
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
    inc c
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
    nop
    dec e
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
    nop
    nop
    nop
    jp nz, Jump_000_0001

    nop
    nop
    nop
    nop
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
    jr c, jr_010_5b61

jr_010_5b61:
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

jr_010_5bcd:
    nop
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
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_5be7:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_010_5bf0

jr_010_5bf0:
    nop
    nop
    nop
    nop
    nop
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

jr_010_5c1f:
    nop
    ld [hl], $01
    ld bc, $2201
    ld bc, $3f39
    jr c, jr_010_5c31

    nop
    ld bc, $0100
    ld a, $01
    inc b

jr_010_5c31:
    sbc a
    jr nc, jr_010_5bcd

    jr nz, jr_010_5be7

    ld [$28b1], sp
    sbc a
    sub l
    adc a
    inc hl
    sbc h
    ret nz

    cp c
    db $e4
    sbc a
    ld e, b
    or b
    nop
    ldh a, [$60]
    or b
    ret nz

    or b
    ld c, b
    or b
    call nc, Call_010_5098

jr_010_5c4f:
    adc a
    ld de, $24cf
    jp Jump_010_6391


    db $10
    ld h, e
    ld b, b
    inc sp
    ld de, $b263
    ld h, e
    jr jr_010_5c4f

    ld h, b
    jp $0380


    add c
    inc bc
    add b
    inc bc
    add b
    inc bc
    add e
    ld bc, $01a2
    nop
    rst $38
    add b
    ld a, [hl]
    and b
    rlca
    add b
    inc bc
    ld a, b
    add e
    ld hl, $18ff
    rst $20
    ld h, c
    or e
    jr nz, jr_010_5c1f

    ld hl, $75fe
    jr jr_010_5ca5

    add hl, de
    inc [hl]
    sbc c
    xor c
    add hl, de
    ld sp, $3399
    sbc c
    jp nz, $e4ff

    adc $89
    xor $9b
    xor $28
    rst $38
    ld e, b
    rst $38
    ld [bc], a
    rst $38
    ld c, [hl]
    cp e
    inc h
    sbc e
    ld [bc], a
    rlca
    dec c
    ld b, $0c

jr_010_5ca5:
    ld b, $0d
    ld b, $0c
    ld b, $81
    ld b, $84
    inc bc
    add d
    ld bc, $e75c
    adc a
    ld sp, $1923
    dec h

jr_010_5cb7:
    add hl, de
    rla
    add hl, de
    dec [hl]
    add hl, de
    sub e
    dec a
    ld b, h
    rst $38
    jr c, @+$01

    ld l, $c1
    ld b, d
    add c
    ld a, h
    add c
    nop
    rst $38
    ld c, [hl]
    cp c
    ld [hl], c
    adc l
    jr jr_010_5cb7

    ldh [$3f], a
    db $fd
    ld [bc], a
    ld b, h
    add e
    inc a
    jp $ff82


    adc [hl]
    di
    adc [hl]
    di
    ld [hl], c
    adc a
    nop
    rst $38
    dec bc
    inc e
    ld e, d
    inc c
    adc c
    db $fc
    ld h, d
    sbc h
    sbc e
    inc c
    adc d
    inc e
    add c
    db $fc
    ld b, $fc
    sbc [hl]
    db $ec
    rst $28
    call z, $cdff
    db $ed
    rst $08
    cp d
    rst $08
    db $ec
    rst $08
    add hl, hl
    adc $6d
    ld a, b
    ld c, d

Jump_010_5d03:
    db $fc
    ret z

    db $fc
    xor d
    db $fc
    ld l, d
    db $fc
    dec hl
    db $fc
    jr nz, jr_010_5d8d

    inc l
    ld [hl], e
    ld de, $f5fe
    cp $cd
    cp $c5
    cp $d9
    and $ed
    add $af
    add $09
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, $3e3f
    nop
    nop
    nop
    nop
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
    jr nz, jr_010_5d53

jr_010_5d53:
    nop
    nop
    nop
    nop
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
    nop
    ld c, l
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
    ld sp, $00cf
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_5d8d:
    nop
    nop
    nop
    sub c
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
    ld a, d
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
    nop
    nop
    nop
    nop
    sbc b
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
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
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
    and e
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
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    and h
    jr jr_010_5ec1

jr_010_5ec1:
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    and d
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
    nop
    nop
    sub d
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
    dec d
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

jr_010_5f78:
    nop
    nop

jr_010_5f7a:
    nop

jr_010_5f7b:
    nop
    nop
    nop
    nop
    add b
    ld b, $03
    nop
    nop
    ld bc, $0300
    inc bc
    ld [bc], a
    ld bc, $0000
    nop
    nop
    ld [bc], a
    inc bc
    add hl, sp
    di
    ld [hl+], a
    scf
    dec e
    ld [hl], $ff
    or $37
    di
    add hl, de
    inc sp
    dec de
    scf
    and h
    cp $ff
    rst $20
    rst $38
    inc l
    ld l, b
    inc a
    ld l, b
    inc a
    ld hl, sp-$14
    cp $ec
    db $fd
    ld h, $77
    inc hl
    rst $08
    rst $20
    or a
    ld h, c
    ld sp, $3931
    ld de, $1931
    add hl, sp
    ld de, $315f
    rst $38
    rst $20
    jp $e1e1


    add c
    inc bc
    add c
    add c
    add c
    ld bc, $8381
    add c
    ld e, c
    add c
    rst $38
    rst $38
    cp $3c
    daa
    add [hl]
    add d
    inc bc
    add hl, sp
    jp $fdff


    dec sp
    push hl
    ld l, e
    or c
    rra
    cp a
    db $fc
    ld a, [hl]
    ld [hl], h
    jr jr_010_5ff5

    jr jr_010_5f78

    jr jr_010_5f7a

    jr jr_010_5f7b

    add hl, de
    pop af
    add hl, de
    db $fd
    ld a, a
    ld l, h
    add $ee
    add $c7

jr_010_5ff5:
    xor $ef
    xor $ba
    rst $28
    cp l
    cp e
    add hl, de
    cp e
    inc sp
    sbc c
    inc bc
    ld bc, $0306
    ld b, $02
    ld [bc], a
    ld b, $07
    ld [bc], a
    ld [bc], a
    inc bc
    add c
    inc bc
    add c
    ld bc, $f3e1
    sbc e
    jr c, jr_010_6031

    ld [$0c08], sp
    inc b
    inc c
    inc b
    inc c
    sbc e
    inc c
    rst $30
    ld sp, hl
    rst $38
    rst $30
    ld d, [hl]
    ldh [$e0], a
    ld b, b
    rst $28
    ld b, b
    rst $28
    ld c, a
    db $ed
    ld b, [hl]
    push hl
    ld b, [hl]
    ei
    di
    rst $08

jr_010_6031:
    rst $00
    call nz, Call_000_3060
    ld h, b
    ld l, a
    jr nc, @-$3f

    rst $38
    rst $10
    inc a

jr_010_603c:
    ld l, h
    ld [hl], $77
    db $e3
    ret c

    adc a
    ld h, b
    ret nz

    ret nz

    ld h, b
    ld l, $7f
    cp h
    db $e3
    jr nz, jr_010_603c

    jr nc, jr_010_60ae

    ldh a, [$ef]
    rst $38
    rst $38
    ld a, [$c3c7]
    add $e3
    add $c3
    add $63
    add $63
    add $c3
    add $f0
    ld hl, sp-$27
    jr nc, jr_010_607e

    ld sp, $331b
    ld a, [hl-]

jr_010_6069:
    scf
    rra
    ld a, $1e
    inc a
    inc e
    jr c, jr_010_6069

    ld a, h
    ld hl, sp-$04
    add sp, -$04
    ld l, h
    db $fc
    db $ec
    ld a, h
    db $76
    ld l, h
    ld a, b
    ld h, [hl]

jr_010_607e:
    ld [hl], a
    ld h, e
    ccf
    ld a, a
    add hl, sp
    ld a, l
    jr c, @+$7f

    dec h
    ld a, a
    ld hl, $6077
    ld [hl], c
    ldh a, [$61]
    ret nz

    pop hl
    add b
    ret nz

    ret nz

    add b
    add b
    ret nz

    add b
    ret nz

    add b
    ret nz

    add b
    ret nz

    add b
    ret nz

    add b
    ret nz

    ld bc, $0003
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_60ae:
    nop
    nop
    ld d, h
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
    ld h, a
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
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    nop
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
    ld a, [hl]
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
    jr jr_010_6113

    nop

jr_010_6113:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    inc hl
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
    ld b, l
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
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_010_6182

jr_010_6182:
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_010_6193

jr_010_6193:
    nop
    nop
    nop
    nop
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

Jump_010_61d3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    ld [hl+], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and $03
    nop
    nop
    nop
    nop
    nop
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
    dec b
    nop
    sbc a
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
    ld a, [$00c5]
    nop
    nop
    nop
    nop
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
    ld de, $001a
    nop
    nop
    nop
    nop
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
    jr nc, jr_010_62de

jr_010_62de:
    db $fc
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $f9
    adc a
    dec de
    dec bc
    ld e, $7b
    cp $9f
    ld a, e
    dec e
    dec bc
    ld a, [hl-]
    rrca
    pop af
    cp $df
    rst $28
    ld e, c
    rst $38
    or l
    ld a, b
    call c, $d470
    ld hl, sp-$22
    ld hl, sp-$32
    ld a, l
    rra
    ld h, a
    rst $18
    ld a, $cc
    cp [hl]
    xor d
    call z, $cc6a
    add sp, $4c
    ld l, d
    call z, $ddae
    ld e, a
    cp a
    rra
    scf
    dec de
    inc [hl]
    jr jr_010_6366

    dec sp
    inc d
    rra
    ccf
    inc [hl]
    rra
    ld a, a
    sub [hl]
    rst $38
    di
    rst $38
    sbc a
    and h
    rst $18
    ld h, h
    add $d5
    ld h, [hl]
    ld d, [hl]
    db $e4
    push af
    ld h, [hl]
    push de
    ld l, [hl]
    rst $18
    rst $38
    and [hl]
    ld [hl], e
    dec hl
    ld [hl], a
    dec sp
    ld [hl], a
    ld a, a
    ld [hl], a
    ld d, a
    ld a, a
    rst $38
    ld e, l
    rst $28
    ld e, l
    ld [$03cd], a
    ld bc, $0383
    rlca
    ld [bc], a

jr_010_6366:
    add a
    ld [bc], a
    rst $00
    ld [bc], a
    ld [bc], a
    add e
    pop bc
    add e
    add c
    add c
    ei
    di
    rst $10
    jr c, jr_010_6381

    jr jr_010_637f

    inc c
    adc [hl]
    inc c
    adc b
    inc c
    dec bc
    sbc h
    db $fd

jr_010_637f:
    ei
    rst $30

jr_010_6381:
    rst $38
    db $f4
    ret nz

    ld b, b
    ret nz

    ld h, l
    jp z, $cf5f

    ld l, [hl]
    call $c66d
    db $eb
    rst $30
    adc a

Jump_010_6391:
    rst $08
    db $ec
    ret nz

    ret nz

    ld h, b
    dec hl
    ld [hl], h
    cp a
    rst $38
    ld l, [hl]
    cp l
    ld l, [hl]
    inc a
    rst $30
    rst $20
    jp c, $e08d

    ret nz

    call nz, Call_010_7f60
    ld l, a
    cp c
    rst $20
    ld [hl], b
    and b
    jr nc, jr_010_640e

    ld [c], a
    db $ed
    rst $18
    rst $38
    ld a, e
    jp $c361


    db $e3
    jp $c3e3


    db $e3
    ld b, e
    ld [c], a
    ld b, e
    db $e3
    jp $f8ec


    adc h
    jr jr_010_63d1

    jr jr_010_63e3

    ld [$190d], sp
    dec c
    dec de
    ld e, $0f
    inc c
    ld e, $1e

jr_010_63d1:
    dec sp
    ld a, e
    dec sp
    ei
    ld a, e
    db $eb

Jump_010_63d7:
    db $db
    reti


    sbc e
    add hl, de
    sbc e
    ld a, [de]
    add hl, de
    ld [$0d19], sp
    ld b, $04

jr_010_63e3:
    rlca
    inc c
    rlca
    dec c
    ld b, $86
    ld b, $8c
    ld b, $86
    adc h
    adc h
    db $fc
    add sp, -$24
    sbc b
    adc h
    ret z

    adc h
    call c, $f8ec
    ld a, h
    inc l
    inc c
    inc c
    inc c
    inc c
    inc c
    nop
    nop

jr_010_6402:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_640e:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    db $d3
    jr nz, jr_010_6453

jr_010_6453:
    nop
    nop
    nop
    nop
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
    nop
    nop
    jr nz, jr_010_6402

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sub e
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
    sub e
    ld h, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, $00c3
    nop
    nop
    nop
    nop
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
    rst $08
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
    nop
    nop
    nop
    add c
    jp nz, RST_00

    nop
    nop
    nop
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
    ld [$1018], sp
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    db $eb
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
    ld a, [hl]
    add hl, sp
    nop
    nop
    nop
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
    ei
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
    ld bc, $7f00
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
    ld [bc], a
    add a
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
    pop hl
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
    ld b, $1f
    rst $18
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
    inc bc
    inc bc
    inc bc
    nop
    nop
    nop
    ld bc, $0303
    nop
    nop
    nop
    inc bc
    nop
    ld bc, $8803
    rst $38
    ld a, [hl-]
    rst $38
    scf
    xor $ef
    cp $be
    rst $38
    sbc d
    ld a, a
    ld h, e
    rst $38
    jp z, $e9a5

    sbc [hl]
    db $dd
    cp $ca
    ld a, h
    db $eb
    inc a
    ld a, b
    xor [hl]
    dec de
    db $ec
    call z, $bfff
    rst $18
    call c, Call_010_4c7f
    ld [hl], a
    ld d, d
    ld h, a
    ld e, a
    ld [hl], d
    ld a, [hl]
    ld a, a
    ld [hl], e
    ld a, [hl]
    ld d, d
    rst $38
    xor $df
    db $e4
    rst $38
    sbc $ed
    ld a, l
    rst $08
    ld a, l
    rst $08
    ld l, a
    rst $18
    ld l, e
    rst $18
    ld c, a
    ei
    or $fb
    and e
    pop bc
    or c
    jp $c3b2


    ld a, [c]
    jp $c3f2


    ld [hl], c
    jp Jump_010_61d3


    ret c

    ld h, c
    rst $28
    rst $30
    ld sp, hl
    scf
    or a
    add hl, de
    sub a
    add hl, de
    rst $08
    add hl, de
    rst $08
    add hl, de
    ld [hl], a
    sbc c
    rst $38
    rst $30
    rst $18
    cp $72
    add a
    jp Jump_010_5d03


    and e
    cp l
    ld a, a
    ld [hl], a
    cp l
    rst $18
    ld sp, $ff9f
    ei
    ld a, h
    rst $08
    inc c
    rst $00
    ld b, $3a
    rst $00
    rst $38
    cp $cb
    cp $7f
    ld [c], a
    cp a
    ld a, [hl]
    ld l, e
    sbc a
    ld a, [de]
    inc c
    jp c, $f90c

    db $fc
    ld a, [hl+]
    db $fc
    adc d
    inc c
    adc d
    inc c
    ld a, [$fb0c]
    rst $38
    ld [hl], e
    ld h, e
    ld l, d
    ld h, e
    ld h, e
    ld h, e
    ld d, e
    ld h, e
    ld d, e
    ld h, e
    ld d, e
    ld h, e
    db $d3
    ld h, e
    ld b, a
    ld c, $9f
    ld c, $9f
    ld e, $53
    ld a, $eb
    ld [hl], $fb
    ld h, [hl]
    di
    add $83
    add $e1
    pop bc
    db $d3
    pop bc
    pop hl
    pop bc
    ld [hl], c
    pop bc
    ld h, c
    pop bc
    ld d, c
    pop hl
    di
    ld h, c
    cpl
    ld [hl], e
    cp e
    di
    or e
    db $e3
    xor e
    di
    di
    cp a
    cp a
    sbc a
    rst $08
    add e
    ld b, c
    add e
    ld bc, $0083
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
    nop
    nop
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
    nop
    nop
    nop
    nop
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
    dec b
    ld [c], a
    nop
    nop
    nop
    nop
    nop
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
    cp a
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
    cp $f8
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
    ld d, c
    ld h, e
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
    ld b, e
    add [hl]
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
    cp a
    ccf
    rlca
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
    add c
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
    ld d, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [$0005]
    nop
    nop
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
    adc h
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
    ld c, $f0
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
    nop
    nop
    db $fd
    nop
    xor $f1
    nop
    nop
    nop
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
    and c
    cp a
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
    ld c, $10
    rst $38
    inc a
    ld l, a
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
    inc bc
    ld [bc], a
    ld bc, $0001
    ld bc, $0203
    ld bc, $0001
    ld [bc], a
    ld bc, $0102
    ld [$fff7], sp
    rst $38
    and [hl]
    rst $38
    or a
    rst $38
    cp $ff
    db $fd
    rst $38
    ei
    cp a
    and h
    dec de
    cp a
    ld a, a
    ld c, [hl]
    rst $38
    ld l, d
    rst $38
    ld e, [hl]
    rst $38
    ld a, d
    rst $38
    ld a, d
    rst $38
    ld a, [$dbff]
    rst $38
    ld h, e
    db $fd
    di
    db $fd
    ldh a, [rIE]
    di
    rst $38
    ld a, [c]
    rst $38
    or l
    rst $38
    or c
    rst $38
    sub d
    db $fd
    db $dd
    rst $38
    add sp, $7f
    xor c
    ld a, [hl]
    jr z, @+$01

    inc hl
    rst $38
    add hl, sp
    rst $28
    ld sp, hl
    rst $28
    db $dd
    rst $38
    sbc $ff
    jp z, $2677

    ld a, e
    jr nz, @+$01

    rst $38
    rst $38
    cp l
    rst $38
    ld [hl], d
    rst $38
    adc $ff
    ccf
    rst $18
    ld a, l
    sub e
    dec a
    db $d3
    ld sp, hl
    rst $30
    ld a, l
    di
    push af
    dec de
    cp $13
    dec a
    db $d3
    xor a
    pop af
    rst $28
    inc sp
    rst $28
    inc sp
    xor $37
    push hl
    ld a, $ee

jr_010_6a6b:
    dec a
    rst $38
    jr c, jr_010_6a6b

    add hl, sp
    cp a
    pop hl
    cp a
    pop hl
    xor a
    pop af
    rst $38
    and c
    rst $28
    or c
    rst $28
    or c
    db $fd
    or e
    pop de
    cp a
    ld d, [hl]
    db $ec
    ld [hl], a
    call z, $ec5f
    ld a, a
    db $fc
    ld a, a
    cp h
    ld h, a
    sbc h
    rst $28
    inc b
    xor a
    inc b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $30
    adc $04
    nop
    nop
    nop
    nop
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
    di
    ld [de], a
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
    rst $38
    jr nc, jr_010_6bb4

    nop
    nop
    nop
    nop
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
    sbc a
    ld a, a
    adc [hl]
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
    rst $08
    inc b
    ld c, a
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
    nop
    ret nz

    nop
    nop
    nop

jr_010_6bb4:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
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
    inc bc
    rst $18
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
    inc b
    ld bc, $ff15
    sub d
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
    ld [$20f0], sp
    ret c

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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0001
    nop
    ld bc, $0001
    ld bc, $0100
    nop
    ld bc, $3f00
    rst $18
    ld l, [hl]
    rst $38

jr_010_6d84:
    ld a, a
    rst $38
    rst $38
    rst $38
    rst $28
    rst $38
    rst $38
    rst $38
    dec [hl]
    rst $38
    jp $f73f


    rst $38
    ld e, d
    rst $38
    db $dd
    rst $38
    sbc $ff
    cp [hl]
    rst $38
    jp hl


    rst $38
    jr c, @+$01

    ld l, b
    rst $38
    inc de
    cp $52
    rst $38
    ld [de], a
    rst $38
    dec bc
    rst $38
    ld c, c
    rst $38
    nop
    rst $38
    ld l, c
    sbc $6f
    call c, $a8d0
    inc a
    ret nz

    add sp, -$70
    jr nc, @-$36

    ld e, h
    and b
    jr nc, jr_010_6d84

    ld e, h
    and b
    ld l, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp c, Jump_000_0f2f

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    daa
    call c, Call_000_1c46
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
    inc a
    ret nz

    ld a, b
    add b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0103
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
    or l
    ldh [$5e], a
    rst $20
    ccf
    ld [c], a
    nop
    nop
    nop
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
    ret nc

    xor e
    ld b, l
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_010_6ff8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0102
    nop
    inc bc
    ld [bc], a
    ld bc, $0102
    nop
    inc bc

jr_010_70cc:
    ld [bc], a
    ld bc, $0300
    dec e
    ld [c], a
    adc c
    or $27
    ld a, [$e699]
    add hl, de
    and $97
    ld [$ee31], a
    ld e, $e3
    ld a, [hl]
    add l
    add h
    ld a, a
    add l
    ld a, a
    call z, $cb33
    inc [hl]
    jp Jump_010_423c


    ccf

jr_010_70ee:
    ld b, a
    jr c, jr_010_70ee

    ld a, [de]
    ld [hl], $d9
    sub e
    rst $38
    inc sp
    rst $38
    or b
    ld a, a
    add hl, sp
    rst $30
    dec d
    ld a, [$903f]
    and b
    ld b, b
    ret nz

    nop
    and b
    ret nz

    ld h, b
    ret nz

    and b
    ret nz

    jr nz, jr_010_70cc

    ldh [rP1], a
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

Call_010_712b:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0102
    nop
    nop
    nop
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
    pop hl
    inc d
    pop hl
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
    ld e, [hl]
    jr nz, jr_010_7253

    nop
    nop
    nop
    nop
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

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_7253:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr c, jr_010_7354

    ld a, b
    ld [hl], h
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
    ld [$be47], a
    ld c, a
    nop
    nop
    nop
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
    adc $bf
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
    nop
    nop
    nop
    sub e
    inc c
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
    nop
    nop
    nop
    ld e, b
    nop
    sub a
    add hl, sp
    nop
    nop
    nop
    nop
    nop
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
    adc l
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop

jr_010_7354:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld [hl], b
    ld [hl], a
    ld a, e
    ld a, a
    ld [hl], e
    ld [hl], l
    ld a, d
    db $fd
    ld [hl], b
    ld a, [hl]
    ld [hl], c
    db $fc
    ld [hl], c
    ld a, b
    ld [hl], c
    rst $38
    ld c, $ae
    ld c, a
    rst $38
    ld c, $bf
    ld c, [hl]
    rst $38
    ld c, [hl]
    xor a
    sbc $3f
    adc $3d
    adc $8d
    ld e, [hl]
    or [hl]
    ld c, [hl]
    ld h, a
    adc [hl]
    ccf
    add $72
    add [hl]
    dec e
    jp nz, $c02b

    xor [hl]
    ret nz

    cp $00
    db $dd
    xor $5c
    xor $5d
    xor $df
    db $ec
    ld e, l
    xor $ff
    db $ec
    db $dd
    xor $fb
    ld [hl], c
    ld h, a
    rst $30
    rst $38
    rst $20
    ret nc

    cpl
    sub a
    ld l, b
    ei
    db $e4
    rst $08
    db $fc
    ld d, $e9
    ld a, a
    add c
    sbc l
    dec sp
    cp [hl]
    dec sp
    adc $3b
    ld a, a
    adc d
    adc $3b
    call $bffa
    ld d, b
    ld l, [hl]
    adc a
    rst $38
    ld c, $5c
    rst $28
    db $ed
    cp $ed
    cp $de
    db $fd
    db $fc
    rst $18
    ld l, [hl]
    dec e
    sub [hl]
    db $ed
    db $d3
    xor l
    dec hl
    rst $38
    ld l, e
    cp a
    ld l, a
    cp b
    xor a
    ld a, d
    sub b
    ld l, a
    ccf
    pop bc
    ld h, $c9
    ld e, h
    jp hl


    ld l, e
    cp $77
    cp $67
    cp $66
    rst $38
    inc d
    db $eb
    xor e
    nop
    ldh [rLCDC], a
    and b
    ld b, b
    nop
    ret nz

    and b
    ret nz

    and b
    ld b, b
    add b
    ld b, b
    ldh [rP1], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld [hl], b
    ld [$0070], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $01
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
    db $eb
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
    inc de
    db $ec
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
    nop
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
    nop
    or c
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    xor l
    ret nc

    db $fd
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
    add d
    nop
    ld b, d
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
    and b
    ld b, b
    ld [hl], c
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
    ret nc

    nop
    adc a
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
    dec a
    nop
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
    nop
    nop
    nop
    nop
    ld [$d300], sp
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
    cpl
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
    and a
    nop
    nop
    nop
    nop
    nop
    nop
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
    add hl, sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_76ff:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

jr_010_7723:
    ld bc, $0101
    ld bc, $0101
    ld bc, $0103
    ld bc, $0301
    ld bc, $c12f
    ld l, b
    adc a
    db $eb
    sbc l
    dec h
    db $db
    ld d, l
    xor e
    jr nz, jr_010_76ff

    ld h, d
    add c
    ld h, e
    add b
    rst $00
    ld b, $c7
    ld b, $c7
    ld b, $c7
    ld b, $cf
    ld b, $4d
    add [hl]
    ld c, l
    adc [hl]
    ld l, e
    sbc h
    jr nz, jr_010_7723

    ld [hl], b
    ret


    ld a, h
    pop bc
    ld a, d
    push bc
    sbc [hl]
    pop hl
    rst $30
    ret nz

jr_010_775c:
    di
    ret nz

    di
    ret nz

    cp d
    push bc
    and l
    adc $a5
    adc $ad
    add $ad
    add $ac
    rst $00
    xor l
    ld b, [hl]
    rst $28
    ld b, $ed
    db $10
    ld a, h
    jr nc, jr_010_77f2

    jr nc, jr_010_77f4

    ld [hl-], a
    ld h, a
    jr c, jr_010_77e3

    jr nc, jr_010_77f9

    jr nc, jr_010_775c

    jr nc, jr_010_77c0

    ld [hl], b
    ld l, c
    ld [hl], b
    ldh a, [$61]
    adc $71
    ld b, a
    ld hl, sp-$12
    rst $10
    rst $30
    adc $92
    ld l, l
    ld a, h
    db $e3
    pop de
    pop hl
    pop hl
    pop bc
    cp a
    pop bc
    xor $31
    ccf
    call $9d7b
    daa
    db $db
    push hl
    ld e, $af
    call c, $dcba
    call c, $9cb8
    ld hl, sp-$70
    db $fd
    and a
    reti


    cp $01
    ld h, e
    add e
    db $e3
    inc bc
    db $d3
    db $e3
    rst $00
    db $e3
    jp $e3e7


    rst $00
    and [hl]
    rst $00
    add $07

jr_010_77c0:
    or l
    cp $7a
    or a
    ld l, a
    or a
    db $eb
    scf
    sub [hl]
    ld l, a
    inc hl
    rst $18
    ld c, $fb
    ld l, l
    jp c, $33fd

    xor l
    ld [hl], e
    ld [hl], e
    rst $20
    ld a, d
    rst $20
    ld h, [hl]
    ld sp, hl
    ld b, [hl]
    db $fd
    add hl, bc
    rst $38
    cp d
    ld b, a
    xor [hl]
    ld [hl], c
    rst $28

jr_010_77e3:
    inc sp
    or [hl]
    ccf
    or a
    ld a, $37
    ld a, $b7
    ld a, $d0
    ccf
    rst $38
    nop
    ld [hl], l
    sbc e

jr_010_77f2:
    rst $20
    add hl, de

jr_010_77f4:
    ld h, b
    rst $38
    or $6f
    rst $20

jr_010_77f9:
    ld a, c
    ld h, l
    ei
    db $76
    reti


    rst $38
    db $10
    jr nc, @-$3e

    ld b, b
    add b
    nop
    add b
    ld [hl], b
    add b
    ld b, b
    add b
    nop
    add b
    ld b, b
    add b
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
    ld h, c
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
    ld a, [hl-]
    ld b, h
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
    ldh [$c0], a
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
    db $ed
    ld [bc], a
    jr nz, jr_010_7884

jr_010_7884:
    nop
    nop
    nop
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
    db $10
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
    ld d, [hl]
    adc b
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr c, jr_010_796e

jr_010_796e:
    ld b, [hl]
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
    nop
    ret z

    jr nc, jr_010_7991

jr_010_7991:
    nop
    nop
    nop
    nop
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
    nop
    nop
    ld a, [$0007]
    nop
    nop
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
    ld a, [bc]
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
    nop
    ld [hl+], a
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
    nop
    cpl
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
    ld b, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    sub c
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

jr_010_7a55:
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_7a5b:
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld [hl+], a
    ld [hl], b
    inc hl
    ld d, d
    inc hl
    ld a, c
    ld h, $4a
    inc a
    db $10
    ld h, b

jr_010_7a8c:
    nop
    ld h, b
    db $10
    ld h, b
    and c
    ld b, b
    jr nz, jr_010_7a55

    ldh [rSTAT], a
    and b
    ld b, c
    jr nz, jr_010_7a5b

    and d
    ld b, c
    add b
    ld h, e
    ld [$4077], sp
    cp b
    ld c, b
    cp h
    ld b, b
    cp [hl]
    ld c, c
    or [hl]
    ld [$08b3], sp
    or c
    adc c
    jr nc, @+$0a

    jr nc, jr_010_7af1

    ccf
    jr nz, jr_010_7ae5

    jr z, jr_010_7ae7

    jr nz, jr_010_7ae9

    xor c
    jr nc, jr_010_7a8c

    or b
    nop
    pop af
    add hl, hl
    ld [hl], b
    and h
    rst $38
    ld d, c
    add [hl]
    ld b, l
    add [hl]
    ld b, d
    add a
    call nz, $0587
    add $04
    add $00
    rst $00
    db $e4
    inc de
    inc b
    rlca
    dec l
    ld b, $08
    cp $ba
    ld c, a
    ld a, [bc]
    dec c
    ld [bc], a
    inc c
    ld hl, sp+$07
    ld b, $f3
    inc d
    rlca
    inc b

jr_010_7ae5:
    ld c, $f1

jr_010_7ae7:
    ld c, $0a

jr_010_7ae9:
    rst $38
    xor d
    ld a, l
    jp nz, $187c

    rst $20
    ld d, b

jr_010_7af1:
    cp a
    ld [hl+], a
    rlca
    nop
    rlca
    ld a, [c]
    rlca
    ld a, [bc]
    rst $30
    ret nz

    ld [hl], a
    jp nz, $1877

    rst $28
    ld [$f1df], sp
    inc e
    jr nz, @+$3a

    ld l, b
    jr nc, jr_010_7b69

    jr nc, jr_010_7b74

    jr nc, jr_010_7b58

    ld sp, $cf30
    nop
    ret nz

    and c
    ld b, b
    ld b, b
    pop hl
    add c
    pop hl
    add c
    pop hl
    and e
    pop bc
    ld bc, $41c3
    add e
    adc h
    rst $28
    sbc c
    xor $99
    cp $99
    cp $55
    cp $04
    rst $38
    ld [hl+], a
    rst $38
    ld b, h
    cp e
    add a
    ld sp, hl
    ld l, e
    ld [hl], a
    ld d, d
    ld h, a
    ld a, [hl]
    ld h, a
    ld a, l
    ld h, a
    ld c, l
    db $76
    call $8076
    rst $38
    ld a, [bc]
    db $fc
    ld a, [hl+]
    sbc h
    ld [$fa1c], sp
    inc c
    ld [$eafc], sp
    ld a, h
    ld c, e
    db $fc
    ld [$43ff], sp
    db $fc
    ld h, a
    dec sp
    inc sp
    dec sp
    ld a, a
    inc sp

jr_010_7b58:
    ld [hl-], a
    ccf
    ld a, $33
    db $e4
    dec sp
    ld bc, $86fe
    rst $38
    ld [hl+], a
    rst $18
    dec bc
    sbc [hl]
    sbc d
    rra
    sbc d

jr_010_7b69:
    rra
    cp d
    rra
    ld [hl], a
    cp [hl]
    adc h
    ld [hl], a
    ld d, d
    cp l
    sbc h
    ld a, b

jr_010_7b74:
    sbc h
    ld a, b
    ld d, b
    rst $38
    dec de
    db $fc
    inc d
    ld hl, sp-$2c
    jr c, jr_010_7bdf

    rra
    ld b, b
    add b
    nop
    nop
    nop
    nop
    nop
    add b
    add b
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
    ld b, b
    jr nz, jr_010_7ba3

jr_010_7ba3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $183e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$1030], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nc, jr_010_7bd3

jr_010_7bd3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_7bdf:
    nop
    ld b, h
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
    nop
    ld b, $f1
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
    nop
    nop
    nop
    nop
    ld e, a
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
    call $0002
    nop
    nop
    nop
    nop
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
    or e
    nop
    nop
    nop
    nop
    nop
    nop
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


    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_010_7d80

    ld c, a
    ld d, d
    ld d, d
    ld c, c
    ld d, e
    jr nz, jr_010_7d5a

    jr nz, @+$22

    inc b
    jr nz, jr_010_7d5f

    jr nz, jr_010_7d61

    jr nz, jr_010_7d95

    ld d, l
    ld d, h
    ld c, b
    jr nz, jr_010_7d8a

    ld b, c
    ld c, e
    ld b, l
    ld d, d
    jr nz, jr_010_7d6e

    jr nz, @+$22

    jr nz, jr_010_7d52

jr_010_7d52:
    jr nz, jr_010_7d74

    ld c, h
    ld c, c
    ld c, [hl]
    ld b, h
    ld d, e
    ld b, c

jr_010_7d5a:
    ld e, c
    jr nz, jr_010_7da8

    ld b, l
    ld d, d

jr_010_7d5f:
    ld c, [hl]
    ld c, a

jr_010_7d61:
    ld c, b
    ld b, c
    ld c, [hl]
    jr nz, jr_010_7d86

    nop
    jr nz, @+$22

    jr nz, jr_010_7db6

    ld b, c
    ld d, d
    ld b, l

jr_010_7d6e:
    ld c, [hl]
    jr nz, @+$4d

    ld b, l
    ld d, d
    ld c, [hl]

jr_010_7d74:
    ld c, a
    ld c, b
    ld b, c
    ld c, [hl]
    jr nz, jr_010_7d9a

    jr nz, jr_010_7d7c

jr_010_7d7c:
    jr nz, jr_010_7d9e

    jr nz, jr_010_7da0

jr_010_7d80:
    jr nz, jr_010_7dd4

    ld c, a
    ld c, [hl]
    jr nz, jr_010_7dc7

jr_010_7d86:
    ld c, [hl]
    ld b, h
    jr nz, @+$4d

jr_010_7d8a:
    ld b, c
    ld b, [hl]
    jr nz, jr_010_7dae

    jr nz, jr_010_7db0

    inc b
    jr nz, @+$22

    jr nz, jr_010_7db5

jr_010_7d95:
    jr nz, @+$55

    ld d, l
    ld c, [hl]
    ld c, [hl]

jr_010_7d9a:
    ld e, c
    jr nz, @+$4f

    ld c, a

jr_010_7d9e:
    ld c, h
    ld c, h

jr_010_7da0:
    ld e, c
    jr nz, jr_010_7dc3

    jr nz, jr_010_7dc5

    inc b
    jr nz, jr_010_7dc8

jr_010_7da8:
    jr nz, jr_010_7dfe

    ld b, l
    ld d, e
    ld d, e
    ld b, c

jr_010_7dae:
    jr nz, jr_010_7df1

jr_010_7db0:
    ld c, [hl]
    ld b, h
    jr nz, jr_010_7e07

    ld c, c

jr_010_7db5:
    ld c, l

jr_010_7db6:
    ld c, a
    ld c, [hl]
    jr nz, jr_010_7dda

    inc b
    jr nz, jr_010_7ddd

    jr nz, jr_010_7ddf

    jr nz, jr_010_7de1

    jr nz, jr_010_7de3

jr_010_7dc3:
    ld c, e
    ld b, c

jr_010_7dc5:
    ld d, h
    ld c, c

jr_010_7dc7:
    ld b, l

jr_010_7dc8:
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_010_7dd4

    nop
    nop
    nop
    nop

jr_010_7dd4:
    jr nz, jr_010_7df6

    ld b, c
    jr nz, jr_010_7e29

    ld d, l

jr_010_7dda:
    ld c, e
    ld c, e
    ld b, c

jr_010_7ddd:
    jr nz, @+$49

jr_010_7ddf:
    ld b, c
    ld c, l

jr_010_7de1:
    ld b, l
    ld d, e

jr_010_7de3:
    jr nz, jr_010_7e31

    ld b, l
    jr nz, jr_010_7e08

    nop
    jr nz, jr_010_7e0b

    jr nz, @+$22

    jr nz, jr_010_7e0f

    jr nz, @+$22

jr_010_7df1:
    inc bc
    jr nz, jr_010_7e14

    jr nz, jr_010_7e16

jr_010_7df6:
    jr nz, jr_010_7e18

    jr nz, jr_010_7e1a

    jr nz, jr_010_7e1c

    jr nz, jr_010_7dfe

jr_010_7dfe:
    jr nz, jr_010_7e20

    ld b, a
    ld d, l
    ld d, e
    ld d, h
    ld b, c
    ld d, d
    ld c, c

jr_010_7e07:
    ld b, c

jr_010_7e08:
    jr nz, @+$46

    ld b, c

jr_010_7e0b:
    ld d, d
    jr nz, jr_010_7e5a

    ld b, c

jr_010_7e0f:
    ld d, e
    jr nz, jr_010_7e32

    nop
    nop

jr_010_7e14:
    jr nz, jr_010_7e36

jr_010_7e16:
    jr nz, jr_010_7e5f

jr_010_7e18:
    ld d, d
    ld b, c

jr_010_7e1a:
    ld b, e
    ld c, c

jr_010_7e1c:
    ld b, c
    ld d, e
    jr nz, jr_010_7e61

jr_010_7e20:
    jr nz, jr_010_7e76

    ld c, a
    ld b, h
    ld c, a
    jr nz, jr_010_7e47

    jr nz, jr_010_7e29

jr_010_7e29:
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    ld b, l

jr_010_7e31:
    ld c, h

jr_010_7e32:
    jr nz, jr_010_7e81

    ld d, l
    ld c, [hl]

jr_010_7e36:
    ld b, h
    ld c, a
    ld a, [bc]
    jr nz, @+$22

    jr nz, jr_010_7e5d

    jr nz, jr_010_7e3f

jr_010_7e3f:
    nop
    nop
    jr nz, jr_010_7e63

    jr nz, jr_010_7e65

    jr nz, jr_010_7e67

jr_010_7e47:
    jr nz, jr_010_7e69

    jr nz, jr_010_7e6b

    jr nz, @+$22

    jr nz, @+$05

    jr nz, jr_010_7e71

    jr nz, jr_010_7e73

    jr nz, jr_010_7e75

    nop
    jr nz, jr_010_7e78

    jr nz, jr_010_7e7a

jr_010_7e5a:
    jr nz, jr_010_7eac

    ld b, l

jr_010_7e5d:
    ld d, d
    ld c, a

jr_010_7e5f:
    jr nz, @+$55

jr_010_7e61:
    ld b, l
    ld d, d

jr_010_7e63:
    ld c, c
    ld b, c

jr_010_7e65:
    jr nz, jr_010_7e87

jr_010_7e67:
    jr nz, jr_010_7e89

jr_010_7e69:
    jr nz, jr_010_7e6b

jr_010_7e6b:
    nop
    jr nz, jr_010_7e8e

    jr nz, jr_010_7e90

    ld c, c

jr_010_7e71:
    ld c, [hl]
    ld d, h

jr_010_7e73:
    ld b, l
    ld d, d

jr_010_7e75:
    ld c, l

jr_010_7e76:
    ld c, c
    ld c, [hl]

jr_010_7e78:
    ld b, c
    ld b, d

jr_010_7e7a:
    ld c, h
    ld b, l
    jr nz, @+$22

    jr nz, jr_010_7ea0

    nop

jr_010_7e81:
    nop
    nop
    nop
    nop
    nop
    nop

jr_010_7e87:
    nop
    nop

jr_010_7e89:
    nop
    nop
    nop
    nop
    nop

jr_010_7e8e:
    nop
    nop

jr_010_7e90:
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

jr_010_7ea0:
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

jr_010_7eac:
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

Call_010_7f60:
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

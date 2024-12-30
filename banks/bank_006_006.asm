; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

    ld hl, $c000
    dec [hl]
    jr z, jr_006_4009

    jp Jump_006_40dd


jr_006_4009:
    ld a, [$c062]
    ld [hl], a
    inc l
    dec [hl]
    jr z, jr_006_4014

    jp Jump_006_40dd


jr_006_4014:
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    ld a, [de]
    cp $ff
    jr nz, jr_006_4028

    inc l
    inc de
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld d, a
    ld a, b
    ld e, a
    jr jr_006_4034

jr_006_4028:
    cp $00
    jr nz, jr_006_404b

    ld hl, $c005
    ld e, [hl]
    inc l
    ld d, [hl]
    dec l
    dec l

jr_006_4034:
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, $4a0b
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, $c003

jr_006_404b:
    dec l
    dec l
    ld [hl+], a
    inc de
    ld a, [de]
    cp $ff
    jr nz, jr_006_405b

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Jump_006_40dd


jr_006_405b:
    cp $fe
    jr nz, jr_006_406f

    ld a, [$c008]
    ldh [rNR12], a
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld a, $80
    ldh [rNR14], a
    jp Jump_006_40dd


jr_006_406f:
    cp $fd
    jr nz, jr_006_4084

    ld a, $01
    ld [$c009], a
    ld a, [$c007]
    ldh [rNR12], a
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Jump_006_40dd


jr_006_4084:
    inc de
    ld b, a
    ld a, [$c004]
    add b
    ld [$c016], a
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, $4b0b
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld [$c00a], a
    inc de
    ld a, [de]
    ld [$c007], a
    inc de
    ld a, [de]
    ld [$c008], a
    inc de
    ld hl, $c00e
    xor a
    ld [hl+], a
    ld [hl], a
    inc a
    ld [$c009], a
    ld [$c00b], a
    ld [$c010], a
    ld [$c013], a
    ld hl, $c011
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, $c00c
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, $c014
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    jp Jump_006_4185


Jump_006_40dd:
    ld hl, $c009
    ld a, [hl]
    cp $00
    jr z, jr_006_40f0

    xor a
    ld [hl], a
    ld a, [$c007]
    ldh [rNR12], a
    ld a, $80
    ldh [rNR14], a

jr_006_40f0:
    inc l
    ld a, [hl+]
    ldh [rNR11], a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, jr_006_4109

    inc hl
    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_4109

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

jr_006_4109:
    ld [de], a
    ld a, l
    ld d, h
    ld b, [hl]
    inc hl
    ld e, [hl]
    ld hl, $c00c
    ld [hl+], a
    ld [hl], d
    inc l
    ld a, b
    add [hl]
    ld [hl+], a
    ld a, e
    adc [hl]
    ld [hl+], a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, jr_006_412f

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_412f

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

jr_006_412f:
    ld [de], a
    ld a, l
    ld d, h
    ld c, [hl]
    ld hl, $c011
    ld [hl+], a
    ld [hl], d
    inc l
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, jr_006_414d

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_414d

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

jr_006_414d:
    ld [de], a
    ld a, l
    ld d, h
    ld e, [hl]
    ld hl, $c014
    ld [hl+], a
    ld [hl], d
    inc l
    ld b, e
    ld a, b
    cp $00
    jr nz, jr_006_4162

    ld d, $00
    ld e, d
    jr jr_006_4174

jr_006_4162:
    ld a, [hl]
    add c
    ld e, a
    ld d, $00
    ld hl, $4881
    add hl, de
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, b
    cp $02
    jr nz, jr_006_417d

jr_006_4174:
    ld hl, $c00e
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl]
    adc d
    ld d, a

jr_006_417d:
    ld a, d
    and $07
    ldh [rNR14], a
    ld a, e
    ldh [rNR13], a

Jump_006_4185:
    ld a, [$c05f]
    cp $17
    jr nz, jr_006_419a

    ld hl, $c056
    dec [hl]
    jr z, jr_006_4196

    inc l
    jp Jump_006_42ae


jr_006_4196:
    ld a, $04
    jr jr_006_41a7

jr_006_419a:
    ld hl, $c017
    dec [hl]
    jr z, jr_006_41a4

    inc l
    jp Jump_006_42ae


jr_006_41a4:
    ld a, [$c062]

jr_006_41a7:
    ld [hl], a
    inc l
    dec [hl]
    jr z, jr_006_41af

    jp Jump_006_42ae


jr_006_41af:
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    ld a, [de]
    cp $ff
    jr nz, jr_006_41c4

    inc l
    inc de
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld d, a
    ld a, b
    ld e, a
    jp Jump_006_41fa


jr_006_41c4:
    cp $00
    jr nz, jr_006_4211

    ld a, [$c05f]
    cp $17
    jr nz, jr_006_41f3

    inc de
    inc de
    ld a, [de]
    cp $00
    jr z, jr_006_41e3

    ld hl, $c059
    ld [hl-], a
    ld c, a
    dec de
    ld a, [de]
    ld [hl-], a
    ld e, a
    ld d, c
    ld a, [de]
    jr jr_006_4213

jr_006_41e3:
    ld a, $ff
    ld [$c061], a
    ld a, $01
    ld [$c01e], a
    ld [$c01f], a
    jp Jump_006_42ae


jr_006_41f3:
    inc l
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    dec l
    dec l

Jump_006_41fa:
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, $4a0b
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, $c01a

jr_006_4211:
    dec l
    dec l

jr_006_4213:
    ld [hl+], a
    inc de
    ld a, [de]
    cp $ff
    jr nz, jr_006_4221

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Jump_006_42ae


jr_006_4221:
    cp $fe
    jr nz, jr_006_4235

    ld a, [$c01f]
    ldh [rNR22], a
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld a, $80
    ldh [rNR24], a
    jp Jump_006_42ae


jr_006_4235:
    cp $fd
    jr nz, jr_006_424a

    ld a, $01
    ld [$c020], a
    ld a, [$c01e]
    ldh [rNR22], a
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Jump_006_42ae


jr_006_424a:
    inc de
    ld b, a
    ld a, [$c05f]
    cp $17
    jr nz, jr_006_4257

    xor a
    jp Jump_006_425a


jr_006_4257:
    ld a, [$c01b]

Jump_006_425a:
    add b
    ld [$c02d], a
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, $4b0b
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld [$c021], a
    inc de
    ld a, [de]
    ld [$c01e], a
    inc de
    ld a, [de]
    ld [$c01f], a
    inc de
    ld hl, $c025
    xor a
    ld [hl+], a
    ld [hl], a
    inc a
    ld [$c022], a
    ld [$c027], a
    ld [$c02a], a
    ld [$c020], a
    ld hl, $c028
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, $c023
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, $c02b
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    jp Jump_006_4356


Jump_006_42ae:
    ld hl, $c020
    ld a, [hl]
    cp $00
    jr z, jr_006_42c1

    xor a
    ld [hl], a
    ld a, [$c01e]
    ldh [rNR22], a
    ld a, $80
    ldh [rNR24], a

jr_006_42c1:
    inc l
    ld a, [hl+]
    ldh [rNR21], a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, jr_006_42da

    inc hl
    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_42da

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

jr_006_42da:
    ld [de], a
    ld a, l
    ld d, h
    ld b, [hl]
    inc hl
    ld c, [hl]
    ld hl, $c023
    ld [hl+], a
    ld [hl], d
    inc l
    ld a, b
    add [hl]
    ld [hl+], a
    ld a, c
    adc [hl]
    ld [hl+], a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, jr_006_4300

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_4300

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

Call_006_4300:
jr_006_4300:
    ld [de], a
    ld a, l
    ld d, h
    ld c, [hl]
    ld hl, $c028
    ld [hl+], a
    ld [hl], d
    inc l
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, jr_006_431e

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_431e

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

jr_006_431e:
    ld [de], a
    ld a, l
    ld d, h
    ld e, [hl]
    ld hl, $c02b
    ld [hl+], a
    ld [hl], d
    inc l
    ld b, e
    ld a, b
    cp $00
    jr nz, jr_006_4333

    ld d, $00
    ld e, d
    jr jr_006_4345

jr_006_4333:
    ld a, [hl]
    add c
    ld e, a
    ld d, $00
    ld hl, $4881
    add hl, de
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, b
    cp $02
    jr nz, jr_006_434e

jr_006_4345:
    ld hl, $c025
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl]
    adc d
    ld d, a

jr_006_434e:
    ld a, d
    and $07
    ldh [rNR24], a
    ld a, e
    ldh [rNR23], a

Jump_006_4356:
    ld hl, $c02e
    dec [hl]
    jr z, jr_006_435f

    jp Jump_006_442b


jr_006_435f:
    ld a, [$c062]
    ld [hl], a
    inc l
    dec [hl]
    jr z, jr_006_436a

    jp Jump_006_442b


jr_006_436a:
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    ld a, [de]
    cp $ff
    jr nz, jr_006_437f

    inc l
    inc de
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld d, a
    ld a, b
    ld e, a
    jp Jump_006_438b


jr_006_437f:
    cp $00
    jr nz, jr_006_43a2

    ld hl, $c033
    ld e, [hl]
    inc l
    ld d, [hl]
    dec l
    dec l

Jump_006_438b:
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, $4a0b
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, $c031

jr_006_43a2:
    dec l
    dec l
    ld [hl+], a
    inc de
    ld a, [de]
    cp $ff
    jr nz, jr_006_43b2

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Jump_006_442b


jr_006_43b2:
    cp $fe
    jr nz, jr_006_43cd

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld a, $01
    ld [$c035], a
    ld hl, $c036
    ld de, $c038
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_006_442b


jr_006_43cd:
    inc de
    ld b, a
    ld a, [$c032]
    add b
    ld [$c045], a
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, $4b0b
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, $01
    ld [$c035], a
    ld hl, $c036
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld hl, $c03d
    xor a
    ld [hl+], a
    ld [hl], a
    inc a
    ld [$c03a], a
    ld [$c03f], a
    ld [$c042], a
    ld [$c035], a
    ld hl, $c040
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, $c03b
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, $c043
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    jp Jump_006_44ed


Jump_006_442b:
    ld hl, $c035
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, jr_006_4442

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_4442

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

jr_006_4442:
    ld [de], a
    ld a, l
    ld d, h
    ld e, [hl]
    ld hl, $c036
    ld [hl+], a
    ld [hl], d
    inc l
    ld a, e
    ldh [rNR32], a
    ld hl, $c03a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, jr_006_4467

    inc hl
    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_4467

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

jr_006_4467:
    ld [de], a
    ld a, l
    ld d, h
    ld b, [hl]
    inc hl
    ld c, [hl]
    ld hl, $c03b
    ld [hl+], a
    ld [hl], d
    inc l
    ld a, b
    add [hl]
    ld [hl+], a
    ld a, c
    adc [hl]
    ld [hl+], a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, jr_006_448d

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_448d

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

jr_006_448d:
    ld [de], a
    ld a, l
    ld d, h
    ld c, [hl]
    ld hl, $c040
    ld [hl+], a
    ld [hl], d
    inc l
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, jr_006_44ab

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_44ab

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

jr_006_44ab:
    ld [de], a
    ld a, l
    ld d, h
    ld e, [hl]
    ld hl, $c043
    ld [hl+], a
    ld [hl], d
    inc l
    ld b, e
    ld a, b
    cp $00
    jr nz, jr_006_44c0

    ld d, $00
    ld e, d
    jr jr_006_44d2

jr_006_44c0:
    ld a, [hl]
    add c
    ld e, a
    ld d, $00
    ld hl, $4881
    add hl, de
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, b
    cp $02
    jr nz, jr_006_44db

jr_006_44d2:
    ld hl, $c03d
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl]
    adc d
    ld d, a

jr_006_44db:
    ld a, d
    and $07
    ldh [rNR34], a
    ld [$c068], a
    ld a, e
    ldh [rNR33], a
    ld [$c067], a
    ld a, $10
    ldh [rNR31], a

Jump_006_44ed:
    ld a, [$c05f]
    cp $46
    jr nz, jr_006_4501

    ld hl, $c056
    dec [hl]
    jr z, jr_006_44fd

    jp Jump_006_45fa


jr_006_44fd:
    ld a, $04
    jr jr_006_450d

jr_006_4501:
    ld hl, $c046
    dec [hl]
    jr z, jr_006_450a

    jp Jump_006_45fa


jr_006_450a:
    ld a, [$c062]

jr_006_450d:
    ld [hl], a
    inc l
    dec [hl]
    jr z, jr_006_4515

    jp Jump_006_45fa


jr_006_4515:
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    ld a, [de]
    cp $ff
    jr nz, jr_006_452a

    inc l
    inc de
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld d, a
    ld a, b
    ld e, a
    jp Jump_006_4560


jr_006_452a:
    cp $00
    jr nz, jr_006_4577

    ld a, [$c05f]
    cp $46
    jr nz, jr_006_4559

    inc de
    inc de
    ld a, [de]
    cp $00
    jr z, jr_006_4549

    ld hl, $c059
    ld [hl-], a
    ld c, a
    dec de
    ld a, [de]
    ld [hl-], a
    ld e, a
    ld d, c
    ld a, [de]
    jr jr_006_4579

jr_006_4549:
    ld a, $ff
    ld [$c061], a
    ld a, $01
    ld [$c04d], a
    ld [$c04e], a
    jp Jump_006_45fa


jr_006_4559:
    inc l
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    dec l
    dec l

Jump_006_4560:
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, $4a0b
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, $c049

jr_006_4577:
    dec l
    dec l

jr_006_4579:
    ld [hl+], a
    inc de
    ld a, [de]
    cp $ff
    jr nz, jr_006_4587

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Jump_006_45fa


jr_006_4587:
    cp $fe
    jr nz, jr_006_459b

    ld a, [$c04e]
    ldh [rNR42], a
    ld a, $80
    ldh [rNR44], a
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Jump_006_4651


jr_006_459b:
    cp $fd
    jr nz, jr_006_45ab

    ld a, $01
    ld [$c04f], a
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Jump_006_4651


jr_006_45ab:
    inc de
    ld b, a
    ld a, [$c05f]
    cp $46
    jr nz, jr_006_45b8

    xor a
    jp Jump_006_45bb


jr_006_45b8:
    ld a, [$c04a]

Jump_006_45bb:
    add b
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, $4b85
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ldh [rNR41], a
    inc de
    ld a, [de]
    ld [$c04d], a
    inc de
    ld a, [de]
    ld [$c04e], a
    inc de
    ld a, $01
    ld [$c050], a
    ld [$c053], a
    ld [$c04f], a
    ld hl, $c051
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, $c054
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    jp Jump_006_4651


Jump_006_45fa:
    ld hl, $c04f
    ld a, [hl]
    cp $00
    jr z, jr_006_460d

    xor a
    ld [hl], a
    ld a, [$c04d]
    ldh [rNR42], a
    ld a, $80
    ldh [rNR44], a

jr_006_460d:
    ldh [rNR41], a
    inc l
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, jr_006_4624

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_4624

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

jr_006_4624:
    ld [de], a
    ld a, l
    ld d, h
    ld c, [hl]
    ld hl, $c051
    ld [hl+], a
    ld [hl], d
    inc l
    ld a, c
    ldh [rNR43], a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, jr_006_4645

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_4645

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

jr_006_4645:
    ld [de], a
    ld a, l
    ld d, h
    ld c, [hl]
    ld hl, $c054
    ld [hl+], a
    ld [hl], d
    ld a, c
    ldh [rNR44], a

Jump_006_4651:
    ld hl, $c05f
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    cp $ff
    jr nz, jr_006_465e

    jp Jump_006_46f4


jr_006_465e:
    dec [hl]
    jr z, jr_006_4664

    jp Jump_006_46f4


jr_006_4664:
    ld a, [$c062]
    ld [hl], a
    inc l
    dec [hl]
    jr z, jr_006_466f

    jp Jump_006_46f4


jr_006_466f:
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    ld a, [de]
    cp $ff
    jr nz, jr_006_4683

    inc l
    inc de
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld d, a
    ld a, b
    ld e, a
    jr jr_006_468e

jr_006_4683:
    cp $00
    jr nz, jr_006_46bb

    inc l
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    dec l
    dec l

jr_006_468e:
    ld a, [de]
    ld [hl], a
    inc de
    ld a, [de]
    inc de
    inc l
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, $4a0b
    add hl, de
    add hl, de
    ld a, [$c05f]
    cp $17
    jr nz, jr_006_46ac

    ld de, $c019
    jp Jump_006_46af


jr_006_46ac:
    ld de, $c048

Jump_006_46af:
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl]
    ld [de], a
    dec de
    ld l, e
    ld h, d
    ld e, [hl]
    inc l
    ld d, [hl]
    ld a, [de]

jr_006_46bb:
    dec l
    dec l
    ld [hl+], a
    inc de
    ld a, [de]
    cp $ff
    jr nz, jr_006_46cb

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Jump_006_46f4


jr_006_46cb:
    cp $fe
    jr nz, jr_006_46d6

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Jump_006_46f4


jr_006_46d6:
    cp $fd
    jr nz, jr_006_46e1

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Jump_006_46f4


jr_006_46e1:
    inc de
    ld b, a
    add b
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, $4b0b
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]

Jump_006_46f4:
    ld a, [$c061]
    cp $ff
    jr nz, jr_006_46fe

    ld [$c05f], a

jr_006_46fe:
    ld hl, $c064
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr z, jr_006_470e

    ld [de], a
    jr jr_006_473e

jr_006_470e:
    inc hl
    inc hl
    ld a, [hl+]
    cp $00
    jr nz, jr_006_4719

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

jr_006_4719:
    ld [de], a
    ld a, l
    ld d, h
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $c065
    ld [hl+], a
    ld [hl], d
    inc l
    ld a, $ff
    ld h, a
    ld l, c
    xor a
    ldh [rNR30], a
    ld a, b
    ld [hl], a
    ld a, $80
    ldh [rNR30], a
    ld a, [$c068]
    xor $80
    ldh [rNR34], a
    ld a, [$c067]
    ldh [rNR33], a

jr_006_473e:
    ret

; PlaySong routine
; This setups pointers to play a song.
; Parameters: E = Song ID
Call_006_473f:
PlaySong:              
    ld hl, SongModuleHeaderList     ; Song module list pointer
    ld d, $00                       ; Zero out D, we only need E as an index.
    add hl, de                      ; 
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    ld a, [hl+]
    ld [$c005], a
    ld a, [hl+]
    ld [$c006], a
    ld a, [hl+]
    ld [$c01c], a
    ld a, [hl+]
    ld [$c01d], a
    ld a, [hl+]
    ld [$c033], a
    ld a, [hl+]
    ld [$c034], a
    ld a, [hl+]
    ld [$c04b], a
    ld a, [hl+]
    ld [$c04c], a
    ld a, [hl+]
    ld [$c062], a
    ld a, [hl+]
    ld [$c065], a
    ld a, [hl+]
    ld [$c066], a
    xor a                   ; Disable sound
    ldh [rNR30], a
    ld a, [hl+]             ; setup waveform pointer
    ld h, [hl]
    ld l, a
    ld de, $ff30            ; Destination: Wave RAM

InitWaveRAM:
    ld a, [hl+]             ; Load wave RAM data
    ld [de], a              ; Send to Wave RAM
    inc e                   ; Increase destination index
    ld a, e
    cp $40
    jr nz, InitWaveRAM

    ld a, $ff
    ldh [rNR52], a
    ld a, $80
    ldh [rNR30], a
    ld a, $10
    ldh [rNR31], a
    xor a
    ldh [rNR32], a
    dec a
    ld [$c05f], a
    ld a, $80
    ldh [rNR34], a
    xor a
    ld [$c00e], a
    ld [$c00f], a
    inc a
    ld [$c00b], a
    ld [$c064], a
    ld [$c000], a
    ld [$c017], a
    ld [$c02e], a
    ld [$c046], a
    ld [$c001], a
    ld [$c018], a
    ld [$c02f], a
    ld [$c047], a
    ld hl, $4880
    ld a, l
    ld [$c002], a
    ld [$c019], a
    ld [$c030], a
    ld [$c048], a
    ld a, h
    ld [$c003], a
    ld [$c01a], a
    ld [$c031], a
    ld [$c049], a
    ld a, $77
    ldh [rNR50], a
    ld a, $ff
    ldh [rNR51], a
    ldh [rNR52], a
    ld hl, $c036
    ld de, $487a
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl], a
    xor a
    ld [$c007], a
    ld [$c01e], a
    ld [$c04d], a
    inc a
    ld [$c009], a
    ld [$c020], a
    ld [$c04f], a
    ldh [rNR44], a
    ldh [rNR42], a
    inc a
    ld [$c035], a
    ret


    ld d, $00
    ld hl, $4911
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    ld a, [$c05f]
    cp $ff
    jr z, jr_006_4832

    ld a, [$c063]
    dec a
    sub [hl]
    and $80
    jr z, @+$4a

jr_006_4832:
    ld a, [hl+]
    ld [$c063], a
    ld a, [$c05f]
    cp $17
    jr nz, jr_006_4847

    ld a, $01
    ld [$c020], a
    ld [$c01e], a
    jr jr_006_4853

jr_006_4847:
    cp $46
    jr nz, jr_006_4853

    ld a, $01
    ld [$c04f], a
    ld [$c04d], a

jr_006_4853:
    ld a, [hl+]
    ld [$c058], a
    ld a, [hl+]
    ld [$c059], a
    ld a, [hl+]
    cp $02
    jr nz, jr_006_4865

    ld de, $c017
    jr jr_006_4868

jr_006_4865:
    ld de, $c046

jr_006_4868:
    ld hl, $c05f
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $01
    ld [$c056], a
    ld [$c057], a
    xor a
    ld [$c061], a

    db $c9

    db $ff, $00, $00, $7b, $48, $00, $2c, $00

    sbc h
    nop
    ld b, $01

    db $6b, $01

    ret


    db $01

    db $23, $02, $77, $02, $c6, $02, $12, $03, $56, $03

    db $9b, $03, $da, $03, $16, $04, $4e, $04

    db $83, $04, $b5, $04, $e5, $04, $11, $05, $3b, $05, $63, $05, $89, $05, $ac, $05
    db $ce, $05, $ed, $05, $0a, $06, $27, $06

    ld b, d
    db $06

    db $5b, $06, $72, $06, $89, $06, $9e, $06, $b2, $06, $c4, $06, $d6, $06, $e7, $06
    db $f7, $06, $06, $07, $14, $07, $21, $07, $2d, $07, $39, $07, $44, $07, $4f, $07
    db $59, $07, $62, $07

    ld l, e
    rlca

    db $73, $07, $7b, $07, $83, $07, $8a, $07, $90, $07, $97, $07, $9d, $07, $a2, $07
    db $a7, $07, $ac, $07, $b1, $07, $b6, $07, $ba, $07, $be, $07, $c1, $07

    call nz, $c807
    rlca
    rlc a
    adc $07

    db $d1, $07

    call nc, $d607
    rlca
    reti


    rlca
    db $db
    rlca
    db $dd
    rlca
    rst $18
    rlca

    db $7f, $c1, $5d, $03, $0a, $ee, $5c, $02, $0a, $f4, $5c, $02, $0a, $fa, $5c, $02
    db $0a, $00, $5d, $02, $14, $06, $5d, $02

    ld [hl-], a
    ld c, $5d
    ld [bc], a

    db $32, $14, $5d, $02, $14, $28, $5d, $02

    ld e, $2e
    ld e, l
    ld [bc], a

    db $3c, $6b, $5d, $03

    jr z, @+$1c

    ld e, l
    inc bc
    inc d
    inc [hl]
    ld e, l
    ld [bc], a

    db $14, $20, $5d, $03, $14, $71, $5d, $03

    dec d
    inc a
    ld e, l
    ld [bc], a
    jr z, @+$65

    ld e, l
    ld [bc], a

    db $28, $77, $5d, $03, $28, $7d, $5d, $03, $28, $91, $5d, $02, $28, $85, $5d, $03

    jr z, @-$73

    ld e, l
    ld [bc], a

    db $32, $42, $5d, $02

    db $32, $9d, $5d, $02

    ld [hl-], a
    and l
    ld e, l
    ld [bc], a

    db $3c, $ad, $5d, $03, $64, $b3, $5d, $02, $64, $b9, $5d, $03, $64, $97, $5d, $03

    ld d, b
    rst $00
    ld e, l
    ld [bc], a

    SongModuleHeaderList:              ; song module header list 
    BGM_Module_00:
    db $df, $50, $e1, $50, $e3, $50, $e5, $50, $08, $cf, $66, $f2, $65
    BGM_Module_01:
    db $b1, $4b, $01, $4c, $51, $4c, $a1, $4c, $07, $40, $66, $32, $66
    db $a3, $4c, $03, $4d, $63, $4d
    db $c3, $4d, $07, $40, $66, $32, $66, $c5, $4d, $25, $4e, $85, $4e, $e5, $4e, $07
    db $cf, $66, $f2, $65, $e7, $4e, $17, $4f, $47, $4f, $77, $4f, $07, $cf, $66, $f2
    db $65

    db $a7, $4f, $c7, $4f, $e7, $4f, $07, $50, $07, $cf, $66, $f2, $65, $a7, $4f, $09
    db $50, $e7, $4f, $07, $50, $07, $cf, $66, $f2, $65

    add hl, hl
    ld d, b
    dec hl
    ld d, b
    cpl
    ld d, b
    ld sp, $0650
    rst $08
    ld h, [hl]
    ld a, [c]
    ld h, l
    inc sp
    ld d, b
    ld c, e
    ld d, b
    ld h, e
    ld d, b
    rlca
    ld d, b
    rlca
    rst $08
    ld h, [hl]
    ld a, [c]
    ld h, l

    db $7d, $50, $9d, $50, $bd, $50, $07, $50, $06, $cf, $66, $f2, $65, $e7, $50, $ea
    db $50, $f7, $50, $06, $51, $0a, $51, $23, $51

    ccf
    ld d, c
    ld h, h
    ld d, c
    add b
    ld d, c
    and l
    ld d, c
    cp [hl]
    ld d, c
    db $e3
    ld d, c

    db $08, $52

    db $0c, $52

    ld c, e
    ld d, d
    ld [hl], d
    ld d, d
    sbc c
    ld d, d

    db $b4, $52, $b8, $52, $da, $52, $fc, $52, $21, $53, $34, $53, $44, $53

    db $8b, $54, $91, $54, $97, $54, $9d, $54

    and d
    ld d, h

    db $51, $53

    ld [hl], a
    ld d, e
    sub b
    ld d, e
    xor h
    ld d, e
    cp a
    ld d, e
    jp nc, $e553

    ld d, e
    ld [hl+], a
    ld d, h
    dec [hl]
    ld d, h

    db $48, $54

    db $7c, $54

    ld h, c
    ld d, h
    ld h, e
    ld d, e
    ld hl, sp+$53

    db $0d, $54, $ae, $54, $c7, $54, $d7, $54

    db $fc
    ld d, h
    dec d
    ld d, l
    ld l, $55
    ld b, h
    ld d, l
    ld [hl], l
    ld d, l
    sub c
    ld d, l
    xor a
    ld d, l
    sub $55

    db $f1, $55, $01, $56

    rla
    ld d, [hl]
    inc sp
    ld d, [hl]
    ld d, d
    ld d, [hl]
    ld [hl], h
    ld d, [hl]

    db $9f, $56, $d5, $56

    pop af
    ld d, [hl]
    add hl, de
    ld d, a
    ld b, h
    ld d, a

    db $a2, $57, $b2, $57

    ret z

    ld d, a
    db $e4
    ld d, a
    inc bc
    ld e, b
    dec h
    ld e, b
    ld d, b
    ld e, b
    ld a, b
    ld e, b
    and e
    ld e, b
    ld [hl], d
    ld d, a
    ld bc, $b959
    ld d, [hl]
    pop de
    ld e, b

    db $06, $59, $1f, $59, $38, $59, $4e, $59, $7f, $59, $97, $59

    db $ca, $59

    db $e5, $59, $e9, $59, $fa, $59, $07, $5a, $1b, $5a, $20, $5a, $30, $5a, $34, $5a
    db $37, $5a, $43, $5a, $4f, $5a, $5c, $5a

    ld l, b
    ld e, d
    ld l, [hl]
    ld e, d
    add h
    ld e, d
    adc b
    ld e, d

    db $8f, $5a, $df, $5a, $e2, $5a, $08, $5b, $21, $5b, $3a, $5b, $46, $5b, $5d, $5b
    db $65, $5b, $71, $5b, $7e, $5b, $86, $5b, $98, $5b, $9e, $5b, $ab, $5b, $f7, $5b
    db $f4, $5a, $d0, $5b, $10, $5c

    db $2b, $5c, $44, $5c, $5d, $5c, $7a, $5c, $92, $5c, $b1, $5c, $cb, $5c, $78, $5e
    db $5d, $61, $ac, $5e, $ab, $61

    adc c
    ld h, b

    db $14, $61

    db $44, $61, $c2, $5f, $cc, $5f, $d6, $5f, $e0, $5f, $ea, $5f, $f4, $5f, $fe, $5f

    db $bd, $5e

    ld l, a
    ld h, c

    db $d8, $65, $e8, $65

    db $08
    ld h, b

    db $72, $62, $18, $62

    ld sp, $5162
    ld h, d
    ld e, c
    ld e, a

    db $8b, $61

    db $9b, $61

    ld a, [hl-]
    ld e, a
    ret c

    ld e, [hl]
    ld c, [hl]
    ld h, b
    jr z, jr_006_4ba9

    db $2f, $61

    rst $00
    ld e, [hl]
    ret nz

    ld h, b
    adc d
    ld h, d
    db $e4
    ld h, b

    db $d2, $60, $e4, $60

    or $60
    ld [c], a
    ld e, [hl]
    sbc c
    ld e, a
    xor b
    ld h, b
    cp l
    ld e, [hl]

    db $dc, $62, $f7, $62, $00, $63, $1b, $63, $4c, $64

    ld h, d
    ld h, h

    db $7a, $64, $2b, $63

    ld e, $64
    inc [hl]
    ld h, h

    db $fc, $63

    db $0e, $64

    ld b, a
    ld h, e

    db $89, $63

    db $9b, $63

    db $d1, $63

    db $ea
    ld h, e

    db $bc, $62

    xor b
    ld h, d

    db $e1, $65, $a0, $5e, $81, $5e, $94, $5e

    adc l
    ld e, [hl]
    pop hl
    ld h, l
    pop hl
    ld h, l
    pop hl
    ld h, l
    pop hl
    ld h, l
    pop hl
    ld h, l
    adc h
    ld h, h

    db $e8, $64

    db $80, $65

    db $a4, $65

    cp [hl]
    ld h, h
    inc a
    ld h, l
    or [hl]
    ld h, l
    ld hl, sp+$64

jr_006_4ba9:
    db $c3
    ld h, e

    db $64, $65

    sbc [hl]
    ld h, h
    ld [hl], h
    ld h, l

    db $00, $01, $00, $01, $00, $01, $00, $01, $03, $01, $03, $01, $03, $01, $03, $01
    db $00, $01, $00, $01, $00, $01, $00, $01

    inc bc
    ld bc, $0103
    inc bc
    ld bc, $0103
    nop
    inc b
    nop
    inc b
    nop
    inc b
    nop
    inc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    inc b
    nop
    inc b
    nop
    inc b
    nop
    inc b
    nop
    inc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    inc b
    nop
    ld a, [bc]
    nop
    ld a, [bc]
    nop
    ld a, [bc]
    nop
    ld a, [bc]
    cp $0b
    cp $0b
    cp $0b
    cp $0e

    db $00, $02, $00, $02, $00, $02, $00, $02, $03, $02, $03, $02, $03, $02, $03, $02
    db $00, $02, $00, $02, $00, $02, $00, $02

    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    nop
    dec b
    nop
    dec b
    nop
    dec b
    nop
    ld b, $fe
    rlca
    cp $07
    cp $07
    cp $08
    nop
    dec b
    nop
    dec b
    nop
    dec b
    nop
    ld b, $fe
    rlca
    cp $07
    cp $07
    cp $08
    nop
    dec b
    nop
    dec b
    nop
    dec b
    nop
    ld b, $fe
    rlca
    cp $07
    cp $07
    cp $0f

    db $00, $11, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $0c, $00, $00, $00, $00, $00, $00

    cp $03
    cp $00
    cp $00
    cp $00
    nop
    inc c
    nop
    nop
    nop
    nop
    nop
    nop
    cp $03
    cp $00
    cp $00
    cp $00
    nop
    add hl, bc
    nop
    add hl, bc
    nop
    add hl, bc
    nop
    add hl, bc
    inc bc
    add hl, bc
    inc bc
    add hl, bc
    inc bc
    add hl, bc
    inc bc
    add hl, bc
    nop
    add hl, bc
    nop
    add hl, bc
    nop
    add hl, bc
    nop
    add hl, bc
    inc bc
    add hl, bc
    inc bc
    add hl, bc
    inc bc
    add hl, bc
    inc bc
    db $10

    db $00, $0d, $00, $12, $00, $13, $00, $12, $00, $14, $00, $12, $00, $13, $00, $12
    db $00, $14, $00, $12, $00, $13, $00, $12, $00, $14, $03, $12, $03, $13, $03, $12
    db $03, $14, $03, $12, $03, $13, $03, $12, $03, $14, $00, $1e, $00, $1f, $07, $1e
    db $00, $26, $02, $12, $02, $13, $02, $12

    ld [bc], a
    inc d
    ld [bc], a
    ld [de], a
    ld [bc], a
    inc de
    ld [bc], a
    ld [de], a
    ld [bc], a
    inc d
    ld [bc], a
    ld [de], a
    ld [bc], a
    inc de
    ld [bc], a
    ld [de], a
    ld [bc], a
    inc d
    dec b
    ld [de], a
    dec b
    inc de
    dec b
    ld [de], a
    dec b
    inc d
    dec b
    ld [de], a
    dec b
    inc de
    dec b
    ld [de], a
    dec b
    inc d
    ld [bc], a
    ld e, $02
    rra
    add hl, bc
    ld e, $02
    db $28

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $1d, $00, $1d, $00, $1d, $00, $1d
    db $00, $1d, $00, $1d, $00, $1d, $00, $1d, $03, $1d, $03, $1d, $03, $1d, $03, $1d
    db $03, $1d, $03, $1d, $03, $1d, $03, $1d, $05, $1d, $05, $1d, $07, $1d, $07, $1d
    db $02, $00, $02, $00, $02, $00

    ld [bc], a
    nop
    ld [bc], a
    dec e
    ld [bc], a
    dec e
    ld [bc], a
    dec e
    ld [bc], a
    dec e
    ld [bc], a
    dec e
    ld [bc], a
    dec e
    ld [bc], a
    dec e
    ld [bc], a
    dec e
    dec b
    dec e
    dec b
    dec e
    dec b
    dec e
    dec b
    dec e
    dec b
    dec e
    dec b
    dec e
    dec b
    dec e
    dec b
    dec e
    rlca
    dec e
    rlca
    dec e
    add hl, bc
    dec e
    add hl, bc
    add hl, hl

    db $00, $2b, $00, $2b, $00, $2b, $00, $2b, $00, $15, $00, $16, $00, $15, $00, $17
    db $00, $15, $00, $16, $00, $15, $00, $17, $03, $15, $03, $16, $03, $15, $03, $17
    db $03, $15, $03, $16, $03, $15, $03, $17, $00, $20, $00, $21, $00, $22, $00, $23
    db $00, $2b, $02, $00, $02, $00

    ld [bc], a
    nop
    ld [bc], a
    dec d
    ld [bc], a
    ld d, $02
    dec d
    ld [bc], a
    rla
    ld [bc], a
    dec d
    ld [bc], a
    ld d, $02
    dec d
    ld [bc], a
    rla
    dec b
    dec d
    dec b
    ld d, $05
    dec d
    dec b
    rla
    dec b
    dec d
    dec b
    ld d, $05
    dec d
    dec b
    rla
    ld [bc], a
    jr nz, @+$04

    ld hl, $2202
    ld [bc], a
    ld a, [hl+]

    db $00, $27, $00, $2d, $00, $2d, $00, $2d, $00, $2d, $00, $2d, $00, $2d, $00, $2d
    db $00, $2d, $00, $2f, $00, $30, $fe, $2f, $fe, $31, $00, $2f, $00, $30, $fe, $2f
    db $fe, $31, $00, $32, $00, $32, $fe, $32, $fe, $33, $00, $32, $00, $32, $05, $32
    db $05, $33, $03, $2d

    inc bc
    dec l
    inc bc
    dec l
    inc bc
    dec l
    inc bc
    dec l
    inc bc
    dec l
    inc bc
    dec l
    inc bc
    dec l
    inc bc
    cpl
    inc bc
    jr nc, jr_006_4e0b

    cpl

jr_006_4e0b:
    ld bc, $0331
    cpl
    inc bc
    jr nc, jr_006_4e13

    cpl

jr_006_4e13:
    ld bc, $0331
    ld [hl-], a
    inc bc
    ld [hl-], a
    ld bc, $0132
    inc sp
    inc bc
    ld [hl-], a
    inc bc
    ld [hl-], a
    ld [$0832], sp
    inc [hl]

    db $00, $2e, $00, $2e, $fe, $2e, $fe, $2e, $00, $2e, $00, $2e, $fc, $2e, $fc, $2e
    db $02, $2e, $02, $2e, $02, $2e, $02, $2e, $02, $2e, $02, $2e, $00, $2e, $00, $2e
    db $00, $2e, $00, $2e, $fe, $2e, $fe, $2e, $00, $2e, $00, $2e, $05, $2e, $05, $2e
    db $03, $2e

    inc bc
    ld l, $01
    ld l, $01
    ld l, $03
    ld l, $03
    ld l, $ff
    ld l, $ff
    ld l, $05
    ld l, $05
    ld l, $05
    ld l, $05
    ld l, $05
    ld l, $05
    ld l, $03
    ld l, $03
    ld l, $03
    ld l, $03
    ld l, $01
    ld l, $01
    ld l, $03
    ld l, $03
    ld l, $08
    ld l, $08
    dec [hl]

    db $00, $2c, $00, $2c, $fe, $2c, $fe, $2c, $00, $2c, $00, $2c, $fc, $2c, $fc, $2c
    db $02, $2c, $02, $2c, $00, $2c, $00, $2c, $02, $2c, $02, $2c, $00, $2c, $00, $2c
    db $00, $2c, $00, $2c, $fe, $2c, $fe, $2c, $00, $2c, $00, $2c, $05, $2c, $05, $2c
    db $03, $2c

    inc bc
    inc l
    ld bc, $012c
    inc l
    inc bc
    inc l
    inc bc
    inc l
    rst $38
    inc l
    rst $38
    inc l
    dec b
    inc l
    dec b
    inc l
    inc bc
    inc l
    inc bc
    inc l
    dec b
    inc l
    dec b
    inc l
    inc bc
    inc l
    inc bc
    inc l
    inc bc
    inc l
    inc bc
    inc l
    ld bc, $012c
    inc l
    inc bc
    inc l
    inc bc
    inc l
    ld [$082c], sp
    db $36

    db $00, $27, $00, $37, $00, $37, $00, $37, $00, $37, $00, $38, $00, $38, $00, $38

    nop
    add hl, sp
    nop
    ld a, [hl-]
    nop
    ld a, [hl-]
    nop
    ld a, [hl-]
    nop
    ld a, [hl-]
    nop
    dec sp
    nop
    dec sp
    nop
    dec sp
    nop
    inc a
    nop
    ccf
    nop
    ld b, b
    nop
    ccf
    nop
    ld b, c
    nop
    ccf
    nop
    ld b, b
    nop
    ccf
    nop
    ld c, e

    db $00, $3e, $00, $00, $00, $3e, $00, $00, $00, $3e, $00, $00, $00, $3e

    nop
    nop
    dec b
    ld a, $00
    nop
    dec b
    ld a, $00
    nop
    nop
    ld a, $00
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
    nop
    nop
    ld c, h

    db $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d

    inc c
    dec a
    ld de, $113d
    dec a
    ld de, $113d
    dec a
    inc c
    dec a
    inc c
    dec a
    inc c
    dec a
    inc c
    dec a
    inc c
    dec a
    inc c
    dec a
    inc c
    dec a
    inc c
    dec a
    inc c
    dec a
    inc c
    dec a
    inc c
    dec a
    inc c
    ld c, l

    db $00, $42, $00, $42, $00, $42, $00, $42, $00, $43, $00, $43, $00, $43

    nop
    ld b, h
    nop
    ld b, l
    nop
    ld b, l
    nop
    ld b, l
    nop
    ld b, l
    nop
    ld b, [hl]
    nop
    ld b, [hl]
    nop
    ld b, [hl]
    nop
    ld b, a
    nop
    ld c, b
    nop
    ld c, c
    nop
    ld c, b
    nop
    ld c, d
    nop
    ld c, b
    nop
    ld c, c
    nop
    ld c, b
    nop
    ld c, [hl]

    db $00, $51, $00, $51, $07, $51, $07, $51, $03, $51, $03, $51, $07, $51, $07, $51
    db $03, $51, $03, $51, $07, $51, $07, $51

    ld b, $51
    ld b, $51
    ld [$0851], sp
    ld d, e

    db $00, $52, $00, $52, $fb, $52, $fb, $52, $03, $52, $03, $52, $07, $52, $07, $52
    db $03, $52

    inc bc
    ld d, d
    dec b
    ld d, d
    dec b
    ld d, d
    ld b, $52
    ld b, $52
    ld [$0852], sp
    ld d, h

    db $00, $4f, $00, $4f, $00, $50, $00, $50, $03, $4f, $03, $4f, $00, $50, $00, $50
    db $03, $4f, $03, $4f, $03, $50, $03, $50

    ld b, $4f
    ld b, $4f
    ld [$084f], sp
    ld d, l

    db $00, $27, $00, $56, $00, $57, $00, $58, $00, $59, $00, $5a, $00, $5b, $00, $5c
    db $00, $5d, $00, $5e, $00, $5f, $00, $60, $00, $61

    nop
    ld h, d
    nop
    ld h, e
    nop
    ld h, h
    nop
    ld h, l

    db $07, $66, $07, $67, $07, $66, $00, $19, $00, $1a, $00, $68, $00, $68, $07, $68
    db $07, $68, $05, $68, $05, $68, $00, $68, $07, $68, $fb, $68, $fb, $68, $fe, $68
    db $fe, $76, $00, $6b, $00, $6c, $00, $6d, $00, $6e, $00, $6f, $00, $70, $00, $71
    db $00, $72, $00, $73, $00, $74, $03, $73, $03, $77, $00, $69, $00, $6a, $fb, $69
    db $fb, $6a, $05, $75, $05, $6a, $00, $69, $fb, $6a, $fb, $69, $fb, $6a, $fe, $69
    db $fe, $78

    nop
    ld a, [de]

    db $00, $7b, $00, $7b, $07, $7b, $07, $7b, $00, $7b, $00, $7b, $07, $7b, $07, $7b
    db $05, $7b, $05, $7b, $0a, $7b, $0a, $7b, $05, $7b, $05, $7b, $0a, $7b, $0a, $7d
    db $00, $7c, $00, $7c, $fb, $7c, $fb, $7c, $00, $7c, $00, $7c, $fb, $7c, $fb, $7c
    db $05, $7c, $05, $7c, $fe, $7c, $fe, $7c, $05, $7c, $05, $7c, $fe, $7c, $fe, $7e
    db $00, $79, $00, $7a, $fb, $79, $fb, $7a, $00, $79, $00, $7a, $fb, $79, $fb, $7a
    db $05, $79, $05, $7a, $fe, $79, $fe, $7a, $05, $79, $05, $7a, $fe, $79, $fe, $7f
    db $00, $1b, $00, $18, $00, $18, $00, $19, $00, $1a, $10, $ff, $00, $04, $0c, $13
    db $04, $18, $13, $04, $16, $13, $04, $13, $13, $00, $02, $ff, $04, $0c, $13, $04
    db $13, $13, $04, $15, $13, $02, $0f, $13, $00

    db $10
    inc h
    ld [bc], a
    nop
    ld [bc], a
    inc c
    inc de
    ld [bc], a
    inc c
    inc de
    ld [bc], a
    jr @+$15

    ld [bc], a
    inc de
    inc de
    ld [bc], a
    ld d, $13
    ld [bc], a
    dec d
    inc de
    ld [bc], a
    inc de
    inc de
    ld [bc], a
    rrca
    inc de
    nop
    ld [bc], a
    rlca
    ld e, $01
    inc h
    inc bc
    ld bc, $0324
    ld [bc], a
    ld a, [de]
    ld b, $02
    inc h
    inc bc
    ld [bc], a
    rlca
    ld e, $02
    inc h
    inc bc
    ld [bc], a
    ld a, [de]
    ld b, $02
    inc h
    inc bc
    nop
    ld [bc], a
    rlca
    ld e, $01
    inc h
    inc bc
    ld bc, $0324
    ld bc, $061c
    ld bc, $061c
    ld [bc], a
    inc h
    inc bc
    ld [bc], a
    rlca
    ld e, $02
    inc h
    inc bc
    ld bc, $061a
    ld bc, $061a
    ld bc, $061a
    ld bc, $061a
    nop
    ld [bc], a
    rlca
    ld e, $01
    inc h
    inc b
    ld bc, $0424
    ld [bc], a
    ld a, [de]
    ld b, $02
    inc h
    inc b
    ld [bc], a
    rlca
    ld e, $02
    inc h
    inc b
    ld [bc], a
    ld a, [de]
    ld b, $02
    inc h
    inc b
    nop
    ld [bc], a
    rlca
    ld e, $01
    inc h
    inc b
    ld bc, $0424
    ld bc, $061c
    ld bc, $061c
    ld [bc], a
    inc h
    inc b
    ld [bc], a
    rlca
    ld e, $02
    inc h
    inc b
    ld bc, $061a
    ld bc, $061a
    ld bc, $061a
    ld bc, $061a
    nop
    ld [bc], a
    jr jr_006_51aa

    ld [bc], a
    inc h

jr_006_51aa:
    ld [bc], a
    ld [bc], a
    jr jr_006_51b0

    ld [bc], a
    inc h

jr_006_51b0:
    ld [bc], a
    ld [bc], a
    ld [hl+], a
    ld [bc], a
    ld [bc], a
    ld hl, $0202
    rra
    ld [bc], a
    ld [bc], a
    dec de
    ld [bc], a
    nop
    ld [bc], a
    inc h
    inc bc
    ld bc, $0324
    ld bc, $0324
    ld bc, $0324
    ld bc, $0324
    ld [bc], a
    inc h
    inc bc
    ld bc, $0324
    ld [bc], a
    inc h
    inc bc
    ld [bc], a
    inc h
    inc bc
    ld bc, $0324
    ld bc, $0324
    ld bc, $0324
    nop
    ld [bc], a
    inc h
    inc b
    ld bc, $0424
    ld bc, $0424
    ld bc, $0424
    ld bc, $0424
    ld [bc], a
    inc h
    inc b
    ld bc, $0424
    ld [bc], a
    inc h
    inc b
    ld [bc], a
    inc h
    inc b
    ld bc, $0424
    ld bc, $0424
    ld bc, $0424
    nop

    db $10, $24, $0e, $00

    db $04, $07, $02, $04, $07, $01, $04, $07, $02, $04, $1a, $01, $04, $07, $02, $04
    db $07, $01, $04, $07, $02, $04, $1a, $01, $04, $07, $02, $04, $07, $01, $04, $07
    db $02, $04, $1a, $01, $04, $00, $02, $01, $1c, $01, $03, $1c, $01, $04, $07, $02
    db $01, $1a, $01, $01, $1a, $01, $01, $1a, $01, $01, $1a, $01, $ff, $a1, $4c

    ld [bc], a
    inc h
    inc b
    ld bc, $0424
    ld bc, $0424
    ld bc, $0424
    ld bc, $0424
    ld [bc], a
    inc h
    inc b
    ld bc, $0424
    ld [bc], a
    inc h
    inc b
    ld [bc], a
    inc h
    inc b
    ld bc, $0424
    ld bc, $0424
    ld bc, $0424
    rst $38
    or c
    ld c, e
    ld [bc], a
    rlca
    ld e, $01
    inc h
    inc b
    ld bc, $0424
    ld bc, $061c
    ld bc, $061c
    ld [bc], a
    inc h
    inc b
    ld [bc], a
    rlca
    ld e, $02
    inc h
    inc b
    ld bc, $061a
    ld bc, $061a
    ld bc, $061a
    ld bc, $061a
    rst $38
    ld bc, $024c
    jr jr_006_529e

    ld [bc], a
    inc h

jr_006_529e:
    ld [bc], a
    ld [bc], a
    jr jr_006_52a4

    ld [bc], a
    inc h

jr_006_52a4:
    ld [bc], a
    ld [bc], a
    ld [hl+], a
    ld [bc], a
    ld [bc], a
    ld hl, $0202
    rra
    ld [bc], a
    ld [bc], a
    dec de
    ld [bc], a
    rst $38
    ld d, c
    ld c, h

    db $10, $00, $11, $00, $01, $0c, $01, $01, $29, $19, $01, $2b, $19, $01, $0c, $01
    db $02, $1c, $06, $02, $0c, $01, $02, $16, $01, $01, $2b, $19, $01, $29, $19, $02
    db $1c, $06, $02, $11, $01, $00, $01, $0c, $01, $01, $29, $19, $01, $2b, $19, $01
    db $0c, $01, $02, $1c, $06, $02, $0c, $01, $02, $16, $01, $01, $2b, $19, $01, $15
    db $01, $02, $1c, $06, $02, $11, $01, $00, $01, $0c, $01, $01, $29, $19, $01, $2b
    db $19, $01, $0c, $01, $02, $1c, $06, $02, $0c, $01, $02, $16, $01, $01, $2b, $19
    db $01, $15, $01, $02, $1c, $06, $01, $0a, $01, $01, $11, $01, $00, $03, $34, $07
    db $03, $34, $07, $02, $35, $08, $03, $35, $09, $03, $35, $08, $02, $32, $07, $00
    db $03, $34, $07, $03, $30, $08, $02, $2b, $09, $03, $2e, $08, $05, $29, $09, $00
    db $03, $34, $07, $03, $30, $08, $02, $2b, $09, $08, $2e, $08, $00, $02, $ff, $04
    db $24, $14, $03, $24, $14, $01, $24, $14, $04, $24, $14, $02, $24, $14, $00, $02
    db $ff, $04, $24, $14, $03, $24, $14, $01, $24, $14, $04, $24, $14, $02, $24, $14
    db $ff, $03, $4d

    db $03, $05, $01, $01, $05, $01, $02, $1f, $06, $02, $05, $01, $03, $07, $01, $01
    db $07, $01, $02, $1f, $06, $02, $07, $01, $00, $03, $08, $01, $01, $08, $01, $02
    db $1f, $06, $02, $08, $01, $03, $0a, $01, $01, $0a, $01, $02, $1f, $06, $01, $1f
    db $06, $01, $1f, $06, $00, $03, $2d, $0c, $03, $2d, $0c, $02, $2d, $0c, $03, $2b
    db $0c, $03, $2b, $0c, $02, $2b, $0c, $00, $03, $27, $0d, $03, $27, $0d, $02, $27
    db $0d, $03, $25, $0d, $03, $29, $0c, $02, $29, $0c, $00, $03, $2b, $09, $03, $2b
    db $09, $02, $2b, $09, $03, $2b, $0b, $03, $2b, $0b, $02, $2b, $0b, $00, $03, $2b
    db $0c, $03, $2b, $0c, $02, $2b, $0c, $03, $2b, $0d, $03, $2b, $0d, $02, $2b, $0d
    db $00

    inc bc
    dec hl
    inc c
    inc bc
    dec hl
    inc c
    ld [bc], a
    dec hl
    inc c
    inc bc
    dec hl
    dec c
    inc bc
    dec hl
    dec c
    ld [bc], a
    dec hl
    dec c
    rst $38
    ld h, e
    ld c, l

    db $02, $ff, $02, $30, $08, $02, $ff, $02, $30, $08, $02, $ff, $02, $2e, $08, $02
    db $ff, $02, $2e, $08, $00

    inc bc
    inc c
    ld bc, $0c03
    ld bc, $0c02
    ld bc, $0e03
    ld bc, $0e03
    ld bc, $0e02
    ld bc, $0300
    ld c, $01
    inc bc
    inc d
    ld bc, $1402
    ld bc, $1303
    ld bc, $1003
    ld bc, $1002
    db $01
    nop

    db $03, $0d, $01, $01, $0d, $01, $02, $1f, $06, $02, $0d, $01, $03, $0c, $01, $01
    db $0c, $01, $02, $1f, $06, $02, $0c, $01, $00

    inc bc
    dec c
    ld bc, $0d01
    ld bc, $1f02
    ld b, $02
    dec c
    ld bc, $0c03
    ld bc, $0c01
    ld bc, $1f02
    ld b, $02
    inc c
    ld bc, $a3ff
    ld c, h

    db $04, $24, $03, $04, $24, $01, $04, $24, $03, $04, $24, $01, $ff, $c3, $4d, $10
    db $00, $10, $ff, $dd, $50, $10, $00, $11, $ff, $dd, $50, $10, $00, $00, $ff, $dd
    db $50, $10, $ff, $ff, $dd, $50

    inc b
    inc h
    ld [bc], a
    ld [bc], a
    inc h
    inc bc
    ld [bc], a
    inc h
    ld bc, $a1ff
    ld c, h

    db $02, $18, $15, $02, $30, $08, $02, $13, $15, $02, $30, $08, $02, $14, $15, $02
    db $30, $07, $02, $0f, $15, $02, $30, $07, $00

    db $04, $0c, $1e

    inc b
    rra
    ld b, $04
    inc c
    ld e, $02
    rra
    ld b, $02
    inc c
    ld e, $00

    db $01, $1c, $19, $01, $1a, $19, $02, $18, $19

    ld bc, $191c
    ld bc, $191a
    ld [bc], a
    jr jr_006_5502

    ld bc, $1918
    ld bc, $191a
    ld [bc], a
    dec de
    add hl, de
    ld bc, $1918
    ld bc, $191a
    ld [bc], a
    dec de
    add hl, de
    nop
    ld bc, $1829
    ld bc, $182a

jr_006_5502:
    ld [bc], a
    ld h, $18
    inc b
    jr z, jr_006_550e

    ld bc, $1822
    ld bc, $1824

jr_006_550e:
    ld [bc], a
    ld h, $18
    inc b
    jr z, @+$08

    nop
    ld bc, $1829
    ld bc, $182a
    ld [bc], a
    ld h, $18
    inc b
    jr z, jr_006_5527

    ld bc, $1829
    ld bc, $1828

jr_006_5527:
    ld [bc], a
    ld h, $18
    inc b
    jr z, @+$08

    nop
    ld bc, $1829
    ld bc, $182a
    ld [bc], a
    ld h, $18
    ld [bc], a
    jr z, @+$08

    ld [bc], a
    ld hl, $0418
    ld [hl+], a
    jr @+$06

    jr z, @+$08

    nop
    ld bc, $1828
    ld bc, $1826
    ld bc, $1824
    ld bc, $181f
    ld bc, $1828
    ld bc, $1826
    ld bc, $1824
    ld bc, $181f
    ld bc, $1827
    ld bc, $1826
    ld bc, $1824
    ld bc, $1820
    ld bc, $1827
    ld bc, $1826
    ld bc, $1824
    ld bc, $1820
    nop
    ld bc, $1828
    ld bc, $1826
    ld bc, $1824
    ld bc, $181f
    ld bc, $1828
    ld bc, $1826
    ld bc, $1824
    ld bc, $181f
    ld [$1827], sp
    nop
    ld bc, $1828
    ld bc, $1826
    ld bc, $1824
    ld bc, $181f
    ld bc, $1828
    ld bc, $1826
    ld bc, $1824
    ld bc, $181f
    ld [$1827], sp
    rst $38
    push bc
    ld c, l
    ld bc, $191c
    ld bc, $191a
    ld [bc], a
    jr jr_006_55d1

    ld bc, $191c
    ld bc, $191a
    ld [bc], a
    jr jr_006_55da

    ld bc, $1918
    ld bc, $191a
    ld [bc], a
    dec de
    add hl, de
    ld bc, $1918
    ld bc, $191a
    ld [bc], a

jr_006_55d1:
    dec de
    add hl, de
    rst $38
    dec h
    ld c, [hl]
    ld [bc], a
    jr jr_006_55ee

    ld [bc], a

jr_006_55da:
    jr nc, jr_006_55e4

    ld [bc], a
    inc de
    dec d
    ld [bc], a
    jr nc, jr_006_55ea

    ld [bc], a
    inc d

jr_006_55e4:
    dec d
    ld [bc], a
    jr nc, jr_006_55ef

    ld [bc], a
    rrca

jr_006_55ea:
    dec d
    ld [bc], a
    jr nc, @+$09

jr_006_55ee:
    rst $38

jr_006_55ef:
    add l
    ld c, [hl]

    db $04, $0c, $1e, $04, $1c, $06, $04, $0c, $1e, $03, $1c, $06, $01, $0c, $1e, $00
    db $02, $0c, $1e, $02, $0c, $1e, $03, $1c, $06, $01, $0c, $1e, $04, $0c, $1e, $03
    db $1c, $06, $01, $0c, $1e, $00

    ld [bc], a
    inc c
    ld e, $02
    inc c
    ld e, $03
    inc e
    ld b, $01
    inc c
    ld e, $04
    inc c
    ld e, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $00
    ld [bc], a
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc e
    ld b, $02
    inc c
    ld e, $02
    inc c
    ld e, $01
    inc c
    ld e, $02
    inc c
    ld e, $03
    inc e
    ld b, $01
    inc c
    ld e, $00
    ld [bc], a
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc e
    ld b, $02
    inc c
    ld e, $02
    inc c
    ld e, $01
    inc c
    ld e, $02
    inc c
    ld e, $01
    inc e
    ld b, $01
    inc e
    ld b, $02
    inc e
    ld b, $00
    ld [bc], a
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc e
    ld b, $02
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $00

    db $01, $0b, $15, $01, $fe, $01, $0b, $15

    ld bc, $02fe
    ld c, $15
    ld bc, $02fe
    ld de, $0115
    cp $01
    ld c, $15
    dec b
    cp $00
    ld bc, $150b
    ld bc, $01fe
    dec bc
    dec d
    ld bc, $02fe
    ld c, $15
    ld bc, $02fe
    ld de, $0115
    cp $01
    ld c, $15
    dec b
    cp $ff
    ld b, a
    ld c, a

    db $01, $1e, $19, $01, $1d, $19, $07, $23, $19

    ld bc, $191d
    ld bc, $191e
    ld [bc], a
    inc hl
    add hl, de
    ld bc, $191d
    ld bc, $191e
    ld bc, $1923
    nop
    ld bc, $1e0c
    ld bc, $1e0c
    ld [bc], a
    inc c
    ld e, $01
    inc e
    ld b, $01
    inc e
    ld b, $02
    inc e
    ld b, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc c
    ld e, $02
    inc e
    ld b, $01
    inc c
    ld e, $01
    inc e
    ld b, $01
    inc e
    ld b, $00
    ld bc, $1e0c
    ld bc, $1e0c
    ld [bc], a
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc c
    ld e, $02
    inc e
    ld b, $01
    inc c
    ld e, $01
    inc e
    ld b, $01
    inc e
    ld b, $00
    ld bc, $1e0c
    ld bc, $1e0c
    ld [bc], a
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $00
    ld bc, $1e0c
    ld bc, $1e0c
    ld [bc], a
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc c
    ld e, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $01
    inc e
    ld b, $ff
    rst $20
    ld c, [hl]

    db $04, $0c, $02, $04, $1c, $01, $04, $0c, $02, $03, $1c, $01, $01, $0c, $02, $00
    db $02, $0c, $02, $02, $0c, $02, $03, $1c, $01, $01, $0c, $02, $04, $0c, $02, $03
    db $1c, $01, $01, $0c, $02, $00

    ld [bc], a
    inc c
    ld [bc], a
    ld [bc], a
    inc c
    ld [bc], a
    inc bc
    inc e
    ld bc, $0c01
    ld [bc], a
    inc b
    inc c
    ld [bc], a
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    nop
    ld [bc], a
    inc c
    ld [bc], a
    ld bc, $020c
    ld bc, $020c
    ld bc, $011c
    ld [bc], a
    inc c
    ld [bc], a
    ld [bc], a
    inc c
    ld [bc], a
    ld bc, $020c
    ld [bc], a
    inc c
    ld [bc], a
    inc bc
    inc e
    ld bc, $0c01
    ld [bc], a
    nop
    ld [bc], a
    inc c
    ld [bc], a
    ld bc, $020c
    ld bc, $020c
    ld bc, $011c
    ld [bc], a
    inc c
    ld [bc], a
    ld [bc], a
    inc c
    ld [bc], a
    ld bc, $020c
    ld [bc], a
    inc c
    ld [bc], a
    ld bc, $011c
    ld bc, $011c
    ld [bc], a
    inc e
    ld bc, $0200
    inc c
    ld [bc], a
    ld bc, $020c
    ld bc, $020c
    ld bc, $011c
    ld [bc], a
    inc c
    ld [bc], a
    ld bc, $020c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    nop
    ld bc, $020c
    ld bc, $020c
    ld [bc], a
    inc c
    ld [bc], a
    ld bc, $011c
    ld bc, $011c
    ld [bc], a
    inc e
    ld bc, $0c01
    ld [bc], a
    ld bc, $020c
    ld bc, $020c
    ld [bc], a
    inc e
    ld bc, $0c01
    ld [bc], a
    ld bc, $011c
    ld bc, $011c
    nop
    ld bc, $020c
    ld bc, $020c
    ld [bc], a
    inc e
    ld bc, $1c01
    ld bc, $1c01
    ld bc, $0c01
    ld [bc], a
    ld bc, $020c
    ld bc, $020c
    ld bc, $020c
    ld bc, $020c
    ld [bc], a
    inc e
    ld bc, $0c01
    ld [bc], a
    ld bc, $011c
    ld bc, $011c
    nop
    ld bc, $020c
    ld bc, $020c
    ld [bc], a
    inc e
    ld bc, $1c01
    ld bc, $1c01
    ld bc, $0c01
    ld [bc], a
    ld bc, $020c
    ld bc, $020c
    ld bc, $020c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    nop
    ld bc, $020c
    ld bc, $020c
    ld [bc], a
    inc e
    ld bc, $1c01
    ld bc, $1c01
    ld bc, $0c01
    ld [bc], a
    ld bc, $020c
    ld bc, $020c
    ld bc, $020c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    ld bc, $011c
    rst $38
    ld [hl], a
    ld c, a
    db $10
    rst $38
    rst $38
    rla
    ld c, a

    db $01, $30, $07, $03, $30, $07, $03, $30, $07, $02, $30, $07, $01, $30, $07, $02
    db $30, $07, $02, $30, $07, $02, $30, $07, $00, $01, $33, $08, $03, $33, $08, $03
    db $33, $08, $02, $33, $08, $01, $33, $08, $02, $33, $08, $02, $33, $08, $02, $33
    db $08, $00, $03, $08, $01, $01, $08, $01, $02, $1c, $06, $03, $08, $01, $03, $08
    db $01, $02, $1c, $06, $02, $03, $01, $00, $01, $24, $19, $01, $24, $19, $01, $25
    db $19, $01, $27, $19, $01, $24, $19, $01, $25, $19, $01, $27, $19, $01, $24, $19
    db $01, $25, $19, $01, $27, $19, $01, $24, $19, $01, $25, $19, $01, $27, $19, $01
    db $24, $19, $01, $25, $19, $01, $27, $19, $00, $03, $08, $01, $01, $08, $01, $02
    db $1c, $06, $03, $08, $01, $03, $08, $01

    ld [bc], a
    inc e
    ld b, $02
    inc bc
    ld bc, $a7ff
    ld c, a
    ld bc, $1924
    ld bc, $1924
    ld bc, $1925
    ld bc, $1927
    ld bc, $1924
    ld bc, $1925
    ld bc, $1927
    ld bc, $1924
    ld bc, $1925
    ld bc, $1927
    ld bc, $1924
    ld bc, $1925
    ld bc, $1927
    ld bc, $1924
    ld bc, $1925
    ld bc, $1927
    rst $38
    rst $00
    ld c, a

    db $01, $30, $07, $03, $30, $07, $03, $30, $07, $02, $30, $07, $01, $30, $07, $02
    db $30, $07

    ld [bc], a
    jr nc, @+$09

    ld [bc], a
    jr nc, @+$09

    rst $38
    rst $20
    ld c, a

    db $10, $20, $23, $00, $04, $ff, $02, $fe, $02, $1b, $23, $02, $20, $23, $02, $22
    db $23, $04, $24, $23, $00, $04, $22, $23, $01, $1b, $23, $01, $1d, $23, $0a, $1b
    db $23, $00, $04, $ff, $02, $fe, $02, $1f, $23, $02, $1f, $24, $02, $1d, $23, $02
    db $1b, $23, $02, $1e, $23, $00, $0c, $ff, $04, $fe, $00, $06, $1e, $23, $01, $1d
    db $23, $01, $1b, $23, $04, $17, $23, $04, $1e, $23, $00, $10, $1f, $24, $00, $10
    db $fe, $00, $04, $23, $23, $02, $fe, $02, $1e, $23, $08, $27, $23, $00, $04, $ff
    db $04, $23, $23, $04, $2a, $23, $04, $2f, $24, $00, $01, $2e, $23, $01, $2a, $23
    db $01, $29, $23, $0d, $27, $23, $00, $04, $fe, $04, $22, $24, $04, $20, $23, $04
    db $1e, $23, $00, $0e, $1e, $23, $02, $fe, $00, $01, $21, $23, $01, $20, $23, $04
    db $1e, $23, $02, $fe, $03, $21, $23, $01, $fe, $03, $2a, $23, $01, $fe, $00, $10
    db $28, $24, $00, $0c, $ff

    inc b
    cp $ff
    add hl, bc
    ld d, b

    db $01, $24, $25, $01, $23, $25, $01, $22, $25, $01, $21, $25, $01, $20, $25, $01
    db $1f, $25, $01, $1e, $25

    ld bc, $251d
    ld bc, $251c
    ld bc, $251b
    ld bc, $251a
    ld bc, $2519
    ld bc, $2518
    ld bc, $2517
    ld bc, $2516
    ld bc, $2515
    ld bc, $2514
    ld bc, $2513
    ld bc, $2512
    ld bc, $2511
    ld bc, $2510
    ld bc, $250f
    ld bc, $250e
    ld bc, $250d
    db $10
    inc c
    dec h
    inc c
    cp $ff
    pop hl
    ld d, b

    db $01, $ff, $00, $02, $1f, $05, $02, $fd, $02, $fd, $02, $fd, $02, $fd, $02, $fd
    db $02, $fd, $02, $fd, $00, $02, $1f, $05, $02, $fd, $02, $fd, $02, $fd, $02, $fd
    db $02, $fd, $02, $fd, $02, $fd, $ff, $33, $50, $02, $28, $02, $02, $18, $15, $02
    db $29, $02, $02, $18, $15, $02, $2b, $02, $02, $18, $15, $02, $28, $02, $02, $18
    db $15, $00, $02, $2b, $02, $02, $18, $15, $02, $29, $02, $02, $18, $15, $02, $28
    db $02, $02, $18, $15, $02, $2b, $02, $02, $18, $15, $00, $04, $1c, $24, $02, $fe
    db $02, $18, $23, $08, $1f, $23, $00, $04, $ff, $02, $fe, $01, $1c, $23, $01, $1d
    db $23, $02, $1f, $23, $02, $1d, $23, $02, $1c, $23, $02, $1a, $23, $00, $06, $ff
    db $02, $fe, $08, $1f, $23, $00, $04, $ff, $04, $1f, $24, $04, $21, $23, $04, $23
    db $23, $00, $06, $24, $24, $01, $23, $23, $01, $24, $23, $08, $21, $23, $00, $06
    db $ff, $02, $fe, $08, $1d, $23, $00, $01, $1c, $23, $01, $1d, $23, $0a, $1f, $23
    db $02, $fe, $01, $1d, $23, $01, $1c, $23, $00, $0c, $1a, $23, $04, $fe, $00, $04
    db $17, $23, $04, $18, $23, $04, $1a, $23, $04, $1f, $24, $00, $01, $2b, $23, $01
    db $26, $23, $02, $23, $23, $01, $26, $23, $01, $23, $23, $02, $1f, $23, $01, $23
    db $23, $01, $1f, $23, $02, $1a, $23, $01, $1f, $23, $01, $1a, $23, $02, $17, $23
    db $00, $01, $2b, $23, $01, $26, $23, $02, $23, $23, $01, $26, $23, $01, $23, $23
    db $02, $1f, $23, $01, $23, $23, $01, $1f, $23, $02, $1a, $23, $01, $1f, $23, $01
    db $1a, $23, $02, $17, $23, $ff, $4b, $50, $02, $24, $02, $02, $18, $15, $02, $1f
    db $02, $02, $18, $15, $02, $1c, $02, $02, $18, $15, $02, $18, $02, $02, $18, $15
    db $00, $02, $2b, $02, $02, $18, $15, $02, $29, $02, $02, $18, $15, $02, $28, $02
    db $02, $18, $15, $02, $2b, $02, $02, $18, $15, $ff, $63, $50

    db $02, $30, $08, $02, $30, $08, $02, $30, $09, $02, $30, $09, $02, $30, $0a, $02
    db $30, $0a, $02, $30, $0b, $02, $30, $0b, $00, $02, $30, $0a, $02, $30, $0a, $02
    db $30, $09, $02, $30, $09, $02, $30, $08, $02, $30, $08, $02, $30, $07, $02, $30
    db $07, $00, $02, $0c, $01, $01, $0c, $01, $01, $fe, $02, $1c, $06, $02, $0c, $01
    db $02, $0b, $01, $01, $0c, $01, $01, $fe, $02, $1c, $06, $02, $00, $01, $00, $01
    db $18, $23, $03, $fe, $04, $24, $23, $01, $16, $23, $01, $17, $23, $02, $18, $23
    db $02, $13, $23, $02, $0c, $23, $00, $02, $0c, $01, $01, $0c, $01, $01, $fe, $02
    db $1c, $06, $02, $0c, $01, $02, $0b, $01, $01, $0c, $01, $01, $fe, $02, $1c, $06
    db $02, $00, $01, $ff, $7d, $50, $01, $18, $23, $03, $fe, $04, $24, $23, $01, $16
    db $23, $01, $17, $23, $02, $18, $23, $02, $13, $23, $02, $0c, $23, $ff, $9d, $50
    db $02, $30, $0a, $02, $30, $0a, $02, $30, $09, $02, $30, $09, $02, $30, $08, $02
    db $30, $08, $02, $30, $07, $02, $30, $07, $ff, $bd, $50

    ld bc, $0a24
    ld bc, $00fe
    nop
    nop

    db $05, $24, $2a, $00

    nop

    db $00, $07, $2b, $2b

    nop
    nop

    db $00

    db $05, $2b, $2c, $00

    nop

    db $00, $04, $24, $2d, $00

    nop

    db $00, $03, $24, $2e, $03, $fe, $00

    nop

    db $00

    ld [$2f28], sp
    nop
    nop

    db $00

    db $08, $28, $30, $00

    nop

    db $00

    ld a, [bc]
    inc h
    dec bc
    nop
    nop

    db $00

    db $02, $24, $0c, $06, $fe

    nop
    nop
    nop

    db $0c, $28, $31

    nop
    nop

    db $00

    ld [bc], a
    rra
    ld [hl-], a
    nop
    nop

    db $00, $01, $30, $33, $01, $fe, $00

    nop

    db $00

    db $03, $29, $34, $00

    nop

    db $00

    db $01, $3c, $35, $01, $ff, $01, $3c, $35, $01, $ff, $01, $3c, $35, $01, $ff, $01
    db $3c, $35, $01, $ff, $01, $3c, $35, $01, $ff, $01, $3c, $35, $01, $ff, $00

    nop

    db $00

    ld bc, $362b
    ld [bc], a
    cp $00
    nop

    db $00

    db $0a, $24, $0d

    nop
    nop
    nop

    db $06, $24, $0e, $00

    nop

    db $00, $08, $24, $0f, $00

    nop

    db $00, $04, $18, $10, $02, $fe, $00

    nop

    db $00, $06, $24, $11, $00

    nop

    db $00

    ld a, [bc]
    ld hl, $0037
    nop

    db $00

    db $05, $37, $38, $00

    nop

    db $00

    dec c
    jr nc, @+$14

    nop
    nop
    nop

    db $06, $2d, $39, $05, $fe, $00

    nop

    db $00

    ld b, $2b
    ld a, [hl-]
    ld b, $fe
    nop
    nop

    db $00

    db $01, $24, $13, $00

    nop

    db $00, $0a, $29, $3b

    nop
    nop

    db $00, $0a, $24, $14, $09, $fe

    nop
    nop

    db $00

    db $01, $24, $00, $00

    nop

    db $00

    inc bc
    inc h
    inc a
    ld bc, $03fe
    dec h
    inc a
    ld bc, $03fe
    inc h
    inc a
    ld bc, $03fe
    dec h
    inc a
    ld bc, $03fe
    inc h
    inc a
    ld bc, $03fe
    dec h
    inc a
    ld bc, $03fe
    inc h
    inc a
    ld bc, $03fe
    dec h
    inc a
    ld bc, $03fe
    inc h
    inc a
    ld bc, $03fe
    dec h
    inc a
    ld bc, $00fe
    nop
    nop
    db $10
    cp $ff
    db $dd
    ld d, b

    db $01, $01, $01, $00, $00, $01, $5e

    db $ff, $00

    nop
    db $08
    ld e, [hl]

    db $ff, $01

    nop
    dec c
    ld e, [hl]

    db $ff, $02, $00, $12, $5e, $ff, $00, $00, $17, $5e, $ff, $00, $00, $00, $1c, $5e

    rst $38
    nop
    nop
    ld [hl+], a
    ld e, [hl]
    inc d
    nop
    nop
    ld [bc], a
    ld bc, $0200
    rst $38
    rst $38
    ld [bc], a
    rst $38
    rst $38
    ld [bc], a
    ld bc, $0000
    ld a, [hl+]
    ld e, [hl]
    inc bc
    ld a, [bc]
    nop
    inc bc
    or $ff
    inc bc
    or $ff
    inc bc
    ld a, [bc]
    nop
    nop
    add hl, sp
    ld e, [hl]

    db $03, $05, $00, $03, $fb, $ff, $03, $fb, $ff, $03, $05, $00, $00, $48, $5e, $14
    db $00, $00, $03, $02, $00, $03, $fe, $ff, $03, $fe, $ff, $03, $02, $00, $00, $5a
    db $5e, $03, $01, $00, $03, $ff, $ff, $03, $ff, $ff, $03, $01, $00, $00, $69, $5e

    add b
    ld bc, $1600
    ld e, [hl]
    ld a, [de]
    ld e, [hl]
    db $11
    ld e, [hl]

    db $00, $51, $91, $87, $5e, $16, $5e, $ff, $44

    nop
    adc b
    ld e, [hl]
    nop
    ld b, a
    ld bc, $5e9a
    ld d, $5e

    db $20, $41, $01, $9a, $5e, $9a, $5e, $ff, $13

    nop
    sbc e
    ld e, [hl]

    db $80, $44, $01, $a6, $5e, $16, $5e, $ff, $32

    nop
    and a
    ld e, [hl]

    db $b5, $5e, $7a, $48, $16, $5e, $d5, $61, $11, $5e, $04, $20, $ff, $40

    nop
    or [hl]
    ld e, [hl]

    db $66, $5f, $7a, $48, $16, $5e, $cf, $61, $11, $5e

    ld h, [hl]
    ld e, a
    ld a, d
    ld c, b
    ret nc

    ld e, [hl]
    ld a, [de]
    ld e, [hl]
    ld de, $015e
    inc c
    rst $38
    nop
    nop
    pop de
    ld e, [hl]
    ld h, [hl]
    ld e, a
    ld a, d
    ld c, b
    ld d, $5e
    ld h, a
    ld e, [hl]
    ld de, $665e
    ld e, a
    ld a, d
    ld c, b
    ld d, $5e
    ld [$115e], a
    ld e, [hl]
    inc bc
    ld [bc], a
    nop
    inc bc
    cp $ff
    inc bc
    cp $ff
    inc bc
    ld [bc], a
    nop
    inc bc
    ld [bc], a
    nop
    inc bc
    cp $ff
    inc bc
    cp $ff
    inc bc
    ld [bc], a
    nop
    inc bc
    ld [bc], a
    nop
    inc bc
    cp $ff
    inc bc
    cp $ff
    inc bc
    ld [bc], a
    nop
    inc bc
    ld [bc], a
    nop
    inc bc
    cp $ff
    inc bc
    cp $ff
    inc bc
    ld [bc], a
    nop
    inc bc
    ld [bc], a
    nop
    inc bc
    cp $ff
    inc bc
    cp $ff
    inc bc
    ld [bc], a
    nop
    inc bc
    ld [bc], a
    nop
    inc bc
    cp $ff
    inc bc
    cp $ff
    inc b
    db $fc
    rst $38
    inc b
    inc bc
    nop
    nop
    ld sp, $435f
    ld e, a
    ld a, d
    ld c, b
    ld d, $5e
    ld c, e
    ld e, a
    ld de, $285e
    jr nz, jr_006_5fab

    ld b, b
    rst $38
    ld h, b
    nop
    ld b, h
    ld e, a
    ld e, $00
    nop
    inc b
    ld bc, $0400
    rst $38
    rst $38
    nop
    ld d, b
    ld e, a
    ld h, [hl]
    ld e, a
    ld l, e
    ld e, a
    ld d, $5e
    ld a, [de]
    ld e, [hl]
    ld de, $035e
    ld h, b
    inc bc
    ld b, b

    db $ff, $20

    nop
    ld h, a
    ld e, a
    inc b
    ld b, b
    rst $38
    ld h, b
    nop
    ld l, h
    ld e, a
    ld a, h
    ld e, a
    ld a, d
    ld c, b
    ld d, $5e
    ld a, [de]
    ld e, [hl]
    ld de, $065e
    jr nz, @+$01

    ld b, b
    nop
    ld a, e
    ld c, b
    rst $38
    ld h, b
    nop
    add h
    ld e, a
    ld [bc], a
    jr nz, @+$01

    ld b, b
    nop
    adc c
    ld e, a

    db $02, $20, $08, $40, $ff, $60

    nop
    ld a, e
    ld c, b
    and d
    ld e, a
    xor e
    ld e, a
    or d
    ld e, a
    ld h, a
    ld e, [hl]
    ld de, $0a5e
    ld h, b
    ld a, [bc]
    ld b, b
    rst $38
    jr nz, jr_006_5faa

jr_006_5faa:
    ld h, a

jr_006_5fab:
    ld e, a
    ld a, [bc]
    ld b, b
    rst $38
    ld h, b
    nop
    ld a, e
    ld c, b
    ld bc, $0100
    inc bc
    ld bc, $0107
    inc c
    ld bc, $0107
    inc bc
    nop
    or e
    ld e, a

    db $8f, $5f, $7a, $48, $11, $60, $1a, $5e, $11, $5e, $8f, $5f, $7a, $48, $1a, $60
    db $1a, $5e, $11, $5e, $8f, $5f, $7a, $48, $23, $60, $1a, $5e, $11, $5e, $8f, $5f
    db $7a, $48, $2a, $60, $1a, $5e, $11, $5e, $8f, $5f, $7a, $48, $31, $60, $1a, $5e
    db $11, $5e

    adc a
    ld e, a
    ld a, d
    ld c, b
    jr c, @+$62

    ld a, [de]
    ld e, [hl]
    ld de, $8f5e
    ld e, a
    ld a, d
    ld c, b
    ccf
    ld h, b
    ld a, [de]
    ld e, [hl]
    ld de, $8f5e
    ld e, a
    ld a, d
    ld c, b
    ld b, [hl]
    ld h, b
    ld a, [de]
    ld e, [hl]
    db $11
    ld e, [hl]

    db $02, $fc, $02, $00, $02, $03, $00, $12, $60, $02, $fb, $02, $00, $02, $04, $00
    db $1b, $60, $02, $00, $02, $05, $00, $24, $60, $02, $00, $02, $06, $00, $2b, $60
    db $02, $00, $02, $07, $00, $32, $60

    ld [bc], a
    nop
    ld [bc], a
    ld [$3900], sp
    ld h, b
    ld [bc], a
    nop
    ld [bc], a
    add hl, bc
    nop
    ld b, b
    ld h, b
    ld [bc], a
    nop
    ld [bc], a
    ld a, [bc]
    nop
    ld b, a
    ld h, b
    add b
    jr c, jr_006_6072

    sbc [hl]
    ld h, b
    ld a, [hl]
    ld h, b
    ld de, $015e
    dec b
    ld bc, $0109
    db $f4
    ld bc, $010d
    db $ec
    ld bc, $0128
    inc d
    ld bc, $01fe
    ld [$0201], sp
    ld bc, $0101
    inc de
    ld bc, $0128

jr_006_6072:
    ld e, $01
    dec b
    ld bc, $0107
    ld [bc], a
    ld bc, $01ec
    dec b
    nop
    ld d, a
    ld h, b
    inc d
    dec b
    nop
    inc d
    ld a, [$00ff]
    add b
    ld h, b

    db $80, $c1, $21, $91, $60, $67, $5e, $11, $5e, $01, $0c, $01, $00, $01, $08, $01
    db $05, $01, $00, $00, $92, $60

    ld [bc], a
    nop
    ld [bc], a
    inc bc
    ld [bc], a
    ld [$9f00], sp
    ld h, b
    nop
    rra
    rst $30
    or b
    ld h, b
    ld h, a
    ld e, [hl]
    ld de, $045e
    nop
    inc b
    inc bc
    inc b
    ld b, $04
    add hl, bc
    inc b
    inc c
    inc b
    rrca
    nop
    or c
    ld h, b
    add b
    or e
    ld hl, $60c8
    ld a, [de]
    ld e, [hl]
    ld de, $025e
    nop
    ld [bc], a
    dec b
    ld [bc], a
    ld a, [bc]
    nop
    ret


    ld h, b

    db $80, $a8, $a4, $16, $5e, $55, $5e, $11, $5e, $01, $ec, $ff, $05, $04, $00, $00
    db $57, $5e, $80, $a8, $a4, $16, $5e, $d9, $60, $11, $5e

    nop
    ld a, [c]
    ld hl, $6011
    ld e, b
    ld e, [hl]
    db $11
    ld e, [hl]

    db $40, $e8, $e7, $31, $60, $fd, $60, $11, $5e, $03, $01, $00, $03, $ff, $ff

    inc bc
    ld bc, $0300
    rst $38
    rst $38
    inc b
    ld [bc], a
    nop
    inc b
    db $ec
    rst $38
    nop
    dec bc
    ld h, c

    db $80, $c2, $21, $25, $61, $1b, $61, $11, $5e, $5a, $00, $00, $ff, $ff, $ff

    nop
    dec e
    ld h, c

    db $01, $00, $01, $05, $01, $09, $00, $26, $61

    db $80, $e1, $21, $4c, $61, $36, $61, $07, $5e, $01, $4c, $04, $01, $64, $00, $ff
    db $b0, $ff

    nop
    jr c, @+$63

    db $80, $f1, $21, $4c, $61, $52, $61, $07, $5e, $01, $00, $01, $02, $00, $4d, $61
    db $01, $72, $06, $ff, $c4, $ff

    nop
    ld d, h
    ld h, c

    db $60, $c2, $11, $65, $61, $46, $5e, $83, $61, $01, $00, $01, $0c, $ff, $00

    nop
    ld h, [hl]
    ld h, c
    ld h, b
    pop hl
    ld de, $6165
    db $76
    ld h, c
    add e
    ld h, c
    ld bc, $074f
    nop
    ld a, b
    ld h, c
    ld bc, $0739
    nop
    ld a, [hl]
    ld h, c

    db $01, $00, $ff, $01

    nop
    add h
    ld h, c

    db $40, $83, $11, $93, $61, $58, $5e, $11, $5e, $06, $00, $01, $0c, $00, $94, $61

    db $40, $72, $21, $a3, $61, $1a, $5e, $11, $5e, $01, $00, $01, $0c, $00, $a4, $61

    add b
    pop bc
    ld hl, $61b3
    ld h, a
    ld e, [hl]
    ld de, $015e
    inc c
    ld bc, $0100
    rlca
    ld bc, $0103
    nop
    nop
    or h
    ld h, c
    add b
    rst $00
    ld bc, $61c9
    ld h, a
    ld e, [hl]
    ld de, $015e
    db $f4
    ld [$0000], sp
    db $ca
    ld h, c

    db $01, $ce, $ff, $32, $01, $00

    db $0c, $00, $00, $03, $02, $00

    inc bc
    cp $ff
    inc bc
    cp $ff
    inc bc
    ld [bc], a
    nop
    inc bc
    inc bc
    nop
    inc bc
    db $fd
    rst $38
    inc bc
    db $fd
    rst $38
    inc bc
    inc bc
    nop
    inc bc
    inc b
    nop
    inc bc
    db $fc
    rst $38
    inc bc
    db $fc
    rst $38
    inc bc
    inc b
    nop
    nop
    jp c, Jump_000_0461

    jr nz, @+$01

    ld b, b
    nop
    ld bc, $ff62
    ld h, b
    nop
    ld [$1462], sp
    jr nz, @+$16

    ld b, b
    rst $38
    ld h, b
    rst $38
    ld h, b
    nop
    ld a, e
    ld c, b

    db $80, $52, $21, $20, $62, $67, $5e, $11, $5e, $01, $00, $01, $05, $00, $21, $62

    ret nz

    ld c, $f7
    ld d, $5e
    ld b, [hl]
    ld e, [hl]
    db $11
    ld e, [hl]

    db $3a, $62, $7a, $48, $16, $5e, $58, $5e, $11, $5e, $04, $20, $ff, $40

    nop
    dec sp
    ld h, d
    dec b
    inc b
    nop
    dec b
    db $fc
    rst $38
    dec b
    db $fc
    rst $38
    dec b
    inc b
    nop
    nop
    ld b, d
    ld h, d
    add b
    pop hl
    ld h, d
    ld d, $5e
    ld e, b
    ld h, d
    ld de, $015e
    nop
    nop
    ld bc, $ff3c
    ld bc, $ff20
    ld bc, $ff18
    ld bc, $ff77
    ld bc, $ffb4
    rst $38
    db $ec
    rst $38
    nop
    ld l, h
    ld h, d

    db $80, $d2, $a3, $7a, $62, $80, $62, $11, $5e, $01, $0c, $05, $00, $00, $7b, $62
    db $02, $00, $00, $ff, $02, $00

    add d
    ld h, d
    add b
    xor b
    and e
    ld d, $5e
    sub c
    ld h, d
    ld de, $015e
    ldh a, [rIE]
    inc b
    inc b
    nop
    nop
    jp c, Jump_000_0a61

    nop
    nop
    inc bc
    ld [bc], a
    nop
    inc bc
    cp $ff
    nop
    sbc a
    ld h, d
    add b
    ld hl, sp+$61
    or b
    ld h, d
    ld e, b
    ld e, [hl]
    ld de, $015e
    db $f4
    ld bc, $0100
    inc c
    ld bc, $0000
    or c
    ld h, d

    db $60, $f3, $e2, $c4, $62, $1a, $5e, $11, $5e, $04, $00, $04, $03, $04, $06, $04
    db $09, $00, $c5, $62

    dec b
    nop
    nop
    dec b
    ld a, [bc]
    nop
    rst $38
    cp $ff
    nop
    ret nc

    ld h, d

    db $60, $e2, $c1, $ed, $62, $e3, $62, $11, $5e, $01, $01, $00, $01, $ff, $ff, $00
    db $e5, $62, $03, $00, $01, $0c, $01, $f4, $00, $ee, $62, $60, $e3, $c1, $ed, $62
    db $e3, $62, $11, $5e, $80, $e2, $c1, $08, $63, $1a, $5e, $11, $5e, $01, $f4, $02
    db $00, $06, $0c, $00, $09, $63, $01, $01, $00, $01, $ff, $ff, $00, $12, $63, $80
    db $c3, $c1, $23, $63, $10, $63, $11, $5e, $01, $00, $05, $f4, $00, $24, $63, $c0
    db $f4, $41, $33, $63, $3f, $63, $11, $5e, $01, $00, $01, $03, $01, $06, $01, $09
    db $01, $0c, $00, $34, $63, $ff, $01, $00

    nop
    ld b, c
    ld h, e
    add b
    ld e, c
    pop bc
    ld c, a
    ld h, e
    ld a, [de]
    ld e, [hl]
    ld de, $015e
    nop
    ld bc, $0101
    ld [bc], a
    ld bc, $0103
    inc b
    ld bc, $0105
    ld b, $01
    rlca
    ld bc, $0108
    add hl, bc
    ld bc, $010a
    dec bc
    ld bc, $010c
    dec c
    ld bc, $010e
    rrca
    ld bc, $0110
    ld de, $1201
    ld bc, $0113
    inc d
    nop
    ld d, b
    ld h, e
    ld bc, $1388
    ld bc, $fffb
    ld bc, $0002
    nop
    ld a, l
    ld h, e

    db $00, $f4, $41, $16, $5e, $90, $63, $11, $5e, $04, $08, $00, $04, $f6, $ff, $00
    db $92, $63

    db $80, $f2, $41, $a3, $63, $a9, $63, $11, $5e, $01, $f4, $ff, $00

    nop
    and h
    ld h, e

    db $01, $e2, $ff, $01, $1e, $00, $01, $e2, $ff, $01, $fe, $ff, $01, $fb, $ff, $01
    db $f6, $ff, $ff, $ec, $ff

    nop
    xor e
    ld h, e
    nop
    push bc
    ld b, c
    ret


    ld h, e
    ld d, $5e
    inc b
    ld d, [hl]
    rst $38
    ld d, h
    nop
    db $ca
    ld h, e

    db $80, $e8, $a3, $d9, $63, $df, $63, $11, $5e, $04, $05, $0c, $00, $00, $da, $63
    db $04, $0a, $00, $01, $d8, $ff, $00, $e1, $63

    ld b, b
    ld hl, sp-$0d
    ld d, $5e
    pop af
    ld h, e
    ld de, $0c5e
    ld b, $00
    ld bc, $ffb8
    nop
    di
    ld h, e

    db $80, $c2, $41, $16, $5e, $03, $64, $11, $5e, $07, $05, $00, $07, $fb, $ff, $00
    db $05, $64

    db $80, $c1, $51, $16, $64, $1a, $5e, $0c, $5e, $01, $0f, $ff, $05

    nop
    rla
    ld h, h

    db $80, $f1, $c1, $2c, $64, $25, $64, $11, $5e, $ff, $0a, $00

    nop
    daa
    ld h, h

    db $01, $00, $01, $01, $00, $2d, $64, $80, $a1, $11, $3c, $64, $44, $64, $11, $5e
    db $01, $0c, $01, $00, $01, $01, $00, $3f, $64, $ff, $01, $00

    nop
    ld b, [hl]
    ld h, h

    db $00, $f8, $f1, $54, $64, $1a, $5e, $0c, $5e, $01, $00, $01, $02, $01, $04, $01
    db $06, $01, $08, $00, $55, $64

    add b

Jump_006_6463:
    di
    pop bc
    ld l, d
    ld h, h
    ld a, [de]
    ld e, [hl]
    inc c
    ld e, [hl]
    ld bc, $0105
    inc b
    ld bc, $0103
    ld [bc], a
    ld bc, $0101
    nop
    nop
    ld l, e
    ld h, h

    db $80, $f3, $a7, $16, $5e, $81, $64, $00, $5e, $01, $dc, $05, $ff, $08, $00

    nop
    add e
    ld h, h
    add b
    pop af
    ld b, c
    sub d
    ld h, h
    ld d, $5e
    ld [bc], a
    ld b, h
    ld bc, HeaderTitle
    dec h
    rst $38
    ld [hl+], a
    nop
    sub e
    ld h, h

    db $00, $58, $87, $a4, $64, $16, $5e, $03, $46, $03, $44, $03, $42, $03, $35, $03
    db $33, $03, $31, $02, $23, $02, $22, $02, $21, $02, $20, $ff, $20

    nop
    and l
    ld h, h

    db $00, $c3, $a1, $c4, $64, $16, $5e, $02, $33, $02, $34, $02, $35, $02, $36, $02
    db $37, $02, $43, $02, $44, $02, $45, $02, $46, $02, $47, $02, $53, $02, $54, $02
    db $55, $02, $56, $02, $57, $ff, $54

    nop
    push bc
    ld h, h

    db $00, $e4, $41, $ee, $64, $16, $5e, $0a, $55, $0a, $54, $0a, $53, $00, $ef, $64

    db $00, $e2, $41, $fe, $64, $16, $5e, $01, $1b, $01, $1c, $01, $1d, $01, $1e, $01
    db $1f, $01, $28, $01, $29, $01, $2a, $01, $2b, $01, $2c, $01, $2d, $01, $2e, $01
    db $2f, $01, $38, $01, $39, $01, $3a, $01, $3b, $01, $3c, $01, $3d, $01, $3e, $01
    db $3f, $02, $48, $02, $4a, $02, $48, $02, $4a, $02, $48, $02, $4a, $02, $48, $ff
    db $4a

    nop
    rst $38
    ld h, h

    db $00, $e3, $41, $42, $65, $16, $5e, $02, $32, $02, $33, $02, $34, $02, $35, $02
    db $36, $02, $37, $02, $43, $02, $44, $02, $45, $02, $46, $02, $47, $02, $54, $02
    db $55, $02, $56, $ff, $57

    nop
    ld b, e
    ld h, l

    db $00, $e1, $e1, $6a, $65, $16, $5e, $03, $2a, $03, $29, $03, $28, $00, $6b, $65

    nop
    ld a, b
    ld b, c
    ld a, d
    ld h, l
    ld d, $5e
    inc d
    inc [hl]
    nop
    ld a, e
    ld h, l

    db $80, $69, $d2, $86, $65, $16, $5e, $02, $56, $02, $54, $02, $52, $02, $46, $02
    db $44, $02, $42, $02, $40

    ld bc, $0136
    inc [hl]
    ld bc, $0132
    jr nc, jr_006_659f

    ld [hl-], a

jr_006_659f:
    ld bc, $0034
    sub l
    ld h, l

    db $80, $f4, $e5, $aa, $65, $16, $5e, $03, $53, $03, $46, $03, $45, $03, $44, $00
    db $ad, $65

    nop
    ld l, c
    or d
    cp h
    ld h, l
    ld d, $5e
    ld [bc], a
    ld h, [hl]
    ld [bc], a
    ld h, h
    ld [bc], a
    ld d, [hl]
    ld [bc], a
    ld d, h
    ld [bc], a
    ld b, [hl]
    ld [bc], a
    ld b, h
    ld [bc], a
    ld [hl], $02
    inc [hl]
    ld [bc], a
    ld h, $02
    inc h
    rst $38
    inc h
    inc d
    ld h, [hl]
    nop
    db $d3
    ld h, l

    db $80, $01, $01, $16, $5e, $1a, $5e, $11, $5e, $00, $01, $01, $1b, $5e, $16, $5e
    db $7a, $48, $7a, $48, $16, $5e, $1a, $5e, $11, $5e
    WaveRAMPiss:
    db $f0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

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
    rst $38
    rst $38
    rst $38
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

    db $00, $11, $22, $33, $44, $55, $66, $77, $88, $99, $aa, $bb, $cc, $dd, $ee, $ff
    db $06, $30, $ff, $06, $31, $ff, $06, $32, $00, $06, $33, $00, $06, $34, $00, $06
    db $35, $00, $06, $36, $00, $06, $37, $00, $06, $38, $00, $06, $39, $00, $06, $3a
    db $00, $06, $3b, $00, $06, $3c, $00, $06, $3d, $00, $06, $3e, $00, $06, $3f, $00
    db $06, $3f, $ff, $06, $3e, $ee, $06, $3d, $dd, $06, $3c, $cc, $06, $3b, $bb, $06
    db $3a, $aa, $06, $39, $99, $06, $38, $88, $06, $37, $77, $06, $36, $66, $06, $35
    db $55, $06, $34, $44, $06, $33, $33, $06, $32, $22, $06, $31, $11, $06, $30, $00
    db $00, $42, $66

    sub b
    jr nc, @-$64

    nop
    and l
    ld h, [hl]
    sbc d
    add a
    sbc e
    sbc e
    call $caff
    cp h
    cp e
    call c, $9696
    ld h, a
    ld h, l
    ld h, [hl]
    ld hl, $ecff
    and a
    ld d, e
    ld [hl-], a
    ld [hl+], a
    inc hl
    inc hl
    ld [hl+], a
    ld hl, $2511
    ld a, c
    cp l
    xor $ee
    rst $38
    jr nc, @+$01

    nop
    bit 4, [hl]

    db $07, $30, $f0, $07, $30, $ff, $07, $31, $f0, $07, $31, $ff, $07, $32, $f0, $07
    db $32, $ff, $07, $33, $f0, $07, $33, $ff, $07, $34, $f0, $07, $34, $ff, $07, $35
    db $f0, $07, $35, $ff, $07, $36, $f0, $07, $36, $ff, $07, $37, $f0, $07, $37, $ff
    db $07, $38, $f0, $07, $38, $ff, $07, $39, $f0, $07, $39, $ff, $07, $3a, $f0, $07
    db $3a, $ff, $07, $3b, $f0, $07, $3b, $ff, $07, $3c, $f0, $07, $3c, $ff, $07, $3d
    db $f0, $07, $3d, $ff, $07, $3e, $f0, $07, $3e, $ff, $07, $3f, $f0, $07, $3f, $00
    db $07, $3e, $f0, $07, $3e, $00, $07, $3d, $f0, $07, $3d, $00, $07, $3c, $f0, $07
    db $3c, $00, $07, $3b, $f0, $07, $3b, $00, $07, $3a, $f0, $07, $3a, $00, $07, $39
    db $f0, $07, $39, $00, $07, $38, $f0, $07, $38, $00, $07, $37, $f0, $07, $37, $00
    db $07, $36, $f0, $07, $36, $00, $07, $35, $f0, $07, $35, $00, $07, $34, $f0, $07
    db $34, $00, $07, $33, $f0, $07, $33, $00, $07, $32, $f0, $07, $32, $00, $07, $31
    db $f0, $07, $31, $00, $00, $d1, $66

    inc bc
    inc [hl]
    ldh a, [$03]
    inc [hl]
    rst $38
    inc bc
    dec [hl]
    ldh a, [$03]
    dec [hl]

jr_006_6793:
    rst $38
    inc bc
    ld [hl], $f0
    inc bc
    ld [hl], $ff
    inc bc
    scf
    ldh a, [$03]
    scf
    rst $38
    inc bc
    jr c, jr_006_6793

    inc bc
    jr c, @+$01

    inc bc
    add hl, sp
    ldh a, [$03]
    add hl, sp
    rst $38
    inc bc
    add hl, sp
    ldh a, [$03]
    add hl, sp
    nop
    inc bc
    jr c, @-$0e

    inc bc
    jr c, jr_006_67b8

jr_006_67b8:
    inc bc
    scf
    ldh a, [$03]
    scf
    nop
    inc bc
    ld [hl], $f0
    inc bc
    ld [hl], $00
    inc bc
    dec [hl]
    ldh a, [$03]
    dec [hl]
    nop
    inc bc
    inc [hl]
    ldh a, [$03]
    inc [hl]
    nop
    nop
    adc b
    ld h, a
    dec l
    dec l
    jr nz, @+$56

    ld c, b
    ld b, l
    jr nz, jr_006_6820

    ld c, [hl]
    ld b, h
    jr nz, jr_006_680c

    dec l
    ld [$080f], sp
    rrca
    dec bc
    rrca
    dec bc
    ld c, $09
    ld c, $08
    rrca
    ret nz

    nop
    rra
    rst $38
    ret nz

    rst $38
    ldh [$9f], a
    sub b
    sbc a
    ld [$0807], sp
    rlca
    add b
    sbc a
    inc bc
    nop
    rst $38
    rst $38
    nop
    rst $38
    ld [bc], a
    rst $38
    ld h, $fc
    ld h, b
    call z, $c609
    ld [de], a
    db $ed

jr_006_680c:
    ld b, b
    ldh a, [$80]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [$80]
    ld [hl], b
    nop
    ldh a, [$80]
    ld [hl], b
    ld [$080f], sp
    rrca

jr_006_6820:
    ld [$080f], sp
    rrca
    ld [$000f], sp
    rrca
    inc b
    inc bc
    ld bc, $6000
    sbc a
    inc b
    rst $38
    dec c
    ld sp, hl
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add b
    ld a, a
    dec b
    ld a, [$f58a]
    add l
    ld a, [hl-]
    ld a, [bc]
    push af
    dec b
    ld a, [$fd02]
    nop
    rst $38
    ld bc, $40fe
    or b
    and b
    ld d, b
    ld b, b

jr_006_6851:
    or b
    and b
    ld d, b
    ld b, b
    or b
    add b
    ld [hl], b
    jr nz, @-$3e

    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc hl
    jr jr_006_6880

    jr nz, jr_006_6872

    jr nz, jr_006_6874

    jr nz, jr_006_6886

    jr nz, jr_006_686d

jr_006_686d:
    nop
    nop
    nop
    nop
    nop

jr_006_6872:
    ld a, a
    rst $38

jr_006_6874:
    db $fd
    rst $38
    ld a, [$f5ff]
    rst $38
    ld [$00ff], a
    nop
    nop
    nop

jr_006_6880:
    nop

jr_006_6881:
    nop
    cp $ff
    ld b, b
    rst $38

jr_006_6886:
    add b
    rst $00
    jr jr_006_6851

    inc e
    rst $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nc, jr_006_690d

    nop
    ld a, h
    nop
    ld c, h
    jr nc, @+$4e

    jr nc, jr_006_68b8

    jr nz, jr_006_68ba

    jr nz, jr_006_68bc

    jr nz, jr_006_68bc

    jr nz, jr_006_68c1

    jr nz, jr_006_68c6

    jr nz, jr_006_68c8

    jr nz, jr_006_68ca

    jr nz, jr_006_6881

    rst $38
    xor b
    rst $38
    ld d, b
    rst $38
    and b
    ld a, a
    nop
    nop
    rst $38
    nop

jr_006_68b8:
    rst $38
    nop

jr_006_68ba:
    nop
    rst $38

jr_006_68bc:
    inc e
    rst $00
    inc e
    rst $00
    inc e

jr_006_68c1:
    rst $00
    dec c
    cp $00
    nop

jr_006_68c6:
    rst $38
    nop

jr_006_68c8:
    rst $38
    nop

jr_006_68ca:
    nop
    rst $38
    ld a, h
    nop
    ld a, h
    nop
    ld a, h
    nop
    ld a, h
    nop
    db $fc
    nop
    db $fc
    nop
    db $fc
    nop
    ld a, h
    add b
    ld e, $21
    ld e, $21
    ld e, $21
    ld e, $21
    ld e, $21
    ld e, $21
    ld e, $21
    ld e, $21
    nop
    rst $38
    ld l, e
    sub h
    nop
    rst $38
    ld e, d
    and l
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
    call nc, Call_000_002b
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
    inc a

jr_006_690d:
    ret nz

    inc a
    ret nz

    inc a
    ret nz

    inc a
    ret nz

jr_006_6914:
    inc a
    ret nz

    inc a
    ret nz

    inc a
    ret nz

    inc a
    ret nz

    ld b, $21

jr_006_691e:
    ld [bc], a
    dec h
    ld [hl], $0d
    ld a, $01
    rra
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld d, l
    xor d
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
    nop
    rst $38
    nop
    rst $38
    ld d, l
    xor d
    nop
    nop
    nop
    nop
    nop
    nop
    inc h
    ret nz

    jr nz, jr_006_6914

    jr nc, jr_006_691e

    inc a
    ret nz

    ld a, b
    add b
    nop
    nop

jr_006_6958:
    nop
    nop
    nop
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
    ld bc, $0304
    add hl, bc
    rlca
    inc bc
    rrca
    nop
    nop
    nop
    nop
    jr nz, jr_006_6991

    sub l
    ld a, a
    ld a, [hl]
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $20
    jp RST_00


    nop
    nop
    inc b
    ld hl, sp+$55
    cp $ea
    rst $38
    ld d, l
    rst $38
    add b
    rst $38
    and h
    jp RST_00


    nop
    nop
    nop

jr_006_6991:
    nop
    nop
    nop
    ld b, b
    add b
    jr nz, jr_006_6958

    sub b
    ldh [rP1], a
    ldh a, [rNR13]
    rrca

jr_006_699e:
    rlca
    rra
    dec hl
    rra
    rlca
    ccf
    dec bc
    ccf
    dec d
    ccf
    ld c, $3f
    rra
    ccf
    jp $8181


    add c
    add c
    add c
    add c
    add c
    add c
    add c
    add b
    add c
    nop
    add c
    nop
    add c

jr_006_69bc:
    jp nz, $8081

    add c
    add b
    add c
    add b
    add c
    nop
    add c
    nop
    add c
    nop
    add c
    nop
    add c
    jr z, jr_006_699e

    ld d, b
    xor b
    inc l
    ret nc

    inc b
    ld hl, sp-$78
    ld [hl], h
    ld d, h
    xor b
    xor b
    ld d, h
    ld b, h
    cp b
    rra
    ccf
    inc e
    jr c, jr_006_69e9

    ld sp, $3402
    add hl, hl
    ld d, $02
    rra
    dec d

jr_006_69e9:
    rrca
    ld [bc], a
    rrca
    ld b, d
    add c
    inc h
    jp $ff82


    ld d, h
    rst $38
    ld [$b07f], sp
    rrca
    ld b, b
    add b
    jr nz, jr_006_69bc

    ld b, d
    add c
    inc h
    jp $fe01


    ld a, [hl+]
    push de
    ld b, b
    cp [hl]
    dec c
    ldh a, [rSC]
    ld bc, $0304
    ld [$24f4], sp
    jr jr_006_6a21

    adc h
    ld b, b
    inc l
    sub h
    ld l, b
    ld b, b
    cp b
    xor b
    ld d, b
    ld b, b
    or b
    add hl, bc
    rlca
    inc b
    inc bc
    ld [bc], a

jr_006_6a21:
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $10
    ldh [rDIV], a
    ld hl, sp+$40
    rst $38
    xor b
    ld a, a
    jr nz, jr_006_6a55

    nop
    nop
    nop
    nop
    nop
    nop
    ld [$2107], sp
    ld e, $0a
    push af
    ld d, c
    xor [hl]
    inc b
    ld hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    sub b
    ld h, b
    jr nz, @-$3e

    ld b, b
    add b
    nop
    nop
    nop

jr_006_6a55:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_006_6a83

    rla
    jr jr_006_6a86

    db $10
    ld c, $10
    ld c, $10
    nop
    nop
    nop
    nop
    nop
    nop
    db $10

jr_006_6a83:
    ldh [$f8], a
    nop

jr_006_6a86:
    ld a, b
    nop
    jr c, jr_006_6a8a

jr_006_6a8a:
    jr c, jr_006_6a8c

jr_006_6a8c:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_006_6ab3

    rla
    jr jr_006_6ab6

    db $10
    rrca
    db $10
    inc c
    db $10
    inc c
    db $10
    inc c
    db $10
    ld c, $11
    rra

jr_006_6ab3:
    ldh [rIE], a
    nop

jr_006_6ab6:
    cp $00
    inc a
    nop
    add hl, de
    jr nz, jr_006_6ad5

    nop
    ld [$1810], sp
    ldh [$fc], a
    inc bc
    rst $38
    nop
    ccf
    nop
    cp $00
    xor $10
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, b
    ldh [$f8], a

jr_006_6ad5:
    nop
    ld hl, sp+$00
    ld a, b
    nop
    jr jr_006_6adc

jr_006_6adc:
    ld [$0c10], sp
    db $10
    rrca
    db $10
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
    dec de
    jr nz, jr_006_6b0a

    jr nz, jr_006_6b10

    jr nz, @-$40

    ld b, c
    rst $38
    nop
    rra
    nop
    rrca
    db $10
    inc c
    db $10
    cp $10
    sbc $30
    cp [hl]
    ld h, b
    ccf
    ret nz

    rst $38
    nop
    ld hl, sp+$00
    ld hl, sp+$00

jr_006_6b0a:
    jr jr_006_6b0c

jr_006_6b0c:
    ld [$1800], sp
    nop

jr_006_6b10:
    ld c, b
    jr nc, jr_006_6b4b

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
    db $10
    ld e, $10
    ld e, $10
    rrca
    db $10
    rla

jr_006_6b35:
    ld [$0000], sp
    nop
    nop
    nop
    nop
    ld [$2810], sp
    db $10
    jr jr_006_6b62

    ld e, b
    jr nz, jr_006_6b35

    nop
    nop
    nop
    nop
    nop
    nop

jr_006_6b4b:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_006_6b62:
    nop
    nop
    nop
    nop
    ld [bc], a
    ld bc, $0304
    ld [$0007], sp
    nop
    nop
    nop
    nop
    nop
    jr nc, jr_006_6b83

    add b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, h

jr_006_6b83:
    or b
    and c
    ld e, [hl]
    ld d, e
    xor a
    inc hl
    rst $18
    ld b, a
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
    ld b, b
    add b
    and b
    ret nz

    ret nc

    ldh [rP1], a
    rrca
    db $10
    rrca
    nop
    rra
    jr nz, @+$21

    jr nc, jr_006_6bc5

    jr @+$41

    ccf
    ccf
    nop
    ccf

jr_006_6bac:
    nop
    rst $38
    nop
    rst $38

jr_006_6bb0:
    rlca
    rst $38
    rra
    rst $38
    ld a, [de]
    db $fc
    jr nc, jr_006_6bb0

    ld hl, sp-$10
    jr nc, jr_006_6bac

    daa
    rst $18
    ld c, a
    cp a
    rst $28
    rst $38
    cp $ff
    ld e, b

jr_006_6bc5:
    ccf
    inc c
    rra
    rra
    rrca
    inc c
    rrca
    ldh [$f0], a
    add sp, -$10
    add b
    ld hl, sp+$04
    ld hl, sp+$04
    ld hl, sp+$00
    db $fc
    xor b
    db $fc
    nop
    db $fc
    ld a, [hl+]
    dec d
    inc d
    dec hl

jr_006_6be0:
    nop
    ccf
    jr nz, jr_006_6c03

    jr nz, @+$21

    ld bc, $171f
    rrca

jr_006_6bea:
    rlca
    rrca
    or b
    ld [hl], b
    jr c, jr_006_6be0

    jr nc, jr_006_6bea

    ld a, [de]
    db $fc
    ld a, a
    rst $38
    rst $30
    rst $38
    ld a, [c]
    db $fd
    db $e4
    ei
    inc c
    rrca
    inc e
    rrca
    inc c
    rra
    ld e, b

jr_006_6c03:
    ccf
    ld hl, sp-$01
    ld [c], a
    db $fd
    dec c
    ld a, [c]
    ld c, $f1
    nop
    db $fc
    nop
    db $fc
    nop
    db $fc
    inc b
    ld hl, sp+$04
    ld hl, sp+$00
    ld hl, sp+$08
    ldh a, [$a0]
    ld d, b
    dec bc
    rlca
    dec b
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
    ld [c], a
    db $fd
    call nz, $c8fb
    rst $30
    add h
    ld a, e
    jr nc, jr_006_6c45

    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    ld hl, sp+$07
    ld hl, sp+$03
    db $fc
    inc bc
    db $fc
    inc c

jr_006_6c45:
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    ld d, b
    and b
    and b
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
    rrca
    rra
    db $10
    rra
    db $10
    rra
    ld bc, $101e
    ld e, $00
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38
    add b
    nop
    ld a, a
    nop
    sub l
    ld l, d
    nop
    nop
    nop
    nop
    nop
    nop
    cp $ff
    nop
    rst $38
    dec bc
    nop
    db $dd
    ld [hl+], a
    xor e
    ld d, h
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
    ld [$80f0], sp
    ld a, b
    adc b
    ld [hl], b
    ld bc, $101e
    rra
    db $10
    rra
    db $10
    rra
    ld de, $121e
    inc e
    ld bc, $191c
    inc b
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    ccf
    rst $38
    ccf
    db $e4
    rst $38
    nop
    rst $38
    nop
    xor e
    rst $38
    nop
    rst $38
    dec b
    nop
    rst $38
    nop
    cp $ff
    cp $93
    add b
    ld a, b
    ld c, b
    ldh a, [$80]
    ld hl, sp+$00
    ld hl, sp-$80
    ld a, b
    ret nz

    jr c, jr_006_6d19

    cp b
    ld e, b
    and b
    add hl, bc
    inc e
    add hl, de
    inc e
    add hl, de
    inc e
    add hl, de
    inc e
    dec de
    inc e
    add hl, de
    inc e
    dec de
    inc e
    add hl, de
    ld e, $3f
    rst $38
    ccf
    db $e4
    ccf
    rst $38
    ccf
    ei
    ccf
    rst $38
    ccf
    db $fc
    ccf
    rst $38
    rst $38
    nop
    cp $ff
    cp $93

Jump_006_6d00:
    cp $ff
    cp $ff
    cp $ff
    cp $3f
    cp $ff
    rst $38
    nop
    ld b, b
    or b
    ld b, b
    or b
    ld b, b
    or b
    ld b, b
    or b
    ld b, b
    or b
    ld b, b
    or b
    ld b, b

jr_006_6d19:
    or b
    and b
    ld [hl], b
    jr jr_006_6d3d

    jr @+$21

    ld [$101f], sp
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
    rst $38
    ld bc, $00fe
    rst $38
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
    ld a, [bc]

jr_006_6d3d:
    rst $38
    ldh [$3f], a
    ret nz

    ld a, a
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
    ret nz

    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rNR10]
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
    ld [$0000], sp
    inc b
    ld b, $02
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
    inc e
    nop
    ld e, h
    ld a, $d7
    ld [c], a
    inc bc
    ld bc, $0100
    ld bc, $0000
    nop
    nop
    nop

jr_006_6d80:
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
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    inc bc
    nop
    dec b
    inc bc
    nop
    nop
    cp a
    ld a, a
    ld a, a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    nop
    jr nz, jr_006_6d80

    nop
    nop
    ld sp, hl
    ld a, [hl]
    cp $7f
    rst $38
    ld a, a
    rst $38
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
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld bc, $0100
    sbc b
    ldh [$df], a
    ccf
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
    add hl, de
    rlca
    ei
    db $fc
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
    add b
    nop
    add b
    ld bc, $0101
    ld bc, $0100
    nop
    ld bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ccf
    rst $38
    nop
    rst $38
    add d
    ld a, l
    jr nz, jr_006_6e59

    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    db $fc
    rst $38
    dec b
    ld a, [$54ab]
    ld d, h
    xor b
    nop
    nop
    add b
    add b
    add b
    add b
    nop
    add b

jr_006_6e52:
    add b
    nop
    add b
    nop
    nop
    nop
    nop

jr_006_6e59:
    nop
    nop
    nop
    jr nz, jr_006_6e5e

jr_006_6e5e:
    jr jr_006_6e60

jr_006_6e60:
    inc d
    ld [$040e], sp
    inc b
    ld [bc], a
    nop
    nop
    nop
    nop
    ld bc, $0000
    nop
    nop
    nop
    ld [$2007], sp
    rra
    ld e, b
    ccf
    cp h
    ld a, a
    inc a
    rst $38
    jr @+$01

    nop
    nop
    nop
    nop
    jr nz, jr_006_6e52

    inc d
    add sp, $0a
    db $f4
    rlca
    ld hl, sp+$0b
    db $f4
    dec b
    ld a, [$0002]
    inc c
    nop
    inc d
    ld [$1038], sp
    db $10
    jr nz, jr_006_6e97

jr_006_6e97:
    nop
    add b
    nop
    add b
    nop
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    ld e, b
    dec a
    nop
    ld bc, $0001
    nop
    nop
    ld b, b
    rst $38
    ld h, b
    rst $38
    ld b, b
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
    inc bc
    db $fc
    dec b
    ld a, [$fc03]
    dec b
    ld a, [$f40b]

jr_006_6ec6:
    rlca
    ld hl, sp+$0b
    db $f4
    rla
    add sp, -$40
    nop
    ret nz

    nop
    ret nz

    nop
    ret nz

    nop
    call $c01e
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
    inc b
    ld [bc], a
    ld c, $04
    inc d
    ld [$0018], sp
    jr nz, jr_006_6eec

jr_006_6eec:
    add b
    ld a, a
    ld b, b
    ccf
    jr nz, jr_006_6f11

    ld [$101f], sp
    rrca
    inc d
    rrca
    inc b
    rrca
    nop
    rrca
    cpl
    ret nc

    ld e, $e0
    inc l
    ret nc

    ld e, h
    and b
    jr c, jr_006_6ec6

    ld a, b
    add b
    cp b
    ld b, b
    ld a, b
    add b
    nop
    nop
    nop
    nop
    nop

jr_006_6f11:
    nop
    db $10
    jr nz, jr_006_6f4d

    db $10
    inc d
    ld [$000c], sp
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
    rrca
    nop
    ld d, $0f
    rrca
    nop
    ld d, $0f
    rrca
    nop
    ld [de], a
    rrca
    rlca
    nop
    ld b, $03
    ret nz

    nop
    inc [hl]
    ret z

    ret z

    nop
    inc [hl]
    ret z

    ret z

    nop
    inc [hl]
    ret z

    ld hl, sp+$00
    ret nc

    jr nz, jr_006_6f4d

jr_006_6f4d:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc c
    add e
    add hl, de
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
    ld bc, $b4fe
    cp $68
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
    rst $38
    inc c
    add e
    add hl, de
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
    ld bc, $b4fe
    cp $68
    cp $32
    adc a
    ld h, l
    sbc a
    ld c, e
    cp a
    ld d, $ff
    add b
    nop
    nop
    ld bc, $0100
    nop
    ld bc, $fcd2
    and [hl]
    ld hl, sp+$4c
    ldh a, [$98]
    ldh [rP1], a
    nop
    nop
    rst $38
    add hl, de
    rlca
    ld [hl-], a
    rrca
    ld [hl-], a
    adc a
    ld h, l
    sbc a
    ld c, e
    cp a
    ld d, $ff
    add b
    nop
    ld [bc], a
    db $fc
    ld l, b
    db $fc
    ldh a, [$9c]
    jp nc, $a6fc

    ld hl, sp+$4c
    ldh a, [$98]
    ldh [rP1], a
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
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    ld h, l
    rra
    srl a
    sub [hl]
    ld a, a
    dec l
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sub h
    xor b
    inc l
    or b
    or b
    cp b
    ld a, b
    cp h
    inc a
    ld a, $3e
    ccf
    ccf
    ccf
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
    nop
    nop
    nop
    nop
    add b
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
    ccf
    ccf
    ccf
    ccf
    dec hl
    scf
    ld bc, $0003
    ld bc, $0001
    nop
    nop
    nop
    nop
    nop
    add b
    add b
    nop
    nop
    add b
    ret nz

    add b
    add b
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
    ld bc, $0000
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
    ld a, a
    ld [bc], a
    db $fd
    dec b
    ld a, [$0400]
    nop
    ld c, $00
    ld c, $00
    ld c, $0a
    inc b
    dec c
    ld a, [c]
    and b
    ld e, a
    ld d, b
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
    nop
    add b
    nop
    nop
    add b
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    ld [bc], a
    db $fd
    nop
    rst $38
    add b
    nop
    rra
    ld b, b
    rra
    nop
    rra
    nop
    add b
    nop
    jr nc, @-$3e

    and b
    ld e, a
    nop
    rst $38
    ld [bc], a
    ld bc, $01f1
    pop af
    ld bc, $01f1
    inc bc
    ld bc, $071a
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
    add b
    ld bc, $0000
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $ff07
    nop
    rst $38
    ld a, e
    rst $38
    ld a, a
    ei
    dec a
    jp nz, $ff7b

    ld a, a
    ei
    dec a
    jp nz, $fffc

    nop
    rst $38
    sbc $ff
    rst $38
    sbc $ef
    db $10
    sbc $ff
    rst $38
    sbc $ef
    db $10
    add b
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
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    ld bc, $0000
    nop
    ld a, e
    rst $38
    ld a, a
    ei
    dec a
    jp nz, $ff7b

    ld a, a
    ei
    inc a
    jp $fc02


    add b
    ld a, a
    sbc $ff
    rst $38
    sbc $ef
    db $10
    sbc $ff
    rst $38
    sbc $2f
    ret nc

    ld b, b
    ccf
    ld bc, $00fe
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    ld [$1c00], sp
    ld [$143e], sp
    nop
    nop
    nop
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
    inc b
    inc c
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
    jr jr_006_71aa

    jr jr_006_71a4

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_006_71a4:
    nop
    nop
    nop
    nop
    ld a, [bc]
    ld a, [bc]

jr_006_71aa:
    inc d
    inc d
    nop
    nop
    ld a, $7f
    ld [hl], a
    ld h, e
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ld [hl], a
    ld h, e
    ld a, $7f
    inc e
    ld [$1818], sp
    jr jr_006_71d8

    jr jr_006_71da

    jr jr_006_71dc

    jr jr_006_71de

    nop
    nop
    jr jr_006_71e2

    jr jr_006_71e4

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_006_71d8:
    jr nc, jr_006_720a

jr_006_71da:
    jr nc, jr_006_720c

jr_006_71dc:
    nop
    nop

jr_006_71de:
    nop
    nop
    nop
    nop

jr_006_71e2:
    nop
    nop

jr_006_71e4:
    inc e
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
    jr nc, jr_006_720a

    jr nc, jr_006_721c

    jr jr_006_7216

    db $10
    jr jr_006_7201

jr_006_7201:
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_006_720a:
    nop
    nop

jr_006_720c:
    cp a
    nop
    ld a, [$4800]
    nop
    dec h
    nop
    sub b
    nop

jr_006_7216:
    ld b, h
    nop
    jr z, jr_006_721a

jr_006_721a:
    ld b, c
    nop

jr_006_721c:
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
    jr nz, jr_006_721a

    ld c, b
    xor a
    ld d, b
    ld e, l
    and b
    ld a, a

jr_006_7269:
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
    jr c, jr_006_7269

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
    call nz, Call_006_4300
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

jr_006_73d9:
    ld a, d
    dec d
    ld [$748b], a
    ld d, l
    xor d
    ld a, l
    add b
    reti


    jr nz, jr_006_73d9

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
    jr nz, jr_006_7442

jr_006_7442:
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

Call_006_75ea:
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
    jr nz, jr_006_7600

jr_006_7600:
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
    jr nz, jr_006_7646

jr_006_7646:
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
    jp c, Jump_006_6d00

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
    jr z, jr_006_77f2

jr_006_77f2:
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
    jr z, jr_006_7810

jr_006_7810:
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
    jr nz, jr_006_7830

jr_006_7830:
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
    jr z, jr_006_7844

jr_006_7844:
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
    jr nz, jr_006_786a

jr_006_786a:
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

jr_006_7886:
    rst $38
    nop
    rst $18
    jr nz, @+$01

    nop
    rst $18
    jr nz, jr_006_7886

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
    jr z, jr_006_7906

jr_006_7906:
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
    jr nz, jr_006_7922

jr_006_7922:
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

jr_006_7975:
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
    jr nz, jr_006_7975

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

jr_006_79a8:
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

jr_006_79c9:
    dec d
    xor d
    ld [hl], l
    rst $30
    ld c, d
    ld e, d
    and l
    rst $38
    jr nz, jr_006_79a8

    xor d
    rst $38

jr_006_79d5:
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
    jr z, jr_006_79c9

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
    jr nz, jr_006_79d5

    ld d, l
    rst $30
    ld [$a55a], sp
    rst $38
    nop

jr_006_7a32:
    ld d, l
    xor d
    rst $38
    nop
    xor e
    ld d, l

jr_006_7a38:
    rst $38

jr_006_7a39:
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
    call nc, Call_006_75ea
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
    jr z, jr_006_7a39

    and l
    rst $38
    jr nc, jr_006_7a38

    xor d
    rst $38
    ld b, b
    ld [$ff55], a
    nop
    xor d
    ld d, l
    rst $30
    ld [$a55a], sp
    jr c, jr_006_7a32

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

    jr c, jr_006_7a9e

    nop

jr_006_7a9e:
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

jr_006_7acb:
    nop
    jr jr_006_7acb

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
    jr nc, jr_006_7b32

    nop
    ld a, [hl-]
    ret nz

jr_006_7b16:
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
    jr jr_006_7b33

    sbc b
    ld b, $98

jr_006_7b32:
    inc c

jr_006_7b33:
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
    jr nc, jr_006_7b5f

    ld h, h
    jr jr_006_7b16

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

jr_006_7b5f:
    add b
    or c
    ld b, b
    jr @+$62

    ld sp, $5ac0
    jr nz, jr_006_7b7e

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

jr_006_7b7e:
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
    jr jr_006_7be9

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

jr_006_7be9:
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
    jr jr_006_7cde

    ld a, [de]
    dec de
    nop
    nop
    inc e
    dec e
    ld e, $1f
    jr nz, jr_006_7cf0

    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $27
    jr z, jr_006_7d00

    ld a, [hl+]
    dec hl
    inc l
    dec l
    nop
    nop
    nop

jr_006_7cde:
    ld l, $2f
    jr nc, jr_006_7d13

    ld [hl-], a
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, jr_006_7d23

    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $00

jr_006_7cf0:
    nop
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

jr_006_7d00:
    nop
    nop
    nop
    nop
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

jr_006_7d13:
    nop
    nop
    nop
    nop
    nop
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

jr_006_7d23:
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
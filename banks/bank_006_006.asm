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

    db $9c, $00, $06, $01
    db $6b, $01

    db $c9
    db $01

    db $23, $02, $77, $02, $c6, $02, $12, $03, $56, $03

    db $9b, $03, $da, $03, $16, $04, $4e, $04

    db $83, $04, $b5, $04, $e5, $04, $11, $05, $3b, $05, $63, $05, $89, $05, $ac, $05
    db $ce, $05, $ed, $05, $0a, $06, $27, $06

    db $42
    db $06

    db $5b, $06, $72, $06, $89, $06, $9e, $06, $b2, $06, $c4, $06, $d6, $06, $e7, $06
    db $f7, $06, $06, $07, $14, $07, $21, $07, $2d, $07, $39, $07, $44, $07, $4f, $07
    db $59, $07, $62, $07

    db $6b, $07
    db $73, $07, $7b, $07, $83, $07, $8a, $07, $90, $07, $97, $07, $9d, $07, $a2, $07
    db $a7, $07, $ac, $07, $b1, $07, $b6, $07, $ba, $07, $be, $07, $c1, $07

    db $c4, $07, $c8, $07, $cb, $07, $ce, $07
    db $d1, $07

    db $d4, $07, $d6, $07, $d9, $07
    db $db
    db $07
    db $dd
    db $07, $df, $07
    db $7f, $c1, $5d, $03, $0a, $ee, $5c, $02, $0a, $f4, $5c, $02, $0a, $fa, $5c, $02
    db $0a, $00, $5d, $02, $14, $06, $5d, $02

    db $32, $0e, $5d, $02
    db $32, $14, $5d, $02, $14, $28, $5d, $02

    db $1e, $2e, $5d, $02
    db $3c, $6b, $5d, $03

    db $28, $1a, $5d, $03, $14, $34, $5d, $02
    db $14, $20, $5d, $03, $14, $71, $5d, $03

    db $15, $3c, $5d, $02, $28, $63, $5d, $02
    db $28, $77, $5d, $03, $28, $7d, $5d, $03, $28, $91, $5d, $02, $28, $85, $5d, $03

    db $28, $8b, $5d, $02
    db $32, $42, $5d, $02

    db $32, $9d, $5d, $02

    db $32, $a5, $5d, $02
    db $3c, $ad, $5d, $03, $64, $b3, $5d, $02, $64, $b9, $5d, $03, $64, $97, $5d, $03

    db $50, $c7, $5d, $02
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

    db $29, $50, $2b, $50, $2f, $50, $31, $50, $06, $cf, $66, $f2, $65, $33, $50, $4b
    db $50, $63, $50, $07, $50, $07, $cf, $66, $f2, $65
    db $7d, $50, $9d, $50, $bd, $50, $07, $50, $06, $cf, $66, $f2, $65, $e7, $50, $ea
    db $50, $f7, $50, $06, $51, $0a, $51, $23, $51

    db $3f, $51, $64, $51, $80, $51, $a5, $51, $be, $51
    db $e3
    db $51
    db $08, $52

    db $0c, $52

    db $4b, $52, $72, $52, $99, $52
    db $b4, $52, $b8, $52, $da, $52, $fc, $52, $21, $53, $34, $53, $44, $53

    db $8b, $54, $91, $54, $97, $54, $9d, $54

    db $a2, $54
    db $51, $53

    db $77, $53, $90, $53, $ac, $53, $bf, $53, $d2, $53, $e5, $53, $22, $54, $35, $54
    db $48, $54

    db $7c, $54

    db $61, $54, $63, $53, $f8, $53
    db $0d, $54, $ae, $54, $c7, $54, $d7, $54

    db $fc
    db $54, $15, $55, $2e, $55, $44, $55, $75, $55, $91, $55, $af, $55, $d6, $55
    db $f1, $55, $01, $56

    db $17, $56, $33, $56, $52, $56, $74, $56
    db $9f, $56, $d5, $56

    db $f1, $56, $19, $57, $44, $57
    db $a2, $57, $b2, $57

    db $c8, $57
    db $e4
    db $57, $03, $58, $25, $58, $50, $58, $78, $58, $a3, $58, $72, $57, $01, $59, $b9
    db $56, $d1, $58
    db $06, $59, $1f, $59, $38, $59, $4e, $59, $7f, $59, $97, $59

    db $ca, $59

    db $e5, $59, $e9, $59, $fa, $59, $07, $5a, $1b, $5a, $20, $5a, $30, $5a, $34, $5a
    db $37, $5a, $43, $5a, $4f, $5a, $5c, $5a

    db $68, $5a, $6e, $5a, $84, $5a, $88, $5a
    db $8f, $5a, $df, $5a, $e2, $5a, $08, $5b, $21, $5b, $3a, $5b, $46, $5b, $5d, $5b
    db $65, $5b, $71, $5b, $7e, $5b, $86, $5b, $98, $5b, $9e, $5b, $ab, $5b, $f7, $5b
    db $f4, $5a, $d0, $5b, $10, $5c

    db $2b, $5c, $44, $5c, $5d, $5c, $7a, $5c, $92, $5c, $b1, $5c, $cb, $5c, $78, $5e
    db $5d, $61, $ac, $5e, $ab, $61

    db $89, $60
    db $14, $61

    db $44, $61, $c2, $5f, $cc, $5f, $d6, $5f, $e0, $5f, $ea, $5f, $f4, $5f, $fe, $5f

    db $bd, $5e

    db $6f, $61
    db $d8, $65, $e8, $65

    db $08
    db $60
    db $72, $62, $18, $62

    db $31, $62, $51, $62, $59, $5f
    db $8b, $61

    db $9b, $61

    db $3a, $5f, $d8, $5e, $4e, $60, $28, $62
    db $2f, $61

    db $c7, $5e, $c0, $60, $8a, $62
    db $e4
    db $60
    db $d2, $60, $e4, $60

    db $f6, $60, $e2, $5e, $99, $5f, $a8, $60, $bd, $5e
    db $dc, $62, $f7, $62, $00, $63, $1b, $63, $4c, $64

    db $62, $64
    db $7a, $64, $2b, $63

    db $1e, $64, $34, $64
    db $fc, $63

    db $0e, $64

    db $47, $63
    db $89, $63

    db $9b, $63

    db $d1, $63

    db $ea
    db $63
    db $bc, $62

    db $a8, $62
    db $e1, $65, $a0, $5e, $81, $5e, $94, $5e

    db $8d, $5e, $e1, $65, $e1, $65, $e1, $65, $e1, $65, $e1, $65, $8c, $64
    db $e8, $64

    db $80, $65

    db $a4, $65

    db $be, $64, $3c, $65, $b6, $65, $f8, $64
    db $c3
    db $63
    db $64, $65

    db $9e, $64, $74, $65
    db $00, $01, $00, $01, $00, $01, $00, $01, $03, $01, $03, $01, $03, $01, $03, $01
    db $00, $01, $00, $01, $00, $01, $00, $01

    db $03, $01, $03, $01, $03, $01, $03, $01, $00, $04, $00, $04, $00, $04, $00, $04
    db $03, $04, $03, $04, $03, $04, $03, $04, $00, $04, $00, $04, $00, $04, $00, $04
    db $03, $04, $03, $04, $03, $04, $03, $04, $00, $0a, $00, $0a, $00, $0a, $00, $0a
    db $fe, $0b, $fe, $0b, $fe, $0b, $fe, $0e
    db $00, $02, $00, $02, $00, $02, $00, $02, $03, $02, $03, $02, $03, $02, $03, $02
    db $00, $02, $00, $02, $00, $02, $00, $02

    db $03, $02, $03, $02, $03, $02, $03, $02, $00, $05, $00, $05, $00, $05, $00, $06
    db $fe, $07, $fe, $07, $fe, $07, $fe, $08, $00, $05, $00, $05, $00, $05, $00, $06
    db $fe, $07, $fe, $07, $fe, $07, $fe, $08, $00, $05, $00, $05, $00, $05, $00, $06
    db $fe, $07, $fe, $07, $fe, $07, $fe, $0f
    db $00, $11, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $0c, $00, $00, $00, $00, $00, $00

    db $fe, $03, $fe, $00, $fe, $00, $fe, $00, $00, $0c, $00, $00, $00, $00, $00, $00
    db $fe, $03, $fe, $00, $fe, $00, $fe, $00, $00, $09, $00, $09, $00, $09, $00, $09
    db $03, $09, $03, $09, $03, $09, $03, $09, $00, $09, $00, $09, $00, $09, $00, $09
    db $03, $09, $03, $09, $03, $09, $03
    db $10

    db $00, $0d, $00, $12, $00, $13, $00, $12, $00, $14, $00, $12, $00, $13, $00, $12
    db $00, $14, $00, $12, $00, $13, $00, $12, $00, $14, $03, $12, $03, $13, $03, $12
    db $03, $14, $03, $12, $03, $13, $03, $12, $03, $14, $00, $1e, $00, $1f, $07, $1e
    db $00, $26, $02, $12, $02, $13, $02, $12

    db $02, $14, $02, $12, $02, $13, $02, $12, $02, $14, $02, $12, $02, $13, $02, $12
    db $02, $14, $05, $12, $05, $13, $05, $12, $05, $14, $05, $12, $05, $13, $05, $12
    db $05, $14, $02, $1e, $02, $1f, $09, $1e, $02
    db $28

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $1d, $00, $1d, $00, $1d, $00, $1d
    db $00, $1d, $00, $1d, $00, $1d, $00, $1d, $03, $1d, $03, $1d, $03, $1d, $03, $1d
    db $03, $1d, $03, $1d, $03, $1d, $03, $1d, $05, $1d, $05, $1d, $07, $1d, $07, $1d
    db $02, $00, $02, $00, $02, $00

    db $02, $00, $02, $1d, $02, $1d, $02, $1d, $02, $1d, $02, $1d, $02, $1d, $02, $1d
    db $02, $1d, $05, $1d, $05, $1d, $05, $1d, $05, $1d, $05, $1d, $05, $1d, $05, $1d
    db $05, $1d, $07, $1d, $07, $1d, $09, $1d, $09, $29
    db $00, $2b, $00, $2b, $00, $2b, $00, $2b, $00, $15, $00, $16, $00, $15, $00, $17
    db $00, $15, $00, $16, $00, $15, $00, $17, $03, $15, $03, $16, $03, $15, $03, $17
    db $03, $15, $03, $16, $03, $15, $03, $17, $00, $20, $00, $21, $00, $22, $00, $23
    db $00, $2b, $02, $00, $02, $00

    db $02, $00, $02, $15, $02, $16, $02, $15, $02, $17, $02, $15, $02, $16, $02, $15
    db $02, $17, $05, $15, $05, $16, $05, $15, $05, $17, $05, $15, $05, $16, $05, $15
    db $05, $17, $02, $20, $02, $21, $02, $22, $02, $2a
    db $00, $27, $00, $2d, $00, $2d, $00, $2d, $00, $2d, $00, $2d, $00, $2d, $00, $2d
    db $00, $2d, $00, $2f, $00, $30, $fe, $2f, $fe, $31, $00, $2f, $00, $30, $fe, $2f
    db $fe, $31, $00, $32, $00, $32, $fe, $32, $fe, $33, $00, $32, $00, $32, $05, $32
    db $05, $33, $03, $2d

    db $03, $2d, $03, $2d, $03, $2d, $03, $2d, $03, $2d, $03, $2d, $03, $2d, $03, $2f
    db $03, $30, $01, $2f
    db $01, $31, $03, $2f, $03, $30, $01, $2f
    db $01, $31, $03, $32, $03, $32, $01, $32, $01, $33, $03, $32, $03, $32, $08, $32
    db $08, $34
    db $00, $2e, $00, $2e, $fe, $2e, $fe, $2e, $00, $2e, $00, $2e, $fc, $2e, $fc, $2e
    db $02, $2e, $02, $2e, $02, $2e, $02, $2e, $02, $2e, $02, $2e, $00, $2e, $00, $2e
    db $00, $2e, $00, $2e, $fe, $2e, $fe, $2e, $00, $2e, $00, $2e, $05, $2e, $05, $2e
    db $03, $2e

    db $03, $2e, $01, $2e, $01, $2e, $03, $2e, $03, $2e, $ff, $2e, $ff, $2e, $05, $2e
    db $05, $2e, $05, $2e, $05, $2e, $05, $2e, $05, $2e, $03, $2e, $03, $2e, $03, $2e
    db $03, $2e, $01, $2e, $01, $2e, $03, $2e, $03, $2e, $08, $2e, $08, $35
    db $00, $2c, $00, $2c, $fe, $2c, $fe, $2c, $00, $2c, $00, $2c, $fc, $2c, $fc, $2c
    db $02, $2c, $02, $2c, $00, $2c, $00, $2c, $02, $2c, $02, $2c, $00, $2c, $00, $2c
    db $00, $2c, $00, $2c, $fe, $2c, $fe, $2c, $00, $2c, $00, $2c, $05, $2c, $05, $2c
    db $03, $2c

    db $03, $2c, $01, $2c, $01, $2c, $03, $2c, $03, $2c, $ff, $2c, $ff, $2c, $05, $2c
    db $05, $2c, $03, $2c, $03, $2c, $05, $2c, $05, $2c, $03, $2c, $03, $2c, $03, $2c
    db $03, $2c, $01, $2c, $01, $2c, $03, $2c, $03, $2c, $08, $2c, $08
    db $36

    db $00, $27, $00, $37, $00, $37, $00, $37, $00, $37, $00, $38, $00, $38, $00, $38

    db $00, $39, $00, $3a, $00, $3a, $00, $3a, $00, $3a, $00, $3b, $00, $3b, $00, $3b
    db $00, $3c, $00, $3f, $00, $40, $00, $3f, $00, $41, $00, $3f, $00, $40, $00, $3f
    db $00, $4b
    db $00, $3e, $00, $00, $00, $3e, $00, $00, $00, $3e, $00, $00, $00, $3e

    db $00, $00, $05, $3e, $00, $00, $05, $3e, $00, $00, $00, $3e, $00, $00, $00, $3e
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $4c
    db $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d

    db $0c, $3d, $11, $3d, $11, $3d, $11, $3d, $11, $3d, $0c, $3d, $0c, $3d, $0c, $3d
    db $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d, $0c, $3d
    db $0c, $4d
    db $00, $42, $00, $42, $00, $42, $00, $42, $00, $43, $00, $43, $00, $43

    db $00, $44, $00, $45, $00, $45, $00, $45, $00, $45, $00, $46, $00, $46, $00, $46
    db $00, $47, $00, $48, $00, $49, $00, $48, $00, $4a, $00, $48, $00, $49, $00, $48
    db $00, $4e
    db $00, $51, $00, $51, $07, $51, $07, $51, $03, $51, $03, $51, $07, $51, $07, $51
    db $03, $51, $03, $51, $07, $51, $07, $51

    db $06, $51, $06, $51, $08, $51, $08, $53
    db $00, $52, $00, $52, $fb, $52, $fb, $52, $03, $52, $03, $52, $07, $52, $07, $52
    db $03, $52

    db $03, $52, $05, $52, $05, $52, $06, $52, $06, $52, $08, $52, $08, $54
    db $00, $4f, $00, $4f, $00, $50, $00, $50, $03, $4f, $03, $4f, $00, $50, $00, $50
    db $03, $4f, $03, $4f, $03, $50, $03, $50

    db $06, $4f, $06, $4f, $08, $4f, $08, $55
    db $00, $27, $00, $56, $00, $57, $00, $58, $00, $59, $00, $5a, $00, $5b, $00, $5c
    db $00, $5d, $00, $5e, $00, $5f, $00, $60, $00, $61

    db $00, $62, $00, $63, $00, $64, $00, $65
    db $07, $66, $07, $67, $07, $66, $00, $19, $00, $1a, $00, $68, $00, $68, $07, $68
    db $07, $68, $05, $68, $05, $68, $00, $68, $07, $68, $fb, $68, $fb, $68, $fe, $68
    db $fe, $76, $00, $6b, $00, $6c, $00, $6d, $00, $6e, $00, $6f, $00, $70, $00, $71
    db $00, $72, $00, $73, $00, $74, $03, $73, $03, $77, $00, $69, $00, $6a, $fb, $69
    db $fb, $6a, $05, $75, $05, $6a, $00, $69, $fb, $6a, $fb, $69, $fb, $6a, $fe, $69
    db $fe, $78

    db $00, $1a
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
    db $24, $02, $00, $02, $0c, $13, $02, $0c, $13, $02, $18, $13, $02, $13, $13, $02
    db $16, $13, $02, $15, $13, $02, $13, $13, $02, $0f, $13, $00, $02, $07, $1e, $01
    db $24, $03, $01, $24, $03, $02, $1a, $06, $02, $24, $03, $02, $07, $1e, $02, $24
    db $03, $02, $1a, $06, $02, $24, $03, $00, $02, $07, $1e, $01, $24, $03, $01, $24
    db $03, $01, $1c, $06, $01, $1c, $06, $02, $24, $03, $02, $07, $1e, $02, $24, $03
    db $01, $1a, $06, $01, $1a, $06, $01, $1a, $06, $01, $1a, $06, $00, $02, $07, $1e
    db $01, $24, $04, $01, $24, $04, $02, $1a, $06, $02, $24, $04, $02, $07, $1e, $02
    db $24, $04, $02, $1a, $06, $02, $24, $04, $00, $02, $07, $1e, $01, $24, $04, $01
    db $24, $04, $01, $1c, $06, $01, $1c, $06, $02, $24, $04, $02, $07, $1e, $02, $24
    db $04, $01, $1a, $06, $01, $1a, $06, $01, $1a, $06, $01, $1a, $06, $00, $02, $18
    db $02, $02, $24
    db $02, $02, $18, $02, $02, $24
    db $02, $02, $22, $02, $02, $21, $02, $02, $1f, $02, $02, $1b, $02, $00, $02, $24
    db $03, $01, $24, $03, $01, $24, $03, $01, $24, $03, $01, $24, $03, $02, $24, $03
    db $01, $24, $03, $02, $24, $03, $02, $24, $03, $01, $24, $03, $01, $24, $03, $01
    db $24, $03, $00, $02, $24, $04, $01, $24, $04, $01, $24, $04, $01, $24, $04, $01
    db $24, $04, $02, $24, $04, $01, $24, $04, $02, $24, $04, $02, $24, $04, $01, $24
    db $04, $01, $24, $04, $01, $24, $04, $00
    db $10, $24, $0e, $00

    db $04, $07, $02, $04, $07, $01, $04, $07, $02, $04, $1a, $01, $04, $07, $02, $04
    db $07, $01, $04, $07, $02, $04, $1a, $01, $04, $07, $02, $04, $07, $01, $04, $07
    db $02, $04, $1a, $01, $04, $00, $02, $01, $1c, $01, $03, $1c, $01, $04, $07, $02
    db $01, $1a, $01, $01, $1a, $01, $01, $1a, $01, $01, $1a, $01, $ff, $a1, $4c

    db $02, $24, $04, $01, $24, $04, $01, $24, $04, $01, $24, $04, $01, $24, $04, $02
    db $24, $04, $01, $24, $04, $02, $24, $04, $02, $24, $04, $01, $24, $04, $01, $24
    db $04, $01, $24, $04, $ff, $b1, $4b, $02, $07, $1e, $01, $24, $04, $01, $24, $04
    db $01, $1c, $06, $01, $1c, $06, $02, $24, $04, $02, $07, $1e, $02, $24, $04, $01
    db $1a, $06, $01, $1a, $06, $01, $1a, $06, $01, $1a, $06, $ff, $01, $4c, $02, $18
    db $02, $02, $24
    db $02, $02, $18, $02, $02, $24
    db $02, $02, $22, $02, $02, $21, $02, $02, $1f, $02, $02, $1b, $02, $ff, $51, $4c
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

    db $03, $2b, $0c, $03, $2b, $0c, $02, $2b, $0c, $03, $2b, $0d, $03, $2b, $0d, $02
    db $2b, $0d, $ff, $63, $4d
    db $02, $ff, $02, $30, $08, $02, $ff, $02, $30, $08, $02, $ff, $02, $2e, $08, $02
    db $ff, $02, $2e, $08, $00

    db $03, $0c, $01, $03, $0c, $01, $02, $0c, $01, $03, $0e, $01, $03, $0e, $01, $02
    db $0e, $01, $00, $03, $0e, $01, $03, $14, $01, $02, $14, $01, $03, $13, $01, $03
    db $10, $01, $02, $10
    db $01
    db $00
    db $03, $0d, $01, $01, $0d, $01, $02, $1f, $06, $02, $0d, $01, $03, $0c, $01, $01
    db $0c, $01, $02, $1f, $06, $02, $0c, $01, $00

    db $03, $0d, $01, $01, $0d, $01, $02, $1f, $06, $02, $0d, $01, $03, $0c, $01, $01
    db $0c, $01, $02, $1f, $06, $02, $0c, $01, $ff, $a3, $4c
    db $04, $24, $03, $04, $24, $01, $04, $24, $03, $04, $24, $01, $ff, $c3, $4d, $10
    db $00, $10, $ff, $dd, $50, $10, $00, $11, $ff, $dd, $50, $10, $00, $00, $ff, $dd
    db $50, $10, $ff, $ff, $dd, $50

    db $04, $24, $02, $02, $24, $03, $02, $24, $01, $ff, $a1, $4c
    db $02, $18, $15, $02, $30, $08, $02, $13, $15, $02, $30, $08, $02, $14, $15, $02
    db $30, $07, $02, $0f, $15, $02, $30, $07, $00

    db $04, $0c, $1e

    db $04, $1f, $06, $04, $0c, $1e, $02, $1f, $06, $02, $0c, $1e, $00
    db $01, $1c, $19, $01, $1a, $19, $02, $18, $19

    db $01, $1c, $19, $01, $1a, $19, $02, $18, $19, $01, $18, $19, $01, $1a, $19, $02
    db $1b, $19, $01, $18, $19, $01, $1a, $19, $02, $1b, $19, $00, $01, $29, $18, $01
    db $2a, $18
    db $02, $26, $18, $04, $28, $06, $01, $22, $18, $01, $24, $18
    db $02, $26, $18, $04, $28, $06, $00, $01, $29, $18, $01, $2a, $18, $02, $26, $18
    db $04, $28, $06, $01, $29, $18, $01, $28, $18
    db $02, $26, $18, $04, $28, $06, $00, $01, $29, $18, $01, $2a, $18, $02, $26, $18
    db $02, $28, $06, $02, $21, $18, $04, $22, $18, $04, $28, $06, $00, $01, $28, $18
    db $01, $26, $18, $01, $24, $18, $01, $1f, $18, $01, $28, $18, $01, $26, $18, $01
    db $24, $18, $01, $1f, $18, $01, $27, $18, $01, $26, $18, $01, $24, $18, $01, $20
    db $18, $01, $27, $18, $01, $26, $18, $01, $24, $18, $01, $20, $18, $00, $01, $28
    db $18, $01, $26, $18, $01, $24, $18, $01, $1f, $18, $01, $28, $18, $01, $26, $18
    db $01, $24, $18, $01, $1f, $18, $08, $27, $18, $00, $01, $28, $18, $01, $26, $18
    db $01, $24, $18, $01, $1f, $18, $01, $28, $18, $01, $26, $18, $01, $24, $18, $01
    db $1f, $18, $08, $27, $18, $ff, $c5, $4d, $01, $1c, $19, $01, $1a, $19, $02, $18
    db $19, $01, $1c, $19, $01, $1a, $19, $02, $18, $19, $01, $18, $19, $01, $1a, $19
    db $02, $1b, $19, $01, $18, $19, $01, $1a, $19, $02
    db $1b, $19, $ff, $25, $4e, $02, $18, $15, $02
    db $30, $08, $02, $13, $15, $02, $30, $08, $02, $14
    db $15, $02, $30, $07, $02, $0f
    db $15, $02, $30, $07
    db $ff
    db $85, $4e
    db $04, $0c, $1e, $04, $1c, $06, $04, $0c, $1e, $03, $1c, $06, $01, $0c, $1e, $00
    db $02, $0c, $1e, $02, $0c, $1e, $03, $1c, $06, $01, $0c, $1e, $04, $0c, $1e, $03
    db $1c, $06, $01, $0c, $1e, $00

    db $02, $0c, $1e, $02, $0c, $1e, $03, $1c, $06, $01, $0c, $1e, $04, $0c, $1e, $01
    db $1c, $06, $01, $1c, $06, $01, $1c, $06, $01, $1c, $06, $00, $02, $0c, $1e, $01
    db $0c, $1e, $01, $0c, $1e, $01, $1c, $06, $02, $0c, $1e, $02, $0c, $1e, $01, $0c
    db $1e, $02, $0c, $1e, $03, $1c, $06, $01, $0c, $1e, $00, $02, $0c, $1e, $01, $0c
    db $1e, $01, $0c, $1e, $01, $1c, $06, $02, $0c, $1e, $02, $0c, $1e, $01, $0c, $1e
    db $02, $0c, $1e, $01, $1c, $06, $01, $1c, $06, $02, $1c, $06, $00, $02, $0c, $1e
    db $01, $0c, $1e, $01, $0c, $1e, $01, $1c, $06, $02, $0c, $1e, $01, $0c, $1e, $01
    db $1c, $06, $01, $1c, $06, $01, $1c, $06, $01, $1c, $06, $01, $1c, $06, $01, $1c
    db $06, $01, $1c, $06, $01, $1c, $06, $00
    db $01, $0b, $15, $01, $fe, $01, $0b, $15

    db $01, $fe, $02, $0e, $15, $01, $fe, $02, $11, $15, $01, $fe, $01, $0e, $15, $05
    db $fe, $00, $01, $0b, $15, $01, $fe, $01, $0b, $15, $01, $fe, $02, $0e, $15, $01
    db $fe, $02, $11, $15, $01, $fe, $01, $0e, $15, $05, $fe, $ff, $47, $4f
    db $01, $1e, $19, $01, $1d, $19, $07, $23, $19

    db $01, $1d, $19, $01, $1e, $19, $02, $23, $19, $01, $1d, $19, $01, $1e, $19, $01
    db $23, $19, $00, $01, $0c, $1e, $01, $0c, $1e, $02, $0c, $1e, $01, $1c, $06, $01
    db $1c, $06, $02, $1c, $06, $01, $0c, $1e, $01, $0c, $1e, $01, $0c, $1e, $02, $1c
    db $06, $01, $0c, $1e, $01, $1c, $06, $01, $1c, $06, $00, $01, $0c, $1e, $01, $0c
    db $1e, $02, $1c, $06, $01, $1c, $06, $01, $1c, $06, $01, $0c, $1e, $01, $0c, $1e
    db $01, $0c, $1e, $01, $0c, $1e, $01, $0c, $1e, $02, $1c, $06, $01, $0c, $1e, $01
    db $1c, $06, $01, $1c, $06, $00, $01, $0c, $1e, $01, $0c, $1e, $02, $1c, $06, $01
    db $1c, $06, $01, $1c, $06, $01, $0c, $1e, $01, $0c, $1e, $01, $0c, $1e, $01, $0c
    db $1e, $01, $1c, $06, $01, $1c, $06, $01, $1c, $06, $01, $1c, $06, $01, $1c, $06
    db $01, $1c, $06, $00, $01, $0c, $1e, $01, $0c, $1e, $02, $1c, $06, $01, $1c, $06
    db $01, $1c, $06, $01, $0c, $1e, $01, $0c, $1e, $01, $0c, $1e, $01, $0c, $1e, $01
    db $1c, $06, $01, $1c, $06, $01, $1c, $06, $01, $1c, $06, $01, $1c, $06, $01, $1c
    db $06, $ff, $e7, $4e
    db $04, $0c, $02, $04, $1c, $01, $04, $0c, $02, $03, $1c, $01, $01, $0c, $02, $00
    db $02, $0c, $02, $02, $0c, $02, $03, $1c, $01, $01, $0c, $02, $04, $0c, $02, $03
    db $1c, $01, $01, $0c, $02, $00

    db $02, $0c, $02, $02, $0c, $02, $03, $1c, $01, $01, $0c, $02, $04, $0c, $02, $01
    db $1c, $01, $01, $1c, $01, $01, $1c, $01, $01, $1c, $01, $00, $02, $0c, $02, $01
    db $0c, $02, $01, $0c, $02, $01, $1c, $01, $02, $0c, $02, $02, $0c, $02, $01, $0c
    db $02, $02, $0c, $02, $03, $1c, $01, $01, $0c, $02, $00, $02, $0c, $02, $01, $0c
    db $02, $01, $0c, $02, $01, $1c, $01, $02, $0c, $02, $02, $0c, $02, $01, $0c, $02
    db $02, $0c, $02, $01, $1c, $01, $01, $1c, $01, $02, $1c, $01, $00, $02, $0c, $02
    db $01, $0c, $02, $01, $0c, $02, $01, $1c, $01, $02, $0c, $02, $01, $0c, $02, $01
    db $1c, $01, $01, $1c, $01, $01, $1c, $01, $01, $1c, $01, $01, $1c, $01, $01, $1c
    db $01, $01, $1c, $01, $01, $1c, $01, $00, $01, $0c, $02, $01, $0c, $02, $02, $0c
    db $02, $01, $1c, $01, $01, $1c, $01, $02, $1c, $01, $01, $0c, $02, $01, $0c, $02
    db $01, $0c, $02, $02, $1c, $01, $01, $0c, $02, $01, $1c, $01, $01, $1c, $01, $00
    db $01, $0c, $02, $01, $0c, $02, $02, $1c, $01, $01, $1c, $01, $01, $1c, $01, $01
    db $0c, $02, $01, $0c, $02, $01, $0c, $02, $01, $0c, $02, $01, $0c, $02, $02, $1c
    db $01, $01, $0c, $02, $01, $1c, $01, $01, $1c, $01, $00, $01, $0c, $02, $01, $0c
    db $02, $02, $1c, $01, $01, $1c, $01, $01, $1c, $01, $01, $0c, $02, $01, $0c, $02
    db $01, $0c, $02, $01, $0c, $02, $01, $1c, $01, $01, $1c, $01, $01, $1c, $01, $01
    db $1c, $01, $01, $1c, $01, $01, $1c, $01, $00, $01, $0c, $02, $01, $0c, $02, $02
    db $1c, $01, $01, $1c, $01, $01, $1c, $01, $01, $0c, $02, $01, $0c, $02, $01, $0c
    db $02, $01, $0c, $02, $01, $1c, $01, $01, $1c, $01, $01, $1c, $01, $01, $1c, $01
    db $01, $1c, $01, $01, $1c, $01, $ff, $77, $4f
    db $10
    db $ff, $ff, $17, $4f
    db $01, $30, $07, $03, $30, $07, $03, $30, $07, $02, $30, $07, $01, $30, $07, $02
    db $30, $07, $02, $30, $07, $02, $30, $07, $00, $01, $33, $08, $03, $33, $08, $03
    db $33, $08, $02, $33, $08, $01, $33, $08, $02, $33, $08, $02, $33, $08, $02, $33
    db $08, $00, $03, $08, $01, $01, $08, $01, $02, $1c, $06, $03, $08, $01, $03, $08
    db $01, $02, $1c, $06, $02, $03, $01, $00, $01, $24, $19, $01, $24, $19, $01, $25
    db $19, $01, $27, $19, $01, $24, $19, $01, $25, $19, $01, $27, $19, $01, $24, $19
    db $01, $25, $19, $01, $27, $19, $01, $24, $19, $01, $25, $19, $01, $27, $19, $01
    db $24, $19, $01, $25, $19, $01, $27, $19, $00, $03, $08, $01, $01, $08, $01, $02
    db $1c, $06, $03, $08, $01, $03, $08, $01

    db $02, $1c, $06, $02, $03, $01, $ff, $a7, $4f, $01, $24, $19, $01, $24, $19, $01
    db $25, $19, $01, $27, $19, $01, $24, $19, $01, $25, $19, $01, $27, $19, $01, $24
    db $19, $01, $25, $19, $01, $27, $19, $01, $24, $19, $01, $25, $19, $01, $27, $19
    db $01, $24, $19, $01, $25, $19, $01, $27, $19, $ff, $c7, $4f
    db $01, $30, $07, $03, $30, $07, $03, $30, $07, $02, $30, $07, $01, $30, $07, $02
    db $30, $07

    db $02, $30, $07, $02, $30, $07, $ff, $e7, $4f
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

    db $04, $fe, $ff, $09, $50
    db $01, $24, $25, $01, $23, $25, $01, $22, $25, $01, $21, $25, $01, $20, $25, $01
    db $1f, $25, $01, $1e, $25

    db $01, $1d, $25, $01, $1c, $25, $01, $1b, $25, $01, $1a, $25, $01, $19, $25, $01
    db $18, $25, $01, $17, $25, $01, $16, $25, $01, $15, $25, $01, $14, $25, $01, $13
    db $25, $01, $12, $25, $01, $11, $25, $01, $10, $25, $01, $0f, $25, $01, $0e, $25
    db $01, $0d, $25
    db $10
    db $0c, $25, $0c, $fe, $ff, $e1, $50
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

    db $01, $24, $0a, $01, $fe, $00, $00, $00
    db $05, $24, $2a, $00

    db $00
    db $00, $07, $2b, $2b

    db $00, $00
    db $00

    db $05, $2b, $2c, $00

    db $00
    db $00, $04, $24, $2d, $00

    db $00
    db $00, $03, $24, $2e, $03, $fe, $00

    db $00
    db $00

    db $08, $28, $2f, $00, $00
    db $00

    db $08, $28, $30, $00

    db $00
    db $00

    db $0a, $24, $0b, $00, $00
    db $00

    db $02, $24, $0c, $06, $fe

    db $00, $00, $00
    db $0c, $28, $31

    db $00, $00
    db $00

    db $02, $1f, $32, $00, $00
    db $00, $01, $30, $33, $01, $fe, $00

    db $00
    db $00

    db $03, $29, $34, $00

    db $00
    db $00

    db $01, $3c, $35, $01, $ff, $01, $3c, $35, $01, $ff, $01, $3c, $35, $01, $ff, $01
    db $3c, $35, $01, $ff, $01, $3c, $35, $01, $ff, $01, $3c, $35, $01, $ff, $00

    db $00
    db $00

    db $01, $2b, $36, $02, $fe, $00, $00
    db $00

    db $0a, $24, $0d

    db $00, $00, $00
    db $06, $24, $0e, $00

    db $00
    db $00, $08, $24, $0f, $00

    db $00
    db $00, $04, $18, $10, $02, $fe, $00

    db $00
    db $00, $06, $24, $11, $00

    db $00
    db $00

    db $0a, $21, $37, $00, $00
    db $00

    db $05, $37, $38, $00

    db $00
    db $00

    db $0d, $30, $12, $00, $00, $00
    db $06, $2d, $39, $05, $fe, $00

    db $00
    db $00

    db $06, $2b, $3a, $06, $fe, $00, $00
    db $00

    db $01, $24, $13, $00

    db $00
    db $00, $0a, $29, $3b

    db $00, $00
    db $00, $0a, $24, $14, $09, $fe

    db $00, $00
    db $00

    db $01, $24, $00, $00

    db $00
    db $00

    db $03, $24, $3c, $01, $fe, $03, $25, $3c, $01, $fe, $03, $24, $3c, $01, $fe, $03
    db $25, $3c, $01, $fe, $03, $24, $3c, $01, $fe, $03, $25, $3c, $01, $fe, $03, $24
    db $3c, $01, $fe, $03, $25, $3c, $01, $fe, $03, $24, $3c, $01, $fe, $03, $25, $3c
    db $01, $fe, $00, $00, $00
    db $10
    db $fe, $ff
    db $dd
    db $50
    db $01, $01, $01, $00, $00, $01, $5e

    db $ff, $00

    db $00
    db $08
    db $5e
    db $ff, $01

    db $00, $0d, $5e
    db $ff, $02, $00, $12, $5e, $ff, $00, $00, $17, $5e, $ff, $00, $00, $00, $1c, $5e

    db $ff, $00, $00, $22, $5e, $14, $00, $00, $02, $01, $00, $02, $ff, $ff, $02, $ff
    db $ff, $02, $01, $00, $00, $2a, $5e, $03, $0a, $00, $03, $f6, $ff, $03, $f6, $ff
    db $03, $0a, $00, $00, $39, $5e
    db $03, $05, $00, $03, $fb, $ff, $03, $fb, $ff, $03, $05, $00, $00, $48, $5e, $14
    db $00, $00, $03, $02, $00, $03, $fe, $ff, $03, $fe, $ff, $03, $02, $00, $00, $5a
    db $5e, $03, $01, $00, $03, $ff, $ff, $03, $ff, $ff, $03, $01, $00, $00, $69, $5e

    db $80, $01, $00, $16, $5e, $1a, $5e
    db $11
    db $5e
    db $00, $51, $91, $87, $5e, $16, $5e, $ff, $44

    db $00, $88, $5e, $00, $47, $01, $9a, $5e, $16, $5e
    db $20, $41, $01, $9a, $5e, $9a, $5e, $ff, $13

    db $00, $9b, $5e
    db $80, $44, $01, $a6, $5e, $16, $5e, $ff, $32

    db $00, $a7, $5e
    db $b5, $5e, $7a, $48, $16, $5e, $d5, $61, $11, $5e, $04, $20, $ff, $40

    db $00, $b6, $5e
    db $66, $5f, $7a, $48, $16, $5e, $cf, $61, $11, $5e

    db $66, $5f, $7a, $48, $d0, $5e, $1a, $5e, $11, $5e, $01, $0c, $ff, $00, $00, $d1
    db $5e, $66, $5f, $7a, $48, $16, $5e, $67, $5e, $11, $5e, $66, $5f, $7a, $48, $16
    db $5e, $ea, $5e, $11, $5e, $03, $02, $00, $03, $fe, $ff, $03, $fe, $ff, $03, $02
    db $00, $03, $02, $00, $03, $fe, $ff, $03, $fe, $ff, $03, $02, $00, $03, $02, $00
    db $03, $fe, $ff, $03, $fe, $ff, $03, $02, $00, $03, $02, $00, $03, $fe, $ff, $03
    db $fe, $ff, $03, $02, $00, $03, $02, $00, $03, $fe, $ff, $03, $fe, $ff, $03, $02
    db $00, $03, $02, $00, $03, $fe, $ff, $03, $fe, $ff, $04
    db $fc
    db $ff, $04, $03, $00, $00, $31, $5f, $43, $5f, $7a, $48, $16, $5e, $4b, $5f, $11
    db $5e, $28, $20, $64, $40, $ff, $60, $00, $44, $5f, $1e, $00, $00, $04, $01, $00
    db $04, $ff, $ff, $00, $50, $5f, $66, $5f, $6b, $5f, $16, $5e, $1a, $5e, $11, $5e
    db $03, $60, $03, $40
    db $ff, $20

    db $00, $67, $5f, $04, $40, $ff, $60, $00, $6c, $5f, $7c, $5f, $7a, $48, $16, $5e
    db $1a, $5e, $11, $5e, $06, $20, $ff, $40, $00, $7b, $48, $ff, $60, $00, $84, $5f
    db $02, $20, $ff, $40, $00, $89, $5f
    db $02, $20, $08, $40, $ff, $60

    db $00, $7b, $48, $a2, $5f, $ab, $5f, $b2, $5f, $67, $5e, $11, $5e, $0a, $60, $0a
    db $40, $ff, $20, $00
    db $67
    db $5f, $0a, $40, $ff, $60, $00, $7b, $48, $01, $00, $01, $03, $01, $07, $01, $0c
    db $01, $07, $01, $03, $00, $b3, $5f
    db $8f, $5f, $7a, $48, $11, $60, $1a, $5e, $11, $5e, $8f, $5f, $7a, $48, $1a, $60
    db $1a, $5e, $11, $5e, $8f, $5f, $7a, $48, $23, $60, $1a, $5e, $11, $5e, $8f, $5f
    db $7a, $48, $2a, $60, $1a, $5e, $11, $5e, $8f, $5f, $7a, $48, $31, $60, $1a, $5e
    db $11, $5e

    db $8f, $5f, $7a, $48, $38, $60, $1a, $5e, $11, $5e, $8f, $5f, $7a, $48, $3f, $60
    db $1a, $5e, $11, $5e, $8f, $5f, $7a, $48, $46, $60, $1a, $5e
    db $11
    db $5e
    db $02, $fc, $02, $00, $02, $03, $00, $12, $60, $02, $fb, $02, $00, $02, $04, $00
    db $1b, $60, $02, $00, $02, $05, $00, $24, $60, $02, $00, $02, $06, $00, $2b, $60
    db $02, $00, $02, $07, $00, $32, $60

    db $02, $00, $02, $08, $00, $39, $60, $02, $00, $02, $09, $00, $40, $60, $02, $00
    db $02, $0a, $00, $47, $60, $80, $38, $21, $9e, $60, $7e, $60, $11, $5e, $01, $05
    db $01, $09, $01
    db $f4
    db $01, $0d, $01
    db $ec
    db $01, $28, $01, $14, $01, $fe, $01, $08, $01, $02, $01, $01, $01, $13, $01, $28
    db $01
    db $1e, $01, $05, $01, $07, $01, $02, $01, $ec, $01, $05, $00, $57, $60, $14, $05
    db $00, $14, $fa, $ff, $00, $80, $60
    db $80, $c1, $21, $91, $60, $67, $5e, $11, $5e, $01, $0c, $01, $00, $01, $08, $01
    db $05, $01, $00, $00, $92, $60

    db $02, $00, $02, $03, $02, $08, $00, $9f, $60, $00, $1f, $f7, $b0, $60, $67, $5e
    db $11, $5e, $04, $00, $04, $03, $04, $06, $04, $09, $04, $0c, $04, $0f, $00, $b1
    db $60, $80, $b3, $21, $c8, $60, $1a, $5e, $11, $5e, $02, $00, $02, $05, $02, $0a
    db $00, $c9, $60
    db $80, $a8, $a4, $16, $5e, $55, $5e, $11, $5e, $01, $ec, $ff, $05, $04, $00, $00
    db $57, $5e, $80, $a8, $a4, $16, $5e, $d9, $60, $11, $5e

    db $00, $f2, $21, $11, $60, $58, $5e
    db $11
    db $5e
    db $40, $e8, $e7, $31, $60, $fd, $60, $11, $5e, $03, $01, $00, $03, $ff, $ff

    db $03, $01, $00, $03, $ff, $ff, $04, $02, $00, $04
    db $ec
    db $ff, $00, $0b, $61
    db $80, $c2, $21, $25, $61, $1b, $61, $11, $5e, $5a, $00, $00, $ff, $ff, $ff

    db $00, $1d, $61
    db $01, $00, $01, $05, $01, $09, $00, $26, $61

    db $80, $e1, $21, $4c, $61, $36, $61, $07, $5e, $01, $4c, $04, $01, $64, $00, $ff
    db $b0, $ff

    db $00, $38, $61
    db $80, $f1, $21, $4c, $61, $52, $61, $07, $5e, $01, $00, $01, $02, $00, $4d, $61
    db $01, $72, $06, $ff, $c4, $ff

    db $00, $54, $61
    db $60, $c2, $11, $65, $61, $46, $5e, $83, $61, $01, $00, $01, $0c, $ff, $00

    db $00, $66, $61, $60, $e1, $11, $65, $61
    db $76
    db $61, $83, $61, $01, $4f, $07, $00, $78, $61, $01, $39, $07, $00, $7e, $61
    db $01, $00, $ff, $01

    db $00, $84, $61
    db $40, $83, $11, $93, $61, $58, $5e, $11, $5e, $06, $00, $01, $0c, $00, $94, $61

    db $40, $72, $21, $a3, $61, $1a, $5e, $11, $5e, $01, $00, $01, $0c, $00, $a4, $61

    db $80, $c1, $21, $b3, $61, $67, $5e, $11, $5e, $01, $0c, $01, $00, $01, $07, $01
    db $03, $01, $00, $00, $b4, $61, $80, $c7, $01, $c9, $61, $67, $5e, $11, $5e, $01
    db $f4
    db $08, $00, $00
    db $ca
    db $61
    db $01, $ce, $ff, $32, $01, $00

    db $0c, $00, $00, $03, $02, $00

    db $03, $fe, $ff, $03, $fe, $ff, $03, $02, $00, $03, $03, $00, $03
    db $fd
    db $ff, $03
    db $fd
    db $ff, $03, $03, $00, $03, $04, $00, $03
    db $fc
    db $ff, $03
    db $fc
    db $ff, $03, $04, $00, $00, $da, $61, $04, $20, $ff, $40, $00, $01, $62, $ff, $60
    db $00, $08, $62, $14, $20, $14, $40, $ff, $60, $ff, $60, $00, $7b, $48
    db $80, $52, $21, $20, $62, $67, $5e, $11, $5e, $01, $00, $01, $05, $00, $21, $62

    db $c0, $0e, $f7, $16, $5e, $46, $5e
    db $11
    db $5e
    db $3a, $62, $7a, $48, $16, $5e, $58, $5e, $11, $5e, $04, $20, $ff, $40

    db $00, $3b, $62, $05, $04, $00, $05
    db $fc
    db $ff, $05
    db $fc
    db $ff, $05, $04, $00, $00, $42, $62, $80, $e1, $62, $16, $5e, $58, $62, $11, $5e
    db $01, $00, $00, $01, $3c, $ff, $01, $20, $ff, $01, $18, $ff, $01, $77, $ff, $01
    db $b4, $ff, $ff
    db $ec
    db $ff, $00, $6c, $62
    db $80, $d2, $a3, $7a, $62, $80, $62, $11, $5e, $01, $0c, $05, $00, $00, $7b, $62
    db $02, $00, $00, $ff, $02, $00

    db $82, $62, $80, $a8, $a3, $16, $5e, $91, $62, $11, $5e, $01, $f0, $ff, $04, $04
    db $00, $00, $da, $61, $0a, $00, $00, $03, $02, $00, $03, $fe, $ff, $00, $9f, $62
    db $80, $f8, $61, $b0, $62, $58, $5e, $11, $5e, $01
    db $f4
    db $01, $00, $01, $0c, $01, $00, $00, $b1, $62
    db $60, $f3, $e2, $c4, $62, $1a, $5e, $11, $5e, $04, $00, $04, $03, $04, $06, $04
    db $09, $00, $c5, $62

    db $05, $00, $00, $05, $0a, $00, $ff, $fe, $ff, $00, $d0, $62
    db $60, $e2, $c1, $ed, $62, $e3, $62, $11, $5e, $01, $01, $00, $01, $ff, $ff, $00
    db $e5, $62, $03, $00, $01, $0c, $01, $f4, $00, $ee, $62, $60, $e3, $c1, $ed, $62
    db $e3, $62, $11, $5e, $80, $e2, $c1, $08, $63, $1a, $5e, $11, $5e, $01, $f4, $02
    db $00, $06, $0c, $00, $09, $63, $01, $01, $00, $01, $ff, $ff, $00, $12, $63, $80
    db $c3, $c1, $23, $63, $10, $63, $11, $5e, $01, $00, $05, $f4, $00, $24, $63, $c0
    db $f4, $41, $33, $63, $3f, $63, $11, $5e, $01, $00, $01, $03, $01, $06, $01, $09
    db $01, $0c, $00, $34, $63, $ff, $01, $00

    db $00, $41, $63, $80, $59, $c1, $4f, $63, $1a, $5e, $11, $5e, $01, $00, $01, $01
    db $01, $02, $01, $03, $01, $04, $01, $05, $01, $06, $01, $07, $01, $08, $01, $09
    db $01, $0a, $01, $0b, $01, $0c, $01, $0d, $01, $0e, $01, $0f, $01, $10, $01, $11
    db $01, $12, $01, $13, $01, $14, $00, $50, $63, $01, $88, $13, $01, $fb, $ff, $01
    db $02, $00, $00, $7d, $63
    db $00, $f4, $41, $16, $5e, $90, $63, $11, $5e, $04, $08, $00, $04, $f6, $ff, $00
    db $92, $63

    db $80, $f2, $41, $a3, $63, $a9, $63, $11, $5e, $01, $f4, $ff, $00

    db $00, $a4, $63
    db $01, $e2, $ff, $01, $1e, $00, $01, $e2, $ff, $01, $fe, $ff, $01, $fb, $ff, $01
    db $f6, $ff, $ff, $ec, $ff

    db $00, $ab, $63, $00, $c5, $41, $c9, $63, $16, $5e, $04, $56, $ff, $54, $00
    db $ca
    db $63
    db $80, $e8, $a3, $d9, $63, $df, $63, $11, $5e, $04, $05, $0c, $00, $00, $da, $63
    db $04, $0a, $00, $01, $d8, $ff, $00, $e1, $63

    db $40, $f8, $f3, $16, $5e, $f1, $63, $11, $5e, $0c, $06, $00, $01, $b8, $ff, $00
    db $f3, $63
    db $80, $c2, $41, $16, $5e, $03, $64, $11, $5e, $07, $05, $00, $07, $fb, $ff, $00
    db $05, $64

    db $80, $c1, $51, $16, $64, $1a, $5e, $0c, $5e, $01, $0f, $ff, $05

    db $00, $17, $64
    db $80, $f1, $c1, $2c, $64, $25, $64, $11, $5e, $ff, $0a, $00

    db $00, $27, $64
    db $01, $00, $01, $01, $00, $2d, $64, $80, $a1, $11, $3c, $64, $44, $64, $11, $5e
    db $01, $0c, $01, $00, $01, $01, $00, $3f, $64, $ff, $01, $00

    db $00, $46, $64
    db $00, $f8, $f1, $54, $64, $1a, $5e, $0c, $5e, $01, $00, $01, $02, $01, $04, $01
    db $06, $01, $08, $00, $55, $64

    db $80
    db $f3, $c1, $6a, $64, $1a, $5e, $0c, $5e, $01, $05, $01, $04, $01, $03, $01, $02
    db $01, $01, $01, $00, $00, $6b, $64
    db $80, $f3, $a7, $16, $5e, $81, $64, $00, $5e, $01, $dc, $05, $ff, $08, $00

    db $00, $83, $64, $80, $f1, $41, $92, $64, $16, $5e, $02, $44, $01, $34, $01, $25
    db $ff, $22, $00, $93, $64
    db $00, $58, $87, $a4, $64, $16, $5e, $03, $46, $03, $44, $03, $42, $03, $35, $03
    db $33, $03, $31, $02, $23, $02, $22, $02, $21, $02, $20, $ff, $20

    db $00, $a5, $64
    db $00, $c3, $a1, $c4, $64, $16, $5e, $02, $33, $02, $34, $02, $35, $02, $36, $02
    db $37, $02, $43, $02, $44, $02, $45, $02, $46, $02, $47, $02, $53, $02, $54, $02
    db $55, $02, $56, $02, $57, $ff, $54

    db $00, $c5, $64
    db $00, $e4, $41, $ee, $64, $16, $5e, $0a, $55, $0a, $54, $0a, $53, $00, $ef, $64

    db $00, $e2, $41, $fe, $64, $16, $5e, $01, $1b, $01, $1c, $01, $1d, $01, $1e, $01
    db $1f, $01, $28, $01, $29, $01, $2a, $01, $2b, $01, $2c, $01, $2d, $01, $2e, $01
    db $2f, $01, $38, $01, $39, $01, $3a, $01, $3b, $01, $3c, $01, $3d, $01, $3e, $01
    db $3f, $02, $48, $02, $4a, $02, $48, $02, $4a, $02, $48, $02, $4a, $02, $48, $ff
    db $4a

    db $00, $ff, $64
    db $00, $e3, $41, $42, $65, $16, $5e, $02, $32, $02, $33, $02, $34, $02, $35, $02
    db $36, $02, $37, $02, $43, $02, $44, $02, $45, $02, $46, $02, $47, $02, $54, $02
    db $55, $02, $56, $ff, $57

    db $00, $43, $65
    db $00, $e1, $e1, $6a, $65, $16, $5e, $03, $2a, $03, $29, $03, $28, $00, $6b, $65

    db $00, $78, $41, $7a, $65, $16, $5e, $14, $34, $00, $7b, $65
    db $80, $69, $d2, $86, $65, $16, $5e, $02, $56, $02, $54, $02, $52, $02, $46, $02
    db $44, $02, $42, $02, $40

    db $01, $36, $01, $34, $01, $32, $01, $30, $01, $32
    db $01, $34, $00, $95, $65
    db $80, $f4, $e5, $aa, $65, $16, $5e, $03, $53, $03, $46, $03, $45, $03, $44, $00
    db $ad, $65

    db $00, $69, $b2, $bc, $65, $16, $5e, $02, $66, $02, $64, $02, $56, $02, $54, $02
    db $46, $02, $44, $02, $36, $02, $34, $02, $26, $02, $24, $ff, $24, $14, $66, $00
    db $d3
    db $65
    db $80, $01, $01, $16, $5e, $1a, $5e, $11, $5e, $00, $01, $01, $1b, $5e, $16, $5e
    db $7a, $48, $7a, $48, $16, $5e, $1a, $5e, $11, $5e
    WaveRAMPiss:
    db $f0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    db $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $f0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $11, $22, $33, $44, $55, $66, $77, $88, $99, $aa, $bb, $cc, $dd, $ee, $ff
    db $06, $30, $ff, $06, $31, $ff, $06, $32, $00, $06, $33, $00, $06, $34, $00, $06
    db $35, $00, $06, $36, $00, $06, $37, $00, $06, $38, $00, $06, $39, $00, $06, $3a
    db $00, $06, $3b, $00, $06, $3c, $00, $06, $3d, $00, $06, $3e, $00, $06, $3f, $00
    db $06, $3f, $ff, $06, $3e, $ee, $06, $3d, $dd, $06, $3c, $cc, $06, $3b, $bb, $06
    db $3a, $aa, $06, $39, $99, $06, $38, $88, $06, $37, $77, $06, $36, $66, $06, $35
    db $55, $06, $34, $44, $06, $33, $33, $06, $32, $22, $06, $31, $11, $06, $30, $00
    db $00, $42, $66

    db $90, $30, $9a, $00, $a5, $66, $9a, $87, $9b, $9b, $cd, $ff, $ca, $bc, $bb, $dc
    db $96, $96, $67, $65, $66, $21, $ff, $ec, $a7, $53, $32, $22, $23, $23, $22, $21
    db $11, $25, $79, $bd, $ee, $ee, $ff, $30, $ff, $00, $cb, $66
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

    db $03, $34, $f0, $03, $34, $ff, $03, $35, $f0, $03, $35
    db $ff, $03, $36, $f0, $03, $36, $ff, $03, $37, $f0, $03, $37, $ff, $03, $38, $f0
    db $03, $38, $ff, $03, $39, $f0, $03, $39, $ff, $03, $39, $f0, $03, $39, $00, $03
    db $38, $f0, $03, $38, $00
    db $03, $37, $f0, $03, $37, $00, $03, $36, $f0, $03, $36, $00, $03, $35, $f0, $03
    db $35, $00, $03, $34, $f0, $03, $34, $00, $00, $88, $67, $2d, $2d, $20, $54, $48
    db $45, $20, $45, $4e, $44, $20, $2d, $2d, $08, $0f, $08, $0f, $0b, $0f, $0b, $0e
    db $09, $0e, $08, $0f, $c0, $00, $1f, $ff, $c0, $ff, $e0, $9f, $90, $9f, $08, $07
    db $08, $07, $80, $9f, $03, $00, $ff, $ff, $00, $ff, $02, $ff, $26, $fc, $60, $cc
    db $09, $c6, $12
    db $ed

    db $40, $f0, $80, $f0, $00, $f0, $00, $f0, $00, $f0, $80, $70, $00, $f0, $80, $70
    db $08, $0f, $08, $0f
    db $08, $0f, $08, $0f, $08, $0f, $00, $0f, $04, $03, $01, $00, $60, $9f, $04, $ff
    db $0d, $f9, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $80, $7f, $05, $fa, $8a, $f5
    db $85, $3a, $0a, $f5, $05, $fa, $02, $fd, $00, $ff, $01, $fe, $40, $b0, $a0, $50
    db $40
    db $b0, $a0, $50, $40, $b0, $80, $70, $20, $c0, $80, $00, $00, $00, $00, $00, $00
    db $00, $23, $18, $1b, $20, $0b, $20, $0b, $20, $1b, $20, $00
    db $00, $00, $00, $00, $00
    db $7f, $ff
    db $fd
    db $ff, $fa, $ff, $f5, $ff, $ea, $ff, $00, $00, $00, $00
    db $00
    db $00, $fe, $ff, $40, $ff
    db $80, $c7, $18, $c7, $1c, $c7, $00, $00, $00, $00, $00, $00, $00, $30, $78, $00
    db $7c, $00, $4c, $30, $4c, $30, $1b, $20, $1b, $20, $1b, $20, $19, $20, $1c, $20
    db $1f, $20, $1f, $20, $1f, $20, $d4, $ff, $a8, $ff, $50, $ff, $a0, $7f, $00, $00
    db $ff, $00
    db $ff, $00
    db $00, $ff
    db $1c, $c7, $1c, $c7, $1c
    db $c7, $0d, $fe, $00, $00
    db $ff, $00
    db $ff, $00
    db $00, $ff, $7c, $00, $7c, $00, $7c, $00, $7c, $00
    db $fc
    db $00
    db $fc
    db $00
    db $fc
    db $00, $7c, $80, $1e, $21, $1e, $21, $1e, $21, $1e, $21, $1e, $21, $1e, $21, $1e
    db $21, $1e, $21, $00, $ff, $6b, $94, $00, $ff, $5a, $a5, $00, $ff, $00, $ff, $00
    db $ff, $00, $ff, $00, $ff, $d4, $2b, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
    db $ff, $00, $ff, $3c
    db $c0, $3c, $c0, $3c, $c0, $3c, $c0
    db $3c, $c0, $3c, $c0, $3c, $c0, $3c, $c0, $06, $21
    db $02, $25, $36, $0d, $3e, $01, $1f, $00, $00, $00, $00, $00, $00, $00, $00, $ff
    db $00, $ff, $00, $ff, $00, $ff, $55, $aa, $00, $00, $00, $00, $00, $00, $00, $ff
    db $00, $ff, $00, $ff, $00, $ff, $55, $aa, $00, $00, $00, $00, $00, $00, $24, $c0
    db $20, $c4, $30, $cc, $3c, $c0, $78, $80, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $01, $04, $03
    db $09, $07, $03, $0f, $00, $00, $00, $00, $20, $1f, $95, $7f, $7e, $ff, $ff, $ff
    db $ff, $ff, $e7, $c3, $00, $00, $00, $00, $04, $f8, $55, $fe, $ea, $ff, $55, $ff
    db $80, $ff, $a4, $c3, $00, $00, $00, $00, $00
    db $00, $00, $00, $40, $80, $20, $c0, $90, $e0, $00, $f0, $13, $0f
    db $07, $1f, $2b, $1f, $07, $3f, $0b, $3f, $15, $3f, $0e, $3f, $1f, $3f, $c3, $81
    db $81, $81, $81, $81, $81, $81, $81, $81, $80, $81, $00, $81, $00, $81
    db $c2, $81, $80, $81, $80, $81, $80, $81, $00, $81, $00, $81, $00, $81, $00, $81
    db $28, $d0, $50, $a8, $2c, $d0, $04, $f8, $88, $74, $54, $a8, $a8, $54, $44, $b8
    db $1f, $3f, $1c, $38, $08, $31, $02, $34, $29, $16, $02, $1f, $15
    db $0f, $02, $0f, $42, $81, $24, $c3, $82, $ff, $54, $ff, $08, $7f, $b0, $0f, $40
    db $80, $20, $c0, $42, $81, $24, $c3, $01, $fe, $2a, $d5, $40, $be, $0d, $f0, $02
    db $01, $04, $03, $08, $f4, $24, $18, $10, $8c, $40, $2c, $94, $68, $40, $b8, $a8
    db $50, $40, $b0, $09, $07, $04, $03, $02
    db $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $10
    db $e0, $04, $f8, $40, $ff, $a8, $7f, $20, $1f, $00, $00, $00, $00, $00, $00, $08
    db $07, $21, $1e, $0a, $f5, $51, $ae, $04, $f8, $00, $00, $00, $00, $00, $00, $90
    db $60, $20, $c0, $40, $80, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $18, $0f, $17
    db $18, $0f
    db $10
    db $0e, $10, $0e, $10, $00, $00, $00, $00, $00, $00
    db $10

    db $e0, $f8, $00
    db $78, $00, $38, $00
    db $38, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $18, $0f, $17, $18, $0f
    db $10
    db $0f
    db $10
    db $0c
    db $10
    db $0c
    db $10
    db $0c
    db $10
    db $0e, $11, $1f
    db $e0, $ff, $00
    db $fe, $00, $3c, $00, $19, $20, $18, $00, $08, $10, $18, $e0, $fc, $03, $ff, $00
    db $3f, $00, $fe, $00, $ee, $10, $00, $00, $00, $00, $00, $00, $50, $e0, $f8
    db $00, $f8, $00, $78, $00, $18, $00
    db $08, $10, $0c
    db $10
    db $0f
    db $10
    db $1f, $00, $0f, $00, $00, $00, $00, $00, $00, $00, $1b, $20, $1b, $20, $1f, $20
    db $be, $41, $ff, $00, $1f, $00, $0f
    db $10
    db $0c
    db $10
    db $fe, $10, $de, $30, $be, $60, $3f, $c0, $ff, $00, $f8, $00, $f8, $00
    db $18, $00
    db $08, $00, $18, $00
    db $48, $30, $38, $c0, $f0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c
    db $10
    db $1e, $10, $1e, $10, $0f
    db $10
    db $17
    db $08, $00, $00, $00, $00, $00, $00, $08, $10, $28
    db $10
    db $18, $20, $58, $20, $f0, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $02, $01, $04, $03, $08, $07, $00, $00, $00, $00, $00, $00
    db $30, $0f, $80, $7f, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $00, $00, $00
    db $4c
    db $b0, $a1, $5e, $53, $af, $23, $df, $47, $bf, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $40, $80, $a0, $c0, $d0, $e0, $00, $0f
    db $10
    db $0f, $00, $1f, $20, $1f, $30, $1f, $18, $3f, $3f, $3f, $00, $3f
    db $00, $ff, $00, $ff
    db $07, $ff, $1f, $ff, $1a
    db $fc
    db $30, $f8, $f8, $f0, $30, $f0, $27, $df, $4f, $bf, $ef, $ff, $fe, $ff, $58
    db $3f, $0c, $1f, $1f, $0f, $0c, $0f, $e0, $f0, $e8, $f0, $80, $f8, $04, $f8, $04
    db $f8, $00
    db $fc
    db $a8
    db $fc
    db $00
    db $fc
    db $2a, $15, $14, $2b
    db $00, $3f, $20, $1f, $20, $1f, $01, $1f, $17, $0f
    db $07, $0f, $b0, $70, $38, $f0, $30, $f8, $1a
    db $fc
    db $7f, $ff, $f7, $ff, $f2
    db $fd
    db $e4
    db $fb, $0c, $0f, $1c, $0f, $0c, $1f, $58
    db $3f, $f8, $ff, $e2
    db $fd
    db $0d, $f2, $0e, $f1, $00
    db $fc
    db $00
    db $fc
    db $00
    db $fc
    db $04, $f8, $04, $f8, $00, $f8, $08, $f0, $a0, $50, $0b, $07, $05, $03, $02, $01
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $e2
    db $fd
    db $c4, $fb, $c8, $f7, $84, $7b, $30, $0f, $00, $00, $00, $00, $00, $00, $07, $f8
    db $07, $f8, $03
    db $fc
    db $03
    db $fc
    db $0c
    db $f0, $00, $00, $00, $00, $00, $00, $50, $a0, $a0, $40, $c0, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0f, $1f
    db $10
    db $1f
    db $10
    db $1f, $01, $1e, $10, $1e, $00, $00, $00, $00, $00, $00, $ff, $ff, $00, $ff, $80
    db $00, $7f, $00, $95, $6a, $00, $00, $00, $00, $00, $00, $fe, $ff, $00, $ff, $0b
    db $00
    db $dd
    db $22, $ab, $54, $00, $00, $00, $00, $00, $00, $80, $00, $00, $80, $08, $f0, $80
    db $78, $88, $70, $01, $1e, $10, $1f
    db $10
    db $1f
    db $10
    db $1f, $11, $1e, $12, $1c, $01, $1c, $19, $04, $ff, $00, $ff, $00, $00, $ff, $00
    db $ff, $00, $00, $ff, $00, $3f, $ff, $3f
    db $e4
    db $ff, $00, $ff, $00, $ab, $ff, $00, $ff, $05, $00, $ff, $00, $fe, $ff, $fe, $93
    db $80, $78, $48, $f0, $80, $f8, $00, $f8, $80, $78, $c0, $38, $40, $b8, $58, $a0
    db $09, $1c, $19, $1c, $19, $1c, $19, $1c, $1b, $1c, $19, $1c, $1b, $1c, $19, $1e
    db $3f, $ff, $3f
    db $e4
    db $3f, $ff, $3f, $fb, $3f, $ff, $3f
    db $fc
    db $3f, $ff, $ff, $00, $fe, $ff, $fe, $93
    db $fe, $ff, $fe, $ff, $fe, $ff, $fe, $3f, $fe, $ff, $ff, $00, $40, $b0, $40, $b0
    db $40, $b0, $40, $b0, $40, $b0, $40, $b0, $40
    db $b0, $a0, $70, $18, $1f, $18, $1f, $08, $1f, $10, $0f, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $ff, $01, $fe, $00, $ff, $00, $ff, $00, $00, $00, $00, $00
    db $00, $00, $00, $0a
    db $ff, $e0, $3f, $c0, $7f, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $c0
    db $f0, $00, $f0, $00, $f0, $10, $e0, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $08, $00, $00, $04, $06, $02, $02, $01, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $1c, $00, $5c, $3e, $d7, $e2, $03, $01, $00, $01, $01, $00, $00
    db $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $80, $00, $80, $80, $80, $80, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $01, $00, $01, $00, $01, $00, $01, $00, $03, $00, $05, $03
    db $00, $00, $bf, $7f, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $c0, $00, $20, $c0
    db $00, $00, $f9, $7e, $fe, $7f, $ff, $7f, $ff, $7f, $7f, $7f, $00, $00, $00, $00
    db $00, $00, $00, $00, $80, $00, $80, $00, $80, $00, $80, $00, $01, $00, $01, $00
    db $01, $00, $01, $00, $01, $00, $01, $00, $00, $01, $00, $01, $98, $e0, $df, $3f
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $19, $07, $fb
    db $fc
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $80, $00, $80, $00
    db $80, $00, $80, $00, $80, $00, $80, $00, $00, $80, $00, $80, $01, $01, $01, $01
    db $00, $01, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff
    db $ff, $ff, $3f, $ff, $00, $ff, $82, $7d, $20, $1f, $00, $00, $ff, $ff, $ff, $ff
    db $ff, $ff
    db $fc
    db $ff, $05, $fa, $ab, $54, $54, $a8, $00, $00, $80, $80, $80, $80, $00, $80
    db $80, $00, $80, $00, $00, $00, $00
    db $00, $00, $00, $20, $00
    db $18, $00
    db $14, $08, $0e, $04, $04, $02, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00
    db $08, $07, $20, $1f, $58, $3f, $bc, $7f, $3c, $ff, $18, $ff, $00, $00, $00, $00
    db $20, $d0, $14, $e8, $0a
    db $f4
    db $07, $f8, $0b
    db $f4
    db $05, $fa, $02, $00, $0c, $00, $14, $08, $38, $10
    db $10
    db $20, $00
    db $00, $80, $00, $80, $00, $00, $01, $00, $01, $00, $01, $00, $01, $58, $3d, $00
    db $01, $01, $00, $00, $00, $40, $ff, $60, $ff, $40, $ff, $00, $ff, $00, $ff, $00
    db $ff, $00, $ff, $00, $ff, $03
    db $fc
    db $05, $fa, $03, $fc, $05, $fa, $0b, $f4
    db $07, $f8, $0b
    db $f4
    db $17, $e8, $c0, $00, $c0, $00, $c0, $00, $c0, $00, $cd, $1e, $c0, $00, $80, $00
    db $80, $00, $00, $00, $00, $00, $00, $00, $04, $02, $0e, $04, $14, $08, $18, $00
    db $20, $00
    db $80, $7f, $40, $3f, $20, $1f, $08, $1f, $10, $0f, $14, $0f, $04, $0f, $00, $0f
    db $2f, $d0, $1e, $e0, $2c, $d0, $5c, $a0, $38, $c0, $78, $80, $b8, $40, $78, $80
    db $00, $00, $00, $00, $00
    db $00
    db $10
    db $20, $38
    db $10
    db $14, $08, $0c, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $0f, $00, $16, $0f, $0f, $00, $16, $0f, $0f, $00
    db $12, $0f, $07, $00, $06, $03, $c0, $00, $34, $c8, $c8, $00, $34, $c8, $c8, $00
    db $34, $c8, $f8, $00, $d0, $20, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $0c, $83, $19, $87, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $fe, $b4, $fe, $68, $fe, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $0c, $83, $19, $87, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $fe, $b4, $fe, $68, $fe, $32
    db $8f, $65, $9f, $4b, $bf, $16, $ff, $80, $00, $00, $01, $00, $01, $00, $01, $d2
    db $fc, $a6, $f8, $4c, $f0, $98, $e0, $00, $00, $00, $ff, $19, $07, $32, $0f, $32
    db $8f, $65, $9f, $4b, $bf, $16, $ff, $80, $00, $02
    db $fc
    db $68
    db $fc
    db $f0, $9c, $d2, $fc, $a6, $f8, $4c, $f0, $98, $e0, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $01, $00, $01, $00, $01, $00, $01, $01, $00, $00, $00, $00, $00
    db $00, $00, $65, $1f, $cb, $3f, $96, $7f, $2d, $ff, $00, $00, $00, $00, $00, $00
    db $00, $00, $94, $a8, $2c, $b0, $b0, $b8, $78, $bc, $3c, $3e, $3e, $3f, $3f, $3f
    db $3f, $3f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80
    db $80, $c0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $3f, $3f, $3f, $3f, $2b, $37, $01, $03, $00, $01, $01, $00, $00, $00
    db $00, $00, $00, $80, $80, $00, $00, $80, $c0, $80, $80, $c0, $00, $c0, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00
    db $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $7f, $02
    db $fd
    db $05, $fa, $00, $04, $00, $0e, $00, $0e, $00, $0e, $0a, $04, $0d, $f2, $a0, $5f
    db $50, $af, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $00
    db $00, $80, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $02
    db $fd
    db $00, $ff, $80, $00, $1f, $40, $1f, $00, $1f, $00, $80, $00, $30, $c0, $a0, $5f
    db $00, $ff, $02, $01, $f1, $01, $f1, $01, $f1, $01, $03, $01, $1a, $07, $00, $80
    db $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $01, $00
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $07, $ff
    db $00, $ff, $7b, $ff, $7f, $fb, $3d, $c2, $7b, $ff, $7f, $fb, $3d, $c2, $fc, $ff
    db $00, $ff, $de, $ff, $ff, $de, $ef
    db $10
    db $de, $ff, $ff, $de, $ef
    db $10
    db $80, $00, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $01, $00, $00, $00
    db $7b, $ff, $7f, $fb, $3d, $c2, $7b, $ff, $7f, $fb, $3c, $c3, $02, $fc, $80, $7f
    db $de, $ff, $ff, $de, $ef
    db $10
    db $de, $ff, $ff, $de, $2f, $d0, $40, $3f, $01, $fe, $00, $80, $00, $80, $00, $80
    db $00, $80, $00, $80, $00, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $14, $14, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $08, $00, $1c, $08, $3e, $14, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $0c, $04, $0c, $08, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $18, $10, $18, $08, $00, $00, $00, $00, $00, $00
    db $00, $00
    db $00, $00, $00, $00, $0a, $0a
    db $14, $14, $00, $00, $3e, $7f, $77, $63, $60, $60, $60, $60, $77, $63, $3e, $7f
    db $1c, $08, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $00, $00, $18, $18
    db $18, $18, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $30, $30
    db $30, $30
    db $00, $00
    db $00, $00, $00, $00
    db $00, $00
    db $1c, $3e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $30, $10, $30, $20, $18, $18
    db $10
    db $18, $00
    db $10, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    db $bf, $00, $fa, $00, $48, $00, $25, $00, $90, $00
    db $44, $00, $28, $00
    db $41, $00
    db $14, $00, $81, $00, $4d, $00, $2b, $00, $8a, $00, $25, $00, $95, $00, $02, $00
    db $52, $00, $04, $00, $e8, $17, $e8, $17
    db $e4
    db $1b, $74, $0b, $ea, $15, $f4, $0b, $7d, $02, $b6, $09, $09, $ff, $00, $ff, $00
    db $ff, $01, $fe, $8b, $74, $25, $da, $17, $e8, $4b, $b4, $04, $fb, $12
    db $ed
    db $a0, $5f, $69, $96, $a9, $56, $d5, $2a
    db $ed
    db $12, $be, $41, $df, $20, $b7, $48, $af, $50, $5d, $a0, $7f
    db $80, $5f, $a0, $bf, $40, $ff, $00, $e0, $1f
    db $fd
    db $02, $7f, $00, $af, $00, $f7, $00, $5d, $00, $ff, $00, $bf, $00, $ff, $00, $7f
    db $80, $fb, $00, $ff, $00, $ef, $00, $bf, $00, $ff, $00, $3e, $c0, $a0, $5f, $d4
    db $2b, $f9, $06, $ed, $12, $fa, $05, $f7, $08, $ff, $00, $ff, $00, $38, $c7, $4e
    db $b1, $2b, $d4, $5f, $a0, $af, $50, $ff, $00, $ff, $00, $ff, $00, $20, $ff, $01
    db $fe, $80, $7f, $50, $bf, $81, $7e, $81, $7e, $c1, $3e, $81, $7e, $5d, $a0, $7c
    db $80, $ad, $50, $bc, $40, $7c, $80, $5a, $a0, $7d, $80, $b8, $40, $57, $00, $ba
    db $00, $17, $00, $ad, $00, $b6, $00, $5b, $00, $6a, $00, $ab, $00, $b5, $00
    db $eb
    db $00, $b3, $00, $d7, $00
    db $db
    db $00
    db $e3
    db $00, $aa, $00, $aa, $00, $e7, $1f, $f5, $0f, $f3, $0f, $59, $a7, $39, $c7, $1f
    db $e3
    db $3f, $c3, $db, $27, $ff, $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $fe, $ff, $ff, $ff, $fe, $ff, $fe, $ff, $fa, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $bd, $00, $b7, $00, $bb, $00, $2b, $80, $6b, $80, $7b, $80
    db $95, $e0, $c8, $f0, $94, $00, $c2, $00, $c4, $00, $e2, $00, $61, $80, $c4, $00
    db $43, $00, $29, $00, $10, $00, $42, $00, $08, $00, $80, $00, $0a, $00, $a0, $00
    db $00, $00, $49, $00
    db $fd
    db $02, $3f, $00, $7f, $00, $3f, $00, $7f, $00, $1f, $00, $5f, $00, $0b, $00, $07
    db $f8, $8b, $74, $a7, $58, $85, $7a
    db $d3
    db $2c
    db $eb
    db $14, $d5, $2a, $fa, $05, $ff, $00, $ff, $00, $df, $00, $ad, $00, $ff, $00, $ff
    db $00
    db $fc
    db $03, $f0, $0f, $be, $40, $ff, $00, $ff, $00, $5f, $00, $be, $01, $dd, $02
    db $fc
    db $03, $2a, $d5, $ee, $01, $fe, $01
    db $fd
    db $02, $61, $9e, $08, $f7, $0a, $ff, $2e, $ff, $02, $ff, $bf, $40, $bf, $40, $56
    db $a9, $00, $ff, $95, $7f, $3a, $ff, $bb
    db $fc
    db $13
    db $fc
    db $7f, $00
    db $fc
    db $00, $da, $20, $3d, $c0, $1b, $e0, $3d, $c2, $d6, $29, $e9, $16, $7a, $00, $ff
    db $00, $ff, $00, $cf, $30, $a7, $58, $02
    db $fd
    db $43, $bc, $03
    db $fc
    db $d1, $3e, $85, $7a, $82, $7d, $03
    db $fc
    db $85
    db $7a, $15, $ea, $8b, $74, $55, $aa, $7d, $80, $d9, $20, $f4, $00, $75, $80, $f2
    db $00, $51, $80, $d4, $00, $ca, $00, $55, $00, $2a, $00, $a5, $00, $52, $00, $4a
    db $00, $55, $00, $aa, $00, $49, $00, $5d, $00, $be, $00, $1f, $00, $bb, $04, $9f
    db $00, $5d, $02, $4f, $00, $3d, $02, $65, $1f, $6f, $1f, $27, $1f, $f7, $0f
    db $db
    db $07, $fb, $07, $ef, $1f, $5f, $bf, $fa, $e0, $ef, $f0, $f7, $f8, $e1, $fe, $fc
    db $ff, $f9, $fe, $fc, $ff, $f9, $fe, $8a, $00, $10, $00, $54, $00, $89, $00, $e0
    db $00, $a5, $00, $d0, $00, $a0, $00, $20, $00
    db $84, $00, $11, $00, $40, $00, $01, $00, $24, $00, $00, $00, $11, $00, $2f, $00
    db $02, $00, $2a, $00, $02, $00, $25, $00, $41, $00, $08, $00, $22, $00
    db $fd
    db $02, $fe, $01
    db $fd
    db $02, $df, $00, $7f, $00, $5f, $00, $ef, $00, $37, $00, $54, $ab, $c0, $3f, $b0
    db $4f, $60, $9f, $d4, $2b, $f0, $0f, $d8, $27
    db $f4
    db $0b, $44, $bb, $05, $fa, $02, $fd, $a8, $57, $02
    db $fd
    db $10
    db $ef, $0a, $f5, $05, $fa, $01, $fe, $4d, $b2, $b5, $4a, $80, $7f, $50, $af, $a0
    db $5f, $16, $e9, $55, $aa, $05, $fa, $68, $97, $54, $ab, $00, $ff, $00, $ff, $00
    db $ff, $82, $7d, $69, $96, $2c
    db $d3
    db $52, $ad, $09, $f6, $aa, $55, $a1, $5e, $94, $6b, $52, $ad, $54, $ab, $05, $fa
    db $05, $fa, $0b
    db $f4
    db $0f, $f0, $45, $ba, $17, $e8, $57, $a8, $2b, $d4, $2f, $d0, $bf, $40, $2f, $d0
    db $5d, $a0, $be, $40
    db $fd
    db $00, $7e, $80, $fa, $00, $d2, $00, $a9, $00, $4a, $00, $51, $00, $aa, $00, $64
    db $00, $d2, $00, $a8, $00, $a5, $00, $14, $00, $52, $00, $25, $00, $4f, $00, $8e
    db $01, $5b, $07, $f5, $0f, $74, $0f, $2e, $1f, $ae, $1f, $77, $0f, $f1, $0f
    db $10
    db $ef, $c1, $fe, $e4, $ff, $9f, $7f, $3f, $ff, $bf, $ff, $df, $ff, $27, $ff, $05
    db $ff, $a7, $5f, $1b, $ff
    db $fc
    db $ff
    db $fc
    db $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $90, $00, $85
    db $00, $ef, $00, $78, $87, $43, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $04, $00, $c1
    db $00, $21, $c0, $80, $e0, $d9, $e0, $ec, $f0, $f2
    db $fc
    db $f9, $fe, $01, $00, $48, $00, $a2, $00, $c4, $00, $e0, $00, $d1, $00, $a0, $00
    db $04, $00, $5b, $00, $4d, $00, $26, $00, $95, $00, $55, $00, $35, $00, $54, $00
    db $35, $00
    db $fd
    db $02, $bd, $02, $de, $01, $7f, $00, $af, $00, $6f, $00, $b7, $00, $57, $00, $09
    db $f6, $05, $fa, $80, $7f, $01, $fe, $00, $ff, $80, $7f, $80, $7f, $a0, $5f, $56
    db $a9, $55, $aa, $ff, $00, $5b, $a4, $bf, $40, $5d, $a2, $2b, $d4, $08, $f7, $ae
    db $51, $bd, $42, $ef
    db $10
    db $7f, $80, $ff, $00, $ee, $11, $5a, $a5, $aa, $55, $fa, $05, $aa, $55, $f8, $07
    db $ac, $53, $d0, $2f, $a8, $57, $94, $6b, $00, $ff, $5f, $a0, $2f, $d0, $3f, $c0
    db $5e, $a0, $3e, $c0, $7d, $80, $7e, $80, $ba, $40
    db $fd
    db $00, $fa, $00, $dd, $00, $ea, $00, $b5, $00, $6d, $00, $d5, $00, $b7, $00, $e2
    db $00, $b4, $00, $68, $00, $f2, $00, $b1, $00
    db $e8, $00, $74, $00, $f1, $00, $6f, $1f, $cf, $3f, $ff, $0f, $59, $07, $2d, $02
    db $95, $00, $4a, $00, $20, $00
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $1f, $ff, $ff, $0f, $b0, $0f, $1e, $01
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $5f, $bf
    db $ff, $ff, $ff, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff
    db $fd
    db $fe, $fd, $fe, $f3
    db $fc
    db $e4
    db $f8, $d8, $e0, $99, $e0, $20, $c0, $e2, $00, $88, $00, $10, $00, $04, $00, $20
    db $00
    db $02, $00, $10, $00, $01, $00, $48, $00, $00, $00, $58, $00, $2d, $00, $34, $00
    db $1e, $00, $55, $00, $1e, $00, $2e, $00, $17, $00, $ab, $00, $55, $00, $aa, $00
    db $15, $00, $a5, $00, $88, $00, $a5, $00, $a4, $00, $d0, $2f, $f0, $0f
    db $fd
    db $02, $7b, $04, $7e, $01, $af, $00, $5f, $00, $2b, $00, $12
    db $ed
    db $09, $f6, $6d, $92, $57, $a8, $fa, $05, $ef
    db $10
    db $ff, $00, $ff, $00, $51, $ae, $5c, $a3, $75, $8a, $bc, $43, $fe, $01
    db $fd
    db $02, $fe, $01, $ef, $00, $2a, $d5, $45, $ba, $37, $c8, $d5, $2a, $bf, $40, $7f
    db $80, $ff, $00, $7e, $80
    db $fd
    db $00, $f6, $00, $ea, $00, $da, $00, $69, $00, $aa, $00, $a9, $00, $d4, $00, $d5
    db $00, $af, $00, $ab, $00, $af, $00, $5f, $00, $af, $00, $5f, $00, $bf, $00
    db $f4
    db $00, $f9, $00, $f0, $00, $fa, $00, $f8, $00, $f9, $00, $fa, $00, $f8, $00, $8a
    db $00, $21, $00, $8a, $00, $04, $00, $91, $00, $04, $00, $11, $00, $84, $00, $ab
    db $00, $00, $00, $55, $00, $08, $00, $52, $00, $04, $00, $50, $00, $05, $00, $d7
    db $3f, $70, $0f, $36, $01, $83, $00, $59, $00, $84, $00, $2a, $00, $24, $00, $ff
    db $ff, $7f, $ff, $7f, $ff, $8f, $7f, $e7, $1f, $39, $07, $8d, $02, $2b, $00, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $fe, $ff, $f7
    db $fc
    db $f3
    db $fc
    db $e0, $f8, $c9, $f0, $90, $e0, $25, $c0, $d0, $00, $94, $00, $21, $00, $00, $00
    db $a2, $00, $00, $00, $40, $00, $12, $00, $80, $00, $00, $00, $02, $00, $10, $00
    db $00, $00, $40, $00, $02, $00, $10, $00, $40, $00, $00, $00, $4e, $00, $1f, $00
    db $0f, $00, $4f, $00, $17, $00, $1f, $00, $8f, $00, $17, $00, $d2, $00, $a5, $00
    db $d4, $00, $f2, $00, $da, $00, $f9, $00, $f5, $00
    db $fd
    db $00, $95, $00, $25, $00, $4a, $00, $91, $00, $44, $00, $29, $00, $40, $00, $2a
    db $00, $5f, $00, $5f, $00, $aa, $00, $56, $00, $52, $00, $14, $00, $a2, $00, $49
    db $00, $df, $00, $bf, $00
    db $eb
    db $00, $ad, $00, $aa, $00, $a5, $00, $a9, $00, $45, $00, $fb, $00
    db $ed
    db $00, $da, $00, $6d, $00, $a4, $00, $52, $00, $2a, $00, $49, $00, $4a, $00, $52
    db $00, $8d, $00, $55, $00, $2b, $00, $ad, $00, $97, $00, $55, $00, $df, $00, $bf
    db $00, $7e, $01, $df, $00, $7d, $02, $fe, $01, $fb, $04, $ff, $00, $7c, $80, $fa
    db $00, $bc, $40, $6a, $90, $bd, $40, $fe, $00, $7e, $80, $ee, $10, $28, $00
    db $42, $00, $10, $00, $45, $00, $10, $00, $41, $00, $08, $00, $a2, $00, $90, $00
    db $25, $00, $08, $00, $42, $00, $24, $00, $08, $00, $42, $00, $28, $00
    db $91, $00, $04, $00, $92, $00, $41, $00, $88, $00, $25, $00, $88, $00, $45, $00
    db $40, $00, $aa, $00, $09, $00, $52, $00, $04, $00, $51, $00, $8a, $00, $20, $00
    db $fd
    db $fe, $fe, $f8, $f6, $f8, $e9, $f0, $ca, $f0, $92, $e0, $65, $80, $4a, $80, $42
    db $00, $28, $00
    db $a0, $00, $44, $00, $10, $00, $82, $00, $24, $00, $08, $00, $40, $00, $08, $00
    db $80, $00, $00, $00, $12, $00, $00, $00, $40, $00, $08, $00, $00, $00, $92, $00
    db $00, $00, $09, $00, $20, $00
    db $00, $00, $00, $00, $84, $00, $4f, $00, $1f, $00, $4f, $00, $1f, $00, $2f, $00
    db $1f, $00, $97, $00, $2f, $00, $f5, $00, $fe, $00, $ff, $00
    db $ff, $00, $df, $20, $ff, $00, $df, $20, $f7, $08, $51, $00, $d4, $00, $55, $00
    db $aa, $00, $6b, $00, $b5, $00, $ea, $00, $f5, $00, $12, $00, $80, $00, $54, $00
    db $22, $00, $54, $00, $55, $00, $ad, $00, $d7, $00, $22, $00, $89, $00, $44, $00
    db $29, $00, $92, $00, $49, $00, $55, $00, $bf, $00, $24, $00, $55, $00, $95, $00
    db $2d, $00, $5e, $00, $b7, $00, $7d, $00, $d7, $00, $be, $00, $6b, $00, $bf, $00
    db $ef, $00, $bf, $00, $ff, $00, $ff, $00, $7f, $00
    db $ed
    db $12, $ff, $00
    db $ed
    db $12, $fe, $01, $ef
    db $10
    db $fa, $05, $55, $aa, $7a, $85, $7e, $80, $bf, $40
    db $ed
    db $10
    db $bf, $40, $ff, $00, $bf, $40, $ef
    db $10
    db $bf, $40, $10, $00, $42, $00, $28, $00
    db $81, $00, $2a, $00, $91, $00, $4a, $00, $d1, $00, $82, $00, $11, $00, $04, $00
    db $10, $00, $45, $00, $00, $00, $2a, $00, $40, $00, $20, $00
    db $14, $00, $a1, $00, $14, $00, $41, $00, $14, $00, $49, $00, $10, $00, $8a, $00
    db $21, $00, $44, $00, $12, $00, $49, $00, $24, $00, $09, $00, $a4, $00, $ff, $00
    db $55, $aa, $ff, $00, $aa, $55, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $00
    db $55, $aa, $ff, $00, $aa, $55, $ff, $09, $ae, $55, $f7, $08, $5a, $a5, $ff, $00
    db $55, $aa, $ff, $00, $aa, $55, $ff, $40, $aa, $77, $ff, $08, $5a, $b5, $ff, $00
    db $55, $ab, $ff
    db $02, $af, $75, $ff, $80, $ba, $57, $f7, $08, $5e, $b5, $ff, $12, $5d
    db $eb
    db $ff, $ac, $ba, $55, $ff, $20, $ea, $5d, $f7, $08, $fa, $a5, $ff, $48, $f5, $aa
    db $ff, $40, $ab, $55, $ff, $14, $aa, $d5, $f7, $08, $7a, $e5, $ff, $80, $55, $aa
    db $ff, $00, $aa, $55
    db $ff, $00, $aa, $57, $f7, $08, $5a, $a5, $ff, $00, $55, $ae, $ff, $00, $aa, $55
    db $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $08, $57, $aa, $ff, $81, $ea, $7d
    db $ff
    db $15, $aa, $75, $f7, $4a, $5a, $a5, $ff, $20, $d5, $aa, $ff
    db $50, $ae, $55, $ff, $02, $aa, $f5, $f7, $58, $5e, $a5, $ff, $00, $55, $aa, $ff
    db $00, $aa, $d5, $ff, $80, $ea, $55, $ff, $28, $da, $b7, $ff, $00, $57, $aa, $ff
    db $00, $aa, $5d, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff
    db $10
    db $55, $aa, $ff, $00, $aa, $55, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $02
    db $55, $aa, $ff, $02, $ab, $55, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $00
    db $75, $ea, $ff, $08, $ea, $55, $ff, $20, $aa, $55, $f7, $08, $5a, $a5, $ff, $00
    db $55, $aa, $ff, $00, $ab, $55
    db $ff
    db $0b, $ff, $55, $ff, $2a, $5a, $ad, $ff, $01, $55, $aa, $ff, $d4, $ea, $75, $ff
    db $50, $ea, $55, $f7, $08, $5a, $a5, $ff
    db $10
    db $55, $ae, $ff, $01, $ae, $55, $ff
    db $10
    db $aa, $55, $ff, $28, $da, $a5, $ff, $30, $d5, $aa, $ff, $40, $ea, $55, $ff, $00
    db $aa, $55, $f7, $08, $5a, $a5, $38, $c0, $88, $f0, $e7, $c0, $9f, $00, $0f, $70
    db $ce, $f1, $00, $00, $0f, $00, $35, $0a, $c0, $3f, $8a, $71, $00, $c0, $5c, $8e
    db $b7, $1f, $00, $00, $00, $00, $c0, $00, $60, $80, $30, $c0, $98, $60, $48, $30
    db $04, $38, $01, $00
    db $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $29, $c6
    db $81, $66, $80, $73, $42, $39, $21, $1c, $3a, $04, $1d, $02, $3e, $01, $de, $01
    db $ad, $00, $de, $00
    db $ed
    db $02, $c6, $01
    db $e3
    db $00, $45, $00, $e2
    db $00, $18, $fd, $31, $f8, $a0, $40, $04, $03, $44, $bf, $01, $fe, $ff, $00, $f5
    db $00, $04, $f8, $04, $f9, $85, $79, $f0, $0d, $7a, $85, $d7, $00, $a2, $00, $01
    db $00, $33
    db $fc
    db $ab, $9c, $81, $8e, $83, $c0, $0d, $f0, $8f, $70, $ba, $00, $55, $00, $a1, $63
    db $80, $66, $94, $66, $de, $27, $f8, $07, $5e, $01, $af, $00, $05, $00, $cf, $f0
    db $ef, $70, $0d, $30, $1f, $00, $3a, $c0
    db $35, $c0, $e8, $00, $54, $00, $01, $bf, $a1, $1f, $d8, $07, $e6, $01, $a9, $00
    db $04, $00, $01, $00, $04, $00, $94, $18, $04, $98, $06, $98
    db $0c
    db $80, $14, $e8, $f8, $00, $34, $00, $a8, $00, $00, $00, $00, $00, $00, $00, $02
    db $00, $05, $00, $2b, $00, $45, $18, $1b, $00, $58, $07, $30, $0f, $64, $18, $c3
    db $30, $ce, $27, $a8, $4c, $9d, $4e, $84, $4e, $f0, $00, $68
    db $80, $b1, $40, $18, $60, $31, $c0, $5a, $20, $15, $60, $bb, $40, $6a, $00, $bf
    db $00, $7b, $04
    db $e4
    db $1b, $90, $60, $a4, $4c, $8d, $5c, $cc, $19, $80, $00
    db $40, $00, $82, $00, $d5, $00
    db $e3
    db $00, $57, $80, $6b, $80, $47, $80, $2a, $00, $7f, $00
    db $e3
    db $1c, $80, $7f, $41, $80, $00, $b6, $a6, $34, $65, $2c, $82, $00, $41, $00, $a2
    db $00, $c5, $00, $63, $80, $46, $81, $63, $80, $56, $81, $a8, $00, $5c, $00, $ee
    db $10, $81, $7e, $01, $c2, $22, $99, $01, $82, $99, $36, $01, $00, $02, $00, $81
    db $00, $42, $01, $86, $01, $cc, $02, $94, $03, $4c, $03, $50, $00, $a0, $00, $f0
    db $00, $7a, $80, $1d, $00, $46, $78, $05, $18, $0e, $d0, $00, $00, $00, $00, $00
    db $00, $00, $00, $40, $00, $80, $00, $00
    db $60, $e0, $00, $15, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $81, $60, $c8, $37, $33, $0c, $1e, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $71, $80, $6a, $80, $d1, $00, $80, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $80, $41, $d1, $2e, $6f
    db $10
    db $1d, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $e3
    db $00, $c5, $00, $a2, $00, $41, $00, $00, $00, $00, $00, $00, $00, $00, $00, $40
    db $2d, $83, $7c, $ff, $00, $2a, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $e3
    db $00, $c5, $00, $82, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01
    db $86, $23, $dc, $de, $20, $35, $00, $00, $00, $00, $00, $00, $00, $00, $00, $96
    db $00, $0f, $00, $87, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $2d
    db $10
    db $9a, $60, $f0, $00, $c0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $0a, $0b, $0c, $0d, $0e, $0f
    db $10
    db $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $00, $00, $1c, $1d, $1e
    db $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $00
    db $00, $00
    db $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d
    db $3e, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $3f, $40, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $41, $42, $43
    db $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $44, $45
    db $46, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $47, $48, $49, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $4a, $4b, $4c, $4d, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $4e, $4f, $50, $51, $52, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $53, $54, $55
    db $56, $57, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $58, $59
    db $5a, $00, $5b, $5c, $5d, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $5e, $5f, $60, $61, $62, $63, $64, $65, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $66, $67, $68, $69, $6a, $6b, $6c, $6d, $6e, $6f
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $70, $71, $72, $73, $74, $75
    db $76
    db $77, $78, $79, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $7a, $7b, $7c
    db $7d, $7e, $7f, $80, $81, $82, $83, $84, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $00, $00, $00, $00, $00
    ds 169, $00
    db $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $00
    db $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01
    db $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01
    db $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $4f
    db $21, $cf, $73, $11, $00, $90, $01, $00, $08, $cd, $b0, $01, $21, $cf, $7b, $11
    db $00, $88, $01, $50, $01, $cd, $b0, $01, $3e, $09, $11, $00, $98, $21, $1f, $7d
    db $06, $14, $0e, $09, $cd, $d4, $01, $af, $11, $20, $99, $06, $14, $0e, $09, $cd
    db $d4, $01, $fa, $0d, $df, $6f, $fa, $0e, $df, $67, $cd, $84, $0e, $cd, $84, $0e
    db $cd, $84, $0e, $cd, $84, $0e, $cd, $84, $0e, $cd, $84, $0e, $3e, $01, $ea, $ac
    db $d8, $cd, $06, $02, $c9

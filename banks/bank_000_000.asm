; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "src/interrupts.asm"

INCLUDE "src/header.asm"

SECTION "FIXED BANK ROM", ROM0[$0150]
ProgramStart:
    di                      ; disable interrupts
    ld hl, $c1fe            ; setup stack pointer
    ld sp, hl
    call GBC_Check          ; Do a RAM Check to check if the ROM is being booted on the correct hardware

    jr_000_0158:
    .WaitForVBlank:
    ldh a, [rLY]            ; Check current rendering line
    cp $90                  ; Wait until VBlank (Line 144)
    jr c, .WaitForVBlank    ; If carry is set, that means (rLY - $90) < 0, did not reach VBlank. Do another loop.

    xor a                   ; Zero out A register
    ldh [rLCDC], a          ; Turn off LCD

    ; CAUTION!
    ; Stopping LCD operation (Bit 7 from 1 to 0) may be performed during VBlank ONLY.
    ; Disabling the display outside of the VBlank period may damage the hardware by burning in a black horizontal line.
    ; This appears to be a serious issue. Nintendo is reported to reject any games not following this rule.

Jump_000_0161:
    ld e, $00
    call Call_000_3e56
    xor a
    call Call_000_3e64
    call Call_000_3e7f
    call Call_000_3e7f
    call Call_000_3e7f
    call Call_000_3e7f
    ld a, [$ffa1]
    or a
    jr nz, jr_000_0184

    ld a, $28
    ld hl, $c200
    call $6e9a

jr_000_0184:
    call $75c4
    call Call_000_024b
    ld a, [$ffa1]
    or a
    jr nz, jr_000_0199

    ld a, [$c359]
    ld b, a
    ld a, $83
    or b
    jr jr_000_019b

jr_000_0199:
    ld a, $89

jr_000_019b:
    ldh [rLCDC], a
    ei
    call $75c9
    di
    jr jr_000_0158


; ClearRAM routine
; This fills parts of RAM to value set in register A
; Parameters: A = Value to fill RAM with; BC = Amount of RAM to fill; HL = RAM Address to start filling
ClearRAM:
    ; Initial setup
    inc b
    inc c
    jr .DecreaseValues

.StoreValue:
    ld [hl+], a

.DecreaseValues:
    dec c
    jr nz, .StoreValue

    dec b
    jr nz, .StoreValue

    ret

; DataTransfer routine
; This transfer data from anywhere to RAM.
; Parameters: BC = Data Length
;             DE = Destination
;             HL = Data Source
DataTransfer:
    ld a, [hl+]             ; Read data from source
    ld [de], a              ; Store data to destination
    inc de                  ; Increase destination index
    dec bc                  ; Decrease data length
    ld a, b                 ; Check if remaining data length is zero
    or c
    jr nz, DataTransfer     ; Go back if it's not zero.
    ret                     ; return

Call_000_01b9:
    push hl
    xor a
    ldh [rVBK], a
    ld b, a

jr_000_01be:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec b
    jr nz, jr_000_01be

    pop hl
    ld a, $01
    ldh [rVBK], a
    xor a
    ld b, a

jr_000_01cc:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec b
    jr nz, jr_000_01cc

    ret


    ; TODO: Document this function
Call_000_01d4:
    ld [$ff8d], a

jr_000_01d7:
    push bc
    push de
    ld a, [$ff8d]
    ld c, a

jr_000_01dd:
    ld a, [hl+]
    add c
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_01dd

    pop de
    ld a, $20
    add e
    jr nc, jr_000_01eb

    inc d

jr_000_01eb:
    ld e, a
    pop bc
    dec c
    jr nz, jr_000_01d7

    ret


Call_000_01f1:
jr_000_01f1:
    push bc
    push hl

jr_000_01f3:
    ld a, d
    ld [hl], a
    inc hl
    dec b
    jr nz, jr_000_01f3

    pop hl
    ld a, $20
    add l
    jr nc, jr_000_0200

    inc h

Call_000_0200:
jr_000_0200:
    ld l, a
    pop bc
    dec c
    jr nz, jr_000_01f1

    ret

; ChangeROMBank function
; As the name says, this changes the bank in ROM1 ($4000-7FFF)
; Parameters: A = ROM Bank
ChangeROMBank:
    ld [ROM_BANK], a
    ret

LoadOAMCode:              
    ; setup variables
    ld bc, $ff80            ; this is supposed to be C = 80, this is gonna write to HRAM.
    ld b, $0a               ; Data length
    ld hl, .OAMCode    ; Data source

    .loop:
        ld a, [hl+]             ; Read data
        ld [_IO+c], a           ; Move data to HRAM
        inc c                   ; Increase index
        dec b                   ; Decrease left counter
        jr nz, .loop            ; If there's data left to transfer, jump back to loop.
        ret                     ; return

    .OAMCode:              
        ; this is OAM DMA code. This is copied to HRAM so it's executed during VBlank.
        db $3e, $c2, $e0, $46, $3e, $28, $3d, $20, $fd, $c9
        ; The code is translated to this:
        ; ld a, $c2                 ; transfer sprite data from $c2xx to OAM
        ; ldh [rDMA], a         
        ; ld a, $28                 ; Do a small loop because the CPU cannot access ROM while DMA transfer is happening.
        ; .DMALoop:
        ; dec a
        ; jr nz, .DMALoop
        ; ret

Call_000_0223:
    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    swap a
    ld e, a
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    or e
    swap a
    ld [$ff8a], a
    ret


Call_000_024b:
    ld a, $c3
    ld [$ff92], a
    ld a, $c3
    ld [$c35a], a
    ld a, [$ff96]
    ld [$ff93], a
    ld a, [$ff97]
    ld [$ff94], a
    ld a, [$ff98]
    ld [$c35b], a
    ld a, [$ff99]
    ld [$c35c], a
    ld a, $0f
    ld [ROM_BANK], a
    ld a, [$ff9c]
    or a
    call nz, $4000
    ld a, $01
    ld [ROM_BANK], a
    ld a, $40
    ldh [rSTAT], a
    ld a, [$ff9b]
    ldh [rLYC], a
    ld a, [$ff9a]
    ldh [rIE], a
    ld hl, $c3b6
    ld a, l
    ld [$c956], a
    ld a, h
    ld [$c957], a
    ret


    push af
    push hl
    ld a, [$dd01]
    ld l, a
    ld a, [$dd02]
    ld h, a
    ld a, [hl+]
    ldh [rSCX], a
    ld a, [hl+]
    ldh [rLYC], a
    ld a, l
    ld [$dd01], a
    ld a, h
    ld [$dd02], a
    pop hl
    pop af
    reti

VBlank:
    ; save register contents to stack
    push af
    push hl
    push de
    push bc
    ldh a, [rSVBK]
    ld h, a
    push hl
    xor a
    ldh [rSVBK], a
    call $6c8a
    call $ff80
    call $5cbe
    ld hl, $c3b6
    ld a, l
    ld [$c956], a
    ld a, h
    ld [$c957], a
    ld a, $01
    ld [$ff95], a
    pop hl
    ld a, h
    ldh [rSVBK], a
    pop bc
    pop de
    pop hl
    pop af
    reti

VBlank_InGame:
    push af
    push bc
    push de
    push hl
    call $ff80
    xor a
    ldh [rVBK], a
    ld a, [$d745]
    or a
    jr z, jr_000_0346

    cp $ff
    jr nz, jr_000_0304

    dec a
    ld [$d745], a
    ld hl, $9800
    ld bc, $0014
    xor a
    call ClearRAM

Jump_000_0302:
    jr jr_000_0361

jr_000_0304:
    dec a
    ld [$d745], a
    jr nz, jr_000_0317

    ld a, [$df2f]
    ld l, a
    ld a, [$df30]
    ld h, a
    call Call_000_0e54
    jr jr_000_0346

jr_000_0317:
    ld b, a
    ld a, [$d746]
    and $01
    jr z, jr_000_0330

    ld a, b
    and $0f
    jr nz, jr_000_0328

    ld hl, $d746
    inc [hl]

jr_000_0328:
    ld hl, $745e
    call Call_000_0e54
    jr jr_000_0361

jr_000_0330:
    ld a, b
    and $3f
    jr nz, jr_000_0339

    ld hl, $d746
    inc [hl]

jr_000_0339:
    ld hl, $d72a
    call Call_000_0e54
    ld a, [$ff9d]
    ldh [rSCX], a
    jr jr_000_0361

jr_000_0346:
    ld hl, $d8ae
    ld de, $9806
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    ld a, [$d8ac]
    inc a
    ld [$9813], a

jr_000_0361:
    ld a, [$d9bd]
    or a
    jr z, jr_000_0374

    ld b, a
    ld hl, $d9bf

jr_000_036b:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld [de], a
    dec b
    jr nz, jr_000_036b

jr_000_0374:
    ld a, [$d9be]
    or a
    jr z, jr_000_038b

    ld c, a
    ld a, $01
    ldh [rVBK], a
    ld hl, $da37

jr_000_0382:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a

Jump_000_0386:
    ld a, [hl+]

Jump_000_0387:
    ld [de], a
    dec c
    jr nz, jr_000_0382

jr_000_038b:
    ld hl, $c3b6
    ld a, l
    ld [$c956], a
    ld a, h
    ld [$c957], a
    ld a, $01
    ld [$ff95], a
    ld hl, $ff8c
    inc [hl]
    pop hl
    pop de
    pop bc
    pop af
    reti

VBlankMenus:
    push af
    push hl
    push de
    push bc
    call $ff80
    ld hl, $c3b6
    ld a, l
    ld [$c956], a
    ld a, h
    ld [$c957], a
    call Call_000_0aac
    ld a, $01
    ldh [rVBK], a
    ld a, [$c959]
    or a
    jp nz, Jump_000_0505

    ld a, [$ff9e]
    ldh [rSCY], a
    cp $88
    jr z, jr_000_0410

    or a
    jr z, jr_000_0410

    cp $68
    jr nz, jr_000_03ec

    ld a, $02
    call ChangeROMBank
    xor a
    ld de, $9800
    ld hl, $6d74
    ld b, $14
    ld c, $04
    call Call_000_01d4
    ld a, $01
    call ChangeROMBank

jr_000_03ec:
    cp $60
    jp nz, Jump_000_04f7

    xor a
    ldh [rVBK], a
    ld a, $02
    call ChangeROMBank
    ld a, $25
    ld de, $9800
    ld hl, $6c0c
    ld b, $14
    ld c, $04
    call Call_000_01d4
    ld a, $01
    call ChangeROMBank
    jp Jump_000_04f7


jr_000_0410:
    ld hl, $98c4
    ld a, [$dabd]
    ld b, $0a

jr_000_0418:
    ld [hl+], a
    dec b
    jr nz, jr_000_0418

    ld hl, $98e3
    ld a, [$dabe]
    ld b, $0d

jr_000_0424:
    ld [hl+], a
    dec b
    jr nz, jr_000_0424

    ld hl, $9923
    ld a, [$dabf]
    ld b, $0e

jr_000_0430:
    ld [hl+], a
    dec b
    jr nz, jr_000_0430

    ld hl, $9964
    ld a, [$dac0]
    ld b, $0c

jr_000_043c:
    ld [hl+], a
    dec b
    jr nz, jr_000_043c

    ld hl, $9984
    ld a, [$dac1]
    ld b, $0b

jr_000_0448:
    ld [hl+], a
    dec b
    jr nz, jr_000_0448

    ld a, [$dac2]
    or a
    jr z, jr_000_048f

    ld a, [$dadb]
    ld [$9968], a
    ld a, [$dadc]
    ld [$9969], a
    ld a, [$dadd]

Jump_000_0461:
    ld [$996a], a
    ld a, [$dade]
    ld [$996b], a
    xor a
    ldh [rVBK], a
    ld a, [$dad7]
    sub $36
    ld [$9968], a
    ld a, [$dad8]
    sub $36
    ld [$9969], a
    ld a, [$dad9]
    sub $36
    ld [$996a], a
    ld a, [$dada]

Call_000_0488:
    sub $36
    ld [$996b], a
    jr jr_000_04f7

jr_000_048f:
    xor a
    ldh [rVBK], a
    ld a, [$df48]
    ld l, a
    ld a, [$df49]
    ld h, a
    ld a, [$dad3]
    sub $2f
    ld [hl+], a
    ld a, [$dad4]
    sub $2f
    ld [hl+], a
    ld a, [$dad5]
    sub $2f
    ld [hl], a
    ld de, $df40
    ld a, [$dabb]
    or a
    jr nz, jr_000_04b8

    ld de, $df3d

jr_000_04b8:
    ld a, [$df39]
    ld l, a
    ld a, [$df3a]
    ld h, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld de, $df40
    ld a, [$dabc]
    or a
    jr nz, jr_000_04d4

    ld de, $df3d

jr_000_04d4:
    ld a, [$df3b]
    ld l, a
    ld a, [$df3c]
    ld h, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $db56
    ld a, [hl+]
    ld [$9968], a
    ld a, [hl+]
    ld [$9969], a
    ld a, [hl+]
    ld [$996a], a
    ld a, [hl]
    ld [$996b], a

Jump_000_04f7:
jr_000_04f7:
    ld a, $01
    ld [$ff95], a
    ld hl, $ff8c
    inc [hl]
    pop bc
    pop de
    pop hl
    pop af
    reti


Jump_000_0505:
    ld a, [$c95c]
    dec a
    ld [$c95c], a
    jr nz, jr_000_0536

    ld a, [$df45]
    ld b, a
    ld a, [$c95b]
    or a
    jr z, jr_000_0525

    xor a
    ld [$c95b], a
    ld a, $28
    ld [$c95c], a
    ld a, $04
    jr jr_000_052f

jr_000_0525:
    ld a, $0f
    ld [$c95c], a
    ld [$c95b], a
    ld a, $02

jr_000_052f:
    ld hl, $9a01

jr_000_0532:
    ld [hl+], a
    dec b
    jr nz, jr_000_0532

jr_000_0536:
    ld a, [$ccb4]
    ld l, a
    ld a, [$ccb5]
    ld h, a
    or l
    jr z, jr_000_04f7

    ld de, $ccbb
    ld b, $07

jr_000_0546:
    ld a, [de]
    cp $5b
    jr nz, jr_000_054d

    ld a, $20

jr_000_054d:
    inc de
    ld [hl+], a
    dec b
    jr nz, jr_000_0546

    ld de, $ffec
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    add $07
    ld l, a
    push hl
    ld a, [$cccd]
    or a
    jr nz, jr_000_0581

    ld de, $ccc2
    ld b, $07

jr_000_0567:
    ld a, [de]
    inc de
    ld [hl+], a
    dec b
    jr nz, jr_000_0567

    pop hl
    xor a
    ldh [rVBK], a
    ld de, $ccbb
    ld b, $07

jr_000_0576:
    ld a, [de]
    sub $36
    inc de
    ld [hl+], a
    dec b
    jr nz, jr_000_0576

    jp Jump_000_04f7


jr_000_0581:
    xor a
    ld [$ccb4], a
    ld [$ccb5], a
    ld a, $84
    ld b, $07

jr_000_058c:
    ld [hl+], a
    dec b
    jr nz, jr_000_058c

    pop hl
    xor a
    ldh [rVBK], a
    ld de, $ccbb
    ld b, $07

jr_000_0599:
    ld a, [de]
    sub $36
    cp $25
    jr nz, jr_000_05a1

    xor a

jr_000_05a1:
    inc de
    ld [hl+], a
    dec b
    jr nz, jr_000_0599

    jp Jump_000_04f7


    push af
    push hl
    push de
    push bc
    ldh a, [rSVBK]
    push af
    xor a
    ldh [rSVBK], a
    ld hl, $c3b6
    ld a, l
    ld [$c956], a
    ld a, h
    ld [$c957], a
    call $ff80
    ld a, [$c95a]
    xor $01
    ld [$c95a], a
    call z, Call_000_3b8b
    ld a, $01
    ld [$ff95], a
    pop af
    ldh [rSVBK], a
    pop bc
    pop de
    pop hl
    pop af
    reti


    ld e, $06
    call Call_000_3e51
    ld a, $04
    ld [$c359], a
    ld hl, $03a4
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    ld a, $03
    ld [$ff9c], a
    xor a
    ld [$ff9b], a
    ld a, $01
    ld [$ff9a], a
    ld a, $fc
    ldh [rSCX], a
    ld de, $40b0
    call Call_000_0061
    ld hl, $9800
    call Call_000_01b9
    ld a, $02
    call ChangeROMBank

    ; Load high score screen graphics
    xor a                                   ; Select VRAM Bank 0
    ldh [rVBK], a
    ld hl, HighScoresTextureData            ; Data source                  
    ld de, $9000                            ; Destination (VRAM)
    ld bc, $05c0                            ; Data Length
    call DataTransfer                       ; Start data transfer
    ld hl, $472c
    ld de, $8000
    ld bc, $0400
    call DataTransfer
    call Call_000_089d
    ld a, $0b
    call ChangeROMBank
    ld hl, $7d2c
    ld de, $8b40
    ld bc, $0090
    call DataTransfer
    ld a, [$df44]
    call ChangeROMBank
    ld a, $26
    ld de, $9800
    ld hl, $7cc0
    ld b, $12
    ld c, $03
    call Call_000_01d4
    ld a, $01
    ld [$cb53], a
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, $7cf6
    ld b, $12
    ld c, $03
    call Call_000_01d4
    ld a, $02
    ld [$c959], a
    call ChangeROMBank
    ld a, $01
    ld [$c959], a
    call ChangeROMBank
    call $78c8
    call $78fd
    ld a, $81
    ld [$ccc2], a
    xor a
    ld [$dae1], a
    ld [$cccd], a
    ld [$cccc], a
    ld a, $41
    ld [$ccbb], a
    ld a, $5b
    ld [$ccbc], a
    ld [$ccbd], a
    ld [$ccbe], a
    ld [$ccbf], a
    ld [$ccc0], a
    ld [$ccc1], a
    ld a, $84
    ld [$ccc3], a
    ld [$ccc4], a
    ld [$ccc5], a
    ld [$ccc6], a
    ld [$ccc7], a
    ld [$ccc8], a
    xor a
    ld [$cb54], a
    ld a, $40
    ld [$cb55], a
    ld hl, $79ba
    ld a, l
    ld [$cb56], a
    ld a, h
    ld [$cb57], a
    xor a
    ld [$c95b], a
    ld a, $04
    ld [$c95c], a
    ret


    call $7899
    call $78fd
    ld a, [$ccb7]
    cp $ff
    jr z, jr_000_06fd

    ld a, [$ccce]
    inc a
    and $03
    ld [$ccce], a
    jr nz, jr_000_0708

    ld a, [$ccb7]
    dec a
    ld [$ccb7], a
    jr z, jr_000_0710

    jr jr_000_0708

jr_000_06fd:
    ld a, [$ccb4]
    ld l, a
    ld a, [$ccb5]
    ld h, a
    or l
    jr nz, jr_000_072c

jr_000_0708:
    ld a, [$ff8a]
    and $f0
    or a
    jr z, jr_000_072b

Jump_000_0710:
jr_000_0710:
    ld a, [$ff9f]
    cp $07
    ret nz

    ld a, [$ccb6]
    ld [$ff9f], a
    ld a, $01
    ld [$cccd], a
    ld a, $1e
    ld [$ffa0], a
    ld a, $1a
    call Call_000_3e64

jr_000_072b:
    ret


jr_000_072c:
    ld a, [$ff8a]
    ld b, a
    ld a, [$cccc]
    or a
    jr nz, jr_000_073b

    ld hl, $ccbb
    jr jr_000_076f

jr_000_073b:
    cp $01
    jr nz, jr_000_0744

    ld hl, $ccbc
    jr jr_000_076f

jr_000_0744:
    cp $02
    jr nz, jr_000_074d

    ld hl, $ccbd
    jr jr_000_076f

jr_000_074d:
    cp $03
    jr nz, jr_000_0756

    ld hl, $ccbe
    jr jr_000_076f

jr_000_0756:
    cp $04
    jr nz, jr_000_075f

    ld hl, $ccbf
    jr jr_000_076f

jr_000_075f:
    cp $05
    jr nz, jr_000_0768

    ld hl, $ccc0
    jr jr_000_076f

jr_000_0768:
    cp $06
    jr nz, jr_000_076f

    ld hl, $ccc1

jr_000_076f:
    bit 3, b
    jr z, jr_000_078f

    ld a, [$ccca]
    or a
    jr nz, jr_000_0793

    inc a
    ld [$ccca], a
    ld a, $19
    call Call_000_3e64
    push hl
    pop hl
    ld a, [hl]
    dec a
    cp $40
    jr nz, jr_000_078c

    add $1b

jr_000_078c:
    ld [hl], a
    jr jr_000_0793

jr_000_078f:
    xor a
    ld [$ccca], a

jr_000_0793:
    bit 2, b
    jr z, jr_000_07b3

    ld a, [$ccc9]
    or a
    jr nz, jr_000_07b7

    inc a
    ld [$ccc9], a
    ld a, $19
    call Call_000_3e64
    push hl
    pop hl
    ld a, [hl]
    inc a
    cp $5c
    jr nz, jr_000_07b0

    sub $1b

jr_000_07b0:
    ld [hl], a
    jr jr_000_07b7

jr_000_07b3:
    xor a
    ld [$ccc9], a

jr_000_07b7:
    ld a, b
    and $f3
    or a
    jp z, Jump_000_0872

    ld a, [$cccb]
    or a
    ret nz

    ld a, $19
    call Call_000_3e64
    ld a, $01
    ld [$cccb], a
    ld a, [$cccc]
    bit 4, b
    jr z, jr_000_07d5

    inc a

jr_000_07d5:
    bit 5, b
    jr z, jr_000_07dd

    or a
    jr z, jr_000_07dd

    dec a

jr_000_07dd:
    bit 7, b
    jr z, jr_000_07e2

    inc a

jr_000_07e2:
    bit 6, b
    jr z, jr_000_07ea

    or a
    jr z, jr_000_07ea

    dec a

jr_000_07ea:
    bit 0, b
    jr z, jr_000_07ef

    inc a

jr_000_07ef:
    bit 1, b
    jr z, jr_000_07f7

    or a
    jr z, jr_000_07f7

    dec a

jr_000_07f7:
    ld [$cccc], a
    or a
    jr nz, jr_000_0808

    ld a, $81
    ld [$ccc2], a
    ld a, $84
    ld [$ccc3], a
    ret


jr_000_0808:
    cp $01
    jr nz, jr_000_081a

    ld a, $81

Call_000_080e:
    ld [$ccc3], a
    ld a, $84
    ld [$ccc2], a
    ld [$ccc4], a
    ret


jr_000_081a:
    cp $02
    jr nz, jr_000_082c

    ld a, $84
    ld [$ccc3], a
    ld [$ccc5], a
    ld a, $81
    ld [$ccc4], a
    ret


jr_000_082c:
    cp $03
    jr nz, jr_000_083e

    ld a, $84
    ld [$ccc4], a
    ld [$ccc6], a
    ld a, $81
    ld [$ccc5], a
    ret


jr_000_083e:
    cp $04
    jr nz, jr_000_0850

    ld a, $84
    ld [$ccc5], a
    ld [$ccc7], a
    ld a, $81
    ld [$ccc6], a
    ret


jr_000_0850:
    cp $05
    jr nz, jr_000_0862

    ld a, $84
    ld [$ccc6], a
    ld [$ccc8], a
    ld a, $81
    ld [$ccc7], a
    ret


jr_000_0862:
    cp $06
    jp nz, Jump_000_0710

    ld a, $84
    ld [$ccc7], a
    ld a, $81
    ld [$ccc8], a
    ret


Jump_000_0872:
    xor a
    ld [$cccb], a
    ret


LoadHighScores:
    ld a, $02                               ; Load ROM Bank 2
    ld [ROM_BANK], a
    ld hl, HighScoreScreenDataHeader        ; Data Source
    ld de, $cb59                            ; Destination
    ld bc, $0010                            ; Data Length
    call DataTransfer
    ld bc, $0018                            ; Data Length
    call DataTransfer
    ld hl, HighScoreScreenData              ; Data Source
    ld bc, $0133                            ; Data Length
    call DataTransfer
    ld a, $01                               ; Switch ROM1 to Bank 1

Call_000_0899:              ; this is NOT a function, it's just data that managed to make this address part of the decompiled code
    call ChangeROMBank
    ret


Call_000_089d:
    ld hl, $cb59
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    ret


Call_000_08c8:
    ld hl, $d8ae
    ld de, $ccad
    ld b, $05

jr_000_08d0:
    ld a, [hl+]
    add $2f
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_08d0

    call Call_000_0dde
    xor a
    ld [$ccb4], a
    ld [$ccb5], a
    ld hl, $cb85
    ld b, $0a

jr_000_08e7:
    push hl
    ld de, $ccad
    ld c, $05

jr_000_08ed:
    ld a, [de]
    cp [hl]
    jr c, jr_000_08f8

    jr nz, jr_000_0901

    inc hl
    inc de
    dec c
    jr nz, jr_000_08ed

jr_000_08f8:
    pop hl
    ld de, $001c
    add hl, de
    dec b
    jr nz, jr_000_08e7

Call_000_0900:
    ret


jr_000_0901:
    dec b
    jr z, jr_000_091b

    push bc
    ld hl, $cc7c
    ld de, $cc98

jr_000_090b:
    ld c, $1a

jr_000_090d:
    ld a, [hl-]
    ld [de], a
    dec de
    dec c
    jr nz, jr_000_090d

    dec hl
    dec hl
    dec de
    dec de
    dec b
    jr nz, jr_000_090b

    pop bc

jr_000_091b:
    pop hl
    ld de, $ccad
    ld c, $05

jr_000_0921:
    ld a, [de]
    ld [hl+], a
    inc de
    dec c
    jr nz, jr_000_0921

    inc hl

Call_000_0928:
    inc hl
    inc hl
    inc hl
    ld a, l
    ld [$ccb4], a
    ld a, h
    ld [$ccb5], a
    ld a, $41
    ld [hl+], a
    ld a, $5b
    ld a, $42
    ld [hl+], a
    ld a, $43
    ld [hl+], a
    ld a, $44
    ld [hl+], a
    ld a, $45
    ld [hl+], a
    ld a, $46
    ld [hl+], a
    ld a, $47
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    inc hl
    ld de, $d73b
    ld a, [$defc]
    cp $04
    jr nz, jr_000_095b

    ld de, $d73c

jr_000_095b:
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, b
    cp $09
    ret nz

    ld de, $cb7c
    ld hl, $cce3
    ld bc, $0004
    call DataTransfer
    ret


Call_000_0974:
    ld a, $02
    call ChangeROMBank
    ld b, $00
    ld a, [hl+]
    sub $30
    jr z, jr_000_0988

    ld c, a
    ld a, b

jr_000_0982:
    add $64
    dec c
    jr nz, jr_000_0982

    ld b, a

jr_000_0988:
    ld a, [hl+]
    sub $30
    jr z, jr_000_0995

    ld c, a
    ld a, b

jr_000_098f:
    add $0a
    dec c
    jr nz, jr_000_098f

    ld b, a

jr_000_0995:
    ld a, [hl+]
    sub $30
    add b
    dec a
    ld b, a
    xor $55
    rrca
    rrca
    rrca
    ld [$ccb8], a
    ld a, $fd
    sub b
    xor $aa
    rrca
    ld [$ccb9], a
    ld de, $cb7c
    ld a, [$ccb8]
    swap a
    and $0f
    ld hl, $4000
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [de], a
    inc de
    ld a, [$ccb9]
    and $0f
    ld hl, $4000
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [de], a
    inc de
    ld a, [$ccb8]
    and $0f
    ld hl, $4000
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [de], a
    inc de
    ld a, [$ccb9]
    swap a
    and $0f
    ld hl, $4000
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [de], a
    ld de, $cb7c
    call Call_000_09fa
    ld a, $01
    call ChangeROMBank
    ret


Call_000_09fa:
    ld a, [de]

Call_000_09fb:
    ld hl, $4000
    ld c, $00
    ld b, $10

jr_000_0a02:
    cp [hl]
    jr z, jr_000_0a0b

    inc hl
    inc c
    dec b
    jr nz, jr_000_0a02

    ret


jr_000_0a0b:
    ld a, c
    swap a
    ld [$ccb8], a
    inc de
    ld a, [de]
    ld hl, $4000
    ld c, $00
    ld b, $10

jr_000_0a1a:
    cp [hl]
    jr z, jr_000_0a23

    inc hl
    inc c
    dec b
    jr nz, jr_000_0a1a

    ret


jr_000_0a23:
    ld a, c
    ld [$ccb9], a
    inc de
    ld a, [de]
    ld hl, $4000
    ld c, $00
    ld b, $10

jr_000_0a30:
    cp [hl]
    jr z, jr_000_0a39

    inc hl
    inc c
    dec b
    jr nz, jr_000_0a30

    ret


jr_000_0a39:
    ld a, [$ccb8]
    or c
    ld [$ccb8], a
    inc de
    ld a, [de]
    ld hl, $4000
    ld c, $00
    ld b, $10

jr_000_0a49:
    cp [hl]
    jr z, jr_000_0a52

    inc hl
    inc c
    dec b
    jr nz, jr_000_0a49

    ret


jr_000_0a52:
    swap c
    ld a, [$ccb9]
    or c
    ld [$ccb9], a
    ld a, [$ccb8]
    rlca
    rlca
    rlca

Jump_000_0a61:
    xor $55
    ld b, a
    ld a, [$ccb9]
    rlca
    xor $aa
    add b
    cp $fd
    jr nz, jr_000_0aaa

    ld a, b
    and $03
    jr nz, jr_000_0aaa

    ld a, b
    cp $c8
    jr nz, jr_000_0a80

    ld a, $01
    ld [$db51], a
    jr jr_000_0aaa

jr_000_0a80:
    cp $cc
    jr nz, jr_000_0a8b

    ld a, $01
    ld [$db52], a
    jr jr_000_0aaa

jr_000_0a8b:
    cp $d0
    jr nz, jr_000_0a96

    ld a, $01
    ld [$db53], a
    jr jr_000_0aaa

jr_000_0a96:
    cp $d4

Call_000_0a98:
    jr nz, jr_000_0aa1

    ld a, $01
    ld [$db54], a
    jr jr_000_0aaa

jr_000_0aa1:
    cp $a0
    jr nc, jr_000_0aaa

    ld [$ccba], a
    or a
    ret


jr_000_0aaa:
    xor a
    ret


Call_000_0aac:
    ld a, [$cb53]
    or a
    ret z

    cp $01
    ret z

    cp $03
    jr z, jr_000_0aca

    ld a, [$df44]
    ld [ROM_BANK], a
    ld a, [$cb55]
    ldh [rHDMA1], a
    ld a, [$cb54]
    ldh [rHDMA2], a
    jr jr_000_0ad6

jr_000_0aca:
    ld a, $0c
    ld [ROM_BANK], a
    ld a, $40
    ldh [rHDMA1], a
    xor a
    ldh [rHDMA2], a

jr_000_0ad6:
    xor a
    ldh [rVBK], a
    ld a, $92
    ldh [rHDMA3], a
    ld a, $60
    ldh [rHDMA4], a
    ld a, $35
    ldh [rHDMA5], a
    ld a, $01
    ld [ROM_BANK], a
    ret


Call_000_0aeb:
    ld a, [$db55]
    or a
    jr nz, jr_000_0af3

    ld e, $02

jr_000_0af3:
    cp $01
    jr nz, jr_000_0af9

    ld e, $03

jr_000_0af9:
    cp $02
    jr nz, jr_000_0aff

    ld e, $04

jr_000_0aff:
    call Call_000_3e51
    ret


    call Call_000_0aeb
    ld a, $00
    ld [$c359], a
    ld hl, $02e0
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    ld a, $01
    ld [$ff9c], a
    ld a, $08
    ld [$ff9b], a
    ld a, $03
    ld [$ff9a], a
    ld a, $94
    ld [$c958], a
    ld a, [$cce8]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld de, $4000
    add hl, de
    ld a, $05
    call ChangeROMBank
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [$db53]
    or a
    jr z, jr_000_0b49

    ld de, $48ea

jr_000_0b49:
    push de
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, d
    ld l, e
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    push hl
    ld h, d
    ld l, e
    push bc
    ld a, $01
    call ChangeROMBank
    ld de, $c95d
    ld bc, $0040
    call DataTransfer
    ld hl, $4630
    ld de, $c99d
    ld bc, $0040
    call DataTransfer
    pop hl
    ld a, [$db53]
    or a
    jr z, jr_000_0b81

    ld hl, $4830

jr_000_0b81:
    ld de, $c95d
    ld bc, $0008
    call DataTransfer
    ld de, $c96d
    ld bc, $0008
    call DataTransfer
    ld de, $c95d
    call Call_000_0061
    ld a, $05
    call ChangeROMBank
    pop hl
    ld a, [hl+]
    ld b, a
    swap a
    and $0f
    ld [$dc36], a
    ld a, b
    and $0f
    ld [$dc35], a
    ld a, [hl]
    ld [$dc27], a
    ld a, $01
    call ChangeROMBank
    ld a, [$ffa1]
    or a
    jp nz, Jump_000_0c40

    ld hl, $9800
    call Call_000_01b9
    ld a, $08
    call ChangeROMBank
    ld de, $4000
    ld hl, $ccea
    call Call_000_0dbb
    pop hl
    ld a, $05
    call ChangeROMBank
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld a, $08
    call ChangeROMBank
    ld hl, $ccea
    call Call_000_0dc8
    ld de, $4000
    ld hl, $ccea
    call Call_000_0dc8
    pop hl
    ld a, $05
    call ChangeROMBank
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, $0c
    call ChangeROMBank
    ld hl, $ce0a

Call_000_0c03:
    call Call_000_0dbb
    ld a, $01
    call ChangeROMBank
    xor a
    ld [$dd00], a
    ld a, [$dcfe]
    inc a
    ld [$dcfe], a
    call Call_000_0eb7
    call Call_000_0ee5
    call Call_000_271b
    call Call_000_31da
    call $5025
    call $627f
    call $633e
    call Call_000_1df3
    call $64c3
    xor a
    ld [$d9bd], a
    ld [$d9be], a
    ld [$dab2], a
    ld [$ffa2], a
    jr jr_000_0c41

Jump_000_0c40:
    pop hl

jr_000_0c41:
    ld a, [$ffa1]
    or a
    jr nz, jr_000_0c9a

    ld a, $01
    ld [$dae1], a
    ldh [rVBK], a
    ld a, $03
    call ChangeROMBank
    ld hl, $4000
    ld a, $00
    ld de, $9841
    ld b, $12
    ld c, $10
    call Call_000_01d4
    ld a, $01
    call ChangeROMBank
    ld hl, $9840
    ld b, $01
    ld c, $0f
    ld d, $21
    call Call_000_01f1
    ld hl, $9853
    ld c, $0f
    ld d, $01
    call Call_000_01f1
    ld hl, $9a20
    ld c, $01
    ld d, $a1
    call Call_000_01f1
    ld hl, $9a33
    ld c, $01
    ld d, $81
    call Call_000_01f1
    ld hl, $9820
    ld c, b
    ld b, $14
    call Call_000_01f1

jr_000_0c9a:
    xor a
    ldh [rVBK], a
    ld a, $02
    call ChangeROMBank
    ld hl, $4b2c
    ld de, $8000
    ld bc, $07f0
    call DataTransfer
    ld hl, $5dec
    ld de, $9000
    ld bc, $0250
    call DataTransfer
    ld hl, $594c
    ld de, $9250
    ld bc, $04a0
    call DataTransfer
    ld a, $0b
    call ChangeROMBank
    ld hl, $7d2c
    ld de, $96f0
    ld bc, $0110
    call DataTransfer
    ld a, $01
    call ChangeROMBank
    pop hl
    ld a, $05
    call ChangeROMBank
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    call ChangeROMBank
    push hl
    ld h, d
    ld l, e
    ld a, $01
    ldh [rVBK], a
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld de, $8800
    ld bc, $0800
    call DataTransfer
    ld a, $02
    call ChangeROMBank
    ld hl, $531c
    ld de, $8000
    ld bc, $0630
    call DataTransfer
    xor a
    ldh [rVBK], a
    ld a, $01
    call ChangeROMBank
    ld a, [$ffa1]
    or a
    jp nz, Jump_000_0db5

    ld a, $25
    ld de, $9840
    ld hl, $748b
    ld b, $01
    ld c, $10
    call Call_000_01d4
    ld a, $25
    ld de, $9853
    ld hl, $748b
    ld b, $01
    ld c, $10
    call Call_000_01d4
    ld a, $25
    ld de, $9820
    ld hl, $7477
    ld b, $14
    ld c, $01
    call Call_000_01d4
    pop hl
    ld a, $05
    call ChangeROMBank
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    call ChangeROMBank
    ld h, d
    ld l, e
    ld a, $00
    ld de, $9841
    ld b, $12
    ld c, $10
    push hl
    call Call_000_01d4
    pop hl
    ld a, $00
    ld de, $cf6b

Jump_000_0d73:
    ld b, $12
    ld c, $10
    call Call_000_01d4
    ld a, $01
    call ChangeROMBank
    ld hl, $9800
    ld bc, $0014
    xor a
    call ClearRAM
    call Call_000_0dde
    ld hl, $d72a
    call Call_000_0e54
    xor a
    ld [$d746], a
    dec a
    ld [$d745], a
    ld a, $04
    ld [$ff9d], a
    call $77c6
    xor a
    ldh [rVBK], a
    ld hl, $9800
    ld de, $d32a
    ld bc, $0400
    call DataTransfer
    call $6ea5
    ret


Jump_000_0db5:
    pop hl
    xor a
    ld [$ffa1], a
    ret


Call_000_0dbb:
jr_000_0dbb:
    ld a, [de]
    or a
    ret z

    ld b, a
    inc de
    ld a, [de]
    inc de

jr_000_0dc2:
    ld [hl+], a
    dec b
    jr nz, jr_000_0dc2

    jr jr_000_0dbb

Call_000_0dc8:
jr_000_0dc8:
    ld a, [de]
    or a
    ret z

    ld b, a
    inc de
    ld a, [de]
    inc de
    or a
    jr z, jr_000_0dd8

jr_000_0dd2:
    ld [hl+], a
    dec b
    jr nz, jr_000_0dd2

    jr jr_000_0dc8

jr_000_0dd8:
    inc hl
    dec b
    jr nz, jr_000_0dd8

    jr jr_000_0dc8

Call_000_0dde:
    ld a, [$df31]
    ld l, a
    ld a, [$df32]
    ld h, a
    ld de, $d72a
    ld bc, $001b
    call DataTransfer
    ld a, [$cce8]
    inc a
    ld c, $00

jr_000_0df5:
    ld b, a
    sub $64
    jr nc, jr_000_0e51

    ld a, c
    or a
    jr z, jr_000_0e15

    add $30
    ld d, a
    ld a, [$defc]
    cp $04
    jr nz, jr_000_0e0e

    ld a, d
    ld [$d73c], a
    jr jr_000_0e12

jr_000_0e0e:
    ld a, d
    ld [$d73b], a

jr_000_0e12:
    ld a, b
    or a
    ret z

jr_000_0e15:
    ld a, b
    ld c, $00

jr_000_0e18:
    ld b, a
    sub $0a
    jr nc, jr_000_0e4e

    ld a, c
    or a
    jr z, jr_000_0e38

    add $30
    ld d, a
    ld a, [$defc]
    cp $04
    jr nz, jr_000_0e31

    ld a, d
    ld [$d73d], a
    jr jr_000_0e35

jr_000_0e31:
    ld a, d
    ld [$d73c], a

jr_000_0e35:
    ld a, b
    or a
    ret z

jr_000_0e38:
    ld a, b
    add $30
    ld d, a
    ld a, [$defc]
    cp $04
    jr nz, jr_000_0e49

    ld a, d
    ld [$d73e], a
    jr jr_000_0e4d

jr_000_0e49:
    ld a, d
    ld [$d73d], a

jr_000_0e4d:
    ret


jr_000_0e4e:
    inc c
    jr jr_000_0e18

jr_000_0e51:
    inc c
    jr jr_000_0df5

Call_000_0e54:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    jr jr_000_0e65

jr_000_0e5a:
    ld [de], a
    ld a, $01
    ldh [rVBK], a
    ld a, b
    ld [de], a
    inc de
    xor a
    ldh [rVBK], a

jr_000_0e65:
    ld a, [hl+]
    cp $ff
    ret z

    or a
    jr nz, jr_000_0e70

    ld a, [hl+]
    ld b, a
    jr jr_000_0e65

jr_000_0e70:
    cp $20
    jr nz, jr_000_0e77

    xor a
    jr jr_000_0e5a

jr_000_0e77:
    cp $41
    jr c, jr_000_0e7f

    sub $36
    jr jr_000_0e5a

jr_000_0e7f:
    sub $2f
    jr jr_000_0e5a

    ret


Call_000_0e84:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    jr jr_000_0e98

jr_000_0e8a:
    or a
    jr z, jr_000_0e94

    ld [de], a
    ld a, $01
    ldh [rVBK], a
    ld a, b
    ld [de], a

jr_000_0e94:
    inc de
    xor a
    ldh [rVBK], a

jr_000_0e98:
    ld a, [hl+]
    cp $ff
    ret z

    or a
    jr nz, jr_000_0ea3

    ld a, [hl+]
    ld b, a
    jr jr_000_0e98

jr_000_0ea3:
    cp $20
    jr nz, jr_000_0eaa

    xor a
    jr jr_000_0e8a

jr_000_0eaa:
    cp $41
    jr c, jr_000_0eb2

    sub $36
    jr jr_000_0e8a

jr_000_0eb2:
    sub $2f
    jr jr_000_0e8a

    ret


Call_000_0eb7:
    ld a, $50
    ld [$c201], a
    ld hl, $5f77
    ld a, l
    ld [$d761], a
    ld a, h
    ld [$d762], a
    xor a
    ld [$d75f], a
    ld [$d760], a
    ld [$d766], a
    ld [$d765], a
    ld [$d76a], a
    ld [$d76b], a
    ld a, $01
    ld [$d763], a
    ld a, $20
    ld [$d764], a
    ret


Call_000_0ee5:
    ld a, $01
    ld [$d77c], a
    ld a, $89
    ld [$d77e], a
    ld a, [$d764]
    srl a
    ld b, a
    ld a, [$c201]
    sub $0c
    add b
    ld [$d780], a
    ld a, $10
    ld [$d781], a
    ld a, $83
    ld [$d782], a
    xor a
    ld [$d77d], a
    ld [$d77f], a
    ld [$d783], a
    xor a
    ld [$d8a1], a
    ld [$d8a5], a
    ld [$d8a0], a
    ld [$d8a2], a
    ld [$d8a3], a
    ld [$d8a4], a
    ld [$d76e], a
    ld [$d8aa], a
    inc a
    ld [$d8a8], a

Jump_000_0f2f:
    ret


    ld a, [$db52]
    or a
    jr z, jr_000_0f77

    ld a, [$ff8a]
    bit 5, a
    jr z, jr_000_0f77

    ld a, [$ffa0]
    or a
    jr nz, jr_000_0f77

    ld a, [$ffa2]
    or a
    jr nz, jr_000_0f77

    ld b, $02
    ld a, [$dcfe]
    cp $04
    jr nz, jr_000_0f5d

    call Call_000_3c34
    ld a, [$dcff]
    or a
    jr nz, jr_000_0f5d

    ld b, $09

jr_000_0f5d:
    ld a, b
    ld [$ff9f], a
    ld a, $0f
    ld [$ffa0], a
    ld a, [$cce8]
    inc a
    cp $a0
    jr c, jr_000_0f74

    ld a, $0d
    ld [$ff9f], a
    xor a

jr_000_0f74:
    ld [$cce8], a

jr_000_0f77:
    ld a, [$d765]
    or a
    jr z, jr_000_0fbe

    ld a, [$d768]
    and $07
    jr nz, jr_000_0f89

    ld a, $0f
    call Call_000_3e64

jr_000_0f89:
    xor a
    ld [$d767], a
    ld a, [$d769]
    inc a
    ld [$d769], a
    and $03
    jr nz, jr_000_0fbe

    ld a, [$d766]
    cp $fd
    jr nz, jr_000_0fa3

    ld a, $03
    jr jr_000_0fa9

jr_000_0fa3:
    cp $03
    jr nz, jr_000_0fa9

    ld a, $fd

jr_000_0fa9:
    ld [$d766], a
    ld [$d767], a
    ld a, [$d768]
    dec a
    ld [$d768], a
    jr nz, jr_000_0fbe

    ld [$d765], a
    ld [$d766], a

jr_000_0fbe:
    xor a
    ld [$d89f], a
    ld a, [$d761]
    ld l, a
    ld a, [$d762]
    ld h, a
    ld a, [$ff8a]
    ld c, a
    ld a, [$d76a]
    or a
    jr z, jr_000_1001

    ld a, c
    and $02
    sra a
    ld b, a
    ld a, c
    and $01
    sla a
    ld d, a
    ld a, c
    and $fc
    or b
    or d
    ld c, a
    ld [$ff8a], a
    ld a, [$d769]
    inc a
    ld [$d769], a
    and $03
    jr nz, jr_000_1001

    ld a, [$d768]
    dec a
    ld [$d768], a
    or a
    jr nz, jr_000_1001

    ld [$d76a], a

jr_000_1001:
    ld a, [$ff8b]
    ld b, a
    ld a, c
    and $03
    cp $03
    jr nz, jr_000_100f

    xor b
    jr jr_000_1012

jr_000_100f:
    ld [$ff8b], a

jr_000_1012:
    bit 0, a
    jr z, jr_000_1058

    ld a, [$d760]
    or a
    jp nz, Jump_000_10b5

Jump_000_101d:
    inc hl
    ld a, [hl]
    or a

Call_000_1020:
    jr nz, jr_000_1024

    dec hl
    ld a, [hl]

jr_000_1024:
    ld b, a
    ld a, $ff
    ld [$d75f], a

jr_000_102a:
    ld a, l
    ld [$d761], a
    ld a, h
    ld [$d762], a
    ld a, [$d766]
    add b
    ld b, a
    ld a, [$d764]
    ld d, a
    ld a, [$c201]
    add d
    add b
    cp $aa
    jr c, jr_000_1049

    sub $aa
    sub b
    cpl
    ld b, a

jr_000_1049:
    ld a, [$c201]
    add b
    ld [$c201], a
    ld a, b
    cpl
    inc a
    ld [$d89f], a
    jr jr_000_10d7

jr_000_1058:
    bit 1, a
    jr z, jr_000_1097

    ld a, [$d75f]
    or a
    jr nz, jr_000_109d

jr_000_1062:
    inc hl
    ld a, [hl]
    or a
    jr nz, jr_000_1069

    dec hl
    ld a, [hl]

jr_000_1069:
    ld b, a
    ld a, $01
    ld [$d760], a

jr_000_106f:
    ld a, l
    ld [$d761], a
    ld a, h
    ld [$d762], a
    ld a, [$d766]
    add b
    ld b, a
    ld a, [$c201]
    sub b
    cp $17
    jr nc, jr_000_108a

    sub $17
    cpl
    sub b
    cpl
    ld b, a

jr_000_108a:
    ld a, [$c201]
    sub b
    ld [$c201], a
    ld a, b

Call_000_1092:
    ld [$d89f], a
    jr jr_000_10d7

jr_000_1097:
    ld a, [$d75f]
    or a
    jr z, jr_000_10af

jr_000_109d:
    dec hl
    ld b, [hl]
    ld a, b
    or a
    jr nz, jr_000_102a

    ld [$d75f], a
    ld a, [$ff8a]
    bit 1, a
    jr nz, jr_000_1062

    jr jr_000_10c6

jr_000_10af:
    ld a, [$d760]
    or a
    jr z, jr_000_10c6

Jump_000_10b5:
    dec hl
    ld b, [hl]
    ld a, b
    or a
    jr nz, jr_000_106f

    ld [$d760], a
    ld a, [$ff8a]
    bit 0, a
    jp nz, Jump_000_101d

jr_000_10c6:
    ld a, [$d765]
    or a
    jr z, jr_000_10d7

    ld a, [$d767]
    ld b, a
    ld a, [$c201]
    add b
    ld [$c201], a

jr_000_10d7:
    ld a, [$d8a9]
    or a
    jr nz, jr_000_1111

    ld a, [$d8a2]
    or a
    jr z, jr_000_1134

    ld a, [$d8a6]
    dec a
    ld [$d8a6], a
    jr z, jr_000_1111

    ld a, [$d77c]
    or a
    jr z, jr_000_1134

    ld c, a
    ld b, $00
    ld a, [$ff8a]
    bit 0, a
    jr z, jr_000_10fe

    ld b, $04

jr_000_10fe:
    bit 1, a
    jr z, jr_000_1104

    ld b, $1c

jr_000_1104:
    ld hl, $d781
    ld de, $0007

jr_000_110a:
    ld [hl], b
    add hl, de
    dec c
    jr nz, jr_000_110a

    jr jr_000_1134

jr_000_1111:
    xor a
    ld [$d8a9], a
    ld [$d8a2], a
    ld a, [$d77c]
    or a
    jr z, jr_000_1134

    ld b, a
    ld de, $0006
    ld a, $02
    ld hl, $d781

jr_000_1127:
    ld [hl+], a
    inc a
    res 7, [hl]
    add hl, de
    dec b
    jr nz, jr_000_1127

    ld a, $17
    call Call_000_3e64

jr_000_1134:
    ld a, [$d8a1]
    or a
    jr nz, jr_000_114d

    ld a, [$d763]
    or a
    jr z, jr_000_116f

    ld a, [$d8a5]
    or a
    jr nz, jr_000_116f

    ld a, [$ff8a]
    bit 4, a
    jr z, jr_000_116f

jr_000_114d:
    ld a, [$d8a8]
    or a
    jr z, jr_000_116a

    ld a, [$d764]
    srl a
    ld b, a
    ld a, [$c201]
    sub $08
    add b
    ld c, $01
    cp $58
    jr c, jr_000_1167

    ld c, $1f

jr_000_1167:
    ld a, c
    jr jr_000_116c

jr_000_116a:
    ld a, $04

jr_000_116c:
    ld [$d8a0], a

jr_000_116f:
    call Call_000_18fc
    ld a, [$d77c]
    or a
    jp z, Jump_000_12b7

    ld [$d8a4], a
    ld b, a
    ld hl, $d77d
    ld de, $d895
    xor a
    ld [$ff90], a

Jump_000_1187:
    push bc
    push hl
    push de
    ld a, [hl+]
    ld [$d775], a
    ld a, [hl+]
    ld [$d776], a
    ld a, [hl+]
    ld [$d777], a
    ld a, [hl+]
    ld [$d778], a
    ld a, [hl+]
    ld [$d779], a
    ld a, [hl+]
    ld [$d77a], a
    ld a, [hl+]
    ld [$d77b], a
    call Call_000_13ac
    pop de
    pop hl
    ld a, [$d8aa]
    or a
    jr nz, jr_000_1227

    ld a, [$d776]
    ld b, a
    cp $a0
    jp c, Jump_000_1251

    pop bc
    ld a, [$d77c]
    cp $01
    jr nz, jr_000_122f

    dec a
    ld [$d77c], a
    ld c, a
    ld a, [$dbe0]
    or a
    jr z, jr_000_11d2

    ld a, c
    or a
    jp z, Jump_000_12b7

jr_000_11d2:
    ld a, [$d76b]
    or a
    jp nz, Jump_000_12b7

    ld a, [$ffa0]
    or a
    jp nz, Jump_000_12b7

    ld a, $28
    ld [$d76b], a
    ld a, [$c200]
    sub $08
    ld [$d76c], a
    ld b, $f8
    ld a, [$d764]
    cp $20
    jr z, jr_000_11f8

    ld b, $fc

jr_000_11f8:
    ld a, [$c201]
    add b
    ld [$d76d], a
    xor a

Jump_000_1200:
    ld [$dc3d], a
    ld a, $0a
    call Call_000_3e64
    ld a, [$d8ac]
    dec a
    ld [$d8ac], a
    or a
    jr nz, jr_000_121f

    ld a, $03
    ld [$ff9f], a
    ld a, $28
    ld [$ffa0], a
    jp Jump_000_12b7


jr_000_121f:
    ld a, $01
    ld [$ffa2], a
    jp Jump_000_12b7


jr_000_1227:
    pop bc
    xor a
    ld [$d8aa], a
    ld a, [$d77c]

jr_000_122f:
    dec a
    ld [$d77c], a
    ld a, b
    cp $01
    jr z, jr_000_126c

    ld a, l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, l
    add $06
    ld l, a
    jr nc, jr_000_1245

    inc h

jr_000_1245:
    ld a, $ff
    ld [hl+], a
    ld a, [$ff90]
    inc a
    ld [$ff90], a
    jr jr_000_126c

Jump_000_1251:
    ld a, [$d775]
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [$d777]
    ld [hl+], a
    ld a, [$d778]
    ld [hl+], a
    ld a, [$d779]
    ld [hl+], a
    ld a, [$d77a]
    ld [hl+], a
    ld a, [$d77b]
    ld [hl+], a
    pop bc

jr_000_126c:
    dec b
    jp nz, Jump_000_1187

    ld a, [$d8a4]
    or a
    jr nz, jr_000_127a

    ld de, $000e
    add hl, de

jr_000_127a:
    ld a, [$ff90]
    or a
    jr z, jr_000_12b7

    ld de, $d895
    ld b, a
    dec hl

jr_000_1285:
    push bc

jr_000_1286:
    ld a, [hl]
    cp $ff
    jr nz, jr_000_1291

    ld bc, $fff9
    add hl, bc
    jr jr_000_1286

jr_000_1291:
    ld bc, $fffa
    add hl, bc
    ld a, [de]
    inc de
    ld c, a
    ld a, [de]
    inc de
    ld b, a
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    ld bc, $fff8
    add hl, bc
    pop bc
    dec b
    jr nz, jr_000_1285

Jump_000_12b7:
jr_000_12b7:
    xor a
    ld [$d8a0], a
    ld a, [$d8a8]
    or a
    jr z, jr_000_12d4

    ld a, [$ff8a]
    bit 4, a
    jr z, jr_000_12d4

    xor a
    ld [$d763], a
    ld [$d8a8], a
    ld a, $07
    call Call_000_3e64

jr_000_12d4:
    call $50df
    call Call_000_2763
    call Call_000_320c
    call $6386
    call $62e9
    call $64f9
    call $6ed4
    xor a
    ld [$d9be], a
    ld [$d9bd], a
    call Call_000_1950
    call Call_000_1e1b
    call Call_000_1d7c
    ld a, [$ffa2]
    or a
    jr z, jr_000_131c

    inc a
    ld [$ffa2], a
    cp $28
    ret nz

    xor a
    ld [$ffa2], a
    ld e, $00
    call Call_000_3e56
    xor a
    call Call_000_3e64
    call Call_000_3e7f
    call Call_000_3e7f
    call Call_000_1347

jr_000_131c:
    ld a, [$ff8a]
    bit 7, a
    ret z

    ld a, [$ffa0]
    or a
    ret nz

    ld a, $04
    ld [$ff9f], a
    ld a, $01
    ld [$ffa0], a
    ld [$ffa1], a
    ld a, $1a
    call Call_000_3e64
    ld a, $1e

jr_000_133b:
    push af
    call $7c54
    call Call_000_3e7f
    pop af
    dec a
    jr nz, jr_000_133b

    ret


Call_000_1347:
    ld a, [$ffa0]
    or a
    ret nz

    ld b, $01
    xor a
    ld [$c2b5], a
    ld [$ff8a], a
    call $6838
    call $6ea5
    call Call_000_0eb7
    call Call_000_0ee5
    xor a
    ld [$d9be], a
    ld [$d9bd], a
    inc a
    ld [$d745], a
    call Call_000_1def
    call Call_000_1950
    call Call_000_1e1b
    call Call_000_1d7c
    call Call_000_31da
    call Call_000_271b
    call $5025
    call $627f
    call $633e
    call $64c3
    xor a
    ld [$c2b5], a
    ld de, $c2b9
    ld a, e
    ld [$c2b6], a
    ld a, d
    ld [$c2b7], a
    ld a, $27
    ld [$c2b4], a
    call $6ed4
    ld b, $ff
    ld a, $20
    call $6838
    call Call_000_0aeb
    ret


Call_000_13ac:
    ld a, [$d8a5]
    or a
    jr z, jr_000_1415

    ld a, [$d8a6]
    cp $18
    jr nz, jr_000_13c0

    ld a, $16
    call Call_000_3e64
    jr jr_000_1415

jr_000_13c0:
    jr c, jr_000_1415

    ld a, [$d8a7]
    and $1f
    ld d, $00
    cp $10
    jr c, jr_000_13cf

    ld d, $02

jr_000_13cf:
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld a, [$d776]
    sub $08
    cp $1e
    jr nc, jr_000_13e2

    add $0e

jr_000_13e2:
    ld b, a
    ld [hl+], a
    ld a, [$d778]
    add $04
    cp $90
    jr c, jr_000_13ef

    ld a, $90

jr_000_13ef:
    ld c, a
    ld [hl+], a
    ld a, $4a
    add d
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, c
    add $08
    ld [hl+], a
    ld a, $4b
    add d
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ld a, [$c2b5]
    add $02
    ld [$c2b5], a

jr_000_1415:
    ld a, [$d76b]
    or a
    jp nz, Jump_000_151b

    ld a, [$d763]
    or a
    jp z, Jump_000_14a5

    ld a, [$d77a]
    bit 7, a
    jr nz, jr_000_1453

    ld a, [$d778]
    add $04
    ld c, a
    ld a, [$d776]
    add $08
    ld b, a
    ld a, [$c200]
    sub $08
    cp b
    jr nc, jr_000_14a5

    add $04
    cp b
    jr c, jr_000_14a5

    ld a, [$c201]
    cp c
    jr nc, jr_000_14a5

    add $0f
    cp c
    jr c, jr_000_14a5

    ld a, $06
    call Call_000_3e64

jr_000_1453:
    ld a, [$d8a0]
    or a
    jr z, jr_000_1486

    cp $04
    jr nz, jr_000_1479

    ld a, [$c201]
    sub $08
    ld b, a
    ld a, [$d778]
    add $04
    sub b
    call Call_000_18db
    ld a, [hl]
    ld b, a
    ld a, [$d77a]
    and $70
    or b
    ld [$d77a], a
    jr jr_000_14a5

jr_000_1479:
    ld [$d779], a
    ld a, [$d77a]
    res 7, a
    ld [$d77a], a
    jr jr_000_14a5

jr_000_1486:
    ld a, [$d779]
    cp $17
    jr nc, jr_000_14a5

    cp $09
    jr c, jr_000_14a5

    ld a, [$d89f]
    ld b, a
    ld a, [$d778]
    sub b
    ld [$d778], a
    ld a, [$d77a]
    set 7, a
    ld [$d77a], a
    ret


Jump_000_14a5:
jr_000_14a5:
    ld a, [$d8a1]
    or a
    jr z, jr_000_151b

    xor a
    ld [$d8a1], a
    ld a, [$d8a4]
    ld b, a
    ld hl, $d77d
    ld de, $0007

jr_000_14b9:
    add hl, de
    dec a
    jr nz, jr_000_14b9

    ld [$d8a4], a
    ld a, b
    add $02
    ld [$d77c], a
    ld a, [$d779]
    ld c, a
    ld a, [$d775]
    ld [hl+], a
    ld a, [$d776]
    ld [hl+], a
    ld a, [$d777]
    ld [hl+], a
    ld a, [$d778]
    ld [hl+], a
    ld a, c
    dec a
    and $1f
    or a
    jr nz, jr_000_14e4

    dec a
    and $1f

jr_000_14e4:
    cp $10
    jr nz, jr_000_14eb

    dec a
    and $1f

Jump_000_14eb:
jr_000_14eb:
    ld [hl+], a
    ld a, [$d77a]
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$d775]
    ld [hl+], a
    ld a, [$d776]
    ld [hl+], a
    ld a, [$d777]
    ld [hl+], a
    ld a, [$d778]
    ld [hl+], a
    ld a, c
    inc a
    and $1f
    or a
    jr nz, jr_000_150c

    inc a
    and $1f

jr_000_150c:
    cp $10
    jr nz, jr_000_1513

    inc a
    and $1f

jr_000_1513:
    ld [hl+], a
    ld a, [$d77a]
    ld [hl+], a
    xor a
    ld [hl+], a
    ret


Jump_000_151b:
jr_000_151b:
    ld a, [$d8a5]
    or a
    ret nz

    ld a, [$d77b]
    bit 7, a
    jr z, jr_000_1549

    res 7, a
    or a
    set 7, a
    ld [$d77b], a
    jr nz, jr_000_1549

    xor a
    ld [$d77b], a
    ld a, [$d779]
    inc a
    and $1f
    ld [$d779], a
    and $07
    jr nz, jr_000_1549

    ld a, [$d779]
    inc a
    ld [$d779], a

jr_000_1549:
    ld a, [$d779]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    ld de, $617f
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    xor a
    ld [$d770], a
    ld [$d76f], a
    ld a, [$d777]
    ld [$d773], a
    ld l, a
    ld a, [$d778]
    ld [$d774], a
    ld h, a
    add hl, bc
    ld a, [$d77a]
    and $0f
    or a
    jr z, jr_000_1582

jr_000_157a:
    sra b
    rr c
    dec a
    jr nz, jr_000_157a

    push bc

jr_000_1582:
    ld a, l
    ld [$d777], a
    ld a, h
    ld [$d778], a
    ld a, [$d775]
    ld [$d771], a
    ld l, a
    ld a, [$d776]
    ld [$d772], a
    ld h, a
    add hl, de
    ld a, [$d77a]
    and $0f
    or a
    jr z, jr_000_15ae

jr_000_15a1:
    sra d
    rr e
    dec a
    jr nz, jr_000_15a1

    push de
    ld a, $01
    ld [$d770], a

jr_000_15ae:
    ld a, l
    ld [$d775], a
    ld a, h
    ld [$d776], a
    xor a
    ld [$d8ab], a
    call Call_000_15f3
    ld a, [$d770]
    or a
    ret z

    ld a, [$d76f]
    or a
    jr z, jr_000_15cb

    add sp, $04
    ret


jr_000_15cb:
    pop de
    ld a, [$d775]
    ld l, a
    ld a, [$d776]
    ld h, a
    add hl, de
    ld a, l
    ld [$d775], a
    ld a, h
    ld [$d776], a
    pop bc
    ld a, [$d777]
    ld l, a
    ld a, [$d778]
    ld h, a
    add hl, bc
    ld a, l
    ld [$d777], a
    ld a, h
    ld [$d778], a
    call Call_000_15f3
    ret


Call_000_15f3:
    ld a, [$d778]
    ld c, a
    ld a, [$d776]
    add $04
    call Call_000_1822
    jr z, jr_000_160b

    jr c, jr_000_160b

    ld a, $01
    ld [$d76f], a
    call Call_000_17b8

jr_000_160b:
    ld a, [$d778]
    add $07
    ld c, a
    ld a, [$d776]
    add $04
    call Call_000_1822
    jr z, jr_000_1625

    jr c, jr_000_1625

    ld a, $01
    ld [$d76f], a
    call Call_000_17cd

jr_000_1625:
    ld a, [$d778]
    add $04
    ld c, a
    ld a, [$d776]
    add $07
    call Call_000_1822
    jr z, jr_000_163f

    jr c, jr_000_163f

    ld a, $01
    ld [$d76f], a
    call Call_000_1802

jr_000_163f:
    ld a, [$d778]
    add $04
    ld c, a
    ld a, [$d776]
    call Call_000_1822
    jr z, jr_000_1657

    jr c, jr_000_1657

    ld a, $01
    ld [$d76f], a
    call Call_000_17ed

jr_000_1657:
    ld a, [$d8a2]
    or a
    jr z, jr_000_168a

    ld a, [$d778]
    ld c, a
    ld a, [$d776]
    call Call_000_1822
    jr z, jr_000_1673

    jr c, jr_000_1673

    ld a, $01
    ld [$d76f], a
    call Call_000_17ed

jr_000_1673:
    ld a, [$d778]
    add $07
    ld c, a
    ld a, [$d776]
    call Call_000_1822
    ret z

    ret c

    ld a, $01
    ld [$d76f], a
    call Call_000_17ed
    ret


jr_000_168a:
    ld a, [$d778]
    inc a
    ld c, a
    push bc
    ld a, [$d776]
    add $06
    push af
    call Call_000_1822
    jr z, jr_000_16d4

    jr c, jr_000_16d4

    ld a, $01
    ld [$d76f], a
    pop af
    pop bc
    and $07
    ld d, a
    ld a, $07
    sub d
    ld d, a
    ld a, c
    and $0f
    cp d
    jr z, jr_000_16bd

    jr nc, jr_000_16b8

    call Call_000_17b8
    jr jr_000_16d6

jr_000_16b8:
    call Call_000_1802
    jr jr_000_16d6

jr_000_16bd:
    ld a, [$d779]
    ld l, a
    ld h, $00
    ld de, $625f
    add hl, de
    ld l, [hl]
    ld h, $00
    ld de, $61ff
    add hl, de
    ld a, [hl]
    ld [$d779], a
    jr jr_000_16d6

jr_000_16d4:
    add sp, $04

jr_000_16d6:
    ld a, [$d778]
    add $06
    ld c, a
    push bc
    ld a, [$d776]
    add $06
    push af
    call Call_000_1822
    jr z, jr_000_1725

    jr c, jr_000_1725

    ld a, $01
    ld [$d76f], a
    pop af
    pop bc
    and $07
    ld d, a
    ld a, $07
    sub d
    ld d, a
    ld a, c
    and $0f
    ld e, a
    ld a, $0f
    sub e
    cp d
    jr z, jr_000_170e

    jr nc, jr_000_1709

    call Call_000_17cd
    jr jr_000_1727

jr_000_1709:
    call Call_000_1802
    jr jr_000_1727

jr_000_170e:
    ld a, [$d779]
    ld l, a
    ld h, $00
    ld de, $623f
    add hl, de
    ld l, [hl]
    ld h, $00
    ld de, $61ff
    add hl, de
    ld a, [hl]
    ld [$d779], a
    jr jr_000_1727

jr_000_1725:
    add sp, $04

jr_000_1727:
    ld a, [$d778]
    inc a
    ld c, a
    push bc
    ld a, [$d776]
    inc a
    push af
    call Call_000_1822
    jr z, jr_000_1769

    jr c, jr_000_1769

    ld a, $01
    ld [$d76f], a
    pop af
    pop bc
    and $07
    ld d, a
    ld a, c
    and $0f
    cp d
    jr z, jr_000_1755

    jr nc, jr_000_1750

    call Call_000_17b8
    jr jr_000_176b

jr_000_1750:
    call Call_000_17ed
    jr jr_000_176b

jr_000_1755:
    ld a, [$d779]
    ld l, a
    ld h, $00
    ld de, $625f
    add hl, de
    ld l, [hl]
    ld h, $00
    ld de, $621f
    add hl, de
    ld a, [hl]
    jr jr_000_176b

jr_000_1769:
    add sp, $04

jr_000_176b:
    ld a, [$d778]
    add $06
    ld c, a
    push bc
    ld a, [$d776]
    inc a
    push af
    call Call_000_1822
    jr z, jr_000_17b5

    jr c, jr_000_17b5

    ld a, $01
    ld [$d76f], a
    pop af
    pop bc
    and $07
    ld d, a
    ld a, c
    and $0f
    ld e, a
    ld a, $0f
    sub e
    cp d
    jr z, jr_000_179e

    jr nc, jr_000_1799

    call Call_000_17cd
    jr jr_000_17b7

jr_000_1799:
    call Call_000_17ed
    jr jr_000_17b7

jr_000_179e:
    ld a, [$d779]
    ld l, a
    ld h, $00
    ld de, $623f
    add hl, de
    ld l, [hl]
    ld h, $00
    ld de, $621f
    add hl, de
    ld a, [hl]
    ld [$d779], a
    jr jr_000_17b7

jr_000_17b5:
    add sp, $04

jr_000_17b7:
    ret


Call_000_17b8:
    ld a, [$d779]
    ld l, a
    ld h, $00
    ld de, $625f
    add hl, de
    ld a, [hl]
    ld [$d779], a
    ld a, [$d8a2]
    or a
    jr nz, jr_000_17e0

    ret


Call_000_17cd:
    ld a, [$d779]
    ld l, a
    ld h, $00
    ld de, $623f
    add hl, de
    ld a, [hl]
    ld [$d779], a
    ld a, [$d8a2]
    or a
    ret z

jr_000_17e0:
    ld a, [$d773]
    ld [$d777], a
    ld a, [$d774]
    ld [$d778], a
    ret


Call_000_17ed:
    ld a, [$d779]
    ld l, a
    ld h, $00
    ld de, $621f
    add hl, de
    ld a, [hl]
    ld [$d779], a
    ld a, [$d8a2]
    or a
    jr nz, jr_000_1815

    ret


Call_000_1802:
    ld a, [$d779]
    ld l, a
    ld h, $00
    ld de, $61ff
    add hl, de
    ld a, [hl]
    ld [$d779], a

Call_000_1810:
    ld a, [$d8a2]
    or a
    ret z

jr_000_1815:
    ld a, [$d771]
    ld [$d775], a
    ld a, [$d772]
    ld [$d776], a
    ret


Call_000_1822:
    ld b, a
    call Call_000_316c
    ret nz

    call Call_000_319b
    ld e, b
    ld d, c
    ld a, [$d779]
    cp $17
    jp nc, Jump_000_1884

    cp $09
    jp c, Jump_000_1884

    ld a, [$c200]
    sub $08
    cp b
    jp nc, Jump_000_1884

    add $04
    cp b
    jp c, Jump_000_1884

    ld a, [$d764]
    ld b, a
    ld a, [$c201]
    sub $08
    ld c, a
    ld a, d
    sub c
    jr c, jr_000_1884

    cp b
    jr nc, jr_000_1884

    push af
    ld a, [$d76b]
    or a
    pop bc
    jr nz, jr_000_187d

    ld a, b
    call Call_000_18db
    ld [$d779], a
    ld a, [hl]
    ld b, a
    ld a, [$d77a]
    and $f0
    or b
    ld [$d77a], a
    ld a, $01
    ld [$d76f], a
    ld a, $01
    call Call_000_3e64

jr_000_187d:
    xor a
    ld [$d77b], a
    sub $01
    ret


Jump_000_1884:
jr_000_1884:
    ld a, e
    ld c, d
    push de
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, $ccba
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    pop bc
    ld a, [hl]
    or a
    ret z

    cp $0f
    jr z, jr_000_18b6

    cp $0e
    jr z, jr_000_18af

    push af
    xor a
    ld [$d77b], a
    pop af
    jp Jump_000_1a3a


jr_000_18af:
    ld a, [$d8ab]
    or a
    call z, $64d4

jr_000_18b6:
    ld a, [$d77b]
    bit 7, a
    jr nz, jr_000_18c8

    cp $14
    jr z, jr_000_18c7

    inc a
    ld [$d77b], a
    jr jr_000_18d2

jr_000_18c7:
    xor a

jr_000_18c8:
    res 7, a
    inc a
    and $07
    set 7, a
    ld [$d77b], a

jr_000_18d2:
    ld a, $04
    call Call_000_3e64
    ld a, $01
    or a
    ret


Call_000_18db:
    add a
    ld c, a
    ld b, $00
    ld hl, $5f8d
    ld de, $0040
    ld a, [$d764]
    cp $20
    jr z, jr_000_18f2

    ld hl, $600d
    ld de, $0050

jr_000_18f2:
    ld a, [$d8a3]
    or a
    jr z, jr_000_18f9

    add hl, de

jr_000_18f9:
    add hl, bc
    ld a, [hl+]
    ret


Call_000_18fc:
    ld a, [$d76b]
    or a
    ret z

    dec a
    ld [$d76b], a
    ld e, a
    ld d, $00
    ld hl, $6157
    add hl, de
    ld e, [hl]
    ld hl, $60ad
    add hl, de
    ld d, h
    ld e, l
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld a, [de]
    inc de
    ld [$ff8d], a
    ld b, a
    ld a, [$c2b5]
    add b
    ld [$c2b5], a
    ld a, [$d76c]
    ld b, a
    ld a, [$d76d]
    ld c, a

jr_000_1930:
    ld a, [de]
    inc de
    add b
    ld [hl+], a
    ld a, [de]
    inc de
    add c
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [$ff8d]
    dec a
    ld [$ff8d], a
    jr nz, jr_000_1930

    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ret


Call_000_1950:
    ld a, [$d76b]
    or a
    jr nz, jr_000_195d

    ld a, [$d764]
    cp $20
    jr nz, jr_000_19a6

jr_000_195d:
    ld a, [$dab2]
    or a
    ret z

    xor a
    ld [$dab2], a
    ld hl, $0200
    ld d, $00
    ld a, [$dab1]
    inc a
    ld e, a
    add hl, de
    ld b, h
    ld c, l
    ld hl, $9800
    add hl, bc
    ld d, h
    ld e, l
    ld hl, $cf2a
    add hl, bc
    ld b, h
    ld c, l
    ld hl, $d91c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, e
    cp $03
    ld a, [bc]
    ld [hl+], a
    ld a, $08
    jr nc, jr_000_1991

    ld a, $0a

jr_000_1991:
    ld [hl+], a
    inc e
    inc bc
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    ld a, $08
    ld [hl], a
    ld a, [$d9bd]
    add $02
    ld [$d9bd], a
    ret


jr_000_19a6:
    ld [$dab2], a
    ld hl, $0200
    ld a, [$c201]
    sub $08
    sra a
    sra a
    sra a
    ld e, a
    ld d, $00
    ld [$dab1], a
    add hl, de
    ld b, h
    ld c, l
    ld hl, $9800
    add hl, bc
    ld d, h
    ld e, l
    ld hl, $cf2a
    add hl, bc
    ld b, h
    ld c, l
    ld hl, $d91c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, e
    cp $03
    ld a, [bc]
    ld [hl+], a
    ld a, $08
    jr nc, jr_000_19de

    ld a, $0a

jr_000_19de:
    ld [hl+], a
    inc e
    inc bc
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $4e
    ld [hl+], a
    ld a, $83
    ld [hl+], a
    inc e
    inc bc
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $4e
    ld [hl+], a
    ld a, $83
    ld [hl+], a
    inc e
    inc bc
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    ld a, $08
    ld [hl], a
    ld a, [$d9bd]
    add $04
    ld [$d9bd], a
    ret


Call_000_1a0b:
    and $0f
    ld c, l
    ld b, h
    ld de, $0120
    add hl, de
    bit 7, [hl]
    jr nz, jr_000_1a92

    set 7, [hl]
    dec a
    ld [$d8b5], a
    or a
    jr z, jr_000_1a2b

    ld a, [$dc47]
    cp $02
    jr nz, jr_000_1a2b

    dec a
    ld [$d8b5], a

jr_000_1a2b:
    ld a, [$dc47]
    cp $02
    jr nz, jr_000_1a58

    ld a, [$d8bb]
    ld [$d8ba], a
    jr jr_000_1a5c

Call_000_1a3a:
Jump_000_1a3a:
    and $0f
    ld c, l
    ld b, h
    ld de, $0120
    add hl, de
    bit 7, [hl]
    jr nz, jr_000_1a8a

    set 7, [hl]
    dec a
    ld [$d8b5], a
    or a
    jr z, jr_000_1a58

    ld a, [$d76e]
    or a
    jr z, jr_000_1a58

    ld [$d8b5], a

jr_000_1a58:
    xor a
    ld [$d8ba], a

jr_000_1a5c:
    ld a, l
    ld [$d8b6], a
    ld a, h
    ld [$d8b7], a
    ld d, $00
    dec bc
    ld a, [bc]
    cp $0f
    jr nz, jr_000_1a6e

    set 0, d

jr_000_1a6e:
    ld hl, $fff1
    add hl, bc
    ld a, [hl]
    cp $0f
    jr nz, jr_000_1a79

    set 1, d

jr_000_1a79:
    ld a, d
    ld [$d8b4], a
    ld de, $3326
    add hl, de
    add hl, hl
    call Call_000_1ae5
    ld b, $01
    call $7c39

jr_000_1a8a:
    ld a, [$d76e]
    or a
    jr z, jr_000_1a92

    xor a
    ret


jr_000_1a92:
    ld a, $01
    or a
    ret


Call_000_1a96:
    ld b, $00
    ld de, $0010
    add hl, de
    ld a, [hl+]
    or a
    jr z, jr_000_1aa2

    set 0, b

jr_000_1aa2:
    ld a, [hl]
    or a
    jr z, jr_000_1aa8

    set 1, b

jr_000_1aa8:
    ld de, $ffdf
    add hl, de
    ld a, [hl-]
    or a
    jr z, jr_000_1ab8

    set 2, b
    cp $0f
    jr nz, jr_000_1ab8

    set 5, b

jr_000_1ab8:
    ld a, [hl]
    or a
    jr z, jr_000_1ac6

    set 3, b
    cp $0f
    jr nz, jr_000_1ac6

    set 4, b
    jr jr_000_1ad7

jr_000_1ac6:
    ld de, $fff0
    add hl, de
    ld a, [hl]
    ld de, $0010
    add hl, de
    cp $0f
    jr nz, jr_000_1ad7

    set 3, b
    set 2, b

jr_000_1ad7:
    ld a, b
    add a
    ld [$d8b4], a
    ld de, $3327
    add hl, de
    add hl, hl
    call Call_000_1b14
    ret


Call_000_1ae5:
    ld de, $981f
    add hl, de
    ld c, l
    ld b, h
    ld hl, $d8bc
    ld de, $0008

jr_000_1af1:
    ld a, [hl]
    or a
    jr z, jr_000_1af8

    add hl, de
    jr jr_000_1af1

jr_000_1af8:
    ld [hl], $05
    inc hl
    ld a, [$d8b6]
    ld [hl+], a
    ld a, [$d8b7]
    ld [hl+], a
    ld a, [$d8b5]
    ld [hl+], a
    ld a, [$d8b4]
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [$d8ba]
    ld [hl+], a
    ret


Call_000_1b14:
    ld a, [$cce7]
    dec a
    ld [$cce7], a
    jr nz, jr_000_1b55

    ld a, [$ffa0]
    or a
    jr nz, jr_000_1b55

    xor a
    ld [$ffa2], a
    ld b, $02
    ld a, [$dcfe]
    cp $04
    jr nz, jr_000_1b3b

    call Call_000_3c34
    ld a, [$dcff]
    or a
    jr nz, jr_000_1b3b

    ld b, $09

jr_000_1b3b:
    ld a, b
    ld [$ff9f], a
    ld a, $0f
    ld [$ffa0], a
    ld a, [$cce8]
    inc a
    cp $a0
    jr nz, jr_000_1b52

    ld a, $0d
    ld [$ff9f], a
    xor a

jr_000_1b52:
    ld [$cce8], a

jr_000_1b55:
    ld a, h
    ld [$ff8d], a
    ld a, l
    ld [$ff8e], a
    ld de, $981f
    add hl, de
    ld c, l
    ld b, h
    ld hl, $d91c
    ld de, $0004

jr_000_1b69:
    ld a, [hl]
    or a
    jr z, jr_000_1b70

    add hl, de
    jr jr_000_1b69

jr_000_1b70:
    push hl
    ld a, [$d8b4]
    ld e, a
    ld d, $00
    ld hl, $79de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


Call_000_1b7f:
Jump_000_1b7f:
    ld a, [$d9bd]
    add $02
    ld [$d9bd], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [$ff8d]
    ld d, a
    ld a, [$ff8e]
    ld e, a
    push hl
    ld hl, $cf49
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    ld a, e
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    inc c
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    ret


Call_000_1bac:
Jump_000_1bac:
    ld a, [$d9bd]
    add $02
    ld [$d9bd], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [$ff8d]
    ld d, a
    ld a, [$ff8e]
    ld e, a
    push hl
    ld hl, $cf49
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    ld a, e
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    inc c
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    ret


Call_000_1bd9:
Jump_000_1bd9:
    ld a, [$d9bd]
    add $02
    ld [$d9bd], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld a, [$ff8d]
    ld d, a
    ld a, [$ff8e]
    ld e, a
    push hl
    ld hl, $cf49
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    ld a, e
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    inc c
    ld a, c
    ld [hl+], a
    ld a, b

    db $22, $7a, $22, $3e, $0a, $22, $c9

Call_000_1c07:
Jump_000_1c07:
    ld a, [$d9bd]
    add $02
    ld [$d9bd], a
    ld a, c
    ld [hl+], a
    ld a, b

    ld [hl+], a
    ld a, [$ff8d]
    ld d, a
    ld a, [$ff8e]
    ld e, a
    push hl
    ld hl, $cf49
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]

Call_000_1c23:
    pop hl
    ld a, e
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    inc c
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    ret


Jump_000_1c34:
    ld a, [$d9bd]
    add $02
    ld [$d9bd], a
    ld a, c
    add $20
    ld c, a
    jr nc, jr_000_1c43

    inc b

jr_000_1c43:
    ld [hl+], a
    ld a, b
    ld [hl+], a

Call_000_1c46:
    ld a, [$ff8d]
    ld d, a
    ld a, [$ff8e]
    ld e, a
    push hl
    ld hl, $cf6a
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    ld a, e
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    inc c
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    ret


Jump_000_1c67:
    ld a, [$d9bd]
    add $02
    ld [$d9bd], a
    ld a, c
    add $20
    ld c, a
    jr nc, jr_000_1c76

    inc b

jr_000_1c76:
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [$ff8d]
    ld d, a
    ld a, [$ff8e]
    ld e, a
    push hl
    ld hl, $cf6a
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    ld a, e
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    inc c
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    ret


Jump_000_1c9a:
    ld a, [$d9bd]
    inc a
    ld [$d9bd], a
    ld a, c
    add $21
    ld c, a
    jr nc, jr_000_1ca8

    inc b

jr_000_1ca8:
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [$ff8d]
    ld d, a
    ld a, [$ff8e]
    ld e, a
    push hl
    ld hl, $cf6b
    add hl, de
    ld a, [hl]
    pop hl
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    ret


Jump_000_1cbf:
    ld a, [$d9bd]
    inc a
    ld [$d9bd], a
    ld a, c
    add $20
    ld c, a
    jr nc, jr_000_1ccd

    inc b

jr_000_1ccd:
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [$ff8d]
    ld d, a
    ld a, [$ff8e]
    ld e, a
    push hl
    ld hl, $cf6a
    add hl, de
    ld a, [hl]
    pop hl
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    ret


Jump_000_1ce4:
    ld a, [$d9bd]
    inc a
    ld [$d9bd], a
    ld a, c
    add $20
    ld c, a
    jr nc, jr_000_1cf2

    inc b

jr_000_1cf2:
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [$ff8d]
    ld d, a
    ld a, [$ff8e]
    ld e, a
    push hl
    ld hl, $cf6a
    add hl, de
    ld d, [hl]
    pop hl
    ld a, d
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    ret


    pop hl
    call Call_000_1b7f
    jp Jump_000_1c34


    pop hl
    call Call_000_1b7f
    jp Jump_000_1c9a


    pop hl
    call Call_000_1b7f
    jp Jump_000_1cbf


    pop hl

Call_000_1d20:
    jp Jump_000_1b7f


    pop hl
    call Call_000_1bd9
    jp Jump_000_1c34


    pop hl
    call Call_000_1bd9
    jp Jump_000_1c9a


    pop hl
    call Call_000_1bd9
    jp Jump_000_1cbf


    pop hl
    jp Jump_000_1bd9


    pop hl
    call Call_000_1c07
    jp Jump_000_1c34


    pop hl
    call Call_000_1c07
    jp Jump_000_1c9a


    pop hl
    call Call_000_1c07
    jp Jump_000_1cbf


    pop hl
    jp Jump_000_1c07


    pop hl
    call Call_000_1bac
    jp Jump_000_1c34


    pop hl
    call Call_000_1bac
    jp Jump_000_1c9a


    pop hl
    call Call_000_1bac
    jp Jump_000_1cbf


    pop hl
    jp Jump_000_1bac


    pop hl
    call Call_000_1bac
    jp Jump_000_1c67


    pop hl
    call Call_000_1bac
    jp Jump_000_1ce4


Call_000_1d7c:
    ld a, [$d9bd]
    or a
    jr z, jr_000_1dae

    ld [$ff8d], a
    ld hl, $d91c
    ld bc, $da37
    ld a, [$daaf]
    ld e, a
    ld a, [$dab0]
    ld d, a

jr_000_1d93:
    ld a, [hl]
    ld [de], a
    ld [bc], a
    xor a
    ld [hl+], a
    inc de
    inc bc
    ld a, [hl+]
    ld [de], a
    ld [bc], a
    inc de
    inc bc
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [$ff8d]
    dec a
    ld [$ff8d], a
    jr nz, jr_000_1d93

jr_000_1dae:
    ld a, $09
    ld [ROM_BANK], a
    ld a, [$dab3]
    ld l, a
    ld a, [$dab4]
    ld h, a
    ld b, $0c

jr_000_1dbd:
    ld a, [hl+]
    cp $ff
    jr nz, jr_000_1dc6

    ld hl, $4000
    ld a, [hl+]

jr_000_1dc6:
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_1dbd

    ld a, l
    ld [$dab3], a
    ld a, h
    ld [$dab4], a
    ld a, $01
    ld [ROM_BANK], a
    ld a, [$d9bd]
    ld [$d9be], a
    ld b, a
    ld a, [$d9bc]
    add b
    add $0c
    ld [$d9bd], a
    ret


Call_000_1def:
    ld b, $01
    jr jr_000_1df5

Call_000_1df3:
    ld b, $00

jr_000_1df5:
    ld hl, $d8bc
    ld c, $0c

jr_000_1dfa:
    ld a, [hl]
    or a
    jr z, jr_000_1e08

    ld [hl], b
    ld de, $0007
    add hl, de
    ld [hl], $00
    inc hl
    jr jr_000_1e0c

jr_000_1e08:
    ld de, $0008
    add hl, de

jr_000_1e0c:
    dec c
    jr nz, jr_000_1dfa

    ld hl, $4000
    ld a, l
    ld [$dab3], a
    ld a, h
    ld [$dab4], a
    ret


Call_000_1e1b:
    ld hl, $d8bc
    ld de, $d9bf
    xor a
    ld [$d9bc], a
    ld a, $0c
    ld [$ff90], a

Jump_000_1e2a:
    ld a, [hl]
    or a
    jp z, Jump_000_1f61

    cp $05
    jp z, Jump_000_1ed8

    dec a
    ld [hl], a
    jp nz, Jump_000_1f61

    inc hl
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [bc]
    and $7f
    ld [bc], a
    ld a, [hl+]
    or a
    jr nz, jr_000_1e64

    push hl
    ld hl, $fee0
    add hl, bc
    ld [hl], a
    push de
    call Call_000_1a96
    pop de
    pop hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    or a
    call nz, $628e
    ld a, $03
    call Call_000_3e64
    jp Jump_000_1f68


jr_000_1e64:
    push hl
    ld hl, $fee0
    add hl, bc
    ld [hl], a
    pop hl
    cp $01
    jr nz, jr_000_1e71

    ld b, $06

jr_000_1e71:
    cp $02
    jr nz, jr_000_1e77

    ld b, $0c

jr_000_1e77:
    cp $03
    jr nz, jr_000_1e7d

    ld b, $12

jr_000_1e7d:
    ld a, [hl+]
    or a
    jr nz, jr_000_1e8d

    ld a, $48
    sub b
    ld [$d8b8], a
    ld a, $49
    sub b
    ld [$d8b9], a

jr_000_1e8d:
    cp $01
    jr nz, jr_000_1e9d

    ld a, $4a
    sub b
    ld [$d8b8], a
    ld a, $49
    sub b
    ld [$d8b9], a

jr_000_1e9d:
    cp $02
    jr nz, jr_000_1eaf

jr_000_1ea1:
    ld a, $4a
    sub b
    ld [$d8b8], a
    ld a, $4b
    sub b
    ld [$d8b9], a
    jr jr_000_1eb3

jr_000_1eaf:
    cp $03
    jr z, jr_000_1ea1

jr_000_1eb3:
    ld a, [hl+]
    ld [de], a
    inc de
    ld c, a
    ld a, [hl+]
    ld [de], a
    inc de
    ld b, a
    ld a, [$d8b8]
    ld [de], a
    inc de
    inc c
    ld a, c
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    inc de
    ld a, [$d8b9]
    ld [de], a
    inc de
    ld a, [$d9bc]
    add $02
    ld [$d9bc], a
    inc hl
    jp Jump_000_1f68


Jump_000_1ed8:
    dec a
    ld [hl+], a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [bc]
    and $7f
    ld [$db6e], a
    ld a, [hl+]
    ld [$db6f], a
    or a
    jr nz, jr_000_1eed

    ld b, $00

jr_000_1eed:
    cp $01
    jr nz, jr_000_1ef3

    ld b, $06

jr_000_1ef3:
    cp $02
    jr nz, jr_000_1ef9

    ld b, $0c

jr_000_1ef9:
    cp $03
    jr nz, jr_000_1eff

    ld b, $12

jr_000_1eff:
    ld a, [hl+]
    or a
    jr nz, jr_000_1f0f

    ld a, $46
    sub b
    ld [$d8b8], a
    ld a, $47
    sub b
    ld [$d8b9], a

jr_000_1f0f:
    cp $01
    jr nz, jr_000_1f1f

    ld a, $48
    sub b
    ld [$d8b8], a
    ld a, $47
    sub b
    ld [$d8b9], a

jr_000_1f1f:
    cp $02
    jr nz, jr_000_1f31

jr_000_1f23:
    ld a, $48
    sub b
    ld [$d8b8], a
    ld a, $49
    sub b
    ld [$d8b9], a
    jr jr_000_1f35

jr_000_1f31:
    cp $03
    jr z, jr_000_1f23

jr_000_1f35:
    ld a, [hl+]
    ld [de], a
    inc de
    ld c, a
    ld a, [hl+]
    ld [de], a
    inc de
    ld b, a
    ld a, [$d8b8]
    ld [de], a
    inc de
    inc c
    ld a, c
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    inc de
    ld a, [$d8b9]
    ld [de], a
    inc de
    ld a, [$d9bc]
    add $02
    ld [$d9bc], a
    call $5034
    inc hl
    ld a, $02
    call Call_000_3e64
    jr jr_000_1f68

Jump_000_1f61:
    ld a, l
    add $08
    ld l, a
    jr nc, jr_000_1f68

    inc h

Jump_000_1f68:
jr_000_1f68:
    ld a, [$ff90]
    dec a
    ld [$ff90], a
    jp nz, Jump_000_1e2a

    ld a, e
    ld [$daaf], a
    ld a, d
    ld [$dab0], a
    ret


    ld e, $05
    call Call_000_3e51
    ld a, $04
    ld [$c359], a
    ld hl, $03a4
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    ld a, $01
    ld [$ff9c], a
    ld a, $01
    ld [$ff9a], a
    xor a
    ld [$cb53], a
    ldh [rSCX], a
    ldh [rSCY], a
    ld [$c959], a
    ld de, $4000
    call Call_000_0061
    ld hl, $9800
    call Call_000_01b9
    ld a, $02
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ld de, $9880
    ld hl, $6dc4
    ld b, $14
    ld c, $0e
    call Call_000_01d4
    xor a
    ldh [rVBK], a
    ld hl, $6edc
    ld de, $8000
    ld bc, $04c0
    call DataTransfer
    ld hl, $603c
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $683c
    ld de, $8800
    ld bc, $0340
    call DataTransfer
    ld hl, $6b7c
    ld de, $8b40
    ld bc, $0090
    call DataTransfer
    ld a, $25
    ld de, $9880

Call_000_2000:
    ld hl, $6c5c
    ld b, $14
    ld c, $0e
    call Call_000_01d4
    ld a, $0e
    call ChangeROMBank
    ld a, [$df46]
    ld l, a
    ld a, [$df47]
    ld h, a
    ld de, $dac3
    ld bc, $0014
    call DataTransfer

Jump_000_2020:
    ld a, [$df43]
    ld [$dad2], a
    call Call_000_20b3
    ld a, [$df01]
    ld l, a
    ld a, [$df02]
    ld h, a
    call Call_000_0e54
    ld hl, $dac3
    call Call_000_0e54
    ld a, [$df0b]
    ld l, a
    ld a, [$df0c]
    ld h, a
    call Call_000_0e54
    ld a, [$df07]
    ld l, a
    ld a, [$df08]
    ld h, a
    ld a, [$dabb]
    or a
    jr z, jr_000_205b

    ld a, [$df09]
    ld l, a
    ld a, [$df0a]
    ld h, a

jr_000_205b:
    call Call_000_0e54
    ld a, [$df03]
    ld l, a
    ld a, [$df04]
    ld h, a
    ld a, [$dabc]
    or a
    jr z, jr_000_2074

    ld a, [$df05]
    ld l, a
    ld a, [$df06]
    ld h, a

jr_000_2074:
    call Call_000_0e54
    ld a, [$db54]
    or a
    jr z, jr_000_2083

    ld hl, $4000
    call Call_000_0e54

jr_000_2083:
    ld hl, $db56
    ld a, [$9968]
    ld [hl+], a
    ld a, [$9969]
    ld [hl+], a
    ld a, [$996a]
    ld [hl+], a
    ld a, [$996b]
    ld [hl], a
    ld a, $01
    call ChangeROMBank
    ld a, $fd
    ld [$ccb7], a
    xor a
    ld [$dae1], a
    ld [$dac2], a
    ld [$db55], a
    call $71ef
    ld a, $90
    ld [$ff9e], a
    ret


Call_000_20b3:
    ld a, $30
    ld [$dad3], a
    ld [$dad4], a
    ld [$dad5], a
    ld a, [$ccba]
    inc a
    ld c, $00

jr_000_20c4:
    ld b, a
    sub $64
    jr nc, jr_000_20f6

    ld a, c
    or a
    jr z, jr_000_20d6

    add $30
    ld [$dad3], a
    ld a, b
    or a
    jr z, jr_000_20f9

jr_000_20d6:
    ld a, b
    ld c, $00

jr_000_20d9:
    ld b, a
    sub $0a
    jr nc, jr_000_20f3

Call_000_20de:
    ld a, c
    or a

Jump_000_20e0:
    jr z, jr_000_20eb

    add $30
    ld [$dad4], a
    ld a, b
    or a
    jr z, jr_000_20f9

jr_000_20eb:
    ld a, b
    add $30
    ld [$dad5], a
    jr jr_000_20f9

jr_000_20f3:
    inc c
    jr jr_000_20d9

jr_000_20f6:
    inc c
    jr jr_000_20c4

jr_000_20f9:
    ret


    call $7238
    ld a, [$ff9e]
    or a
    ret nz

    ld a, [$dac2]
    or a
    jp z, Jump_000_226d

    xor a
    ld [$dabd], a
    ld [$dabe], a
    ld [$dac0], a
    ld [$dac1], a
    inc a
    ld [$dabf], a
    ld a, [$ff8a]
    ld b, a
    or a
    jr z, jr_000_2126

    ld a, $fb
    ld [$ccb7], a

jr_000_2126:
    ld a, [$dadf]
    or a
    jr nz, jr_000_2131

    ld hl, $dad7
    jr jr_000_214a

jr_000_2131:
    cp $01
    jr nz, jr_000_213a

    ld hl, $dad8
    jr jr_000_214a

jr_000_213a:
    cp $02
    jr nz, jr_000_2143

    ld hl, $dad9
    jr jr_000_214a

jr_000_2143:
    cp $03
    jr nz, jr_000_214a

    ld hl, $dada

jr_000_214a:
    bit 3, b
    jr z, jr_000_217c

    ld a, [$dab6]
    or a
    jr nz, jr_000_2180

    inc a
    ld [$dab6], a
    ld a, $19
    call Call_000_3e64
    ld a, [hl]

jr_000_215e:
    dec a
    cp $41
    jr z, jr_000_215e

    cp $45
    jr z, jr_000_215e

    cp $49
    jr z, jr_000_215e

    cp $4f
    jr z, jr_000_215e

    cp $55
    jr z, jr_000_215e

    cp $40
    jr nz, jr_000_2179

    add $1a

jr_000_2179:
    ld [hl], a
    jr jr_000_2180

jr_000_217c:
    xor a
    ld [$dab6], a

jr_000_2180:
    bit 2, b
    jr z, jr_000_21ae

    ld a, [$dab7]
    or a
    jr nz, jr_000_21b2

    inc a
    ld [$dab7], a
    ld a, $19
    call Call_000_3e64
    ld a, [hl]

jr_000_2194:
    inc a
    cp $45
    jr z, jr_000_2194

    cp $49
    jr z, jr_000_2194

    cp $4f
    jr z, jr_000_2194

    cp $55
    jr z, jr_000_2194

    cp $5b
    jr nz, jr_000_21ab

    sub $19

jr_000_21ab:
    ld [hl], a
    jr jr_000_21b2

jr_000_21ae:
    xor a
    ld [$dab7], a

jr_000_21b2:
    ld a, b
    and $f3
    or a
    jp z, Jump_000_2268

    ld a, [$daba]
    or a
    ret nz

    ld a, $19
    call Call_000_3e64
    ld a, $01
    ld [$daba], a
    ld a, [$dadf]
    bit 4, b
    jr z, jr_000_21d0

    inc a

jr_000_21d0:
    bit 5, b
    jr z, jr_000_21d8

    or a
    jr z, jr_000_21d8

    dec a

jr_000_21d8:
    bit 7, b
    jr z, jr_000_21dd

    inc a

jr_000_21dd:
    bit 6, b
    jr z, jr_000_21e5

    or a
    jr z, jr_000_21e5

    dec a

jr_000_21e5:
    bit 0, b
    jr z, jr_000_21ea

    inc a

jr_000_21ea:
    bit 1, b
    jr z, jr_000_21f2

    or a
    jr z, jr_000_21f2

    dec a

jr_000_21f2:
    ld [$dadf], a
    or a
    jr nz, jr_000_2203

    ld a, $04
    ld [$dadb], a
    ld a, $01
    ld [$dadc], a
    ret


jr_000_2203:
    cp $01
    jr nz, jr_000_2213

    ld [$dadb], a
    ld [$dadd], a
    ld a, $04
    ld [$dadc], a
    ret


jr_000_2213:
    cp $02
    jr nz, jr_000_2225

    ld a, $01
    ld [$dadc], a
    ld [$dade], a
    ld a, $04
    ld [$dadd], a
    ret


jr_000_2225:
    cp $03
    jr nz, jr_000_2234

    ld a, $01
    ld [$dadd], a
    ld a, $04
    ld [$dade], a
    ret


jr_000_2234:
    ld a, $02
    call ChangeROMBank
    ld de, $dad7
    call Call_000_09fa
    push af
    call nz, Call_000_20b3
    pop af
    jr z, jr_000_225e

    ld hl, $cce3
    ld a, [$dad7]
    ld [hl+], a
    ld a, [$dad8]

Jump_000_2250:
    ld [hl+], a
    ld a, [$dad9]
    ld [hl+], a
    ld a, [$dada]
    ld [hl], a
    ld a, $1a
    call Call_000_3e64

jr_000_225e:
    ld a, $01
    call ChangeROMBank
    xor a
    ld [$dac2], a
    ret


Jump_000_2268:
    xor a
    ld [$daba], a
    ret


Jump_000_226d:
    ld a, [$dab5]
    or a
    jr nz, jr_000_22b2

    ld a, $04
    ld [$dabd], a
    ld a, $01
    ld [$dabe], a
    ld [$dabf], a
    ld [$dac0], a
    ld [$dac1], a
    ld a, [$ccba]
    or a
    jr nz, jr_000_228f

    ld [$dabe], a

jr_000_228f:
    ld a, [$ff8a]
    and $f0
    or a
    jr z, jr_000_22b2

    ld a, [$ff9f]
    cp $02
    jr z, jr_000_22b2

    ld a, $1a
    call Call_000_3e64
    ld a, $02
    ld [$ff9f], a
    ld a, $28
    ld [$ffa0], a
    ld b, $00
    call Call_000_251b

jr_000_22b2:
    ld a, [$dab5]
    dec a
    jr nz, jr_000_22f7

    ld a, $04
    ld [$dabe], a
    ld a, $01
    ld [$dabd], a
    ld [$dabf], a
    ld [$dac0], a
    ld [$dac1], a
    ld a, [$ccba]
    or a
    jr nz, jr_000_22d4

    ld [$dabe], a

jr_000_22d4:
    ld a, [$ff8a]
    and $f0
    or a
    jr z, jr_000_22f7

    ld a, [$ff9f]
    cp $02
    jr z, jr_000_22f7

    ld a, $1a
    call Call_000_3e64
    ld a, $02
    ld [$ff9f], a
    ld a, $28
    ld [$ffa0], a
    ld b, $01
    call Call_000_251b

jr_000_22f7:
    ld a, [$dab5]
    cp $02
    jr nz, jr_000_235b

    ld a, $04
    ld [$dabf], a
    ld a, $01
    ld [$dabd], a
    ld [$dabe], a
    ld [$dac0], a
    ld [$dac1], a
    ld a, [$ccba]
    or a
    jr nz, jr_000_231a

    ld [$dabe], a

jr_000_231a:
    ld a, [$ff8a]
    and $f0
    or a
    jr z, jr_000_2357

    ld a, [$daba]
    or a
    jr nz, jr_000_235b

    ld a, $1a
    call Call_000_3e64
    ld a, $01
    ld [$dac2], a
    ld [$daba], a
    ld [$dadc], a
    ld [$dadd], a
    ld [$dade], a
    dec a
    ld [$dadf], a
    ld a, $42
    ld [$dad7], a
    ld [$dad8], a
    ld [$dad9], a
    ld [$dada], a
    ld a, $04
    ld [$dadb], a
    jr jr_000_235b

jr_000_2357:
    xor a
    ld [$daba], a

jr_000_235b:
    ld a, [$dab5]
    cp $03
    jr nz, jr_000_237e

    ld a, $04
    ld [$dac0], a
    ld a, $01
    ld [$dabd], a
    ld [$dabe], a
    ld [$dabf], a
    ld [$dac1], a
    ld a, [$ccba]
    or a
    jr nz, jr_000_237e

    ld [$dabe], a

jr_000_237e:
    ld a, [$dab5]
    cp $04
    jr nz, jr_000_23a1

    ld a, $04
    ld [$dac1], a
    ld a, $01
    ld [$dabd], a
    ld [$dabe], a
    ld [$dabf], a
    ld [$dac0], a
    ld a, [$ccba]
    or a
    jr nz, jr_000_23a1

    ld [$dabe], a

jr_000_23a1:
    ld a, [$ff8a]
    ld b, a
    or a
    jr z, jr_000_23ad

    ld a, $fd
    ld [$ccb7], a

jr_000_23ad:
    bit 3, b
    jr z, jr_000_23dd

    ld a, [$dab6]
    or a
    jr nz, jr_000_23e1

    inc a
    ld [$dab6], a
    ld a, $19
    call Call_000_3e64
    ld a, [$dab5]
    inc a
    cp $05
    jr nz, jr_000_23cb

    xor a
    jr jr_000_23d8

jr_000_23cb:
    ld c, a
    ld a, [$ccba]
    or a
    ld a, c
    jr nz, jr_000_23d8

    cp $01
    jr nz, jr_000_23d8

    inc a

jr_000_23d8:
    ld [$dab5], a
    jr jr_000_23e1

jr_000_23dd:
    xor a
    ld [$dab6], a

jr_000_23e1:
    bit 2, b
    jr z, jr_000_2412

    ld a, [$dab7]
    or a
    jr nz, jr_000_2416

    inc a
    ld [$dab7], a
    ld a, $19
    call Call_000_3e64
    ld a, [$dab5]
    dec a
    cp $ff
    jr nz, jr_000_2400

    ld a, $04
    jr jr_000_240d

jr_000_2400:
    ld c, a

Call_000_2401:
    ld a, [$ccba]
    or a
    ld a, c
    jr nz, jr_000_240d

    cp $01
    jr nz, jr_000_240d

    dec a

jr_000_240d:
    ld [$dab5], a
    jr jr_000_2416

jr_000_2412:
    xor a
    ld [$dab7], a

jr_000_2416:
    ld a, [$dab5]
    cp $03
    jp c, Jump_000_24d4

    ld a, b
    and $f0
    or a
    jr z, jr_000_2458

    ld a, [$daba]
    or a
    jr nz, jr_000_245c

    inc a
    ld [$daba], a
    ld a, $19
    call Call_000_3e64
    ld a, [$dab5]
    cp $03
    jr nz, jr_000_244e

    ld a, [$dabb]
    xor $01
    ld [$dabb], a
    ld e, $05
    or a
    jr z, jr_000_2449

    ld e, $00

jr_000_2449:
    call Call_000_3e56
    jr jr_000_245c

jr_000_244e:
    ld a, [$dabc]
    xor $01
    ld [$dabc], a
    jr jr_000_245c

jr_000_2458:
    xor a
    ld [$daba], a

jr_000_245c:
    bit 0, b
    jr z, jr_000_2494

    ld a, [$dab8]
    or a
    jr nz, jr_000_2498

    inc a
    ld [$dab8], a
    ld a, $19
    call Call_000_3e64
    ld a, [$dab5]
    cp $03
    jr nz, jr_000_248a

    ld a, [$dabb]
    xor $01
    ld [$dabb], a
    ld e, $05
    or a
    jr z, jr_000_2485

    ld e, $00

jr_000_2485:
    call Call_000_3e56
    jr jr_000_2498

jr_000_248a:
    ld a, [$dabc]
    xor $01
    ld [$dabc], a
    jr jr_000_2498

jr_000_2494:
    xor a
    ld [$dab8], a

jr_000_2498:
    bit 1, b
    jr z, jr_000_24d0

    ld a, [$dab9]
    or a
    jr nz, jr_000_24d4

    inc a
    ld [$dab9], a
    ld a, $19
    call Call_000_3e64
    ld a, [$dab5]
    cp $03
    jr nz, jr_000_24c6

    ld a, [$dabb]
    xor $01
    ld [$dabb], a
    ld e, $05
    or a
    jr z, jr_000_24c1

    ld e, $00

jr_000_24c1:
    call Call_000_3e56
    jr jr_000_24d4

jr_000_24c6:
    ld a, [$dabc]
    xor $01
    ld [$dabc], a
    jr jr_000_24d4

jr_000_24d0:
    xor a
    ld [$dab9], a

Jump_000_24d4:
jr_000_24d4:
    ld a, [$dae0]
    inc a
    ld [$dae0], a
    and $01
    jr z, jr_000_251a

    ld a, [$ccb7]
    cp $ff
    jr z, jr_000_251a

    dec a
    ld [$ccb7], a
    jr nz, jr_000_251a

    ld a, [$ff9f]
    cp $01
    jr nz, jr_000_251a

    ld a, [$dae2]
    xor $01
    ld [$dae2], a
    jr z, jr_000_2501

    ld a, $07
    jr jr_000_2503

jr_000_2501:
    ld a, $08

jr_000_2503:
    ld [$ff9f], a
    ld a, $28
    ld [$ffa0], a
    ld a, $01
    ld [$ccb6], a
    ld a, $fe
    ld [$ccb7], a
    ld a, $1a
    call Call_000_3e64

jr_000_251a:
    ret


Call_000_251b:
    call $7c2d
    xor a
    ld [$dcfe], a
    ld [$dcff], a
    ld a, $05
    ld [$d8ac], a
    ld a, b
    or a
    jr z, jr_000_2533

    ld a, [$ccba]
    jr jr_000_2535

jr_000_2533:
    ld a, $00

jr_000_2535:
    ld [$cce8], a
    ld hl, $05dc
    ld a, l
    ld [$dd4d], a
    ld a, h
    ld [$dd4e], a
    ld hl, $0096
    ld a, l
    ld [$dd4f], a
    ld a, h
    ld [$dd50], a
    ret


    ld e, $01
    call Call_000_3e51
    ld a, $00
    ld [$c359], a
    ld hl, $02b3
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    ld a, $04
    ld [$ff9c], a
    xor a
    ld [$ff9b], a
    ld a, $80
    ld [$c958], a
    ld a, $01
    ld [$ff9a], a
    xor a
    ldh [rSCX], a
    ld de, $4130
    call Call_000_0061
    ld a, $07
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    ld hl, $4000
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $4800
    ld de, $8800
    ld bc, $0620
    call DataTransfer
    ld hl, $6468
    ld de, $8000
    ld bc, $00d0
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, $5dac
    ld b, $14
    ld c, $12
    call Call_000_01d4
    ld a, [$defc]
    or a
    jr z, jr_000_25cf

    ld hl, $5f14
    ld de, $9a20
    xor a
    ld b, $14
    ld c, $01
    call Call_000_01d4

jr_000_25cf:
    xor a
    ld [$dae1], a
    ldh [rVBK], a
    ld hl, $4e10
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $5610
    ld de, $8800
    ld bc, $0620
    call DataTransfer
    ld a, [$defc]
    ld hl, $6538
    dec a
    jr z, jr_000_2605

    ld hl, $67b8
    dec a
    jr z, jr_000_2605

    ld hl, $6678
    dec a
    jr z, jr_000_2605

    ld hl, $68f8

jr_000_2605:
    ld de, $8e20
    ld bc, $0140
    call DataTransfer
    ld hl, $5f28
    ld de, $8000
    ld bc, $0540
    call DataTransfer
    xor a
    ld [$dab5], a
    ld de, $9800
    ld hl, $5c30
    ld b, $14
    ld c, $12
    call Call_000_01d4
    ld a, [$defc]
    or a
    jr z, jr_000_2640

    ld hl, $5d98
    ld a, $e2
    ld de, $9a20
    ld b, $14
    ld c, $01
    call Call_000_01d4

jr_000_2640:
    ld a, $01
    call ChangeROMBank
    ld a, $04
    ld [$dabd], a
    ld a, $01
    ld [$dabe], a
    ld [$dabf], a
    ld [$dac0], a
    ld [$dac1], a
    ld a, [$ccba]
    or a
    jr nz, jr_000_2661

    ld [$dabe], a

jr_000_2661:
    call $6e25
    ret


    ld a, [$ff9f]
    cp $01
    jr z, jr_000_2683

    ld a, [$ff8a]
    and $f0
    or a
    jr z, jr_000_2683

    ld a, $01
    ld [$ff9f], a
    ld a, $1e
    ld [$ffa0], a
    ld a, $1a
    call Call_000_3e64

jr_000_2683:
    call $6cd4
    ret


    ld a, [$dabc]
    or a
    jr nz, jr_000_2692

    ld e, $07
    call Call_000_3e56

jr_000_2692:
    ld hl, $02b3
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    xor a
    ld [$ff9c], a
    ld a, $01
    ld [$ff9a], a
    xor a
    ld [$dae1], a
    ldh [rSCX], a
    ld de, $41b0
    call Call_000_0061
    ld a, $05
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    ld hl, $496c
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $516c
    ld de, $8800
    ld bc, $0340
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, $63a4
    ld b, $14
    ld c, $12
    call Call_000_01d4
    xor a
    ldh [rVBK], a
    ld hl, $54ac
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $5cac
    ld de, $8800
    ld bc, $0590
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, $623c
    ld b, $14
    ld c, $12
    call Call_000_01d4
    ld a, [$df4e]
    ld l, a
    ld a, [$df4f]
    ld h, a
    call Call_000_0e84
    ld a, $01
    call ChangeROMBank
    ret


Call_000_271b:
    call Call_000_294b
    xor a
    ld [$dc23], a
    ld [$dc2d], a
    ld [$dc20], a
    ld [$dbe0], a
    ld [$dbea], a
    ld [$dc34], a
    ld [$dc2e], a
    ld [$dc2b], a
    ld [$dc2f], a
    dec a
    ld [$dc2a], a
    ld a, $01
    ld [$dc2c], a
    ld b, $f0
    ld c, $32
    ld a, c
    ld [$dc1e], a
    ld a, $3c
    add b
    ld [$dc1f], a
    ld hl, $4f4b
    ld de, $dc11
    call Call_000_2869
    xor a
    ld [$dc24], a
    inc a
    ld [$dc23], a
    ret


Call_000_2763:
    ld a, [$dc35]
    bit 0, a
    jr z, jr_000_276d

    call Call_000_2d66

jr_000_276d:
    call Call_000_2981
    ld a, [$dc35]
    bit 1, a
    jr z, jr_000_277a

    call Call_000_277b

jr_000_277a:
    ret


Call_000_277b:
    ld a, [$dc24]
    or a
    jr z, jr_000_27f3

    ld hl, $4fd7
    ld a, [$dc17]
    and $01
    ld e, a
    or a
    jr nz, jr_000_279a

    ld a, [$dc18]
    or a
    jr nz, jr_000_279a

    ld a, [$dbe0]
    inc a
    ld [$dbe0], a

jr_000_279a:
    ld a, [$dc18]
    inc a
    ld [$dc18], a
    and $07
    jr nz, jr_000_2815

    ld a, e
    inc a
    cp $02
    jr z, jr_000_27b0

    ld [$dc17], a
    jr jr_000_2815

jr_000_27b0:
    xor a
    ld [$dc24], a
    ld [$dc17], a
    ld [$dc18], a
    ld a, [$dc14]
    add $04
    ld b, a
    ld a, [$dc12]
    add $04
    ld c, a
    ld a, [$ff8c]
    and $07
    ld d, $00
    ld e, a
    ld a, c
    cp $68
    jr nc, jr_000_27e0

    ld hl, $4f1e
    add hl, de
    ld l, [hl]
    ld h, d
    ld a, $40

Jump_000_27db:
    ld de, $4d7d

Jump_000_27de:
    jr jr_000_27eb

jr_000_27e0:
    ld hl, $4f26
    add hl, de
    ld l, [hl]
    ld h, d
    ld a, $24
    ld de, $4e6e

jr_000_27eb:
    call Call_000_295a
    ld a, $0e
    call Call_000_3e64

jr_000_27f3:
    ld hl, $4f57
    ld a, [$dc20]
    or a
    jr z, jr_000_27ff

    ld hl, $4f97

jr_000_27ff:
    ld a, [$dc17]
    and $03
    ld e, a
    ld a, [$dc18]
    inc a
    ld [$dc18], a
    and $07
    jr nz, jr_000_2815

    ld a, e
    inc a
    ld [$dc17], a

jr_000_2815:
    swap e
    ld d, $00
    add hl, de
    ld d, h
    ld e, l
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld a, [$dc12]
    ld b, a
    ld a, [$dc14]
    ld c, a
    ld a, $04
    ld [$ff8d], a

jr_000_2831:
    ld a, [de]
    inc de
    add b
    ld [hl+], a
    ld a, [de]
    inc de
    add c
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    push de
    ld d, a
    ld a, [$dc36]
    add d
    pop de
    ld [hl+], a
    ld a, [$ff8d]
    dec a
    ld [$ff8d], a
    jr nz, jr_000_2831

    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ld a, [$c2b5]
    add $04
    ld [$c2b5], a
    ld bc, $4f4b
    ld hl, $dc11
    call Call_000_2892
    ret


Call_000_2869:
    xor a
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    inc de
    xor a
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    xor a
    ld [de], a
    inc de
    ld [de], a
    inc de
    ld [de], a
    inc de
    ld a, [hl+]
    ld c, a
    ld [de], a
    inc de
    ld a, [hl]
    ld b, a
    ld [de], a
    inc de
    ld l, c
    ld h, b
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ret


Call_000_2892:
    push hl
    push bc
    ld de, $dbd1
    ld c, $0f

jr_000_2899:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_000_2899

    pop bc
    ld a, [$dbdc]
    dec a
    ld [$dbdc], a
    jr nz, jr_000_2901

    ld h, a
    ld a, [$dbd9]
    inc a
    ld [$dbd9], a
    ld l, a
    add hl, hl
    ld a, [$dbda]
    ld e, a
    ld a, [$dbdb]
    ld d, a
    add hl, de
    ld a, [hl+]
    or a
    jr nz, jr_000_28fa

    ld a, [$dbd5]
    dec a
    ld [$dbd5], a
    jr nz, jr_000_28ed

    ld h, a
    ld a, [$dbd6]
    ld l, a
    add hl, hl
    add hl, hl
    add hl, bc
    ld a, [hl+]
    ld [$dbd5], a
    ld a, [hl+]
    ld [$dbd6], a
    ld a, [hl+]
    ld [$dbda], a
    ld a, [hl+]
    ld [$dbdb], a
    ld a, [$dbdf]
    ld [$dbd4], a
    ld a, [$dbde]
    ld [$dbd2], a

jr_000_28ed:
    ld a, [$dbda]
    ld l, a
    ld a, [$dbdb]
    ld h, a
    xor a
    ld [$dbd9], a
    ld a, [hl+]

jr_000_28fa:
    ld [$dbdc], a
    ld a, [hl]
    ld [$dbdd], a

jr_000_2901:
    ld a, [$dbdd]
    ld h, $00
    ld l, a
    add hl, hl
    add hl, hl
    ld de, $617f
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [$dbd3]
    ld l, a
    ld a, [$dbd4]
    ld h, a
    sra b
    rr c
    add hl, bc
    ld a, l
    ld [$dbd3], a
    ld a, h
    ld [$dbd4], a
    ld a, [$dbd1]
    ld l, a
    ld a, [$dbd2]
    ld h, a
    sra d
    rr e
    add hl, de
    ld a, l
    ld [$dbd1], a
    ld a, h
    ld [$dbd2], a
    pop hl
    ld de, $dbd1
    ld c, $0f

jr_000_2944:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_000_2944

    ret


Call_000_294b:
    ld hl, $dbed
    ld de, $0009
    ld b, $04
    xor a

jr_000_2954:
    ld [hl], a
    add hl, de
    dec b
    jr nz, jr_000_2954

    ret


Call_000_295a:
    push hl
    push af
    push bc
    push de
    ld hl, $dbed
    ld de, $0009

jr_000_2964:
    ld a, [hl]
    or a
    jr z, jr_000_296b

    add hl, de
    jr jr_000_2964

jr_000_296b:
    pop de
    pop bc
    pop af
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, b
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, c
    ld [hl+], a
    pop bc
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl], a
    ret


Call_000_2981:
    ld hl, $dbed
    ld de, $0009
    ld b, $04

jr_000_2989:
    ld a, [hl]
    or a
    jr z, jr_000_29e0

    push hl
    inc hl
    ld [$dbe1], a
    ld a, [hl+]
    ld [$dbe2], a
    ld a, [hl+]
    ld [$dbe3], a
    ld a, [hl+]
    ld [$dbe4], a
    ld a, [hl+]
    ld [$dbe5], a
    ld a, [hl+]
    ld [$dbe8], a
    ld a, [hl+]
    ld [$dbe9], a
    ld a, [hl+]
    ld [$dbe6], a
    ld a, [hl]
    ld [$dbe7], a
    push bc
    push de
    call Call_000_2abf
    pop de
    pop bc
    pop hl
    ld a, [$dbe1]
    ld [hl+], a
    ld a, [$dbe2]
    ld [hl+], a
    ld a, [$dbe3]
    ld [hl+], a
    ld a, [$dbe4]
    ld [hl+], a
    ld a, [$dbe5]
    ld [hl+], a
    ld a, [$dbe8]
    ld [hl+], a
    ld a, [$dbe9]
    ld [hl+], a

Jump_000_29d6:
    ld a, [$dbe6]
    ld [hl+], a
    ld a, [$dbe7]
    ld [hl+], a
    jr jr_000_29e1

jr_000_29e0:
    add hl, de

jr_000_29e1:
    dec b
    jr nz, jr_000_2989

    ld a, [$dbea]
    or a
    jr z, jr_000_2a4a

    dec a
    ld [$dbea], a
    jr nz, jr_000_29f5

    xor a
    ld [$dc4b], a
    ret


jr_000_29f5:
    cp $33
    jr nz, jr_000_2a00

    ld e, a
    ld a, $0b
    call Call_000_3e64
    ld a, e

jr_000_2a00:
    ld e, a
    ld d, $00
    ld hl, $4b21
    add hl, de
    ld e, [hl]
    ld hl, $4a68
    add hl, de
    ld d, h
    ld e, l
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld a, [de]
    inc de
    ld [$ff8d], a
    ld b, a
    ld a, [$c2b5]
    add b

Jump_000_2a20:
    ld [$c2b5], a
    ld a, [$dbec]
    ld b, a
    ld a, [$dbeb]
    ld c, a

jr_000_2a2b:
    ld a, [de]
    inc de
    add b
    ld [hl+], a
    ld a, [de]
    inc de
    add c
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [$ff8d]
    dec a
    ld [$ff8d], a
    jr nz, jr_000_2a2b

    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a

jr_000_2a4a:
    ret


Jump_000_2a4b:
    ld a, [$dbe9]
    bit 7, a
    jr z, jr_000_2a59

    ld a, $0c
    call Call_000_3e64
    jr jr_000_2a5e

jr_000_2a59:
    ld a, $09
    call Call_000_3e64

jr_000_2a5e:
    ld a, [$dbe5]
    cp $6d
    jr nc, jr_000_2a6c

    ld a, $24
    ld hl, $4e6e
    jr jr_000_2ab3

jr_000_2a6c:
    cp $72
    jr nc, jr_000_2a77

    ld a, $20
    ld hl, $4e92
    jr jr_000_2ab3

jr_000_2a77:
    cp $77
    jr nc, jr_000_2a82

    ld a, $1c
    ld hl, $4eb2
    jr jr_000_2ab3

jr_000_2a82:
    cp $7c
    jr nc, jr_000_2a8d

    ld a, $18
    ld hl, $4ece
    jr jr_000_2ab3

jr_000_2a8d:
    cp $81
    jr nc, jr_000_2a98

    ld a, $14
    ld hl, $4ee6
    jr jr_000_2ab3

jr_000_2a98:
    cp $86
    jr nc, jr_000_2aa3

    ld a, $10
    ld hl, $4efa
    jr jr_000_2ab3

jr_000_2aa3:
    cp $8b
    jr nc, jr_000_2aae

    ld a, $0c
    ld hl, $4f0a
    jr jr_000_2ab3

jr_000_2aae:
    ld a, $08
    ld hl, $4f16

jr_000_2ab3:
    ld [$dbe1], a
    ld a, l
    ld [$dbe6], a
    ld a, h
    ld [$dbe7], a
    ret


Call_000_2abf:
    ld a, [$dbe1]
    dec a
    ld [$dbe1], a
    jp nz, Jump_000_2b81

    ld a, [$dbe3]
    ld c, a
    ld a, [$dbe5]
    call Call_000_2d28
    jp nz, Jump_000_2a4b

    ld a, [$dbe3]
    add $07
    ld c, a
    ld a, [$dbe5]
    call Call_000_2d28
    jp nz, Jump_000_2a4b

    ld a, [$dbe3]
    ld c, a
    ld a, [$dbe5]
    add $07
    call Call_000_2d28
    jp nz, Jump_000_2a4b

    ld a, [$dbe3]
    add $07
    ld c, a
    ld a, [$dbe5]
    add $07
    call Call_000_2d28
    jp nz, Jump_000_2a4b

    ld a, [$dbe9]
    bit 7, a
    jr z, jr_000_2b48

    ld a, $34
    ld [$dbea], a
    ld a, [$dbe3]
    ld [$dbeb], a
    ld c, a
    ld a, [$dbe5]
    ld [$dbec], a
    call Call_000_2d4d
    ld a, [$dbe3]
    add $07
    ld c, a
    ld a, [$dbe5]
    call Call_000_2d4d
    ld a, [$dbe3]
    ld c, a
    ld a, [$dbe5]
    add $07
    call Call_000_2d4d
    ld a, [$dbe3]
    add $07
    ld c, a
    ld a, [$dbe5]
    add $07
    call Call_000_2d4d
    ret


jr_000_2b48:
    ld a, [$dbe0]
    dec a
    ld [$dbe0], a
    ld a, [$dbe5]
    ld hl, $d77d
    ld a, [$d77c]
    or a
    jr z, jr_000_2b62

    ld de, $0007

jr_000_2b5e:
    add hl, de
    dec a
    jr nz, jr_000_2b5e

jr_000_2b62:
    ld a, [$dbe4]
    ld [hl+], a
    ld a, [$dbe5]
    ld [hl+], a
    ld a, [$dbe2]
    ld [hl+], a
    ld a, [$dbe3]
    ld [hl+], a
    ld a, [$dbe8]
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl], a
    ld a, [$d77c]
    inc a
    ld [$d77c], a
    ret


Jump_000_2b81:
    ld e, a
    ld d, $00
    ld a, [$dbe6]
    ld l, a
    ld a, [$dbe7]
    ld h, a
    add hl, de
    ld e, [hl]
    ld hl, $49c0
    ld a, [$dbe9]
    bit 7, a
    jr z, jr_000_2b9b

    ld hl, $4a14

jr_000_2b9b:
    add hl, de
    ld d, h
    ld e, l
    push de
    ld a, [$dbe8]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    ld de, $617f
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [$dbe2]
    ld [$dc39], a
    ld l, a
    ld a, [$dbe3]
    ld [$dc3a], a
    ld h, a
    add hl, bc
    ld a, l
    ld [$dbe2], a
    ld a, h
    ld [$dbe3], a
    ld a, [$dbe4]
    ld [$dc3b], a
    ld l, a
    ld a, [$dbe5]
    ld [$dc3c], a
    ld h, a
    add hl, de
    ld a, l
    ld [$dbe4], a
    ld a, h
    ld [$dbe5], a
    pop de
    xor a
    ld [$dc37], a
    ld [$dc38], a
    ld a, [de]
    inc de
    ld b, a
    ld a, [$dbe3]
    add b
    ld [$dbe3], a
    ld a, [de]
    inc de
    ld c, a
    ld a, [$dbe5]
    add c
    ld [$dbe5], a
    push bc
    ld a, [$dbe3]
    ld c, a
    ld a, [$dbe5]
    ld b, a
    ld a, [de]
    inc de
    add b
    call Call_000_2d01
    jr z, jr_000_2c20

    ld a, [$dbe8]
    ld l, a
    ld h, $00
    ld bc, $625f
    add hl, bc
    ld a, [hl]
    ld [$dbe8], a
    ld a, $01
    ld [$dc37], a

Call_000_2c20:
jr_000_2c20:
    ld a, [$dbe3]
    ld c, a
    ld a, [de]
    inc de
    add c
    ld c, a
    ld a, [$dbe5]
    ld b, a
    ld a, [de]
    inc de
    add b
    call Call_000_2d01
    jr z, jr_000_2c47

    ld a, [$dbe8]
    ld l, a

Call_000_2c38:
    ld h, $00
    ld bc, $623f
    add hl, bc
    ld a, [hl]
    ld [$dbe8], a
    ld a, $01
    ld [$dc37], a

jr_000_2c47:
    ld a, [$dbe3]
    ld c, a
    ld a, [de]
    inc de
    add c
    ld c, a
    ld a, [$dbe5]
    call Call_000_2d01
    jr z, jr_000_2c6a

    ld a, [$dbe8]
    ld l, a
    ld h, $00
    ld bc, $621f
    add hl, bc
    ld a, [hl]
    ld [$dbe8], a
    ld a, $01
    ld [$dc38], a

jr_000_2c6a:
    ld a, [$dbe3]
    ld c, a
    ld a, [de]
    inc de
    add c
    ld c, a
    ld a, [$dbe5]
    ld b, a
    ld a, [de]
    inc de
    add b
    call Call_000_2d01
    jr z, jr_000_2c91

    ld a, [$dbe8]
    ld l, a
    ld h, $00
    ld bc, $61ff
    add hl, bc
    ld a, [hl]
    ld [$dbe8], a
    ld a, $01

Call_000_2c8e:
    ld [$dc38], a

jr_000_2c91:
    pop bc
    ld a, [$dbe3]
    sub b
    ld [$dbe3], a
    ld a, [$dbe5]
    sub c
    ld [$dbe5], a
    ld a, [$dc37]
    or a
    jr z, jr_000_2cb2

    ld a, [$dc39]
    ld [$dbe2], a
    ld a, [$dc3a]
    ld [$dbe3], a

jr_000_2cb2:
    ld a, [$dc38]
    or a
    jr z, jr_000_2cc4

    ld a, [$dc3b]
    ld [$dbe4], a
    ld a, [$dc3c]
    ld [$dbe5], a

jr_000_2cc4:
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld a, [de]
    inc de
    ld [$ff8d], a
    ld b, a
    ld a, [$c2b5]
    add b
    ld [$c2b5], a
    ld a, [$dbe5]
    ld b, a
    ld a, [$dbe3]
    ld c, a

jr_000_2ce1:
    ld a, [de]
    inc de
    add b
    ld [hl+], a
    ld a, [de]
    inc de
    add c
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [$ff8d]
    dec a
    ld [$ff8d], a
    jr nz, jr_000_2ce1

    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ret


Call_000_2d01:
    push de
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, $ccba
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    pop de
    ret z

    cp $0f
    jr z, jr_000_2d1f

    xor a
    ret


jr_000_2d1f:
    ld a, $04
    call Call_000_3e64
    ld a, $01
    or a
    ret


Call_000_2d28:
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, $ccba
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    ret z

    cp $0e
    jr z, jr_000_2d44

    xor a
    ret


jr_000_2d44:
    ld a, $04
    call Call_000_3e64
    ld a, $01
    or a
    ret


Call_000_2d4d:
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, $ccba
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    ret z

    jp Jump_000_1a3a


Call_000_2d66:
    ld a, [$dc2f]
    or a
    call nz, Call_000_3097
    ld a, [$dc34]
    cp $05
    ret z

    ld a, [$dc2d]
    or a
    jr nz, jr_000_2dd6

    ld a, [$dc2c]
    ld b, a
    ld a, [$dc2b]
    inc a
    ld [$dc2b], a
    and b
    ret nz

    ld a, [$dc2a]
    dec a
    ld [$dc2a], a
    ret nz

    inc a
    ld [$dc2d], a
    ld a, [$dc2e]
    inc a
    ld [$dc2e], a
    and $07
    add a
    ld e, a
    ld d, $00
    ld hl, $5015
    add hl, de
    ld a, [hl+]
    ld [$dc2a], a
    ld a, [hl+]
    or a
    jr nz, jr_000_2db2

    ld de, $0080
    ld h, $e0
    jr jr_000_2db7

jr_000_2db2:
    ld de, $ff80
    ld h, $b0

jr_000_2db7:
    ld a, e
    ld [$dc28], a
    ld a, d
    ld [$dc29], a
    xor a
    ld [$dc25], a
    ld a, h
    ld [$dc26], a
    ld a, [$ff8c]
    cp $80
    jr c, jr_000_2dd0

    add $80

jr_000_2dd0:
    add $08
    ld [$dc33], a
    ret


jr_000_2dd6:
    ld a, [$dc25]
    ld l, a
    ld a, [$dc26]
    ld h, a
    ld a, [$dc28]
    ld e, a
    ld a, [$dc29]
    ld d, a
    add hl, de
    ld a, l
    ld [$dc25], a
    ld a, h
    ld [$dc26], a
    ld c, a
    ld a, [$dc33]
    cp c
    jr nz, jr_000_2e10

    add $0a
    ld [$dc30], a
    ld a, [$dc27]
    add $10
    ld [$dc31], a
    ld [$dc32], a
    ld a, $01
    ld [$dc2f], a
    ld a, $14
    call Call_000_3e64

jr_000_2e10:
    ld a, d
    or a
    ld a, c
    jr nz, jr_000_2e1c

    cp $b0
    jr nz, jr_000_2e24

    xor a
    jr jr_000_2e21

jr_000_2e1c:
    cp $e0
    jr nz, jr_000_2e24

    xor a

jr_000_2e21:
    ld [$dc2d], a

jr_000_2e24:
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld a, [$dc27]
    add $08
    ld b, a
    ld de, $4ff7
    ld a, $05
    ld [$ff8d], a

jr_000_2e3a:
    ld a, [de]
    inc de
    add b
    ld [hl+], a
    ld a, [de]
    inc de
    add c
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [$ff8d]
    dec a
    ld [$ff8d], a
    jr nz, jr_000_2e3a

    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ld a, [$c2b5]
    add $05
    ld [$c2b5], a
    ld a, [$dc3e]
    or a
    jr z, jr_000_2ebe

    ld a, [$dc4e]
    add $04
    ld c, a
    ld a, [$dc4f]
    ld b, a
    ld a, [$dc27]
    cp b
    jr nc, jr_000_2ebe

    add $0f
    cp b
    jr c, jr_000_2ebe

    ld a, [$dc26]
    cp c
    jr nc, jr_000_2ebe

    add $17
    cp c
    jr c, jr_000_2ebe

    xor a
    ld [$dc2d], a
    ld a, [$dc47]
    or a
    jr nz, jr_000_2eb6

    xor a
    ld [$dc3e], a
    ld a, [$dc3f]
    or a
    jr nz, jr_000_2eb6

    ld a, [$dc40]
    or a
    jr nz, jr_000_2eb6

    ld a, [$dc41]
    or a
    jr nz, jr_000_2eb6

    ld a, [$dc42]
    or a
    jr nz, jr_000_2eb6

    ld a, [$dc43]
    or a
    jr nz, jr_000_2eb6

    ld [$dc44], a

jr_000_2eb6:
    ld a, $15
    call Call_000_3e64
    call Call_000_306f

jr_000_2ebe:
    ld a, [$dc3f]
    or a
    jr z, jr_000_2f1b

    ld a, [$dc52]
    add $04
    ld c, a
    ld a, [$dc53]
    ld b, a
    ld a, [$dc27]
    cp b
    jr nc, jr_000_2f1b

    add $0f
    cp b
    jr c, jr_000_2f1b

    ld a, [$dc26]
    cp c
    jr nc, jr_000_2f1b

    add $17
    cp c
    jr c, jr_000_2f1b

    xor a
    ld [$dc2d], a
    ld a, [$dc47]
    or a
    jr nz, jr_000_2f13

    xor a
    ld [$dc3f], a
    ld a, [$dc3e]
    or a
    jr nz, jr_000_2f13

    ld a, [$dc40]
    or a
    jr nz, jr_000_2f13

    ld a, [$dc41]
    or a
    jr nz, jr_000_2f13

    ld a, [$dc42]
    or a
    jr nz, jr_000_2f13

    ld a, [$dc43]
    or a
    jr nz, jr_000_2f13

    ld [$dc44], a

jr_000_2f13:
    ld a, $15
    call Call_000_3e64
    call Call_000_306f

jr_000_2f1b:
    ld a, [$dc40]
    or a
    jr z, jr_000_2f71

    ld a, [$dc56]
    add $04
    ld c, a
    ld a, [$dc57]
    ld b, a
    ld a, [$dc27]
    cp b
    jr nc, jr_000_2f71

    add $0f
    cp b
    jr c, jr_000_2f71

    ld a, [$dc26]
    cp c
    jr nc, jr_000_2f71

    add $17
    cp c
    jr c, jr_000_2f71

    xor a
    ld [$dc2d], a
    ld [$dc40], a
    ld a, [$dc3e]
    or a
    jr nz, jr_000_2f69

    ld a, [$dc3f]
    or a
    jr nz, jr_000_2f69

    ld a, [$dc41]
    or a
    jr nz, jr_000_2f69

    ld a, [$dc42]
    or a
    jr nz, jr_000_2f69

    ld a, [$dc43]
    or a
    jr nz, jr_000_2f69

    ld [$dc44], a

jr_000_2f69:
    ld a, $15
    call Call_000_3e64
    call Call_000_306f

jr_000_2f71:
    ld a, [$dc41]
    or a
    jr z, jr_000_2fc7

    ld a, [$dc5a]
    add $04
    ld c, a
    ld a, [$dc5b]
    ld b, a
    ld a, [$dc27]
    cp b
    jr nc, jr_000_2fc7

    add $0f
    cp b
    jr c, jr_000_2fc7

    ld a, [$dc26]
    cp c
    jr nc, jr_000_2fc7

    add $17
    cp c
    jr c, jr_000_2fc7

    xor a
    ld [$dc2d], a
    ld [$dc41], a
    ld a, [$dc3e]
    or a
    jr nz, jr_000_2fbf

    ld a, [$dc3f]
    or a
    jr nz, jr_000_2fbf

    ld a, [$dc40]
    or a
    jr nz, jr_000_2fbf

    ld a, [$dc42]
    or a
    jr nz, jr_000_2fbf

    ld a, [$dc43]
    or a
    jr nz, jr_000_2fbf

    ld [$dc44], a

jr_000_2fbf:
    ld a, $15
    call Call_000_3e64
    call Call_000_306f

jr_000_2fc7:
    ld a, [$dc42]
    or a
    jr z, jr_000_301d

    ld a, [$dc5d]
    add $04
    ld c, a
    ld a, [$dc5e]
    ld b, a
    ld a, [$dc27]
    cp b
    jr nc, jr_000_301d

    add $0f
    cp b
    jr c, jr_000_301d

    ld a, [$dc26]
    cp c
    jr nc, jr_000_301d

    add $17
    cp c
    jr c, jr_000_301d

    xor a
    ld [$dc2d], a
    ld [$dc42], a
    ld a, [$dc3e]
    or a
    jr nz, jr_000_3015

    ld a, [$dc3f]
    or a
    jr nz, jr_000_3015

    ld a, [$dc40]
    or a
    jr nz, jr_000_3015

    ld a, [$dc41]
    or a
    jr nz, jr_000_3015

    ld a, [$dc43]
    or a
    jr nz, jr_000_3015

    ld [$dc44], a

jr_000_3015:
    ld a, $15
    call Call_000_3e64
    call Call_000_306f

jr_000_301d:
    ld a, [$dc43]
    or a
    ret z

    ld a, [$dc60]
    add $04
    ld c, a
    ld a, [$dc61]
    ld b, a
    ld a, [$dc27]
    cp b

Jump_000_3030:
    ret nc

    add $0f
    cp b
    ret c

    ld a, [$dc26]
    cp c
    ret nc

    add $17
    cp c
    ret c

    xor a
    ld [$dc2d], a
    ld [$dc43], a
    ld a, [$dc3e]
    or a
    jr nz, jr_000_3066

    ld a, [$dc3f]
    or a
    jr nz, jr_000_3066

    ld a, [$dc40]
    or a
    jr nz, jr_000_3066

    ld a, [$dc41]
    or a
    jr nz, jr_000_3066

    ld a, [$dc42]

Call_000_3060:
    or a
    jr nz, jr_000_3066

    ld [$dc44], a

jr_000_3066:
    ld a, $15
    call Call_000_3e64
    call Call_000_306f
    ret


Call_000_306f:
    ld hl, $5009
    ld a, [$dc34]
    inc a
    ld [$dc34], a
    add a
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [$dc27]
    add $04
    ld d, a
    ld a, [$dc26]
    add $04
    ld b, a
    ld a, [hl+]
    push hl
    ld e, $01
    call $634d
    pop hl
    ld b, [hl]
    call $7c39
    ret


Call_000_3097:
    ld d, $00
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld a, [$dc2f]
    inc a
    ld [$dc2f], a
    cp $05
    jr nc, jr_000_30bd

    inc d
    ld a, [$dc32]
    ld [hl+], a
    ld a, [$dc30]
    ld [hl+], a
    ld a, $55
    ld [hl+], a
    ld a, $44
    ld [hl+], a
    jr jr_000_30e7

jr_000_30bd:
    ld a, [$dc31]
    inc a
    ld [$dc31], a
    cp $a8
    jr c, jr_000_30cc

    xor a
    ld [$dc2f], a

jr_000_30cc:
    ld b, a
    sub $08
    ld [hl+], a
    ld a, [$dc30]
    ld [hl+], a
    ld c, a
    ld a, $54
    ld [hl+], a
    ld a, $04
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, $51
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    inc d
    inc d

jr_000_30e7:
    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ld a, [$c2b5]
    add d
    ld [$c2b5], a
    ld a, [$d76b]
    or a
    ret nz

    ld a, [$dc30]
    add $04
    ld c, a
    ld a, [$dc31]
    add $08
    ld b, a
    ld a, [$c200]
    sub $08
    cp b
    ret nc

    add $04
    cp b
    ret c

    ld a, [$c201]
    sub $08
    cp c
    ret nc

    ld e, a
    ld a, [$d764]
    add e
    cp c
    ret c

    ld a, [$ffa0]
    or a
    ret nz

    ld a, $28
    ld [$d76b], a
    ld a, [$c200]
    sub $08
    ld [$d76c], a
    ld b, $f8
    ld a, [$d764]
    cp $20
    jr z, jr_000_313d

    ld b, $fc

jr_000_313d:
    ld a, [$c201]
    add b
    ld [$d76d], a
    xor a
    ld [$dc3d], a
    xor a
    ld [$dc2f], a
    ld a, $0a
    call Call_000_3e64
    ld a, [$d8ac]
    dec a
    ld [$d8ac], a
    or a
    jr nz, jr_000_3166

    ld a, $03
    ld [$ff9f], a
    ld a, $28
    ld [$ffa0], a
    ret


jr_000_3166:
    ld a, $01
    ld [$ffa2], a
    ret


Call_000_316c:
    ld a, [$dc2d]
    or a
    ret z

    ld a, [$dc27]
    cp b
    jr nc, jr_000_3199

    add $0f
    cp b
    jr c, jr_000_3199

    ld a, [$dc26]
    cp c
    jr nc, jr_000_3199

    add $17
    cp c
    jr c, jr_000_3199

    xor a
    ld [$dc2d], a
    push bc
    call Call_000_306f
    pop bc
    ld a, $15
    call Call_000_3e64
    ld a, $01
    or a
    ret


jr_000_3199:
    xor a
    ret


Call_000_319b:
    ld a, [$dc23]
    or a
    ret z

    ld a, [$d76e]
    or a
    ret nz

    ld a, [$dc20]
    or a
    ret nz

    ld a, [$dc24]
    or a
    ret nz

    ld a, [$dc12]
    cp b
    jr nc, jr_000_31d8

    add $0f
    cp b
    jr c, jr_000_31d8

    ld a, [$dc14]
    cp c
    jr nc, jr_000_31d8

    add $0f
    cp c
    jr c, jr_000_31d8

    xor a
    ld [$dc17], a
    ld [$dc18], a
    inc a
    ld [$dc24], a
    ld [$d8aa], a
    ld a, $0d
    call Call_000_3e64

jr_000_31d8:
    xor a
    ret


Call_000_31da:
    xor a
    ld [$dc3d], a
    ld [$dc3e], a
    ld [$dc3f], a
    ld [$dc40], a
    ld [$dc41], a
    ld [$dc42], a
    ld [$dc43], a
    ld [$dc44], a
    ld [$dc46], a
    ld [$dc47], a
    ld [$dc4c], a
    ld [$dc48], a
    ld [$dc4b], a
    ld [$dc49], a
    ld [$dc4a], a
    ld [$dc4d], a
    ret


Call_000_320c:
    ld a, [$dc3e]
    or a
    jp nz, Jump_000_3479

Jump_000_3213:
    ld a, [$dc3f]
    or a
    jp nz, Jump_000_356b

Jump_000_321a:
    ld a, [$dc40]
    or a
    jp nz, Jump_000_365d

Jump_000_3221:
    ld a, [$dc41]
    or a
    jp nz, Jump_000_3725

Jump_000_3228:
    ld a, [$dc42]
    or a
    jp nz, Jump_000_37e1

Jump_000_322f:
    ld a, [$dc43]
    or a
    jp nz, Jump_000_389d

Jump_000_3236:
    ld a, [$dc3d]
    or a
    ret z

    ld a, [$dc48]
    ld b, a
    or a
    jp z, Jump_000_32da

    ld a, [$dc4b]
    or a
    ret nz

    ld a, [$ff8a]
    bit 4, a
    jr z, jr_000_326b

    ld de, $0020
    ld a, [$dc49]
    ld l, a
    ld a, [$dc4a]
    ld h, a
    add hl, de
    ld a, l
    ld [$dc49], a
    ld a, h
    ld [$dc4a], a
    cp $0b
    ret nz

    dec a
    ld [$dc4a], a
    ret


jr_000_326b:
    ld a, [$dc49]
    ld c, a
    ld a, [$dc4a]
    add c
    or a
    ret z

    ld a, b
    dec a
    ld [$dc48], a
    jr nz, jr_000_327f

    ld [$dc3d], a

jr_000_327f:
    push af
    ld a, [$df2d]
    ld l, a
    ld a, [$df2e]
    ld h, a
    pop af
    and $07
    add a
    ld e, a
    ld d, $00
    add hl, de
    ld a, $04
    ld [$dc4b], a
    call Call_000_0006
    ld a, [$c201]
    add $04
    ld b, a
    ld a, [$c200]
    sub $0c
    ld c, a
    ld l, $00
    ld a, [$ff8a]
    bit 0, a
    jr z, jr_000_32af

    ld l, $1e

jr_000_32af:
    bit 1, a
    jr z, jr_000_32b5

    ld l, $02

jr_000_32b5:
    ld h, $80
    push hl
    ld a, [$dc4a]
    add a
    add a
    ld l, a
    ld h, $00
    ld de, $5812
    add hl, de
    xor a
    ld [$dc49], a
    ld [$dc4a], a
    ld a, [hl+]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    pop hl
    call Call_000_295a
    ld a, $10
    call Call_000_3e64
    ret


Jump_000_32da:
    ld a, [$dc46]
    or a
    jr nz, jr_000_3324

    ld a, [$ff8a]
    bit 4, a
    ret z

    ld a, [$dc3e]
    or a
    ret nz

    ld a, [$dc3f]
    or a
    ret nz

    ld a, $02
    ld [$dc47], a
    xor a
    ld [$dc3d], a
    ld a, [$c201]
    sub $0c
    add $08
    ld [$dc4e], a
    add $10
    ld [$dc52], a
    ld a, $88
    ld [$dc4f], a
    ld [$dc50], a
    ld [$dc53], a
    ld [$dc54], a
    ld a, $01
    ld [$dc3e], a
    ld [$dc3f], a
    ld a, $11
    call Call_000_3e64
    ret


jr_000_3324:
    ld a, [$dc44]
    or a
    jr z, jr_000_332f

    dec a
    ld [$dc44], a
    ret


jr_000_332f:
    ld a, [$ff8a]
    bit 4, a
    jr nz, jr_000_333b

    xor a
    ld [$dc4d], a
    ret


jr_000_333b:
    ld a, [$dc4d]
    or a
    ret nz

    ld a, [$dc3e]
    or a
    jr nz, jr_000_337b

    ld [$dc51], a
    ld b, $12
    ld a, [$dc4c]
    or a
    jr z, jr_000_3356

    ld [$dc51], a
    ld b, $13

jr_000_3356:
    ld a, b
    call Call_000_3e64
    ld a, [$dc45]
    ld [$dc4d], a
    ld [$dc44], a
    ld a, [$c201]
    sub $0c
    add $10
    ld [$dc4e], a
    ld a, $88
    ld [$dc4f], a
    ld [$dc50], a
    ld a, $01
    ld [$dc3e], a
    ret


jr_000_337b:
    ld a, [$dc3f]
    or a
    jr nz, jr_000_33b6

    ld [$dc55], a
    ld b, $12
    ld a, [$dc4c]
    or a
    jr z, jr_000_3391

    ld [$dc55], a
    ld b, $13

jr_000_3391:
    ld a, b
    call Call_000_3e64
    ld a, [$dc45]
    ld [$dc4d], a
    ld [$dc44], a
    ld a, [$c201]
    sub $0c
    add $10
    ld [$dc52], a
    ld a, $88
    ld [$dc53], a
    ld [$dc54], a
    ld a, $01
    ld [$dc3f], a
    ret


jr_000_33b6:
    ld a, [$dc40]
    or a
    jr nz, jr_000_33f1

    ld [$dc59], a
    ld b, $12
    ld a, [$dc4c]
    or a
    jr z, jr_000_33cc

    ld [$dc59], a
    ld b, $13

jr_000_33cc:
    ld a, b
    call Call_000_3e64
    ld a, [$dc45]
    ld [$dc4d], a
    ld [$dc44], a
    ld a, [$c201]
    sub $0c
    add $10
    ld [$dc56], a
    ld a, $88
    ld [$dc57], a
    ld [$dc58], a
    ld a, $01
    ld [$dc40], a
    ret


jr_000_33f1:
    ld a, [$dc4c]
    or a
    ret z

    ld a, [$dc41]
    or a
    jr nz, jr_000_3422

    ld a, $13
    call Call_000_3e64
    ld a, [$dc45]
    ld [$dc4d], a
    ld [$dc44], a
    ld a, [$c201]
    sub $0c
    add $10
    ld [$dc5a], a
    ld a, $88
    ld [$dc5b], a
    ld [$dc5c], a
    ld a, $01
    ld [$dc41], a
    ret


jr_000_3422:
    ld a, [$dc42]
    or a
    jr nz, jr_000_344e

    ld a, $13
    call Call_000_3e64
    ld a, [$dc45]
    ld [$dc4d], a
    ld [$dc44], a
    ld a, [$c201]
    sub $0c
    add $10
    ld [$dc5d], a
    ld a, $88
    ld [$dc5e], a
    ld [$dc5f], a
    ld a, $01
    ld [$dc42], a
    ret


jr_000_344e:
    ld a, [$dc43]
    or a
    ret nz

    ld a, $13
    call Call_000_3e64
    ld a, [$dc45]
    ld [$dc4d], a
    ld [$dc44], a
    ld a, [$c201]
    sub $0c
    add $10
    ld [$dc60], a
    ld a, $88
    ld [$dc61], a
    ld [$dc62], a
    ld a, $01
    ld [$dc43], a
    ret


Jump_000_3479:
    ld d, $00
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld e, $01
    ld a, [$dc47]
    cp $02
    jr z, jr_000_349c

    ld bc, $5468
    ld a, [$dc51]
    or a
    jr z, jr_000_34a5

    ld bc, $5474
    ld e, $02
    jr jr_000_34a5

jr_000_349c:
    ld bc, $546e
    ld a, [$dc4e]
    ld [$d8bb], a

jr_000_34a5:
    ld a, [$dc3e]
    inc a
    ld [$dc3e], a
    cp $05
    jr nc, jr_000_34c1

    inc d
    ld a, [$dc50]
    ld [hl+], a
    ld a, [$dc4e]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    jr jr_000_34ea

jr_000_34c1:
    inc bc
    inc bc
    ld a, [$dc4f]
    sub e
    ld [$dc4f], a
    cp $18
    jr z, jr_000_352e

    ld [hl+], a
    ld a, [$dc4e]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [$dc4f]
    add $08
    ld [hl+], a
    ld a, [$dc4e]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    inc d
    inc d

jr_000_34ea:
    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ld a, [$c2b5]
    add d
    ld [$c2b5], a
    ld a, [$dc4e]
    add $04
    ld c, a
    ld a, [$dc4f]
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, $ccba
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_3213

    cp $0f
    jp z, Jump_000_3213

    cp $0e
    jr z, jr_000_352e

    call Call_000_1a0b
    ld a, [$dc47]
    cp $02
    jp z, Jump_000_3213

jr_000_352e:
    ld a, [$dc47]
    or a
    jr z, jr_000_353e

    ld a, [$dc3f]
    or a
    jr nz, jr_000_353e

    xor a
    ld [$dc47], a

jr_000_353e:
    xor a
    ld [$dc3e], a
    ld a, [$dc3f]
    or a
    jp nz, Jump_000_3213

    ld a, [$dc40]
    or a
    jp nz, Jump_000_3213

    ld a, [$dc41]
    or a
    jp nz, Jump_000_3213

    ld a, [$dc42]
    or a
    jp nz, Jump_000_3213

    ld a, [$dc43]
    or a
    jp nz, Jump_000_3213

    ld [$dc44], a
    jp Jump_000_3213


Jump_000_356b:
    ld d, $00
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld e, $01
    ld a, [$dc47]
    cp $02
    jr z, jr_000_358e

    ld bc, $5468
    ld a, [$dc55]
    or a
    jr z, jr_000_3597

    ld bc, $5474
    ld e, $02
    jr jr_000_3597

jr_000_358e:
    ld bc, $546e
    ld a, [$dc52]
    ld [$d8bb], a

jr_000_3597:
    ld a, [$dc3f]
    inc a
    ld [$dc3f], a
    cp $05
    jr nc, jr_000_35b3

    inc d
    ld a, [$dc54]
    ld [hl+], a
    ld a, [$dc52]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    jr jr_000_35dc

jr_000_35b3:
    inc bc
    inc bc
    ld a, [$dc53]
    sub e
    ld [$dc53], a
    cp $18
    jr z, jr_000_3620

    ld [hl+], a
    ld a, [$dc52]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [$dc53]
    add $08
    ld [hl+], a
    ld a, [$dc52]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    inc d
    inc d

jr_000_35dc:
    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ld a, [$c2b5]
    add d
    ld [$c2b5], a
    ld a, [$dc52]
    add $04
    ld c, a
    ld a, [$dc53]
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, $ccba
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_321a

    cp $0f
    jp z, Jump_000_321a

    cp $0e
    jr z, jr_000_3620

    call Call_000_1a0b
    ld a, [$dc47]
    cp $02
    jp z, Jump_000_321a

jr_000_3620:
    ld a, [$dc47]
    or a
    jr z, jr_000_3630

    ld a, [$dc3e]
    or a
    jr nz, jr_000_3630

    xor a
    ld [$dc47], a

jr_000_3630:
    xor a
    ld [$dc3f], a
    ld a, [$dc3e]
    or a
    jp nz, Jump_000_321a

    ld a, [$dc40]
    or a
    jp nz, Jump_000_321a

    ld a, [$dc41]
    or a
    jp nz, Jump_000_321a

    ld a, [$dc42]
    or a
    jp nz, Jump_000_321a

    ld a, [$dc43]
    or a
    jp nz, Jump_000_321a

    ld [$dc44], a
    jp Jump_000_321a


Jump_000_365d:
    ld d, $00
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld bc, $5468
    ld e, $01
    ld a, [$dc59]
    or a
    jr z, jr_000_3677

    ld bc, $5474
    ld e, $02

jr_000_3677:
    ld a, [$dc40]
    inc a
    ld [$dc40], a
    cp $05
    jr nc, jr_000_3693

    inc d
    ld a, [$dc58]
    ld [hl+], a
    ld a, [$dc56]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    jr jr_000_36bc

jr_000_3693:
    inc bc
    inc bc
    ld a, [$dc57]
    sub e
    ld [$dc57], a
    cp $18
    jr z, jr_000_36f8

    ld [hl+], a
    ld a, [$dc56]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [$dc57]
    add $08
    ld [hl+], a
    ld a, [$dc56]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    inc d
    inc d

jr_000_36bc:
    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ld a, [$c2b5]
    add d
    ld [$c2b5], a
    ld a, [$dc56]
    add $04
    ld c, a
    ld a, [$dc57]
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, $ccba
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_3221

    cp $0f
    jp z, Jump_000_3221

    cp $0e
    jr z, jr_000_36f8

    call Call_000_1a3a

jr_000_36f8:
    xor a
    ld [$dc40], a
    ld a, [$dc3e]
    or a
    jp nz, Jump_000_3221

    ld a, [$dc3f]
    or a
    jp nz, Jump_000_3221

    ld a, [$dc41]
    or a
    jp nz, Jump_000_3221

    ld a, [$dc42]
    or a
    jp nz, Jump_000_3221

    ld a, [$dc43]
    or a
    jp nz, Jump_000_3221

    ld [$dc44], a
    jp Jump_000_3221


Jump_000_3725:
    ld d, $00
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld bc, $5474
    ld a, [$dc41]
    inc a
    ld [$dc41], a
    cp $05
    jr nc, jr_000_374e

    inc d
    ld a, [$dc5c]
    ld [hl+], a
    ld a, [$dc5a]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    jr jr_000_3778

jr_000_374e:
    inc bc
    inc bc
    ld a, [$dc5b]
    sub $02
    ld [$dc5b], a
    cp $18
    jr z, jr_000_37b4

    ld [hl+], a
    ld a, [$dc5a]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [$dc5b]
    add $08
    ld [hl+], a
    ld a, [$dc5a]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    inc d
    inc d

jr_000_3778:
    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ld a, [$c2b5]
    add d
    ld [$c2b5], a
    ld a, [$dc5a]
    add $04
    ld c, a
    ld a, [$dc5b]
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, $ccba
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_3228

    cp $0f
    jp z, Jump_000_3228

    cp $0e
    jr z, jr_000_37b4

    call Call_000_1a3a

jr_000_37b4:
    xor a
    ld [$dc41], a
    ld a, [$dc3e]
    or a
    jp nz, Jump_000_3228

    ld a, [$dc3f]
    or a
    jp nz, Jump_000_3228

    ld a, [$dc40]
    or a
    jp nz, Jump_000_3228

    ld a, [$dc42]
    or a
    jp nz, Jump_000_3228

    ld a, [$dc43]
    or a
    jp nz, Jump_000_3228

    ld [$dc44], a
    jp Jump_000_3228


Jump_000_37e1:
    ld d, $00
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld bc, $5474
    ld a, [$dc42]
    inc a
    ld [$dc42], a
    cp $05
    jr nc, jr_000_380a

    inc d
    ld a, [$dc5f]
    ld [hl+], a
    ld a, [$dc5d]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    jr jr_000_3834

jr_000_380a:
    inc bc
    inc bc
    ld a, [$dc5e]
    sub $02
    ld [$dc5e], a
    cp $18
    jr z, jr_000_3870

    ld [hl+], a
    ld a, [$dc5d]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [$dc5e]
    add $08
    ld [hl+], a
    ld a, [$dc5d]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    inc d
    inc d

jr_000_3834:
    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ld a, [$c2b5]
    add d
    ld [$c2b5], a
    ld a, [$dc5d]
    add $04
    ld c, a
    ld a, [$dc5e]
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, $ccba
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_322f

    cp $0f
    jp z, Jump_000_322f

    cp $0e
    jr z, jr_000_3870

    call Call_000_1a3a

jr_000_3870:
    xor a
    ld [$dc42], a
    ld a, [$dc3e]
    or a
    jp nz, Jump_000_322f

    ld a, [$dc3f]
    or a
    jp nz, Jump_000_322f

    ld a, [$dc40]
    or a
    jp nz, Jump_000_322f

    ld a, [$dc41]
    or a
    jp nz, Jump_000_322f

    ld a, [$dc43]
    or a
    jp nz, Jump_000_322f

    ld [$dc44], a
    jp Jump_000_3228


Jump_000_389d:
    ld d, $00
    ld a, [$c2b6]
    ld l, a
    ld a, [$c2b7]
    ld h, a
    ld bc, $5474
    ld a, [$dc43]
    inc a
    ld [$dc43], a
    cp $05
    jr nc, jr_000_38c6

    inc d
    ld a, [$dc62]
    ld [hl+], a
    ld a, [$dc60]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    jr jr_000_38f0

jr_000_38c6:
    inc bc
    inc bc
    ld a, [$dc61]
    sub $02
    ld [$dc61], a
    cp $18
    jr z, jr_000_392c

    ld [hl+], a
    ld a, [$dc60]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [$dc61]
    add $08
    ld [hl+], a
    ld a, [$dc60]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    inc d
    inc d

jr_000_38f0:
    ld a, l
    ld [$c2b6], a
    ld a, h
    ld [$c2b7], a
    ld a, [$c2b5]
    add d
    ld [$c2b5], a
    ld a, [$dc60]
    add $04
    ld c, a
    ld a, [$dc61]
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    ld de, $ccba
    add hl, de
    ld a, c
    and $f0
    swap a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_3236

    cp $0f
    jp z, Jump_000_3236

    cp $0e
    jr z, jr_000_392c

    call Call_000_1a3a

jr_000_392c:
    xor a
    ld [$dc43], a
    ld a, [$dc3e]
    or a
    jp nz, Jump_000_3236

    ld a, [$dc3f]
    or a
    jp nz, Jump_000_3236

    ld a, [$dc40]
    or a
    jp nz, Jump_000_3236

    ld a, [$dc41]
    or a
    jp nz, Jump_000_3236

    ld a, [$dc42]
    or a
    jp nz, Jump_000_3236

    ld [$dc44], a
    jp Jump_000_3228


    ld hl, $02b3
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    xor a
    ld [$ff9c], a
    ld a, $01
    ld [$ff9a], a
    xor a
    ld [$dae1], a
    ldh [rSCX], a
    ld de, $4230
    call Call_000_0061
    ld a, $0e
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    ld hl, $48c1
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $50c1
    ld de, $8800
    ld bc, $0340
    call DataTransfer
    xor a
    ld de, $9c00
    ld hl, $62f9
    ld b, $14
    ld c, $12
    call Call_000_01d4
    xor a
    ldh [rVBK], a
    ld hl, $5401
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $5c01
    ld de, $8800
    ld bc, $0590
    call DataTransfer
    xor a
    ld de, $9c00
    ld hl, $6191
    ld b, $14
    ld c, $12
    call Call_000_01d4
    ld a, [$df4c]
    ld l, a
    ld a, [$df4d]
    ld h, a
    call Call_000_0e54
    ld a, $01
    call ChangeROMBank
    ld a, [$db51]
    or a
    jr z, jr_000_39ec

    ld a, $09
    ld [$d8ac], a

jr_000_39ec:
    ret


    ld a, $46
    ld [$ff91], a
    ld hl, $02b3
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    xor a
    ld [$ff9c], a
    ld a, $01
    ld [$ff9a], a
    xor a
    ldh [rSCX], a
    ld de, $42b0
    call Call_000_0061
    ld a, $02
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, $7df4
    ld b, $14
    ld c, $12
    call Call_000_01d4
    xor a
    ldh [rVBK], a
    ld hl, $739c
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $7b9c
    ld de, $8800
    ld bc, $00f0
    call DataTransfer
    xor a
    ld [$dae1], a
    ld de, $9800
    ld hl, $7c8c
    ld b, $14
    ld c, $12
    call Call_000_01d4
    ld a, $01
    call ChangeROMBank
    ld a, $00
    ld [$db51], a
    ld a, $00
    ld [$db52], a
    ld a, $00
    ld [$db53], a
    ld a, $00
    ld [$db54], a
    ret


    ld a, $46
    ld [$ff91], a
    ld hl, $02b3
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    ld a, $01
    ld [$ff9c], a
    ld [$ff9b], a
    ld a, $01
    ld [$ff9a], a
    xor a
    ldh [rSCX], a
    ld de, $4330
    call Call_000_0061
    ld a, $03
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, $5418
    ld b, $14
    ld c, $12
    call Call_000_01d4
    xor a
    ldh [rVBK], a
    ld hl, $4a20
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $5220
    ld de, $8800
    ld bc, $0090
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, $52b0
    ld b, $14
    ld c, $12
    call Call_000_01d4
    ld a, $01
    call ChangeROMBank
    ret


    ld a, [$ff91]
    or a
    jr z, jr_000_3ae3

    dec a
    ld [$ff91], a
    ret


jr_000_3ae3:
    ld a, $06
    ld [$ff9f], a
    ld a, $01
    ld [$ffa0], a
    ret


    ld e, $09
    call Call_000_3e51
    ld hl, $05a9
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    xor a
    ld [$ff9b], a
    ld a, $03
    ld [$ff9a], a
    ld a, $80
    ld [$c958], a
    xor a
    ld [$dae1], a
    ld a, $02
    ld [$ff9c], a
    ld hl, $9800
    call Call_000_01b9
    ld a, $05
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ldh [rVBK], a
    ld hl, $650c
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $6d0c
    ld de, $8800
    ld bc, $0500
    call DataTransfer
    call Call_000_3b50
    ld a, $01
    call ChangeROMBank
    xor a
    ld [$dcf4], a
    dec a
    ld [$dcf5], a
    ret


Call_000_3b50:
    ld hl, $4a84
    ld a, [$defc]
    or a
    jr z, jr_000_3b6e

    ld hl, $7385
    dec a
    jr z, jr_000_3b6e

    ld hl, $5471
    dec a
    jr z, jr_000_3b6e

    ld hl, $5ebb
    dec a
    jr z, jr_000_3b6e

    ld hl, $6922

jr_000_3b6e:
    ld a, l
    ld [$dcfa], a
    ld [$dcf8], a
    ld a, h
    ld [$dcfb], a
    ld [$dcf9], a
    xor a
    ld [$dcf7], a
    ld a, $9a
    ld [$dcfd], a
    ld a, $60
    ld [$dcfc], a
    ret


Call_000_3b8b:
    ld a, [$dcf5]
    inc a
    ret z

    ld a, $ff
    ld [$dcf5], a
    ld a, [$dcf7]
    ldh [rSCY], a
    and $07
    jr nz, jr_000_3bfe

    ld a, [$dcfc]
    ld e, a
    ld a, [$dcfd]
    ld d, a
    ld a, $0f
    ld [ROM_BANK], a
    ld a, [$dcfa]
    ld l, a
    ld a, [$dcfb]
    ld h, a
    ld a, [hl+]
    or a
    jp z, Jump_000_3c1b

    inc a
    jr z, jr_000_3c04

    dec a
    ld b, $14

jr_000_3bbe:
    sub $20
    jr c, jr_000_3bfa

    jr z, jr_000_3bcc

    sub $0f
    cp $12
    jr c, jr_000_3bcc

    sub $07

jr_000_3bcc:
    ld [de], a
    inc de
    ld a, [hl+]
    dec b
    jr nz, jr_000_3bbe

    ld [$dcf4], a
    ld a, l
    ld [$dcfa], a
    ld a, h
    ld [$dcfb], a

Jump_000_3bdd:
    ld a, [$dcfc]
    add $20
    ld [$dcfc], a
    jr nc, jr_000_3bf4

    ld a, [$dcfd]
    inc a
    cp $9c
    jr nz, jr_000_3bf1

    ld a, $98

jr_000_3bf1:
    ld [$dcfd], a

jr_000_3bf4:
    ld a, $01
    ld [ROM_BANK], a
    ret


jr_000_3bfa:
    add $e4
    jr jr_000_3bcc

jr_000_3bfe:
    ld a, $fe

Jump_000_3c00:
    ld [$dcf4], a
    ret


jr_000_3c04:
    ld a, $01
    ld [$ff9f], a
    ld a, $28
    ld [$ffa0], a
    ld a, $1a
    call Call_000_3e64
    ld a, [$dcf8]
    ld l, a
    ld a, [$dcf9]
    ld h, a

Jump_000_3c1b:
    ld a, l
    ld [$dcfa], a
    ld a, h
    ld [$dcfb], a
    ld h, d
    ld l, e
    ld b, $14
    xor a

jr_000_3c28:
    ld [hl+], a
    dec b
    jr nz, jr_000_3c28

    ld a, $fe
    ld [$dcf4], a
    jp Jump_000_3bdd


Call_000_3c34:
    ld a, [$db55]
    inc a
    cp $03
    jr nz, jr_000_3c3d

    xor a

jr_000_3c3d:
    ld [$db55], a
    xor a
    ld [$dcfe], a
    ret


    ld a, $00
    ld [$c359], a
    ld hl, $02b3
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    ld hl, $0298
    ld a, l
    ld [$ff98], a
    ld a, h
    ld [$ff99], a
    ld a, $1c
    ld [$ff9b], a
    xor a
    ld [$ff9c], a
    ld a, $01
    ld [$ff9a], a
    ld de, $4430
    call Call_000_0061
    ld a, $0c
    call ChangeROMBank
    xor a
    ld [$defb], a
    ld a, $01
    ld [$dd00], a
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, $577c
    ld b, $14
    ld c, $12
    call Call_000_01d4
    xor a
    ld [$dae1], a
    ldh [rVBK], a
    ld hl, $4de4
    ld de, $9000
    ld bc, $0790
    call DataTransfer
    ld hl, $5584
    ld de, $8b40
    ld bc, $0090
    call DataTransfer
    ld hl, $5574
    ld de, $8000
    ld bc, $0010
    call DataTransfer
    ld a, $26
    ld de, $9800
    ld hl, $5614
    ld b, $14
    ld c, $12
    call Call_000_01d4
    ld hl, $4ca8
    ld de, $dd03
    ld bc, $0006
    call DataTransfer
    ld a, [$df33]

Call_000_3cda:
    ld l, a
    ld a, [$df34]
    ld h, a
    ld de, $dd0b
    ld bc, $003e
    call DataTransfer
    ld a, $01
    call ChangeROMBank
    ld hl, $6784
    ld a, l
    ld [$dd09], a
    ld a, h
    ld [$dd0a], a
    call Call_000_0dde
    ld hl, $dd17
    ld a, [$defc]
    cp $04
    jr nz, jr_000_3d12

    ld a, [$d73c]
    ld [hl+], a
    ld a, [$d73d]
    ld [hl+], a
    ld a, [$d73e]
    jr jr_000_3d1d

jr_000_3d12:
    ld a, [$d73b]
    ld [hl+], a
    ld a, [$d73c]
    ld [hl+], a
    ld a, [$d73d]

jr_000_3d1d:
    ld [hl-], a
    dec hl
    call Call_000_0974
    ld a, [$df35]
    ld l, a
    ld a, [$df36]
    ld h, a
    ld de, $cce3
    ld a, [$cb7c]
    ld [hl+], a
    ld [de], a
    inc de
    ld a, [$cb7d]
    ld [hl+], a
    ld [de], a
    inc de
    ld a, [$cb7e]
    ld [hl+], a
    ld [de], a
    inc de
    ld a, [$cb7f]
    ld [hl+], a
    ld [de], a
    ld a, [$dd4d]
    ld l, a
    ld a, [$dd4e]
    ld h, a
    ld de, $01f4
    add hl, de
    ld a, l
    ld [$dd4d], a
    ld a, h
    ld [$dd4e], a
    ld a, l
    ld [$dd49], a
    ld a, h
    ld [$dd4a], a
    call $5c09
    ld a, [$dd4f]
    ld l, a
    ld a, [$dd50]
    ld h, a
    ld de, $0032
    add hl, de
    ld a, l
    ld [$dd4f], a
    ld a, h
    ld [$dd50], a
    ld b, h
    ld c, l
    call $7c3c
    ld hl, $dd0b
    call Call_000_0e54
    call Call_000_0e54
    call Call_000_0e54
    ld a, $2d
    ld [$dd4b], a
    ld hl, $67ad
    ld a, l
    ld [$dd60], a
    ld a, h
    ld [$dd61], a
    ld hl, $67bc
    ld a, l
    ld [$dd6f], a
    ld a, h
    ld [$dd70], a
    ld hl, $67cb
    ld a, l
    ld [$dd7e], a
    ld a, h
    ld [$dd7f], a
    ld hl, $dd60
    call $5d2e
    ld hl, $dd6f
    call $5d2e
    ld hl, $dd7e
    call $5d2e
    ld hl, $dd8d
    ld a, l
    ld [$dd6d], a
    ld a, h
    ld [$dd6e], a
    ld hl, $dddd
    ld a, l
    ld [$dd7c], a
    ld a, h
    ld [$dd7d], a
    ld hl, $de2d
    ld a, l
    ld [$dd8b], a
    ld a, h
    ld [$dd8c], a
    ld hl, $6543
    ld de, $de81
    ld bc, $0037
    call DataTransfer
    ret


    ld hl, $02b3
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    ld a, $01
    ld [$ff9c], a
    ld [$ff9b], a
    ld a, $01
    ld [$ff9a], a
    xor a
    ldh [rSCX], a
    ld de, $43b0
    call Call_000_0061
    ld a, $0d
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, $5150
    ld b, $14
    ld c, $12
    call Call_000_01d4
    xor a
    ld [$defc], a
    ld [$defd], a
    ld [$defe], a
    ldh [rVBK], a
    ld hl, $49b8
    ld de, $9000
    ld bc, $0630
    call DataTransfer
    ld de, $9800

Call_000_3e41:
    ld hl, $4fe8
    ld b, $14
    ld c, $12
    call Call_000_01d4
    ld a, $01
    call ChangeROMBank
    ret


Call_000_3e51:
    ld a, [$dabb]
    or a
    ret nz

Call_000_3e56:
    ld a, $06               ; Load ROM Bank 06
    ld [ROM_BANK], a
    call Call_006_473f
    ld a, $01
    ld [ROM_BANK], a
    ret


Call_000_3e64:
    push de
    push hl
    push bc
    ld e, a
    ld a, [$dabc]
    or a
    jr nz, jr_000_3e7b

    ld a, $06
    ld [ROM_BANK], a
    call $4819
    ld a, $01
    ld [ROM_BANK], a

jr_000_3e7b:
    pop bc

Jump_000_3e7c:
    pop hl
    pop de
    ret


Call_000_3e7f:
    ld a, $06
    ld [ROM_BANK], a
    call $4000
    ld a, $01
    ld [ROM_BANK], a
    ret


    ld a, $46
    ld [$ff91], a
    ld hl, $02b3
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    ld a, $01
    ld [$ff9c], a
    ld [$ff9b], a
    ld a, $01
    ld [$ff9a], a
    xor a
    ldh [rSCX], a
    ld de, $4530
    call Call_000_0061
    ld a, $03
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    xor a
    ld de, $9800
    ld hl, $5e98
    ld b, $14
    ld c, $12
    call Call_000_01d4
    xor a
    ldh [rVBK], a
    ld hl, $5580
    ld de, $9000
    ld bc, $07b0
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, $5d30
    ld b, $14
    ld c, $12
    call Call_000_01d4
    ld a, $01
    call ChangeROMBank
    ret


    ld a, [$ff91]
    or a
    jr z, jr_000_3ef8

    dec a
    ld [$ff91], a
    ret


jr_000_3ef8:
    ld a, $0c
    ld [$ff9f], a
    ld a, $01
    ld [$ffa0], a
    ret


    ld e, $08
    call Call_000_3e51
    xor a
    ldh [rSCX], a
    ld hl, $02b3
    ld a, l
    ld [$ff96], a
    ld a, h
    ld [$ff97], a
    xor a
    ld [$ff9c], a
    ld [$dcfe], a
    ld a, $01
    ld [$ff9a], a
    ld de, $44b0
    call Call_000_0061
    ld a, $0e
    ld [$dcff], a
    call ChangeROMBank
    ld a, $01
    ldh [rVBK], a
    ld hl, $674f
    ld de, $9000
    ld bc, $0800
    call DataTransfer
    ld hl, $6f4f
    ld de, $8800
    ld bc, $0790
    call DataTransfer
    xor a
    ld de, $9800
    ld hl, $7e87
    ld b, $14
    ld c, $12
    call Call_000_01d4
    xor a
    ldh [rVBK], a
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

; FuckYouDude:
;     ld hl, $2000
;     ld [hl], $D
;     ld a, $c3
;     ld [$ff92], a
; .loop:
;     jp .loop
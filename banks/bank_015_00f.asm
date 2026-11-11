; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00f", ROMX[$4000], BANK[$f]

; Called from the VBlank handler with A = hPaletteMode. Copies the LCD STAT handler for that mode
; to RAM at wStatJump and fills the per-line tables it uses.
SetUpRasterEffect:
    dec a
    jr nz, .notMode1

    ld hl, RasterHandler_Mode1
    ld de, wStatJump
    ld bc, $0052
    jp Raster_CopyBytes

.notMode1:
    cp $03
    jr nz, .notMode4

    ld hl, wRasterTable
    ld bc, $0009
    ld a, $00
    call Raster_FillWordColumn
    ld hl, wRasterTable + 2
    ld de, RasterColours_Mode4_1
    call Raster_CopyWordColumn
    ld hl, wRasterTable + 4
    ld de, RasterColours_Mode4_2
    call Raster_CopyWordColumn
    ld hl, wRasterTable + 6
    ld de, RasterColours_Mode4_3
    call Raster_CopyWordColumn
    ld hl, wRasterTable + 9
    ld de, RasterNextLines
    call Raster_CopyByteColumn
    ld hl, wRasterTable + 8
    xor a
    ld e, $90
    call Raster_FillByteColumn
    ld a, $02
    ld [hPaletteMode], a
    ld de, wRasterTable
    call LoadPalettes
    ld a, $04
    ld [hPaletteMode], a
    xor a
    jr .fillColoursInstallHandler

.notMode4:
    cp $02
    jp z, SetUpRasterEffect_Mode3

    ld hl, wRasterTable
    ld bc, $0009
    ld a, $00
    call Raster_FillWordColumn
    ld hl, wRasterTable + 2
    ld de, RasterColours_Mode2_1
    call Raster_CopyWordColumn
    ld hl, wRasterTable + 4
    ld de, RasterColours_Mode2_2
    call Raster_CopyWordColumn
    ld hl, wRasterTable + 6
    ld de, RasterColours_Mode2_3
    call Raster_CopyWordColumn
    ld hl, wRasterTable + 9
    ld de, RasterNextLines
    call Raster_CopyByteColumn
    ld hl, wRasterTable + 8
    ld a, $f8
    ld e, $90
    call Raster_FillByteColumn
    ld de, wRasterTable
    call LoadPalettes
    ld a, $ff

.fillColoursInstallHandler:
    ld hl, wRasterTable
    ld bc, $0009
    call Raster_FillWordColumn
    ld hl, wRasterTable + 2
    call Raster_FillWordColumn
    ld hl, wRasterTable + 4
    call Raster_FillWordColumn
    ld hl, wRasterTable + 6
    call Raster_FillWordColumn
    ld hl, RasterHandler_Mode2And4
    ld de, wStatJump
    ld bc, $005c
    jr Raster_CopyBytes

SetUpRasterEffect_Mode3:
    ld hl, wRasterTable
    ld de, RasterColours_Mode3
    ld bc, $0003
    call Raster_CopyWordColumn
    ld hl, wRasterTable + 3
    ld de, RasterNextLines
    call Raster_CopyByteColumn
    ld hl, wRasterTable + 2
    ld a, $f8
    ld e, $17
    call Raster_FillByteColumn
    ld a, $fc
    ld e, $78
    call Raster_FillByteColumn
    ld a, $f8
    ld e, $01
    call Raster_FillByteColumn
    ld hl, RasterHandler_Mode3
    ld de, wStatJump
    ld bc, $0038

Raster_CopyBytes:
    call DataTransfer
    ret

; Copy 144 words from DE to one column of wRasterTable. HL = first entry, BC = record size - 1.
Raster_CopyWordColumn:
    ld a, $90

.copyWordLoop:
    push af
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    add hl, bc
    pop af
    dec a
    jr nz, .copyWordLoop

    ret

; Fill one word column of wRasterTable with A for 144 lines.
Raster_FillWordColumn:
    ld e, $90

.fillWordLoop:
    ld [hl+], a
    ld [hl], a
    add hl, bc
    dec e
    jr nz, .fillWordLoop

    ret

; Copy 144 bytes from DE to one column of wRasterTable.
Raster_CopyByteColumn:
    ld a, $90

.copyByteLoop:
    push af
    ld a, [de]
    inc de
    ld [hl+], a
    add hl, bc
    pop af
    dec a
    jr nz, .copyByteLoop

    ret

; Fill E lines of one byte column of wRasterTable with A.
Raster_FillByteColumn:
    ld [hl+], a
    add hl, bc
    dec e
    jr nz, Raster_FillByteColumn

    ret

; LCD STAT handlers. SetUpRasterEffect copies one of them to wStatJump and it runs there once per screen line.
; Each handler writes the values for this line, then patches its own operands with the next record of wRasterTable.
; Mode 1. Each line: two sprite colours, one background colour and the next line number. Records are 7 bytes.
RasterHandler_Mode1:
    push hl
    ld hl, rOCPD
    ld [hl], $00 ; rOCPD (value patched from the table)
    ld [hl], $00 ; rOCPD (value patched from the table)
    ld [hl], $00 ; rOCPD (value patched from the table)
    ld [hl], $00 ; rOCPD (value patched from the table)
    ld l, LOW(rBCPD)
    ld [hl], $00 ; rBCPD (value patched from the table)
    ld [hl], $00 ; rBCPD (value patched from the table)
    ld l, LOW(rBCPS)
    ld [hl], $9e ; rBCPS
    ld l, LOW(rOCPS)
    ld [hl], $94 ; rOCPS
    ld l, LOW(rLYC)
    ld [hl], $09 ; rLYC (value patched from the table)
    ld l, LOW(rSCX)
    ld [hl], $00 ; rSCX
    push af
    ld a, [wRasterPtr]
    ld l, a
    ld a, [wRasterPtr + 1]
    ld h, a
    ld a, [hl+]
    ld [wStatJump + $05], a
    ld a, [hl+]
    ld [wStatJump + $07], a
    ld a, [hl+]
    ld [wStatJump + $09], a
    ld a, [hl+]
    ld [wStatJump + $0b], a
    ld a, [hl+]
    ld [wStatJump + $0f], a
    ld a, [hl+]
    ld [wStatJump + $11], a
    ld a, [hl+]
    ld [wStatJump + $1d], a
    ld a, l
    ld [wRasterPtr], a
    ld a, h
    ld [wRasterPtr + 1], a
    pop af
    pop hl
    reti

; Modes 2 and 4. Each line: four background colours, the horizontal scroll and the next line number. Records are 10 bytes.
RasterHandler_Mode2And4:
    push hl
    ld hl, rBCPD
    ld [hl], $00 ; rBCPD (value patched from the table)
    ld [hl], $00 ; rBCPD (value patched from the table)
    ld [hl], $00 ; rBCPD (value patched from the table)
    ld [hl], $00 ; rBCPD (value patched from the table)
    ld [hl], $00 ; rBCPD (value patched from the table)
    ld [hl], $00 ; rBCPD (value patched from the table)
    ld [hl], $00 ; rBCPD (value patched from the table)
    ld [hl], $00 ; rBCPD (value patched from the table)
    ld l, LOW(rSCX)
    ld [hl], $00 ; rSCX (value patched from the table)
    ld l, LOW(rBCPS)
    ld [hl], $80 ; rBCPS
    ld l, LOW(rLYC)
    ld [hl], $01 ; rLYC (value patched from the table)
    push af
    ld a, [wRasterPtr]
    ld l, a
    ld a, [wRasterPtr + 1]
    ld h, a
    ld a, [hl+]
    ld [wStatJump + $05], a
    ld a, [hl+]
    ld [wStatJump + $07], a
    ld a, [hl+]
    ld [wStatJump + $09], a
    ld a, [hl+]
    ld [wStatJump + $0b], a
    ld a, [hl+]
    ld [wStatJump + $0d], a
    ld a, [hl+]
    ld [wStatJump + $0f], a
    ld a, [hl+]
    ld [wStatJump + $11], a
    ld a, [hl+]
    ld [wStatJump + $13], a
    ld a, [hl+]
    ld [wStatJump + $17], a
    ld a, [hl+]
    ld [wStatJump + $1f], a
    ld a, l
    ld [wRasterPtr], a
    ld a, h
    ld [wRasterPtr + 1], a
    pop af
    pop hl
    reti

; Mode 3. Each line: one sprite colour, the horizontal scroll and the next line number. Records are 4 bytes.
RasterHandler_Mode3:
    push hl
    ld hl, rOCPD
    ld [hl], $00 ; rOCPD (value patched from the table)
    ld [hl], $00 ; rOCPD (value patched from the table)
    ld l, LOW(rSCX)
    ld [hl], $fc ; rSCX (value patched from the table)
    ld l, LOW(rOCPS)
    ld [hl], $82 ; rOCPS
    ld l, LOW(rLYC)
    ld [hl], $01 ; rLYC (value patched from the table)
    push af
    ld a, [wRasterPtr]
    ld l, a
    ld a, [wRasterPtr + 1]
    ld h, a
    ld a, [hl+]
    ld [wStatJump + $05], a
    ld a, [hl+]
    ld [wStatJump + $07], a
    ld a, [hl+]
    ld [wStatJump + $0b], a
    ld a, [hl+]
    ld [wStatJump + $13], a
    ld a, l
    ld [wRasterPtr], a
    ld a, h
    ld [wRasterPtr + 1], a
    pop af
    pop hl
    reti

; The line number that follows each of the 144 screen lines, for rLYC.
RasterNextLines:
    db $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b
    db $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b
    db $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b
    db $2c, $2d, $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b
    db $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b
    db $4c, $4d, $4e, $4f, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b
    db $5c, $5d, $5e, $5f, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6a, $6b
    db $6c, $6d, $6e, $6f, $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $7a, $7b
    db $7c, $7d, $7e, $7f, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a, $8b
    db $8c, $8d, $8e, $8f, $00, $01

; Colour tables: one 15-bit colour for each of the 144 screen lines.
RasterColours_Mode3:
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $11, $00, $11, $00, $11, $00
    db $11, $04, $11, $04, $11, $04, $11, $08, $11, $08, $31, $0c, $31, $0c, $31, $0c
    db $31, $10, $31, $10, $31, $14, $31, $14, $51, $14, $51, $18, $51, $18, $51, $18
    db $51, $1c, $51, $1c, $51, $20, $71, $20, $71, $20, $71, $24, $71, $24, $71, $28
    db $71, $28, $71, $28, $71, $2c, $91, $2c, $91, $2c, $91, $30, $91, $30, $91, $34
    db $91, $34, $91, $34, $b1, $38, $b1, $38, $b1, $3c, $b1, $3c, $b1, $3c, $b1, $40
    db $b1, $40, $b1, $44, $90, $44, $90, $44, $8f, $44, $8f, $44, $8e, $44, $8e, $44
    db $8e, $44, $8d, $44, $6d, $44, $6c, $44, $6c, $44, $6c, $44, $6b, $44, $6b, $44
    db $6a, $44, $6a, $44, $4a, $44, $49, $44, $49, $44, $48, $44, $48, $44, $48, $44
    db $47, $44, $47, $44, $46, $44, $26, $44, $26, $44, $25, $44, $25, $44, $24, $44
    db $24, $44, $24, $44, $23, $44, $03, $44, $02, $44, $02, $44, $02, $44, $01, $44
    db $01, $44, $00, $44, $00, $44, $00, $44, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00

RasterColours_Mode2_3:
    db $00, $00, $00, $00, $21, $04, $21, $04, $42, $08
    db $42, $08, $63, $0c, $63, $0c, $63, $0c, $84, $10, $84, $10, $a5, $14, $a5, $14
    db $c6, $18, $c6, $18, $c6, $18, $e7, $1c, $e7, $1c, $08, $21, $08, $21, $29, $25
    db $29, $25, $4a, $29, $4a, $29, $4a, $29, $6b, $2d, $6b, $2d, $8c, $31, $8c, $31
    db $ad, $35, $ad, $35, $ad, $35, $ce, $39, $ce, $39, $ef, $3d, $ef, $3d, $10, $42
    db $10, $42, $31, $46, $31, $46, $31, $46, $52, $4a, $52, $4a, $73, $4e, $73, $4e
    db $94, $52, $94, $52, $94, $52, $b5, $56, $b5, $56, $d6, $5a, $d6, $5a, $f7, $5e
    db $f7, $5e, $18, $63, $18, $63, $18, $63, $39, $67, $39, $67, $5a, $6b, $5a, $6b
    db $7b, $6f, $7b, $6f, $7b, $6f, $9c, $73, $9c, $73, $bd, $77, $bd, $77, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $bd, $77, $bd, $77, $9c, $73, $9c, $73
    db $7b, $6f, $7b, $6f, $7b, $6f, $5a, $6b, $5a, $6b, $39, $67, $39, $67, $18, $63
    db $18, $63, $18, $63, $f7, $5e, $f7, $5e, $d6, $5a, $d6, $5a, $b5, $56, $b5, $56
    db $b5, $56, $94, $52, $94, $52, $73, $4e, $73, $4e, $52, $4a, $52, $4a, $52, $4a
    db $31, $46, $31, $46, $10, $42, $10, $42, $ef, $3d, $ef, $3d, $ef, $3d, $ce, $39
    db $ce, $39, $ad, $35, $ad, $35, $8c, $31, $8c, $31, $8c, $31, $6b, $2d, $6b, $2d
    db $4a, $29, $4a, $29, $29, $25, $29, $25, $29, $25, $08, $21, $08, $21, $e7, $1c
    db $e7, $1c, $c6, $18, $c6, $18, $c6, $18, $a5, $14, $a5, $14, $84, $10, $84, $10
    db $63, $0c, $63, $0c, $63, $0c, $42, $08, $42, $08, $21, $04, $21, $04, $00, $00
    db $00, $00, $00, $00, $00, $00

RasterColours_Mode2_2:
    db $00, $00, $00, $00, $00, $00, $21, $04, $21, $04
    db $21, $04, $42, $08, $42, $08, $42, $08, $42, $08, $63, $0c, $63, $0c, $63, $0c
    db $84, $10, $84, $10, $84, $10, $a5, $14, $a5, $14, $a5, $14, $a5, $14, $c6, $18
    db $c6, $18, $c6, $18, $e7, $1c, $e7, $1c, $e7, $1c, $e7, $1c, $08, $21, $08, $21
    db $08, $21, $29, $25, $29, $25, $29, $25, $4a, $29, $4a, $29, $4a, $29, $4a, $29
    db $6b, $2d, $6b, $2d, $6b, $2d, $8c, $31, $8c, $31, $8c, $31, $ad, $35, $ad, $35
    db $ad, $35, $ad, $35, $ce, $39, $ce, $39, $ce, $39, $ef, $3d, $ef, $3d, $ef, $3d
    db $ef, $3d, $10, $42, $10, $42, $10, $42, $31, $46, $31, $46, $31, $46, $52, $4a
    db $52, $4a, $52, $4a, $52, $4a, $73, $4e, $73, $4e, $73, $4e, $94, $52, $94, $52
    db $94, $52, $94, $52, $94, $52, $94, $52, $94, $52, $73, $4e, $73, $4e, $73, $4e
    db $52, $4a, $52, $4a, $52, $4a, $52, $4a, $31, $46, $31, $46, $31, $46, $10, $42
    db $10, $42, $10, $42, $10, $42, $ef, $3d, $ef, $3d, $ef, $3d, $ce, $39, $ce, $39
    db $ce, $39, $ce, $39, $ad, $35, $ad, $35, $ad, $35, $8c, $31, $8c, $31, $8c, $31
    db $6b, $2d, $6b, $2d, $6b, $2d, $6b, $2d, $4a, $29, $4a, $29, $4a, $29, $29, $25
    db $29, $25, $29, $25, $29, $25, $08, $21, $08, $21, $08, $21, $e7, $1c, $e7, $1c
    db $e7, $1c, $e7, $1c, $c6, $18, $c6, $18, $c6, $18, $a5, $14, $a5, $14, $a5, $14
    db $84, $10, $84, $10, $84, $10, $84, $10, $63, $0c, $63, $0c, $63, $0c, $42, $08
    db $42, $08, $42, $08, $42, $08, $21, $04, $21, $04, $21, $04, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00

RasterColours_Mode2_1:
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $21, $04, $21, $04, $21, $04, $21, $04, $21, $04, $21, $04
    db $21, $04, $42, $08, $42, $08, $42, $08, $42, $08, $42, $08, $42, $08, $42, $08
    db $63, $0c, $63, $0c, $63, $0c, $63, $0c, $63, $0c, $63, $0c, $63, $0c, $84, $10
    db $84, $10, $84, $10, $84, $10, $84, $10, $84, $10, $84, $10, $a5, $14, $a5, $14
    db $a5, $14, $a5, $14, $a5, $14, $a5, $14, $a5, $14, $c6, $18, $c6, $18, $c6, $18
    db $c6, $18, $c6, $18, $c6, $18, $c6, $18, $e7, $1c, $e7, $1c, $e7, $1c, $e7, $1c
    db $e7, $1c, $e7, $1c, $e7, $1c, $08, $21, $08, $21, $08, $21, $08, $21, $08, $21
    db $08, $21, $08, $21, $29, $25, $29, $25, $29, $25, $29, $25, $29, $25, $29, $25
    db $29, $25, $29, $25, $29, $25, $29, $25, $29, $25, $29, $25, $29, $25, $29, $25
    db $29, $25, $08, $21, $08, $21, $08, $21, $08, $21, $08, $21, $08, $21, $08, $21
    db $e7, $1c, $e7, $1c, $e7, $1c, $e7, $1c, $e7, $1c, $e7, $1c, $e7, $1c, $c6, $18
    db $c6, $18, $c6, $18, $c6, $18, $c6, $18, $c6, $18, $c6, $18, $a5, $14, $a5, $14
    db $a5, $14, $a5, $14, $a5, $14, $a5, $14, $a5, $14, $84, $10, $84, $10, $84, $10
    db $84, $10, $84, $10, $84, $10, $84, $10, $84, $10, $63, $0c, $63, $0c, $63, $0c
    db $63, $0c, $63, $0c, $63, $0c, $63, $0c, $42, $08, $42, $08, $42, $08, $42, $08
    db $42, $08, $42, $08, $42, $08, $21, $04, $21, $04, $21, $04, $21, $04, $21, $04
    db $21, $04, $21, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00

RasterColours_Mode4_1:
    db $4c, $00, $4c, $00, $4c, $00, $4c, $00, $4c, $00
    db $6c, $04, $6c, $04, $6c, $04, $6c, $04, $6c, $04, $6c, $04, $8c, $08, $8c, $08
    db $8c, $08, $8c, $08, $8c, $08, $ac, $0c, $ab, $0c, $ab, $0c, $ab, $0c, $ab, $10
    db $ab, $10, $ab, $10, $ab, $10, $ab, $14, $ab, $14, $aa, $14, $aa, $18, $aa, $18
    db $aa, $18, $aa, $18, $aa, $1c, $aa, $1c, $aa, $1c, $aa, $1c, $a9, $1c, $a9, $1c
    db $c8, $1c, $c8, $20, $c8, $20, $e7, $20, $e7, $20, $e6, $24, $06, $25, $06, $25
    db $05, $29, $25, $29, $24, $29, $24, $29, $24, $2d, $43, $2d, $43, $2d, $42, $2d
    db $41, $29, $41, $25, $41, $25, $41, $21, $41, $1d, $41, $1d, $41, $19, $41, $19
    db $40, $15, $40, $11, $40, $11, $40, $0d, $40, $0d, $40, $09, $40, $05, $40, $05
    db $40, $01, $40, $01, $40, $01, $41, $01, $42, $01, $42, $01, $43, $01, $44, $01
    db $44, $01, $45, $01, $45, $01, $66, $01, $67, $01, $67, $01, $68, $01, $69, $01
    db $6a, $01, $6a, $01, $6b, $01, $6c, $01, $4c, $01, $4c, $01, $4c, $01, $2c, $01
    db $2c, $01, $2c, $01, $2c, $01, $0c, $01, $0c, $01, $0c, $01, $ec, $00, $ec, $00
    db $ec, $00, $ec, $00, $cc, $00, $cc, $00, $cc, $00, $cc, $00, $cb, $00, $cb, $04
    db $cb, $08, $ca, $08, $ca, $0c, $ca, $10, $c9, $10, $c9, $14, $c9, $14, $c8, $18
    db $c8, $1c, $c8, $1c, $c7, $20, $c7, $24, $c7, $28, $c6, $28, $c6, $2c, $c6, $30
    db $a6, $2c, $a6, $28, $87, $24, $87, $24, $87, $20, $68, $1c, $68, $1c, $68, $18
    db $49, $14, $49, $14, $49, $10, $29, $0c, $2a, $0c, $2a, $08, $0a, $04, $0b, $04
    db $0b, $00, $0b, $00, $4c, $00

RasterColours_Mode4_2:
    db $98, $00, $98, $00, $b8, $04, $b8, $04, $b8, $04
    db $d8, $08, $d8, $08, $d8, $08, $f8, $0c, $f8, $0c, $f8, $0c, $18, $11, $18, $11
    db $18, $11, $38, $15, $38, $15, $58, $19, $57, $19, $57, $19, $57, $1d, $57, $1d
    db $56, $21, $56, $21, $56, $25, $56, $25, $56, $29, $55, $29, $55, $29, $55, $2d
    db $55, $2d, $54, $31, $54, $31, $54, $35, $54, $35, $54, $39, $53, $39, $72, $39
    db $71, $3d, $90, $3d, $8f, $41, $ae, $41, $ad, $45, $cc, $45, $cb, $49, $eb, $49
    db $0a, $4a, $09, $4e, $28, $4e, $27, $52, $46, $52, $45, $56, $64, $56, $63, $5a
    db $62, $52, $62, $4e, $62, $4a, $62, $46, $62, $3e, $61, $3a, $61, $36, $61, $32
    db $61, $2e, $61, $26, $61, $22, $60, $1e, $60, $1a, $60, $12, $60, $0e, $60, $0a
    db $60, $06, $60, $02, $61, $02, $62, $02, $64, $02, $65, $02, $66, $02, $68, $02
    db $89, $02, $8a, $02, $8b, $02, $8d, $02, $8e, $02, $8f, $02, $b1, $02, $b2, $02
    db $b4, $02, $b5, $02, $b6, $02, $b8, $02, $98, $02, $98, $02, $78, $02, $78, $02
    db $58, $02, $58, $02, $38, $02, $38, $02, $18, $02, $18, $02, $f8, $01, $f8, $01
    db $d8, $01, $d8, $01, $b8, $01, $b8, $01, $98, $01, $98, $01, $97, $05, $96, $09
    db $96, $11, $95, $15, $94, $19, $94, $21, $93, $25, $92, $29, $92, $2d, $91, $35
    db $90, $39, $90, $3d, $8f, $45, $8e, $49, $8e, $51, $8d, $55, $8c, $59, $8c, $61
    db $6c, $59, $4d, $55, $2d, $4d, $2e, $49, $0e, $45, $ef, $3c, $ef, $38, $d0, $34
    db $b0, $2c, $b1, $28, $92, $24, $72, $1c, $73, $18, $53, $14, $34, $0c, $34, $08
    db $15, $04, $15, $00, $98, $00

RasterColours_Mode4_3:
    db $9f, $01, $9f, $05, $bf, $09, $bf, $09, $df, $0d
    db $df, $11, $ff, $11, $ff, $15, $1f, $1a, $1f, $1e, $3f, $1e, $3f, $22, $5f, $26
    db $5f, $26, $7f, $2a, $7f, $2e, $9f, $32, $9f, $32, $9f, $36, $9f, $3a, $9f, $3e
    db $9f, $42, $9f, $46, $9f, $4a, $9f, $4e, $9f, $52, $9f, $52, $9f, $56, $9f, $5a
    db $9f, $5e, $9f, $62, $9f, $66, $9f, $6a, $9f, $6e, $9f, $72, $9d, $72, $9c, $72
    db $bb, $72, $ba, $72, $b9, $72, $d8, $72, $d6, $76, $f5, $76, $f4, $76, $f3, $76
    db $12, $77, $11, $77, $2f, $7b, $2e, $7b, $2d, $7b, $4c, $7b, $4b, $7b, $6a, $7b
    db $69, $73, $68, $6b, $68, $67, $67, $5f, $87, $57, $86, $53, $86, $4b, $85, $43
    db $85, $3f, $a4, $37, $a3, $2f, $a3, $2b, $a2, $23, $c2, $1b, $c1, $17, $c1, $0f
    db $c0, $07, $c0, $03, $a1, $03, $a3, $03, $a5, $03, $a6, $03, $a8, $03, $aa, $03
    db $ac, $03, $ad, $03, $af, $03, $b1, $03, $b2, $03, $b4, $03, $b6, $03, $b8, $03
    db $b9, $03, $bb, $03, $bd, $03, $be, $03, $9e, $03, $9e, $03, $9e, $03, $7e, $03
    db $7e, $03, $7e, $03, $7e, $03, $5e, $03, $5e, $03, $5e, $03, $3e, $03, $3e, $03
    db $3e, $03, $3e, $03, $1e, $03, $1e, $03, $1e, $03, $fe, $02, $dd, $06, $dc, $0e
    db $dc, $16, $db, $1a, $db, $22, $da, $2a, $ba, $32, $b9, $36, $b9, $3e, $b8, $46
    db $b7, $4a, $b7, $52, $96, $5a, $96, $62, $95, $66, $95, $6e, $94, $76, $94, $7a
    db $54, $72, $35, $6a, $15, $66, $f6, $5d, $d7, $55, $b7, $51, $98, $49, $78, $41
    db $59, $3d, $1a, $35, $fa, $2c, $db, $28, $bb, $20, $9c, $18, $7d, $14, $5d, $0c
    db $3e, $04, $1e, $00, $9f, $01

; Credits: 20 characters and an attribute byte per line. $00 is an empty line and $ff ends the list.
Credits_English:
    db $00
    db "       CREDITS      ", $04
    db $00, $00
    db "        ", $ab, $ac, $ad, $ae, "        ", $00
    db "        ", $af, $b0, $b1, $b2, "        ", $00
    db "        ", $b3, $b4, $b5, $b6, "        ", $00
    db "        ", $b7, $b8, $b9, $ba, "        ", $00
    db $00, $00
    db "     SCI CREDITS    ", $04
    db $00, $00, $00
    db "   CHIEF EXECUTIVE  ", $04
    db $00
    db "    JANE CAVANAGH   ", $04
    db $00, $00
    db "     DIRECTOR OF    ", $04
    db "     DEVELOPMENT    ", $04
    db $00
    db "   DAVID RATCLIFFE  ", $04
    db $00, $00, $00, $00
    db "      PRODUCER      ", $00
    db $00
    db "   JONATHAN COURT   ", $00
    db $00, $00, $00
    db " 3RD PARTY RELATIONS", $04
    db $00
    db "     ANDY O", $0b, "DOWD    ", $04
    db $00, $00, $00
    db "     QA ENGINEER    ", $04
    db $00
    db "      BEN MASON     ", $04
    db $00, $00, $00
    db "PACKAGING AND DESIGN", $00
    db $00
    db "   KEITH HODGETTS   ", $00
    db $00, $00, $00
    db "    AND THANKS TO   ", $04
    db "   EVERYONE AT SCI  ", $04
    db $00, $00, $00, $00, $00, $00
    db "    PUKKA CREDITS   ", $04
    db $00, $00, $00
    db "        ", $eb, $ec, $ed, $ee, "        ", $00
    db "        ", $ef, $f0, $f1, $f2, "        ", $00
    db "        ", $f3, $f4, $f5, $f6, "        ", $00
    db "        ", $f7, $f8, $f9, $fa, "        ", $00
    db $00
    db "PRODUCTION DIRECTORS", $00
    db $00
    db "    DAMON BRANCH    ", $00
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $cb, $cc, $cd, $ce, "        ", $00
    db "        ", $cf, $d0, $d1, $d2, "        ", $00
    db "        ", $d3, $d4, $d5, $d6, "        ", $00
    db "        ", $d7, $d8, $d9, $da, "        ", $00
    db $00
    db "    GAME CONCEPT    ", $00
    db $00
    db "   MARCUS STRINGER  ", $04
    db "     ANDY COATES    ", $04
    db $00, $00, $00
    db "        [", $5c, "]^        ", $00
    db "        _`ab        ", $00
    db "        cdef        ", $00
    db "        ghij        ", $00
    db $00
    db "   LEAD PROGRAMMER  ", $04
    db $00
    db "     ANDY COATES    ", $04
    db $00, $00, $00
    db "     ADDITIONAL     ", $00
    db "     PROGRAMMING    ", $04
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $bb, $bc, $bd, $be, "        ", $00
    db "        ", $bf, $c0, $c1, $c2, "        ", $00
    db "        ", $c3, $c4, $c5, $c6, "        ", $00
    db "        ", $c7, $c8, $c9, $ca, "        ", $00
    db $00
    db "      GRAPHICS      ", $00
    db $00
    db "   MARCUS STRINGER  ", $04
    db $00, $00, $00
    db "        ", $9b, $9c, $9d, $9e, "        ", $00
    db "        ", $9f, $a0, $a1, $a2, "        ", $00
    db "        ", $a3, $a4, $a5, $a6, "        ", $00
    db "        ", $a7, $a8, $a9, $aa, "        ", $00
    db $00
    db "    MUSIC AND SFX   ", $04
    db $00
    db "      AUDIOARTS     ", $04
    db $00, $00, $00
    db "    SOUND DRIVERS   ", $04
    db $00
    db "      AUDIOARTS     ", $04
    db $00, $00, $00
    db "        klmn        ", $00
    db "        opqr        ", $00
    db "        stuv        ", $00
    db "        wxyz        ", $00
    db $00
    db "      UTILITIES     ", $04
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $db, $dc, $dd, $de, "        ", $00
    db "        ", $df, $e0, $e1, $e2, "        ", $00
    db "        ", $e3, $e4, $e5, $e6, "        ", $00
    db "        ", $e7, $e8, $e9, $ea, "        ", $00
    db $00
    db "    LEVEL DESIGN    ", $00
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db "   MARCUS STRINGER  ", $04
    db "     ANDY COATES    ", $04
    db "   ANATOLE BRANCH   ", $00
    db $00, $00, $00
    db "        ", $8b, $8c, $8d, $8e, "        ", $00
    db "        ", $8f, $90, $91, $92, "        ", $00
    db "        ", $93, $94, $95, $96, "        ", $00
    db "        ", $97, $98, $99, $9a, "        ", $00
    db $00
    db "     PLAYTESTERS    ", $04
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db "     ANDY COATES    ", $04
    db "   MARCUS STRINGER  ", $04
    db "   ANATOLE BRANCH   ", $00
    db "   JONATHAN ROGERS  ", $04
    db "   LEE PERRY", $09, "SMITH  ", $04
    db "     ROB WILSON     ", $00
    db "     CHRISTOPHE     ", $00
    db "   KEIRAN MCMILLAN  ", $04
    db "   ANYA AND WAYNE   ", $00
    db "    RACHEL COOPER   ", $04
    db "    DONNA HARRIS    ", $00
    db "        JARV        ", $00
    db "    NICK GUNNING    ", $00
    db $00, $00, $00
    db "        ", $7b, "|", $7d, "~        ", $00
    db "        ", $7f, $80, $81, $82, "        ", $00
    db "        ", $83, $84, $85, $86, "        ", $00
    db "        ", $87, $88, $89, $8a, "        ", $00
    db $00
    db "    MORAL SUPPORT   ", $04
    db $00
    db "  MERYLS SANDWICHES ", $04
    db "    HELEN COATES    ", $00
    db "     MINI MORRIS    ", $04
    db "     RUTH BAKER     ", $00
    db "  LINDSAY KERNOHAN  ", $00
    db "   KAREN KERNOHAN   ", $00
    db "     RON AND KAF    ", $04
    db "     SUNNY MOLLY    ", $04
    db "   TESSA AND SIMON  ", $04
    db "        KATIE       ", $04
    db $00, $00, $00, $00
    db "     PUKKA GAMES    ", $04
    db $00
    db "    WOULD LIKE TO   ", $04
    db $00
    db "   THANK EVERYONE   ", $00
    db $00
    db "     EVERYWHERE", $0a, "    ", $00
    db $00, $00, $00
    db "      BUT THAT      ", $00
    db $00
    db "     WOULD TAKE     ", $00
    db $00
    db "     TOO LONG", $0a, $0a, $0a, "    ", $04
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $ff

Credits_French:
    db $00
    db "    REMERCIEMENTS   ", $04
    db $00, $00
    db "        ", $ab, $ac, $ad, $ae, "        ", $00
    db "        ", $af, $b0, $b1, $b2, "        ", $00
    db "        ", $b3, $b4, $b5, $b6, "        ", $00
    db "        ", $b7, $b8, $b9, $ba, "        ", $00
    db $00, $00
    db "  REMERCIEMENTS SCI ", $04
    db $00, $00, $00
    db "  DIRECTEUR GENERAL ", $04
    db $00
    db "    JANE CAVANAGH   ", $04
    db $00, $00
    db "    DIRECTEUR DU    ", $00
    db "     ", $03, "              ", $04
    db "    DEVELOPPEMENT   ", $04
    db $00
    db "   DAVID RATCLIFFE  ", $04
    db $00, $00, $00, $00
    db "     PRODUCTEUR     ", $00
    db $00
    db "   JONATHAN COURT   ", $00
    db $00, $00, $00
    db "   RELATIONS AVEC   ", $00
    db "   LES PARTENAIRES  ", $04
    db $00
    db "     ANDY O", $0b, "DOWD    ", $04
    db $00, $00
    db "        ", $03, "           ", $00
    db "     INGENIEURS     ", $00
    db "                  ", $03, " ", $04
    db "  ASSURANCE QUALITE ", $04
    db $00
    db "      BEN MASON     ", $04
    db $00, $00, $00
    db "   CONDITIONNEMENT  ", $04
    db "    ET CONCEPTION   ", $04
    db $00
    db "   KEITH HODGETTS   ", $00
    db $00, $00
    db "       ", $04, "      ", $04, "     ", $00
    db " MERCI A TOUS A SCI ", $00
    db $00, $00, $00, $00, $00, $00
    db " REMERCIEMENTS PUKKA", $04
    db $00, $00, $00
    db "        ", $eb, $ec, $ed, $ee, "        ", $00
    db "        ", $ef, $f0, $f1, $f2, "        ", $00
    db "        ", $f3, $f4, $f5, $f6, "        ", $00
    db "        ", $f7, $f8, $f9, $fa, "        ", $00
    db $00
    db "     DIRECTEURS     ", $00
    db "  DE LA PRODUCTION  ", $00
    db $00
    db "    DAMON BRANCH    ", $00
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $cb, $cc, $cd, $ce, "        ", $00
    db "        ", $cf, $d0, $d1, $d2, "        ", $00
    db "        ", $d3, $d4, $d5, $d6, "        ", $00
    db "        ", $d7, $d8, $d9, $da, "        ", $00
    db $00
    db "     CONCEPTION     ", $00
    db $00
    db "   MARCUS STRINGER  ", $04
    db "     ANDY COATES    ", $04
    db $00, $00, $00
    db "        [", $5c, "]^        ", $00
    db "        _`ab        ", $00
    db "        cdef        ", $00
    db "        ghij        ", $00
    db $00
    db "    PROGRAMMATION   ", $04
    db $00
    db "     ANDY COATES    ", $04
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $bb, $bc, $bd, $be, "        ", $00
    db "        ", $bf, $c0, $c1, $c2, "        ", $00
    db "        ", $c3, $c4, $c5, $c6, "        ", $00
    db "        ", $c7, $c8, $c9, $ca, "        ", $00
    db $00
    db "     GRAPHISMES     ", $00
    db $00
    db "   MARCUS STRINGER  ", $04
    db $00, $00, $00
    db "        ", $9b, $9c, $9d, $9e, "        ", $00
    db "        ", $9f, $a0, $a1, $a2, "        ", $00
    db "        ", $a3, $a4, $a5, $a6, "        ", $00
    db "        ", $a7, $a8, $a9, $aa, "        ", $00
    db $00
    db "   MUSIQUE", $0a, " EFFETS  ", $04
    db "   SONORES ET SON   ", $00
    db $00
    db "      AUDIOARTS     ", $04
    db $00, $00, $00, $00
    db "        klmn        ", $00
    db "        opqr        ", $00
    db "        stuv        ", $00
    db "        wxyz        ", $00
    db $00
    db "       OUTILS       ", $00
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $db, $dc, $dd, $de, "        ", $00
    db "        ", $df, $e0, $e1, $e2, "        ", $00
    db "        ", $e3, $e4, $e5, $e6, "        ", $00
    db "        ", $e7, $e8, $e9, $ea, "        ", $00
    db "  ", $03, "                 ", $00
    db "CREATION DES NIVEAUX", $00
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db "   MARCUS STRINGER  ", $04
    db "     ANDY COATES    ", $04
    db "   ANATOLE BRANCH   ", $00
    db $00, $00, $00
    db "        ", $8b, $8c, $8d, $8e, "        ", $00
    db "        ", $8f, $90, $91, $92, "        ", $00
    db "        ", $93, $94, $95, $96, "        ", $00
    db "        ", $97, $98, $99, $9a, "        ", $00
    db "                   ", $03, $04
    db " TESTS DE JOUABILITE", $04
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db "     ANDY COATES    ", $04
    db "   MARCUS STRINGER  ", $04
    db "   ANATOLE BRANCH   ", $00
    db "   JONATHAN ROGERS  ", $04
    db "   LEE PERRY", $09, "SMITH  ", $04
    db "     ROB WILSON     ", $00
    db "     CHRISTOPHE     ", $00
    db "   KEIRAN MCMILLAN  ", $04
    db "   ANYA AND WAYNE   ", $00
    db "    RACHEL COOPER   ", $04
    db "    DONNA HARRIS    ", $00
    db "        JARV        ", $00
    db "    NICK GUNNING    ", $00
    db $00, $00, $00
    db "        ", $7b, "|", $7d, "~        ", $00
    db "        ", $7f, $80, $81, $82, "        ", $00
    db "        ", $83, $84, $85, $86, "        ", $00
    db "        ", $87, $88, $89, $8a, "        ", $00
    db $00
    db "    SUPPORT MORAL   ", $04
    db $00
    db "  MERYLS SANDWICHES ", $04
    db "    HELEN COATES    ", $00
    db "     MINI MORRIS    ", $04
    db "     RUTH BAKER     ", $00
    db "  LINDSAY KERNOHAN  ", $00
    db "   KAREN KERNOHAN   ", $00
    db "     RON AND KAF    ", $04
    db "     SUNNY MOLLY    ", $04
    db "   TESSA AND SIMON  ", $04
    db "        KATIE       ", $04
    db $00, $00, $00, $00
    db "     PUKKA GAMES    ", $04
    db $00
    db " VOUDRAIT REMERCIER ", $00
    db $00
    db "   LE MONDE ENTIER", $0a, " ", $04
    db $00, $00, $00
    db "       MAIS ", $06, "A      ", $04
    db $00
    db "   PRENDRAIT TROP   ", $00
    db $00
    db "     DE TEMPS ", $07, "     ", $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $ff

Credits_German:
    db $00
    db "        TEAM        ", $00
    db $00, $00
    db "        ", $ab, $ac, $ad, $ae, "        ", $00
    db "        ", $af, $b0, $b1, $b2, "        ", $00
    db "        ", $b3, $b4, $b5, $b6, "        ", $00
    db "        ", $b7, $b8, $b9, $ba, "        ", $00
    db $00, $00
    db "      SCI", $09, "TEAM      ", $00
    db $00, $00, $00
    db "       ", $01, "    ", $01, "       ", $00
    db "  GESCHAFTSFUHRUNG  ", $00
    db $00
    db "    JANE CAVANAGH   ", $04
    db $00, $00
    db " LEITUNG ENTWICKLUNG", $04
    db $00
    db "   DAVID RATCLIFFE  ", $04
    db $00, $00, $00, $00
    db "     PRODUKTION     ", $00
    db $00
    db "   JONATHAN COURT   ", $00
    db $00, $00, $00
    db "    BETREUUNG DER   ", $04
    db "       ", $01, "            ", $00
    db "  GESCHAFTSPARTNER  ", $00
    db $00
    db "     ANDY O", $0b, "DOWD    ", $04
    db $00, $00, $00
    db "    QS", $09, "INGENIEURE   ", $04
    db $00
    db "      BEN MASON     ", $04
    db $00, $00, $00
    db "     VERPACKUNG     ", $00
    db "     UND DESIGN     ", $00
    db $00
    db "   KEITH HODGETTS   ", $00
    db $00, $00, $00
    db "   UND VIELEN DANK  ", $04
    db " AN ALLE MITARBEITER", $04
    db "       VON SCI      ", $04
    db $00, $00, $00, $00, $00, $00
    db "     PUKKA", $09, "TEAM     ", $00
    db $00, $00, $00
    db "        ", $eb, $ec, $ed, $ee, "        ", $00
    db "        ", $ef, $f0, $f1, $f2, "        ", $00
    db "        ", $f3, $f4, $f5, $f6, "        ", $00
    db "        ", $f7, $f8, $f9, $fa, "        ", $00
    db $00
    db "  PRODUKTIONLEITUNG ", $04
    db $00
    db "    DAMON BRANCH    ", $00
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $cb, $cc, $cd, $ce, "        ", $00
    db "        ", $cf, $d0, $d1, $d2, "        ", $00
    db "        ", $d3, $d4, $d5, $d6, "        ", $00
    db "        ", $d7, $d8, $d9, $da, "        ", $00
    db $00
    db "       DESIGN       ", $00
    db $00
    db "   MARCUS STRINGER  ", $04
    db "     ANDY COATES    ", $04
    db $00, $00, $00
    db "        [", $5c, "]^        ", $00
    db "        _`ab        ", $00
    db "        cdef        ", $00
    db "        ghij        ", $00
    db $00
    db "   PROGRAMMIERUNG   ", $00
    db $00
    db "     ANDY COATES    ", $04
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $bb, $bc, $bd, $be, "        ", $00
    db "        ", $bf, $c0, $c1, $c2, "        ", $00
    db "        ", $c3, $c4, $c5, $c6, "        ", $00
    db "        ", $c7, $c8, $c9, $ca, "        ", $00
    db $00
    db "       GRAFIK       ", $00
    db $00
    db "   MARCUS STRINGER  ", $04
    db $00, $00, $00
    db "        ", $9b, $9c, $9d, $9e, "        ", $00
    db "        ", $9f, $a0, $a1, $a2, "        ", $00
    db "        ", $a3, $a4, $a5, $a6, "        ", $00
    db "        ", $a7, $a8, $a9, $aa, "        ", $00
    db $00
    db "      MUSIK UND     ", $04
    db "    SOUNDEFFEKTE    ", $00
    db $00
    db "      AUDIOARTS     ", $04
    db $00, $00, $00
    db "    SOUNDTREIBER    ", $00
    db $00
    db "      AUDIOARTS     ", $04
    db $00, $00, $00
    db "        klmn        ", $00
    db "        opqr        ", $00
    db "        stuv        ", $00
    db "        wxyz        ", $00
    db $00
    db "  UTILITY", $09, "PROGRAMME ", $04
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $db, $dc, $dd, $de, "        ", $00
    db "        ", $df, $e0, $e1, $e2, "        ", $00
    db "        ", $e3, $e4, $e5, $e6, "        ", $00
    db "        ", $e7, $e8, $e9, $ea, "        ", $00
    db $00
    db "     LEVELDESIGN    ", $04
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db "   MARCUS STRINGER  ", $04
    db "     ANDY COATES    ", $04
    db "   ANATOLE BRANCH   ", $00
    db $00, $00, $00
    db "        ", $8b, $8c, $8d, $8e, "        ", $00
    db "        ", $8f, $90, $91, $92, "        ", $00
    db "        ", $93, $94, $95, $96, "        ", $00
    db "        ", $97, $98, $99, $9a, "        ", $00
    db $00
    db "     SPIELTESTER    ", $04
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db "     ANDY COATES    ", $04
    db "   MARCUS STRINGER  ", $04
    db "   ANATOLE BRANCH   ", $00
    db "   JONATHAN ROGERS  ", $04
    db "   LEE PERRY", $09, "SMITH  ", $04
    db "     ROB WILSON     ", $00
    db "     CHRISTOPHE     ", $00
    db "   KEIRAN MCMILLAN  ", $04
    db "   ANYA AND WAYNE   ", $00
    db "    RACHEL COOPER   ", $04
    db "    DONNA HARRIS    ", $00
    db "        JARV        ", $00
    db "    NICK GUNNING    ", $00
    db $00, $00, $00
    db "        ", $7b, "|", $7d, "~        ", $00
    db "        ", $7f, $80, $81, $82, "        ", $00
    db "        ", $83, $84, $85, $86, "        ", $00
    db "        ", $87, $88, $89, $8a, "        ", $00
    db $00
    db "     MORALISCHE     ", $00
    db "           ", $01, "        ", $04
    db "    UNTERSTUTZUNG   ", $04
    db $00
    db "  MERYLS SANDWICHES ", $04
    db "    HELEN COATES    ", $00
    db "     MINI MORRIS    ", $04
    db "     RUTH BAKER     ", $00
    db "  LINDSAY KERNOHAN  ", $00
    db "   KAREN KERNOHAN   ", $00
    db "     RON AND KAF    ", $04
    db "     SUNNY MOLLY    ", $04
    db "   TESSA AND SIMON  ", $04
    db "        KATIE       ", $04
    db $00, $00, $00, $00
    db "     PUKKA GAMES    ", $04
    db "   ", $01, "                ", $00
    db "  WURDE SICH GERNE  ", $04
    db $00
    db "      BEI ALLEN     ", $04
    db $00
    db "    MITWIRKENDEN    ", $00
    db $00
    db "      BEDANKEN", $0a, "     ", $00
    db $00, $00, $00
    db "   ABER DAS WURDE   ", $00
    db $00
    db "   ZU LANGE DAUERN  ", $04
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $ff

Credits_Italian:
    db $00
    db "   RICONOSCIMENTI   ", $00
    db $00, $00
    db "        ", $ab, $ac, $ad, $ae, "        ", $00
    db "        ", $af, $b0, $b1, $b2, "        ", $00
    db "        ", $b3, $b4, $b5, $b6, "        ", $00
    db "        ", $b7, $b8, $b9, $ba, "        ", $00
    db $00, $00
    db " RICONOSCIMENTI SCI ", $00
    db $00, $00, $00
    db " DIRETTORE ESECUTIVO", $04
    db $00
    db "    JANE CAVANAGH   ", $04
    db $00, $00
    db "   DIRETTORE DELLO  ", $04
    db "      SVILUPPO      ", $00
    db $00
    db "   DAVID RATCLIFFE  ", $04
    db $00, $00, $00, $00
    db "     PRODUTTORE     ", $00
    db $00
    db "   JONATHAN COURT   ", $00
    db $00, $00, $00
    db "  RELAZIONI ESTERNE ", $04
    db $00
    db "     ANDY O", $0b, "DOWD    ", $04
    db $00, $00, $00
    db "  TECNICI CONTROLLO ", $04
    db "             ", $04, "      ", $04
    db "       QUALITA      ", $04
    db $00
    db "      BEN MASON     ", $04
    db $00, $00, $00
    db "PROGETTAZIONE E CURA", $00
    db "  DELLA CONFEZIONE  ", $00
    db $00
    db "   KEITH HODGETTS   ", $00
    db $00, $00, $00
    db "  UN RINGRAZIAMENTO ", $04
    db "  SPECIALE A TUTTI  ", $00
    db "  QUELLI DELLA SCI  ", $00
    db $00, $00, $00, $00, $00, $00
    db "RICONOSCIMENTI PUKKA", $00
    db $00, $00, $00
    db "        ", $eb, $ec, $ed, $ee, "        ", $00
    db "        ", $ef, $f0, $f1, $f2, "        ", $00
    db "        ", $f3, $f4, $f5, $f6, "        ", $00
    db "        ", $f7, $f8, $f9, $fa, "        ", $00
    db $00
    db "   DIRETTORI DELLA  ", $04
    db "     PRODUZIONE     ", $00
    db $00
    db "    DAMON BRANCH    ", $00
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $cb, $cc, $cd, $ce, "        ", $00
    db "        ", $cf, $d0, $d1, $d2, "        ", $00
    db "        ", $d3, $d4, $d5, $d6, "        ", $00
    db "        ", $d7, $d8, $d9, $da, "        ", $00
    db $00
    db "     CURA DELLA     ", $00
    db "     CONFEZIONE     ", $00
    db $00
    db "   MARCUS STRINGER  ", $04
    db "     ANDY COATES    ", $04
    db $00, $00, $00
    db "        [", $5c, "]^        ", $00
    db "        _`ab        ", $00
    db "        cdef        ", $00
    db "        ghij        ", $00
    db $00
    db "   PROGRAMMAZIONE   ", $00
    db $00
    db "     ANDY COATES    ", $04
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $bb, $bc, $bd, $be, "        ", $00
    db "        ", $bf, $c0, $c1, $c2, "        ", $00
    db "        ", $c3, $c4, $c5, $c6, "        ", $00
    db "        ", $c7, $c8, $c9, $ca, "        ", $00
    db $00
    db "       GRAFICA      ", $04
    db $00
    db "   MARCUS STRINGER  ", $04
    db $00, $00, $00
    db "        ", $9b, $9c, $9d, $9e, "        ", $00
    db "        ", $9f, $a0, $a1, $a2, "        ", $00
    db "        ", $a3, $a4, $a5, $a6, "        ", $00
    db "        ", $a7, $a8, $a9, $aa, "        ", $00
    db $00
    db "   MUSICA", $0a, " EFFETTI  ", $04
    db "   SONORI E DRIVER  ", $04
    db "        AUDIO       ", $04
    db $00
    db "      AUDIOARTS     ", $04
    db $00, $00, $00
    db "        klmn        ", $00
    db "        opqr        ", $00
    db "        stuv        ", $00
    db "        wxyz        ", $00
    db "             ", $04, "      ", $04
    db "       UTILITA      ", $04
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $db, $dc, $dd, $de, "        ", $00
    db "        ", $df, $e0, $e1, $e2, "        ", $00
    db "        ", $e3, $e4, $e5, $e6, "        ", $00
    db "        ", $e7, $e8, $e9, $ea, "        ", $00
    db $00
    db "    PROGETTAZIONE   ", $04
    db "     DEI LIVELLI    ", $04
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db "   MARCUS STRINGER  ", $04
    db "     ANDY COATES    ", $04
    db "   ANATOLE BRANCH   ", $00
    db $00, $00, $00
    db "        ", $8b, $8c, $8d, $8e, "        ", $00
    db "        ", $8f, $90, $91, $92, "        ", $00
    db "        ", $93, $94, $95, $96, "        ", $00
    db "        ", $97, $98, $99, $9a, "        ", $00
    db $00
    db "  TEST DEL PRODOTTO ", $04
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db "     ANDY COATES    ", $04
    db "   MARCUS STRINGER  ", $04
    db "   ANATOLE BRANCH   ", $00
    db "   JONATHAN ROGERS  ", $04
    db "   LEE PERRY", $09, "SMITH  ", $04
    db "     ROB WILSON     ", $00
    db "     CHRISTOPHE     ", $00
    db "   KEIRAN MCMILLAN  ", $04
    db "   ANYA AND WAYNE   ", $00
    db "    RACHEL COOPER   ", $04
    db "    DONNA HARRIS    ", $00
    db "        JARV        ", $00
    db "    NICK GUNNING    ", $00
    db $00, $00, $00
    db "        ", $7b, "|", $7d, "~        ", $00
    db "        ", $7f, $80, $81, $82, "        ", $00
    db "        ", $83, $84, $85, $86, "        ", $00
    db "        ", $87, $88, $89, $8a, "        ", $00
    db $00
    db "   SUPPORTO MORALE  ", $04
    db $00
    db "  MERYLS SANDWICHES ", $04
    db "    HELEN COATES    ", $00
    db "     MINI MORRIS    ", $04
    db "     RUTH BAKER     ", $00
    db "  LINDSAY KERNOHAN  ", $00
    db "   KAREN KERNOHAN   ", $00
    db "     RON AND KAF    ", $04
    db "     SUNNY MOLLY    ", $04
    db "   TESSA AND SIMON  ", $04
    db "        KATIE       ", $04
    db $00, $00, $00, $00
    db "   LA PUKKA GAMES   ", $00
    db $00
    db "DESIDERA RINGRAZIARE", $00
    db $00
    db "  TUTTE LE PERSONE  ", $00
    db $00
    db "   COINVOLTE NELLA  ", $04
    db $00
    db "CREAZIONE DEL GIOCO", $0a, $00
    db $00, $00, $00
    db "   MA CI VORREBBE   ", $00
    db $00
    db "    TROPPO TEMPO    ", $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $ff

Credits_Spanish:
    db "        ", $03, "           ", $00
    db "      CREDITOS      ", $00
    db $00, $00
    db "        ", $ab, $ac, $ad, $ae, "        ", $00
    db "        ", $af, $b0, $b1, $b2, "        ", $00
    db "        ", $b3, $b4, $b5, $b6, "        ", $00
    db "        ", $b7, $b8, $b9, $ba, "        ", $00
    db $00
    db "      ", $03, "             ", $00
    db "    CREDITOS SCI    ", $00
    db $00, $00, $00
    db " DIRECTOR EJECUTIVO ", $00
    db $00
    db "    JANE CAVANAGH   ", $04
    db $00, $00
    db "     DIRECTOR DE    ", $04
    db "     DESARROLLO     ", $00
    db $00
    db "   DAVID RATCLIFFE  ", $04
    db $00, $00, $00, $00
    db "      PRODUCTOR     ", $04
    db $00
    db "   JONATHAN COURT   ", $00
    db $00, $00, $00
    db "   RELACIONES CON   ", $00
    db "      ASOCIADOS     ", $04
    db $00
    db "     ANDY O", $0b, "DOWD    ", $04
    db $00, $00, $00
    db "   INGENIEROS DEL   ", $00
    db " CONTROL DE CALIDAD ", $00
    db $00
    db "      BEN MASON     ", $04
    db $00, $00
    db "              ", $03, "     ", $00
    db "    PRESENTACION    ", $00
    db "            ", $05, "       ", $00
    db "      Y DISENO      ", $00
    db $00
    db "   KEITH HODGETTS   ", $00
    db $00, $00, $00
    db "  Y MUCHOS GRACIAS  ", $00
    db "        A SCI       ", $04
    db $00, $00, $00, $00, $00
    db "     ", $03, "              ", $00
    db "   CREDITOS PUKKA   ", $00
    db $00, $00, $00
    db "        ", $eb, $ec, $ed, $ee, "        ", $00
    db "        ", $ef, $f0, $f1, $f2, "        ", $00
    db "        ", $f3, $f4, $f5, $f6, "        ", $00
    db "        ", $f7, $f8, $f9, $fa, "        ", $00
    db $00
    db "    DIRECTORES DE   ", $04
    db "             ", $03, "      ", $00
    db "     PRODUCCION     ", $00
    db $00
    db "    DAMON BRANCH    ", $00
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $cb, $cc, $cd, $ce, "        ", $00
    db "        ", $cf, $d0, $d1, $d2, "        ", $00
    db "        ", $d3, $d4, $d5, $d6, "        ", $00
    db "        ", $d7, $d8, $d9, $da, "        ", $00
    db "           ", $05, "        ", $00
    db "       DISENO       ", $00
    db $00
    db "   MARCUS STRINGER  ", $04
    db "     ANDY COATES    ", $04
    db $00, $00, $00
    db "        [", $5c, "]^        ", $00
    db "        _`ab        ", $00
    db "        cdef        ", $00
    db "        ghij        ", $00
    db "              ", $03, "     ", $00
    db "    PROGRAMACION    ", $00
    db $00
    db "     ANDY COATES    ", $04
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $bb, $bc, $bd, $be, "        ", $00
    db "        ", $bf, $c0, $c1, $c2, "        ", $00
    db "        ", $c3, $c4, $c5, $c6, "        ", $00
    db "        ", $c7, $c8, $c9, $ca, "        ", $00
    db "        ", $03, "           ", $00
    db "      GRAFICOS      ", $00
    db $00
    db "   MARCUS STRINGER  ", $04
    db $00, $00, $00
    db "        ", $9b, $9c, $9d, $9e, "        ", $00
    db "        ", $9f, $a0, $a1, $a2, "        ", $00
    db "        ", $a3, $a4, $a5, $a6, "        ", $00
    db "        ", $a7, $a8, $a9, $aa, "        ", $00
    db "   ", $03, "                ", $00
    db "  MUSICA", $0a, " SONIDO Y  ", $00
    db "  EFECTOS DE SONIDO ", $04
    db $00
    db "      AUDIOARTS     ", $04
    db $00, $00, $00
    db "        klmn        ", $00
    db "        opqr        ", $00
    db "        stuv        ", $00
    db "        wxyz        ", $00
    db "             ", $03, "      ", $04
    db "   PROGRAMACION DE  ", $04
    db "     UTILIDADES     ", $00
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db $00, $00, $00
    db "        ", $db, $dc, $dd, $de, "        ", $00
    db "        ", $df, $e0, $e1, $e2, "        ", $00
    db "        ", $e3, $e4, $e5, $e6, "        ", $00
    db "        ", $e7, $e8, $e9, $ea, "        ", $00
    db "      ", $05, "             ", $04
    db "  DISENO DE NIVELES ", $04
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db "   MARCUS STRINGER  ", $04
    db "     ANDY COATES    ", $04
    db "   ANATOLE BRANCH   ", $00
    db $00, $00, $00
    db "        ", $8b, $8c, $8d, $8e, "        ", $00
    db "        ", $8f, $90, $91, $92, "        ", $00
    db "        ", $93, $94, $95, $96, "        ", $00
    db "        ", $97, $98, $99, $9a, "        ", $00
    db $00
    db "  EQUIPO DE PRUEBAS ", $04
    db $00
    db "   CLIVE TOWNSEND   ", $00
    db "     ANDY COATES    ", $04
    db "   MARCUS STRINGER  ", $04
    db "   ANATOLE BRANCH   ", $00
    db "   JONATHAN ROGERS  ", $04
    db "   LEE PERRY", $09, "SMITH  ", $04
    db "     ROB WILSON     ", $00
    db "     CHRISTOPHE     ", $00
    db "   KEIRAN MCMILLAN  ", $04
    db "   ANYA AND WAYNE   ", $00
    db "    RACHEL COOPER   ", $04
    db "    DONNA HARRIS    ", $00
    db "        JARV        ", $00
    db "    NICK GUNNING    ", $00
    db $00, $00, $00
    db "        ", $7b, "|", $7d, "~        ", $00
    db "        ", $7f, $80, $81, $82, "        ", $00
    db "        ", $83, $84, $85, $86, "        ", $00
    db "        ", $87, $88, $89, $8a, "        ", $00
    db $00
    db "     APOYO MORAL    ", $04
    db $00
    db "  MERYLS SANDWICHES ", $04
    db "    HELEN COATES    ", $00
    db "     MINI MORRIS    ", $04
    db "     RUTH BAKER     ", $00
    db "  LINDSAY KERNOHAN  ", $00
    db "   KAREN KERNOHAN   ", $00
    db "     RON AND KAF    ", $04
    db "     SUNNY MOLLY    ", $04
    db "   TESSA AND SIMON  ", $04
    db "        KATIE       ", $04
    db $00, $00, $00, $00
    db "  A PUKKA GAMES LE  ", $00
    db "        ", $03, "           ", $00
    db "  GUSTARIA DAR LAS  ", $00
    db $00
    db "   GRACIAS A TODO   ", $00
    db $00
    db "      EL MUNDO", $0a, "     ", $00
    db $00, $00
    db "             ", $03, "      ", $00
    db "     PERO SERIA     ", $00
    db $00
    db "    INTERMINABLE    ", $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $ff

    db $09, $09, $09, $0f, $0f, $08, $0f, $0c, $0f, $09, $09, $0c, $0d, $0d, $0d, $08
    db $08, $09, $09, $09, $09, $0e, $09, $08, $08, $08, $08, $0c, $0c, $0c, $0c, $0c
    db $0d, $0d, $0d, $0d, $0d, $08, $0e, $09, $09, $09, $09, $0e, $08, $08, $08, $0c
    db $0c, $0c, $08, $0e, $0e, $0a, $0a, $0d, $0d, $0e, $0e, $0e, $0f, $0f, $0f, $0e
    db $0e, $0e, $0c, $0c, $0c, $0c, $0f, $08, $0e, $0a, $0a, $0d, $0d, $0e, $0e, $0e
    db $0f, $0f, $0f, $0e, $09, $0e, $0e, $0c, $0c, $0f, $0f, $0f, $0e, $0e, $0d, $0d
    db $0d, $0b, $0b, $0b, $0f, $0f, $08, $08, $08, $08, $0c, $0c, $0c, $0f, $0f, $0f
    db $08, $0f, $0b, $0b, $0b, $0b, $0b, $0f, $0f, $0f, $09, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $0b, $0b, $0b, $0b, $0b, $0c, $0b, $08, $08, $09, $09, $09
    db $08, $0c, $0c, $08, $08, $08, $08, $08, $0b, $0b, $0b, $0b, $0c, $0c, $0e, $08
    db $08, $09, $09, $01, $01, $04, $04, $00, $00, $00, $00, $01, $03, $00, $00, $01
    db $04, $06, $06, $06, $06, $01, $01, $01, $01, $01, $00, $00, $00, $00, $01, $01
    db $01, $00, $03, $03, $06, $06, $06, $06, $06, $07, $01, $01, $02, $01, $00, $00
    db $07, $07, $01, $01, $01, $03, $03, $03, $07, $07, $00, $06, $06, $00, $00, $00
    db $01, $01, $00, $00, $07, $07, $07, $07, $07, $03, $03, $03, $07, $07, $00, $00
    db $00, $00, $00, $00, $00, $01, $04, $03, $07, $07, $03, $07, $07, $00, $00, $03
    db $00, $00, $00, $05, $00, $00, $06, $01, $02, $04, $04, $04, $01, $07, $07, $07
    db $07, $00, $00, $03, $03, $00, $05, $05, $05, $06, $06, $02, $02, $04, $04, $04
    db $07, $07, $07, $04, $04, $00, $00, $00, $00, $00, $05, $05, $05, $06, $06, $00
    db $00, $00, $07, $06, $06, $06, $00, $04, $04, $00, $00, $00, $02, $01, $06, $06
    db $06, $06, $06, $00, $00, $06, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00
    db $06, $06, $06, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00

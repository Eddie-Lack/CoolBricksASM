; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

Palettes_MainMenu:
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $4a, $29, $73, $4e, $bd, $77
    db $00, $00, $00, $41, $6f, $6e, $f9, $7f, $00, $00, $40, $01, $08, $16, $6f, $37
    db $00, $00, $d1, $00, $1b, $02, $9e, $17, $00, $00, $0f, $54, $b9, $71, $3d, $77
    db $00, $00, $e1, $3c, $08, $16, $ff, $7f, $00, $00, $11, $00, $19, $21, $1f, $42
    db $00, $00, $00, $41, $6f, $6e, $f9, $7f, $00, $00, $00, $48, $ef, $6d, $75, $7f
    db $00, $00, $65, $29, $6b, $36, $d9, $3e, $00, $00, $91, $1c, $70, $41, $5a, $77
    db $00, $00, $13, $19, $17, $2a, $3c, $4f, $00, $00, $e6, $29, $cd, $5a, $79, $67
    db $00, $00, $0a, $15, $f2, $35, $98, $4a, $00, $00, $08, $21, $31, $46, $5a, $6b

    db $ff, $7f, $00, $00, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f
    db $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f
    db $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f

Palettes_HighScores:
    db $00, $00, $0d, $00, $16, $00, $5f, $00, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $40, $01, $08, $16, $6f, $37
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $0f, $54, $b9, $71, $3d, $77
    db $00, $00, $e1, $3c, $08, $16, $ff, $7f, $00, $00, $0d, $00, $19, $21, $1f, $42
    db $00, $00, $0f, $54, $b9, $71, $3d, $77, $00, $00, $00, $48, $ef, $6d, $75, $7f
    db $00, $00, $65, $29, $6b, $36, $d9, $3e, $00, $00, $91, $1c, $70, $41, $5a, $77
    db $00, $00, $13, $19, $17, $2a, $3c, $4f, $00, $00, $e6, $29, $cd, $5a, $79, $67
    db $00, $00, $0a, $15, $f2, $35, $98, $4a, $00, $00, $08, $21, $31, $46, $5a, $6b

Palettes_TitleScreen:
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $4a, $29, $73, $4e, $bd, $77
    db $00, $00, $00, $41, $6f, $6e, $f9, $7f, $00, $00, $40, $01, $08, $16, $6f, $37
    db $00, $00, $d1, $00, $1b, $02, $ff, $17, $00, $00, $0f, $54, $b9, $71, $3d, $77
    db $00, $00, $e1, $3c, $08, $16, $ff, $7f, $00, $00, $11, $00, $19, $21, $1f, $42
    db $00, $00, $00, $41, $6f, $6e, $f9, $7f, $00, $00, $d1, $00, $1b, $02, $ff, $17
    db $ff, $7f, $00, $00, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f
    db $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f
    db $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f

Palettes_GameOver:
    db $00, $00, $0d, $00, $14, $00, $1f, $00, $0e, $00, $55, $01, $5b, $02, $bf, $03
    db $00, $00, $2e, $01, $d6, $01, $1f, $03, $00, $00, $6b, $01, $92, $02, $98, $03
    db $00, $00, $80, $41, $66, $52, $60, $73, $00, $00, $ea, $34, $10, $5a, $5c, $7f
    db $00, $00, $8a, $34
    db $10
    db $59, $1c, $7e, $15, $00, $15, $00, $15, $00, $15, $00, $00, $18, $15, $00, $15
    db $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15
    db $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00

Palettes_Pause:
    db $00, $00, $00, $28, $00, $50, $00, $7c, $0e, $00, $55, $01, $5b, $02, $bf, $03
    db $00, $00, $2e, $01, $d6, $01, $1f, $03, $00, $00, $6b, $01, $92, $02, $98, $03
    db $00, $00, $80, $41, $66, $52, $60, $73, $00, $00, $ea, $34, $10, $5a, $5c, $7f
    db $00, $00, $8a, $34, $10, $59, $1c, $7e, $15, $00, $15, $00, $15, $00, $15, $00
    db $00, $18, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00

Palettes_DeveloperLogos:
    db $00, $00, $47, $51, $2f, $7e, $99, $7f, $00, $00, $8b, $54, $d3, $75, $ff, $7f
    db $00, $24, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b

Palettes_PublisherLogo:
    db $00, $00, $05, $2d, $8f, $66, $bc, $7f, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00

Palettes_LanguageSelect:
    db $00, $00, $1f, $00, $ff, $02, $29, $25, $00, $00, $00, $00, $00, $00, $00, $00
    db $1f, $00, $ff, $7f, $20, $16, $00, $7c, $00, $00, $40, $01, $08, $16, $6f, $37
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $0f, $54, $b9, $71, $3d, $77
    db $00, $00, $e1, $3c, $08, $16, $ff, $7f, $00, $00, $0d, $00, $19, $21, $1f, $42
    db $00, $00, $0f, $54, $b9, $71, $3d, $77, $00, $00, $00, $48, $ef, $6d, $75, $7f
    db $00, $00, $65, $29, $6b, $36, $d9, $3e, $00, $00, $91, $1c, $70, $41, $5a, $77
    db $00, $00, $13, $19, $17, $2a, $3c, $4f, $00, $00, $e6, $29, $cd, $5a, $79, $67
    db $00, $00, $0a, $15, $f2, $35, $98, $4a, $00, $00, $4a, $29, $52, $4a, $39, $67

Palettes_LevelPassword:
    db $00, $00, $0f, $54, $b9, $71, $3d, $77, $00, $00, $00, $48, $ef, $6d, $75, $7f
    db $00, $00, $6c, $18, $d2, $2c, $5e, $3e, $00, $00, $c4, $38, $2c, $26, $ff, $7f
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $1f, $7c, $1f, $7c, $1f, $7c, $1f, $7c
    db $1f, $7c, $1f, $7c, $1f, $7c, $1f, $7c, $1f, $7c, $1f, $7c, $1f, $7c, $1f, $7c
    db $00, $00, $00, $48, $ef, $6d, $75, $7f, $00, $00, $22, $01, $6c, $02, $fb, $23
    db $00, $00, $20, $01, $8c
    db $26, $f2, $57, $00, $00, $51, $01, $38, $16, $9e, $17, $00, $00, $60, $2d, $40
    db $5e, $b0, $7f, $00, $00, $0d, $34, $15, $54, $3f, $7e, $00, $00, $8c, $44, $17
    db $7e, $bf, $7f, $00, $00, $0c, $00, $1f, $00, $5f, $52

Palettes_Ending:
    db $00, $00, $0c, $00, $11
    db $00, $1a, $00, $00, $00, $20, $01, $20, $02, $60, $03
    db $00, $00, $2e, $01, $d6, $01, $1f, $03, $00, $00, $07, $11, $cd, $1d, $b4, $2e
    db $00, $00, $20, $35, $26, $52, $00, $73, $00, $00, $04, $19, $28, $32, $4d, $4f
    db $00, $00, $8a, $34
    db $10
    db $59, $1c, $7e, $00, $00, $00, $34, $00, $50, $00, $7c, $00, $18, $15, $00, $15
    db $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15
    db $00, $15, $00
    db $15
    db $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00
    db $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00, $15, $00

Palettes_Copyright:
    db $00, $00, $47, $51, $2f, $7e, $99, $7f, $00, $00, $67, $38, $d3, $75, $ff, $7f
    db $00, $00, $00, $41, $6f, $6e, $f9, $7f, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $00, $00, $d1, $00, $1b, $02, $9e, $17, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b
    db $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b, $de, $7b

    db $00, $00, $0f, $54, $b9, $71, $3d, $77, $00, $00, $00, $48, $ef, $6d, $75, $7f
    db $00, $00, $6c, $18, $d2, $2c, $5e, $3e, $00, $00, $c4, $38, $2c, $26, $ff, $7f
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $1f, $7c, $1f, $7c, $1f, $7c, $1f, $7c
    db $1f, $7c, $1f, $7c, $1f, $7c, $1f, $7c, $1f, $7c, $1f, $7c, $1f, $7c, $1f, $7c
    db $00, $00, $00, $48, $ef, $6d, $75, $7f, $00, $00, $22, $01, $6c, $02, $fb, $23
    db $00, $00, $20, $01, $8c
    db $26, $f2, $57, $00, $00, $51, $01, $38, $16, $9e, $17, $00, $00, $60, $2d, $40
    db $5e, $b0, $7f, $00, $00, $0d, $34, $15, $54, $3f, $7e, $00, $00, $8c, $44, $17
    db $7e, $bf, $7f, $00, $00, $0c, $00, $1f, $00, $5f, $52

LevelSpritePalettes:
    db $00, $00, $4a, $00, $19, $02, $9e, $17, $00, $00, $00, $00, $f1, $49, $ff, $7f
    db $00, $00, $00, $00, $d2, $2c, $5e, $3e, $00, $00, $c4, $38, $2c, $26, $ff, $7f
    db $00, $00, $17, $00, $19, $02, $9e, $03, $00, $00, $00, $00, $84, $7c, $60, $7e
    db $00, $00, $00, $00, $17, $00, $ff, $7f, $00, $00, $c0, $00, $80, $02, $f3, $4f

LevelPalette_4670:
    db $00, $00, $0e, $00, $15, $01, $7f, $02, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $00, $00, $06, $00, $8b, $00, $13, $01, $00, $00, $c0, $00, $a6, $0d, $33, $43
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $15, $54, $bf, $7d, $1f, $7f
    db $00, $00, $00, $60, $ef, $7d, $f5, $7f, $00, $00, $17, $00, $1b, $21, $7f, $4e

LevelPalette_46b0:
    db $80, $01, $00, $00, $ff, $7f, $f4, $03, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $f4, $03, $f4, $03, $f4, $03, $f4, $03, $00, $00, $c0, $00, $a6, $0d, $33, $43
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $17, $00, $fa, $1c, $7f, $4e
    db $00, $00, $65, $49, $8e, $62, $50, $7b, $00, $00, $87, $00, $ed, $00, $72, $01

LevelPalette_46f0:
    db $a0, $01, $60, $14, $ff, $7f, $f4, $03, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $f4, $03, $f4, $03, $f4, $03, $f4, $03, $00, $00, $c0, $00, $a6, $0d, $33, $43
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $00, $3c, $22, $41, $26, $46
    db $00, $00, $00, $60, $ef, $7d, $f5, $7f, $00, $00, $46, $00, $ad, $00, $94, $01

LevelPalette_4730:
    db $a0, $01, $60, $14, $ff, $7f, $f4, $03, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $f4, $03, $f4, $03, $f4, $03, $f4, $03, $00, $00, $17, $00, $fa, $1c, $7f, $4e
    db $00, $00, $45, $01, $4e, $02, $d3, $3f, $00, $00, $a8, $21, $92, $4b, $97, $5f
    db $00, $00, $46, $11, $8d, $26, $f4, $3f, $00, $00, $ac, $25, $2e, $32, $d2, $3e

LevelPalette_4770:
    db $a0, $01, $60, $14, $ff, $7f, $f4, $03, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $f4, $03, $f4, $03, $f4, $03, $f4, $03, $00, $00, $57, $61, $be, $7e, $bf, $73
    db $00, $00, $e0, $3c, $c1, $69, $a5, $7e, $00, $00, $80, $18, $40, $35, $e0, $55
    db $00, $00, $00, $60, $ef, $7d, $f5, $7f, $00, $00, $17, $00, $1b, $21, $7f, $4e

LevelPalette_47b0:
    db $80, $01, $00, $00, $ff, $7f, $f4, $03, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $f4, $03, $f4, $03, $f4, $03, $f4, $03, $00, $00, $cf, $00, $bf, $09, $bf, $3a
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $15, $54, $9d, $79, $1f, $7f
    db $00, $00, $00, $60, $ef, $7d, $f5, $7f, $00, $00, $17, $00, $1b, $21, $7f, $4e

LevelPalette_47f0:
    db $a0, $01, $60, $14, $ff, $7f, $f4, $03, $00, $00, $08, $21, $31, $46, $5a, $6b
    db $f4, $03, $f4, $03, $f4, $03, $f4, $03, $00, $00, $e0, $3c, $c1, $69, $a5, $7e
    db $00, $00, $ad, $00, $d7, $01, $9e, $17, $00, $00, $80, $18, $40, $35, $e0, $55
    db $00, $00, $00, $60, $ef, $7d, $f5, $7f, $00, $00, $17, $00, $1b, $21, $7f, $4e

BrickPalette_4830:
    db $00, $00, $ef
    db $10
    db $5a, $3e, $5d, $67, $00, $00, $cc, $0c, $d5, $31, $75, $4a

BrickPalette_4840:
    db $00, $00, $13, $00, $38, $01, $1f, $03, $00, $00, $0d, $00, $f1, $00, $57, $02

BrickPalette_4850:
    db $00, $00, $c0, $01, $11, $03, $ff, $03, $00, $00, $e0, $00, $e8, $01, $f3, $02

BrickPalette_4860:
    db $00, $00, $0e, $38, $78, $61, $df, $7e, $00, $00, $0a, $28, $0f, $3d, $f7, $5d

    db $00, $00, $4b, $25, $36, $3a, $9f, $67, $00, $00, $c8, $18, $4e, $25, $77, $4a

BrickPalette_4880:
    db $00, $00, $4b, $01, $36, $02, $9f, $03, $00, $00, $c8, $00, $4e, $01, $77, $02

BrickPalette_4890:
    db $00, $00, $40, $25, $20, $3a, $80, $67, $00, $00, $c0, $18, $40, $25, $60, $4a

BrickPalette_48a0:
    db $00, $00, $00, $58, $20, $61, $a0, $7e, $00, $00, $00, $34, $e0, $44, $c0, $5d

BrickPalette_48b0:
    db $00, $00, $8b, $08, $75, $19, $df, $3a, $00, $00, $28, $00, $d0, $0c, $b5, $15

BrickPalette_48c0:
    db $00, $00, $04, $10, $0a, $28, $0f, $3c, $00, $00, $02, $08, $05, $14, $07, $1c

BrickPalette_48d0:
    db $00, $00, $00, $10, $00, $28, $00, $3c, $00, $00, $00, $08, $00, $14, $00, $1c

BrickPalette_48e0:
    db $00, $00, $00, $0c, $00, $18, $00
    db $2c, $00, $00, $00, $04, $00, $10, $00, $1c

BrickPalette_48f0:
    db $00, $00, $84
    db $10
    db $4a, $29, $ef, $3d, $00, $00, $42, $08, $a5, $14, $e7, $1c

BrickPalette_4900:
    db $00, $00, $00, $0c
    db $00, $18, $00
    db $2c, $00, $00, $00, $04, $00, $10, $00, $1c

BrickPalette_4910:
    db $00, $00, $07, $00, $0d, $00, $12
    db $00, $00, $00, $05, $00, $08, $00, $0b, $00

BrickPalette_4920:
    db $00, $00, $03, $0d, $06, $1a, $2a
    db $2b, $00, $00, $61, $04, $e2, $08, $64, $11

BrickPalette_4930:
    db $00, $00, $0a, $01, $14, $02, $3f
    db $03, $00, $00, $64, $00, $0a, $01, $8f, $01

BrickPalette_4940:
    db $00, $00, $e0, $00, $0d, $01, $d2
    db $01, $00, $00, $80, $00, $a8, $00, $2b, $01

BrickPalette_4950:
    db $00, $00, $c0, $1c, $05, $35, $a8
    db $49, $00, $00, $60
    db $10
    db $a2, $24, $25, $35

BrickPalette_4960:
    db $00, $00, $c0, $0c, $05, $11, $ac, $21, $00, $00, $60, $08
    db $a2, $08, $26, $19

BrickPalette_4970:
    db $00, $00, $0b, $15, $6b, $29, $74, $46, $00, $00, $66, $08
    db $e7, $14, $cf, $31

BrickPalette_4980:
    db $00, $00, $ab, $14, $4e, $00, $34, $15, $00, $00, $06, $00
    db $28, $00
    db $ad, $04

BrickPalette_4990:
    db $00, $00, $48, $20, $6c, $24, $31, $39, $00, $00, $45, $14, $07, $14
    db $cb, $28

BrickPalette_49a0:
    db $00, $00, $c9, $00, $0a, $01, $56, $22, $00, $00, $67, $00, $a7, $00
    db $4d, $11

BrickPalette_49b0:
    db $00, $00, $40, $01, $60, $01, $06, $01, $00, $00, $80, $00, $a0, $00
    db $83, $00

; Four sprite frames (small to large) for a ball thrown by the blob, at byte offsets $00, $0d, $22 and $3b as stored in the throw arc tables.
BallProjectileFrames:
    db $fe, $fe, $06, $0a, $06, $06, $06, $0a, $01, $00, $00, $39, $0b, $fe
    db $fe, $06, $0a, $06, $06, $06, $0a, $03, $ff, $ff, $36, $0b, $ff, $07, $37, $0b
    db $07, $ff, $38, $0b, $fe, $fe, $06, $0a, $06, $06, $06, $0a, $04
    db $fc
    db $fc

    db $32, $0b
    db $fc
    db $04, $33, $0b, $04
    db $fc
    db $34, $0b, $04, $04, $35, $0b, $fe, $fe, $06, $0a, $06, $06
    db $06, $0a, $04
    db $fc
    db $fc
    db $2e, $0b
    db $fc
    db $04, $2f, $0b, $04
    db $fc
    db $30, $0b, $04, $04, $31, $0b

; Four sprite frames (small to large) for a flying grenade, in the same layout and at the same offsets ($00, $0d, $22, $3b) as BallProjectileFrames.
GrenadeProjectileFrames:
    db $fe, $fe, $06, $0a, $06, $06, $06, $0a, $01, $00
    db $00, $41, $0f, $fe, $fe, $06, $0a, $06, $06, $06, $0a, $03, $ff, $ff, $3e, $0f
    db $ff, $07, $3f, $0f, $07, $ff, $40, $0f, $fe, $fe, $06, $0a, $06, $06, $06, $0a
    db $04
    db $fc
    db $fc
    db $3a, $0f
    db $fc
    db $04, $3b, $0f, $04
    db $fc
    db $3c, $0f, $04, $04, $3d, $0f, $fe, $fe, $06, $0a, $06, $06, $06, $0a, $04
    db $fc
    db $fc
    db $59, $0f
    db $fc
    db $04, $5a, $0f, $04
    db $fc
    db $5b, $0f, $04, $04, $5c, $0f

; Thirteen sprite frames of the grenade explosion, each a sprite count followed by 4 bytes (Y offset, X offset, tile, attribute) per sprite.
GrenadeExplosionFrames:
    db $01, $00, $00, $42, $0c, $04
    db $fc
    db $fc
    db $4c, $0c
    db $fc
    db $04, $4d, $0c, $04
    db $fc
    db $52, $0c, $04, $04, $53, $0c, $04
    db $fc
    db $fc
    db $4e, $0c
    db $fc
    db $04, $4f, $0c, $04
    db $fc
    db $54, $0c, $04, $04, $55, $0c, $04
    db $fc
    db $fc
    db $50, $0c
    db $fc
    db $04, $51, $0c, $04
    db $fc
    db $56, $0c, $04, $04, $57, $0c, $04, $f9, $f9, $43, $0c, $f9, $04, $44, $0c, $04
    db $f9, $45, $0c, $04, $04, $46, $0c, $04, $f9, $f9, $44, $0c, $f9, $04, $45, $0c
    db $04, $f9, $46, $0c, $04, $04, $47, $0c, $04, $f9, $f9, $45, $0c, $f9, $04, $46
    db $0c, $04, $f9, $47, $0c, $04, $04, $48, $0c, $04, $f9, $f9, $46, $0c, $f9, $04
    db $47, $0c, $04, $f9, $48, $0c, $04, $04, $49, $0c, $04, $f9, $f9, $47, $0c, $f9
    db $04, $48, $0c, $04, $f9, $49, $0c, $04, $04, $4a, $0c, $04, $f9, $f9, $48, $0c
    db $f9, $04, $49, $0c, $04, $f9, $4a, $0c, $04, $04, $4b, $0c, $03, $f9, $f9, $49
    db $0c, $f9, $04, $4a, $0c, $04, $f9, $4b, $0c, $02, $f9, $f9, $4a, $0c, $f9, $04
    db $4b, $0c, $01, $f9, $f9, $4b, $0c

; For each value of the grenade explosion timer (51 down to 1), the byte offset of the frame to draw in GrenadeExplosionFrames.
GrenadeExplosionSequence:
    db $b4
    db $b4, $b4, $b4, $ab, $ab, $ab, $ab, $9e, $9e, $9e, $9e, $8d, $8d, $8d, $8d, $7c
    db $7c, $7c, $7c, $6b, $6b, $6b, $6b, $5a, $5a, $5a, $5a, $49, $49, $49, $49, $38
    db $38, $38, $38, $27, $27, $27, $27, $16, $16, $16, $16, $05, $05, $05, $05, $00
    db $00, $00, $00

ThrowPath_4b55:
    db $00
    db $00, $00, $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d
    db $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22
    db $22, $22, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22, $22, $22, $22
    db $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d
    db $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $00, $00, $00, $00, $00, $00

ThrowPath_4bc5:
    db $00, $00, $00, $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d
    db $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22
    db $22, $22, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22
    db $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d
    db $0d, $0d, $00, $00, $00, $00, $00, $00

ThrowPath_4c2d:
    db $00
    db $00, $00, $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d
    db $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22
    db $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d
    db $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $00, $00, $00, $00, $00, $00

ThrowPath_4c8d:
    db $00
    db $00, $00, $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d
    db $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $22

ColorOnlyData_001_4ca8:
    db $22, $22, $22, $22, $22, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22, $22, $22, $22, $22, $22, $22, $22, $22
    db $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d
    db $0d, $00, $00, $00, $00, $00, $00

ThrowPath_4ce5:
    db $00, $00, $00, $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $22
    db $22, $22, $22, $22, $22, $22, $22, $22, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22, $22, $22, $22, $22, $22, $22, $22
    db $22, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $00, $00, $00, $00, $00, $00

ThrowPath_4d35:
    db $00
    db $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22
    db $22, $22, $22, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $22, $22, $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d
    db $0d, $0d, $0d, $00, $00, $00, $00

ThrowPath_4d7d:
    db $00
    db $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22
    db $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d, $0d, $00, $00, $00

ThrowPath_4dbd:
    db $00
    db $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22, $22, $22, $22, $22, $22, $22, $0d, $0d
    db $0d, $0d, $0d, $0d, $00, $00, $00

ThrowPath_4df5:
    db $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b, $3b
    db $22, $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d, $0d, $00, $00, $00

ThrowPath_4e25:
    db $00
    db $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $3b
    db $3b, $3b, $3b, $3b, $3b, $3b, $3b, $22, $22, $22, $22, $22, $22, $22, $0d, $0d
    db $0d, $0d, $0d, $0d, $00, $00, $00

ThrowPath_4e4d:
    db $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22
    db $3b, $22, $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d, $0d, $00, $00
    db $00

; Flight path of $24 frames, one byte per frame: used for the blob's throw to the right and as the longest bounce path after a projectile hits a brick.
ThrowPath_4e6e:
    db $00
    db $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $3b
    db $3b, $3b, $3b, $22, $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d, $0d
    db $00, $00, $00

; Arc table for a projectile that came down on a brick with Y from $6d to $71 and flies on for 32 more frames: one byte per remaining frame giving the frame offset ($00, $0d or $22) into BallProjectileFrames or GrenadeProjectileFrames.
ProjectileBounceArc_1:
    db $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22
    db $22, $22, $22, $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d, $0d, $00, $00, $00

; Arc table for a projectile that came down on a brick with Y from $72 to $76 and flies on for 28 more frames: one frame offset into the projectile sprite frames per remaining frame.
ProjectileBounceArc_2:
    db $00, $00, $00, $0d, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $22
    db $22, $22, $22, $22, $0d, $0d, $0d, $0d, $0d, $00, $00, $00

; Arc table for a projectile that came down on a brick with Y from $77 to $7b and flies on for 24 more frames: one frame offset into the projectile sprite frames per remaining frame.
ProjectileBounceArc_3:
    db $00, $00, $00, $0d
    db $0d, $0d, $0d, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $0d, $0d, $0d
    db $0d, $00, $00, $00

; Arc table for a projectile that came down on a brick with Y from $7c to $80 and flies on for 20 more frames: one frame offset into the projectile sprite frames per remaining frame.
ProjectileBounceArc_4:
    db $00, $00, $0d, $0d, $0d, $0d, $22, $22, $22, $22, $22, $22
    db $22, $22, $0d, $0d, $0d, $0d, $00, $00

; Arc table for a projectile that came down on a brick with Y from $81 to $85 and flies on for 16 more frames: one frame offset into the projectile sprite frames per remaining frame.
ProjectileBounceArc_5:
    db $00, $00, $0d, $0d, $0d, $22, $22, $22
    db $22, $22, $22, $0d, $0d, $0d, $00, $00

; Arc table for a projectile that came down on a brick with Y from $86 to $8a and flies on for 12 more frames: one frame offset into the projectile sprite frames per remaining frame.
ProjectileBounceArc_6:
    db $00, $0d, $0d, $22, $22, $22, $22, $22
    db $22, $0d, $0d, $00

; Arc table for a projectile that came down on a brick with Y of $8b or more and flies on for 8 more frames: one frame offset into the projectile sprite frames per remaining frame.
ProjectileBounceArc_7:
    db $00, $0d, $22, $22, $22, $22, $0d, $00

BlobThrowDirections_Upper:
    db $04

    db $1c
    db $01, $1f, $02

    db $1d

    db $03
    db $1e

BlobThrowDirections_Lower:
    db $14

    db $14

    db $15, $15, $0c

    db $0c, $0b

    db $0b

; Segment list of the blob's first move (BlobPath entry 0): one pair of (frame count, direction index into BallVelocityTable) ending with 0. Every blob move runs at half the table speed, because UpdateEnemyPath halves each step.
BlobPathSegments_1:
    db $78, $08, $00

; Segment list of one of the blob's two looping moves: six pairs of (frame count, direction index into BallVelocityTable) ending with 0.
BlobPathSegments_2:
    db $8c, $08, $46, $0d, $46, $13, $8c, $18, $46, $1d, $46, $03, $00

; Segment list of the blob's other looping move, the same as BlobPathSegments_2 with the diagonal directions swapped: six pairs of (frame count, direction index) ending with 0.
BlobPathSegments_3:
    db $8c, $08, $46, $13, $46, $0d, $8c, $18, $46, $03, $46, $1d, $00

BlobPath:
    db $01, $01
    dw BlobPathSegments_1
    db $02, $02
    dw BlobPathSegments_2
    db $01, $01
    dw BlobPathSegments_3

BlobSprites:
    db $00, $00, $5f, $00, $00, $08, $60, $00, $08, $00, $67, $00, $08, $08, $68, $00
    db $00, $00, $61, $00, $00, $08, $62, $00, $08, $00, $69, $00, $08, $08, $6a, $00

    db $00, $00, $63, $00, $00, $08, $64, $00, $08, $00, $6b, $00, $08, $08, $6c, $00
    db $00, $00, $65, $00, $00, $08, $66, $00, $08, $00, $6d, $00, $08, $08, $6e, $00

BlobSprites_Ghost:
    db $00, $00, $16, $08, $00, $08, $17, $08, $08, $00, $1e, $08, $08, $08, $1f, $08
    db $00, $00, $18, $08, $00, $08, $19, $08, $08, $00, $20, $08, $08, $08, $21, $08
    db $00, $00, $1a, $08, $00, $08, $1b, $08, $08, $00, $22, $08, $08, $08, $23, $08
    db $00, $00, $1c, $08, $00, $08, $1d, $08, $08, $00, $24, $08, $08, $08, $25, $08

BlobSprites_Throwing:
    db $00, $00, $26, $08, $00, $08, $27, $08, $08, $00, $28, $08, $08, $08, $29, $08
    db $00, $00, $2a, $08, $00, $08, $2b, $08, $08, $00, $2c, $08, $08, $08, $2d, $08

UfoSprites:
    db $00, $00, $4e, $02, $00, $08, $4f, $01, $00
    db $10
    db $50, $05, $f8, $04, $52, $02, $f8, $0c

; Effect number and score units for each UFO hit. The first two bytes ($53, $05) are not a score pair. UpdateUfo reads 20 bytes from UfoSprites, which has only 18, so they serve as the tile and attribute of the fifth UFO sprite. UfoHit adds 2 x the hit count after the increment (1 to 5), so the real pairs start 2 bytes in.
UfoHitScores:
    db $53, $05, $01, $0a, $02, $0f, $03, $14
    db $04, $19, $05, $32

; UFO passes, 8 entries of (wait, side). The side is that of the pass that is starting (0 = rightward, 1 = leftward). The wait is loaded into wUfoWaitTimer when the pass starts, so it is the pause before the next pass. The first pass uses entry 1, and entry 0 is used by the 8th pass.
UfoPassTable:
    db $f5, $00
    db $80, $00

    db $c8, $01, $32, $00, $e6, $01, $0a, $00, $be, $01, $64, $01

; Empties all 8 slots of wFallingPowerups, so no power-up is falling.
; Called when a level is set up.
ClearFallingPowerups:
    ld hl, wFallingPowerups
    ld c, $08
    xor a

.clearSlotLoop:
    ld [hl], a
    ld de, $000c
    add hl, de
    dec c
    jr nz, .clearSlotLoop

    ret

; Release the power-up of the brick that was just hit.
; Only runs when the power-up id (wHitPowerupId) is not 0 and the brick now has exactly 1 hit point.
; Random, Triple ball and Clock ids can change type here; see RESEARCH.md.
SpawnPowerup:
    ld a, [wHitPowerupId]
    or a
    ret z

    ld a, [wHitBrickValue]
    dec a
    ret nz

    push hl
    push de
    ld hl, wFallingPowerups
    ld de, $000c

.findFreeSlot:
    ld a, [hl]
    or a
    jr z, .slotFound

    add hl, de
    jr .findFreeSlot

.slotFound:
    inc a
    ld [hl+], a
    dec c
    ld e, c
    ld a, b
    sla c
    rla
    sla c
    rla
    sla c
    rla
    and $1f
    sla a
    sla a
    sla a
    add $10
    ld [hl+], a
    ld a, e
    and $1f
    sla a
    sla a
    sla a
    add $08
    ld [hl+], a
    ld a, [wHitPowerupId]
    dec a
    cp $10
    jr nz, .checkType9

    ld a, [hFrameCounter]
    and $0f
    push af
    ld a, [wLevelType]
    bit 1, a
    jr z, .subtractOffset

    ld d, $03

.subtractOffset:
    pop af
    sub d
    and $0f

.checkType9:
    cp $09
    jr nz, .checkType6

    ld d, a
    ld a, [wBallCount]
    or a
    jr z, .type9Resolved

    dec a
    jr z, .type9Resolved

    ld d, $00

.type9Resolved:
    ld a, d

.checkType6:
    cp $06
    jr nz, .checkType17

    ld d, a
    ld a, [wWeaponFlag]
    or a
    jr nz, .type6Resolved

    ld d, a

.type6Resolved:
    ld a, d

.checkType17:
    cp $11
    jr nz, .storeType

    ld a, $06

.storeType:
    ld [hl+], a
    ld de, PowerupSprites
    add a
    add e
    ld e, a
    jr nc, .noCarry

    inc d

.noCarry:
    ld a, [de]
    inc de
    ld c, a
    ld a, [de]
    ld b, a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    ld [hl+], a
    ld a, SFX_POWERUP_SPAWN
    call PlaySound
    pop de
    pop hl
    ret

; Move the falling power-ups and run their pick-up handlers. Then count down the Sleepy ball, Ninja and Ghost timers once per frame.
UpdateFallingPowerups:
    ld hl, wFallingPowerups
    ld c, $08

.powerupLoop:
    ld a, [hl]
    or a
    jr z, .skipSlot

    push hl
    ld e, a
    inc hl
    ld a, [hl+]
    cp $a0
    jr c, .onScreen

.removePowerup:
    xor a
    pop hl
    ld [hl], a
    jr .skipSlot

.onScreen:
    ld d, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    add a
    call CheckPowerupCaught
    jr nz, .removePowerup

    ld a, h
    ld hl, PowerupFallSpeeds
    add l
    ld l, a
    jr nc, .noCarry

    inc h

.noCarry:
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld de, $000b
    add hl, de
    jr .nextPowerup

.skipSlot:
    ld de, $000c
    add hl, de

.nextPowerup:
    dec c
    jr nz, .powerupLoop

    ld a, [wSleepyBallActive]
    or a
    jr z, .updateNinjaTimer

    ld a, [wBallEffectTick]
    inc a
    ld [wBallEffectTick], a
    and $01
    jr nz, .updateNinjaTimer

    ld a, [wBallEffectTimer]
    dec a
    ld [wBallEffectTimer], a
    jr nz, .updateNinjaTimer

    ld [wSleepyBallActive], a

.updateNinjaTimer:
    ld a, [wNinjaActive]
    or a
    jr z, .updateGhostTimer

    ld a, [wBallEffectTick]
    inc a
    ld [wBallEffectTick], a
    and $01
    jr nz, .updateGhostTimer

    ld a, [wBallEffectTimer]
    dec a
    ld [wBallEffectTimer], a
    jr nz, .updateGhostTimer

    ld [wNinjaActive], a

.updateGhostTimer:
    ld a, [wGhostActive]
    or a
    ret z

    ld a, [wGhostTick]
    inc a
    ld [wGhostTick], a
    and $07
    ret nz

    ld a, [wGhostTimer]
    dec a
    ld [wGhostTimer], a
    ret nz

    ld [wGhostActive], a
    ld a, SFX_GHOST_END
    call PlaySound
    ret

; Test a falling power-up against the bat and jump to its handler.
CheckPowerupCaught:
    push af
    push bc
    push de
    ld l, a
    ld a, d
    add $0c
    ld d, a
    ld a, [wBatY]
    sub $08
    cp d
    jr nc, .checkRightEdge

    add $07
    cp d
    jr c, .checkRightEdge

    ld a, [wBatX]
    sub $08
    cp b
    jr nc, .checkRightEdge

    ld h, a
    ld a, [wBatWidth]
    add h
    cp b
    jr c, .checkRightEdge

.caught:
    ld a, [wBatExplosionTimer]
    or a
    jr nz, .notCaught

    ld h, $00
    ld de, PowerupHandlers
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl

.checkRightEdge:
    ld a, b
    add $0f
    ld b, a
    ld a, [wBatY]
    sub $08
    cp d
    jr nc, .notCaught

    add $07
    cp d
    jr c, .notCaught

    ld a, [wBatX]
    sub $08
    cp b
    jr nc, .notCaught

    ld h, a
    ld a, [wBatWidth]
    add h
    cp b
    jr nc, .caught

.notCaught:
    xor a
    pop de
    pop bc
    pop hl
    ret

; Slow ball power-up. Sets wSlowBallActive and clears the low nibble of byte 5 in every wBalls record.
; Switches off Sleepy ball, Antigravity and Ninja, shows the message and ends the pick-up.
Powerup_Slowball:
    ld a, [wBallCount]
    or a
    jr z, .ballsDone

    ld hl, wBalls + 5
    ld de, $0007
    ld b, a

.clearLowNibbleLoop:
    ld a, [hl]
    and $f0
    ld [hl], a
    add hl, de
    dec b
    jr nz, .clearLowNibbleLoop

.ballsDone:
    ld a, [wAntigravityActive]
    or a
    jr z, .noAntigravity

    ld [wAntigravityCancel], a

.noAntigravity:
    ld a, $01
    ld [wSlowBallActive], a
    xor a
    ld [wSleepyBallActive], a
    ld [wAntigravityActive], a
    ld [wNinjaActive], a
    ld hl, wLangTextSlowBall
    call ShowMessageBankE
    jp PowerupCollected

; Rocket bat power-up. Sets wShotReloadDelay to 30 frames and clears wLaserBat, then shows the message.
; Falls through to Powerup_ShotBatCommon.
Powerup_Rocket:
    ld a, $1e
    ld [wShotReloadDelay], a
    xor a
    ld [wLaserBat], a
    ld hl, wLangTextRocketBat
    call ShowMessageBankE

; Shared part of the Rocket and Laser bats. Sets wRocketLaserBat and clears wGrenadeCount.
; Falls through to Powerup_WeaponCommon.
Powerup_ShotBatCommon:
    ld a, $01
    ld [wRocketLaserBat], a
    xor a
    ld [wGrenadeCount], a

; Shared part of the weapon power-ups. Ends the plasma bat and sets wWeaponFlag.
; Clears the sticky, stun and reverse effects, shrinks a big bat to normal width and ends the pick-up.
Powerup_WeaponCommon:
    ld a, [wPlasmaState]
    cp $01
    jr nz, .clearBatEffects

    xor a
    ld [wPlasmaState], a

.clearBatEffects:
    xor a
    ld [wBallSticks], a
    ld [wStunActive], a
    ld [wStunWobble], a
    ld [wReverseActive], a
    inc a
    ld [wWeaponFlag], a
    ld a, [wBatWidth]
    cp $28
    jp nz, PowerupCollected

    ld a, [wBatX]
    add $04
    ld [wBatX], a
    ld a, $20
    ld [wBatWidth], a
    jp PowerupCollected

; Smiley ends the level: it sets the next game state and adds 1 to wCurrentLevel.
; Unlike CountBrickDestroyed, it does not check hStateTimer first. If the last brick has
; just been destroyed, the level number has already gone up and this adds 1 again.
; This is the "brick skip". See docs/RESEARCH.md.
Powerup_Smiley:
    ld b, $02
    ld a, [wLevelsSincePassword]
    cp $04
    jr nz, .setGameState

    call NextLevelMusic
    ld a, [wEndingSeen]
    or a
    jr nz, .setGameState

    ld b, $09

.setGameState:
    ld a, b
    ld [hGameState], a
    ld a, $0f
    ld [hStateTimer], a
    ld a, [wCurrentLevel]
    inc a
    cp $a0
    jr nz, .storeLevel

    ld a, $0d
    ld [hGameState], a
    xor a

.storeLevel:
    ld [wCurrentLevel], a
    ld b, $32
    jp PowerupCollected_AddScore

; Plasma bat power-up. Clears the rocket, laser and grenade state, shows the message, sets wPlasmaState to 1.
; Continues in Powerup_WeaponCommon without ending the plasma bat.
Powerup_Plasma:
    xor a
    ld [wRocketLaserBat], a
    ld [wLaserBat], a
    ld [wGrenadeCount], a
    ld hl, wLangTextPlasmaBat
    call ShowMessageBankE
    ld a, $01
    ld [wPlasmaState], a
    jr Powerup_WeaponCommon.clearBatEffects

; Stun bat power-up. Starts wBatEffectTimer and sets wStunActive and wStunWobble.
; Clears the sticky, weapon and reverse effects, shrinks a big bat to normal width and ends the pick-up.
Powerup_Poison:
    ld a, $50
    ld [wBatEffectTimer], a
    ld a, $03
    ld [wStunActive], a
    ld [wStunWobble], a
    xor a
    ld [wBallSticks], a
    ld [wWeaponFlag], a
    ld [wReverseActive], a
    ld hl, wLangTextStunBat
    call ShowMessageBankE
    ld a, [wBatWidth]
    cp $28
    jp nz, PowerupCollected

    ld a, [wBatX]
    add $04
    ld [wBatX], a
    ld a, $20
    ld [wBatWidth], a
    jp PowerupCollected

; Big bat power-up. Sets wBatWidth to $28 and moves wBatX 4 to the left, kept between $17 and $81.
; Clears the sticky, weapon, stun and reverse effects, shows the message and ends the pick-up.
Powerup_Milk:
    ld a, [wBatX]
    sub $04
    cp $81
    jr c, .checkLeftLimit

    ld a, $81
    jr .storeBatX

.checkLeftLimit:
    cp $17
    jr nc, .storeBatX

    ld a, $17

.storeBatX:
    ld [wBatX], a
    ld a, $28
    ld [wBatWidth], a
    xor a
    ld [wBallSticks], a
    ld [wWeaponFlag], a
    ld [wStunActive], a
    ld [wStunWobble], a
    ld [wReverseActive], a
    ld hl, wLangTextBigBat
    call ShowMessageBankE
    jp PowerupCollected

; Sleepy ball power-up. Starts wBallEffectTimer and sets wSleepyBallActive.
; Cancels Antigravity, Slow ball and Ninja, shows the message and ends the pick-up.
Powerup_Clock:
    ld a, [wAntigravityActive]
    or a
    jr z, .noAntigravity

    ld [wAntigravityCancel], a

.noAntigravity:
    ld a, $a0
    ld [wBallEffectTimer], a
    ld [wSleepyBallActive], a
    xor a
    ld [wAntigravityActive], a
    ld [wSlowBallActive], a
    ld [wNinjaActive], a
    ld hl, wLangTextSleepyBall
    call ShowMessageBankE
    jp PowerupCollected

; Antigravity ball power-up. Starts wBallEffectTimer and sets wAntigravityActive.
; Switches off Sleepy ball, Slow ball and Ninja, shows the message and ends the pick-up.
Powerup_Pepper:
    ld a, $a0
    ld [wBallEffectTimer], a
    ld [wAntigravityActive], a
    xor a
    ld [wSleepyBallActive], a
    ld [wSlowBallActive], a
    ld [wNinjaActive], a
    ld hl, wLangTextAntigravityBall
    call ShowMessageBankE
    jp PowerupCollected

; Magnetic bat power-up. Sets wBallSticks so the ball sticks to the bat.
; Clears the stun, weapon and reverse effects, shrinks a big bat to normal width and ends the pick-up.
Powerup_Magnet:
    ld a, $01
    ld [wBallSticks], a
    xor a
    ld [wStunActive], a
    ld [wStunWobble], a
    ld [wWeaponFlag], a
    ld [wReverseActive], a
    ld hl, wLangTextMagneticBat
    call ShowMessageBankE
    ld a, [wBatWidth]
    cp $28
    jp nz, PowerupCollected

    ld a, [wBatX]
    add $04
    ld [wBatX], a
    ld a, $20
    ld [wBatWidth], a
    jp PowerupCollected

; Triple ball power-up (the in-game text is "Multi ball"). Sets wMultiBallPending, which stays set until the ball splits. The split adds 2 balls to however many are in play.
; Cancels Antigravity, Sleepy ball, Slow ball and Ninja, shows the message and ends the pick-up.
Powerup_TripleBall:
    ld a, [wAntigravityActive]
    or a
    jr z, .noAntigravity

    ld [wAntigravityCancel], a

.noAntigravity:
    ld a, $01
    ld [wMultiBallPending], a
    xor a
    ld [wSleepyBallActive], a
    ld [wAntigravityActive], a
    ld [wSlowBallActive], a
    ld [wNinjaActive], a
    ld hl, wLangTextMultiBall
    call ShowMessageBankE
    jp PowerupCollected

; Extra life power-up. Adds 1 to wLives and shows the message.
; If wLives would reach 10, it stays as it is, no message is shown and the player gets a score bonus.
Powerup_ExtraLife:
    ld hl, wLangTextExtraLife
    ld a, [wLives]
    inc a
    cp $0a
    jr nz, .addLife

    ld b, $32
    jp PowerupCollected_AddScore

.addLife:
    ld [wLives], a
    call ShowMessageBankE
    jp PowerupCollected

; Laser bat power-up. Sets wShotReloadDelay to 8 frames and wLaserBat to 1, then shows the message.
; Continues in Powerup_ShotBatCommon.
Powerup_Laser:
    ld a, $08
    ld [wShotReloadDelay], a
    ld a, $01
    ld [wLaserBat], a
    ld hl, wLangTextLazerBat
    call ShowMessageBankE
    jp Powerup_ShotBatCommon

; Reverse bat power-up. Starts wBatEffectTimer and sets wReverseActive.
; Clears the stun, weapon and sticky effects, shrinks a big bat to normal width and ends the pick-up.
Powerup_Reverse:
    ld a, $50
    ld [wBatEffectTimer], a
    ld [wReverseActive], a
    xor a
    ld [wStunActive], a
    ld [wStunWobble], a
    ld [wWeaponFlag], a
    ld [wBallSticks], a
    ld hl, wLangTextReverseBat
    call ShowMessageBankE
    ld a, [wBatWidth]
    cp $28
    jr nz, PowerupCollected

    ld a, [wBatX]
    add $04
    ld [wBatX], a
    ld a, $20
    ld [wBatWidth], a
    jr PowerupCollected

; Ninja ball power-up. Starts wBallEffectTimer, sets wNinjaActive and sets wLaunchDirection to 4.
; Cancels the other ball effects, shows the message and ends the pick-up.
Powerup_Ninja:
    ld a, [wAntigravityActive]
    or a
    jr z, .noAntigravity

    ld [wAntigravityCancel], a

.noAntigravity:
    ld a, $c8
    ld [wBallEffectTimer], a
    ld a, $01
    ld [wNinjaActive], a
    ld a, $04
    ld [wLaunchDirection], a
    xor a
    ld [wAntigravityActive], a
    ld [wSlowBallActive], a
    ld [wSleepyBallActive], a
    ld hl, wLangTextNinjaUp
    call ShowMessageBankE
    jr PowerupCollected

; Ghost power-up. Sets wGhostActive and starts wGhostTimer at $FF.
; Shows the message and ends the pick-up.
Powerup_Ghost:
    ld a, $01
    ld [wGhostActive], a
    ld a, $ff
    ld [wGhostTimer], a
    ld hl, wLangTextGhostUp
    call ShowMessageBankE
    jr PowerupCollected

; Grenade bat power-up. Clears the laser and rocket state, shows the message and adds 4 to wGrenadeCount.
; Continues in Powerup_WeaponCommon.
Powerup_Grenade:
    xor a
    ld [wLaserBat], a
    ld [wRocketLaserBat], a
    ld hl, wLangTextGrenadeBat
    call ShowMessageBankE
    ld b, $04
    ld a, [wGrenadeCount]
    add b
    ld [wGrenadeCount], a
    jp Powerup_WeaponCommon

; Common end of the pick-up handlers.
PowerupCollected:
    ld b, $0a

; Ends a power-up pick-up. B = score passed to AddScore.
; Starts the pick-up effect, plays sound 8, restores the registers saved by the catch check and returns A = 1.
PowerupCollected_AddScore:
    call AddScore
    pop de
    pop bc
    push de
    ld a, $01
    ld e, $00
    call SpawnPickupEffect
    pop de
    ld a, SFX_POWERUP_COLLECTED
    call PlaySound
    ld a, $01
    or a
    pop hl
    ret

ShotSprite_Rocket:
    db $55, $04, $51, $41, $54, $44

ShotSprite_Plasma:
    db $5e, $05, $5d, $05, $5c, $05

ShotSprite_Laser:
    db $12, $0c, $10, $0c
    db $11, $0c

GrenadeText_English_0:
    db $04, "      GRENADE 0     "

GrenadeText_French_0:
    db $04, "      GRENADE 0     "

GrenadeText_German_0:
    db $00, "     GRANATEN 0     "

GrenadeText_Italian_0:
    db $04, "      GRANATE 0     "

GrenadeText_Spanish_0:
    db $04, "      GRANADA 0     "

GrenadeText_English_1:
    db $04, "      GRENADE 1     "

GrenadeText_French_1:
    db $04, "      GRENADE 1     "

GrenadeText_German_1:
    db $00, "     GRANATEN 1     "

GrenadeText_Italian_1:
    db $04, "      GRANATE 1     "

GrenadeText_Spanish_1:
    db $04, "      GRANADA 1     "

GrenadeText_English_2:
    db $04, "      GRENADE 2     "

GrenadeText_French_2:
    db $04, "      GRENADE 2     "

GrenadeText_German_2:
    db $00, "     GRANATEN 2     "

GrenadeText_Italian_2:
    db $04, "      GRANATE 2     "

GrenadeText_Spanish_2:
    db $04, "      GRANADA 2     "

GrenadeText_English_3:
    db $04, "      GRENADE 3     "

GrenadeText_French_3:
    db $04, "      GRENADE 3     "

GrenadeText_German_3:
    db $00, "     GRANATEN 3     "

GrenadeText_Italian_3:
    db $04, "      GRANATE 3     "

GrenadeText_Spanish_3:
    db $04, "      GRANADA 3     "

GrenadeText_English_4:
    db $04, "      GRENADE 4     "

GrenadeText_French_4:
    db $04, "      GRENADE 4     "

GrenadeText_German_4:
    db $00, "     GRANATEN 4     "

GrenadeText_Italian_4:
    db $04, "      GRANATE 4     "

GrenadeText_Spanish_4:
    db $04, "      GRANADA 4     "

GrenadeText_English_5:
    db $04, "      GRENADE 5     "

GrenadeText_French_5:
    db $04, "      GRENADE 5     "

GrenadeText_German_5:
    db $00, "     GRANATEN 5     "

GrenadeText_Italian_5:
    db $04, "      GRANATE 5     "

GrenadeText_Spanish_5:
    db $04, "      GRANADA 5     "

GrenadeText_English_6:
    db $04, "      GRENADE 6     "

GrenadeText_French_6:
    db $04, "      GRENADE 6     "

GrenadeText_German_6:
    db $00, "     GRANATEN 6     "

GrenadeText_Italian_6:
    db $04, "      GRANATE 6     "

GrenadeText_Spanish_6:
    db $04, "      GRANADA 6     "

GrenadeText_English_7:
    db $04, "      GRENADE 7     "

GrenadeText_French_7:
    db $04, "      GRENADE 7     "

GrenadeText_German_7:
    db $00, "     GRANATEN 7     "

GrenadeText_Italian_7:
    db $04, "      GRANATE 7     "

GrenadeText_Spanish_7:
    db $04, "      GRANADA 7     "

GrenadeTexts_English:
    dw GrenadeText_English_0
    dw GrenadeText_English_1
    dw GrenadeText_English_2
    dw GrenadeText_English_3
    dw GrenadeText_English_4
    dw GrenadeText_English_5
    dw GrenadeText_English_6
    dw GrenadeText_English_7

GrenadeTexts_French:
    dw GrenadeText_French_0
    dw GrenadeText_French_1
    dw GrenadeText_French_2
    dw GrenadeText_French_3
    dw GrenadeText_French_4
    dw GrenadeText_French_5
    dw GrenadeText_French_6
    dw GrenadeText_French_7

GrenadeTexts_German:
    dw GrenadeText_German_0
    dw GrenadeText_German_1
    dw GrenadeText_German_2
    dw GrenadeText_German_3
    dw GrenadeText_German_4
    dw GrenadeText_German_5
    dw GrenadeText_German_6
    dw GrenadeText_German_7

GrenadeTexts_Spanish:
    dw GrenadeText_Spanish_0
    dw GrenadeText_Spanish_1
    dw GrenadeText_Spanish_2
    dw GrenadeText_Spanish_3
    dw GrenadeText_Spanish_4
    dw GrenadeText_Spanish_5
    dw GrenadeText_Spanish_6
    dw GrenadeText_Spanish_7

GrenadeTexts_Italian:
    dw GrenadeText_Italian_0
    dw GrenadeText_Italian_1
    dw GrenadeText_Italian_2
    dw GrenadeText_Italian_3
    dw GrenadeText_Italian_4
    dw GrenadeText_Italian_5
    dw GrenadeText_Italian_6
    dw GrenadeText_Italian_7

GrenadeThrowTable:
    dw $0021, ThrowPath_4e4d
    dw $0028, ThrowPath_4e25
    dw $0030, ThrowPath_4df5
    dw $0038, ThrowPath_4dbd
    dw $0040, ThrowPath_4d7d
    dw $0048, ThrowPath_4d35
    dw $0050, ThrowPath_4ce5
    dw $0058, ThrowPath_4c8d
    dw $0060, ThrowPath_4c2d
    dw $0068, ThrowPath_4bc5
    dw $0070, ThrowPath_4b55

; X step per frame for each sliding letter, ending with 0. All six paths share one list:
; each later letter starts 3 bytes further in, so it travels a shorter distance.
TitleLetterPath_1:
    db $f8, $f8, $f8

TitleLetterPath_2:
    db $f8, $f8, $f8

TitleLetterPath_3:
    db $f8, $f8, $f8

TitleLetterPath_4:
    db $f8, $f8, $f8

TitleLetterPath_5:
    db $f8, $f8, $f8

TitleLetterPath_6:
    db $f8
    db $f8, $f8, $fd, $fe, $fe, $ff, $00

; Sprite lists of the six sliding letters.
TitleLetterSprites_1:
    db $12, $00, $00, $00, $01, $00, $08, $00, $01
    db $00, $10, $00, $01, $08, $00, $00, $01, $08, $08, $00, $01, $08, $10, $00, $01
    db $10, $00, $00, $01, $10, $08, $00, $01, $10, $10, $00, $01, $18, $00, $20, $01
    db $18, $08, $21, $01, $18, $10, $22, $01, $20, $00, $32, $01, $20, $08, $33, $01
    db $20, $10, $34, $01, $28, $00, $42, $01, $28, $08, $43, $01, $28, $10, $44, $01

TitleLetterSprites_2:
    db $24, $00, $00, $01, $00, $00, $08, $02, $00, $00, $10, $03, $00, $08, $00, $0b
    db $00, $08, $08, $0c, $00, $08, $10, $0d, $00, $10, $00, $14, $00, $10, $08, $15
    db $00, $10, $10, $16, $00, $18, $00, $23, $01, $18, $08, $24, $01, $18, $10, $25
    db $01, $20, $00, $35, $01, $20, $08, $36, $01, $20, $10, $37, $01, $28, $00, $45
    db $01, $28, $08, $46, $01, $28, $10, $47, $01, $00, $00, $00, $0a, $00, $08, $01
    db $0a, $00, $10, $02, $0a, $08, $00, $04, $0a, $08, $08, $00, $0a, $08, $10, $05
    db $0a, $10, $00, $08, $0a, $10, $08, $09, $0a, $10, $10, $0a, $0a, $18, $00, $00
    db $00, $18, $08, $00, $00, $18, $10, $00, $00, $20, $00, $00, $00, $20, $08, $00
    db $00, $20, $10, $00, $00, $28, $00, $00, $00, $28, $08, $00, $00, $28, $10, $00
    db $00

TitleLetterSprites_3:
    db $24, $00, $00, $04, $00, $00, $08, $05, $00, $00, $10, $06, $00, $08, $00
    db $0e, $00, $08, $08, $0f, $00, $08, $10, $10, $00, $10, $00, $17, $00, $10, $08
    db $18, $00, $10, $10, $19, $00, $18, $00, $26, $01, $18, $08, $27, $01, $18, $10
    db $28, $01, $20, $00, $00, $01, $20, $08, $38, $01, $20, $10, $00, $01, $28, $00
    db $48, $01, $28, $08, $49, $01, $28, $10, $4a, $01, $00, $00, $00, $0a, $00, $08
    db $01, $0a, $00, $10, $02, $0a, $08, $00, $04, $0a, $08, $08, $00, $0a, $08, $10
    db $06, $0a, $10, $00, $08, $0a, $10, $08, $09, $0a, $10, $10, $0b, $0a, $18, $00
    db $00, $00, $18, $08, $00, $00, $18, $10, $00, $00, $20, $00, $00, $00, $20, $08
    db $00, $00, $20, $10, $00, $00, $28, $00, $00, $00, $28, $08, $00, $00, $28, $10
    db $00, $00

TitleLetterSprites_4:
    db $24, $00, $00, $07, $00, $00, $08, $08, $00, $00, $10, $09, $00, $08
    db $00, $11, $00, $08, $08, $0f, $00, $08, $10, $12, $00, $10, $00, $1a, $00, $10
    db $08, $1b, $00, $10, $10, $1c, $00, $18, $00, $29, $01, $18, $08, $2a, $01, $18
    db $10, $2b, $01, $20, $00, $39, $01, $20, $08, $3a, $01, $20, $10, $3b, $01, $28
    db $00, $4b, $01, $28, $08, $4c, $01, $28, $10, $4d, $01, $00, $00, $00, $0a, $00
    db $08, $01, $0a, $00, $10, $02, $0a, $08, $00, $04, $0a, $08, $08, $00, $0a, $08
    db $10, $06, $0a, $10, $00, $08, $0a, $10, $08, $09, $0a, $10, $10, $0b, $0a, $18
    db $00, $00, $00, $18, $08, $00, $00, $18, $10, $00, $00, $20, $00, $00, $00, $20
    db $08, $00, $00, $20, $10, $00, $00, $28, $00, $00, $00, $28, $08, $00, $00, $28
    db $10, $00, $00

TitleLetterSprites_5:
    db $24, $00, $00, $0a, $00, $00, $08, $00, $00, $00, $10, $00, $00
    db $08, $00, $13, $00, $08, $08, $00, $00, $08, $10, $00, $00, $10, $00, $1d, $00
    db $10, $08, $1e, $00, $10, $10, $1f, $00, $18, $00, $2c, $01, $18, $08, $2d, $01
    db $18, $10, $2e, $01, $20, $00, $3c, $01, $20, $08, $3d, $01, $20, $10, $3e, $01
    db $28, $00, $4e, $01, $28, $08, $4f, $01, $28, $10, $50, $01, $00, $00, $03, $0a
    db $00, $08, $00, $0a, $00, $10, $00, $0a, $08, $00, $07, $0a, $08, $08, $00, $0a
    db $08, $10, $00, $0a, $10, $00, $08, $0a, $10, $08, $09, $0a, $10, $10, $0c, $0a
    db $18, $00, $00, $00, $18, $08, $00, $00, $18, $10, $00, $00, $20, $00, $00, $00
    db $20, $08, $00, $00, $20, $10, $00, $00, $28, $00, $00, $00, $28, $08, $00, $00
    db $28, $10, $00, $00

TitleLetterSprites_6:
    db $12, $00, $00, $00, $01, $00, $08, $00, $01, $00, $10, $00
    db $01, $08, $00, $00, $01, $08, $08, $00, $01, $08, $10, $00, $01, $10, $00, $00
    db $01, $10, $08, $00, $01, $10, $10, $00, $01, $18, $00, $2f, $01, $18, $08, $30
    db $01, $18, $10, $31, $01, $20, $00, $3f, $01, $20, $08, $40, $01, $20, $10, $41
    db $01, $28, $00, $51, $01, $28, $08, $52

TitleLetterTileTable:
    db $01, $28, $10, $53, $01
    dw $9801
    db $03
    dw TitleLetterTiles_5bc1
    dw $9804
    db $03
    dw TitleLetterTiles_5baf
    dw $9807
    db $03
    dw TitleLetterTiles_5b9d
    dw $980a
    db $03
    dw TitleLetterTiles_5b8b
    dw $980d
    db $03
    dw TitleLetterTiles_5b79

TitleLetterAttrTable:
    dw $9810
    db $03
    dw TitleLetterTiles_5b67
    dw $9801
    db $03
    dw TitleLetterTiles_5bd3
    dw $9804
    db $03
    dw TitleLetterTiles_5be5
    dw $9807
    db $03
    dw TitleLetterTiles_5be5
    dw $980a
    db $03
    dw TitleLetterTiles_5be5
    dw $980d
    db $03
    dw TitleLetterTiles_5bf7
    dw $9810
    db $03
    dw TitleLetterTiles_5bd3
TitleLetterTiles_5b67:
    db $0f, $10, $11, $20, $21, $11, $31, $32, $33
TitleLetterTiles_5b70:
    db $0f, $10, $11, $20, $21, $22, $32, $33, $34
TitleLetterTiles_5b79:
    db $0c, $0d, $0e, $1d, $1e, $1f, $2e, $2f, $30
TitleLetterTiles_5b82:
    db $0c, $0d, $0e, $1d, $1e, $1f, $2f, $30, $31
TitleLetterTiles_5b8b:
    db $09, $0a, $0b, $1b, $19, $1c, $2b, $2c, $2d
TitleLetterTiles_5b94:
    db $09, $0a, $0b, $1a, $1b, $1c, $2c, $2d, $2e
TitleLetterTiles_5b9d:
    db $06, $07, $08, $18, $19, $1a, $28, $29, $2a
TitleLetterTiles_5ba6:
    db $06, $07, $08, $18, $19, $18, $29, $2a, $2b
TitleLetterTiles_5baf:
    db $03, $04, $05, $15, $16, $17, $25, $26, $27
TitleLetterTiles_5bb8:
    db $03, $04, $05, $15, $16, $17, $26, $27, $28
TitleLetterTiles_5bc1:
    db $00, $01, $02, $12, $13, $14, $22, $23, $24
TitleLetterTiles_5bca:
    db $00, $01, $02, $12, $13, $14, $23, $24, $25
TitleLetterTiles_5bd3:
    db $08, $08, $08, $08, $08, $08, $08, $08, $08
TitleLetterTiles_5bdc:
    db $04, $04, $04, $04, $04, $04, $04, $04, $04
TitleLetterTiles_5be5:
    db $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a
TitleLetterTiles_5bee:
    db $04, $04, $04, $04, $04, $04, $04, $04, $04
TitleLetterTiles_5bf7:
    db $0a, $08, $08, $0a, $08, $08, $0a, $0a, $0a
TitleLetterTiles_5c00:
    db $04, $04, $04, $04, $04, $04, $04, $04, $04

; Writes the bonus as five digit characters to the buffer whose address is stored at wLangTable + $36.
; HL = the bonus value. Used on the level password screen to show the bonus.
LevelPassword_DrawBonus:
    ld a, [wLangTable + $36]
    ld c, a
    ld a, [wLangTable + $37]
    ld b, a
    xor a

.tenThousandsLoop:
    ld de, $d8f0
    add hl, de
    bit 7, h
    jr z, .incTenThousands

    ld de, $2710
    add hl, de
    add $30
    ld [bc], a
    inc bc
    xor a

.thousandsLoop:
    ld de, $fc18
    add hl, de
    bit 7, h
    jr z, .incThousands

    ld de, $03e8
    add hl, de
    add $30
    ld [bc], a
    inc bc
    xor a

.hundredsLoop:
    ld de, $ff9c
    add hl, de
    bit 7, h
    jr z, .incHundreds

    ld de, $0064
    add hl, de
    add $30
    ld [bc], a
    inc bc
    xor a

.tensLoop:
    ld de, $fff6
    add hl, de
    bit 7, h
    jr z, .incTens

    ld de, $000a
    add hl, de
    add $30
    ld [bc], a
    inc bc
    ld a, l
    add $30
    ld [bc], a
    ret

.incTens:
    inc a
    jr .tensLoop

.incHundreds:
    inc a
    jr .hundredsLoop

.incThousands:
    inc a
    jr .thousandsLoop

.incTenThousands:
    inc a
    jr .tenThousandsLoop

; Called once per frame on the level password screen. Resets wLevelsSincePassword.
; Updates fireworks and twinkles, then counts wBonusCountdown down by 50 per frame once wBonusDelay is 0.
; Holding A, B, Select or Start starts the next game state.
LevelPassword_Update:
    xor a
    ld [wLevelsSincePassword], a
    call UpdateFireworks
    call UpdateTwinkles
    ld a, [wBonusDelay]
    or a
    jr z, .bonusDelayOver

    dec a
    ld [wBonusDelay], a
    jr .checkJoypad

.bonusDelayOver:
    ld a, [wBonusCountdown]
    ld l, a
    ld a, [wBonusCountdown + 1]
    ld h, a
    or l
    jr z, .checkJoypad

    ld a, [wBonusCountdownPaused]
    xor $01
    jr z, .drawBonus

    ld de, $ffce
    add hl, de

.drawBonus:
    push hl
    call LevelPassword_DrawBonus
    pop hl
    ld a, l
    ld [wBonusCountdown], a
    ld a, h
    ld [wBonusCountdown + 1], a

.checkJoypad:
    ld a, [hGameState]
    cp $02
    jr z, .done

    ld a, [hJoypad]
    and $f0
    or a
    jr z, .done

    ld a, $02
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ld a, SFX_MENU_SELECT
    call PlaySound

.done:
    ret

; Runs in VBlank once the level password screen is set up (wLevelPasswordReady).
; Sets rIE, draws text from wLevelPasswordText and writes pending twinkle tiles from wTwinkleWrites.
; Sways the logo through wScrollSplits and sets rSCX and rLYC.
LevelPassword_VBlank:
    ld a, [wLevelPasswordReady]
    or a
    ret z

    ld a, $03
    ldh [rIE], a
    ld hl, wLevelPasswordText + 39
    call DrawString
    ld a, [wTwinkleWriteCount]
    or a
    jr z, .swayLogo

    ld de, wTwinkleWrites

.twinkleWriteLoop:
    push af
    ld a, [de]
    inc de
    ld l, a
    ld a, [de]
    inc de
    ld h, a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl-], a
    ld bc, $0020
    add hl, bc
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl-], a
    pop af
    dec a
    jr nz, .twinkleWriteLoop

    xor a
    ld [wTwinkleWriteCount], a

.swayLogo:
    ld a, [wLogoSwayPtr]
    ld l, a
    ld a, [wLogoSwayPtr + 1]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, .applySwayStep

    ld hl, LogoSwaySteps
    ld a, [hl+]

.applySwayStep:
    ld b, a
    ld a, [wScrollSplits]
    add b
    ld [wScrollSplits], a
    ld a, [wScrollSplits + 4]
    sub b
    ld [wScrollSplits + 4], a
    ld a, l
    ld [wLogoSwayPtr], a
    ld a, h
    ld [wLogoSwayPtr + 1], a
    ld hl, wScrollSplits
    ld a, [hl+]
    ldh [rSCX], a
    ld a, [hl+]
    ldh [rLYC], a
    ld a, l
    ld [wScrollSplitPtr], a
    ld a, h
    ld [wScrollSplitPtr + 1], a
    ret

; Start the next firework. HL = a firework record; its first two bytes point into the launch script.
; A script entry of $ff is followed by the address to continue from.
Firework_Launch:
    push hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    inc de
    cp $ff
    jr nz, .gotScriptByte

    ld a, [de]
    inc de
    ld b, a
    ld a, [de]
    ld d, a
    ld e, b
    ld a, [de]
    inc de

.gotScriptByte:
    ld b, a
    xor a
    ld [hl+], a
    ld a, b
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    xor a
    ld [hl+], a
    xor a
    ld [hl+], a
    pop hl
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ret

; Update the three fireworks on the level password screen and write their sprites.
UpdateFireworks:
    ld a, [wFireworkTick]
    inc a
    and $03
    ld [wFireworkTick], a
    ld hl, wOamBuffer
    ld a, [wFireworkSpriteCount]
    inc a
    call ClearOamEntries
    xor a
    ld [wFireworkSpriteCount], a
    ld hl, wOamBuffer
    ld a, l
    ld [wFireworkOamPtr], a
    ld a, h
    ld [wFireworkOamPtr + 1], a
    ld a, $03
    ld hl, wFireworks

.nextFirework:
    push af
    push hl
    ld de, wFireworkWork
    ld c, $0f

.copyToWorkLoop:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, .copyToWorkLoop

    call UpdateFirework
    pop hl
    ld de, wFireworkWork
    ld c, $0f

.copyBackLoop:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .copyBackLoop

    pop af
    dec a
    jr nz, .nextFirework

    ret

; Update the firework in wFireworkWork. After the burst, move its 10 sparks along their curves.
UpdateFirework:
    ld a, [wFireworkWork + 12]
    or a
    jp z, Firework_Fly

    ld a, [wFireworkWork + 13]
    ld e, a
    ld a, [wFireworkWork + 14]
    ld d, a
    ld a, $0a

.nextSpark:
    push af
    push de
    ld a, [de]
    inc de
    ld l, a
    ld a, [de]
    inc de
    ld h, a
    ld a, [de]
    inc de
    ld c, a
    ld a, [de]
    inc de
    ld b, a
    add hl, bc
    pop bc
    ld a, l
    ld [bc], a
    inc bc
    ld a, h
    ld [bc], a
    push hl
    push de
    ld a, [de]
    inc de
    ld l, a
    ld a, [de]
    inc de
    ld h, a
    ld a, [hl+]
    cp $80
    jr z, .curveEnded

    pop de
    cp $7f
    jr z, .skipSpark

    ld b, a
    ld a, l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, [de]
    add b
    ld [de], a
    inc de
    push af
    ld a, [wFireworkOamPtr]
    ld l, a
    ld a, [wFireworkOamPtr + 1]
    ld h, a
    pop af
    ld [hl+], a
    pop af
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [de]
    ld b, a
    ld a, [wFireworkTick]
    or a
    jr nz, .storeSparkFrame

    ld a, b
    inc a
    and $07
    ld b, a

.storeSparkFrame:
    ld a, b
    ld [de], a
    inc de
    ld [hl+], a
    ld a, [wFireworkSpriteCount]
    inc a
    ld [wFireworkSpriteCount], a
    ld a, l
    ld [wFireworkOamPtr], a
    ld a, h
    ld [wFireworkOamPtr + 1], a
    jr .sparkDone

.skipSpark:
    pop af
    ld hl, $0004
    add hl, de
    ld d, h
    ld e, l

.sparkDone:
    pop af
    dec a
    jr nz, .nextSpark

    ret

.curveEnded:
    pop de
    pop hl
    pop af
    ld hl, wFireworkWork
    call Firework_Launch
    ret

; Move the rocket until its fuse runs out, then burst it into 10 sparks.
Firework_Fly:
    ld a, [wFireworkWork + 6]
    ld e, a
    ld a, [wFireworkWork + 7]
    ld d, a
    ld a, [wFireworkWork + 9]
    ld l, a
    ld a, [wFireworkWork + 10]
    ld h, a
    add hl, de
    ld a, h
    or a
    jr nz, .stillFlying

    ld hl, LevelPasswordCurves
    ld a, [wFireworkWork + 13]
    ld e, a
    ld a, [wFireworkWork + 14]
    ld d, a
    ld c, $0a
    ld a, c
    ld [wFireworkWork + 12], a
    ld a, [hGameState]
    cp $02
    jr z, .initSparkLoop

    ld a, SFX_FIREWORK_BURST
    call PlaySound

.initSparkLoop:
    xor a
    ld [de], a
    inc de
    ld a, [wFireworkWork + 3]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [wFireworkWork + 5]
    ld [de], a
    inc de
    cp $90
    jr nc, .storeSparkFrame

    ld a, [hGameState]
    cp $02
    jr z, .storeSparkFrame

    ld a, SFX_FIREWORK_SPARK
    call PlaySound

.storeSparkFrame:
    ld a, c
    and $07
    ld [de], a
    inc de
    dec c
    jr nz, .initSparkLoop

    ret

.stillFlying:
    ld a, l
    ld [wFireworkWork + 9], a
    ld a, h
    ld [wFireworkWork + 10], a
    ld a, [wFireworkWork + 8]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    ld de, BallVelocityTable
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [wFireworkWork + 2]
    ld l, a
    ld a, [wFireworkWork + 3]
    ld h, a
    ld a, [wFireworkWork + 10]

.addXStepLoop:
    add hl, bc
    dec a
    jr nz, .addXStepLoop

    ld a, l
    ld [wFireworkWork + 2], a
    ld a, h
    ld [wFireworkWork + 3], a
    ld a, [wFireworkWork + 4]
    ld l, a
    ld a, [wFireworkWork + 5]
    ld h, a
    ld a, [wFireworkWork + 10]

.addYStepLoop:
    add hl, de
    dec a
    jr nz, .addYStepLoop

    ld a, l
    ld [wFireworkWork + 4], a
    ld a, h
    ld [wFireworkWork + 5], a
    ld a, [wFireworkOamPtr]
    ld l, a
    ld a, [wFireworkOamPtr + 1]
    ld h, a
    ld a, [wFireworkWork + 5]
    ld [hl+], a
    ld a, [wFireworkWork + 3]
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [wFireworkWork + 11]
    ld b, a
    ld a, [wFireworkTick]
    or a
    jr nz, .storeRocketFrame

    ld a, b
    inc a
    and $07
    ld [wFireworkWork + 11], a
    ld b, a

.storeRocketFrame:
    ld a, b
    ld [hl+], a
    ld a, [wFireworkSpriteCount]
    inc a
    ld [wFireworkSpriteCount], a
    ld a, l
    ld [wFireworkOamPtr], a
    ld a, h
    ld [wFireworkOamPtr + 1], a
    ret

; Animate the 11 twinkling stars on the level password screen.
UpdateTwinkles:
    ld a, $0b
    ld hl, wTwinkles
    ld de, wTwinkleWrites

.nextTwinkle:
    push af
    ld a, [hl]
    dec a
    or a
    jr nz, .storeTimer

    push hl
    inc hl
    ld a, [hl]
    inc a
    ld [hl+], a
    cp $30
    jr z, .restartTwinkle

    add a
    push hl
    ld l, a
    ld h, $00
    ld bc, LevelPasswordFrames
    add hl, bc
    ld a, [hl+]
    ld b, [hl]
    ld c, a
    pop hl
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [bc]
    inc bc
    ld [de], a
    inc de
    ld a, [bc]
    inc bc
    ld [de], a
    inc de
    ld a, [bc]
    inc bc
    ld [de], a
    inc de
    ld a, [bc]
    inc bc
    ld [de], a
    inc de
    ld a, [wTwinkleWriteCount]
    inc a
    ld [wTwinkleWriteCount], a
    pop hl
    ld bc, $0005
    add hl, bc
    jr .twinkleDone

.restartTwinkle:
    inc hl
    inc hl
    ld a, [hl]
    pop hl
    ld [hl+], a
    xor a
    ld [hl+], a
    ld bc, $0003
    add hl, bc
    jr .twinkleDone

.storeTimer:
    ld [hl+], a
    ld bc, $0004
    add hl, bc

.twinkleDone:
    pop af
    dec a
    jr nz, .nextTwinkle

    ret

BatSpeedTable:
    db $00, $01, $01, $01, $01, $01, $01, $01, $01, $02, $00

    db $00, $01, $01, $01, $01, $01, $02, $02, $02, $03, $00

BatBounceTable:
    db $1c, $01

    db $1c, $01

    db $1c, $01

    db $1c, $01

    db $1d, $02
    db $1d, $02

    db $1d, $02, $1d, $02

    db $1e, $03, $1e, $03, $1e, $03

    db $1e, $03, $1f, $00
    db $1f, $00, $1f, $00

    db $1f, $00
    db $01, $00

    db $01, $00

    db $01, $00, $01, $00, $02, $03
    db $02, $03

    db $02, $03

    db $02, $03

    db $03, $02, $03, $02
    db $03, $02

    db $03, $02
    db $04, $01

    db $04
    db $01

    db $04, $01

    db $04, $01, $1c, $02, $1c, $02
    db $1c, $02

    db $1c, $02
    db $1d, $02

    db $1d, $03, $1d, $03
    db $1d, $03

    db $1e, $03, $1e, $03, $1e, $00, $1e, $00
    db $1f, $00, $1f, $00

    db $1f, $00
    db $1f, $00, $01, $00

    db $01
    db $00
    db $01, $00, $01, $00

    db $02, $00

    db $02, $00
    db $02, $03

    db $02, $03
    db $03, $03

    db $03, $03

    db $03, $03, $03, $02
    db $04, $02

    db $04, $02, $04, $02
    db $04, $02

BatBounceTable_BigBat:
    db $1c, $01

    db $1c
    db $01

    db $1c, $01

    db $1c
    db $01

    db $1c, $01, $1d, $02

    db $1d, $02
    db $1d, $02, $1d, $02

    db $1d, $02, $1e, $03
    db $1e, $03

    db $1e, $03
    db $1e, $03, $1e, $03, $1f, $00, $1f, $00

    db $1f, $00
    db $1f, $00, $1f, $00

    db $01, $00, $01, $00
    db $01
    db $00
    db $01, $00, $01, $00, $02, $03, $02, $03, $02, $03

    db $02, $03
    db $02, $03, $03, $02, $03, $02, $03, $02

    db $03, $02, $03, $02
    db $04, $01

    db $04, $01, $04, $01, $04, $01, $04, $01, $1c, $02, $1c, $02, $1c, $02, $1c, $02
    db $1c, $02, $1d, $02, $1d, $02, $1d, $03, $1d, $03, $1d, $03, $1e, $03, $1e, $03
    db $1e, $03, $1e, $00, $1e, $00, $1f, $00, $1f, $00, $1f, $00, $1f, $00, $1f, $00
    db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $02, $00, $02, $00, $02, $03
    db $02, $03, $02, $03, $03, $03, $03, $03, $03, $03, $03, $02, $03, $02, $04, $02
    db $04, $02, $04, $02, $04, $02, $04, $02

BatExplosionFrames:
    db $04, $00, $00, $43, $0c, $00, $08, $4b, $0c, $00, $10, $43, $0c, $00, $18, $4b
    db $0c, $04, $00, $00, $44, $0c, $00, $08, $4a, $0c, $00, $10, $44, $0c, $00, $18
    db $4a, $0c, $04, $00, $00, $45, $0c, $00, $08, $49, $0c, $00, $10, $45, $0c, $00
    db $18, $49, $0c, $04, $00, $00, $46, $0c, $00, $08, $48, $0c, $00, $10, $46, $0c
    db $00, $18, $48, $0c, $04, $00, $00, $47, $0c, $00, $08, $47, $0c, $00, $10, $47
    db $0c, $00, $18, $47, $0c, $04, $00, $00, $48, $0c, $00, $08, $46, $0c, $00, $10
    db $48, $0c, $00, $18, $46, $0c, $04, $00, $00, $49, $0c, $00, $08, $45, $0c, $00
    db $10, $49, $0c, $00, $18, $45, $0c, $04, $00, $00, $4a, $0c, $00, $08, $44, $0c
    db $00, $10, $4a, $0c, $00, $18, $44, $0c, $04, $00, $00, $4b, $0c, $00, $08, $44
    db $0c, $00, $10, $4b, $0c, $00, $18, $44, $0c, $04, $00, $00, $58, $0c, $00, $08
    db $58, $0c, $00, $10, $58, $0c, $00, $18, $58, $0c

BatExplosionSequence:
    db $99
    db $99, $99, $99, $88, $88, $88, $88, $77, $77, $77, $77, $66, $66, $66, $66, $55
    db $55, $55, $55, $44, $44, $44, $44, $33, $33, $33, $33, $22, $22, $22, $22, $11
    db $11, $11, $11, $00, $00, $00, $00

; X and Y velocity (two words) for each of the 32 ball directions.
BallVelocityTable:
    db $00, $00, $00, $ff
    db $30, $00, $08, $ff, $60, $00, $12, $ff, $8d, $00, $2d, $ff, $b5, $00, $4b, $ff
    db $d3, $00, $73, $ff

    db $ee, $00, $a0, $ff, $f8, $00, $d0, $ff
    db $00, $01, $00, $00

    db $f8, $00, $30, $00
    db $ee, $00, $60, $00
    db $d3, $00, $8d, $00

    db $b5, $00, $b5, $00

    db $8d, $00
    db $d3
    db $00
    db $60, $00, $ee, $00, $30, $00, $f8, $00

    db $00, $00, $00
    db $01

    db $d0, $ff, $f8, $00, $a0, $ff, $ee, $00, $73, $ff, $d3, $00

    db $4b, $ff, $b5, $00

    db $2d, $ff, $8d, $00, $12, $ff, $60, $00, $08, $ff, $30, $00
    db $00, $ff, $00, $00

    db $08, $ff, $d0, $ff, $12, $ff, $a0, $ff
    db $2d, $ff, $73, $ff

    db $4b, $ff, $4b, $ff

    db $73, $ff, $2d, $ff
    db $a0, $ff, $12, $ff, $d0, $ff, $08, $ff

BallReflectBottomTable:
    db $00
    db $01

    db $02

    db $03

    db $04, $05, $06, $07, $08, $07, $06
    db $05

    db $04

    db $03

    db $02

    db $01
    db $00
    db $1f, $1e, $1d

    db $1c, $1b, $1a, $19, $18, $19, $1a
    db $1b, $1c

    db $1d

    db $1e

    db $1f

BallReflectTopTable:
    db $10

    db $0f, $0e, $0d, $0c, $0b

    db $0a, $09, $08, $09, $0a, $0b
    db $0c

    db $0d
    db $0e

    db $0f

    db $10

    db $11

    db $12, $13

    db $14

    db $15, $16, $17, $18, $17
    db $16

    db $15

    db $14

    db $13
    db $12, $11

BallReflectRightTable:
    db $00
    db $1f

    db $1e, $1d, $1c

    db $1b, $1a, $19, $18, $17
    db $16

    db $15

    db $14, $13

    db $12

    db $11
    db $10

    db $11, $12

    db $13

    db $14, $15, $16, $17, $18, $19, $1a, $1b
    db $1c

    db $1d

    db $1e

    db $1f

BallReflectLeftTable:
    db $00
    db $01

    db $02, $03

    db $04, $05, $06, $07, $08, $09, $0a, $0b
    db $0c

    db $0d, $0e, $0f
    db $10

    db $0f

    db $0e

    db $0d
    db $0c

    db $0b, $0a, $09, $08, $07, $06
    db $05

    db $04, $03

    db $02

    db $01

; Empties all 14 slots of wBrickBreakEffects.
; Called when a level is set up.
ClearBrickBreakEffects:
    ld c, $0e
    xor a
    ld de, $0006
    ld hl, wBrickBreakEffects

.clearLoop:
    ld [hl], a
    add hl, de
    dec c
    jr nz, .clearLoop

    ret

; Starts a brick break effect in the first free slot of wBrickBreakEffects.
; A = X position of the effect, BC = tilemap address of the brick (its row gives the Y position).
; Called when a plasma shot destroys a brick. Changes C only; HL, DE and AF are kept.
SpawnBrickBreakEffect:
    push hl
    push de
    push af
    ld hl, wBrickBreakEffects
    ld de, $0006

.findFreeSlot:
    ld a, [hl]
    or a
    jr z, .slotFound

    add hl, de
    jr .findFreeSlot

.slotFound:
    ld a, $1c
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, b
    sla c
    rla
    sla c
    rla
    sla c
    rla
    and $1f
    sla a
    sla a
    sla a
    add $10
    ld [hl+], a
    pop af
    ld [hl+], a
    pop de
    pop hl
    ret

; Starts a brick break effect in the first free slot of wBrickBreakEffects at Y = B and X = C + 4.
; A = 0 gives the effect no speed, otherwise it moves upward.
; Called by UpdatePickupEffects. Keeps HL and AF, changes DE.
FindFreeBrickBreakEffect:
    push hl
    push af
    ld hl, wBrickBreakEffects
    ld de, $0006

.findFreeSlot:
    ld a, [hl]
    or a
    jr z, .slotFound

    add hl, de
    jr .findFreeSlot

.slotFound:
    ld a, $1c
    ld [hl+], a
    pop af
    or a
    jr nz, .setUpwardSpeed

    ld [hl+], a
    ld [hl+], a
    jr .writePosition

.setUpwardSpeed:
    ld a, $80
    ld [hl+], a
    ld a, $ff
    ld [hl+], a

.writePosition:
    xor a
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, c
    add $04
    ld [hl+], a
    pop hl
    ret

; Called once per frame while a level is played.
; Counts down each active entry of wBrickBreakEffects, moves it vertically, and adds one sprite for it to the OAM buffer.
; The sprite tile comes from BrickBreakEffectFrames.
UpdateBrickBreakEffects:
    ld hl, wBrickBreakEffects
    ld c, $0e

.effectLoop:
    ld a, [hl]
    or a
    jr z, .skipInactive

    dec a
    ld [hl+], a
    push hl
    ld hl, BrickBreakEffectFrames
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld b, a
    pop hl
    ld a, [wOamWritePtr]
    ld e, a
    ld a, [wOamWritePtr + 1]
    ld d, a
    push bc
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    push hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld b, h
    ld c, l
    pop hl
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld [de], a
    inc de
    pop bc
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    inc de
    ld a, $01
    ld [de], a
    inc de
    ld a, e
    ld [wOamWritePtr], a
    ld a, d
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    inc a
    ld [wOamUsed], a
    jr .nextEffect

.skipInactive:
    ld de, $0006
    add hl, de

.nextEffect:
    dec c
    jr nz, .effectLoop

    ret

; Writes 0 to the first byte (the counter) at four positions, 4 bytes apart, starting at wPickupEffects.
; Called when a level starts and after a life is lost.
ClearPickupEffects:
    ld c, $04
    xor a
    ld de, $0004
    ld hl, wPickupEffects

.clearLoop:
    ld [hl], a
    add hl, de
    dec c
    jr nz, .clearLoop

    ret

; Start the effect shown where a power-up was collected.
SpawnPickupEffect:
    push bc
    ld c, d
    push af
    push de
    ld hl, wPickupEffects
    ld de, $0007

.findFreeSlot:
    ld a, [hl]
    or a
    jr z, .slotFound

    add hl, de
    jr .findFreeSlot

.slotFound:
    ld a, $28
    ld [hl+], a
    pop de
    ld a, e
    or a
    jr nz, .setZeroSpeed

    ld a, $80
    ld [hl+], a
    ld a, $ff
    ld [hl+], a
    jr .writePosition

.setZeroSpeed:
    xor a
    ld [hl+], a
    ld [hl+], a

.writePosition:
    ld a, $00
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    pop af
    ld e, a
    ld d, $00
    push hl
    ld hl, PickupEffectFrames
    add hl, de
    ld a, [hl]
    pop hl
    ld [hl], a
    pop bc
    ret

; Called once per frame while a level is played.
; Counts down each active entry of wPickupEffects, moves it, and draws it as two sprites.
; When the counter reaches $0f it also starts a brick break effect at its position.
UpdatePickupEffects:
    ld hl, wPickupEffects
    ld c, $04

.effectLoop:
    push bc
    ld a, [hl]
    or a
    jr z, .skipInactive

    dec a
    ld [hl+], a
    cp $0f
    jr nz, .moveAndDraw

    push hl
    inc hl
    ld a, [hl+]
    ld d, a
    inc hl
    ld a, [hl+]
    ld b, a
    ld c, [hl]
    inc hl
    inc hl
    ld a, d
    call FindFreeBrickBreakEffect
    pop hl

.moveAndDraw:
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, h
    ld e, l
    pop hl
    ld [hl-], a
    ld a, e
    ld [hl+], a
    ld a, [wOamWritePtr]
    ld e, a
    ld a, [wOamWritePtr + 1]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld [de], a
    inc de
    ld a, [hl+]
    ld b, a
    ld [de], a
    inc de
    ld a, [hl+]
    push af
    ld [de], a
    inc de
    ld a, $01
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    inc de
    ld a, b
    add $08
    ld [de], a
    inc de
    pop af
    inc a
    ld [de], a
    inc de
    ld a, $01
    ld [de], a
    inc de
    ld a, e
    ld [wOamWritePtr], a
    ld a, d
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    add $02
    ld [wOamUsed], a
    jr .nextEffect

.skipInactive:
    ld de, $0007
    add hl, de

.nextEffect:
    pop bc
    dec c
    jr nz, .effectLoop

    ret

; Runs once when a level appears. A sweep crosses the bricks along 22 diagonals.
; On each diagonal, tiles $27/$29 and $4c/$51 are drawn as $25/$26 and $4f/$50.
; The row behind the sweep is restored from wLevelTilemapCopy.
SweepBricks:
    ld a, [wLevelSweepPending]
    or a
    ret z

    ld b, $16
    ld hl, $99d1
    ld de, BrickSweepLengths

; Starts one diagonal of the sweep shown when a level appears.
; Waits three frames, clears wBrickRedrawCount, and reads the length of the diagonal from BrickSweepLengths.
; HL = tilemap address where the diagonal starts, B = diagonals left, DE = next entry of BrickSweepLengths.
SweepBricks_Diagonal:
    push de
    call WaitVBlank
    call WaitVBlank
    call WaitVBlank
    pop de
    xor a
    ld [wBrickRedrawCount], a
    ld a, [de]
    inc de
    ld c, a
    push de
    ld de, wVBlankTileWrites
    push hl

; Handles one cell of the current diagonal of the sweep.
; Queues the sweep tiles in wVBlankTileWrites when the tile in wLevelTilemapCopy is $27, $29, $4c or $51.
; Also queues the tiles of the row below from wLevelTilemapCopy, then moves to the next cell.
SweepBricks_Cell:
    push bc
    push hl
    ld bc, $6800
    add hl, bc
    ld bc, wLevelTilemapCopy
    add hl, bc
    ld a, [hl]
    pop hl
    cp $27
    jr nz, .checkTile29

    ld bc, $2625
    jr .queueSweepTiles

.checkTile29:
    cp $29
    jr nz, .checkTile4c

    ld bc, $2625
    jr .queueSweepTiles

.checkTile4c:
    cp $4c
    jr nz, .checkTile51

    ld bc, $504f
    jr .queueSweepTiles

.checkTile51:
    cp $51
    jr nz, .restoreRowBelow

    ld bc, $504f

.queueSweepTiles:
    ld a, l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    inc de
    inc l
    ld a, l
    dec l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    inc de
    ld a, [wBrickRedrawCount]
    add $02
    ld [wBrickRedrawCount], a

.restoreRowBelow:
    push hl
    ld bc, $0020
    add hl, bc
    push hl
    ld bc, $6800
    add hl, bc
    ld bc, wLevelTilemapCopy
    add hl, bc
    ld c, l
    ld b, h
    pop hl
    ld a, l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, [bc]
    inc bc
    ld [de], a
    inc de
    inc l
    ld a, l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    inc de
    ld a, [bc]
    ld [de], a
    inc de
    ld a, [wBrickRedrawCount]
    add $02
    ld [wBrickRedrawCount], a
    pop hl
    ld bc, $ffe2
    add hl, bc
    pop bc
    ld a, c
    cp $ff
    jr z, .finalRestorePass

    cp $fe
    jr z, .diagonalDone

    dec c
    jp nz, SweepBricks_Cell

.finalRestorePass:
    ld c, $fe
    push bc
    jr .restoreRowBelow

.diagonalDone:
    pop hl
    ld de, $fffe
    add hl, de
    ld a, l
    and $1f
    cp $1f
    jr nz, .nextDiagonal

    ld de, $ffe2
    add hl, de

.nextDiagonal:
    pop de
    dec b
    jp nz, SweepBricks_Diagonal

    ret

; Writes the $ff end marker after wUnbreakableHitEffects and points wUnbreakableHitEffectPtr at the first slot.
; Does not clear the slots themselves.
; Called when a level starts and after a life is lost.
ClearUnbreakableHitEffects:
    ld a, $ff
    ld [wUnbreakableHitEffectsEnd], a
    ld hl, wUnbreakableHitEffects
    ld a, l
    ld [wUnbreakableHitEffectPtr], a
    ld a, h
    ld [wUnbreakableHitEffectPtr + 1], a
    ret

; Start the effect shown when the ball hits an unbreakable brick.
SpawnUnbreakableHitEffect:
    ld a, [wUnbreakableHitEffectPtr]
    ld l, a
    ld a, [wUnbreakableHitEffectPtr + 1]
    ld h, a
    ld [hl], $12
    inc hl
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, [hl]
    cp $ff
    jr nz, .saveSlotPtr

    ld hl, wUnbreakableHitEffects

.saveSlotPtr:
    ld a, l
    ld [wUnbreakableHitEffectPtr], a
    ld a, h
    ld [wUnbreakableHitEffectPtr + 1], a
    ld a, $01
    ld [wUnbreakableHitSpawned], a
    ret

; Called once per frame while a level is played.
; Counts down each active entry of wUnbreakableHitEffects and draws a sprite for it from UnbreakableHitEffectFrames.
UpdateUnbreakableHitEffects:
    ld hl, wUnbreakableHitEffects
    ld a, $0a

.effectLoop:
    push af
    ld a, [hl]
    or a
    jr z, .skipInactive

    dec a
    ld [hl+], a
    ld e, a
    ld a, [hl+]
    sub $04
    ld c, a
    ld a, [hl+]
    sub $04
    ld b, a
    push hl
    ld d, $00
    ld hl, UnbreakableHitEffectFrames
    add hl, de
    ld a, [hl]
    ld d, a
    ld a, [wOamWritePtr]
    ld l, a
    ld a, [wOamWritePtr + 1]
    ld h, a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $0b
    ld [hl+], a
    ld a, l
    ld [wOamWritePtr], a
    ld a, h
    ld [wOamWritePtr + 1], a
    ld a, [wOamUsed]
    inc a
    ld [wOamUsed], a
    pop hl
    jr .nextEffect

.skipInactive:
    ld de, $0003
    add hl, de

.nextEffect:
    pop af
    dec a
    jr nz, .effectLoop

    ret

; Start values of wTwinkles: 11 stars of 5 bytes (delay, frame, tilemap address, first tile).
TwinkleInitData:
    db $01, $00, $2e, $99, $64, $0a, $00, $26, $99, $69, $14, $00, $d2, $98, $64, $1e
    db $00, $92, $99, $69, $28, $00, $90, $98, $64, $32, $00, $ad, $99, $69, $3c, $00
    db $87, $99, $64, $46, $00, $82, $99, $69, $50, $00, $20, $99, $64, $64, $00, $c1
    db $98, $69, $5a, $00, $84, $98, $64

LevelPasswordFrame_657a:
    db $55, $56, $57, $58

LevelPasswordFrame_657e:
    db $59, $5a, $5b, $5c

LevelPasswordFrame_6582:
    db $5d
    db $5e, $5f, $60

LevelPasswordFrame_6586:
    db $61, $62, $63, $64

LevelPasswordFrame_658a:
    db $65, $66, $67, $68

LevelPasswordFrame_658e:
    db $69, $6a, $6b, $6c

LevelPasswordFrame_6592:
    db $6d
    db $6e, $6f, $70

LevelPasswordFrame_6596:
    db $71, $72, $73, $74

LevelPasswordFrame_659a:
    db $75, $76, $77, $78

LevelPasswordFrame_659e:
    db $59, $5a, $5b, $5c

LevelPasswordFrame_65a2:
    db $55
    db $56, $57, $58

LevelPasswordFrame_65a6:
    db $00, $00

LevelPasswordFrames:
    db $00, $00
    dw LevelPasswordFrame_657a, LevelPasswordFrame_657a, LevelPasswordFrame_657a, LevelPasswordFrame_657a
    dw LevelPasswordFrame_657e, LevelPasswordFrame_657e, LevelPasswordFrame_657e, LevelPasswordFrame_657e
    dw LevelPasswordFrame_6582, LevelPasswordFrame_6582, LevelPasswordFrame_6582, LevelPasswordFrame_6582
    dw LevelPasswordFrame_6586, LevelPasswordFrame_6586, LevelPasswordFrame_6586, LevelPasswordFrame_6586
    dw LevelPasswordFrame_658a, LevelPasswordFrame_658a, LevelPasswordFrame_658a, LevelPasswordFrame_658a
    dw LevelPasswordFrame_658e, LevelPasswordFrame_658e, LevelPasswordFrame_658e, LevelPasswordFrame_658e
    dw LevelPasswordFrame_6592, LevelPasswordFrame_6592, LevelPasswordFrame_6592, LevelPasswordFrame_6592
    dw LevelPasswordFrame_6596, LevelPasswordFrame_6596, LevelPasswordFrame_6596, LevelPasswordFrame_6596
    dw LevelPasswordFrame_659a, LevelPasswordFrame_659a, LevelPasswordFrame_659a, LevelPasswordFrame_659a
    dw LevelPasswordFrame_659e, LevelPasswordFrame_659e, LevelPasswordFrame_659e, LevelPasswordFrame_659e
    dw LevelPasswordFrame_65a2, LevelPasswordFrame_65a2, LevelPasswordFrame_65a2, LevelPasswordFrame_65a2
    dw LevelPasswordFrame_65a6, LevelPasswordFrame_65a6, LevelPasswordFrame_65a6, LevelPasswordFrame_65a6

LevelPasswordCurves:
    dw $fe5c, LevelPasswordCurve_6632
    dw $01a4, LevelPasswordCurve_6670
    dw $ff2e, LevelPasswordCurve_6713
    dw $00d2, LevelPasswordCurve_6713
    dw $fed4, LevelPasswordCurve_66ae
    dw $012c, LevelPasswordCurve_66ae
    dw $ff1a, LevelPasswordCurve_66e6
    dw $00e6, LevelPasswordCurve_66e6
    dw $fe52, LevelPasswordCurve_674d
    dw $01ae, LevelPasswordCurve_674d

LevelPasswordCurve_6632:
    db $fc, $fc, $fd, $fd, $fd, $fd, $fd, $fe
    db $fe, $fe, $fe, $ff, $ff, $00, $00, $00, $00, $01, $01, $02, $02, $02, $03, $03
    db $03, $03, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $80

LevelPasswordCurve_6670:
    db $fc, $fc, $fd, $fd, $fd, $fd, $fd, $fe, $fe, $fe
    db $fe, $ff, $ff, $00, $00, $00, $00, $01, $01, $02, $02, $02, $03, $03, $03, $03
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04

    db $7f

LevelPasswordCurve_66ae:
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $02, $02, $02
    db $03, $03, $03, $03, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $7f

LevelPasswordCurve_66e6:
    db $01, $01, $02, $02, $02, $03, $03, $03
    db $03, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $7f

LevelPasswordCurve_6713:
    db $fc, $fc, $fd, $fd, $fd, $fe, $fe, $ff, $ff, $00, $00
    db $00, $00, $01, $01, $02, $02, $02, $03, $03, $03, $03, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $7f

LevelPasswordCurve_674d:
    db $01
    db $01, $01, $02, $02, $02, $02, $02, $02, $02, $03, $03, $03, $03, $03, $03, $03
    db $03, $03, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $7f

; Scroll steps that sway the logo on the level password screen, ending with 0.
LogoSwaySteps:
    db $03, $03, $03, $03, $03, $03, $03, $03, $02, $01
    db $ff, $fe, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
    db $fd, $fd, $fe, $ff, $01, $02, $03, $03, $03, $03, $03, $03, $03, $03, $00

FireworkScript_0:
    db $50
    db $a0, $f4, $ff, $01, $04, $40, $a0, $eb, $ff, $1f, $05

    db $ff
    dw FireworkScript_0

FireworkScript_1:
    db $6e, $d8, $e9, $ff, $1e, $06, $1e, $d8, $f8, $ff, $02, $04

    db $ff
    dw FireworkScript_1

FireworkScript_2:
    db $6e, $c0, $f4, $ff, $01, $04, $82, $c0, $ed, $ff, $1f, $05

    db $ff
    dw FireworkScript_2
    db $3e, $80, $e0, $68, $0e, $40
    db $2a, $e0, $69, $0d, $20, $fa, $c9, $3e, $80, $e0, $6a, $0e, $40
    db $2a, $e0, $6b, $0d, $20, $fa, $c9

; Writes 64 bytes of background palettes and 64 bytes of sprite palettes to the colour registers.
; HL = background palette data, DE = sprite palette data.
; FadePalettes_Step calls it after waiting for VBlank.
CopyPalettesToHardware:
    ld a, $80
    ldh [rBCPS], a
    ldh [rOCPS], a
    ld c, $40

.copyLoop:
    ld a, [hl+]
    ldh [rBCPD], a
    ld a, [de]
    inc de
    ldh [rOCPD], a
    dec c
    jr nz, .copyLoop

    ret

; Copies 8 bytes per row for 144 rows from wRasterPalettesFaded into wRasterTable, skipping 2 bytes between rows.
; The source is read from WRAM bank 2.
; Used by the palette fades when hPaletteMode is 2.
CopyPaletteBuffer:
    ld de, wRasterTable
    ld hl, wRasterPalettesFaded
    ld b, $90
    ld a, $02
    ldh [rSVBK], a

.copyRowLoop:
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    inc de
    inc de
    dec b
    jr nz, .copyRowLoop

    xor a
    ldh [rSVBK], a
    ret

    ld c, $10
    jr FadePalettes_Step

; Fade the palettes one step. Used by FrameLoop when a screen appears or disappears.
FadePalettes:
    ld c, $20

; Runs a fade in steps. A = start value, B = amount added to it each step, C = number of steps.
; Each step adds the current value to every colour component of the palettes, limits the result to 31, and shows it.
; Uses the raster palettes when hPaletteMode is 2, otherwise the normal palettes.
FadePalettes_Step:
    add b
    push af
    push bc
    ld [hTemp], a
    ld bc, $0040
    ld hl, wPaletteBuffer
    ld de, wFadedPalettes
    ld a, [hPaletteMode]
    cp $02
    jr nz, .nextColour

    ld bc, $0240
    ld a, $02
    ldh [rSVBK], a
    ld hl, wRasterPaletteBuffer
    ld de, wRasterPalettesFaded

.nextColour:
    push bc
    ld a, [hTemp]
    ld b, a
    ld a, [hl+]
    add b
    cp $20
    jr c, .redClamped

    ld a, $1f

.redClamped:
    ld c, a
    ld a, [hTemp]
    ld b, a
    ld a, [hl+]
    add b
    cp $20
    jr c, .greenClamped

    ld a, $1f

.greenClamped:
    push af
    swap a
    sla a
    and $e0
    or c
    ld [de], a
    inc de
    pop af
    sla a
    swap a
    and $03
    ld c, a
    ld a, [hTemp]
    ld b, a
    ld a, [hl+]
    add b
    cp $20
    jr c, .blueClamped

    ld a, $1f

.blueClamped:
    sla a
    sla a
    or c
    ld [de], a
    inc de
    pop bc
    dec bc
    ld a, b
    or c
    jr nz, .nextColour

    xor a
    ldh [rSVBK], a
    ld a, [hPaletteMode]
    cp $02
    jr z, .copyViaPaletteBuffer

    call WaitVBlank
    ld hl, wFadedPalettes
    ld de, wFadedObjPalettes
    call CopyPalettesToHardware
    call AnimatePalettes
    jr .stepDone

.copyViaPaletteBuffer:
    call WaitVBlank
    call CopyPaletteBuffer

.stepDone:
    pop bc
    pop af
    dec c
    jp nz, FadePalettes_Step

    call WaitVBlank
    ret

    ld c, $10
    jr FadePalettes2_Step

; Fades the raster palettes in 8 steps. A = start value, B = 1 changes the value by +4 each step, any other B by -4.
; Each step subtracts the current value from every colour component, limits the result to 0, and shows it.
; FrameLoop calls it when hPaletteMode is 4, when a screen appears or disappears.
FadePalettes2:
    ld h, a
    ld c, $08
    ld a, b
    ld b, $fc
    dec a
    jr nz, .directionChosen

    ld b, $04

.directionChosen:
    ld a, h

; Fades the palettes of wRasterPaletteBuffer (3 bytes per colour) into wRasterPalettesFaded (2-byte colours), then copies them with CopyPaletteBuffer.
; A = fade level, B = signed step added to the level before each pass, C = number of passes.
; Each pass subtracts the level from every colour component (minimum 0) and waits for VBlank before the copy. Used for fades in palette mode 2.
FadePalettes2_Step:
    add b
    push af
    push bc
    ld [hTemp], a
    ld bc, $0240
    ld a, $02
    ldh [rSVBK], a
    ld hl, wRasterPaletteBuffer
    ld de, wRasterPalettesFaded

.nextColour:
    push bc
    ld a, [hTemp]
    ld b, a
    ld a, [hl+]
    sub b
    jr nc, .redFloored

    xor a

.redFloored:
    ld c, a
    ld a, [hTemp]
    ld b, a
    ld a, [hl+]
    sub b
    jr nc, .greenFloored

    xor a

.greenFloored:
    push af
    swap a
    sla a
    and $e0
    or c
    ld [de], a
    inc de
    pop af
    sla a
    swap a
    and $03
    ld c, a
    ld a, [hTemp]
    ld b, a
    ld a, [hl+]
    sub b
    jr nc, .blueFloored

    xor a

.blueFloored:
    sla a
    sla a
    or c
    ld [de], a
    inc de
    pop bc
    dec bc
    ld a, b
    or c
    jr nz, .nextColour

    call WaitVBlank
    call CopyPaletteBuffer
    pop bc
    pop af
    dec c
    jp nz, FadePalettes2_Step

    call WaitVBlank
    ret

; Gathers nine records of three colours in wRasterColours from the faded palettes and copies them into wRasterTable.
; Sets the palette index registers for the raster effect. Does nothing when hPaletteMode is 0, 3 or 4.
; Called by the palette fade step after the faded palettes are copied to the hardware.
AnimatePalettes:
    ld a, [hPaletteMode]
    or a
    ret z

    cp $03
    ret z

    cp $04
    ret z

    ld a, [wRasterObjPaletteIndex]
    ldh [rOCPS], a
    ld a, $9e
    ldh [rBCPS], a
    ld hl, wRasterColours
    ld a, [wFadedObjPalettes + $1a]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1b]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1e]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1f]
    ld [hl+], a
    ld a, [wFadedPalettes + $18]
    ld [hl+], a
    ld a, [wFadedPalettes + $19]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1a]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1b]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1e]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1f]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1e]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1f]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1a]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1b]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1c]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1d]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1c]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1d]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1a]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1b]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1c]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1d]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1a]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $1b]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $14]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $15]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $16]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $17]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $10]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $11]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $14]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $15]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $16]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $17]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $14]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $15]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $14]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $15]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $16]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $17]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $16]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $17]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $14]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $15]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $16]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $17]
    ld [hl+], a
    ld a, [wFadedPalettes + $18]
    ld [hl+], a
    ld a, [wFadedPalettes + $19]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $14]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $15]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $16]
    ld [hl+], a
    ld a, [wFadedObjPalettes + $17]
    ld [hl+], a
    ld a, [wFadedPalettes + $1e]
    ld [hl+], a
    ld a, [wFadedPalettes + $1f]
    ld [hl+], a
    ld hl, wRasterTable
    ld b, $09
    ld c, $81
    ld de, wRasterColours

.copyEntryLoop:
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, c
    ld [hl+], a
    inc a
    cp $88
    jr nz, .checkIndex09

    ld a, $08

.checkIndex09:
    cp $09
    jr nz, .storeNextIndex

    ld a, $80

.storeNextIndex:
    ld c, a
    dec b
    jr nz, .copyEntryLoop

    ret

; Frame handler of the language selection screen. Highlights the row of the chosen language in the screen's colour attributes.
; Down and Up move wLanguage by one step per press (limited to the five languages) and play a sound.
; A, B, Select or Start confirms the choice and copies its language table, unless hGameState is already 5.
LanguageSelect_Update:
    ld a, $01
    ldh [rVBK], a
    ld a, [wLanguage]
    or a
    jr nz, .checkLanguage1

    ld hl, $986c
    ld [hl], $04
    ld hl, $98cc
    ld [hl], $01
    jr .readJoypad

.checkLanguage1:
    cp $01
    jr nz, .checkLanguage2

    ld hl, $986c
    ld [hl], $01
    ld hl, $98cc
    ld [hl], $04
    ld hl, $992c
    ld [hl], $01
    jr .readJoypad

.checkLanguage2:
    cp $02
    jr nz, .checkLanguage3

    ld hl, $98cc
    ld [hl], $01
    ld hl, $992c
    ld [hl], $04
    ld hl, $998c
    ld [hl], $01
    jr .readJoypad

.checkLanguage3:
    cp $03
    jr nz, .checkLanguage4

    ld hl, $992c
    ld [hl], $01
    ld hl, $998c
    ld [hl], $04
    ld hl, $99ec
    ld [hl], $01
    jr .readJoypad

.checkLanguage4:
    cp $04
    jr nz, .readJoypad

    ld hl, $998c
    ld [hl], $01
    ld hl, $99ec
    ld [hl], $04

.readJoypad:
    ld a, [hJoypad]
    ld b, a
    ld a, [wLanguageDownHeld]
    or a
    jr nz, .checkNextKeyReleased

    bit 3, b
    jr z, .checkPrevKey

    ld a, b
    ld [wLanguageDownHeld], a
    ld a, [wLanguage]
    cp $04
    jr z, .checkPrevKey

    inc a
    ld [wLanguage], a
    ld a, SFX_MENU_MOVE
    call PlaySound
    jr .checkPrevKey

.checkNextKeyReleased:
    bit 3, b
    jr nz, .checkPrevKey

    xor a
    ld [wLanguageDownHeld], a

.checkPrevKey:
    ld a, [wLanguageUpHeld]
    or a
    jr nz, .checkPrevKeyReleased

    bit 2, b
    jr z, .checkConfirm

    ld a, b
    ld [wLanguageUpHeld], a
    ld a, [wLanguage]
    or a
    jr z, .checkConfirm

    dec a
    ld [wLanguage], a
    ld a, SFX_MENU_MOVE
    call PlaySound
    jr .checkConfirm

.checkPrevKeyReleased:
    bit 2, b
    jr nz, .checkConfirm

    xor a
    ld [wLanguageUpHeld], a

.checkConfirm:
    ld a, b
    and $f0
    or a
    jp z, LanguageSelect_Done

    ld a, [hGameState]
    cp $05
    ret z

    ld a, [wLanguage]
    ld hl, LanguageTable_English
    or a
    jp z, LanguageSelect_CopyTable

    ld hl, LanguageTable_Spanish
    dec a
    jp z, LanguageSelect_CopyTable

    ld hl, LanguageTable_French
    dec a
    jp z, LanguageSelect_CopyTable

    ld hl, LanguageTable_German
    dec a
    jp z, LanguageSelect_CopyTable

    ld hl, LanguageTable_Italian

; HL = language table of the chosen language. Copies its texts into wLangTextStartGame, wHighScoreTable and wLatestScoreText,
; and writes the level letter of that language into the ten high score entries.
; Then plays a sound, sets hGameState to 5 and starts hStateTimer.
LanguageSelect_CopyTable:
    ld de, wLangTextStartGame
    ld bc, $0051
    call DataTransfer
    ld a, [wLangTextHighScorePassword]
    ld l, a
    ld a, [wLangTextHighScorePassword + 1]
    ld h, a
    ld de, wHighScoreTable + $10
    ld bc, $0018
    call DataTransfer
    ld a, [wLangTextLatestScore]
    ld l, a
    ld a, [wLangTextLatestScore + 1]
    ld h, a
    ld de, wLatestScoreText
    ld bc, $001b
    call DataTransfer
    ld a, [wLangLevelLetter]
    ld hl, wHighScoreTable + $3d
    ld de, $001c
    ld b, $0a

.fillLoop:
    ld [hl], a
    add hl, de
    dec b
    jr nz, .fillLoop

    ld a, SFX_MENU_SELECT
    call PlaySound
    ld a, $05
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a

; Exit of LanguageSelect_Update when no action button is pressed, and the end of LanguageSelect_CopyTable.
LanguageSelect_Done:
    ret

Text_English_HighScorePassword:
    dw $987f
    db $00, $84, "    PASSWORD ", $00, $81, "PTPP", $ff

Text_French_HighScorePassword:
    dw $9881
    db $00, $84, "MOT DE PASSE ", $00, $81, "PTPP", $ff

Text_German_HighScorePassword:
    dw $987f
    db $00, $84, "    PASSWORT ", $00, $81, "PTPP", $ff

Text_Spanish_HighScorePassword:
    dw $9880
    db $00, $84, "  CONTRASE", $f0, "A ", $00, $81, "PTPP", $ff

Text_Italian_HighScorePassword:
    dw $987f
    db $00, $84, "    PASSWORD ", $00, $81, "PTPP", $ff

Text_English_LatestScore:
    dw $99fc
    db $00, $84, "       LATEST ", $00, $81, "000000", $ff

Text_French_LatestScore:
    dw $99fd
    db $00, $84, "      DERNIER ", $00, $81, "000000", $ff

Text_Spanish_LatestScore:
    dw $99ff
    db $00, $84, "  ", $ee, "LTIMA PUNT ", $00, $81, "000000", $ff

Text_Italian_LatestScore:
    dw $99fc
    db $00, $84, "       ULTIMO ", $00, $81, "000000", $ff

Text_German_LatestScore:
    dw $99fc
    db $00, $84, "       LETZTE ", $00, $81, "000000", $ff

; Called on every VBlank. When wTitleLetterArrived is not 0, draws that title letter on the background.
; Writes its colour attributes in VRAM bank 1 and its tiles in bank 0, using TitleLetterAttrTable and TitleLetterTileTable.
; Sets wTitleLetterArrived back to 0 so each letter is drawn once.
TitleScreen_VBlank:
    ld a, [wTitleLetterArrived]
    or a
    ret z

    ld c, a
    ld b, $00
    add a
    add a
    ld l, a
    ld h, b
    ld de, TitleLetterAttrTable
    add hl, de
    add hl, bc
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, $01
    ldh [rVBK], a
    xor a
    ld c, $06
    call CopyTilemapRect
    ld a, [wTitleLetterArrived]
    ld c, a
    ld b, $00
    add a
    add a
    ld l, a
    ld h, b
    ld de, TitleLetterTileTable
    add hl, de
    add hl, bc
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    xor a
    ldh [rVBK], a
    ld [wTitleLetterArrived], a
    ld a, $ad
    ld c, $06
    call CopyTilemapRect
    ret

; Slide the six title letters in from the right, one after the other, as sprites.
; When a letter reaches the end of its path, wTitleLetterArrived tells the caller to draw it on the background.
TitleScreen_SlideLetters:
    ld a, [wTitleLetterSliding]
    or a
    ret z

    push af
    ld a, $28
    ld hl, wOamBuffer
    call ClearOamEntries
    pop af
    cp $01
    jr nz, .checkLetter2

    ld a, [wTitleLetterPathPtrs]
    ld l, a
    ld a, [wTitleLetterPathPtrs + 1]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, .moveLetter1

    ld a, $02
    ld [wTitleLetterSliding], a
    ld a, $01
    ld [wTitleLetterArrived], a
    ret

.moveLetter1:
    ld b, a
    ld a, l
    ld [wTitleLetterPathPtrs], a
    ld a, h
    ld [wTitleLetterPathPtrs + 1], a
    ld a, [wTitleLetterX]
    add b
    ld [wTitleLetterX], a
    ld c, a
    ld hl, TitleLetterSprites_1
    jp TitleScreen_DrawLetterSprites

.checkLetter2:
    cp $02
    jr nz, .checkLetter3

    ld a, [wTitleLetterPathPtrs + 2]
    ld l, a
    ld a, [wTitleLetterPathPtrs + 3]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, .moveLetter2

    ld a, $03
    ld [wTitleLetterSliding], a
    ld a, $02
    ld [wTitleLetterArrived], a
    ret

.moveLetter2:
    ld b, a
    ld a, l
    ld [wTitleLetterPathPtrs + 2], a
    ld a, h
    ld [wTitleLetterPathPtrs + 3], a
    ld a, [wTitleLetterX + 1]
    add b
    ld [wTitleLetterX + 1], a
    ld c, a
    ld hl, TitleLetterSprites_2
    jp TitleScreen_DrawLetterSprites

.checkLetter3:
    cp $03
    jr nz, .checkLetter4

    ld a, [wTitleLetterPathPtrs + 4]
    ld l, a
    ld a, [wTitleLetterPathPtrs + 5]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, .moveLetter3

    ld a, $04
    ld [wTitleLetterSliding], a
    ld a, $03
    ld [wTitleLetterArrived], a
    ret

.moveLetter3:
    ld b, a
    ld a, l
    ld [wTitleLetterPathPtrs + 4], a
    ld a, h
    ld [wTitleLetterPathPtrs + 5], a
    ld a, [wTitleLetterX + 2]
    add b
    ld [wTitleLetterX + 2], a
    ld c, a
    ld hl, TitleLetterSprites_3
    jp TitleScreen_DrawLetterSprites

.checkLetter4:
    cp $04
    jr nz, .checkLetter5

    ld a, [wTitleLetterPathPtrs + 6]
    ld l, a
    ld a, [wTitleLetterPathPtrs + 7]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, .moveLetter4

    ld a, $05
    ld [wTitleLetterSliding], a
    ld a, $04
    ld [wTitleLetterArrived], a
    ret

.moveLetter4:
    ld b, a
    ld a, l
    ld [wTitleLetterPathPtrs + 6], a
    ld a, h
    ld [wTitleLetterPathPtrs + 7], a
    ld a, [wTitleLetterX + 3]
    add b
    ld [wTitleLetterX + 3], a
    ld c, a
    ld hl, TitleLetterSprites_4
    jr TitleScreen_DrawLetterSprites

.checkLetter5:
    cp $05
    jr nz, .checkLetter6

    ld a, [wTitleLetterPathPtrs + 8]
    ld l, a
    ld a, [wTitleLetterPathPtrs + 9]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, .moveLetter5

    ld a, $06
    ld [wTitleLetterSliding], a
    ld a, $05
    ld [wTitleLetterArrived], a
    ret

.moveLetter5:
    ld b, a
    ld a, l
    ld [wTitleLetterPathPtrs + 8], a
    ld a, h
    ld [wTitleLetterPathPtrs + 9], a
    ld a, [wTitleLetterX + 4]
    add b
    ld [wTitleLetterX + 4], a
    ld c, a
    ld hl, TitleLetterSprites_5
    jr TitleScreen_DrawLetterSprites

.checkLetter6:
    cp $06
    jr nz, TitleScreen_DrawLetterSprites

    ld a, [wTitleLetterPathPtrs + 10]
    ld l, a
    ld a, [wTitleLetterPathPtrs + 11]
    ld h, a
    ld a, [hl+]
    or a
    jr nz, .moveLetter6

    xor a
    ld [wTitleLetterSliding], a
    ld a, $06
    ld [wTitleLetterArrived], a
    ret

.moveLetter6:
    ld b, a
    ld a, l
    ld [wTitleLetterPathPtrs + 10], a
    ld a, h
    ld [wTitleLetterPathPtrs + 11], a
    ld a, [wTitleLetterX + 5]
    add b
    ld [wTitleLetterX + 5], a
    ld c, a
    ld hl, TitleLetterSprites_6
    jr TitleScreen_DrawLetterSprites

; Write the sprites of one letter. HL = sprite list (count, then y, x, tile, attribute), C = x offset.
TitleScreen_DrawLetterSprites:
    ld de, wOamBuffer
    ld b, $10
    ld a, [hl+]

.nextSprite:
    push af
    ld a, [hl+]
    add b
    ld [de], a
    inc de
    ld a, [hl+]
    add c
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    pop af
    dec a
    jr nz, .nextSprite

    ret

; Prepares the title letter animation. Sets the X offset of all six letters in wTitleLetterX to $a8
; and points each entry of wTitleLetterPathPtrs to the start of its path. Sets wTitleLetterSliding to 1 so the first letter starts to slide in.
; Called once when the title screen is set up.
TitleScreen_InitLetters:
    ld a, $a8
    ld [wTitleLetterX], a
    ld [wTitleLetterX + 1], a
    ld [wTitleLetterX + 2], a
    ld [wTitleLetterX + 3], a
    ld [wTitleLetterX + 4], a
    ld [wTitleLetterX + 5], a
    ld hl, TitleLetterPath_1
    ld a, l
    ld [wTitleLetterPathPtrs], a
    ld a, h
    ld [wTitleLetterPathPtrs + 1], a
    ld hl, TitleLetterPath_2
    ld a, l
    ld [wTitleLetterPathPtrs + 2], a
    ld a, h
    ld [wTitleLetterPathPtrs + 3], a
    ld hl, TitleLetterPath_3
    ld a, l
    ld [wTitleLetterPathPtrs + 4], a
    ld a, h
    ld [wTitleLetterPathPtrs + 5], a
    ld hl, TitleLetterPath_4
    ld a, l
    ld [wTitleLetterPathPtrs + 6], a
    ld a, h
    ld [wTitleLetterPathPtrs + 7], a
    ld hl, TitleLetterPath_5
    ld a, l
    ld [wTitleLetterPathPtrs + 8], a
    ld a, h
    ld [wTitleLetterPathPtrs + 9], a
    ld hl, TitleLetterPath_6
    ld a, l
    ld [wTitleLetterPathPtrs + 10], a
    ld a, h
    ld [wTitleLetterPathPtrs + 11], a
    ld a, $01
    ld [wTitleLetterSliding], a
    ret

    db $40, $98, $00, $0a, $20, $20, $20, $46, $45, $4c, $49, $43, $49, $54, $41, $54
    db $49, $4f, $4e, $53, $20, $20, $20, $20, $ff

; Hide A sprites starting at HL by clearing their Y position.
ClearOamEntries:
    ld b, a
    xor a
    ld de, $0004

.clearLoop:
    ld [hl], a
    add hl, de
    dec b
    jr nz, .clearLoop

    ret

; Copy the 9 sprites of the bat and ball to the OAM buffer.
InitBatSprites:
    ld hl, wOamBuffer
    ld de, BatAndBallStartSprites
    ld b, $09

.copySpriteLoop:
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]

    inc de
    ld [hl+], a

    dec b
    jr nz, .copySpriteLoop

    ld a, $01
    ld [wOamUsedLastFrame], a
    dec a
    ld [wOamUsed], a
    ld [wPowerupSpritesUsed], a
    ld de, wExtraSprites
    ld a, e
    ld [wOamWritePtr], a

    ld a, d
    ld [wOamWritePtr + 1], a
    ret

; Writes the bat sprites, the queued sprites from wExtraSprites, the balls and the falling power-ups into wOamBuffer.
; Skips the bat sprites while wBatExplosionTimer is not 0. Stores the sprite count in wOamUsedLastFrame.
; Called once per frame while a level is played, after the objects have moved, and once when a level is set up.
DrawBatSprites:
    ld hl, wOamBuffer + 4
    ld a, [wOamUsedLastFrame]
    call ClearOamEntries
    ld a, [wBatExplosionTimer]
    or a
    jr z, .batNotExploding

    ld hl, wOamBuffer
    jr .copyQueuedSprites

.batNotExploding:
    ld hl, wOamBuffer + 4
    ld a, [wBatX]
    add $08
    ld b, a
    ld a, [hTemp2]
    or a
    jr nz, .fourSpriteLowerRow

    ld de, BatShadowTiles_Normal
    ld c, $03
    jr .lowerRowLoop

.fourSpriteLowerRow:
    ld de, BatShadowTiles_Wide
    ld c, $04

.lowerRowLoop:
    ld a, $98
    ld [hl+], a
    ld a, b
    ld [hl+], a
    add $08
    ld b, a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .lowerRowLoop

    ld de, BatTiles_Normal
    ld a, [wWeaponFlag]
    or a
    jr z, .checkStickyBat

    ld de, BatTiles_Weapon

.checkStickyBat:
    ld a, [wBallOnBat]
    or a
    jr nz, .upperRowDataChosen

    ld a, [wBallSticks]
    or a
    jr z, .upperRowDataChosen

    ld de, BatTiles_Sticky

.upperRowDataChosen:
    ld a, [wBatWidth]
    cp $20
    jr z, .normalWidth

    ld a, $01
    jr .storeWideFlag

.normalWidth:
    xor a

.storeWideFlag:
    ld [hTemp2], a
    ld c, $04
    ld a, [wBatX]
    sub $08
    ld b, a

.upperRowLoop:
    ld a, [hTemp2]
    or a
    jr z, .writeUpperSprite

    ld a, c
    cp $02
    jr nz, .writeUpperSprite

    ld a, b
    add $08
    ld b, a

.writeUpperSprite:
    ld a, $90
    ld [hl+], a
    ld a, b
    ld [hl+], a
    add $08
    ld b, a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .upperRowLoop

.copyQueuedSprites:
    ld a, [wOamUsed]
    or a
    jr z, .stepNinjaFrame

    ld c, a
    ld de, wExtraSprites
    ld a, e
    ld [wOamWritePtr], a
    ld a, d
    ld [wOamWritePtr + 1], a

.queuedSpriteLoop:
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .queuedSpriteLoop

.stepNinjaFrame:
    ld a, [wNinjaActive]
    or a
    jr z, .drawBalls

    ld a, [wNinjaBallFrame]
    inc a
    cp $03
    jr nz, .storeNinjaFrame

    xor a

.storeNinjaFrame:
    ld [wNinjaBallFrame], a

.drawBalls:
    ld a, [wBallCount]
    or a
    jr z, .drawPowerups

    ld de, wBalls
    ld c, a

.nextBall:
    inc de
    ld a, [de]
    inc de
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    ld [hl+], a
    inc de
    inc de
    inc de
    ld a, [wNinjaActive]
    or a
    jr z, .normalBall

    ld a, [wNinjaBallFrame]
    or a
    jr nz, .ninjaFrameNot0

    ld a, $13
    ld [hl+], a
    jr .ninjaAttr

.ninjaFrameNot0:
    cp $01
    jr nz, .ninjaFrameNot1

    ld a, $14
    ld [hl+], a
    jr .ninjaAttr

.ninjaFrameNot1:
    cp $02
    jr nz, .ninjaAttr

    ld a, $15
    ld [hl+], a

.ninjaAttr:
    ld a, $0d
    ld [hl+], a
    jr .ballDone

.normalBall:
    ld [hl+], a
    ld a, $03
    ld [hl+], a

.ballDone:
    dec c
    jr nz, .nextBall

.drawPowerups:
    ld de, wFallingPowerups
    ld a, $08
    ld [hTemp], a

.powerupLoop:
    ld a, [de]
    or a
    jr z, .skipEmptySlot

    inc de
    ld a, [de]
    inc de
    ld b, a
    ld [hl+], a
    ld a, [de]
    inc de
    ld c, a
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, c
    add $08
    ld c, a
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, b
    add $08
    ld b, a
    ld [hl+], a
    ld a, c
    ld c, a
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, c
    sub $08
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [wPowerupSpritesUsed]
    add $04
    ld [wPowerupSpritesUsed], a
    jr .nextPowerup

.skipEmptySlot:
    ld a, e
    add $0c
    ld e, a
    jr nc, .nextPowerup

    inc d

.nextPowerup:
    ld a, [hTemp]
    dec a
    ld [hTemp], a
    jr nz, .powerupLoop

    ld b, $08
    ld a, [hTemp2]
    or a
    jr z, .storeOamUsed

    inc b

.storeOamUsed:
    ld a, [wBallCount]
    add b
    ld b, a
    ld a, [wPowerupSpritesUsed]
    add b
    ld b, a
    ld a, [wOamUsed]
    add b
    ld [wOamUsedLastFrame], a
    xor a
    ld [wOamUsed], a
    ld [wPowerupSpritesUsed], a
    ret

; Language tables, $51 bytes each. The table of the chosen language is copied to wLangTable.
; Fields: 7 menu and ending strings, 15 power-up messages, then HUD strings, tile map
; addresses and the bank that holds the language's graphics. See include/ram.inc.
LanguageTable_Italian:
    dw Text_Italian_StartGame
    dw Text_Italian_SfxOn
    dw Text_Italian_SfxOff
    dw Text_Italian_MusicOn
    dw Text_Italian_MusicOff
    dw Text_Italian_EnterPassword
    dw Text_Italian_Ending
    dw PowerupText_Italian_MultiBall
    dw PowerupText_Italian_SlowBall
    dw PowerupText_Italian_AntigravityBall
    dw PowerupText_Italian_SleepyBall
    dw PowerupText_Italian_RocketBat
    dw PowerupText_Italian_PlasmaBat
    dw PowerupText_Italian_BigBat
    dw PowerupText_Italian_StunBat
    dw PowerupText_Italian_MagneticBat
    dw PowerupText_Italian_ExtraLife
    dw PowerupText_Italian_LazerBat
    dw PowerupText_Italian_ReverseBat
    dw PowerupText_Italian_GhostUp
    dw PowerupText_Italian_GrenadeBat
    dw PowerupText_Italian_NinjaUp
    dw GrenadeTexts_Italian
    dw Text_Italian_Hud
    dw Text_Italian_LevelTitle
    dw Text_Italian_LevelPassword
    dw $dd2a
    dw $dd3f
    dw $996c
    dw $998d
    db $1d, $13, $00, $18, $19, $00
    db $4c
    db $10  ; bank of this language's graphics
    db $08
    dw Text_Italian_StartLevel
    dw $98ec
    dw Text_Italian_HighScorePassword
    dw Text_Italian_Pause
    dw Text_Italian_GameOver
    dw Text_Italian_LatestScore

LanguageTable_English:
    dw Text_English_StartGame
    dw Text_English_SfxOn
    dw Text_English_SfxOff
    dw Text_English_MusicOn
    dw Text_English_MusicOff
    dw Text_English_EnterPassword
    dw Text_English_Ending
    dw PowerupText_English_MultiBall
    dw PowerupText_English_SlowBall
    dw PowerupText_English_AntigravityBall
    dw PowerupText_English_SleepyBall
    dw PowerupText_English_RocketBat
    dw PowerupText_English_PlasmaBat
    dw PowerupText_English_BigBat
    dw PowerupText_English_StunBat
    dw PowerupText_English_MagneticBat
    dw PowerupText_English_ExtraLife
    dw PowerupText_English_LazerBat
    dw PowerupText_English_ReverseBat
    dw PowerupText_English_GhostUp
    dw PowerupText_English_GrenadeBat
    dw PowerupText_English_NinjaUp
    dw GrenadeTexts_English
    dw Text_English_Hud
    dw Text_English_LevelTitle
    dw Text_English_LevelPassword
    dw $dd2a
    dw $dd3f
    dw $996d
    dw $998c
    db $19, $18, $00, $19, $10, $10
    db $4c
    db $0b  ; bank of this language's graphics
    db $08
    dw Text_English_StartLevel
    dw $98eb
    dw Text_English_HighScorePassword
    dw Text_English_Pause
    dw Text_English_GameOver
    dw Text_English_LatestScore

LanguageTable_Spanish:
    dw Text_Spanish_StartGame
    dw Text_Spanish_SfxOn
    dw Text_Spanish_SfxOff
    dw Text_Spanish_MusicOn
    dw Text_Spanish_MusicOff
    dw Text_Spanish_EnterPassword
    dw Text_Spanish_Ending
    dw PowerupText_Spanish_MultiBall
    dw PowerupText_Spanish_SlowBall
    dw PowerupText_Spanish_AntigravityBall
    dw PowerupText_Spanish_SleepyBall
    dw PowerupText_Spanish_RocketBat
    dw PowerupText_Spanish_PlasmaBat
    dw PowerupText_Spanish_BigBat
    dw PowerupText_Spanish_StunBat
    dw PowerupText_Spanish_MagneticBat
    dw PowerupText_Spanish_ExtraLife
    dw PowerupText_Spanish_LazerBat
    dw PowerupText_Spanish_ReverseBat
    dw PowerupText_Spanish_GhostUp
    dw PowerupText_Spanish_GrenadeBat
    dw PowerupText_Spanish_NinjaUp
    dw GrenadeTexts_Spanish
    dw Text_Spanish_Hud
    dw Text_Spanish_LevelTitle
    dw Text_Spanish_LevelPassword
    dw $dd2b
    dw $dd43
    dw $996d
    dw $998b
    db $1d, $b9, $00, $18, $19, $00
    db $4e
    db $12  ; bank of this language's graphics
    db $0b
    dw Text_Spanish_StartLevel
    dw $98ed
    dw Text_Spanish_HighScorePassword
    dw Text_Spanish_Pause
    dw Text_Spanish_GameOver
    dw Text_Spanish_LatestScore

LanguageTable_French:
    dw Text_French_StartGame
    dw Text_French_SfxOn
    dw Text_French_SfxOff
    dw Text_French_MusicOn
    dw Text_French_MusicOff
    dw Text_French_EnterPassword
    dw Text_French_Ending
    dw PowerupText_French_MultiBall
    dw PowerupText_French_SlowBall
    dw PowerupText_French_AntigravityBall
    dw PowerupText_French_SleepyBall
    dw PowerupText_French_RocketBat
    dw PowerupText_French_PlasmaBat
    dw PowerupText_French_BigBat
    dw PowerupText_French_StunBat
    dw PowerupText_French_MagneticBat
    dw PowerupText_French_ExtraLife
    dw PowerupText_French_LazerBat
    dw PowerupText_French_ReverseBat
    dw PowerupText_French_GhostUp
    dw PowerupText_French_GrenadeBat
    dw PowerupText_French_NinjaUp
    dw GrenadeTexts_French
    dw Text_French_Hud
    dw Text_French_LevelTitle
    dw Text_French_LevelPassword
    dw $dd2c
    dw $dd3f
    dw $996c
    dw $998c
    db $19, $1f, $13, $18, $19, $18
    db $45
    db $11  ; bank of this language's graphics
    db $09
    dw Text_French_StartLevel
    dw $98ec
    dw Text_French_HighScorePassword
    dw Text_French_Pause
    dw Text_French_GameOver
    dw Text_French_LatestScore

LanguageTable_German:
    dw Text_German_StartGame
    dw Text_German_SfxOn
    dw Text_German_SfxOff
    dw Text_German_MusicOn
    dw Text_German_MusicOff
    dw Text_German_EnterPassword
    dw Text_German_Ending
    dw PowerupText_German_MultiBall
    dw PowerupText_German_SlowBall
    dw PowerupText_German_AntigravityBall
    dw PowerupText_German_SleepyBall
    dw PowerupText_German_RocketBat
    dw PowerupText_German_PlasmaBat
    dw PowerupText_German_BigBat
    dw PowerupText_German_StunBat
    dw PowerupText_German_MagneticBat
    dw PowerupText_German_ExtraLife
    dw PowerupText_German_LazerBat
    dw PowerupText_German_ReverseBat
    dw PowerupText_German_GhostUp
    dw PowerupText_German_GrenadeBat
    dw PowerupText_German_NinjaUp
    dw GrenadeTexts_German
    dw Text_German_Hud
    dw Text_German_LevelTitle
    dw Text_German_LevelPassword
    dw $dd2a
    dw $dd3f
    dw $996c
    dw $998a
    db $0b, $18, $00, $0b, $1f, $1d
    db $4c
    db $13  ; bank of this language's graphics
    db $08
    dw Text_German_StartLevel
    dw $98ed
    dw Text_German_HighScorePassword
    dw Text_German_Pause
    dw Text_German_GameOver
    dw Text_German_LatestScore

; Copies the start positions of the five BOING letters, their bob curve pointers and the 11 twinkle records into RAM.
; Also points wMenuScrollStepPtr at MenuSlideInSteps. Called once when the main menu is entered.
InitMenuSparkles:
    ld hl, wMenuSparkles
    ld de, BoingLetterStartPositions
    ld b, $0a

.copyPositionsLoop:
    ld a, [de]
    inc de
    ld [hl+], a
    dec b
    jr nz, .copyPositionsLoop

    ld de, MenuSparkleCurveStarts
    ld hl, wMenuSparkleCurvePtrs
    ld b, $0a

.copyCurveStartsLoop:
    ld a, [de]
    inc de
    ld [hl+], a
    dec b
    jr nz, .copyCurveStartsLoop

    ld hl, wMenuTwinkles
    ld de, MenuSparkleStartData
    ld b, $0b

.initAnimRecordLoop:
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    dec b
    jr nz, .initAnimRecordLoop

    ld hl, MenuSlideInSteps
    ld a, l
    ld [wMenuScrollStepPtr], a
    ld a, h
    ld [wMenuScrollStepPtr + 1], a
    ret

; Draws the five BOING letter sprites and moves them along their bob curves.
; While hMenuScrollY is not 0 it adds the next slide-in step to it and stops. Otherwise it redraws the twinkle sprites.
; Called once per frame by the main menu.
UpdateMenuSparkles:
    ld hl, wOamBuffer
    ld de, BoingLetterSprites
    ld a, $05
    ld bc, wMenuSparkles

.drawSparkleLoop:
    push af
    push bc
    ld a, [bc]
    inc bc
    push af
    ld a, [bc]
    ld b, a
    pop af
    ld c, a
    ld a, $04

.spriteLoop:
    push af
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
    pop af
    dec a
    jr nz, .spriteLoop

    pop bc
    inc bc
    inc bc
    pop af
    dec a
    jr nz, .drawSparkleLoop

    ld de, wMenuSparkles
    ld hl, wMenuSparkleCurvePtrs
    ld a, $05

.moveSparkleLoop:
    push af
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    ld b, a
    ld a, [bc]
    or a
    jr nz, .stepLoaded

    ld bc, BoingLetterBobSteps
    ld a, [bc]

.stepLoaded:
    inc bc
    push af
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    pop af
    inc de
    ld c, a
    ld a, [de]
    add c
    ld [de], a
    inc de
    pop af
    dec a
    jr nz, .moveSparkleLoop

    ld a, [hMenuScrollY]
    or a
    jr z, .scrollIsZero

    ld a, [wMenuScrollStepPtr]
    ld l, a
    ld a, [wMenuScrollStepPtr + 1]
    ld h, a
    ld a, [hl+]
    ld b, a
    ld a, l
    ld [wMenuScrollStepPtr], a
    ld a, h
    ld [wMenuScrollStepPtr + 1], a
    ld a, [hMenuScrollY]
    add b
    ld [hMenuScrollY], a
    ret

.scrollIsZero:
    ld a, $14
    ld hl, wOamBuffer + $50
    call ClearOamEntries
    ld a, [hMenuSparkleTick]
    inc a
    ld [hMenuSparkleTick], a
    ld a, $0b
    ld hl, wMenuTwinkles
    ld de, wOamBuffer + $50

.animRecordLoop:
    push af
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    or c
    jr z, .delayExpired

    dec bc
    dec hl
    dec hl
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld bc, $0007
    add hl, bc
    jr .nextAnimRecord

.delayExpired:
    ld b, [hl]
    ld a, [hMenuSparkleTick]
    and $03
    jr nz, .checkAnimEnd

    inc b

.checkAnimEnd:
    ld a, b
    cp $0b
    jr nz, .drawFrame

    ld a, $00
    ld [hl+], a
    ld bc, $0002
    add hl, bc
    ld a, [hFrameCounter]
    and $07
    ld [hl+], a
    push de
    ld a, [hl+]
    ld d, [hl]
    ld bc, $fff9
    add hl, bc
    ld [hl+], a
    ld [hl], d
    ld bc, $0007
    add hl, bc
    pop de
    jr .nextAnimRecord

.drawFrame:
    ld [hl+], a
    ld [hTemp + 1], a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    push hl
    push af
    push de
    ld a, [hTemp + 1]
    add a
    ld l, a
    ld h, $00
    ld de, MenuSparkleFrames
    add hl, de
    pop de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, $02
    ld [hTemp], a

.frameSpriteLoop:
    ld a, [hl+]
    add b
    ld [de], a
    inc de
    ld a, [hl+]
    add c
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    pop af
    ld [de], a
    inc de
    push af
    ld a, [hTemp]
    dec a
    ld [hTemp], a
    jr nz, .frameSpriteLoop

    pop af
    pop hl
    inc hl
    inc hl

.nextAnimRecord:
    pop af
    dec a
    jr nz, .animRecordLoop

    ret

Text_English_Hud:
    dw $9800
    db $00, $04, "SCORE ", $00, $01, "000000 ", $00, $04, "LIVES ", $00, $01, "0", $ff

Text_French_Hud:
    dw $9800
    db $00, $04, "SCORE ", $00, $01, "000000 ", $00, $04, " VIES ", $00, $01, "0", $ff

Text_Spanish_Hud:
    dw $9800
    db $00, $04, $ae, $af, $b0, $b1, $b2, " ", $00, $01, "000000 ", $00, $04, "VIDAS ", $00, $01, "0", $ff

Text_German_Hud:
    dw $9800
    db $00, $04, $ae, $af, $b3, $b4, $b5, " ", $00, $01, "000000 ", $00, $04, "LEBEN ", $00, $01, "0", $ff

Text_Italian_Hud:
    dw $9800
    db $00, $04, "SCORE ", $00, $01, "000000 ", $00, $04, " VITE ", $00, $01, "0", $ff

Text_English_LevelTitle:
    dw $9801
    db $00, $04, "     LEVEL ", $00, $01, "000    ", $ff

Text_French_LevelTitle:
    dw $9801
    db $00, $04, "     ETAGE ", $00, $01, "000    ", $ff

Text_Spanish_LevelTitle:
    dw $9801
    db $00, $04, "     NIVEL ", $00, $01, "000    ", $ff

Text_German_LevelTitle:
    dw $9801
    db $00, $04, "     LEVEL ", $00, $01, "000    ", $ff

Text_Italian_LevelTitle:
    dw $9801
    db $00, $04, "    LEVELLO ", $00, $01, "000   ", $ff

; A DrawString record that writes 20 spaces over the top tile row at $9800, drawn in the off phase of the blinking level title.
Text_LevelTitleBlank:
    dw $9800
    db $00, $04, "                    ", $ff

Tilemap_Level_001_7477:
    db $06, $08, $0a, $0a, $0a, $43, $44, $45, $0a, $0a, $0a, $0a, $43, $44, $45, $0a, $0a, $0a, $08, $07

Tilemap_Level_001_748b:
    db $0b
    db $0c
    db $2f
    db $49
    db $0c
    db $0c
    db $0d
    db $0e
    db $0c
    db $0c
    db $31
    db $37
    db $0c
    db $2e
    db $2f
    db $30

; Value added to hMenuScrollY each frame while the main menu slides in: -8 seventeen times, then -7, +4, +4, -3, -3, -2, -1 for a small bounce, followed by a 0.
MenuSlideInSteps:
    db $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8
    db $f8, $f9, $04, $04, $fd, $fd, $fe, $ff

    db $00

; Start values of the 11 menu sparkles, 6 bytes each: dw frames until the first twinkle, db x, db y, dw delay reloaded after each twinkle.
MenuSparkleStartData:
    db $01, $00, $82, $79, $c8, $00, $0a, $00, $51, $81, $c9, $00, $14, $00, $70, $38
    db $cb, $00, $1e, $00, $18, $50, $cc, $00, $64, $00, $0a, $3a, $cd, $00, $6e, $00
    db $8e, $35, $ce, $00, $78, $00, $51, $40, $cf, $00, $b4, $00, $40, $57, $d0, $00
    db $be, $00, $94, $6a, $d1, $00, $c8, $00, $18, $73, $d2, $00, $d3, $00, $2c, $8a
    db $d3, $00

MenuSparkleFrame_74f6:
    db $00, $00, $28, $00, $08, $2a

MenuSparkleFrame_74fc:
    db $00, $00, $2c, $00, $08, $2e

MenuSparkleFrame_7502:
    db $00, $00
    db $30, $00, $08, $32

MenuSparkleFrame_7508:
    db $00, $00, $34, $00, $08, $36

MenuSparkleFrame_750e:
    db $00, $00, $38, $00, $08, $3a

MenuSparkleFrame_7514:
    db $00, $00, $3c, $00, $08, $3e

MenuSparkleFrame_751a:
    db $00, $00, $40, $00, $08, $42

MenuSparkleFrame_7520:
    db $00, $00, $44, $00
    db $08, $46

MenuSparkleFrame_7526:
    db $00, $00, $48, $00, $08, $4a

MenuSparkleFrames:
    dw MenuSparkleFrame_74f6
    dw MenuSparkleFrame_74fc
    dw MenuSparkleFrame_7502
    dw MenuSparkleFrame_7508
    dw MenuSparkleFrame_750e
    dw MenuSparkleFrame_7514
    dw MenuSparkleFrame_751a
    dw MenuSparkleFrame_7520
    dw MenuSparkleFrame_7526
    dw MenuSparkleFrame_74fc
    dw MenuSparkleFrame_74f6

; Sprite layout of the five 16x32 letter objects B, O, I, N, G: 4 sprites each of (y offset, x offset, tile, attribute), top tiles $00-$12 with palette 1 and bottom tiles $14-$26 with palette 0.
BoingLetterSprites:
    db $00, $00
    db $00, $01, $00, $08, $02, $01, $10, $00, $14, $00, $10, $08, $16, $00, $00, $00
    db $04, $01, $00, $08, $06, $01, $10, $00, $18, $00, $10, $08, $1a, $00, $00, $00
    db $08, $01, $00, $08, $0a, $01, $10, $00, $1c, $00, $10, $08, $1e, $00, $00, $00
    db $0c, $01, $00, $08, $0e, $01, $10, $00, $20, $00, $10, $08, $22, $00, $00, $00
    db $10, $01, $00, $08, $12, $01, $10, $00, $24, $00, $10, $08, $26, $00

; Start position (x, y) of the five 16x32 letter objects B, O, I, N, G drawn by UpdateMenuSparkles: x $90, y $a4 each, which is below the visible screen.
BoingLetterStartPositions:
    db $90, $a4
    db $90, $a4, $90, $a4, $90, $a4, $90, $a4

; Movement steps of the menu sparkles. MenuSparkleCurveStarts points into this list.
MenuSparkleCurve:
    db $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04

; Looping y steps of the menu letter objects: -2, -2, -2, -1, -1, +1, +1, +2, +2, +2, then a 0 that restarts the list here.
BoingLetterBobSteps:
    db $fe, $fe, $fe, $ff, $ff
    db $01, $01, $02, $02, $02, $00

MenuSparkleCurveStarts:
    dw MenuSparkleCurve + $8
    dw MenuSparkleCurve + $6
    dw MenuSparkleCurve + $4
    dw MenuSparkleCurve + $2
    dw MenuSparkleCurve

; Jump to the init handler of game state hGameState.
RunStateInit:
    ld hl, StateInitHandlers
    jr RunStateUpdate.dispatch

; Jump to the update handler of game state hGameState.
RunStateUpdate:
    ld hl, StateUpdateHandlers

.dispatch:
    ld a, [hGameState]
    add a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl

; Runs the code at the address in HL and returns to the caller of this routine.
; Called by FrameLoop with HL = the handler stored in hFrameHandler.
CallHL:
    jp hl

; The frame loop of the current game state: wait for VBlank and call hFrameHandler.
FrameLoop:
    ld b, $ff
    ld a, $20
    call FadePalettes
    ld a, [hPaletteMode]
    cp $04
    jr nz, .checkPaletteMode3

    ld a, $02
    ld [hPaletteMode], a
    ld a, $03
    ldh [rIE], a
    ld b, $ff
    ld a, $20
    call FadePalettes2
    ld a, $04
    ld [hPaletteMode], a

.checkPaletteMode3:
    ld a, [hPaletteMode]
    cp $03
    jr nz, .startLoop

    ld a, $82
    ldh [rOCPS], a
    ld a, $03
    ldh [rIE], a
    ld d, $04
    call HighScores_SlideSprites
    ld a, $02
    ld [wHdmaMode], a

.startLoop:
    call SweepBricks

.frameLoop:
    call WaitVBlank
    call UpdateSound
    ld a, [hFrameHandler]
    ld l, a
    ld a, [hFrameHandler + 1]
    ld h, a
    call CallHL
    ld a, [hStateTimer]
    or a
    jr z, .frameLoop

    dec a
    ld [hStateTimer], a
    jr nz, .frameLoop

    ld e, SONG_SILENCE
    call StartSong
    xor a
    call PlaySound
    ld a, $09

.waitNineFramesLoop:
    push af
    call WaitVBlank
    call UpdateSound
    pop af
    dec a
    jr nz, .waitNineFramesLoop

    ld a, [hPaletteMode]
    cp $03
    jr nz, .checkPaletteMode4

    ld [wHdmaMode], a
    ld d, $fc
    call HighScores_SlideSprites
    call WaitVBlank
    ld a, $01
    ldh [rIE], a
    xor a
    ld [hPaletteMode], a

.checkPaletteMode4:
    ld a, [hPaletteMode]
    cp $04
    jr nz, .finalFade

    ld a, $02
    ld [hPaletteMode], a
    ld b, $01
    xor a
    call FadePalettes2
    ld a, $01
    ldh [rIE], a
    ld a, $04
    ld [hPaletteMode], a

.finalFade:
    ld b, $01
    xor a
    call FadePalettes
    ret

; Store HL as the per-frame handler (hFrameHandler) and enter the frame loop.
SetFrameHandler:
    ld a, l
    ld [hFrameHandler], a
    ld a, h
    ld [hFrameHandler + 1], a
    jp FrameLoop

; Makes Gameplay_Update the per-frame handler and starts FrameLoop.
; Reached through RunStateUpdate while hGameState is 2 (playing a level).
StateUpdate_Gameplay:
    ld hl, Gameplay_Update
    jp SetFrameHandler

; Makes TitleScreen_Update the per-frame handler and starts FrameLoop.
; Reached through RunStateUpdate while hGameState is 5 (title picture).
StateUpdate_TitleScreen:
    ld hl, TitleScreen_Update
    jp SetFrameHandler

; Makes GameOver_Update the per-frame handler and starts FrameLoop.
; Reached through RunStateUpdate while hGameState is 3 (game over).
StateUpdate_GameOver:
    ld hl, GameOver_Update
    jp SetFrameHandler

; Makes Pause_Update the per-frame handler and starts FrameLoop.
; Reached through RunStateUpdate while hGameState is 4 (pause).
StateUpdate_Pause:
    ld hl, Pause_Update
    jp SetFrameHandler

; Makes DeveloperLogos_Update the per-frame handler and starts FrameLoop.
; Reached through RunStateUpdate while hGameState is 6 ("Developed by" logos).
StateUpdate_DeveloperLogos:
    ld hl, DeveloperLogos_Update
    jp SetFrameHandler

; Makes PublisherLogo_Update the per-frame handler and starts FrameLoop.
; Reached through RunStateUpdate while hGameState is 12 (SCi logo).
StateUpdate_PublisherLogo:
    ld hl, PublisherLogo_Update
    jp SetFrameHandler

; Makes HighScores_Update the per-frame handler and starts FrameLoop.
; Reached through RunStateUpdate while hGameState is 7 (high score table).
StateUpdate_HighScores:
    ld hl, HighScores_Update
    jp SetFrameHandler

; Makes MainMenu_Update the per-frame handler and starts FrameLoop.
; Reached through RunStateUpdate while hGameState is 1 (main menu and password entry).
StateUpdate_MainMenu:
    ld hl, MainMenu_Update
    jp SetFrameHandler

; Makes Credits_Update the per-frame handler and starts FrameLoop.
; Reached through RunStateUpdate while hGameState is 8 (credits).
StateUpdate_Credits:
    ld hl, Credits_Update
    jp SetFrameHandler

; Makes LevelPassword_Update the per-frame handler and starts FrameLoop.
; Reached through RunStateUpdate while hGameState is 9 (password screen after every fourth level).
StateUpdate_LevelPassword:
    ld hl, LevelPassword_Update
    jp SetFrameHandler

; Makes ColorOnly_Update the per-frame handler and starts FrameLoop.
; Reached through RunStateUpdate while hGameState is 10 ("Please use a Game Boy Color" screen).
StateUpdate_ColorOnly:
    ld hl, ColorOnly_Update
    jp SetFrameHandler

; Makes LanguageSelect_Update the per-frame handler and starts FrameLoop.
; Reached through RunStateUpdate while hGameState is 11 (language selection).
StateUpdate_LanguageSelect:
    ld hl, LanguageSelect_Update
    jp SetFrameHandler

; Makes Copyright_Update the per-frame handler.
; Reached through StateUpdateHandlers when the state changes to the copyright screen.
StateUpdate_Copyright:
    ld hl, Copyright_Update
    jp SetFrameHandler

; Makes Ending_Update the per-frame handler.
; Reached through StateUpdateHandlers when the state changes to the ending screen.
StateUpdate_Ending:
    ld hl, Ending_Update
    jp SetFrameHandler

; Pick-up handler for each power-up type.
PowerupHandlers:
    dw Powerup_Slowball
    dw Powerup_Rocket
    dw Powerup_Smiley
    dw Powerup_Plasma
    dw Powerup_Poison
    dw Powerup_Milk
    dw Powerup_Clock
    dw Powerup_Pepper
    dw Powerup_Magnet
    dw Powerup_TripleBall
    dw Powerup_ExtraLife
    dw Powerup_Laser
    dw Powerup_Reverse
    dw Powerup_Ninja
    dw Powerup_Ghost
    dw Powerup_Grenade

; Fall speed of each of the 16 power-up types, a word added to the power-up's 16-bit y (low byte = fraction) each frame; all are $0080, half a pixel per frame.
PowerupFallSpeeds:
    db $80, $00

    db $80, $00

    db $80, $00
    db $80, $00

    db $80, $00, $80, $00
    db $80, $00

    db $80, $00

    db $80, $00, $80, $00, $80, $00
    db $80, $00

    db $80, $00
    db $80, $00, $80, $00

    db $80, $00

; Sprite of each power-up type: 4 x (tile, attribute), in the order
; top-left, top-right, bottom-right, bottom-left.
PowerupSprites:
    dw PowerupSprite_Slowball
    dw PowerupSprite_Rocket
    dw PowerupSprite_Smiley
    dw PowerupSprite_Plasma
    dw PowerupSprite_Poison
    dw PowerupSprite_Milk
    dw PowerupSprite_Clock
    dw PowerupSprite_Pepper
    dw PowerupSprite_Magnet
    dw PowerupSprite_TripleBall
    dw PowerupSprite_ExtraLife
    dw PowerupSprite_Laser
    dw PowerupSprite_Reverse
    dw PowerupSprite_Ninja
    dw PowerupSprite_Ghost
    dw PowerupSprite_Grenade
PowerupSprite_Slowball:
    db $22, $06, $23, $06, $25, $06, $24, $06
PowerupSprite_Rocket:
    db $08, $0e, $09, $0e, $0b, $0e, $0a, $0e
PowerupSprite_Smiley:
    db $2a, $00, $2b, $00, $2d, $00, $2c, $00
PowerupSprite_Plasma:
    db $2e, $05, $2f, $05, $31, $05, $30, $05
PowerupSprite_Poison:
    db $32, $06, $33, $06, $35, $06, $34, $06
PowerupSprite_Milk:
    db $36, $01, $37, $01, $39, $01, $38, $01
PowerupSprite_Clock:
    db $3a, $01, $3b, $01, $3d, $01, $3c, $01
PowerupSprite_Pepper:
    db $3e, $07, $3f, $07, $41, $07, $40, $07
PowerupSprite_Magnet:
    db $42, $06, $43, $06, $45, $06, $44, $06
PowerupSprite_TripleBall:
    db $46, $06, $47, $06, $49, $06, $48, $06
PowerupSprite_ExtraLife:
    db $7b, $06, $7c, $06, $7e, $06, $7d, $06
PowerupSprite_Laser:
    db $26, $04, $28, $04, $29, $04, $27, $04
PowerupSprite_Reverse:
    db $77, $01, $78, $01, $7a, $01, $79, $01
PowerupSprite_Ninja:
    db $04, $0a, $05, $0a, $07, $0a, $06, $0a
PowerupSprite_Ghost:
    db $00, $09, $02, $09, $03, $09, $01, $09
PowerupSprite_Grenade:
    db $0c, $09, $0d, $09, $0f, $09, $0e, $09

; Draw the 16 rows of 9 bricks from wBrickMap. The high nibble of each cell is its palette and is
; removed from the map here. Every cell that is not empty and not unbreakable is counted in wBricksLeft.
SetUpBricks:
    xor a
    ld [wBricksLeft], a
    ld a, $01
    ldh [rVBK], a
    ld hl, $9841
    ld de, wBrickMap + $11
    ld b, $10

; Starts one of the 16 brick rows of SetUpBricks. B = rows left.
; Sets C to 9, the number of cells in the row, then draws the cells.
SetUpBricks_Row:
    ld c, $09

; Draws one cell of wBrickMap. DE = its map entry, HL = its tile map address.
; Removes the palette nibble from the entry and counts every brick that is not unbreakable in wBricksLeft.
; Empty cells only get shadow graphics next to a brick.
SetUpBricks_Cell:
    ld a, [de]
    or a
    jr z, .emptyCell

    push af
    swap a
    and $07
    ld [hl+], a
    ld [hl], a
    pop af
    and $0f
    ld [de], a
    cp $0e
    jr nz, .breakableBrick

    xor a
    ldh [rVBK], a
    dec l
    ld [hl], $4c
    inc l
    ld [hl], $4d
    dec l
    ld a, b
    cp $10
    jr z, .unbreakableTopRow

    ld a, c
    cp $09
    jr nz, .unbreakableDrawn

    ld [hl], $51
    jr .unbreakableDrawn

.unbreakableTopRow:
    ld [hl], $51
    inc l
    ld [hl], $52
    dec l

.unbreakableDrawn:
    ld a, $01
    ldh [rVBK], a
    jr .nextCell

.breakableBrick:
    ld a, [wBricksLeft]
    inc a
    ld [wBricksLeft], a
    dec l
    xor a
    ldh [rVBK], a
    ld [hl], $27
    inc l
    ld [hl], $28
    dec l
    ld a, b
    cp $10
    jr z, .breakableTopRow

    ld a, c
    cp $09
    jr nz, .breakableDrawn

    ld [hl], $29
    jr .breakableDrawn

.breakableTopRow:
    ld [hl], $29
    inc l
    ld [hl], $2a
    dec l

.breakableDrawn:
    ld a, $01
    ldh [rVBK], a
    jr .nextCell

.emptyCell:
    xor a
    ldh [rVBK], a
    push hl
    ld hl, $ffdf
    add hl, de
    ld a, [hl]
    pop hl
    cp $0f
    jr z, .setLeftHalfAttr

    push hl
    ld hl, $ffef
    add hl, de
    ld a, [hl]
    pop hl
    or a
    jr z, .checkRightHalf

.setLeftHalfAttr:
    ld a, $01
    ldh [rVBK], a
    ld [hl], $0a
    xor a
    ldh [rVBK], a

.checkRightHalf:
    push hl
    ld hl, $ffdf
    add hl, de
    ld a, [hl]
    pop hl
    cp $0f
    jr z, .setRightHalfAttr

    push hl
    ld hl, $fff0
    add hl, de
    ld a, [hl]
    pop hl
    or a
    jr z, .emptyCellDone

.setRightHalfAttr:
    inc hl
    ld a, $01
    ldh [rVBK], a
    ld [hl], $0a
    dec hl
    xor a
    ldh [rVBK], a

.emptyCellDone:
    ld a, $01
    ldh [rVBK], a

.nextCell:
    inc de
    inc l
    inc l
    dec c
    jp nz, SetUpBricks_Cell

    ld a, l
    add $0e
    ld l, a
    jr nc, .noCarryTilemap

    inc h

.noCarryTilemap:
    ld a, e
    add $07
    ld e, a
    jr nc, .noCarryMap

    inc d

.noCarryMap:
    dec b
    jp nz, SetUpBricks_Row

    ret

; Every third frame, point the HDMA transfer at the next frame of the "HIGH SCORE" animation.
HighScores_AdvanceAnim:
    ld a, [wHighScoreAnimTick]
    inc a
    ld [wHighScoreAnimTick], a
    cp $03
    ret nz

    xor a
    ld [wHighScoreAnimTick], a
    ld a, [wHighScoreAnimPtr]
    ld l, a
    ld a, [wHighScoreAnimPtr + 1]
    ld h, a
    ld a, [hl]
    cp $01
    jr nz, .readFrame

    ld hl, HighScoreAnimFrames

.readFrame:
    ld a, [hl+]
    ld [wHdmaSource], a
    ld a, [hl+]
    ld [wHdmaSource + 1], a
    ld a, l
    ld [wHighScoreAnimPtr], a
    ld a, h
    ld [wHighScoreAnimPtr + 1], a
    ret

; Sets up the 20 sprite pairs of the high score screen in wOamBuffer from HighScoreSpritePositions.
; Also fills wHighScoreSpriteFrames with the starting animation step of each sprite.
; Called once when the high score screen is built.
HighScores_InitSprites:
    ld b, $14
    ld hl, wOamBuffer
    ld de, HighScoreSpritePositions

.nextSpritePair:
    ld a, [de]
    inc de
    ld [hl+], a
    push af
    ld a, [de]
    inc de
    ld [hl+], a
    ld c, a
    xor a
    ld [hl+], a
    ld [hl+], a
    pop af
    ld [hl+], a
    ld a, $08
    add c
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    dec b
    jr nz, .nextSpritePair

    ld b, $04
    ld hl, wHighScoreSpriteFrames
    xor a

.nextFrameRow:
    ld c, $05
    push af

.nextFrameInRow:
    ld [hl+], a
    add $04
    dec c
    jr nz, .nextFrameInRow

    pop af
    add $04
    dec b
    jr nz, .nextFrameRow

    ret

; Advances the animation of all 20 high score sprite pairs by one step, wrapping at 32 steps.
; Writes the new tile numbers from HighScoreSpriteTiles into wOamBuffer.
; Called once after the sprites are set up, once per frame by HighScores_Update and by HighScores_SlideSprites.
HighScores_MoveSprites:
    ld a, $14
    ld de, wHighScoreSpriteFrames
    ld hl, wOamBuffer + 2
    ld bc, $0004

.nextSpritePair:
    push af
    ld a, [de]
    inc a
    and $1f
    ld [de], a
    inc de
    push de
    push hl
    add a
    ld l, a
    ld h, $00
    ld de, HighScoreSpriteTiles
    add hl, de
    ld d, h
    ld e, l
    pop hl
    ld a, [de]
    inc de
    ld [hl], a
    add hl, bc
    ld a, [de]
    ld [hl], a
    add hl, bc
    pop de
    pop af
    dec a
    jr nz, .nextSpritePair

    ret

; Slide the four rows of sprites sideways for 32 frames. D is the step per frame; rows alternate direction.
HighScores_SlideSprites:
    ld a, $20

.frameLoop:
    push af
    call WaitVBlank
    push de
    call HighScores_MoveSprites
    pop de
    ld hl, wBatX
    ld c, $04

.nextRow:
    ld b, $0a

.nextSpriteInRow:
    ld a, [hl]
    add d
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    dec b
    jr nz, .nextSpriteInRow

    ld a, d
    cpl
    inc a
    ld d, a
    dec c
    jr nz, .nextRow

    pop af
    dec a
    jr nz, .frameLoop

    ret

; Tile pair for each of the 32 animation steps of a high score sprite.
HighScoreSpriteTiles:
    db $00, $02, $00, $02, $04, $06, $04, $06, $08, $0a, $08, $0a, $0c, $0e, $0c, $0e
    db $10, $12, $10, $12, $14, $16, $14, $16, $18, $1a, $18, $1a, $1c, $1e, $1c, $1e
    db $20, $22, $20, $22, $24, $26, $24, $26, $28, $2a, $28, $2a, $2c, $2e, $2c, $2e
    db $30, $32, $30, $32, $34, $36, $34, $36, $38, $3a, $38, $3a, $3c, $3e, $3c, $3e

; Y and X of the 20 sprite pairs on the high score screen.
HighScoreSpritePositions:
    db $37, $a6, $37, $ba, $37, $ce, $37, $e2, $37, $f6, $4f, $a6, $4f, $ba, $4f, $ce
    db $4f, $e2, $4f, $f6, $67, $a6, $67, $ba, $67, $ce, $67, $e2, $67, $f6, $7f, $a6
    db $7f, $ba, $7f, $ce, $7f, $e2, $7f, $f6

; Frames of the animated "HIGH SCORE" title, in the language graphics bank. A value of 1 restarts the list.
; The labels are the English ones. Every language bank has its frames at the same addresses.
HighScoreAnimFrames:
    dw HighScoreAnim_English_00

HighScoreAnimFrames_Second:
    dw HighScoreAnim_English_01
    dw HighScoreAnim_English_02
    dw HighScoreAnim_English_03
    dw HighScoreAnim_English_04
    dw HighScoreAnim_English_05
    dw HighScoreAnim_English_06
    dw HighScoreAnim_English_07
    dw HighScoreAnim_English_08
    dw HighScoreAnim_English_09
    dw HighScoreAnim_English_10
    dw HighScoreAnim_English_11
    dw HighScoreAnim_English_12
    dw HighScoreAnim_English_13
    dw HighScoreAnim_English_14
    dw HighScoreAnim_English_15
    dw HighScoreAnim_English_16
    dw HighScoreAnim_English_17
    db $01

    db $00

; Brick redraw routine, indexed by wHitRedrawIndex.
BrickRedrawHandlers:
    dw BrickRedrawCase_Lit_Below
    dw BrickRedrawCase_Lit_BelowRight
    dw BrickRedrawCase_Lit_BelowLeft
    dw BrickRedrawCase_Lit
    dw BrickRedrawCase_ShadowRight_Below
    dw BrickRedrawCase_ShadowRight_BelowRight
    dw BrickRedrawCase_ShadowRight_BelowLeft
    dw BrickRedrawCase_ShadowRight
    dw BrickRedrawCase_ShadowLeft_Below
    dw BrickRedrawCase_ShadowLeft_BelowRight
    dw BrickRedrawCase_ShadowLeft_BelowLeft
    dw BrickRedrawCase_ShadowLeft
    dw BrickRedrawCase_Shadow_Below
    dw BrickRedrawCase_Shadow_BelowRight
    dw BrickRedrawCase_Shadow_BelowLeft
    dw BrickRedrawCase_Shadow
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw BrickRedrawCase_Shadow_BelowHalfShadow
    dw BrickRedrawCase_Shadow_BelowRight
    dw BrickRedrawCase_Shadow_BelowLeftShadow
    dw BrickRedrawCase_Shadow
    dw BrickRedrawCase_Shadow_BelowHalfShadow
    dw BrickRedrawCase_Shadow_BelowRight
    dw BrickRedrawCase_Shadow_BelowLeftShadow
    dw BrickRedrawCase_Shadow
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw $0000 ; not used
    dw BrickRedrawCase_Shadow
    dw BrickRedrawCase_Shadow
    dw BrickRedrawCase_Shadow_BelowLeftShadow
    dw BrickRedrawCase_Shadow

; Called once per frame on the credits screen. Does nothing while wCreditsRowColour is $ff.
; Scrolls the credits one pixel by increasing wCreditsScrollY and moving the raster table entries up one row.
; Any button press sets wCreditsScrollDone, plays a sound and returns to the main menu state.
Credits_Update:
    ld hl, wCreditsRowColour
    ld a, [hl]
    inc a
    ret z

    ld [hl], $ff
    cp $ff
    jr z, .advanceScroll

    dec a
    ld [wRasterTable + 143 * 10 + 8], a

.advanceScroll:
    ld a, [wCreditsScrollY]
    inc a
    ld [wCreditsScrollY], a
    ld de, wRasterTable + 8
    ld hl, wRasterTable + 18
    ld b, $8f

.shiftEntryLoop:
    ld a, [hl]
    ld [de], a
    ld a, l
    add $0a
    ld l, a
    jr nc, .noCarrySource

    inc h

.noCarrySource:
    ld a, e
    add $0a
    ld e, a
    jr nc, .noCarryDest

    inc d

.noCarryDest:
    dec b
    jr nz, .shiftEntryLoop

    xor a
    ld [wCreditsScrollDone], a
    ld a, [hGameState]
    cp $01
    ret z

    ld a, [hJoypad]
    and $f0
    or a
    jr z, .noButton

    ld a, $ff
    ld [wCreditsScrollDone], a
    ld a, $01
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ld a, SFX_MENU_SELECT
    call PlaySound

.noButton:
    ret

GBC_Check:
    ; RAM test
    xor a                       ; switch WRAM1 to Bank 0
    ldh [rSVBK], a
    xor a                       ; store 0 to first byte of WRAM1
    ld [wRasterPaletteBuffer], a
    ld a, $02                   ; switch WRAM to Bank 2
    ldh [rSVBK], a
    ld [wRasterPaletteBuffer], a               ; Store value $02 to the first byte of WRAM1 Bank 2
    xor a                       ; switch WRAM1 back to Bank 0
    ldh [rSVBK], a
    ld a, [wRasterPaletteBuffer]               ; Read value from first byte of WRAM1
    or a                        ; Bitwise OR with itself, Zero flag should be set. LD instruction doesn't change register flags in Z80...
    jr z, .RAMCheckPass         ; RAM check passed, WRAM bank switching works so this is a GBC with a MBC

    ; RAM check failed, this might not be a GBC or wrong hardware
    ld a, $0a
    push af                 ; Push A = 0A to stack
    jr .NotGBC

.RAMCheckPass:
    push af                 ; If check passed, A should be 00.
    ldh a, [rKEY1]          ; get CPU speed
    bit 7, a                ; check for bit 7
    jr nz, .SoftReset       ; if bit 7 is set, that means CPU is already at double speed. Probably a soft reset.

    ld a, $01               ; otherwise, prepare CPU for double speed
    ldh [rKEY1], a
    ld a, P1F_GET_NONE      ; You need to read the controller before doubling CPU speed, yeah weird.
    ldh [rP1], a
    stop                    ; Double CPU speed.

.NotGBC:
.SoftReset:
    xor a                   ; Zero out A register
    ldh [rSCY], a           ; Reset scroll
    ldh [rSCX], a
    ; Clear WRAM (except stack around $C100-$C1FD)
    ld bc, $1e00
    call ClearRAM

    ; Clear part of start of WRAM0
    ld bc, $0068
    ld hl, wSoundState
    call ClearRAM

    ; Clear HRAM
    ld hl, hOamDmaRoutine
    ld bc, $007f
    call ClearRAM
    call LoadOAMCode            ; Load OAM DMA code
    call LoadHighScores         ; Load High Scores info
    pop af                      ; Get RAM Check info back to A
    ld [hGameState], a               ; Store to RAM
    ret                         ; return

; Start values of the first 9 OAM entries: 4 bat shadow sprites at y $98 (tiles $1e-$21), the 4 bat sprites at y $90 (tiles $56, $57) and the ball (tile 0, palette 3) at y $89, x $54.
BatAndBallStartSprites:
    db $98, $50, $1e, $02, $98, $58, $1f, $02, $98, $60, $20, $02, $98, $68, $21, $02
    db $90, $48, $56, $02, $90, $50, $57, $02, $90, $58, $57, $22, $90, $60, $56, $22
    db $89, $54, $00, $03

; Tile and attribute of shadow sprites 1 to 3 of the bat (dither tiles $1f, $20, $21, palette 2), drawn at y $98 when hTemp2 is 0 on entry.
BatShadowTiles_Normal:
    db $1f, $02, $20, $02, $21, $02

; Four-sprite version of the bat shadow row ($1f, $20, $20, $21), used when hTemp2 is not 0 on entry. hTemp2 is a scratch byte that Gameplay_UpdateBalls and ProcessBrickHitQueue overwrite between frames, so it is not a reliable wide-bat flag. In play this row is almost never drawn (6 of 21615 frames with a normal-width bat, never with a wide bat).
BatShadowTiles_Wide:
    db $1f, $02, $20, $02, $20, $02
    db $21, $02

; Tile and attribute of the 4 sprites of the bat itself (y $90, from x = wBatX - 8): $56, $57, $57 flipped, $56 flipped, palette 2.
BatTiles_Normal:
    db $56, $02, $57, $02, $57, $22, $56, $22

; Bat sprites while wWeaponFlag is set: the two middle sprites become tile $08 (palette 1), the weapon bat.
BatTiles_Weapon:
    db $56, $02, $08, $01, $08, $21, $56, $22

; Bat sprites while wBallSticks is set and no ball is on the bat: the two middle sprites become tile $07 (palette 1).
BatTiles_Sticky:
    db $56, $02, $07, $01, $07, $21, $56, $22

UnbreakableHitEffectFrames:
    db $62, $62, $62, $61, $61, $61, $60, $60
    db $60, $5f, $5f, $5f, $5e, $5e, $5e, $5d, $5d, $5d

BrickBreakEffectFrames:
    db $58, $58, $58, $58, $59, $59, $59, $59, $5a, $5a

    db $5a, $5a, $5b, $5b, $5b, $5b, $5a, $5a, $5a, $5a, $59, $59, $59, $59, $58, $58
    db $58, $58

PickupEffectFrames:
    db $11

    db $13

    db $15, $17, $19, $1b

; Number of cells on each diagonal of SweepBricks.
BrickSweepLengths:
    db $01, $02, $03, $04, $05, $06, $07, $08, $09, $09, $09, $09, $09, $08, $07, $06
    db $05, $04, $03, $02, $01, $ff

; Init handler for each game state.
StateInitHandlers:
    dw StateInit_Copyright
    dw StateInit_MainMenu
    dw LoadLevel
    dw StateInit_GameOver
    dw StateInit_Pause
    dw StateInit_TitleScreen
    dw StateInit_DeveloperLogos
    dw StateInit_HighScores
    dw StateInit_Credits
    dw StateInit_LevelPassword
    dw StateInit_ColorOnly
    dw StateInit_LanguageSelect
    dw StateInit_PublisherLogo
    dw StateInit_Ending

; Update handler for each game state.
StateUpdateHandlers:
    dw StateUpdate_Copyright
    dw StateUpdate_MainMenu
    dw StateUpdate_Gameplay
    dw StateUpdate_GameOver
    dw StateUpdate_Pause
    dw StateUpdate_TitleScreen
    dw StateUpdate_DeveloperLogos
    dw StateUpdate_HighScores
    dw StateUpdate_Credits
    dw StateUpdate_LevelPassword
    dw StateUpdate_ColorOnly
    dw StateUpdate_LanguageSelect
    dw StateUpdate_PublisherLogo
    dw StateUpdate_Ending

; Called once per frame on the game over screen.
; Any button press builds the score text, plays a sound and changes the state to the high score screen.
; wHighScoresNextState is set so that screen leads on to the title picture.
GameOver_Update:
    ld a, [hGameState]
    cp $07
    ret z

    ld a, [hJoypad]
    and $f0
    or a
    jr z, .noButton

    ld a, $07
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ld a, $05
    ld [wHighScoresNextState], a
    ld a, $ff
    ld [wMenuIdleTimer], a
    call BuildScoreText
    ld a, SFX_MENU_SELECT
    call PlaySound

.noButton:
    ret

; Called once per frame while the game is paused.
; Start returns to the playing state, plays a sound and clears the joypad and bat movement flags.
; hStateTimer is set to $28 so gameplay input is ignored for a short time.
Pause_Update:
    ld a, [hGameState]
    cp $02
    ret z

    ld a, [hJoypad]
    bit 7, a
    jr z, .startNotPressed

    ld a, $02
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    xor a
    ld [hJoypad], a
    ld [hLastDirection], a
    ld [wBatMovingRight], a
    ld [wBatMovingLeft], a
    ld a, SFX_MENU_SELECT
    call PlaySound

.startNotPressed:
    ret

; Sets all 6 digits of wScoreDigits to 1, which is the value for a zero digit.
; Called by StartGame when a new game begins.
ResetScore:
    ld hl, wScoreDigits
    ld a, $01
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ret

; Add B to the score. One unit is 10 points on screen.
AddScore:
    ld c, b
    ld b, $00

; Add BC to the score.
AddScoreBC:
    ld a, $0b
    ld hl, wScoreDigits + 5

.incDigit:
    inc [hl]
    cp [hl]
    jr nz, .noDigitCarry

    ld [hl], $01
    dec hl
    jr .incDigit

.noDigitCarry:
    xor a
    ld [wScoreDigits], a
    dec bc
    ld a, b
    or c
    jr nz, AddScoreBC

    ret

; Wait for the next frame. A+B+Select+Start resets the game.
WaitVBlank:
    call ReadJoypad
    ld a, [hGameState]
    or a
    jr z, .waitForVBlank

    ld a, [hJoypad]
    and $f0
    cp $f0
    jp z, Boot

.waitForVBlank:
    halt
    nop
    ld a, [hVBlankDone]
    or a
    jr z, .waitForVBlank

    xor a
    ld [hVBlankDone], a
    ret

; Called once per frame on the ending screen shown after the last level.
; Any button press plays a sound and changes the state to 2, the playing state.
; hStateTimer is set to $28.
Ending_Update:
    ld a, [hGameState]
    cp $02
    ret z

    ld a, [hJoypad]
    and $f0
    or a
    jr z, .noButtonPressed

    ld a, $02
    ld [hGameState], a
    ld a, $28
    ld [hStateTimer], a
    ld a, SFX_MENU_SELECT
    call PlaySound

.noButtonPressed:
    ret

; Called once per frame while the developer logos are shown.
; Counts down hLogoTimer.
; When it reaches 0 the state changes to $0B, the language select screen.
DeveloperLogos_Update:
    ld a, [hLogoTimer]
    or a
    jr z, .timerExpired

    dec a
    ld [hLogoTimer], a
    ret

.timerExpired:
    ld a, $0b
    ld [hGameState], a
    ld a, $01
    ld [hStateTimer], a
    ret

; Frame handler of the screen shown on a console that is not a Game Boy Color.
; Loops on itself, so the game stays on this screen.
ColorOnly_Update:
    jr ColorOnly_Update

; Filler. The rest of the bank is a stale copy of the last 854 bytes of bank 0 ($3CAA-$3FFF).
; Nothing runs or reads it.
BankFiller_001:
    db $01, $90, $00, $cd, $b0, $01, $21, $74, $55, $11, $00, $80, $01, $10, $00, $cd
    db $b0, $01, $3e, $26, $11, $00, $98, $21, $14, $56, $06, $14, $0e, $12, $cd, $d4
    db $01, $21, $a8, $4c, $11, $03, $dd, $01, $06, $00, $cd, $b0, $01, $fa, $33, $df
    db $6f, $fa, $34, $df, $67, $11, $0b, $dd, $01, $3e, $00, $cd, $b0, $01, $3e, $01
    db $cd, $06, $02, $21, $84, $67, $7d, $ea, $09, $dd, $7c, $ea, $0a, $dd, $cd, $de
    db $0d, $21, $17, $dd, $fa, $fc, $de, $fe, $04, $20, $0d, $fa, $3c, $d7, $22, $fa
    db $3d, $d7, $22, $fa, $3e, $d7, $18, $0b, $fa, $3b, $d7, $22, $fa, $3c, $d7, $22
    db $fa, $3d, $d7, $32, $2b, $cd, $74, $09, $fa, $35, $df, $6f, $fa, $36, $df, $67
    db $11, $e3, $cc, $fa, $7c, $cb, $22, $12, $13, $fa, $7d, $cb, $22, $12, $13, $fa
    db $7e, $cb, $22, $12, $13, $fa, $7f, $cb, $22, $12, $fa, $4d, $dd, $6f, $fa, $4e
    db $dd, $67, $11, $f4, $01, $19, $7d, $ea, $4d, $dd, $7c, $ea, $4e, $dd, $7d, $ea
    db $49, $dd, $7c, $ea, $4a, $dd, $cd, $09, $5c, $fa, $4f, $dd, $6f, $fa, $50, $dd
    db $67, $11, $32, $00, $19, $7d, $ea, $4f, $dd, $7c, $ea, $50, $dd, $44, $4d, $cd
    db $3c, $7c, $21, $0b, $dd, $cd, $54, $0e, $cd, $54, $0e, $cd, $54, $0e, $3e, $2d
    db $ea, $4b, $dd, $21, $ad, $67, $7d, $ea, $60, $dd, $7c, $ea, $61, $dd, $21, $bc
    db $67, $7d, $ea, $6f, $dd, $7c, $ea, $70, $dd, $21, $cb, $67, $7d, $ea, $7e, $dd
    db $7c, $ea, $7f, $dd, $21, $60, $dd, $cd, $2e, $5d, $21, $6f, $dd, $cd, $2e, $5d
    db $21, $7e, $dd, $cd, $2e, $5d, $21, $8d, $dd, $7d, $ea, $6d, $dd, $7c, $ea, $6e
    db $dd, $21, $dd, $dd, $7d, $ea, $7c, $dd, $7c, $ea, $7d, $dd, $21, $2d, $de, $7d
    db $ea, $8b, $dd, $7c, $ea, $8c, $dd, $21, $43, $65, $11, $81, $de, $01, $37, $00
    db $cd, $b0, $01, $c9, $21, $b3, $02, $7d, $ea, $96, $ff, $7c, $ea, $97, $ff, $3e
    db $01, $ea, $9c, $ff, $ea, $9b, $ff, $3e, $01, $ea, $9a, $ff, $af, $e0, $43, $11
    db $b0, $43, $cd, $61, $00, $3e, $0d, $cd, $06, $02, $3e, $01, $e0, $4f, $af, $11
    db $00, $98, $21, $50, $51, $06, $14, $0e, $12, $cd, $d4, $01, $af, $ea, $fc, $de
    db $ea, $fd, $de, $ea, $fe, $de, $e0, $4f, $21, $b8, $49, $11, $00, $90, $01, $30
    db $06, $cd, $b0, $01, $11, $00, $98, $21, $e8, $4f, $06, $14, $0e, $12, $cd, $d4
    db $01, $3e, $01, $cd, $06, $02, $c9, $fa, $bb, $da, $b7, $c0, $3e, $06, $ea, $00
    db $21, $cd, $3f, $47, $3e, $01, $ea, $00, $21, $c9, $d5, $e5, $c5, $5f, $fa, $bc
    db $da, $b7, $20, $0d, $3e, $06, $ea, $00, $21, $cd, $19, $48, $3e, $01, $ea, $00
    db $21, $c1, $e1, $d1, $c9, $3e, $06, $ea, $00, $21, $cd, $00, $40, $3e, $01, $ea
    db $00, $21, $c9, $3e, $46, $ea, $91, $ff, $21, $b3, $02, $7d, $ea, $96, $ff, $7c
    db $ea, $97, $ff, $3e, $01, $ea, $9c, $ff, $ea, $9b, $ff, $3e, $01, $ea, $9a, $ff
    db $af, $e0, $43, $11, $30, $45, $cd, $61, $00, $3e, $03, $cd, $06, $02, $3e, $01
    db $e0, $4f, $af, $11, $00, $98, $21, $98, $5e, $06, $14, $0e, $12, $cd, $d4, $01
    db $af, $e0, $4f, $21, $80, $55, $11, $00, $90, $01, $b0, $07, $cd, $b0, $01, $af
    db $11, $00, $98, $21, $30, $5d, $06, $14, $0e, $12, $cd, $d4, $01, $3e, $01, $cd
    db $06, $02, $c9, $fa, $91, $ff, $b7, $28, $05, $3d, $ea, $91, $ff, $c9, $3e, $0c
    db $ea, $9f, $ff, $3e, $01, $ea, $a0, $ff, $c9, $1e, $08, $cd, $51, $3e, $af, $e0
    db $43, $21, $b3, $02, $7d, $ea, $96, $ff, $7c, $ea, $97, $ff, $af, $ea, $9c, $ff
    db $ea, $fe, $dc, $3e, $01, $ea, $9a, $ff, $11, $b0, $44, $cd, $61, $00, $3e, $0e
    db $ea, $ff, $dc, $cd, $06, $02, $3e, $01, $e0, $4f, $21, $4f, $67, $11, $00, $90
    db $01, $00, $08, $cd, $b0, $01, $21, $4f, $6f, $11, $00, $88, $01, $90, $07, $cd
    db $b0, $01, $af, $11, $00, $98, $21, $87, $7e, $06, $14, $0e, $12, $cd, $d4, $01
    db $af, $e0, $4f, $21, $cf, $73, $11, $00, $90, $01, $00, $08, $cd, $b0, $01, $21
    db $cf, $7b, $11, $00, $88, $01, $50, $01, $cd, $b0, $01, $3e, $09, $11, $00, $98
    db $21, $1f, $7d, $06, $14, $0e, $09, $cd, $d4, $01, $af, $11, $20, $99, $06, $14
    db $0e, $09, $cd, $d4, $01, $fa, $0d, $df, $6f, $fa, $0e, $df, $67, $cd, $84, $0e
    db $cd, $84, $0e, $cd, $84, $0e, $cd, $84, $0e, $cd, $84, $0e, $cd, $84, $0e, $3e
    db $01, $ea, $ac, $d8, $cd, $06, $02, $c9, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00

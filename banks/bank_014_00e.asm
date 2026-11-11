; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00e", ROMX[$4000], BANK[$e]

Data_00e_4000:
    db $a6, $98, $00, $04, $56, $45, $52, $20, $32, $33, $20, $30, $32, $ff

Text_Spanish_StartGame:
    dw $98c4
    db $00, $04, "  COMENZAR", $ff

Text_Spanish_StartLevel:
    dw $98e3
    db $00, $01, "COMENZAR ", $00, $01, "L000", $ff

Text_Spanish_EnterPassword:
    dw $9923
    db $00, $01, "  CONTRASE", $f0, "A  ", $ff

Text_Spanish_MusicOn:
    dw $9964
    db $00, $01, "  M", $ee, "SICA S", $ef, " ", $ff

Text_Spanish_MusicOff:
    dw $9964
    db $00, $01, "  M", $ee, "SICA NO ", $ff

Text_Spanish_SfxOn:
    dw $9984
    db $00, $01, "   SFX S", $ef, "  ", $ff

Text_Spanish_SfxOff:
    dw $9984
    db $00, $01, "   SFX NO  ", $ff

Text_English_StartGame:
    dw $98c4
    db $00, $04, "START GAME", $ff

Text_English_StartLevel:
    dw $98e1
    db $00, $01, "   START ", $00, $01, "L000", $ff

Text_English_EnterPassword:
    dw $9923
    db $00, $01, "ENTER PASSWORD", $ff

Text_English_MusicOn:
    dw $9964
    db $00, $01, "MUSIC IS ON ", $ff

Text_English_MusicOff:
    dw $9964
    db $00, $01, "MUSIC IS OFF", $ff

Text_English_SfxOn:
    dw $9984
    db $00, $01, "SFX ARE ON ", $ff

Text_English_SfxOff:
    dw $9984
    db $00, $01, "SFX ARE OFF", $ff

Text_French_StartGame:
    dw $98c4
    db $00, $04, " COMMENCER", $ff

Text_French_StartLevel:
    dw $98e2
    db $00, $01, "   ALLER ", $00, $01, "L000", $ff

Text_French_EnterPassword:
    dw $9923
    db $00, $01, " MOT DE PASSE ", $ff

Text_French_MusicOff:
    dw $9964
    db $00, $01, "MUSIQUE NON ", $ff

Text_French_MusicOn:
    dw $9964
    db $00, $01, "MUSIQUE OUI ", $ff

Text_French_SfxOn:
    dw $9984
    db $00, $01, "SONORES OUI", $ff

Text_French_SfxOff:
    dw $9984
    db $00, $01, "SONORES NON", $ff

Text_German_StartGame:
    dw $98c4
    db $00, $04, "  BEGINNEN", $ff

Text_German_StartLevel:
    dw $98e3
    db $00, $01, "BEGINNEN ", $00, $01, "L000", $ff

Text_German_EnterPassword:
    dw $9923
    db $00, $01, "   PASSWORT   ", $ff

Text_German_MusicOn:
    dw $9964
    db $00, $01, "  MUSIK AN  ", $ff

Text_German_MusicOff:
    dw $9964
    db $00, $01, "  MUSIK AUS ", $ff

Text_German_SfxOn:
    dw $9984
    db $00, $01, "  SFX AN   ", $ff

Text_German_SfxOff:
    dw $9984
    db $00, $01, "  SFX AUS  ", $ff

Text_Italian_StartGame:
    dw $98c4
    db $00, $04, "  INIZIO  ", $ff

Text_Italian_StartLevel:
    dw $98e2
    db $00, $01, "  INIZIO ", $00, $01, "L000", $ff

Text_Italian_EnterPassword:
    dw $9923
    db $00, $01, "   PASSWORD   ", $ff

Text_Italian_MusicOn:
    dw $9964
    db $00, $01, " MUSICA S", $ed, "  ", $ff

Text_Italian_MusicOff:
    dw $9964
    db $00, $01, " MUSICA NO  ", $ff

Text_Italian_SfxOn:
    dw $9984
    db $00, $01, " EFFETTI S", $ed, " ", $ff

Text_Italian_SfxOff:
    dw $9984
    db $00, $01, " EFFETTI NO ", $ff

PowerupText_English_MultiBall:
    db $00, "     MULTI", $a6, "BALL     "

PowerupText_French_MultiBall:
    db $00, "    MULTI", $a6, "BALLES    "

PowerupText_German_MultiBall:
    db $00, "     MULTI", $a6, "BALL     "

PowerupText_Italian_MultiBall:
    db $04, "     MULTI PALLA    "

PowerupText_Spanish_MultiBall:
    db $04, "     MULTI", $a6, "BOLAS    "

PowerupText_English_SlowBall:
    db $04, "      SLOW BALL     "

PowerupText_French_SlowBall:
    db $04, "     BALLE LENTE    "

PowerupText_German_SlowBall:
    db $00, "   SCHNECKEN", $a6, "BALL   "

PowerupText_Italian_SlowBall:
    db $04, "     PALLA LENTA    "

PowerupText_Spanish_SlowBall:
    db $00, "     BOLA LENTA     "

PowerupText_English_AntigravityBall:
    db $00, "  ANTIGRAVITY BALL  "

PowerupText_French_AntigravityBall:
    db $04, "  BALLE ANTIGRAVIT", $ac, " "

PowerupText_German_AntigravityBall:
    db $00, "  ANTI", $a6, "SCHWERKRAFT  "

PowerupText_Italian_AntigravityBall:
    db $00, " ANTIGRAVITAZIONALE "

PowerupText_Spanish_AntigravityBall:
    db $00, " BOLA ANTI", $a6, "GRAVEDAD "

PowerupText_English_SleepyBall:
    db $04, "     SLEEPY BALL    "

PowerupText_French_SleepyBall:
    db $00, "   BALLE ENDORMIE   "

PowerupText_German_SleepyBall:
    db $04, "     SCHLAF", $a6, "BALL    "

PowerupText_Italian_SleepyBall:
    db $00, " PALLA ADDORMENTATA "

PowerupText_Spanish_SleepyBall:
    db $04, "   BOLA ALETARGADA  "

PowerupText_English_RocketBat:
    db $00, "     ROCKET BAT     "

PowerupText_French_RocketBat:
    db $04, "     BATTE FUS", $ac, "E    "

PowerupText_German_RocketBat:
    db $00, "  RAKETEN", $a6, "SCHL", $a7, "GER  "

PowerupText_Italian_RocketBat:
    db $04, "  MAZZA LANCIARAZZI "

PowerupText_Spanish_RocketBat:
    db $04, "     BATE COHETE    "

PowerupText_English_PlasmaBat:
    db $00, "     PLASMA BAT     "

PowerupText_French_PlasmaBat:
    db $04, "     MODE PLASMA    "

PowerupText_German_PlasmaBat:
    db $04, "   PLASMA", $a6, "SCHL", $a7, "GER  "

PowerupText_Italian_PlasmaBat:
    db $04, "   MAZZA AL PLASMA  "

PowerupText_Spanish_PlasmaBat:
    db $04, "     BATE PLASMA    "

PowerupText_English_BigBat:
    db $04, "       BIG BAT      "

PowerupText_French_BigBat:
    db $00, "     M", $ac, "GA BATTE     "

PowerupText_German_BigBat:
    db $04, "   RIESEN", $a6, "SCHL", $a7, "GER  "

PowerupText_Italian_BigBat:
    db $04, "    MAZZA GIGANTE   "

PowerupText_Spanish_BigBat:
    db $04, "     BATE GRANDE    "

PowerupText_English_StunBat:
    db $00, "      STUN BAT      "

PowerupText_French_StunBat:
    db $04, "  BATTE EMPOISONN", $ac, "E "

PowerupText_German_StunBat:
    db $00, "     VERWIRRTER     "

PowerupText_Italian_StunBat:
    db $00, "   MAZZA STORDITA   "

PowerupText_Spanish_StunBat:
    db $04, "    BATE ATURDIDO   "

PowerupText_English_MagneticBat:
    db $00, "    MAGNETIC BAT    "

PowerupText_French_MagneticBat:
    db $00, "  BATTE MAGN", $ac, "TIQUE  "

PowerupText_German_MagneticBat:
    db $04, "   MAGNET", $a6, "SCHL", $a7, "GER  "

PowerupText_Italian_MagneticBat:
    db $04, "   MAZZA MAGNETICA  "

PowerupText_Spanish_MagneticBat:
    db $00, "   BATE MAGN", $ac, "TICO   "

PowerupText_English_ExtraLife:
    db $00, "     EXTRA LIFE     "

PowerupText_French_ExtraLife:
    db $04, "      BONUS VIE     "

PowerupText_German_ExtraLife:
    db $04, "     EXTRA LEBEN    "

PowerupText_Italian_ExtraLife:
    db $00, "     VITA EXTRA     "

PowerupText_Spanish_ExtraLife:
    db $00, "     VIDA EXTRA     "

PowerupText_English_LazerBat:
    db $04, "      LAZER BAT     "

PowerupText_French_LazerBat:
    db $00, "     MODE LASER     "

PowerupText_German_LazerBat:
    db $00, "   LASER", $a6, "SCHL", $a7, "GER   "

PowerupText_Italian_LazerBat:
    db $04, "  MAZZA SPARA LASER "

PowerupText_Spanish_LazerBat:
    db $00, "     BATE L", $ad, "SER     "

PowerupText_English_ReverseBat:
    db $04, "     REVERSE BAT    "

PowerupText_French_ReverseBat:
    db $00, "   BATTE INVERS", $ac, "E   "

PowerupText_German_ReverseBat:
    db $00, "     VERKEHRTER     "

PowerupText_Italian_ReverseBat:
    db $04, "   MAZZA IMPAZZITA  "

PowerupText_Spanish_ReverseBat:
    db $00, "   BATE INVERTIDO   "

PowerupText_English_GhostUp:
    db $00, "      GHOST UP      "

PowerupText_French_GhostUp:
    db $04, "        MAGIE       "

PowerupText_German_GhostUp:
    db $04, "   GHOST AKTIVIERT  "

PowerupText_Italian_GhostUp:
    db $04, "        MAGIA       "

PowerupText_Spanish_GhostUp:
    db $00, "     MODO MAGIA     "

PowerupText_English_GrenadeBat:
    db $04, "     GRENADE BAT    "

PowerupText_French_GrenadeBat:
    db $00, "    MODE GRENADE    "

PowerupText_German_GrenadeBat:
    db $04, "  GRANATEN", $a6, "SCHL", $a7, "GER "

PowerupText_Italian_GrenadeBat:
    db $04, "    LANCIAGRANATE   "

PowerupText_Spanish_GrenadeBat:
    db $00, "    BATE GRANADA    "

PowerupText_English_NinjaUp:
    db $00, "      NINJA UP      "

PowerupText_French_NinjaUp:
    db $04, "        NINJA       "

PowerupText_German_NinjaUp:
    db $04, "   NINJA AKTIVIERT  "

PowerupText_Italian_NinjaUp:
    db $04, "     COLPO NINJA    "

PowerupText_Spanish_NinjaUp:
    db $00, "     MODO NINJA     "

    db $08, $9d, $00, $02, $50, $41, $55, $53, $45, $ff

    db $08, $9d, $00, $02, $50, $41, $55, $53, $45, $ff

    db $08, $9d, $00, $02, $50, $41, $55, $53, $41, $ff

    db $08, $9d, $00, $02, $50, $41, $55, $53, $45, $ff

    db $08, $9d, $00, $02, $50, $41, $55, $53, $41, $ff

Data_00e_48c1:
    INCBIN "gfx/image_00e_48c1.2bpp"

    INCBIN "gfx/image_00e_60c1.2bpp"

Data_00e_6191:
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
    db $d1, $d2, $d3, $d4, $d5, $d6, $d7, $d8

Data_00e_62f9:
    db $08, $08, $08, $08, $08, $08, $08, $08
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

Text_English_Ending:
    dw $9840
    db $00, $0a, "   CONGRATULATIONS  ", $ff
    dw $98a0
    db $00, $0a, "  YOU HAVE MASTERED ", $ff
    dw $98e0
    db $00, $0a, "     COOLBRICKS     ", $ff
    dw $9940
    db $00, $0a, "     NOW TRY IT     ", $ff
    dw $9980
    db $00, $0a, "      WITH JUST     ", $ff
    dw $99c0
    db $00, $0a, "      ONE LIFE      ", $ff

Text_French_Ending:
    dw $9840
    db $00, $0a, "   FELICITATIONS    ", $ff
    dw $98a0
    db $00, $0a, "   TU AS MAITRISE   ", $ff
    dw $98e0
    db $00, $0a, "    COOLBRICKS      ", $ff
    dw $9940
    db $00, $0a, "       ESSAIE       ", $ff
    dw $9980
    db $00, $0a, "        AVEC        ", $ff
    dw $99c0
    db $00, $0a, "   UNE SEULE VIE    ", $ff

Text_German_Ending:
    dw $9840
    db $00, $0a, "    GL[CKW[NSCHE    ", $ff
    dw $98a0
    db $00, $0a, "SIE HABEN COOLBRICKS", $ff
    dw $98e0
    db $00, $0a, "     GEMEISTERT     ", $ff
    dw $9940
    db $00, $0a, "  VERSUCHEN SIE ES  ", $ff
    dw $9980
    db $00, $0a, "   JETZT MIT NUR    ", $ff
    dw $99c0
    db $00, $0a, "    EINEM LEBEN     ", $ff

Text_Italian_Ending:
    dw $9840
    db $00, $0a, "  CONGRATULAZIONI   ", $ff
    dw $98a0
    db $00, $0a, " SEI IL CAMPIONE DI ", $ff
    dw $98e0
    db $00, $0a, "     COOLBRICKS     ", $ff
    dw $9940
    db $00, $0a, "     ORA PROVA      ", $ff
    dw $9980
    db $00, $0a, "        CON         ", $ff
    dw $99c0
    db $00, $0a, "   SOLO UNA VITA    ", $ff

Text_Spanish_Ending:
    dw $9840
    db $00, $0a, "    ENHORABUENA     ", $ff
    dw $98a0
    db $00, $0a, "    HAS DOMINADO    ", $ff
    dw $98e0
    db $00, $0a, "     COOLBRICKS     ", $ff
    dw $9940
    db $00, $0a, "  INTbNTALO AHORA   ", $ff
    dw $9980
    db $00, $0a, "        CON         ", $ff
    dw $99c0
    db $00, $0a, "   SOLO UNA VIDA    ", $ff

Data_00e_674f:
    INCBIN "gfx/image_00e_674f.2bpp"

    INCBIN "gfx/image_00e_7c4f.2bpp"

Data_00e_7d1f:
    db $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33, $34
    db $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44
    db $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50, $51, $52, $53, $54
    db $55, $56, $57, $58, $59, $5a, $5b, $3b, $5c, $5d, $5e, $5f, $60, $61, $62, $63
    db $64, $65, $66, $4d, $67, $68, $69, $6a, $6b, $6c, $4e, $4f, $50, $6d, $6e, $6f
    db $70, $71, $72, $73, $74, $75, $76, $3b, $4d, $77, $78, $79, $7a, $7b, $61, $62
    db $63, $7c, $7d, $7e, $7f, $4b, $80, $81, $82, $83, $4e, $4f, $50, $84, $85, $86
    db $87, $88, $89, $8a, $8b, $8c, $8d, $4d, $4d, $8e, $8f, $90, $91, $92, $61, $62
    db $63, $4d, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $9c, $9d, $9e, $9f, $a0
    db $a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $2b, $2c, $ad, $ae
    db $af, $b0, $2b, $2c, $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8, $b9, $ba, $bb, $bc
    db $3f, $40, $bd, $be, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0a
    db $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a
    db $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $0b, $25, $26, $27, $28, $29
    db $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39
    db $0a, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $45, $02, $03, $46
    db $47, $48, $49, $4a, $4b, $0a, $4c, $08, $4d, $4e, $4f, $0b, $50, $51, $52, $53
    db $54, $55, $56, $57, $08, $58, $59, $5a, $5b, $5c, $1a, $1b, $1c, $5d, $5e, $5f
    db $60, $61, $62, $63, $64, $65, $66, $1a, $1b, $1c, $67, $68, $69, $6a, $2d, $2e
    db $2f, $6b, $6c, $6d, $33, $34, $6e, $6f, $70, $71, $72, $2d, $2e, $2f, $73, $74
    db $33, $34, $0a, $75, $76, $77, $78, $79, $02, $03, $7a, $7b, $7c, $27, $7d, $7e
    db $7f, $80, $81, $82, $02, $03, $83, $84, $85, $86, $87, $88, $89, $8a, $8b, $8c
    db $8d, $8e, $8f, $90, $91, $92, $93, $94

Data_00e_7e87:
    db $0f, $0f, $0f, $0f, $0f, $0f, $09, $09
    db $0c, $08, $08, $08, $08, $08, $08, $09, $09, $09, $09, $09, $0f, $0f, $08, $0f
    db $0c, $0f, $09, $09, $0c, $0d, $0d, $0d, $08, $08, $09, $09, $09, $09, $0e, $09
    db $08, $08, $08, $08, $0c, $0c, $0c, $0c, $0c, $0d, $0d, $0d, $0d, $0d, $08, $0e
    db $09, $09, $09, $09, $0e, $08, $08, $08, $0c, $0c, $0c, $08, $0e, $0e, $0a, $0a
    db $0d, $0d, $0e, $0e, $0e, $0f, $0f, $0f, $0e, $0e, $0e, $0c, $0c, $0c, $0c, $0f
    db $08, $0e, $0a, $0a, $0d, $0d, $0e, $0e, $0e, $0f, $0f, $0f, $0e, $09, $0e, $0e
    db $0c, $0c, $0f, $0f, $0f, $0e, $0e, $0d, $0d, $0d, $0b, $0b, $0b, $0f, $0f, $08
    db $08, $08, $08, $0c, $0c, $0c, $0f, $0f, $0f, $08, $0f, $0b, $0b, $0b, $0b, $0b
    db $0f, $0f, $0f, $09, $08, $08, $08, $08, $08, $08, $08, $08, $08, $0b, $0b, $0b
    db $0b, $0b, $0c, $0b, $08, $08, $09, $09, $09, $08, $0c, $0c, $08, $08, $08, $08
    db $08, $0b, $0b, $0b, $0b, $0c, $0c, $0e, $08, $08, $09, $09, $01, $01, $04, $04
    db $00, $00, $00, $00, $01, $03, $00, $00, $01, $04, $06, $06, $06, $06, $01, $01
    db $01, $01, $01, $00, $00, $00, $00, $01, $01, $01, $00, $03, $03, $06, $06, $06
    db $06, $06, $07, $01, $01, $02, $01, $00, $00, $07, $07, $01, $01, $01, $03, $03
    db $03, $07, $07, $00, $06, $06, $00, $00, $00, $01, $01, $00, $00, $07, $07, $07
    db $07, $07, $03, $03, $03, $07, $07, $00, $00, $00, $00, $00, $00, $00, $01, $04
    db $03, $07, $07, $03, $07, $07, $00, $00, $03, $00, $00, $00, $05, $00, $00, $06
    db $01, $02, $04, $04, $04, $01, $07, $07, $07, $07, $00, $00, $03, $03, $00, $05
    db $05, $05, $06, $06, $02, $02, $04, $04, $04, $07, $07, $07, $04, $04, $00, $00
    db $00, $00, $00, $05, $05, $05, $06, $06, $00, $00, $00, $07, $06, $06, $06, $00
    db $04, $04, $00, $00, $00, $02, $01, $06, $06, $06, $06, $06, $00, $00, $06, $06
    db $06, $06, $06, $00, $00, $00, $00, $00, $00, $06, $06, $06, $06, $06, $06, $06

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00

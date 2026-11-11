; Names for the game's RAM. See docs/RESEARCH.md.

DEF wBatY                  EQU $c200 ; Bat sprite Y
DEF wBatX                  EQU $c201 ; Bat sprite X
DEF wPasswordByteX         EQU $ccb8 ; Password decoding work bytes
DEF wPasswordByteY         EQU $ccb9 ; 
DEF wStartLevel            EQU $ccba ; Level the "START nnn" menu entry begins on (0-based)
DEF wBricksLeft            EQU $cce7 ; Breakable bricks left in the level
DEF wCurrentLevel          EQU $cce8 ; Current level (0-based)
DEF wBrickMap              EQU $ccea ; Brick hit points, 16 bytes per row, 9 bricks from column 1
DEF wPowerupMap            EQU $ce0a ; Power-up ids, same layout as wBrickMap. Bit 7 is set while a hit is being processed
DEF wBallSticks            EQU $d763 ; 1 = the ball sticks to the bat. Set at level start and by Magnet
DEF wBatWidth              EQU $d764 ; Bat width in pixels ($20 normal, $28 with Milk)
DEF wNinjaActive           EQU $d76e ; Not 0 while Ninja is active
DEF wBallCount             EQU $d77c ; Balls in play
DEF wLives                 EQU $d8ac ; Lives
DEF wHitRedrawIndex        EQU $d8b4 ; Index into BrickRedrawHandlers
DEF wHitNewValue           EQU $d8b5 ; Hit points of the brick after the hit
DEF wHitPowerupPtr         EQU $d8b6 ; Address of the hit brick in wPowerupMap
DEF wBrickHitQueue         EQU $d8bc ; Queue of brick hits, 8 bytes per entry
DEF wPasswordEntry         EQU $dad7 ; 4 letters on the password screen (ASCII)
DEF wCheatLivesRefill      EQU $db51 ; TDNZ: pausing sets lives to 9
DEF wCheatLevelSkip        EQU $db52 ; NCNZ: B skips the level
DEF wCheatPhotoBackground  EQU $db53 ; TNRZ: photo background
DEF wCheatShowVersion      EQU $db54 ; NXRZ: show "VER 23 02" on the title menu
DEF wHitPowerupId          EQU $db6e ; Power-up id of the brick being processed
DEF wHitBrickValue         EQU $db6f ; Its hit points after the hit
DEF wFallingPowerups       EQU $db71 ; 8 falling power-ups, 12 bytes each: active, y, x, type, 4 x (tile, attribute)
DEF wUfoHeight             EQU $dc27 ; UFO flight height
DEF wLevelType             EQU $dc35 ; 1 = UFO level, 2 = blob level
DEF wLevelFlagsHigh        EQU $dc36 ; High nibble of the level type byte
DEF wWeaponFlag            EQU $dc3d ; 1 after Rocket, Plasma, Laser or Grenade. A Clock brick drops a Clock only while this is 1
DEF wShotReloadDelay       EQU $dc45 ; Frames between rocket or laser shots
DEF wPlasmaState           EQU $dc47 ; 1 = plasma bat, 2 = plasma shot in flight
DEF wGrenadeCount          EQU $dc48 ; Grenades left
DEF hJoypad                EQU $ff8a ; Buttons held. Bit 4 = A, bit 5 = B
DEF hFrameCounter          EQU $ff8c ; Goes up by 1 every frame
DEF hVBlankHandler         EQU $ff96 ; Address of the current VBlank handler
DEF hStatHandler           EQU $ff98 ; Address of the current LCD STAT handler
DEF hGameState             EQU $ff9f ; Game state, index into the state handler tables
DEF wHighScoreTable        EQU $cb59 ; High score table as 13 strings for DrawString
DEF wMusicOff              EQU $dabb ; Not 0 when music is turned off in the menu
DEF wSfxOff                EQU $dabc ; Not 0 when sound effects are turned off
DEF wLevelsSincePassword   EQU $dcfe ; Counts levels; the password screen appears when it reaches 4

; Selected language: 0 English, 1 Spanish, 2 French, 3 German, 4 Italian
DEF wLanguage              EQU $defc

; Copy of the chosen LanguageTable_*
DEF wLangTable             EQU $df01
DEF wLangTextStartGame         EQU wLangTable + $00
DEF wLangTextSfxOn             EQU wLangTable + $02
DEF wLangTextSfxOff            EQU wLangTable + $04
DEF wLangTextMusicOn           EQU wLangTable + $06
DEF wLangTextMusicOff          EQU wLangTable + $08
DEF wLangTextEnterPassword     EQU wLangTable + $0a
DEF wLangTextEnding            EQU wLangTable + $0c
DEF wLangTextMultiBall         EQU wLangTable + $0e
DEF wLangTextSlowBall          EQU wLangTable + $10
DEF wLangTextAntigravityBall   EQU wLangTable + $12
DEF wLangTextSleepyBall        EQU wLangTable + $14
DEF wLangTextRocketBat         EQU wLangTable + $16
DEF wLangTextPlasmaBat         EQU wLangTable + $18
DEF wLangTextBigBat            EQU wLangTable + $1a
DEF wLangTextStunBat           EQU wLangTable + $1c
DEF wLangTextMagneticBat       EQU wLangTable + $1e
DEF wLangTextExtraLife         EQU wLangTable + $20
DEF wLangTextLazerBat          EQU wLangTable + $22
DEF wLangTextReverseBat        EQU wLangTable + $24
DEF wLangTextGhostUp           EQU wLangTable + $26
DEF wLangTextGrenadeBat        EQU wLangTable + $28
DEF wLangTextNinjaUp           EQU wLangTable + $2a
DEF wLangTextHud               EQU wLangTable + $2e
DEF wLangTextLevelTitle        EQU wLangTable + $30
DEF wLangTextLevelPassword     EQU wLangTable + $32
DEF wLangGraphicsBank          EQU wLangTable + $43
DEF wLangTextStartLevel        EQU wLangTable + $45
DEF wLangTextHighScorePassword EQU wLangTable + $49
DEF wLangTextGameOver          EQU wLangTable + $4d
DEF wLangTextLatestScore       EQU wLangTable + $4f

; Values of hGameState
DEF STATE_COPYRIGHT          EQU  0 ; Copyright screen shown at power-on
DEF STATE_MAIN_MENU          EQU  1 ; Main menu and password entry
DEF STATE_GAMEPLAY           EQU  2 ; Playing a level
DEF STATE_GAME_OVER          EQU  3 ; Game over screen
DEF STATE_PAUSE              EQU  4 ; Pause screen
DEF STATE_TITLE_SCREEN       EQU  5 ; Title picture
DEF STATE_DEVELOPER_LOGOS    EQU  6 ; "Developed by" logos
DEF STATE_HIGH_SCORES        EQU  7 ; High score table, shown after game over
DEF STATE_CREDITS            EQU  8 ; Credits
DEF STATE_LEVEL_PASSWORD     EQU  9 ; Password screen shown after every fourth level
DEF STATE_COLOR_ONLY         EQU 10 ; "Please use a Game Boy Color" screen on older consoles
DEF STATE_LANGUAGE_SELECT    EQU 11 ; Language selection
DEF STATE_PUBLISHER_LOGO     EQU 12 ; SCi logo
DEF STATE_ENDING             EQU 13 ; Ending text after level 160

; Names for the game's RAM. See docs/RESEARCH.md.

DEF wOamBuffer             EQU $c200 ; Sprite buffer, 40 entries of y, x, tile, attribute. The first entry is the bat
DEF wBatY                  EQU $c200 ; Bat Y: the y of the first sprite in wOamBuffer
DEF wBatX                  EQU $c201 ; Bat X: the x of the first sprite in wOamBuffer
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
DEF wShotReloadDelay       EQU $dc45 ; Cooldown set after a shot: 30 frames for a rocket, 8 for a laser
DEF wPlasmaState           EQU $dc47 ; 1 = plasma bat, 2 = plasma shot in flight
DEF wGrenadeCount          EQU $dc48 ; Grenades left
DEF hJoypad                EQU $ff8a ; Buttons held. Bit 0 = right, 1 = left, 2 = up, 3 = down, 4 = A, 5 = B, 6 = Select, 7 = Start
DEF hFrameCounter          EQU $ff8c ; Goes up by 1 every frame
DEF hVBlankHandler         EQU $ff96 ; Address of the current VBlank handler
DEF hStatHandler           EQU $ff98 ; Address of the current LCD STAT handler
DEF hFrameHandler          EQU $ffa3 ; Address of the per-frame handler of the current state
DEF hGameState             EQU $ff9f ; Game state, index into the state handler tables
DEF wHighScoreTable        EQU $cb59 ; High score table as 13 strings for DrawString
DEF wMusicOff              EQU $dabb ; Not 0 when music is turned off in the menu
DEF wSfxOff                EQU $dabc ; Not 0 when sound effects are turned off
DEF wLevelsSincePassword   EQU $dcfe ; Counts levels; the password screen appears when it reaches 4

; Gameplay: bat and balls
DEF wBatMovingRight        EQU $d75f ; $ff while the bat moves right
DEF wBatMovingLeft         EQU $d760 ; 1 while the bat moves left
DEF wBatSpeedPtr           EQU $d761 ; Position in BatSpeedTable
DEF wStunActive            EQU $d765 ; Not 0 while the bat is stunned (Poison)
DEF wStunWobble            EQU $d766 ; Stun shake offset, +3 or -3
DEF wStunWobbleNow         EQU $d767 ; Shake offset applied this frame
DEF wBatEffectTimer        EQU $d768 ; Time left for Stun or Reverse
DEF wBatEffectTick         EQU $d769 ; Frame counter for wBatEffectTimer
DEF wReverseActive         EQU $d76a ; Not 0 while left and right are swapped (Reverse)
DEF wBatExplosionTimer     EQU $d76b ; Counts down while the bat explodes after a lost life
DEF wBallWorkYSub          EQU $d775 ; Working copy of the ball being updated (7 bytes): Y fraction
DEF wBallWorkY             EQU $d776 ; Y
DEF wBallWorkXSub          EQU $d777 ; X fraction
DEF wBallWorkX             EQU $d778 ; X
DEF wBallWorkDirection     EQU $d779 ; Direction, 0-$1f
DEF wBallWorkSpeed         EQU $d77a ; Speed. Bit 7 is set while the ball sits on the bat
DEF wBallWorkFlags         EQU $d77b ; Flags. $ff marks a removed ball
DEF wBalls                 EQU $d77d ; The balls, 7 bytes each, in the same layout as wBallWork
DEF wBatDeltaX             EQU $d89f ; Bat movement this frame
DEF wLaunchDirection       EQU $d8a0 ; Direction for a ball launched this frame, or 0
DEF wMultiBallPending      EQU $d8a1 ; Set by Multi ball until the ball splits
DEF wAntigravityActive     EQU $d8a2 ; Not 0 while Antigravity (Pepper) is active
DEF wSlowBallActive       EQU $d8a3 ; Set by Slow ball. Selects the slower half of the bat bounce tables
DEF wSleepyBallActive      EQU $d8a5 ; Not 0 while the ball sleeps (Clock)
DEF wBallEffectTimer       EQU $d8a6 ; Time left for Sleepy ball, Antigravity or Ninja
DEF wBallOnBat             EQU $d8a8 ; Not 0 while a ball is held on the bat
DEF wAntigravityCancel     EQU $d8a9 ; Set when another power-up ends Antigravity early
DEF wRemoveBall            EQU $d8aa ; Set to remove the ball being updated
DEF hLastDirection         EQU $ff8b ; Left/right bits of the last frame
DEF hStateTimer            EQU $ffa0 ; Counts down before a game state change; gameplay input is ignored while it is not 0
DEF hLifeLostTimer         EQU $ffa2 ; Counts up to $28 after a lost life, then the bat and ball restart

; Gameplay: weapons
DEF wShotActive            EQU $dc3e ; 6 shot slots, not 0 while the shot is in flight
DEF wRocketLaserBat        EQU $dc46 ; 1 with a Rocket or Laser bat
DEF wGrenadePower          EQU $dc49 ; Throw power, grows while A is held
DEF wGrenadeDelay          EQU $dc4b ; Delay after a throw
DEF wLaserBat              EQU $dc4c ; 1 = Laser bat, 0 = Rocket bat

; Gameplay: ball movement, enemies and projectiles
DEF wBallBounced           EQU $d76f ; Set when the ball bounced this frame
DEF wBallSecondStep        EQU $d770 ; Set when a second movement step is pending
DEF wBallOldYSub           EQU $d771 ; Ball position before the move
DEF wBallOldY              EQU $d772
DEF wBallOldXSub           EQU $d773
DEF wBallOldX              EQU $d774
DEF wBlobThrowCount        EQU $dbe0 ; Balls the blob has caught and not yet thrown back. While it is not 0, losing the last ball does not cost a life
DEF wProjectiles           EQU $dbed ; 4 projectiles, 9 bytes each (grenades and blob throws)
DEF wBlob                  EQU $dc11 ; The blob, a 15-byte enemy object
DEF wBlobY                 EQU $dc12
DEF wBlobX                 EQU $dc14
DEF wBlobThrowing          EQU $dc24 ; Not 0 from the moment the blob catches a ball until it throws it
DEF wUfoXSub               EQU $dc25 ; UFO X position, fraction
DEF wUfoX                  EQU $dc26 ; UFO X position
DEF wUfoSpeed              EQU $dc28 ; UFO speed, +$80 or -$80 fractions per frame
DEF wUfoWaitTimer          EQU $dc2a ; Time until the next UFO pass
DEF wUfoFlying             EQU $dc2d ; Not 0 while the UFO crosses the screen
DEF wUfoBombActive         EQU $dc2f ; Not 0 while a UFO bomb falls
DEF wUfoBombX              EQU $dc30
DEF wUfoBombY              EQU $dc31
DEF wUfoDropX              EQU $dc33 ; X position where the UFO drops its bomb, taken from the frame counter

; Gameplay: score, Ghost and effects
DEF wScoreDigits           EQU $d8ad ; Score, 6 digits
DEF wGhostActive           EQU $dc20 ; Not 0 while Ghost is active: the blob cannot catch the ball
DEF wGhostTimer            EQU $dc21 ; Time left for Ghost
DEF wBlobActive            EQU $dc23 ; Not 0 while the blob is on screen
DEF wBrickBreakEffects     EQU $dc63 ; 14 effect slots, 6 bytes each
DEF wPickupEffects         EQU $dcb7 ; 4 effect slots, 4 bytes each
DEF wUnbreakableHitEffects EQU $dcd5 ; 10 effect slots

; Main menu and password entry
DEF wMenuCursor            EQU $dab5 ; Selected menu item: 0 start, 1 start at password level, 2 enter password, 3 music, 4 sound effects
DEF wMenuButtonHeld        EQU $daba ; 1 until the buttons are released
DEF wMenuItemColours       EQU $dabd ; Palette of each of the 5 menu items: 4 = selected, 1 = normal
DEF wPasswordEntryActive   EQU $dac2 ; 1 while the password is being typed
DEF wPasswordLetterColours EQU $dadb ; Palette of each password letter: 4 = selected, 1 = normal
DEF wPasswordCursor        EQU $dadf ; Letter being edited, 0-3

; Gameplay: shot positions
DEF wShotCooldown          EQU $dc44 ; Frames until the next rocket or laser can be fired
DEF wFireLatch             EQU $dc4d ; Not 0 until A is released; each shot needs a new press
DEF wShots                 EQU $dc4e ; 6 shots, 4 bytes each: x, y, y when fired, 1 for a laser

; Gameplay: UFO hits
DEF wUfoHits               EQU $dc34 ; Times the ball has hit the UFO in this level. The UFO is gone at 5

; Music
DEF wLevelMusicIndex       EQU $db55 ; 0-2: which of the three level songs plays. Steps when the password screen appears

; Sprites
DEF wOamUsedLastFrame      EQU $c2b4 ; Extra sprites drawn in the previous frame
DEF wOamUsed               EQU $c2b5 ; Extra sprites drawn so far this frame
DEF wOamWritePtr           EQU $c2b6 ; Next free entry in wOamBuffer

; Interrupt stubs in RAM
DEF wStatJump              EQU $c35a ; jp instruction to the current LCD STAT handler
DEF hOamDmaRoutine         EQU $ff80 ; OAM DMA routine, copied here by LoadOAMCode
DEF hVBlankJump            EQU $ff92 ; jp instruction to the current VBlank handler

; More variables
DEF wLcdcFlags             EQU $c359 ; Extra LCDC bits for the current screen
DEF wLevelTitleText        EQU $d72a ; The "LEVEL nnn" string shown at the start of a level
DEF wBrickTileLeft         EQU $d8b8 ; Tile numbers for the brick being redrawn
DEF wBrickTileRight        EQU $d8b9
DEF wBrickRedrawCount      EQU $d9bd ; Brick tile changes queued this frame
DEF wMenuDownHeld          EQU $dab6 ; 1 until down is released on the password screen
DEF wMenuUpHeld            EQU $dab7 ; 1 until up is released on the password screen
DEF wProjectileWork        EQU $dbe1 ; Working copy of the projectile being updated (9 bytes)
DEF wBlobFrame             EQU $dc17 ; Blob animation frame
DEF wBlobFrameTick         EQU $dc18 ; Counts frames between blob animation frames
DEF hTemp                  EQU $ff8d ; Scratch bytes
DEF hTemp2                 EQU $ff90 ; Scratch byte
DEF hVBlankDone            EQU $ff95 ; Set to 1 by the VBlank handler; WaitVBlank waits for it
DEF hPaletteMode           EQU $ff9c ; Selects how the palettes are loaded and faded
DEF hResumeFromPause       EQU $ffa1 ; 1 when the level screen is entered from pause, so the level is not loaded again

; Level password screen
DEF wBonusCountdown        EQU $dd49 ; Bonus still to count down on screen
DEF wBonusDelay            EQU $dd4b ; Frames before the countdown starts
DEF wLevelBonus            EQU $dd4d ; Bonus in points: 2000 at the first password screen, 500 more each time
DEF wLevelBonusUnits       EQU $dd4f ; The same bonus in score units (points / 10)

; More variables found by watching memory in the emulator
DEF wBgPalettes            EQU $c95d ; Background palettes of the level
DEF wObjPalettes           EQU $c99d ; Sprite palettes of the level
DEF wPaletteBuffer         EQU $c9dd ; Palettes unpacked by LoadPalettes
DEF wUfoTick               EQU $dc2b ; Counts frames on UFO levels
DEF wUfoTickMask           EQU $dc2c ; The UFO wait timer only counts down on frames where wUfoTick AND this is 0
DEF wUfoPassIndex          EQU $dc2e ; Which UFO pass comes next (index into UfoPassTable)
DEF hLogoTimer             EQU $ff91 ; Counts down while a logo screen is shown
DEF wBrickShinePtr         EQU $dab3 ; Position in BrickShineAnimation (bank 9), the shine that sweeps over the bricks

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
DEF wLangGrenadeTexts      EQU wLangTable + $2c
DEF wLangTextHud               EQU wLangTable + $2e
DEF wLangTextLevelTitle        EQU wLangTable + $30
DEF wLangTextLevelPassword     EQU wLangTable + $32
DEF wLangGraphicsBank          EQU wLangTable + $43
DEF wLangTextStartLevel        EQU wLangTable + $45
DEF wLangTextHighScorePassword EQU wLangTable + $49
DEF wLangTextPause          EQU wLangTable + $4b
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

; Variables whose purpose is not known yet
DEF wUnk_c000 EQU $c000
DEF wUnk_c1fe EQU $c1fe
DEF wUnk_c202 EQU $c202
DEF wUnk_c250 EQU $c250
DEF wUnk_c2b8 EQU $c2b8
DEF wUnk_c2b9 EQU $c2b9
DEF wUnk_c3b6 EQU $c3b6
DEF wUnk_c3be EQU $c3be
DEF wUnk_c3c8 EQU $c3c8
DEF wUnk_c954 EQU $c954
DEF wUnk_c956 EQU $c956
DEF wUnk_c957 EQU $c957
DEF wUnk_c958 EQU $c958
DEF wUnk_c959 EQU $c959
DEF wUnk_c95a EQU $c95a
DEF wUnk_c95b EQU $c95b
DEF wUnk_c95c EQU $c95c
DEF wUnk_ca9d EQU $ca9d
DEF wUnk_cab5 EQU $cab5
DEF wUnk_cab6 EQU $cab6
DEF wUnk_cabb EQU $cabb
DEF wUnk_cabc EQU $cabc
DEF wUnk_cadd EQU $cadd
DEF wUnk_caed EQU $caed
DEF wUnk_caee EQU $caee
DEF wUnk_caf1 EQU $caf1
DEF wUnk_caf2 EQU $caf2
DEF wUnk_caf3 EQU $caf3
DEF wUnk_caf4 EQU $caf4
DEF wUnk_caf7 EQU $caf7
DEF wUnk_caf8 EQU $caf8
DEF wUnk_caf9 EQU $caf9
DEF wUnk_cafa EQU $cafa
DEF wUnk_cafb EQU $cafb
DEF wUnk_cafc EQU $cafc
DEF wUnk_cb1d EQU $cb1d
DEF wUnk_cb53 EQU $cb53
DEF wUnk_cb54 EQU $cb54
DEF wUnk_cb55 EQU $cb55
DEF wUnk_cb56 EQU $cb56
DEF wUnk_cb57 EQU $cb57
DEF wUnk_cb58 EQU $cb58
DEF wUnk_cb69 EQU $cb69
DEF wUnk_cb7c EQU $cb7c
DEF wUnk_cb7d EQU $cb7d
DEF wUnk_cb7e EQU $cb7e
DEF wUnk_cb7f EQU $cb7f
DEF wUnk_cb85 EQU $cb85
DEF wUnk_cb96 EQU $cb96
DEF wUnk_cc7c EQU $cc7c
DEF wUnk_cc98 EQU $cc98
DEF wUnk_cc99 EQU $cc99
DEF wUnk_ccad EQU $ccad
DEF wUnk_ccb4 EQU $ccb4
DEF wUnk_ccb5 EQU $ccb5
DEF wUnk_ccb6 EQU $ccb6
DEF wUnk_ccb7 EQU $ccb7
DEF wUnk_ccbb EQU $ccbb
DEF wUnk_ccbc EQU $ccbc
DEF wUnk_ccbd EQU $ccbd
DEF wUnk_ccbe EQU $ccbe
DEF wUnk_ccbf EQU $ccbf
DEF wUnk_ccc0 EQU $ccc0
DEF wUnk_ccc1 EQU $ccc1
DEF wUnk_ccc2 EQU $ccc2
DEF wUnk_ccc3 EQU $ccc3
DEF wUnk_ccc4 EQU $ccc4
DEF wUnk_ccc5 EQU $ccc5
DEF wUnk_ccc6 EQU $ccc6
DEF wUnk_ccc7 EQU $ccc7
DEF wUnk_ccc8 EQU $ccc8
DEF wUnk_ccc9 EQU $ccc9
DEF wUnk_ccca EQU $ccca
DEF wUnk_cccb EQU $cccb
DEF wUnk_cccc EQU $cccc
DEF wUnk_cccd EQU $cccd
DEF wUnk_ccce EQU $ccce
DEF wUnk_cccf EQU $cccf
DEF wUnk_cce3 EQU $cce3
DEF wUnk_ccfb EQU $ccfb
DEF wUnk_cf2a EQU $cf2a
DEF wUnk_cf49 EQU $cf49
DEF wUnk_cf6a EQU $cf6a
DEF wUnk_cf6b EQU $cf6b
DEF wUnk_d000 EQU $d000
DEF wUnk_d32a EQU $d32a
DEF wUnk_d6c0 EQU $d6c0
DEF wUnk_d745 EQU $d745
DEF wUnk_d746 EQU $d746
DEF wUnk_d75e EQU $d75e
DEF wUnk_d76c EQU $d76c
DEF wUnk_d76d EQU $d76d
DEF wUnk_d895 EQU $d895
DEF wUnk_d8a4 EQU $d8a4
DEF wUnk_d8a7 EQU $d8a7
DEF wUnk_d8ab EQU $d8ab
DEF wUnk_d8ae EQU $d8ae
DEF wUnk_d8b2 EQU $d8b2
DEF wUnk_d8ba EQU $d8ba
DEF wUnk_d8bb EQU $d8bb
DEF wUnk_d91c EQU $d91c
DEF wUnk_d9bc EQU $d9bc
DEF wUnk_d9be EQU $d9be
DEF wUnk_d9bf EQU $d9bf
DEF wUnk_da37 EQU $da37
DEF wUnk_daaf EQU $daaf
DEF wUnk_dab0 EQU $dab0
DEF wUnk_dab1 EQU $dab1
DEF wUnk_dab2 EQU $dab2
DEF wUnk_dab8 EQU $dab8
DEF wUnk_dab9 EQU $dab9
DEF wUnk_dac3 EQU $dac3
DEF wUnk_dad2 EQU $dad2
DEF wUnk_dad3 EQU $dad3
DEF wUnk_dad4 EQU $dad4
DEF wUnk_dad5 EQU $dad5
DEF wUnk_dae0 EQU $dae0
DEF wUnk_dae1 EQU $dae1
DEF wUnk_dae2 EQU $dae2
DEF wUnk_dae3 EQU $dae3
DEF wUnk_daed EQU $daed
DEF wUnk_daf7 EQU $daf7
DEF wUnk_db4f EQU $db4f
DEF wUnk_db50 EQU $db50
DEF wUnk_db56 EQU $db56
DEF wUnk_db5a EQU $db5a
DEF wUnk_db5b EQU $db5b
DEF wUnk_db5c EQU $db5c
DEF wUnk_db5d EQU $db5d
DEF wUnk_db5e EQU $db5e
DEF wUnk_db5f EQU $db5f
DEF wUnk_db60 EQU $db60
DEF wUnk_db61 EQU $db61
DEF wUnk_db62 EQU $db62
DEF wUnk_db63 EQU $db63
DEF wUnk_db64 EQU $db64
DEF wUnk_db65 EQU $db65
DEF wUnk_db66 EQU $db66
DEF wUnk_db67 EQU $db67
DEF wUnk_db68 EQU $db68
DEF wUnk_db69 EQU $db69
DEF wUnk_db6a EQU $db6a
DEF wUnk_db6b EQU $db6b
DEF wUnk_db6c EQU $db6c
DEF wUnk_db6d EQU $db6d
DEF wUnk_db70 EQU $db70
DEF wUnk_dbd1 EQU $dbd1
DEF wUnk_dbd2 EQU $dbd2
DEF wUnk_dbd3 EQU $dbd3
DEF wUnk_dbd4 EQU $dbd4
DEF wUnk_dbd5 EQU $dbd5
DEF wUnk_dbd6 EQU $dbd6
DEF wUnk_dbd9 EQU $dbd9
DEF wUnk_dbda EQU $dbda
DEF wUnk_dbdb EQU $dbdb
DEF wUnk_dbdc EQU $dbdc
DEF wUnk_dbdd EQU $dbdd
DEF wUnk_dbde EQU $dbde
DEF wUnk_dbdf EQU $dbdf
DEF wUnk_dbea EQU $dbea
DEF wUnk_dbeb EQU $dbeb
DEF wUnk_dbec EQU $dbec
DEF wUnk_dc1e EQU $dc1e
DEF wUnk_dc1f EQU $dc1f
DEF wUnk_dc22 EQU $dc22
DEF wUnk_dc32 EQU $dc32
DEF wUnk_dc37 EQU $dc37
DEF wUnk_dc38 EQU $dc38
DEF wUnk_dc39 EQU $dc39
DEF wUnk_dc3a EQU $dc3a
DEF wUnk_dc3b EQU $dc3b
DEF wUnk_dc3c EQU $dc3c
DEF wUnk_dcd3 EQU $dcd3
DEF wUnk_dcd4 EQU $dcd4
DEF wUnk_dcf3 EQU $dcf3
DEF wUnk_dcf4 EQU $dcf4
DEF wUnk_dcf5 EQU $dcf5
DEF wUnk_dcf7 EQU $dcf7
DEF wUnk_dcf8 EQU $dcf8
DEF wUnk_dcf9 EQU $dcf9
DEF wUnk_dcfa EQU $dcfa
DEF wUnk_dcfb EQU $dcfb
DEF wUnk_dcfc EQU $dcfc
DEF wUnk_dcfd EQU $dcfd
DEF wUnk_dcff EQU $dcff
DEF wUnk_dd00 EQU $dd00
DEF wUnk_dd01 EQU $dd01
DEF wUnk_dd02 EQU $dd02
DEF wUnk_dd03 EQU $dd03
DEF wUnk_dd07 EQU $dd07
DEF wUnk_dd09 EQU $dd09
DEF wUnk_dd0a EQU $dd0a
DEF wUnk_dd0b EQU $dd0b
DEF wUnk_dd17 EQU $dd17
DEF wUnk_dd32 EQU $dd32
DEF wUnk_dd4c EQU $dd4c
DEF wUnk_dd51 EQU $dd51
DEF wUnk_dd53 EQU $dd53
DEF wUnk_dd54 EQU $dd54
DEF wUnk_dd55 EQU $dd55
DEF wUnk_dd56 EQU $dd56
DEF wUnk_dd57 EQU $dd57
DEF wUnk_dd58 EQU $dd58
DEF wUnk_dd59 EQU $dd59
DEF wUnk_dd5a EQU $dd5a
DEF wUnk_dd5b EQU $dd5b
DEF wUnk_dd5c EQU $dd5c
DEF wUnk_dd5d EQU $dd5d
DEF wUnk_dd5e EQU $dd5e
DEF wUnk_dd5f EQU $dd5f
DEF wUnk_dd60 EQU $dd60
DEF wUnk_dd61 EQU $dd61
DEF wUnk_dd6d EQU $dd6d
DEF wUnk_dd6e EQU $dd6e
DEF wUnk_dd6f EQU $dd6f
DEF wUnk_dd70 EQU $dd70
DEF wUnk_dd7c EQU $dd7c
DEF wUnk_dd7d EQU $dd7d
DEF wUnk_dd7e EQU $dd7e
DEF wUnk_dd7f EQU $dd7f
DEF wUnk_dd8b EQU $dd8b
DEF wUnk_dd8c EQU $dd8c
DEF wUnk_dd8d EQU $dd8d
DEF wUnk_dddd EQU $dddd
DEF wUnk_de2d EQU $de2d
DEF wUnk_de7d EQU $de7d
DEF wUnk_de7e EQU $de7e
DEF wUnk_de7f EQU $de7f
DEF wUnk_de80 EQU $de80
DEF wUnk_de81 EQU $de81
DEF wUnk_deb8 EQU $deb8
DEF wUnk_defa EQU $defa
DEF wUnk_defb EQU $defb
DEF wUnk_defd EQU $defd
DEF wUnk_defe EQU $defe
DEF wUnk_df35 EQU $df35
DEF wUnk_df36 EQU $df36
DEF wUnk_df37 EQU $df37
DEF wUnk_df38 EQU $df38
DEF wUnk_df39 EQU $df39
DEF wUnk_df3a EQU $df3a
DEF wUnk_df3b EQU $df3b
DEF wUnk_df3c EQU $df3c
DEF wUnk_df3d EQU $df3d
DEF wUnk_df40 EQU $df40
DEF wUnk_df43 EQU $df43
DEF wUnk_df45 EQU $df45
DEF wUnk_df48 EQU $df48
DEF wUnk_df49 EQU $df49
DEF wUnk_df4c EQU $df4c
DEF wUnk_df4d EQU $df4d
DEF hUnk_ff8f EQU $ff8f
DEF hUnk_ff96 EQU $ff96
DEF hUnk_ff97 EQU $ff97
DEF hUnk_ff9a EQU $ff9a
DEF hUnk_ff9b EQU $ff9b
DEF hUnk_ff9d EQU $ff9d
DEF hUnk_ff9e EQU $ff9e

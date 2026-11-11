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
DEF wSlowBallPending       EQU $d8a3 ; Set by Slow ball
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

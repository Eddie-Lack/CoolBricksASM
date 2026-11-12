; Names for the game's RAM. See docs/RESEARCH.md.

DEF wOamBuffer             EQU $c200 ; Sprite buffer, 40 entries of y, x, tile, attribute. The first entry is the bat
DEF wBatY                  EQU $c200 ; Bat Y: the y of the first sprite in wOamBuffer
DEF wBatX                  EQU $c201 ; Bat X: the x of the first sprite in wOamBuffer
DEF wPasswordByteX         EQU $ccb8 ; Password decoding work bytes
DEF wPasswordByteY         EQU $ccb9 ; 
DEF wStartLevel            EQU $ccba ; Level the "START nnn" menu entry begins on (0-based). 0 = no such entry (the entry is hidden). EncodeLevelPassword also overwrites it on the level password screen; an invalid or cheat password leaves it unchanged
DEF wBricksLeft            EQU $cce7 ; Breakable bricks left in the level
DEF wCurrentLevel          EQU $cce8 ; Current level (0-based)
DEF wBrickMap              EQU $ccea ; Brick hit points (1 to 4), 16 bytes per row, 9 bricks from column 1. $0e = unbreakable brick, $0f = wall (column 0 and columns 10 to 15)
DEF wPowerupMap            EQU $ce0a ; Power-up ids, same layout as wBrickMap. Bit 7 is set while a hit is being processed
DEF wBallSticks            EQU $d763 ; 1 = the ball sticks to the bat. Set by InitBat (level start and after every lost life) and by Magnet, cleared when the held ball is launched
DEF wBatWidth              EQU $d764 ; Bat width in pixels ($20 normal, $28 with Milk)
DEF wNinjaActive           EQU $d76e ; Not 0 while Ninja is active
DEF wBallCount             EQU $d77c ; Balls in play
DEF wLives                 EQU $d8ac ; Lives
DEF wHitRedrawIndex        EQU $d8b4 ; While a hit is queued: tile variant 0 to 3 (bit 0 = brick to the left is wall $0f, bit 1 = brick above is wall), used by ProcessBrickHitQueue for a brick that survives. For a destroyed brick GetBrickNeighbourMask overwrites it with the byte index into BrickRedrawHandlers (neighbour mask * 2, up to $7e)
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
DEF wFallingPowerups       EQU $db71 ; 8 falling power-ups, 12 bytes each: y fraction (not 0 = slot in use), y, x, type, 4 x (tile, attribute)
DEF wUfoHeight             EQU $dc27 ; UFO flight height
DEF wLevelType             EQU $dc35 ; 1 = UFO level, 2 = blob level
DEF wBlobPalette          EQU $dc36 ; High nibble of the level type byte: the sprite palette added to the blob's sprites
DEF wWeaponFlag            EQU $dc3d ; 1 after Rocket, Plasma, Laser or Grenade. Cleared by Poison, Milk, Magnet, Reverse, the plasma shot, the last grenade thrown, a lost life and ResetShots. A Clock brick (id 7) drops a Clock only while this is 1, otherwise it drops Slowball. The fixed Clock brick (id 18) ignores it
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
DEF wBallWorkFlags         EQU $d77b ; Bounce counter, not flags: counts hits on unbreakable bricks and walls since the last bat bounce or breakable brick hit (0 to $14), then bit 7 is set and a 1 to 7 counter runs. When it wraps to 0, UpdateBall_Move turns the ball one direction step to break endless loops. $ff marks a removed ball
DEF wBalls                 EQU $d77d ; The balls, 7 bytes each, in the same layout as wBallWork
DEF wBatDeltaX             EQU $d89f ; Bat movement this frame with the sign reversed: negative when the bat moved right, positive when it moved left (UpdateBall subtracts it from the ball X while the ball rides the bat)
DEF wLaunchDirection       EQU $d8a0 ; Direction ($01 or $1f) for the ball held on the bat that is launched this frame, or 0. The value 4 is not a direction: it is set when a ball not held at its start is released (Multi ball, Magnet) and by the Ninja pick-up. The ball then keeps its direction and only takes its speed from the bat bounce table
DEF wMultiBallPending      EQU $d8a1 ; Set by Multi ball until the ball splits
DEF wAntigravityActive     EQU $d8a2 ; Not 0 while Antigravity (Pepper) is active
DEF wSlowBallActive       EQU $d8a3 ; Set by Slow ball. Selects the slower half of the bat bounce tables
DEF wSleepyBallActive      EQU $d8a5 ; Not 0 while the ball sleeps (Clock)
DEF wBallEffectTimer       EQU $d8a6 ; Time left for Sleepy ball, Antigravity or Ninja
DEF wBallOnBat             EQU $d8a8 ; Not 0 while a ball is held on the bat
DEF wAntigravityCancel     EQU $d8a9 ; Set when another power-up ends Antigravity early
DEF wRemoveBall            EQU $d8aa ; Set to remove the ball being updated
DEF hLastDirection         EQU $ff8b ; Left/right bits of the last frame
DEF hStateTimer            EQU $ffa0 ; Counts down once per frame in FrameLoop. At 0 the frame loop ends and the state in hGameState starts. While it is not 0 the B level skip, Start pause, losing a life and RestartAfterLifeLost are held off, but the bat and balls keep moving
DEF hLifeLostTimer         EQU $ffa2 ; Counts up to $28 after a lost life, then the bat and ball restart

; Gameplay: weapons
DEF wShotActive            EQU $dc3e ; 6 shot slots. 0 = free, otherwise the frames since firing (1 to 4 only draw the flash at the bat, 5 and up fly)
DEF wRocketLaserBat        EQU $dc46 ; 1 with a Rocket or Laser bat
DEF wGrenadePower          EQU $dc49 ; Throw power, grows while A is held
DEF wGrenadeDelay          EQU $dc4b ; Set to 4 when a grenade is thrown. It is not counted down: UpdateProjectiles clears it when the explosion ends. While it is not 0, no grenade can be charged or thrown, so it works as a busy flag
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
DEF wUfoBombActive         EQU $dc2f ; Not 0 while a UFO bomb is active. Counts up each frame: 1 to 4 = release sprite drawn at wUfoBombStartY, 5 and up = falling
DEF wUfoBombX              EQU $dc30
DEF wUfoBombY              EQU $dc31
DEF wUfoDropX              EQU $dc33 ; X position where the UFO drops its bomb, taken from the frame counter

; Gameplay: score, Ghost and effects
DEF wScoreDigits           EQU $d8ad ; Score in units of 10 points: 6 bytes, each digit stored as value + 1 ($01 to $0a). Byte 0 is a carry sink that AddScoreBC sets to 0 on every add; only bytes 1 to 5 are shown and used by BuildScoreText
DEF wGhostActive           EQU $dc20 ; Not 0 while Ghost is active: the blob cannot catch the ball
DEF wGhostTimer            EQU $dc21 ; Time left for Ghost
DEF wBlobActive            EQU $dc23 ; Set to 1 by ResetEnemies on every level, blob level or not. It only lets CheckBlobCatch run. The blob is updated and drawn only when wLevelType has bit 1 set
DEF wBrickBreakEffects     EQU $dc63 ; 14 effect slots, 6 bytes each
DEF wPickupEffects         EQU $dcb7 ; 4 effect slots, 4 bytes each
DEF wUnbreakableHitEffects EQU $dcd5 ; 10 effect slots

; Main menu and password entry
DEF wMenuCursor            EQU $dab5 ; Selected menu item: 0 start, 1 start at password level, 2 enter password, 3 music, 4 sound effects
DEF wMenuButtonHeld        EQU $daba ; 1 until the buttons are released
DEF wMenuItemColours       EQU $dabd ; Palette of each of the 5 menu items: 4 = selected, 1 = normal, 0 = hidden (item 1 while wStartLevel is 0, all items except the third while a password is typed)
DEF wPasswordEntryActive   EQU $dac2 ; 1 while the password is being typed
DEF wPasswordLetterColours EQU $dadb ; Palette of each password letter: 4 = selected, 1 = normal
DEF wPasswordCursor        EQU $dadf ; Letter being edited, 0-3. Becomes 4 when the fourth letter is confirmed, which submits the password, and stays 4 until the next password entry starts

; Gameplay: shot positions
DEF wShotCooldown          EQU $dc44 ; Frames until the next rocket or laser can be fired
DEF wFireLatch             EQU $dc4d ; Not 0 until A is released; each shot needs a new press
DEF wShots                 EQU $dc4e ; 21 bytes. Slots 0 to 2 have 4 bytes each (x, y, y when fired, 1 for a laser). Slots 3 to 5 (laser only) have 3 bytes each (x, y, y when fired), at +12, +15 and +18

; Gameplay: UFO hits
DEF wUfoHits               EQU $dc34 ; Times the UFO has been hit by the ball or a shot in this level. The UFO is gone at 5

; Music
DEF wLevelMusicIndex       EQU $db55 ; 0-2: which of the three level songs plays. NextLevelMusic steps it by 1 (2 goes back to 0) when a level is finished with wLevelsSincePassword = 4, also when the password screen is skipped after the ending. It is reset to 0 when the main menu starts

; Sound driver (bank 6). Channels 1 and 2 are the pulse channels, 3 is the wave channel, 4 is the noise channel.
; Pointers are 2 bytes. The instrument tables are described in docs/RESEARCH.md.
DEF wSoundState            EQU $c000 ; Start of the sound driver variables. The first $68 bytes are cleared at reset
DEF wCh1Tick               EQU $c000 ; Frames left in the current row step. Starts again from wSongTempo
DEF wCh1Rows               EQU $c001 ; Row steps left before the next row is read
DEF wCh1PatternPtr         EQU $c002 ; Next row in the pattern data
DEF wCh1Transpose          EQU $c004 ; Semitones added to every note of the pattern
DEF wCh1OrderPtr           EQU $c005 ; Next entry in the order list
DEF wCh1Envelope           EQU $c007 ; Volume envelope written to NR12 when a note starts
DEF wCh1ReleaseEnvelope    EQU $c008 ; Volume envelope written to NR12 when a note is released
DEF wCh1Trigger            EQU $c009 ; Not 0: restart the note on the next frame
DEF wCh1Duty               EQU $c00a ; Duty and length, written to NR11 every frame
DEF wCh1SlideCount         EQU $c00b ; Frames left in the current pitch slide step
DEF wCh1SlidePtr           EQU $c00c ; Current pitch slide step
DEF wCh1PitchOffset        EQU $c00e ; Sum of the pitch slide so far, added to the frequency (2 bytes)
DEF wCh1ArpCount           EQU $c010 ; Frames left in the current arpeggio step
DEF wCh1ArpPtr             EQU $c011 ; Current arpeggio step
DEF wCh1ModeCount          EQU $c013 ; Frames left in the current pitch mode step
DEF wCh1ModePtr            EQU $c014 ; Current pitch mode step
DEF wCh1Note               EQU $c016 ; Note that plays: transpose + note number
DEF wCh2Tick               EQU $c017 ; Frames left in the current row step. Starts again from wSongTempo
DEF wCh2Rows               EQU $c018 ; Same as wCh1Rows, for channel 2
DEF wCh2PatternPtr         EQU $c019 ; Same as wCh1PatternPtr, for channel 2
DEF wCh2Transpose          EQU $c01b ; Same as wCh1Transpose, for channel 2
DEF wCh2OrderPtr           EQU $c01c ; Same as wCh1OrderPtr, for channel 2
DEF wCh2Envelope           EQU $c01e ; Same as wCh1Envelope, for channel 2
DEF wCh2ReleaseEnvelope    EQU $c01f ; Same as wCh1ReleaseEnvelope, for channel 2
DEF wCh2Trigger            EQU $c020 ; Same as wCh1Trigger, for channel 2
DEF wCh2Duty               EQU $c021 ; Same as wCh1Duty, for channel 2
DEF wCh2SlideCount         EQU $c022 ; Same as wCh1SlideCount, for channel 2
DEF wCh2SlidePtr           EQU $c023 ; Same as wCh1SlidePtr, for channel 2
DEF wCh2PitchOffset        EQU $c025 ; Same as wCh1PitchOffset, for channel 2
DEF wCh2ArpCount           EQU $c027 ; Same as wCh1ArpCount, for channel 2
DEF wCh2ArpPtr             EQU $c028 ; Same as wCh1ArpPtr, for channel 2
DEF wCh2ModeCount          EQU $c02a ; Same as wCh1ModeCount, for channel 2
DEF wCh2ModePtr            EQU $c02b ; Same as wCh1ModePtr, for channel 2
DEF wCh2Note               EQU $c02d ; Same as wCh1Note, for channel 2
DEF wCh3Tick               EQU $c02e ; Frames left in the current row step. Starts again from wSongTempo
DEF wCh3Rows               EQU $c02f ; Same as wCh1Rows, for channel 3
DEF wCh3PatternPtr         EQU $c030 ; Same as wCh1PatternPtr, for channel 3
DEF wCh3Transpose          EQU $c032 ; Same as wCh1Transpose, for channel 3
DEF wCh3OrderPtr           EQU $c033 ; Same as wCh1OrderPtr, for channel 3
DEF wCh3VolumeCount        EQU $c035 ; Frames left in the current volume step
DEF wCh3VolumePtr          EQU $c036 ; Current volume step, written to NR32
DEF wCh3ReleaseVolumePtr   EQU $c038 ; Volume table used after a release
DEF wCh3SlideCount         EQU $c03a ; Same as wCh1SlideCount, for channel 3
DEF wCh3SlidePtr           EQU $c03b ; Same as wCh1SlidePtr, for channel 3
DEF wCh3PitchOffset        EQU $c03d ; Same as wCh1PitchOffset, for channel 3
DEF wCh3ArpCount           EQU $c03f ; Same as wCh1ArpCount, for channel 3
DEF wCh3ArpPtr             EQU $c040 ; Same as wCh1ArpPtr, for channel 3
DEF wCh3ModeCount          EQU $c042 ; Same as wCh1ModeCount, for channel 3
DEF wCh3ModePtr            EQU $c043 ; Same as wCh1ModePtr, for channel 3
DEF wCh3Note               EQU $c045 ; Same as wCh1Note, for channel 3
DEF wCh4Tick               EQU $c046 ; Frames left in the current row step. Starts again from wSongTempo
DEF wCh4Rows               EQU $c047 ; Same as wCh1Rows, for channel 4
DEF wCh4PatternPtr         EQU $c048 ; Same as wCh1PatternPtr, for channel 4
DEF wCh4Transpose          EQU $c04a ; Same as wCh1Transpose, for channel 4. Has no effect on noise
DEF wCh4OrderPtr           EQU $c04b ; Same as wCh1OrderPtr, for channel 4
DEF wCh4Envelope           EQU $c04d ; Volume envelope written to NR42 when a note starts
DEF wCh4ReleaseEnvelope    EQU $c04e ; Volume envelope written to NR42 when a note is released
DEF wCh4Trigger            EQU $c04f ; Same as wCh1Trigger, for channel 4
DEF wCh4ShapeCount         EQU $c050 ; Frames left in the current NR43 step
DEF wCh4ShapePtr           EQU $c051 ; Current NR43 step
DEF wCh4ControlCount       EQU $c053 ; Frames left in the current NR44 step
DEF wCh4ControlPtr         EQU $c054 ; Current NR44 step
DEF wSfxTick               EQU $c056 ; Frames left in the current row step of the sound effect. One row step is 4 frames
DEF wSfxRows               EQU $c057 ; Row steps left before the next sound effect row is read
DEF wSfxPtr                EQU $c058 ; Next row in the sound effect data
DEF wSfxChannel            EQU $c05f ; Address of the channel the sound effect uses: wCh2Tick or wCh4Tick. Low byte $ff = no sound effect
DEF wSfxDone               EQU $c061 ; $ff when the sound effect has ended
DEF wSongTempo             EQU $c062 ; Frames per row step of the song
DEF wSfxPriority           EQU $c063 ; Priority of the sound effect that plays
DEF wWaveAnimCount         EQU $c064 ; Frames left in the current wave animation step
DEF wWaveAnimPtr           EQU $c065 ; Current wave animation step
DEF wCh3FreqLow            EQU $c067 ; Last value written to NR33
DEF wCh3FreqHigh           EQU $c068 ; Bits 0-2 of the last frequency written to NR34 by Channel3Effects (bit 7 is clear). UpdateWaveAnim writes NR34 again with this value XOR $80, which sets bit 7 and restarts the channel

; Sprites
DEF wOamUsedLastFrame      EQU $c2b4 ; Extra sprites drawn in the previous frame
DEF wOamUsed               EQU $c2b5 ; Extra sprites drawn so far this frame
DEF wOamWritePtr           EQU $c2b6 ; Next free entry in wOamBuffer

; Interrupt stubs in RAM
DEF wStatJump              EQU $c35a ; jp instruction to the LCD STAT handler. A raster effect copies its handler code here instead
DEF hOamDmaRoutine         EQU $ff80 ; OAM DMA routine, copied here by LoadOAMCode
DEF hVBlankJump            EQU $ff92 ; jp instruction to the current VBlank handler

; More variables
DEF wLcdcFlags             EQU $c359 ; Extra LCDC bits for the current screen
DEF wLevelTitleText        EQU $d72a ; The "LEVEL nnn" string shown at the start of a level
DEF wBrickTileLeft         EQU $d8b8 ; Tile numbers for the brick being redrawn
DEF wBrickTileRight        EQU $d8b9
DEF wBrickRedrawCount      EQU $d9bd ; Brick tile changes queued this frame
DEF wMenuDownHeld          EQU $dab6 ; 1 until down is released, on the main menu and on the password entry
DEF wMenuUpHeld            EQU $dab7 ; 1 until up is released, on the main menu and on the password entry
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
DEF wUfoPassIndex          EQU $dc2e ; Entry of UfoPassTable used by the pass that has just started (increased before the lookup, wraps at 8). It starts at 0, so the first pass uses entry 1
DEF hLogoTimer             EQU $ff91 ; Counts down while a logo screen is shown
DEF wBrickShinePtr         EQU $dab3 ; Position in BrickShineAnimation (bank 9), the shine that sweeps over the bricks

; HDMA transfers
DEF wHdmaMode              EQU $cb53 ; 0 or 1 = no transfer, 3 = from bank $0C, other = from the language graphics bank
DEF wHdmaSource            EQU $cb54 ; Source address of the next HDMA transfer (low byte first)
DEF wHighScoreAnimPtr      EQU $cb56 ; Position in HighScoreAnimFrames
DEF wBatExplosionY         EQU $d76c ; Position of the bat explosion
DEF wBatExplosionX         EQU $d76d
DEF wRemovedBallPtrs       EQU $d895 ; Addresses of ball slots freed this frame
DEF wBallEffectTick        EQU $d8a7 ; Frame counter for wBallEffectTimer while Sleepy ball or Ninja is active (they count down once every 2 frames), also used for the Sleepy ball animation. Antigravity does not use it
DEF wBackgroundTilemap    EQU $cf2a ; Copy of the level background tilemap, laid out like the screen at $9800
DEF wLevelTilemapCopy     EQU $d32a ; Copy of the tilemap at $9800, taken after the bricks are drawn
DEF wVBlankTileWrites     EQU $d9bf ; Tile changes for VBlank, 3 bytes each: address, tile. wBrickRedrawCount is their number
DEF wVBlankAttrWrites     EQU $da37 ; Attribute changes for VBlank, 3 bytes each: address, attribute
DEF wVBlankAttrWriteCount EQU $d9be ; Number of entries in wVBlankAttrWrites
DEF wVBlankTileWritePtr   EQU $daaf ; Next free position in wVBlankTileWrites
DEF wLevelSweepPending    EQU $dae1 ; 1 = SweepBricks runs when the level appears
DEF wHighScoreAnimTick    EQU $cb58 ; Counts frames up to 3 between steps of the "HIGH SCORE" animation
DEF wHighScoreSpriteFrames EQU $cccf ; Animation step of each of the 20 sprites on the high score screen
DEF wRasterTable          EQU $c3b6 ; One record per screen line for the raster effect handlers
DEF wRasterPtr            EQU $c956 ; Address of the record in wRasterTable for the next line
DEF wFireworkWork         EQU $dd51 ; Working copy of the firework being updated (15 bytes):
                                    ; +0 script address, +2 x (16-bit), +4 y (16-bit), +6 fuse step (16-bit), +8 direction,
                                    ; +9 fuse (16-bit), +11 colour, +12 sparks left, +13 address of its sparks
DEF wFireworks            EQU $dd60 ; The three fireworks on the level password screen, 15 bytes each
DEF wFireworkSparks       EQU $dd8d ; Sparks of the three fireworks: 10 sparks of 8 bytes for each
DEF wFireworkSpriteCount  EQU $de7d ; Sprites written by UpdateFireworks this frame
DEF wFireworkOamPtr       EQU $de7e ; Next free sprite in wOamBuffer
DEF wFireworkTick         EQU $de80 ; Counts 0 to 3; sparks change colour when it is 0
DEF wTwinkles             EQU $de81 ; The 11 twinkling stars on the level password screen
DEF wTitleLetterArrived   EQU $db5a ; Number (1 to 6) of the title letter that just finished sliding in
DEF wTitleLetterX         EQU $db5b ; X offset of each of the six sliding title letters
DEF wTitleLetterPathPtrs  EQU $db61 ; Address of the next path step of each title letter (6 words)
DEF wTitleLetterSliding   EQU $db6d ; Number (1 to 6) of the title letter that is sliding in; 0 = none
DEF hInterruptEnable      EQU $ff9a ; Value for rIE on this screen: 1 = VBlank, 3 = VBlank and LCD STAT
DEF hLycStart             EQU $ff9b ; First value of rLYC on this screen
DEF hLevelScrollX         EQU $ff9d ; rSCX while a level is played
DEF hMenuScrollY          EQU $ff9e ; rSCY of the main menu. The menu slides in from $90 and takes input at 0
DEF wCreditsRowColour     EQU $dcf4 ; Colour code that follows the credits row just drawn. $fe = no new row, $ff = handled
DEF wCreditsScrollDone    EQU $dcf5 ; 0 = VBlank must scroll the credits one pixel, $ff = done
DEF wCreditsScrollY       EQU $dcf7 ; rSCY of the credits
DEF wCreditsTextStart     EQU $dcf8 ; Address of the credits text for the chosen language
DEF wCreditsTextPtr       EQU $dcfa ; Address of the next credits row
DEF wCreditsRowAddress    EQU $dcfc ; Tilemap address where the next credits row is drawn
DEF wLevelPasswordReady   EQU $dd00 ; 1 = the level password screen is set up and its VBlank handler may run
DEF wScrollSplitPtr       EQU $dd01 ; Address of the next entry of wScrollSplits for the LCD STAT handler
DEF wScrollSplits         EQU $dd03 ; Three pairs of rSCX and the screen line where the next pair starts
DEF wLogoSwayPtr          EQU $dd09 ; Address of the next step in LogoSwaySteps
DEF wLevelPasswordText    EQU $dd0b ; The text of the level password screen, copied from the language table (62 bytes)
DEF wTwinkleWrites        EQU $deb8 ; Tile changes of the twinkling stars for VBlank, 6 bytes each
DEF wTwinkleWriteCount    EQU $defa ; Number of entries in wTwinkleWrites
DEF wHitTileWriteCount    EQU $d9bc ; Tile changes that ProcessBrickHitQueue added to wVBlankTileWrites this frame
DEF wEndingSeen           EQU $dcff ; Non-zero after the ending. The level password screens are then skipped
DEF wBallLoopCount        EQU $d8a4 ; Number of balls at the start of this frame's ball loop
DEF wLevelTitleTimer      EQU $d745 ; Counts down while the top row shows the level title instead of the score. $ff = clear the row first
DEF wLevelTitleBlink      EQU $d746 ; Blink phase of the level title
DEF wNameEntry            EQU $ccbb ; The name being entered on the high score screen. $5b is an empty position
DEF wNameEntryCursor      EQU $cccc ; Position of the letter being chosen in wNameEntry
DEF wNameEntryAddress     EQU $ccb4 ; Tilemap address where wNameEntry is drawn. 0 = no name entry
DEF wBlinkPhase           EQU $c95b ; Blink phase of the name entry row
DEF wBlinkTimer           EQU $c95c ; Frames until the name entry row blinks again
DEF wPasswordChars        EQU $cb7c ; The four letters of the password being checked or built
DEF wLevelPasswordChars   EQU $cce3 ; The four letters of the latest level password
DEF wEnemyPathWork        EQU $dbd1 ; Working copy of the enemy path record being updated (15 bytes)
DEF wStackTop                 EQU $c1fe ; Initial stack pointer; the stack grows down from here
DEF wNinjaBallFrame           EQU $c2b8 ; Ball animation frame while Ninja is active: 0, 1, 2 select tiles $13, $14, $15
DEF wExtraSprites             EQU $c2b9 ; List of extra sprites (y, x, tile, attribute) built during the frame through wOamWritePtr, then copied into wOamBuffer after the bat sprites
DEF wRasterObjPaletteIndex    EQU $c958 ; Value AnimatePalettes writes to rOCPS each frame before the raster handler runs: $94 in a level, $80 on the title screen and credits
DEF wHighScoresVBlankFlag     EQU $c959 ; Not 0 from the high score screen on: VBlankMenus then jumps to VBlankMenus_BlinkRow instead of scrolling the menu. It stays set after the screen is left (still 1 during the title picture that follows game over) and is cleared only by StateInit_MainMenu
DEF wCreditsFrameToggle       EQU $c95a ; Flips between 0 and 1 every VBlank on the credits; UpdateCreditsScroll runs when it becomes 0, so every second frame
DEF wFadedPalettes            EQU $ca9d ; Palettes after fading, 2 bytes per colour: 8 background palettes here and 8 sprite palettes at + $40
DEF wFadedObjPalettes         EQU $cadd ; Sprite palettes after the fade step, 64 bytes of packed 15-bit colours that CopyPalettesToHardware writes to rOCPD
DEF wRasterColours            EQU $cb1d ; Nine records of three 16-bit colours (54 bytes) that AnimatePalettes gathers from the faded palettes and then copies into wRasterTable, adding a seventh byte to each record
DEF wLatestScoreText          EQU $cc99 ; Last string of the high score table: the latest score line in the current language, with the score digits at $ccad
DEF wScoreText                EQU $ccad ; The score as five characters '0' to '9' (wScoreDigits + 1 onwards, each plus $2f), built by BuildScoreText to compare with the high score table and copy into it
DEF wHighScoresNextState      EQU $ccb6 ; hGameState value to go to when the high score screen is left: 1 = main menu when shown from the idle menu, 5 = title picture when shown after game over
DEF wNameEntryColours         EQU $ccc2 ; Tile attribute byte for each of the seven name entry letters: $81 for the letter under the cursor, $84 for the others
DEF wNameEntryUpHeld          EQU $ccc9 ; 1 while up is held during name entry, so one press moves the letter forward only once; 0 when up is released
DEF wNameEntryDownHeld        EQU $ccca ; 1 while down is held during name entry, so one press moves the letter back only once; 0 when down is released
DEF wNameEntryButtonHeld      EQU $cccb ; 1 while left, right, A, B, Select or Start is held during name entry, so one press moves the cursor only once; 0 when all are released
DEF wNameEntryDone            EQU $cccd ; Set to 1 when the high score screen is left; the VBlank handler then clears wNameEntryAddress and resets the 7 name cells' attributes to $84 instead of drawing the name
DEF wHighScoresIdleTick       EQU $ccce ; Frame counter 0-3 on the high score screen; wMenuIdleTimer is decremented each time it wraps to 0
DEF wRasterPaletteBuffer      EQU $d000 ; WRAM bank 2: the $90 palettes unpacked by LoadPalettes when hPaletteMode is 2, 3 bytes per colour ($6c0 bytes)
DEF wRasterPalettesFaded      EQU $d6c0 ; WRAM bank 2: the $90 palettes of wRasterPaletteBuffer after the fade step, as 2-byte GBC colours ($480 bytes)
DEF wMessageUnused            EQU $d75e ; Set to 0 by ShowMessage together with wLevelTitleBlink; never read
DEF wUnbreakableHitSpawned    EQU $d8ab ; Cleared once per ball update, before the first CollideBall in UpdateBall_Move (the second step of the same update does not clear it), and set to 1 by SpawnUnbreakableHitEffect, so one ball update starts at most one unbreakable-brick hit effect
DEF wHitEffectX               EQU $d8ba ; Last byte of the wBrickHitQueue entry being built: the X of the brick break effect to start when the brick is destroyed (the plasma shot's X), or 0 for no effect
DEF wPlasmaShotX              EQU $d8bb ; X of the plasma shot in flight, copied from the shot's x each frame by UpdateShot0 and UpdateShot1; HitBrickWithShot passes it on as wHitEffectX
DEF wBatTilesColumn           EQU $dab1 ; Tilemap column, (wBatX - 8) / 8, where UpdateBatTiles last drew the background tiles under the wide bat
DEF wBatTilesDrawn            EQU $dab2 ; Not 0 (it holds wBatWidth) while UpdateBatTiles has tiles drawn under the wide bat at wBatTilesColumn; cleared when they are restored and at level set-up
DEF wMenuRightHeld            EQU $dab8 ; 1 until right is released on the music and sound effects menu items, so holding right toggles the setting only once
DEF wMenuLeftHeld             EQU $dab9 ; 1 while Left is held on the main menu, so that one press toggles the music or SFX setting only once; 0 when released
DEF wStartLevelLine           EQU $dac3 ; RAM copy of the "START Lnnn" menu string of the chosen language (20 bytes), drawn with DrawString; wStartLevelText is its three digits
DEF wMenuSparkleCurvePtrs     EQU $daed ; Address of the next step in MenuSparkleCurve for each of the 5 menu sparkles (5 words); the step is added to the sparkle's second position byte
DEF wMenuTwinkles             EQU $daf7 ; 11 small animated menu sprites (2 OAM entries each), 8 bytes per entry: delay countdown (word), animation frame 0-10, x, y, sprite attribute, delay to reload after the animation (word)
DEF wMenuScrollStepPtr        EQU $db4f ; Address (word) of the next signed step that is added to hMenuScrollY each frame while the main menu slides in
DEF wPasswordSlotTiles        EQU $db56 ; The 4 menu tiles at $9968-$996B that the password letters overwrite, saved when the menu is drawn and written back every VBlank while no password is being typed
DEF wPowerupSpritesUsed       EQU $db70 ; Number of sprites written for falling power-ups this frame (4 per power-up); added into wOamUsedLastFrame and then cleared
DEF wGrenadeBlastTimer        EQU $dbea ; Grenade explosion timer: set to $34 when a grenade lands, counts down each frame and picks the explosion sprite frame
DEF wGrenadeBlastX            EQU $dbeb ; X position of the grenade explosion being drawn (copied from the grenade's X when it lands)
DEF wGrenadeBlastY            EQU $dbec ; Y position of the grenade explosion being drawn (copied from the grenade's Y when it lands)
DEF wGhostTick                EQU $dc22 ; Frame counter for Ghost: wGhostTimer counts down once every 8 frames
DEF wUfoBombStartY            EQU $dc32 ; Y position where the UFO bomb was released (UFO height + 16); the release sprite is drawn here for the first frames of the drop
DEF wProjectileBouncedX       EQU $dc37 ; 1 when the projectile hit a wall ($0f) on its left or right side in this step; its X position is then put back to the old value
DEF wProjectileBouncedY       EQU $dc38 ; 1 when the projectile hit a wall ($0f) above or below in this step; its Y position is then put back to the old value
DEF wProjectileOldXSub        EQU $dc39 ; Projectile X position before the move, fraction byte
DEF wProjectileOldX           EQU $dc3a ; Projectile X position before the move, used to undo the move after a side bounce
DEF wProjectileOldYSub        EQU $dc3b ; Projectile Y position before the move, fraction byte
DEF wProjectileOldY           EQU $dc3c ; Projectile Y position before the move, used to undo the move after a top or bottom bounce
DEF wUnbreakableHitEffectPtr  EQU $dcd3 ; Address of the slot in wUnbreakableHitEffects that the next effect will use; goes back to the first slot at the $ff end marker
DEF wUnbreakableHitEffectsEnd EQU $dcf3 ; $ff end marker right after the 10 three-byte slots of wUnbreakableHitEffects; the spawn pointer wraps to the first slot when it reaches it
DEF wBonusCountdownPaused     EQU $dd4c ; Never written by any code and always 0, so the countdown on the level password screen always runs and the pause branch in LevelPassword_Update is dead
DEF wLevelPasswordUnused      EQU $defb ; Set to 0 when the level password screen is set up; no code that reads it was found
DEF wLanguageDownHeld         EQU $defd ; Not 0 while Down is held on the language selection screen, so one press moves the choice one step
DEF wLanguageUpHeld           EQU $defe ; Not 0 while Up is held on the language selection screen, so one press moves the choice one step
DEF wLangOnTiles              EQU $df3d ; The three tile numbers of the word ON drawn on the music and sound effects rows of the main menu (English "ON ")
DEF wLangOffTiles             EQU $df40 ; The three tile numbers of the word OFF drawn on the music and sound effects rows of the main menu (English "OFF")
DEF wLangLevelLetter          EQU $df43 ; The letter put in front of level numbers in this language: L in English, Italian and German, N in Spanish, E in French
DEF wLangLatestBlinkWidth     EQU $df45 ; Number of tile attributes, starting at $9a01, that blink on the high score screen; it covers this language's LATEST label
DEF wLangStartLevelDigitsAddress EQU $df48 ; Tile map address of the three level digits of the START Lnnn row of the main menu ($98eb in English)
DEF hMenuSparkleTick          EQU $ff8f ; Goes up by 1 on each call of UpdateMenuSparkles once the menu has slid in; sparkles move to their next animation frame only when its low two bits are 0
DEF wBrickRedrawQueue      EQU $d91c ; Brick tile changes waiting to be drawn, 4 bytes each
DEF wStartLevelText        EQU $dad3 ; The three digits of "START nnn" on the menu
DEF wMenuSparkles          EQU $dae3 ; The sparkles on the menu screens
DEF wMenuIdleTimer         EQU $ccb7 ; Counts down every second frame on the menu (every fourth frame on the high score screen). A button on the menu resets it to $FD ($FB while typing a password). $FF = no countdown (set by game over and by the idle switch for name entry). At 0 the high scores or the credits appear
DEF wMenuTick              EQU $dae0 ; Counts frames on the menu
DEF wAttractToggle         EQU $dae2 ; Alternates between the high scores and the credits each time the menu idles

; Selected language: 0 English, 1 Spanish, 2 French, 3 German, 4 Italian
DEF wLanguage              EQU $defc ; 0 English, 1 Spanish, 2 French, 3 German, 4 Italian

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

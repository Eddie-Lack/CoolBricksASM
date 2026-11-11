# ROM map

What each part of every ROM bank holds. This file is written by `tools/rom_map.py` from the labels in the sources.
Runs of labels with the same prefix are shown as one row.

## Bank $00

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$0000` | 1 | code | `RST_00` |
| `$0001` | 5 | code | `ShowMessageBankE` |
| `$0006` | 2 | data | `ShowMessage` |
| `$0008` | 56 | code | `RST_08` to `RST_38` (7 labels) |
| `$0040` | 8 | code | `VBlankInterrupt` |
| `$0048` | 8 | code | `LCDCInterrupt` |
| `$0050` | 8 | code | `TimerOverflowInterrupt` |
| `$0058` | 8 | code | `SerialTransferCompleteInterrupt` |
| `$0060` | 1 | code | `JoypadTransitionInterrupt` |
| `$0061` | 69 | code | `LoadPalettes` |
| `$00A6` | 90 | code | `StateInit_ColorOnly` |
| `$0100` | 4 | code | `Boot` |
| `$0104` | 48 | data | `HeaderLogo` |
| `$0134` | 11 | data | `HeaderTitle` |
| `$013F` | 4 | data | `HeaderManufacturerCode` |
| `$0143` | 1 | data | `HeaderCGBFlag` |
| `$0144` | 2 | data | `HeaderNewLicenseeCode` |
| `$0146` | 1 | data | `HeaderSGBFlag` |
| `$0147` | 1 | data | `HeaderCartridgeType` |
| `$0148` | 1 | data | `HeaderROMSize` |
| `$0149` | 1 | data | `HeaderRAMSize` |
| `$014A` | 1 | data | `HeaderDestinationCode` |
| `$014B` | 1 | data | `HeaderOldLicenseeCode` |
| `$014C` | 1 | data | `HeaderMaskROMVersion` |
| `$014D` | 1 | data | `HeaderComplementCheck` |
| `$014E` | 2 | data | `HeaderGlobalChecksum` |
| `$0150` | 84 | code | `ProgramStart` |
| `$01A4` | 12 | code | `ClearRAM` |
| `$01B0` | 9 | code | `DataTransfer` |
| `$01B9` | 27 | code | `ClearTileMap` |
| `$01D4` | 29 | code | `CopyTilemapRect` |
| `$01F1` | 21 | code | `FillTilemapRect` |
| `$0206` | 4 | code | `ChangeROMBank` |
| `$020A` | 25 | code | `LoadOAMCode` |
| `$0223` | 40 | code | `ReadJoypad` |
| `$024B` | 77 | code | `InstallInterruptHandlers` |
| `$0298` | 27 | code | `Stat_Default` |
| `$02B3` | 241 | code | `VBlank` to `VBlank_InGame` (2 labels) |
| `$03A4` | 517 | code | `VBlankMenus` to `VBlankMenus_BlinkRow` (3 labels) |
| `$05A9` | 48 | code | `VBlank_Credits` |
| `$05D9` | 257 | code | `StateInit_HighScores` |
| `$06DA` | 413 | code | `HighScores_Update` to `HighScores_ButtonsReleased` (3 labels) |
| `$0877` | 38 | code | `LoadHighScores` |
| `$089D` | 43 | code | `DrawHighScoreTable` |
| `$08C8` | 172 | code | `BuildScoreText` |
| `$0974` | 134 | code | `EncodeLevelPassword` |
| `$09FA` | 178 | code | `CheckPassword` |
| `$0AAC` | 63 | code | `StartHdmaTransfer` |
| `$0AEB` | 24 | code | `PlayLevelMusic` |
| `$0B03` | 696 | code | `LoadLevel` to `LoadLevel_ResumeDone` (3 labels) |
| `$0DBB` | 13 | code | `RleFill` |
| `$0DC8` | 22 | code | `RleOverlay` |
| `$0DDE` | 118 | code | `BuildLevelTitle` |
| `$0E54` | 48 | code | `DrawString` |
| `$0E84` | 51 | code | `DrawStringSkipZero` |
| `$0EB7` | 46 | code | `InitBat` |
| `$0EE5` | 75 | code | `InitBall` |
| `$0F30` | 237 | code | `Gameplay_Update` to `Gameplay_MoveBat` (3 labels) |
| `$101D` | 186 | code | `Gameplay_MoveBat_Right` to `Gameplay_MoveBat_Left` (2 labels) |
| `$10D7` | 624 | code | `Gameplay_AntigravitySteering` to `Gameplay_CheckPause` (7 labels) |
| `$1347` | 101 | code | `RestartAfterLifeLost` |
| `$13AC` | 583 | code | `UpdateBall` to `UpdateBall_Move` (3 labels) |
| `$15F3` | 453 | code | `CollideBall` to `CollideBall_Corners` (2 labels) |
| `$17B8` | 21 | code | `ReflectBallLeft` |
| `$17CD` | 32 | code | `ReflectBallRight` |
| `$17ED` | 21 | code | `ReflectBallTop` |
| `$1802` | 32 | code | `ReflectBallBottom` |
| `$1822` | 98 | code | `CollideBallPoint` |
| `$1884` | 87 | code | `HitBrickAtBall` |
| `$18DB` | 33 | code | `BatBounceLookup` |
| `$18FC` | 84 | code | `UpdateBatExplosion` |
| `$1950` | 187 | code | `UpdateBatTiles` |
| `$1A0B` | 47 | code | `HitBrickWithShot` |
| `$1A3A` | 92 | code | `HitBrickWithBall` |
| `$1A96` | 79 | code | `GetBrickNeighbourMask` |
| `$1AE5` | 47 | code | `QueueBrickHit` |
| `$1B14` | 107 | code | `CountBrickDestroyed` |
| `$1B7F` | 395 | code | `BrickRedraw_Lit` to `BrickRedraw_BelowLeftShadow` (9 labels) |
| `$1D0A` | 21 | code | `BrickRedrawCase_Lit_Below` to `BrickRedrawCase_Lit_BelowLeft` (3 labels) |
| `$1D1F` | 4 | code | `BrickRedrawCase_Lit` |
| `$1D23` | 21 | code | `BrickRedrawCase_ShadowRight_Below` to `BrickRedrawCase_ShadowRight_BelowLeft` (3 labels) |
| `$1D38` | 4 | code | `BrickRedrawCase_ShadowRight` |
| `$1D3C` | 21 | code | `BrickRedrawCase_ShadowLeft_Below` to `BrickRedrawCase_ShadowLeft_BelowLeft` (3 labels) |
| `$1D51` | 4 | code | `BrickRedrawCase_ShadowLeft` |
| `$1D55` | 21 | code | `BrickRedrawCase_Shadow_Below` to `BrickRedrawCase_Shadow_BelowLeft` (3 labels) |
| `$1D6A` | 4 | code | `BrickRedrawCase_Shadow` |
| `$1D6E` | 14 | code | `BrickRedrawCase_Shadow_BelowHalfShadow` to `BrickRedrawCase_Shadow_BelowLeftShadow` (2 labels) |
| `$1D7C` | 115 | code | `FlushBrickRedraw` |
| `$1DEF` | 4 | code | `MarkBrickHitQueue` |
| `$1DF3` | 40 | code | `ClearBrickHitQueue` |
| `$1E1B` | 15 | code | `ProcessBrickHitQueue` |
| `$1E2A` | 337 | code | `ProcessBrickHitQueue_Entry` to `ProcessBrickHitQueue_Next` (4 labels) |
| `$1F7B` | 312 | code | `StateInit_MainMenu` |
| `$20B3` | 71 | code | `FormatLevelNumber` |
| `$20FA` | 314 | code | `MainMenu_Update` to `MainMenu_PasswordEntry` (2 labels) |
| `$2234` | 52 | code | `SubmitPassword` |
| `$2268` | 5 | code | `SubmitPassword_ButtonsReleased` |
| `$226D` | 686 | code | `MainMenu_Navigate` to `MainMenu_IdleTick` (2 labels) |
| `$251B` | 52 | code | `StartGame` |
| `$254F` | 278 | code | `StateInit_TitleScreen` |
| `$2665` | 34 | code | `TitleScreen_Update` |
| `$2687` | 148 | code | `StateInit_GameOver` |
| `$271B` | 72 | code | `ResetEnemies` |
| `$2763` | 24 | code | `UpdateEnemies` |
| `$277B` | 238 | code | `UpdateBlob` |
| `$2869` | 41 | code | `InitEnemyObject` |
| `$2892` | 185 | code | `UpdateEnemyPath` |
| `$294B` | 15 | code | `ClearProjectiles` |
| `$295A` | 39 | code | `SpawnProjectile` |
| `$2981` | 202 | code | `UpdateProjectiles` |
| `$2A4B` | 116 | code | `UpdateProjectile_HitBrick` |
| `$2ABF` | 194 | code | `UpdateProjectile` |
| `$2B81` | 384 | code | `UpdateProjectile_Move` |
| `$2D01` | 101 | code | `Projectile_CheckBrickKeepDE` to `Projectile_HitBrick` (3 labels) |
| `$2D66` | 777 | code | `UpdateUfo` |
| `$306F` | 40 | code | `UfoHit` |
| `$3097` | 213 | code | `UpdateUfoBomb` |
| `$316C` | 47 | code | `CheckUfoHit` |
| `$319B` | 63 | code | `CheckBlobCatch` |
| `$31DA` | 50 | code | `ResetShots` |
| `$320C` | 42 | code | `UpdateShots` to `UpdateShots_Shot5` (6 labels) |
| `$3236` | 579 | code | `Shots_HandleFire` to `Shots_FireRocketOrLaser` (3 labels) |
| `$3479` | 242 | code | `UpdateShot0` |
| `$356B` | 242 | code | `UpdateShot1` |
| `$365D` | 200 | code | `UpdateShot2` |
| `$3725` | 188 | code | `UpdateShot3` |
| `$37E1` | 188 | code | `UpdateShot4` |
| `$389D` | 188 | code | `UpdateShot5` |
| `$3959` | 254 | code | `StateInit_Pause` to `StateInit_DeveloperLogos` (2 labels) |
| `$3A57` | 21 | code | `ClearCheatFlags` |
| `$3A6C` | 108 | code | `StateInit_PublisherLogo` |
| `$3AD8` | 22 | code | `PublisherLogo_Update` |
| `$3AEE` | 98 | code | `StateInit_Credits` |
| `$3B50` | 59 | code | `SelectCreditsText` |
| `$3B8B` | 169 | code | `UpdateCreditsScroll` to `UpdateCreditsScroll_BlankRow` (3 labels) |
| `$3C34` | 17 | code | `NextLevelMusic` |
| `$3C45` | 524 | code | `StateInit_LevelPassword` to `StateInit_LanguageSelect` (2 labels) |
| `$3E51` | 5 | code | `PlayMusic` |
| `$3E56` | 14 | code | `StartSong` |
| `$3E64` | 27 | code | `PlaySound` |
| `$3E7F` | 14 | code | `UpdateSound` |
| `$3E8D` | 96 | code | `StateInit_Copyright` |
| `$3EED` | 22 | code | `Copyright_Update` |
| `$3F03` | 253 | code | `StateInit_Ending` |

## Bank $01

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 1584 | data | `Palettes_MainMenu` to `Palettes_Copyright` (11 labels) |
| `$4630` | 64 | data | `LevelSpritePalettes` |
| `$4670` | 448 | data | `LevelPalette_4670` to `LevelPalette_47f0` (7 labels) |
| `$4830` | 400 | data | `BrickPalette_4830` to `BrickPalette_49b0` (24 labels) |
| `$49C0` | 84 | data | `BallProjectileFrames` |
| `$4A14` | 84 | data | `GrenadeProjectileFrames` |
| `$4A68` | 185 | data | `GrenadeExplosionFrames` |
| `$4B21` | 52 | data | `GrenadeExplosionSequence` |
| `$4B55` | 339 | data | `ThrowPath_4b55` to `ThrowPath_4c8d` (4 labels) |
| `$4CA8` | 61 | data | `ColorOnlyData_001_4ca8` |
| `$4CE5` | 152 | data | `ThrowPath_4ce5` to `ThrowPath_4d35` (2 labels) |
| `$4D7D` | 64 | data | `BlobThrowData_Left` |
| `$4DBD` | 213 | data | `ThrowPath_4dbd` to `ThrowPath_4e6e` (5 labels) |
| `$4E92` | 140 | data | `ProjectileBounceArc_1` to `ProjectileBounceArc_7` (7 labels) |
| `$4F1E` | 16 | data | `BlobThrowDirections_Left` to `BlobThrowDirections_Right` (2 labels) |
| `$4F2E` | 29 | data | `BlobPathSegments_1` to `BlobPathSegments_3` (3 labels) |
| `$4F4B` | 12 | data | `BlobPath` |
| `$4F57` | 160 | data | `BlobSprites` to `BlobSprites_Throwing` (3 labels) |
| `$4FF7` | 18 | data | `UfoSprites` |
| `$5009` | 12 | data | `UfoHitScores` |
| `$5015` | 16 | data | `UfoPassTable` |
| `$5025` | 15 | code | `ClearFallingPowerups` |
| `$5034` | 171 | code | `SpawnPowerup` |
| `$50DF` | 154 | code | `UpdateFallingPowerups` |
| `$5179` | 91 | code | `CheckPowerupCaught` |
| `$51D4` | 634 | code | `Powerup_Slowball` to `Powerup_Grenade` (18 labels) |
| `$544E` | 2 | code | `PowerupCollected` |
| `$5450` | 24 | code | `PowerupCollected_AddScore` |
| `$5468` | 18 | data | `ShotSprite_Rocket` to `ShotSprite_Laser` (3 labels) |
| `$547A` | 21 | data | `GrenadeText_English_0` |
| `$548F` | 21 | data | `GrenadeText_French_0` |
| `$54A4` | 21 | data | `GrenadeText_German_0` |
| `$54B9` | 21 | data | `GrenadeText_Italian_0` |
| `$54CE` | 21 | data | `GrenadeText_Spanish_0` |
| `$54E3` | 21 | data | `GrenadeText_English_1` |
| `$54F8` | 21 | data | `GrenadeText_French_1` |
| `$550D` | 21 | data | `GrenadeText_German_1` |
| `$5522` | 21 | data | `GrenadeText_Italian_1` |
| `$5537` | 21 | data | `GrenadeText_Spanish_1` |
| `$554C` | 21 | data | `GrenadeText_English_2` |
| `$5561` | 21 | data | `GrenadeText_French_2` |
| `$5576` | 21 | data | `GrenadeText_German_2` |
| `$558B` | 21 | data | `GrenadeText_Italian_2` |
| `$55A0` | 21 | data | `GrenadeText_Spanish_2` |
| `$55B5` | 21 | data | `GrenadeText_English_3` |
| `$55CA` | 21 | data | `GrenadeText_French_3` |
| `$55DF` | 21 | data | `GrenadeText_German_3` |
| `$55F4` | 21 | data | `GrenadeText_Italian_3` |
| `$5609` | 21 | data | `GrenadeText_Spanish_3` |
| `$561E` | 21 | data | `GrenadeText_English_4` |
| `$5633` | 21 | data | `GrenadeText_French_4` |
| `$5648` | 21 | data | `GrenadeText_German_4` |
| `$565D` | 21 | data | `GrenadeText_Italian_4` |
| `$5672` | 21 | data | `GrenadeText_Spanish_4` |
| `$5687` | 21 | data | `GrenadeText_English_5` |
| `$569C` | 21 | data | `GrenadeText_French_5` |
| `$56B1` | 21 | data | `GrenadeText_German_5` |
| `$56C6` | 21 | data | `GrenadeText_Italian_5` |
| `$56DB` | 21 | data | `GrenadeText_Spanish_5` |
| `$56F0` | 21 | data | `GrenadeText_English_6` |
| `$5705` | 21 | data | `GrenadeText_French_6` |
| `$571A` | 21 | data | `GrenadeText_German_6` |
| `$572F` | 21 | data | `GrenadeText_Italian_6` |
| `$5744` | 21 | data | `GrenadeText_Spanish_6` |
| `$5759` | 21 | data | `GrenadeText_English_7` |
| `$576E` | 21 | data | `GrenadeText_French_7` |
| `$5783` | 21 | data | `GrenadeText_German_7` |
| `$5798` | 21 | data | `GrenadeText_Italian_7` |
| `$57AD` | 21 | data | `GrenadeText_Spanish_7` |
| `$57C2` | 80 | data | `GrenadeTexts_English` to `GrenadeTexts_Italian` (5 labels) |
| `$5812` | 44 | data | `GrenadeThrowTable` |
| `$583E` | 23 | data | `TitleLetterPath_1` to `TitleLetterPath_6` (6 labels) |
| `$5855` | 721 | data | `TitleLetterSprites_1` to `TitleLetterSprites_6` (6 labels) |
| `$5B26` | 30 | data | `TitleLetterTileTable` |
| `$5B44` | 35 | data | `TitleLetterAttrTable` |
| `$5B67` | 162 | data | `TitleLetterTiles_5b67` to `TitleLetterTiles_5c00` (18 labels) |
| `$5C09` | 293 | code | `LevelPassword_DrawBonus` to `LevelPassword_VBlank` (3 labels) |
| `$5D2E` | 53 | code | `Firework_Launch` |
| `$5D63` | 72 | code | `UpdateFireworks` |
| `$5DAB` | 138 | code | `UpdateFirework` |
| `$5E35` | 227 | code | `Firework_Fly` |
| `$5F18` | 95 | code | `UpdateTwinkles` |
| `$5F77` | 22 | data | `BatSpeedTable` |
| `$5F8D` | 128 | data | `BatBounceTable` |
| `$600D` | 160 | data | `BatBounceTable_BigBat` |
| `$60AD` | 170 | data | `BatExplosionFrames` |
| `$6157` | 40 | data | `BatExplosionSequence` |
| `$617F` | 128 | data | `BallVelocityTable` |
| `$61FF` | 32 | data | `BallReflectBottomTable` |
| `$621F` | 32 | data | `BallReflectTopTable` |
| `$623F` | 32 | data | `BallReflectRightTable` |
| `$625F` | 32 | data | `BallReflectLeftTable` |
| `$627F` | 15 | code | `ClearBrickBreakEffects` |
| `$628E` | 49 | code | `SpawnBrickBreakEffect` |
| `$62BF` | 42 | code | `FindFreeBrickBreakEffect` |
| `$62E9` | 85 | code | `UpdateBrickBreakEffects` |
| `$633E` | 15 | code | `ClearPickupEffects` |
| `$634D` | 57 | code | `SpawnPickupEffect` |
| `$6386` | 116 | code | `UpdatePickupEffects` |
| `$63FA` | 201 | code | `SweepBricks` to `SweepBricks_Cell` (3 labels) |
| `$64C3` | 17 | code | `ClearUnbreakableHitEffects` |
| `$64D4` | 37 | code | `SpawnUnbreakableHitEffect` |
| `$64F9` | 74 | code | `UpdateUnbreakableHitEffects` |
| `$6543` | 55 | data | `TwinkleInitData` |
| `$657A` | 46 | data | `LevelPasswordFrame_657a` to `LevelPasswordFrame_65a6` (12 labels) |
| `$65A8` | 98 | data | `LevelPasswordFrames` |
| `$660A` | 40 | data | `LevelPasswordCurves` |
| `$6632` | 338 | data | `LevelPasswordCurve_6632` to `LevelPasswordCurve_674d` (6 labels) |
| `$6784` | 41 | data | `LogoSwaySteps` |
| `$67AD` | 71 | data | `FireworkScript_0` to `FireworkScript_2` (3 labels) |
| `$67F4` | 19 | code | `CopyPalettesToHardware` |
| `$6807` | 49 | code | `CopyPaletteBuffer` |
| `$6838` | 153 | code | `FadePalettes` to `FadePalettes_Step` (2 labels) |
| `$68D1` | 12 | code | `FadePalettes2` |
| `$68DD` | 95 | code | `FadePalettes2_Step` |
| `$693C` | 287 | code | `AnimatePalettes` |
| `$6A5B` | 304 | code | `LanguageSelect_Update` to `LanguageSelect_Done` (3 labels) |
| `$6B8B` | 24 | data | `Text_English_HighScorePassword` |
| `$6BA3` | 24 | data | `Text_French_HighScorePassword` |
| `$6BBB` | 24 | data | `Text_German_HighScorePassword` |
| `$6BD3` | 24 | data | `Text_Spanish_HighScorePassword` |
| `$6BEB` | 24 | data | `Text_Italian_HighScorePassword` |
| `$6C03` | 27 | data | `Text_English_LatestScore` |
| `$6C1E` | 27 | data | `Text_French_LatestScore` |
| `$6C39` | 27 | data | `Text_Spanish_LatestScore` |
| `$6C54` | 27 | data | `Text_Italian_LatestScore` |
| `$6C6F` | 27 | data | `Text_German_LatestScore` |
| `$6C8A` | 528 | code | `TitleScreen_VBlank` to `TitleScreen_InitLetters` (4 labels) |
| `$6E9A` | 11 | code | `ClearOamEntries` |
| `$6EA5` | 47 | code | `InitBatSprites` |
| `$6ED4` | 390 | code | `DrawBatSprites` |
| `$705A` | 405 | data | `LanguageTable_Italian` to `LanguageTable_German` (5 labels) |
| `$71EF` | 73 | code | `InitMenuSparkles` |
| `$7238` | 270 | code | `UpdateMenuSparkles` |
| `$7346` | 31 | data | `Text_English_Hud` |
| `$7365` | 31 | data | `Text_French_Hud` |
| `$7384` | 31 | data | `Text_Spanish_Hud` |
| `$73A3` | 31 | data | `Text_German_Hud` |
| `$73C2` | 31 | data | `Text_Italian_Hud` |
| `$73E1` | 25 | data | `Text_English_LevelTitle` |
| `$73FA` | 25 | data | `Text_French_LevelTitle` |
| `$7413` | 25 | data | `Text_Spanish_LevelTitle` |
| `$742C` | 25 | data | `Text_German_LevelTitle` |
| `$7445` | 25 | data | `Text_Italian_LevelTitle` |
| `$745E` | 25 | data | `Text_LevelTitleBlank` |
| `$7477` | 36 | data | `Tilemap_Level_001_7477` to `Tilemap_Level_001_748b` (2 labels) |
| `$749B` | 25 | data | `MenuSlideInSteps` |
| `$74B4` | 66 | data | `MenuSparkleStartData` |
| `$74F6` | 54 | data | `MenuSparkleFrame_74f6` to `MenuSparkleFrame_7526` (9 labels) |
| `$752C` | 22 | data | `MenuSparkleFrames` |
| `$7542` | 80 | data | `BoingLetterSprites` |
| `$7592` | 10 | data | `BoingLetterStartPositions` |
| `$759C` | 19 | data | `MenuSparkleCurve` |
| `$75AF` | 11 | data | `BoingLetterBobSteps` |
| `$75BA` | 10 | data | `MenuSparkleCurveStarts` |
| `$75C4` | 5 | code | `RunStateInit` |
| `$75C9` | 15 | code | `RunStateUpdate` |
| `$75D8` | 1 | code | `CallHL` |
| `$75D9` | 174 | code | `FrameLoop` |
| `$7687` | 11 | code | `SetFrameHandler` |
| `$7692` | 84 | code | `StateUpdate_Gameplay` to `StateUpdate_Ending` (14 labels) |
| `$76E6` | 32 | data | `PowerupHandlers` |
| `$7706` | 32 | data | `PowerupFallSpeeds` |
| `$7726` | 32 | data | `PowerupSprites` |
| `$7746` | 128 | data | `PowerupSprite_Slowball` to `PowerupSprite_Grenade` (16 labels) |
| `$77C6` | 211 | code | `SetUpBricks` to `SetUpBricks_Cell` (3 labels) |
| `$7899` | 183 | code | `HighScores_AdvanceAnim` to `HighScores_SlideSprites` (4 labels) |
| `$7950` | 64 | data | `HighScoreSpriteTiles` |
| `$7990` | 40 | data | `HighScoreSpritePositions` |
| `$79B8` | 38 | data | `HighScoreAnimFrames` to `HighScoreAnimFrames_Second` (2 labels) |
| `$79DE` | 128 | data | `BrickRedrawHandlers` |
| `$7A5E` | 89 | code | `Credits_Update` |
| `$7AB7` | 85 | code | `GBC_Check` |
| `$7B0C` | 36 | data | `BatAndBallStartSprites` |
| `$7B30` | 14 | data | `BatShadowTiles_Normal` to `BatShadowTiles_Wide` (2 labels) |
| `$7B3E` | 24 | data | `BatTiles_Normal` to `BatTiles_Sticky` (3 labels) |
| `$7B56` | 18 | data | `UnbreakableHitEffectFrames` |
| `$7B68` | 28 | data | `BrickBreakEffectFrames` |
| `$7B84` | 6 | data | `PickupEffectFrames` |
| `$7B8A` | 22 | data | `BrickSweepLengths` |
| `$7BA0` | 28 | data | `StateInitHandlers` |
| `$7BBC` | 28 | data | `StateUpdateHandlers` |
| `$7BD8` | 43 | code | `GameOver_Update` |
| `$7C03` | 42 | code | `Pause_Update` |
| `$7C2D` | 12 | code | `ResetScore` |
| `$7C39` | 3 | code | `AddScore` |
| `$7C3C` | 24 | code | `AddScoreBC` |
| `$7C54` | 32 | code | `WaitVBlank` |
| `$7C74` | 30 | code | `Ending_Update` |
| `$7C92` | 22 | code | `DeveloperLogos_Update` |
| `$7CA8` | 2 | code | `ColorOnly_Update` |
| `$7CAA` | 854 | data | `BankFiller_001` |

## Bank $02

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 16 | data | `PasswordAlphabet` |
| `$4010` | 40 | data | `HighScoreScreenDataHeader` |
| `$4038` | 308 | data | `HighScoreScreenData` |
| `$416C` | 2496 | graphics | `HighScoresTextureData` |
| `$4B2C` | 5392 | graphics | `Gfx_Level_002_4b2c` to `Gfx_Level_002_5dec` (4 labels) |
| `$603C` | 3024 | graphics | `Gfx_MainMenu_002_603c` |
| `$6C0C` | 80 | data | `Tilemap_VBlankMenus_002_6c0c` |
| `$6C5C` | 280 | data | `Tilemap_MainMenu_002_6c5c` |
| `$6D74` | 80 | data | `Tilemap_VBlankMenus_002_6d74` |
| `$6DC4` | 280 | data | `Tilemap_MainMenu_002_6dc4` |
| `$6EDC` | 3504 | graphics | `Gfx_MainMenu_002_6edc` |
| `$7C8C` | 884 | data | `Tilemap_DeveloperLogos_002_7c8c` to `Tilemap_DeveloperLogos_002_7df4` (2 labels) |

## Bank $03

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 288 | data | `Tilemap_Level_003_4000` |
| `$4120` | 2304 | data | `BackgroundMap_003_4120` to `BackgroundMap_003_4900` (8 labels) |
| `$4A20` | 2192 | graphics | `Gfx_PublisherLogo_003_4a20` to `Gfx_PublisherLogo_003_5220` (2 labels) |
| `$52B0` | 720 | data | `Tilemap_PublisherLogo_003_52b0` to `Tilemap_PublisherLogo_003_5418` (2 labels) |
| `$5580` | 1968 | graphics | `Gfx_Copyright_003_5580` |
| `$5D30` | 8912 | data | `Tilemap_Copyright_003_5d30` to `Tilemap_Copyright_003_5e98` (2 labels) |

## Bank $04

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 6672 | graphics | `BackgroundTiles_004_4000` |
| `$5A10` | 7984 | data | `BackgroundTiles_004_5a10` to `BackgroundTiles_004_69e0` (2 labels) |
| `$7940` | 1728 | graphics | `BackgroundTiles_004_7940` |

## Bank $05

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 1280 | data | `LevelTable` |
| `$4500` | 960 | data | `LevelHeader_050` to `LevelHeader_123` (160 labels) |
| `$48C0` | 48 | data | `Background_48c0` to `Background_48ea` (8 labels) |
| `$48F0` | 25 | data | `Text_English_GameOver` |
| `$4909` | 25 | data | `Text_French_GameOver` |
| `$4922` | 24 | data | `Text_Spanish_GameOver` |
| `$493A` | 25 | data | `Text_German_GameOver` |
| `$4953` | 25 | data | `Text_Italian_GameOver` |
| `$496C` | 6352 | graphics | `Gfx_GameOver_005_496c` |
| `$623C` | 720 | data | `Tilemap_GameOver_005_623c` to `Tilemap_GameOver_005_63a4` (2 labels) |
| `$650C` | 6900 | graphics | `Gfx_Credits_005_650c` |

## Bank $06

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 221 | code | `UpdateSoundDriver` |
| `$40DD` | 168 | code | `Channel1Effects` |
| `$4185` | 297 | code | `UpdateChannel2` |
| `$42AE` | 168 | code | `Channel2Effects` |
| `$4356` | 213 | code | `UpdateChannel3` |
| `$442B` | 194 | code | `Channel3Effects` |
| `$44ED` | 269 | code | `UpdateChannel4` |
| `$45FA` | 87 | code | `Channel4Effects` |
| `$4651` | 163 | code | `UpdateMutedChannel` |
| `$46F4` | 75 | code | `UpdateWaveAnim` |
| `$473F` | 218 | code | `PlaySong` |
| `$4819` | 98 | code | `PlaySfx` |
| `$487B` | 5 | data | `WaveVolume_Silent` |
| `$4880` | 1 | data | `Pattern_Empty` |
| `$4881` | 144 | data | `NoteFrequencies` |
| `$4911` | 120 | data | `SfxTable` |
| `$4989` | 130 | data | `SongHeader_Silence` to `SongHeader_Credits` (10 labels) |
| `$4A0B` | 256 | data | `PatternPointers` |
| `$4B0B` | 122 | data | `InstrumentPointers` |
| `$4B85` | 44 | data | `NoiseInstrumentPointers` |
| `$4BB1` | 242 | data | `Song_Title_Ch1` to `Song_Title_Ch4` (4 labels) |
| `$4CA3` | 772 | data | `Song_Level1_Ch1` to `Song_Level3_Ch4` (12 labels) |
| `$4FA7` | 98 | data | `Song_MainMenu_Ch1` to `Song_MainMenu_Ch4` (4 labels) |
| `$5009` | 32 | data | `Song_HighScores_Ch2` |
| `$5029` | 10 | data | `Song_GameOver_Ch1` to `Song_GameOver_Ch4` (4 labels) |
| `$5033` | 72 | data | `Song_Ending_Ch1` to `Song_Ending_Ch3` (3 labels) |
| `$507B` | 2 | data | `Order_Unused_507b` |
| `$507D` | 96 | data | `Song_Credits_Ch1` to `Song_Credits_Ch3` (3 labels) |
| `$50DD` | 2 | data | `Order_Silence` |
| `$50DF` | 8 | data | `Song_Silence_Ch1` to `Song_Silence_Ch4` (4 labels) |
| `$50E7` | 3071 | data | `Pattern_00` to `Pattern_7F` (128 labels) |
| `$5CE6` | 8 | data | `Sfx_Unused_5ce6` |
| `$5CEE` | 270 | data | `Sfx_01` to `Sfx_29` (30 labels) |
| `$5DFC` | 5 | data | `Pattern_Unused_5dfc` |
| `$5E01` | 22 | data | `PitchMode_00` to `PitchMode_03` (4 labels) |
| `$5E17` | 5 | data | `Arpeggio_00` |
| `$5E1C` | 6 | data | `PitchSlide_00` |
| `$5E22` | 5 | data | `Table_00` |
| `$5E27` | 81 | data | `PitchSlide_01` to `PitchSlide_05` (5 labels) |
| `$5E78` | 9 | data | `Instrument_00` |
| `$5E81` | 7 | data | `NoiseInstrument_02` |
| `$5E88` | 5 | data | `NoiseShape_00` |
| `$5E8D` | 14 | data | `NoiseInstrument_04` to `NoiseInstrument_03` (2 labels) |
| `$5E9B` | 5 | data | `NoiseShape_01` |
| `$5EA0` | 7 | data | `NoiseInstrument_01` |
| `$5EA7` | 5 | data | `NoiseShape_02` |
| `$5EAC` | 10 | data | `Instrument_02` |
| `$5EB6` | 7 | data | `WaveVolume_00` |
| `$5EBD` | 20 | data | `Instrument_0E` to `Instrument_1F` (2 labels) |
| `$5ED1` | 7 | data | `Arpeggio_01` |
| `$5ED8` | 20 | data | `Instrument_1B` to `Instrument_26` (2 labels) |
| `$5EEC` | 78 | data | `PitchSlide_06` |
| `$5F3A` | 10 | data | `Instrument_1A` |
| `$5F44` | 9 | data | `WaveVolume_01` |
| `$5F4D` | 12 | data | `PitchSlide_07` |
| `$5F59` | 10 | data | `Instrument_17` |
| `$5F63` | 16 | data | `WaveVolume_02` to `WaveVolume_03` (2 labels) |
| `$5F73` | 10 | data | `Instrument_Unused_5f73` |
| `$5F7D` | 28 | data | `WaveVolume_04` to `WaveVolume_07` (4 labels) |
| `$5F99` | 10 | data | `Instrument_27` |
| `$5FA3` | 16 | data | `WaveVolume_08` to `WaveVolume_09` (2 labels) |
| `$5FB3` | 15 | data | `Arpeggio_02` |
| `$5FC2` | 80 | data | `Instrument_07` to `Instrument_12` (8 labels) |
| `$6012` | 60 | data | `Arpeggio_03` to `Arpeggio_10` (8 labels) |
| `$604E` | 9 | data | `Instrument_1C` |
| `$6057` | 41 | data | `Table_01` |
| `$6080` | 9 | data | `PitchSlide_08` |
| `$6089` | 9 | data | `Instrument_04` |
| `$6092` | 22 | data | `Arpeggio_11` to `Arpeggio_12` (2 labels) |
| `$60A8` | 9 | data | `Instrument_28` |
| `$60B1` | 15 | data | `Arpeggio_13` |
| `$60C0` | 9 | data | `Instrument_20` |
| `$60C9` | 9 | data | `Arpeggio_14` |
| `$60D2` | 9 | data | `Instrument_23` |
| `$60DB` | 9 | data | `PitchSlide_09` |
| `$60E4` | 9 | data | `Instrument_22` |
| `$60ED` | 9 | data | `Instrument_Unused_60ed` |
| `$60F6` | 9 | data | `Instrument_25` |
| `$60FF` | 21 | data | `PitchSlide_10` |
| `$6114` | 9 | data | `Instrument_05` |
| `$611D` | 9 | data | `PitchSlide_11` |
| `$6126` | 9 | data | `Arpeggio_15` |
| `$612F` | 9 | data | `Instrument_1E` |
| `$6138` | 12 | data | `PitchSlide_12` |
| `$6144` | 9 | data | `Instrument_06` |
| `$614D` | 7 | data | `Arpeggio_16` |
| `$6154` | 9 | data | `PitchSlide_13` |
| `$615D` | 9 | data | `Instrument_01` |
| `$6166` | 9 | data | `Arpeggio_17` |
| `$616F` | 9 | data | `Instrument_0F` |
| `$6178` | 12 | data | `PitchSlide_14` to `PitchSlide_15` (2 labels) |
| `$6184` | 7 | data | `PitchMode_04` |
| `$618B` | 9 | data | `Instrument_18` |
| `$6194` | 7 | data | `Arpeggio_18` |
| `$619B` | 9 | data | `Instrument_19` |
| `$61A4` | 7 | data | `Arpeggio_19` |
| `$61AB` | 9 | data | `Instrument_03` |
| `$61B4` | 13 | data | `Arpeggio_20` |
| `$61C1` | 9 | data | `Instrument_Unused_61c1` |
| `$61CA` | 7 | data | `Arpeggio_21` |
| `$61D1` | 48 | data | `PitchSlide_16` |
| `$6201` | 23 | data | `WaveVolume_10` to `WaveVolume_12` (3 labels) |
| `$6218` | 9 | data | `Instrument_14` |
| `$6221` | 7 | data | `Arpeggio_22` |
| `$6228` | 19 | data | `Instrument_1D` to `Instrument_15` (2 labels) |
| `$623B` | 7 | data | `WaveVolume_13` |
| `$6242` | 15 | data | `PitchSlide_17` |
| `$6251` | 9 | data | `Instrument_16` |
| `$625A` | 24 | data | `PitchSlide_18` |
| `$6272` | 9 | data | `Instrument_13` |
| `$627B` | 7 | data | `Arpeggio_23` |
| `$6282` | 8 | data | `PitchSlide_19` |
| `$628A` | 9 | data | `Instrument_21` |
| `$6293` | 21 | data | `PitchSlide_20` to `PitchSlide_21` (2 labels) |
| `$62A8` | 9 | data | `Instrument_3C` |
| `$62B1` | 11 | data | `Arpeggio_24` |
| `$62BC` | 9 | data | `Instrument_3B` |
| `$62C5` | 11 | data | `Arpeggio_25` |
| `$62D0` | 12 | data | `PitchSlide_22` |
| `$62DC` | 9 | data | `Instrument_2A` |
| `$62E5` | 9 | data | `PitchSlide_23` |
| `$62EE` | 9 | data | `Arpeggio_26` |
| `$62F7` | 18 | data | `Instrument_2B` to `Instrument_2C` (2 labels) |
| `$6309` | 9 | data | `Arpeggio_27` |
| `$6312` | 9 | data | `PitchSlide_24` |
| `$631B` | 9 | data | `Instrument_2D` |
| `$6324` | 7 | data | `Arpeggio_28` |
| `$632B` | 9 | data | `Instrument_31` |
| `$6334` | 13 | data | `Arpeggio_29` |
| `$6341` | 6 | data | `PitchSlide_25` |
| `$6347` | 9 | data | `Instrument_36` |
| `$6350` | 45 | data | `Arpeggio_30` |
| `$637D` | 12 | data | `PitchSlide_26` |
| `$6389` | 9 | data | `Instrument_37` |
| `$6392` | 9 | data | `PitchSlide_27` |
| `$639B` | 9 | data | `Instrument_38` |
| `$63A4` | 7 | data | `Arpeggio_31` |
| `$63AB` | 24 | data | `PitchSlide_28` |
| `$63C3` | 7 | data | `NoiseInstrument_12` |
| `$63CA` | 7 | data | `NoiseShape_03` |
| `$63D1` | 9 | data | `Instrument_39` |
| `$63DA` | 7 | data | `Arpeggio_32` |
| `$63E1` | 9 | data | `PitchSlide_29` |
| `$63EA` | 9 | data | `Instrument_3A` |
| `$63F3` | 9 | data | `PitchSlide_30` |
| `$63FC` | 9 | data | `Instrument_34` |
| `$6405` | 9 | data | `PitchSlide_31` |
| `$640E` | 9 | data | `Instrument_35` |
| `$6417` | 7 | data | `Arpeggio_33` |
| `$641E` | 9 | data | `Instrument_32` |
| `$6427` | 6 | data | `PitchSlide_32` |
| `$642D` | 7 | data | `Arpeggio_34` |
| `$6434` | 9 | data | `Instrument_33` |
| `$643D` | 9 | data | `Arpeggio_35` |
| `$6446` | 6 | data | `PitchSlide_33` |
| `$644C` | 9 | data | `Instrument_2E` |
| `$6455` | 13 | data | `Arpeggio_36` |
| `$6462` | 9 | data | `Instrument_2F` |
| `$646B` | 15 | data | `Arpeggio_37` |
| `$647A` | 9 | data | `Instrument_30` |
| `$6483` | 9 | data | `PitchSlide_34` |
| `$648C` | 7 | data | `NoiseInstrument_0A` |
| `$6493` | 11 | data | `NoiseShape_04` |
| `$649E` | 7 | data | `NoiseInstrument_14` |
| `$64A5` | 25 | data | `NoiseShape_05` |
| `$64BE` | 7 | data | `NoiseInstrument_0E` |
| `$64C5` | 35 | data | `NoiseShape_06` |
| `$64E8` | 7 | data | `NoiseInstrument_0B` |
| `$64EF` | 9 | data | `NoiseShape_07` |
| `$64F8` | 7 | data | `NoiseInstrument_11` |
| `$64FF` | 61 | data | `NoiseShape_08` |
| `$653C` | 7 | data | `NoiseInstrument_0F` |
| `$6543` | 33 | data | `NoiseShape_09` |
| `$6564` | 7 | data | `NoiseInstrument_13` |
| `$656B` | 9 | data | `NoiseShape_10` |
| `$6574` | 7 | data | `NoiseInstrument_15` |
| `$657B` | 5 | data | `NoiseShape_11` |
| `$6580` | 7 | data | `NoiseInstrument_0C` |
| `$6587` | 29 | data | `NoiseShape_12` |
| `$65A4` | 7 | data | `NoiseInstrument_0D` |
| `$65AB` | 11 | data | `NoiseShape_13` |
| `$65B6` | 7 | data | `NoiseInstrument_10` |
| `$65BD` | 27 | data | `NoiseShape_14` |
| `$65D8` | 9 | data | `Instrument_10` |
| `$65E1` | 7 | data | `NoiseInstrument_00` |
| `$65E8` | 10 | data | `Instrument_11` |
| `$65F2` | 80 | data | `Waveform_0` to `Waveform_4` (5 labels) |
| `$6642` | 105 | data | `WaveAnim_00` to `WaveAnim_01` (2 labels) |
| `$66AB` | 32 | data | `Waveform_5` to `Waveform_6` (2 labels) |
| `$66CB` | 264 | data | `WaveAnim_02` to `WaveAnim_04` (3 labels) |
| `$67D3` | 6189 | data | `LeftoverData_006_67d3` |

## Bank $07

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 7216 | graphics | `Gfx_TitleScreen_007_4000` |
| `$5C30` | 760 | data | `Tilemap_TitleScreen_007_5c30` to `Tilemap_TitleScreen_007_5f14` (4 labels) |
| `$5F28` | 1552 | graphics | `Gfx_TitleScreen_007_5f28` |
| `$6538` | 320 | data | `Gfx_TitleLicensedBy_Spanish` |
| `$6678` | 640 | graphics | `Gfx_TitleLicensedBy_German` to `Gfx_TitleLicensedBy_French` (2 labels) |
| `$68F8` | 5896 | graphics | `Gfx_TitleScreen_007_68f8` |

## Bank $08

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 16384 | data | `BrickLayout_Base` to `BrickLayout_Level123` (161 labels) |

## Bank $09

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 16384 | data | `BrickShineAnimation` |

## Bank $0A

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 16384 | graphics | `BackgroundTiles_00a_4000` to `BackgroundTiles_00a_5f00` (2 labels) |

## Bank $0B

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 15552 | data | `HighScoreAnim_00b_4000` to `HighScoreAnim_00b_7960` (18 labels) |
| `$7CC0` | 108 | data | `Tilemap_HighScores_00b_7cc0` to `Tilemap_HighScores_00b_7cf6` (2 labels) |
| `$7D2C` | 724 | graphics | `Gfx_HighScores_00b_7d2c` |

## Bank $0C

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 864 | data | (no label) |
| `$4360` | 2376 | data | `PowerupMap_Level050` to `PowerupMap_Level123` (160 labels) |
| `$4CA8` | 6 | data | `LevelPasswordScrollSplits` |
| `$4CAE` | 62 | data | `Text_English_LevelPassword` |
| `$4CEC` | 62 | data | `Text_French_LevelPassword` |
| `$4D2A` | 62 | data | `Text_Spanish_LevelPassword` |
| `$4D68` | 62 | data | `Text_German_LevelPassword` |
| `$4DA6` | 62 | data | `Text_Italian_LevelPassword` |
| `$4DE4` | 2096 | graphics | `Gfx_LevelPassword_00c_4de4` |
| `$5614` | 10732 | data | `Tilemap_LevelPassword_00c_5614` to `Tilemap_LevelPassword_00c_577c` (2 labels) |

## Bank $0D

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 2128 | graphics | `Gfx_ColorOnly_00d_4000` to `Gfx_ColorOnly_00d_4800` (2 labels) |
| `$4850` | 360 | data | `Tilemap_ColorOnly_00d_4850` |
| `$49B8` | 1944 | graphics | `Gfx_LanguageSelect_00d_49b8` |
| `$5150` | 11952 | data | `Tilemap_LanguageSelect_00d_5150` |

## Bank $0E

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 14 | data | `Text_Version` |
| `$400E` | 120 | data | `Text_Spanish_StartGame` to `Text_Spanish_SfxOff` (7 labels) |
| `$4086` | 120 | data | `Text_English_StartGame` to `Text_English_SfxOff` (7 labels) |
| `$40FE` | 120 | data | `Text_French_StartGame` to `Text_French_SfxOff` (7 labels) |
| `$4176` | 120 | data | `Text_German_StartGame` to `Text_German_SfxOff` (7 labels) |
| `$41EE` | 122 | data | `Text_Italian_StartGame` to `Text_Italian_SfxOff` (7 labels) |
| `$4268` | 21 | data | `PowerupText_English_MultiBall` |
| `$427D` | 21 | data | `PowerupText_French_MultiBall` |
| `$4292` | 21 | data | `PowerupText_German_MultiBall` |
| `$42A7` | 21 | data | `PowerupText_Italian_MultiBall` |
| `$42BC` | 21 | data | `PowerupText_Spanish_MultiBall` |
| `$42D1` | 21 | data | `PowerupText_English_SlowBall` |
| `$42E6` | 21 | data | `PowerupText_French_SlowBall` |
| `$42FB` | 21 | data | `PowerupText_German_SlowBall` |
| `$4310` | 21 | data | `PowerupText_Italian_SlowBall` |
| `$4325` | 21 | data | `PowerupText_Spanish_SlowBall` |
| `$433A` | 21 | data | `PowerupText_English_AntigravityBall` |
| `$434F` | 21 | data | `PowerupText_French_AntigravityBall` |
| `$4364` | 21 | data | `PowerupText_German_AntigravityBall` |
| `$4379` | 21 | data | `PowerupText_Italian_AntigravityBall` |
| `$438E` | 21 | data | `PowerupText_Spanish_AntigravityBall` |
| `$43A3` | 21 | data | `PowerupText_English_SleepyBall` |
| `$43B8` | 21 | data | `PowerupText_French_SleepyBall` |
| `$43CD` | 21 | data | `PowerupText_German_SleepyBall` |
| `$43E2` | 21 | data | `PowerupText_Italian_SleepyBall` |
| `$43F7` | 21 | data | `PowerupText_Spanish_SleepyBall` |
| `$440C` | 21 | data | `PowerupText_English_RocketBat` |
| `$4421` | 21 | data | `PowerupText_French_RocketBat` |
| `$4436` | 21 | data | `PowerupText_German_RocketBat` |
| `$444B` | 21 | data | `PowerupText_Italian_RocketBat` |
| `$4460` | 21 | data | `PowerupText_Spanish_RocketBat` |
| `$4475` | 21 | data | `PowerupText_English_PlasmaBat` |
| `$448A` | 21 | data | `PowerupText_French_PlasmaBat` |
| `$449F` | 21 | data | `PowerupText_German_PlasmaBat` |
| `$44B4` | 21 | data | `PowerupText_Italian_PlasmaBat` |
| `$44C9` | 21 | data | `PowerupText_Spanish_PlasmaBat` |
| `$44DE` | 21 | data | `PowerupText_English_BigBat` |
| `$44F3` | 21 | data | `PowerupText_French_BigBat` |
| `$4508` | 21 | data | `PowerupText_German_BigBat` |
| `$451D` | 21 | data | `PowerupText_Italian_BigBat` |
| `$4532` | 21 | data | `PowerupText_Spanish_BigBat` |
| `$4547` | 21 | data | `PowerupText_English_StunBat` |
| `$455C` | 21 | data | `PowerupText_French_StunBat` |
| `$4571` | 21 | data | `PowerupText_German_StunBat` |
| `$4586` | 21 | data | `PowerupText_Italian_StunBat` |
| `$459B` | 21 | data | `PowerupText_Spanish_StunBat` |
| `$45B0` | 21 | data | `PowerupText_English_MagneticBat` |
| `$45C5` | 21 | data | `PowerupText_French_MagneticBat` |
| `$45DA` | 21 | data | `PowerupText_German_MagneticBat` |
| `$45EF` | 21 | data | `PowerupText_Italian_MagneticBat` |
| `$4604` | 21 | data | `PowerupText_Spanish_MagneticBat` |
| `$4619` | 21 | data | `PowerupText_English_ExtraLife` |
| `$462E` | 21 | data | `PowerupText_French_ExtraLife` |
| `$4643` | 21 | data | `PowerupText_German_ExtraLife` |
| `$4658` | 21 | data | `PowerupText_Italian_ExtraLife` |
| `$466D` | 21 | data | `PowerupText_Spanish_ExtraLife` |
| `$4682` | 21 | data | `PowerupText_English_LazerBat` |
| `$4697` | 21 | data | `PowerupText_French_LazerBat` |
| `$46AC` | 21 | data | `PowerupText_German_LazerBat` |
| `$46C1` | 21 | data | `PowerupText_Italian_LazerBat` |
| `$46D6` | 21 | data | `PowerupText_Spanish_LazerBat` |
| `$46EB` | 21 | data | `PowerupText_English_ReverseBat` |
| `$4700` | 21 | data | `PowerupText_French_ReverseBat` |
| `$4715` | 21 | data | `PowerupText_German_ReverseBat` |
| `$472A` | 21 | data | `PowerupText_Italian_ReverseBat` |
| `$473F` | 21 | data | `PowerupText_Spanish_ReverseBat` |
| `$4754` | 21 | data | `PowerupText_English_GhostUp` |
| `$4769` | 21 | data | `PowerupText_French_GhostUp` |
| `$477E` | 21 | data | `PowerupText_German_GhostUp` |
| `$4793` | 21 | data | `PowerupText_Italian_GhostUp` |
| `$47A8` | 21 | data | `PowerupText_Spanish_GhostUp` |
| `$47BD` | 21 | data | `PowerupText_English_GrenadeBat` |
| `$47D2` | 21 | data | `PowerupText_French_GrenadeBat` |
| `$47E7` | 21 | data | `PowerupText_German_GrenadeBat` |
| `$47FC` | 21 | data | `PowerupText_Italian_GrenadeBat` |
| `$4811` | 21 | data | `PowerupText_Spanish_GrenadeBat` |
| `$4826` | 21 | data | `PowerupText_English_NinjaUp` |
| `$483B` | 21 | data | `PowerupText_French_NinjaUp` |
| `$4850` | 21 | data | `PowerupText_German_NinjaUp` |
| `$4865` | 21 | data | `PowerupText_Italian_NinjaUp` |
| `$487A` | 21 | data | `PowerupText_Spanish_NinjaUp` |
| `$488F` | 10 | data | `Text_English_Pause` |
| `$4899` | 10 | data | `Text_French_Pause` |
| `$48A3` | 10 | data | `Text_Spanish_Pause` |
| `$48AD` | 10 | data | `Text_German_Pause` |
| `$48B7` | 10 | data | `Text_Italian_Pause` |
| `$48C1` | 6352 | graphics | `Gfx_Pause_00e_48c1` |
| `$6191` | 720 | data | `Tilemap_Pause_00e_6191` to `Tilemap_Pause_00e_62f9` (2 labels) |
| `$6461` | 150 | data | `Text_English_Ending` |
| `$64F7` | 150 | data | `Text_French_Ending` |
| `$658D` | 150 | data | `Text_German_Ending` |
| `$6623` | 150 | data | `Text_Italian_Ending` |
| `$66B9` | 150 | data | `Text_Spanish_Ending` |
| `$674F` | 5584 | graphics | `Gfx_Ending_00e_674f` |
| `$7D1F` | 737 | data | `Tilemap_Ending_00e_7d1f` to `Tilemap_Ending_00e_7e87` (2 labels) |

## Bank $0F

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 256 | code | `SetUpRasterEffect` to `SetUpRasterEffect_Mode3` (2 labels) |
| `$4100` | 46 | code | `Raster_CopyBytes` to `Raster_FillByteColumn` (5 labels) |
| `$412E` | 230 | code | `RasterHandler_Mode1` to `RasterHandler_Mode3` (3 labels) |
| `$4214` | 144 | data | `RasterNextLines` |
| `$42A4` | 288 | data | `RasterColours_Mode3` |
| `$43C4` | 1728 | data | `RasterColours_Mode2_3` to `RasterColours_Mode4_3` (6 labels) |
| `$4A84` | 13692 | data | `Credits_English` to `Credits_Spanish` (5 labels) |

## Bank $10

| Address | Bytes | Kind | Labels |
|---|---|---|---|
| `$4000` | 374 | data | (no label) |
| `$4176` | 16010 | data | `IsThisTheOne` |

## Bank $11

No labels. 16384 bytes of unlabelled data.

## Bank $12

No labels. 16384 bytes of unlabelled data.

## Bank $13

No labels. 16384 bytes of unlabelled data.

## Bank $14

No labels. 16384 bytes of unlabelled data.

## Bank $15

No labels. 16384 bytes of unlabelled data.

## Bank $16

No labels. 16384 bytes of unlabelled data.

## Bank $17

No labels. 16384 bytes of unlabelled data.

## Bank $18

No labels. 16384 bytes of unlabelled data.

## Bank $19

No labels. 16384 bytes of unlabelled data.

## Bank $1A

No labels. 16384 bytes of unlabelled data.

## Bank $1B

No labels. 16384 bytes of unlabelled data.

## Bank $1C

No labels. 16384 bytes of unlabelled data.

## Bank $1D

No labels. 16384 bytes of unlabelled data.

## Bank $1E

No labels. 16384 bytes of unlabelled data.

## Bank $1F

No labels. 16384 bytes of unlabelled data.

## Bank $20

No labels. 16368 bytes of unlabelled data.

Banks that are not listed have no content in the sources and are filled with zeros.

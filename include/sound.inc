; Names for the numbers that bank 0 and bank 1 pass to the sound driver, and for the notes and
; instruments in the pattern rows of bank 6. See "Music and sound driver" in docs/RESEARCH.md.

; Songs, the argument of StartSong and PlayMusic (register E).
DEF SONG_SILENCE      EQU 0
DEF SONG_TITLE        EQU 1
DEF SONG_LEVEL_1      EQU 2
DEF SONG_LEVEL_2      EQU 3
DEF SONG_LEVEL_3      EQU 4
DEF SONG_MAIN_MENU    EQU 5
DEF SONG_HIGH_SCORES  EQU 6
DEF SONG_GAME_OVER    EQU 7
DEF SONG_ENDING       EQU 8
DEF SONG_CREDITS      EQU 9

; Sound effects, the argument of PlaySound (register A). The comments say where the game plays them.
DEF SFX_SILENCE            EQU 0  ; ProgramStart, FrameLoop and after a lost life. Cuts off every other effect
DEF SFX_BAT_BOUNCE         EQU 1  ; the ball hits the bat
DEF SFX_BRICK_HIT          EQU 2  ; a brick is hit
DEF SFX_BRICK_BROKEN       EQU 3  ; a brick breaks
DEF SFX_WALL_BOUNCE        EQU 4  ; the ball or a projectile hits a wall or an unbreakable brick
DEF SFX_POWERUP_SPAWN      EQU 5  ; a brick drops a power-up
DEF SFX_BALL_STICKS        EQU 6  ; the sticky bat catches the ball
DEF SFX_BALL_LAUNCH        EQU 7  ; the ball leaves the bat (A button)
DEF SFX_POWERUP_COLLECTED  EQU 8  ; a power-up is caught
DEF SFX_BLOB_BALL_BOUNCE   EQU 9  ; a projectile thrown by the blob lands on an unbreakable brick
DEF SFX_BAT_DESTROYED      EQU 10 ; the bat is destroyed, by a lost ball or by a UFO bomb
DEF SFX_GRENADE_BLAST      EQU 11 ; a grenade lands and explodes
DEF SFX_GRENADE_BOUNCE     EQU 12 ; a grenade lands on an unbreakable brick
DEF SFX_BLOB_CATCH         EQU 13 ; the blob catches the ball
DEF SFX_BLOB_THROW         EQU 14 ; the blob throws the ball back
DEF SFX_BAT_STUNNED        EQU 15 ; while the bat is stunned (Poison), when the stun timer is a multiple of 8
DEF SFX_GRENADE_THROW      EQU 16 ; a grenade is thrown
DEF SFX_PLASMA_SHOT        EQU 17 ; Plasma is fired
DEF SFX_ROCKET_SHOT        EQU 18 ; a rocket is fired (Rocket bat)
DEF SFX_LASER_SHOT         EQU 19 ; a laser is fired (Laser bat)
DEF SFX_UFO_BOMB           EQU 20 ; the UFO drops a bomb
DEF SFX_UFO_HIT            EQU 21 ; the ball or a shot hits the UFO
DEF SFX_BALL_WAKES_UP      EQU 22 ; the Clock effect on the ball ends
DEF SFX_ANTIGRAVITY_END    EQU 23 ; Antigravity ends
DEF SFX_GHOST_END          EQU 24 ; Ghost ends
DEF SFX_MENU_MOVE          EQU 25 ; a menu cursor or value changes
DEF SFX_MENU_SELECT        EQU 26 ; a menu choice or a screen is confirmed
DEF SFX_FIREWORK_SPARK     EQU 27 ; a firework spark
DEF SFX_FIREWORK_BURST     EQU 28 ; a firework rocket bursts
DEF SFX_29                 EQU 29 ; nothing plays it

; Notes. Note 0 is C2 at 65.4 Hz and every step is one semitone, 72 notes up to B7 (3951 Hz).
; The names use scientific pitch notation: C4 is middle C at 261.6 Hz and A4 is 440 Hz.
; NoteFrequencies in bank 6 holds the NR13/NR14 value of each note. The pitches follow equal
; temperament within about 5 cents up to B5. Above that the register steps are coarse and the
; pitch is off by up to about 25 cents. An s means sharp: NOTE_Cs2 is C sharp in octave 2.
; With a waveform of one cycle, the wave channel sounds one octave lower than a pulse channel.
DEF NOTE_C2   EQU 0
DEF NOTE_Cs2  EQU 1
DEF NOTE_D2   EQU 2
DEF NOTE_Ds2  EQU 3
DEF NOTE_E2   EQU 4
DEF NOTE_F2   EQU 5
DEF NOTE_Fs2  EQU 6
DEF NOTE_G2   EQU 7
DEF NOTE_Gs2  EQU 8
DEF NOTE_A2   EQU 9
DEF NOTE_As2  EQU 10
DEF NOTE_B2   EQU 11
DEF NOTE_C3   EQU 12
DEF NOTE_Cs3  EQU 13
DEF NOTE_D3   EQU 14
DEF NOTE_Ds3  EQU 15
DEF NOTE_E3   EQU 16
DEF NOTE_F3   EQU 17
DEF NOTE_Fs3  EQU 18
DEF NOTE_G3   EQU 19
DEF NOTE_Gs3  EQU 20
DEF NOTE_A3   EQU 21
DEF NOTE_As3  EQU 22
DEF NOTE_B3   EQU 23
DEF NOTE_C4   EQU 24
DEF NOTE_Cs4  EQU 25
DEF NOTE_D4   EQU 26
DEF NOTE_Ds4  EQU 27
DEF NOTE_E4   EQU 28
DEF NOTE_F4   EQU 29
DEF NOTE_Fs4  EQU 30
DEF NOTE_G4   EQU 31
DEF NOTE_Gs4  EQU 32
DEF NOTE_A4   EQU 33
DEF NOTE_As4  EQU 34
DEF NOTE_B4   EQU 35
DEF NOTE_C5   EQU 36
DEF NOTE_Cs5  EQU 37
DEF NOTE_D5   EQU 38
DEF NOTE_Ds5  EQU 39
DEF NOTE_E5   EQU 40
DEF NOTE_F5   EQU 41
DEF NOTE_Fs5  EQU 42
DEF NOTE_G5   EQU 43
DEF NOTE_Gs5  EQU 44
DEF NOTE_A5   EQU 45
DEF NOTE_As5  EQU 46
DEF NOTE_B5   EQU 47
DEF NOTE_C6   EQU 48
DEF NOTE_Cs6  EQU 49
DEF NOTE_D6   EQU 50
DEF NOTE_Ds6  EQU 51
DEF NOTE_E6   EQU 52
DEF NOTE_F6   EQU 53
DEF NOTE_Fs6  EQU 54
DEF NOTE_G6   EQU 55
DEF NOTE_Gs6  EQU 56
DEF NOTE_A6   EQU 57
DEF NOTE_As6  EQU 58
DEF NOTE_B6   EQU 59
DEF NOTE_C7   EQU 60
DEF NOTE_Cs7  EQU 61
DEF NOTE_D7   EQU 62
DEF NOTE_Ds7  EQU 63
DEF NOTE_E7   EQU 64
DEF NOTE_F7   EQU 65
DEF NOTE_Fs7  EQU 66
DEF NOTE_G7   EQU 67
DEF NOTE_Gs7  EQU 68
DEF NOTE_A7   EQU 69
DEF NOTE_As7  EQU 70
DEF NOTE_B7   EQU 71

; Pulse and wave instruments, the index into InstrumentPointers. Instruments 36 and 41 ($24 and $29)
; point to the same data as 34 and 14 ($22 and $0E). Instruments that only one sound effect uses
; are named after it.
DEF INSTR_00                         EQU $00
DEF INSTR_01                         EQU $01
DEF INSTR_02                         EQU $02
DEF INSTR_03                         EQU $03
DEF INSTR_04                         EQU $04
DEF INSTR_05                         EQU $05
DEF INSTR_PULSE_SNARE                EQU $06
DEF INSTR_07                         EQU $07
DEF INSTR_08                         EQU $08
DEF INSTR_09                         EQU $09
DEF INSTR_0A                         EQU $0A
DEF INSTR_0B                         EQU $0B
DEF INSTR_0C                         EQU $0C
DEF INSTR_0D                         EQU $0D
DEF INSTR_0E                         EQU $0E
DEF INSTR_0F                         EQU $0F
DEF INSTR_SILENT                     EQU $10
DEF INSTR_WAVE_SILENT                EQU $11
DEF INSTR_12                         EQU $12
DEF INSTR_13                         EQU $13
DEF INSTR_14                         EQU $14
DEF INSTR_15                         EQU $15
DEF INSTR_16                         EQU $16
DEF INSTR_17                         EQU $17
DEF INSTR_18                         EQU $18
DEF INSTR_19                         EQU $19
DEF INSTR_1A                         EQU $1A
DEF INSTR_1B                         EQU $1B
DEF INSTR_1C                         EQU $1C
DEF INSTR_1D                         EQU $1D
DEF INSTR_PULSE_KICK                 EQU $1E
DEF INSTR_1F                         EQU $1F
DEF INSTR_20                         EQU $20
DEF INSTR_21                         EQU $21
DEF INSTR_22                         EQU $22
DEF INSTR_23                         EQU $23
DEF INSTR_24                         EQU $24 ; Same data as INSTR_22
DEF INSTR_25                         EQU $25
DEF INSTR_26                         EQU $26
DEF INSTR_27                         EQU $27
DEF INSTR_28                         EQU $28
DEF INSTR_29                         EQU $29 ; Same data as INSTR_0E
DEF INSTR_SFX_BAT_BOUNCE             EQU $2A
DEF INSTR_SFX_BRICK_HIT              EQU $2B
DEF INSTR_SFX_BRICK_BROKEN           EQU $2C
DEF INSTR_SFX_WALL_BOUNCE            EQU $2D
DEF INSTR_SFX_POWERUP_SPAWN          EQU $2E
DEF INSTR_SFX_BALL_STICKS            EQU $2F
DEF INSTR_SFX_BALL_LAUNCH            EQU $30
DEF INSTR_SFX_POWERUP_COLLECTED      EQU $31
DEF INSTR_SFX_BLOB_BALL_BOUNCE       EQU $32
DEF INSTR_SFX_GRENADE_BOUNCE         EQU $33
DEF INSTR_SFX_BAT_STUNNED            EQU $34
DEF INSTR_SFX_BALL_WAKES_UP          EQU $35
DEF INSTR_SFX_GRENADE_THROW          EQU $36
DEF INSTR_SFX_UFO_HIT                EQU $37
DEF INSTR_SFX_LASER_SHOT             EQU $38
DEF INSTR_SFX_ANTIGRAVITY_END        EQU $39
DEF INSTR_SFX_GHOST_END              EQU $3A
DEF INSTR_SFX_MENU_SELECT            EQU $3B
DEF INSTR_3C                         EQU $3C

; Noise instruments, the index into NoiseInstrumentPointers. Instruments 5 to 9 are the silent instrument too.
DEF NOISE_INSTR_SILENT               EQU $00
DEF NOISE_INSTR_SNARE                EQU $01
DEF NOISE_INSTR_KICK                 EQU $02
DEF NOISE_INSTR_03                   EQU $03
DEF NOISE_INSTR_04                   EQU $04
DEF NOISE_INSTR_05                   EQU $05 ; Same data as NOISE_INSTR_SILENT
DEF NOISE_INSTR_06                   EQU $06 ; Same data as NOISE_INSTR_SILENT
DEF NOISE_INSTR_07                   EQU $07 ; Same data as NOISE_INSTR_SILENT
DEF NOISE_INSTR_08                   EQU $08 ; Same data as NOISE_INSTR_SILENT
DEF NOISE_INSTR_09                   EQU $09 ; Same data as NOISE_INSTR_SILENT
DEF NOISE_INSTR_0A                   EQU $0A
DEF NOISE_INSTR_SFX_GRENADE_BLAST    EQU $0B
DEF NOISE_INSTR_SFX_BLOB_CATCH       EQU $0C
DEF NOISE_INSTR_SFX_BAT_DESTROYED    EQU $0D
DEF NOISE_INSTR_SFX_BLOB_THROW       EQU $0E
DEF NOISE_INSTR_SFX_PLASMA_SHOT      EQU $0F
DEF NOISE_INSTR_SFX_ROCKET_SHOT      EQU $10
DEF NOISE_INSTR_SFX_UFO_BOMB         EQU $11
DEF NOISE_INSTR_SFX_FIREWORK_BURST   EQU $12
DEF NOISE_INSTR_SFX_MENU_MOVE        EQU $13
DEF NOISE_INSTR_SFX_FIREWORK_SPARK   EQU $14
DEF NOISE_INSTR_15                   EQU $15

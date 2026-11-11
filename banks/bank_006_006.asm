; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

; The music and sound driver. See "Music and sound driver" in docs/RESEARCH.md.
; Bank 0 calls three routines: UpdateSoundDriver once per frame, PlaySong and PlaySfx.

; Bytes with a special meaning in pattern and sound effect data.
DEF PATTERN_END   EQU $00 ; In place of a row length: the pattern ends
DEF PATTERN_JUMP  EQU $ff ; In place of a row length: a pointer to an order list follows
DEF ROW_HOLD      EQU $ff ; In place of a note: nothing changes
DEF ROW_RELEASE   EQU $fe ; In place of a note: the note is released
DEF ROW_RETRIGGER EQU $fd ; In place of a note: the note starts again
DEF SFX_END       EQU $00 ; In place of a row length: two more bytes follow. The sound effect ends if the second is 0
DEF TABLE_END     EQU $00 ; In place of a step length in an instrument table: a pointer to the next step follows

; Run the driver for one frame. The parts run in a fixed order and fall into each other:
; channel 1, channel 2, channel 3, channel 4, the muted channel and the wave animation.
; Each channel part first counts down the current row. When the row is over it reads the next row.
; Otherwise it jumps to the effects part, which steps the instrument tables and writes the registers.
;
; Channel 1 (pulse): read the next row when the current one is over.
UpdateSoundDriver:
    ld hl, wCh1Tick
    dec [hl]
    jr z, .newTick

    jp Channel1Effects

.newTick:
    ld a, [wSongTempo]
    ld [hl], a
    inc l
    dec [hl]
    jr z, .nextRow

    jp Channel1Effects

    ; Read the next row of the pattern.
.nextRow:
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    ld a, [de]
    cp $ff
    jr nz, .notJump

    inc l
    inc de
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld d, a
    ld a, b
    ld e, a
    jr .readOrder

.notJump:
    cp $00
    jr nz, .readRow

    ld hl, wCh1OrderPtr
    ld e, [hl]
    inc l
    ld d, [hl]
    dec l
    dec l

    ; Read an order list entry: transpose, pattern number.
.readOrder:
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, PatternPointers
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, wCh1PatternPtr + 1

    ; A = length of the row in row steps. The next byte is a command or a note.
.readRow:
    dec l
    dec l
    ld [hl+], a
    inc de
    ld a, [de]
    cp $ff
    jr nz, .notHold

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Channel1Effects

.notHold:
    cp $fe
    jr nz, .notRelease

    ld a, [wCh1ReleaseEnvelope]
    ldh [rNR12], a
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld a, $80
    ldh [rNR14], a
    jp Channel1Effects

.notRelease:
    cp $fd
    jr nz, .note

    ld a, $01
    ld [wCh1Trigger], a
    ld a, [wCh1Envelope]
    ldh [rNR12], a
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Channel1Effects

    ; A note: note number, instrument number. Load the instrument.
.note:
    inc de
    ld b, a
    ld a, [wCh1Transpose]
    add b
    ld [wCh1Note], a
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, InstrumentPointers
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld [wCh1Duty], a
    inc de
    ld a, [de]
    ld [wCh1Envelope], a
    inc de
    ld a, [de]
    ld [wCh1ReleaseEnvelope], a
    inc de
    ld hl, wCh1PitchOffset
    xor a
    ld [hl+], a
    ld [hl], a
    inc a
    ld [wCh1Trigger], a
    ld [wCh1SlideCount], a
    ld [wCh1ArpCount], a
    ld [wCh1ModeCount], a
    ld hl, wCh1ArpPtr
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, wCh1SlidePtr
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, wCh1ModePtr
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    jp UpdateChannel2

; Channel 1 between rows: restart the note if asked, then step the pitch slide, arpeggio and
; pitch mode tables and write the frequency.
Channel1Effects:
    ld hl, wCh1Trigger
    ld a, [hl]
    cp $00
    jr z, .noTrigger

    xor a
    ld [hl], a
    ld a, [wCh1Envelope]
    ldh [rNR12], a
    ld a, $80
    ldh [rNR14], a

.noTrigger:
    inc l
    ld a, [hl+]
    ldh [rNR11], a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, .slideKept

    inc hl
    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .slideKept

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

.slideKept:
    ld [de], a
    ld a, l
    ld d, h
    ld b, [hl]
    inc hl
    ld e, [hl]
    ld hl, wCh1SlidePtr
    ld [hl+], a
    ld [hl], d
    inc l
    ld a, b
    add [hl]
    ld [hl+], a
    ld a, e
    adc [hl]
    ld [hl+], a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, .arpKept

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .arpKept

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

.arpKept:
    ld [de], a
    ld a, l
    ld d, h
    ld c, [hl]
    ld hl, wCh1ArpPtr
    ld [hl+], a
    ld [hl], d
    inc l
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, .modeKept

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .modeKept

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

.modeKept:
    ld [de], a
    ld a, l
    ld d, h
    ld e, [hl]
    ld hl, wCh1ModePtr
    ld [hl+], a
    ld [hl], d
    inc l
    ld b, e
    ld a, b
    cp $00
    jr nz, .fromNote

    ld d, $00
    ld e, d
    jr .addSlide

    ; Mode 1 or 2: take the frequency of note + arpeggio from the table.
.fromNote:
    ld a, [hl]
    add c
    ld e, a
    ld d, $00
    ld hl, NoteFrequencies
    add hl, de
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, b
    cp $02
    jr nz, .writeFreq

    ; Mode 0 or 2: add the pitch offset.
.addSlide:
    ld hl, wCh1PitchOffset
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl]
    adc d
    ld d, a

.writeFreq:
    ld a, d
    and $07
    ldh [rNR14], a
    ld a, e
    ldh [rNR13], a

; Channel 2 (pulse). Like channel 1, but a sound effect can take the channel over.
; Then the rows come from wSfxPtr, one row step is 4 frames and notes are not transposed.
UpdateChannel2:
    ld a, [wSfxChannel]
    cp LOW(wCh2Tick)
    jr nz, .music

    ld hl, wSfxTick
    dec [hl]
    jr z, .sfxTick

    inc l
    jp Channel2Effects

.sfxTick:
    ld a, $04
    jr .newTick

.music:
    ld hl, wCh2Tick
    dec [hl]
    jr z, .musicTick

    inc l
    jp Channel2Effects

.musicTick:
    ld a, [wSongTempo]

.newTick:
    ld [hl], a
    inc l
    dec [hl]
    jr z, .nextRow

    jp Channel2Effects

    ; Read the next row of the pattern or of the sound effect.
.nextRow:
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    ld a, [de]
    cp $ff
    jr nz, .notJump

    inc l
    inc de
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld d, a
    ld a, b
    ld e, a
    jp .readOrder

.notJump:
    cp $00
    jr nz, .readRow

    ld a, [wSfxChannel]
    cp LOW(wCh2Tick)
    jr nz, .nextOrder

    inc de
    inc de
    ld a, [de]
    cp $00
    jr z, .sfxEnd

    ld hl, wSfxPtr + 1
    ld [hl-], a
    ld c, a
    dec de
    ld a, [de]
    ld [hl-], a
    ld e, a
    ld d, c
    ld a, [de]
    jr .storeRows

    ; The sound effect is over. UpdateWaveAnim gives the channel back.
.sfxEnd:
    ld a, $ff
    ld [wSfxDone], a
    ld a, $01
    ld [wCh2Envelope], a
    ld [wCh2ReleaseEnvelope], a
    jp Channel2Effects

.nextOrder:
    inc l
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    dec l
    dec l

    ; Read an order list entry: transpose, pattern number.
.readOrder:
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, PatternPointers
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, wCh2PatternPtr + 1

.readRow:
    dec l
    dec l

.storeRows:
    ld [hl+], a
    inc de
    ld a, [de]
    cp $ff
    jr nz, .notHold

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Channel2Effects

.notHold:
    cp $fe
    jr nz, .notRelease

    ld a, [wCh2ReleaseEnvelope]
    ldh [rNR22], a
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld a, $80
    ldh [rNR24], a
    jp Channel2Effects

.notRelease:
    cp $fd
    jr nz, .note

    ld a, $01
    ld [wCh2Trigger], a
    ld a, [wCh2Envelope]
    ldh [rNR22], a
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Channel2Effects

    ; A note: note number, instrument number. Load the instrument.
.note:
    inc de
    ld b, a
    ld a, [wSfxChannel]
    cp LOW(wCh2Tick)
    jr nz, .musicTranspose

    xor a
    jp .gotTranspose

.musicTranspose:
    ld a, [wCh2Transpose]

.gotTranspose:
    add b
    ld [wCh2Note], a
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, InstrumentPointers
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld [wCh2Duty], a
    inc de
    ld a, [de]
    ld [wCh2Envelope], a
    inc de
    ld a, [de]
    ld [wCh2ReleaseEnvelope], a
    inc de
    ld hl, wCh2PitchOffset
    xor a
    ld [hl+], a
    ld [hl], a
    inc a
    ld [wCh2SlideCount], a
    ld [wCh2ArpCount], a
    ld [wCh2ModeCount], a
    ld [wCh2Trigger], a
    ld hl, wCh2ArpPtr
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, wCh2SlidePtr
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, wCh2ModePtr
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    jp UpdateChannel3

; Channel 2 between rows. Same as Channel1Effects.
Channel2Effects:
    ld hl, wCh2Trigger
    ld a, [hl]
    cp $00
    jr z, .noTrigger

    xor a
    ld [hl], a
    ld a, [wCh2Envelope]
    ldh [rNR22], a
    ld a, $80
    ldh [rNR24], a

.noTrigger:
    inc l
    ld a, [hl+]
    ldh [rNR21], a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, .slideKept

    inc hl
    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .slideKept

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

.slideKept:
    ld [de], a
    ld a, l
    ld d, h
    ld b, [hl]
    inc hl
    ld c, [hl]
    ld hl, wCh2SlidePtr
    ld [hl+], a
    ld [hl], d
    inc l
    ld a, b
    add [hl]
    ld [hl+], a
    ld a, c
    adc [hl]
    ld [hl+], a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, .arpKept

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .arpKept

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

.arpKept:
    ld [de], a
    ld a, l
    ld d, h
    ld c, [hl]
    ld hl, wCh2ArpPtr
    ld [hl+], a
    ld [hl], d
    inc l
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, .modeKept

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .modeKept

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

.modeKept:
    ld [de], a
    ld a, l
    ld d, h
    ld e, [hl]
    ld hl, wCh2ModePtr
    ld [hl+], a
    ld [hl], d
    inc l
    ld b, e
    ld a, b
    cp $00
    jr nz, .fromNote

    ld d, $00
    ld e, d
    jr .addSlide

    ; Mode 1 or 2: take the frequency of note + arpeggio from the table.
.fromNote:
    ld a, [hl]
    add c
    ld e, a
    ld d, $00
    ld hl, NoteFrequencies
    add hl, de
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, b
    cp $02
    jr nz, .writeFreq

    ; Mode 0 or 2: add the pitch offset.
.addSlide:
    ld hl, wCh2PitchOffset
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl]
    adc d
    ld d, a

.writeFreq:
    ld a, d
    and $07
    ldh [rNR24], a
    ld a, e
    ldh [rNR23], a

; Channel 3 (wave): read the next row when the current one is over.
UpdateChannel3:
    ld hl, wCh3Tick
    dec [hl]
    jr z, .newTick

    jp Channel3Effects

.newTick:
    ld a, [wSongTempo]
    ld [hl], a
    inc l
    dec [hl]
    jr z, .nextRow

    jp Channel3Effects

    ; Read the next row of the pattern.
.nextRow:
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    ld a, [de]
    cp $ff
    jr nz, .notJump

    inc l
    inc de
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld d, a
    ld a, b
    ld e, a
    jp .readOrder

.notJump:
    cp $00
    jr nz, .readRow

    ld hl, wCh3OrderPtr
    ld e, [hl]
    inc l
    ld d, [hl]
    dec l
    dec l

    ; Read an order list entry: transpose, pattern number.
.readOrder:
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, PatternPointers
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, wCh3PatternPtr + 1

.readRow:
    dec l
    dec l
    ld [hl+], a
    inc de
    ld a, [de]
    cp $ff
    jr nz, .notHold

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Channel3Effects

.notHold:
    cp $fe
    jr nz, .note

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld a, $01
    ld [wCh3VolumeCount], a
    ld hl, wCh3VolumePtr
    ld de, wCh3ReleaseVolumePtr
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Channel3Effects

    ; A note: note number, instrument number. Load the instrument.
.note:
    inc de
    ld b, a
    ld a, [wCh3Transpose]
    add b
    ld [wCh3Note], a
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, InstrumentPointers
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, $01
    ld [wCh3VolumeCount], a
    ld hl, wCh3VolumePtr
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld hl, wCh3PitchOffset
    xor a
    ld [hl+], a
    ld [hl], a
    inc a
    ld [wCh3SlideCount], a
    ld [wCh3ArpCount], a
    ld [wCh3ModeCount], a
    ld [wCh3VolumeCount], a
    ld hl, wCh3ArpPtr
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, wCh3SlidePtr
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, wCh3ModePtr
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    jp UpdateChannel4

; Channel 3 between rows: step the volume, pitch slide, arpeggio and pitch mode tables
; and write the volume and the frequency.
Channel3Effects:
    ld hl, wCh3VolumeCount
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, .volumeKept

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .volumeKept

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

.volumeKept:
    ld [de], a
    ld a, l
    ld d, h
    ld e, [hl]
    ld hl, wCh3VolumePtr
    ld [hl+], a
    ld [hl], d
    inc l
    ld a, e
    ldh [rNR32], a
    ld hl, wCh3SlideCount
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, .slideKept

    inc hl
    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .slideKept

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

.slideKept:
    ld [de], a
    ld a, l
    ld d, h
    ld b, [hl]
    inc hl
    ld c, [hl]
    ld hl, wCh3SlidePtr
    ld [hl+], a
    ld [hl], d
    inc l
    ld a, b
    add [hl]
    ld [hl+], a
    ld a, c
    adc [hl]
    ld [hl+], a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, .arpKept

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .arpKept

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

.arpKept:
    ld [de], a
    ld a, l
    ld d, h
    ld c, [hl]
    ld hl, wCh3ArpPtr
    ld [hl+], a
    ld [hl], d
    inc l
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, .modeKept

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .modeKept

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

.modeKept:
    ld [de], a
    ld a, l
    ld d, h
    ld e, [hl]
    ld hl, wCh3ModePtr
    ld [hl+], a
    ld [hl], d
    inc l
    ld b, e
    ld a, b
    cp $00
    jr nz, .fromNote

    ld d, $00
    ld e, d
    jr .addSlide

    ; Mode 1 or 2: take the frequency of note + arpeggio from the table.
.fromNote:
    ld a, [hl]
    add c
    ld e, a
    ld d, $00
    ld hl, NoteFrequencies
    add hl, de
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, b
    cp $02
    jr nz, .writeFreq

    ; Mode 0 or 2: add the pitch offset.
.addSlide:
    ld hl, wCh3PitchOffset
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl]
    adc d
    ld d, a

.writeFreq:
    ld a, d
    and $07
    ldh [rNR34], a
    ld [wCh3FreqHigh], a
    ld a, e
    ldh [rNR33], a
    ld [wCh3FreqLow], a
    ld a, $10
    ldh [rNR31], a

; Channel 4 (noise). Like channel 2, a sound effect can take the channel over.
UpdateChannel4:
    ld a, [wSfxChannel]
    cp LOW(wCh4Tick)
    jr nz, .music

    ld hl, wSfxTick
    dec [hl]
    jr z, .sfxTick

    jp Channel4Effects

.sfxTick:
    ld a, $04
    jr .newTick

.music:
    ld hl, wCh4Tick
    dec [hl]
    jr z, .musicTick

    jp Channel4Effects

.musicTick:
    ld a, [wSongTempo]

.newTick:
    ld [hl], a
    inc l
    dec [hl]
    jr z, .nextRow

    jp Channel4Effects

    ; Read the next row of the pattern or of the sound effect.
.nextRow:
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    ld a, [de]
    cp $ff
    jr nz, .notJump

    inc l
    inc de
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld d, a
    ld a, b
    ld e, a
    jp .readOrder

.notJump:
    cp $00
    jr nz, .readRow

    ld a, [wSfxChannel]
    cp LOW(wCh4Tick)
    jr nz, .nextOrder

    inc de
    inc de
    ld a, [de]
    cp $00
    jr z, .sfxEnd

    ld hl, wSfxPtr + 1
    ld [hl-], a
    ld c, a
    dec de
    ld a, [de]
    ld [hl-], a
    ld e, a
    ld d, c
    ld a, [de]
    jr .storeRows

    ; The sound effect is over. UpdateWaveAnim gives the channel back.
.sfxEnd:
    ld a, $ff
    ld [wSfxDone], a
    ld a, $01
    ld [wCh4Envelope], a
    ld [wCh4ReleaseEnvelope], a
    jp Channel4Effects

.nextOrder:
    inc l
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    dec l
    dec l

    ; Read an order list entry: transpose, pattern number.
.readOrder:
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, PatternPointers
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, wCh4PatternPtr + 1

.readRow:
    dec l
    dec l

.storeRows:
    ld [hl+], a
    inc de
    ld a, [de]
    cp $ff
    jr nz, .notHold

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp Channel4Effects

.notHold:
    cp $fe
    jr nz, .notRelease

    ld a, [wCh4ReleaseEnvelope]
    ldh [rNR42], a
    ld a, $80
    ldh [rNR44], a
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp UpdateMutedChannel

.notRelease:
    cp $fd
    jr nz, .note

    ld a, $01
    ld [wCh4Trigger], a
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp UpdateMutedChannel

    ; A note: the note number is not used. Load the noise instrument.
.note:
    inc de
    ld b, a
    ld a, [wSfxChannel]
    cp LOW(wCh4Tick)
    jr nz, .musicTranspose

    xor a
    jp .gotTranspose

.musicTranspose:
    ld a, [wCh4Transpose]

.gotTranspose:
    add b
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, NoiseInstrumentPointers
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ldh [rNR41], a
    inc de
    ld a, [de]
    ld [wCh4Envelope], a
    inc de
    ld a, [de]
    ld [wCh4ReleaseEnvelope], a
    inc de
    ld a, $01
    ld [wCh4ShapeCount], a
    ld [wCh4ControlCount], a
    ld [wCh4Trigger], a
    ld hl, wCh4ShapePtr
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, wCh4ControlPtr
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    jp UpdateMutedChannel

; Channel 4 between rows: restart the note if asked, then step the two noise tables
; and write NR43 and NR44.
Channel4Effects:
    ld hl, wCh4Trigger
    ld a, [hl]
    cp $00
    jr z, .noTrigger

    xor a
    ld [hl], a
    ld a, [wCh4Envelope]
    ldh [rNR42], a
    ld a, $80
    ldh [rNR44], a

.noTrigger:
    ldh [rNR41], a
    inc l
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, .shapeKept

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .shapeKept

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

.shapeKept:
    ld [de], a
    ld a, l
    ld d, h
    ld c, [hl]
    ld hl, wCh4ShapePtr
    ld [hl+], a
    ld [hl], d
    inc l
    ld a, c
    ldh [rNR43], a
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr nz, .controlKept

    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .controlKept

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

.controlKept:
    ld [de], a
    ld a, l
    ld d, h
    ld c, [hl]
    ld hl, wCh4ControlPtr
    ld [hl+], a
    ld [hl], d
    ld a, c
    ldh [rNR44], a

; While a sound effect plays, keep reading the song rows of the channel it took over.
; Nothing is written to the sound registers, so the song stays in step and comes back at the right place.
UpdateMutedChannel:
    ld hl, wSfxChannel
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    cp $ff
    jr nz, .active

    jp UpdateWaveAnim

.active:
    dec [hl]
    jr z, .newTick

    jp UpdateWaveAnim

.newTick:
    ld a, [wSongTempo]
    ld [hl], a
    inc l
    dec [hl]
    jr z, .nextRow

    jp UpdateWaveAnim

.nextRow:
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    ld a, [de]
    cp $ff
    jr nz, .notJump

    inc l
    inc de
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld d, a
    ld a, b
    ld e, a
    jr .readOrder

.notJump:
    cp $00
    jr nz, .readRow

    inc l
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    dec l
    dec l

    ; Read an order list entry and store the pattern pointer in the channel.
.readOrder:
    ld a, [de]
    ld [hl], a
    inc de
    ld a, [de]
    inc de
    inc l
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, PatternPointers
    add hl, de
    add hl, de
    ld a, [wSfxChannel]
    cp LOW(wCh2Tick)
    jr nz, .channel4

    ld de, wCh2PatternPtr
    jp .storePattern

.channel4:
    ld de, wCh4PatternPtr

.storePattern:
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl]
    ld [de], a
    dec de
    ld l, e
    ld h, d
    ld e, [hl]
    inc l
    ld d, [hl]
    ld a, [de]

.readRow:
    dec l
    dec l
    ld [hl+], a
    inc de
    ld a, [de]
    cp $ff
    jr nz, .notHold

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp UpdateWaveAnim

.notHold:
    cp $fe
    jr nz, .notRelease

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp UpdateWaveAnim

.notRelease:
    cp $fd
    jr nz, .note

    inc de
    ld [hl], e
    inc l
    ld [hl], d
    jp UpdateWaveAnim

    ; A note: skip it.
.note:
    inc de
    ld b, a
    add b
    ld a, [de]
    inc de
    ld [hl], e
    inc l
    ld [hl], d
    ld e, a
    ld d, $00
    ld hl, InstrumentPointers
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]

; End a finished sound effect, then step the wave animation: every step writes one byte of wave RAM.
UpdateWaveAnim:
    ld a, [wSfxDone]
    cp $ff
    jr nz, .sfxGoesOn

    ld [wSfxChannel], a

.sfxGoesOn:
    ld hl, wWaveAnimCount
    ld e, l
    ld d, h
    inc l
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    dec a
    jr z, .nextStep

    ld [de], a
    jr .done

.nextStep:
    inc hl
    inc hl
    ld a, [hl+]
    cp $00
    jr nz, .write

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]

    ; Write value B to register $ff00 + C. The wave channel is switched off for the write.
.write:
    ld [de], a
    ld a, l
    ld d, h
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, wWaveAnimPtr
    ld [hl+], a
    ld [hl], d
    inc l
    ld a, $ff
    ld h, a
    ld l, c
    xor a
    ldh [rNR30], a
    ld a, b
    ld [hl], a
    ld a, $80
    ldh [rNR30], a
    ld a, [wCh3FreqHigh]
    xor $80
    ldh [rNR34], a
    ld a, [wCh3FreqLow]
    ldh [rNR33], a

.done:
    ret

; Start song E. Loads the 13-byte song header, copies the waveform to wave RAM and resets all channels.
; Each channel starts on Pattern_Empty, so the first update reads the first entry of its order list.
PlaySong:
    ld hl, SongHeaders
    ld d, $00               ; HL = SongHeaders + 13 * E
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    ld a, [hl+]
    ld [wCh1OrderPtr], a
    ld a, [hl+]
    ld [wCh1OrderPtr + 1], a
    ld a, [hl+]
    ld [wCh2OrderPtr], a
    ld a, [hl+]
    ld [wCh2OrderPtr + 1], a
    ld a, [hl+]
    ld [wCh3OrderPtr], a
    ld a, [hl+]
    ld [wCh3OrderPtr + 1], a
    ld a, [hl+]
    ld [wCh4OrderPtr], a
    ld a, [hl+]
    ld [wCh4OrderPtr + 1], a
    ld a, [hl+]
    ld [wSongTempo], a
    ld a, [hl+]
    ld [wWaveAnimPtr], a
    ld a, [hl+]
    ld [wWaveAnimPtr + 1], a
    xor a                   ; Disable sound
    ldh [rNR30], a
    ld a, [hl+]             ; setup waveform pointer
    ld h, [hl]
    ld l, a
    ld de, _AUD3WAVERAM            ; Destination: Wave RAM

.copyWave:
    ld a, [hl+]             ; Load wave RAM data
    ld [de], a              ; Send to Wave RAM
    inc e                   ; Increase destination index
    ld a, e
    cp $40
    jr nz, .copyWave

    ld a, $ff
    ldh [rNR52], a
    ld a, $80
    ldh [rNR30], a
    ld a, $10
    ldh [rNR31], a
    xor a
    ldh [rNR32], a
    dec a
    ld [wSfxChannel], a
    ld a, $80
    ldh [rNR34], a
    xor a
    ld [wCh1PitchOffset], a
    ld [wCh1PitchOffset + 1], a
    inc a
    ld [wCh1SlideCount], a
    ld [wWaveAnimCount], a
    ld [wCh1Tick], a
    ld [wCh2Tick], a
    ld [wCh3Tick], a
    ld [wCh4Tick], a
    ld [wCh1Rows], a
    ld [wCh2Rows], a
    ld [wCh3Rows], a
    ld [wCh4Rows], a
    ld hl, Pattern_Empty
    ld a, l
    ld [wCh1PatternPtr], a
    ld [wCh2PatternPtr], a
    ld [wCh3PatternPtr], a
    ld [wCh4PatternPtr], a
    ld a, h
    ld [wCh1PatternPtr + 1], a
    ld [wCh2PatternPtr + 1], a
    ld [wCh3PatternPtr + 1], a
    ld [wCh4PatternPtr + 1], a
    ld a, $77
    ldh [rNR50], a
    ld a, $ff
    ldh [rNR51], a
    ldh [rNR52], a
    ld hl, wCh3VolumePtr
    ld de, WaveVolume_Silent - 1
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl], a
    xor a
    ld [wCh1Envelope], a
    ld [wCh2Envelope], a
    ld [wCh4Envelope], a
    inc a
    ld [wCh1Trigger], a
    ld [wCh2Trigger], a
    ld [wCh4Trigger], a
    ldh [rNR44], a
    ldh [rNR42], a
    inc a
    ld [wCh3VolumeCount], a
    ret

; Play sound effect E. It is ignored when a sound effect with a higher priority is playing.
; The effect takes over channel 2 or channel 4 until its data ends.
PlaySfx:
    ld d, $00
    ld hl, SfxTable
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    ld a, [wSfxChannel]
    cp $ff
    jr z, .start

    ld a, [wSfxPriority]
    dec a
    sub [hl]
    and $80
    jr z, .ret

    ; Mute the channel that the effect playing now uses.
.start:
    ld a, [hl+]
    ld [wSfxPriority], a
    ld a, [wSfxChannel]
    cp LOW(wCh2Tick)
    jr nz, .notChannel2

    ld a, $01
    ld [wCh2Trigger], a
    ld [wCh2Envelope], a
    jr .setPointer

.notChannel2:
    cp LOW(wCh4Tick)
    jr nz, .setPointer

    ld a, $01
    ld [wCh4Trigger], a
    ld [wCh4Envelope], a

.setPointer:
    ld a, [hl+]
    ld [wSfxPtr], a
    ld a, [hl+]
    ld [wSfxPtr + 1], a
    ld a, [hl+]
    cp $02
    jr nz, .noise

    ld de, wCh2Tick
    jr .setChannel

.noise:
    ld de, wCh4Tick

.setChannel:
    ld hl, wSfxChannel
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $01
    ld [wSfxTick], a
    ld [wSfxRows], a
    xor a
    ld [wSfxDone], a

.ret:
    ret

; Volume table that keeps the wave channel silent. PlaySong points wCh3VolumePtr one byte before it,
; at the ret above.
WaveVolume_Silent:
    db $ff, $00
    db TABLE_END
    dw WaveVolume_Silent

; Every channel starts here, so the first update moves on to the order list.
Pattern_Empty:
    db PATTERN_END

NoteFrequencies:
    dw $002c, $009c, $0106, $016b, $01c9, $0223, $0277, $02c6, $0312, $0356, $039b, $03da ; notes $00-$0b, octave 2
    dw $0416, $044e, $0483, $04b5, $04e5, $0511, $053b, $0563, $0589, $05ac, $05ce, $05ed ; notes $0c-$17, octave 3
    dw $060a, $0627, $0642, $065b, $0672, $0689, $069e, $06b2, $06c4, $06d6, $06e7, $06f7 ; notes $18-$23, octave 4
    dw $0706, $0714, $0721, $072d, $0739, $0744, $074f, $0759, $0762, $076b, $0773, $077b ; notes $24-$2f, octave 5
    dw $0783, $078a, $0790, $0797, $079d, $07a2, $07a7, $07ac, $07b1, $07b6, $07ba, $07be ; notes $30-$3b, octave 6
    dw $07c1, $07c4, $07c8, $07cb, $07ce, $07d1, $07d4, $07d6, $07d9, $07db, $07dd, $07df ; notes $3c-$47, octave 7

SfxTable:
; Priority, data pointer, channel (2 = pulse channel 2, anything else = noise channel).
    db $7f ; 0
    dw Sfx_00
    db $03
    db $0a ; 1
    dw Sfx_01
    db $02
    db $0a ; 2
    dw Sfx_02
    db $02
    db $0a ; 3
    dw Sfx_03
    db $02
    db $0a ; 4
    dw Sfx_04
    db $02
    db $14 ; 5
    dw Sfx_05
    db $02
    db $32 ; 6
    dw Sfx_06
    db $02
    db $32 ; 7
    dw Sfx_07
    db $02
    db $14 ; 8
    dw Sfx_08
    db $02
    db $1e ; 9
    dw Sfx_09
    db $02
    db $3c ; 10
    dw Sfx_10
    db $03
    db $28 ; 11
    dw Sfx_11
    db $03
    db $14 ; 12
    dw Sfx_12
    db $02
    db $14 ; 13
    dw Sfx_13
    db $03
    db $14 ; 14
    dw Sfx_14
    db $03
    db $15 ; 15
    dw Sfx_15
    db $02
    db $28 ; 16
    dw Sfx_16
    db $02
    db $28 ; 17
    dw Sfx_17
    db $03
    db $28 ; 18
    dw Sfx_18
    db $03
    db $28 ; 19
    dw Sfx_19
    db $02
    db $28 ; 20
    dw Sfx_20
    db $03
    db $28 ; 21
    dw Sfx_21
    db $02
    db $32 ; 22
    dw Sfx_22
    db $02
    db $32 ; 23
    dw Sfx_23
    db $02
    db $32 ; 24
    dw Sfx_24
    db $02
    db $3c ; 25
    dw Sfx_25
    db $03
    db $64 ; 26
    dw Sfx_26
    db $02
    db $64 ; 27
    dw Sfx_27
    db $03
    db $64 ; 28
    dw Sfx_28
    db $03
    db $50 ; 29
    dw Sfx_29
    db $02

; One 13-byte header per song: four order list pointers (channels 1 to 4), the tempo in frames per
; row step, the wave animation pointer and the waveform pointer.
SongHeaders:
SongHeader_Silence:
; Song 0: silence.
    dw Song_Silence_Ch1, Song_Silence_Ch2, Song_Silence_Ch3, Song_Silence_Ch4
    db $08
    dw WaveAnim_03 - 2
    dw Waveform_0

SongHeader_Title:
; Song 1: title screen.
    dw Song_Title_Ch1, Song_Title_Ch2, Song_Title_Ch3, Song_Title_Ch4
    db $07
    dw WaveAnim_00 - 2
    dw Waveform_4

SongHeader_Level1:
; Song 2: levels, wLevelMusicIndex 0.
    dw Song_Level1_Ch1, Song_Level1_Ch2, Song_Level1_Ch3, Song_Level1_Ch4
    db $07
    dw WaveAnim_00 - 2
    dw Waveform_4

SongHeader_Level2:
; Song 3: levels, wLevelMusicIndex 1.
    dw Song_Level2_Ch1, Song_Level2_Ch2, Song_Level2_Ch3, Song_Level2_Ch4
    db $07
    dw WaveAnim_03 - 2
    dw Waveform_0

SongHeader_Level3:
; Song 4: levels, wLevelMusicIndex 2.
    dw Song_Level3_Ch1, Song_Level3_Ch2, Song_Level3_Ch3, Song_Level3_Ch4
    db $07
    dw WaveAnim_03 - 2
    dw Waveform_0

SongHeader_MainMenu:
; Song 5: main menu.
    dw Song_MainMenu_Ch1, Song_MainMenu_Ch2, Song_MainMenu_Ch3, Song_MainMenu_Ch4
    db $07
    dw WaveAnim_03 - 2
    dw Waveform_0

SongHeader_HighScores:
; Song 6: high scores.
    dw Song_MainMenu_Ch1, Song_HighScores_Ch2, Song_MainMenu_Ch3, Song_MainMenu_Ch4
    db $07
    dw WaveAnim_03 - 2
    dw Waveform_0

SongHeader_GameOver:
; Song 7: game over.
    dw Song_GameOver_Ch1, Song_GameOver_Ch2, Song_GameOver_Ch3, Song_GameOver_Ch4
    db $06
    dw WaveAnim_03 - 2
    dw Waveform_0

SongHeader_Ending:
; Song 8: ending.
    dw Song_Ending_Ch1, Song_Ending_Ch2, Song_Ending_Ch3, Song_MainMenu_Ch4
    db $07
    dw WaveAnim_03 - 2
    dw Waveform_0

SongHeader_Credits:
; Song 9: credits.
    dw Song_Credits_Ch1, Song_Credits_Ch2, Song_Credits_Ch3, Song_MainMenu_Ch4
    db $06
    dw WaveAnim_03 - 2
    dw Waveform_0

PatternPointers:
    dw Pattern_00, Pattern_01, Pattern_02, Pattern_03 ; $00
    dw Pattern_04, Pattern_05, Pattern_06, Pattern_07 ; $04
    dw Pattern_08, Pattern_09, Pattern_0A, Pattern_0B ; $08
    dw Pattern_0C, Pattern_0D, Pattern_0E, Pattern_0F ; $0c
    dw Pattern_10, Pattern_11, Pattern_12, Pattern_13 ; $10
    dw Pattern_14, Pattern_15, Pattern_16, Pattern_17 ; $14
    dw Pattern_18, Pattern_19, Pattern_1A, Pattern_1B ; $18
    dw Pattern_1C, Pattern_1D, Pattern_1E, Pattern_1F ; $1c
    dw Pattern_20, Pattern_21, Pattern_22, Pattern_23 ; $20
    dw Pattern_24, Pattern_25, Pattern_26, Pattern_27 ; $24
    dw Pattern_28, Pattern_29, Pattern_2A, Pattern_2B ; $28
    dw Pattern_2C, Pattern_2D, Pattern_2E, Pattern_2F ; $2c
    dw Pattern_30, Pattern_31, Pattern_32, Pattern_33 ; $30
    dw Pattern_34, Pattern_35, Pattern_36, Pattern_37 ; $34
    dw Pattern_38, Pattern_39, Pattern_3A, Pattern_3B ; $38
    dw Pattern_3C, Pattern_3D, Pattern_3E, Pattern_3F ; $3c
    dw Pattern_40, Pattern_41, Pattern_42, Pattern_43 ; $40
    dw Pattern_44, Pattern_45, Pattern_46, Pattern_47 ; $44
    dw Pattern_48, Pattern_49, Pattern_4A, Pattern_4B ; $48
    dw Pattern_4C, Pattern_4D, Pattern_4E, Pattern_4F ; $4c
    dw Pattern_50, Pattern_51, Pattern_52, Pattern_53 ; $50
    dw Pattern_54, Pattern_55, Pattern_56, Pattern_57 ; $54
    dw Pattern_58, Pattern_59, Pattern_5A, Pattern_5B ; $58
    dw Pattern_5C, Pattern_5D, Pattern_5E, Pattern_5F ; $5c
    dw Pattern_60, Pattern_61, Pattern_62, Pattern_63 ; $60
    dw Pattern_64, Pattern_65, Pattern_66, Pattern_67 ; $64
    dw Pattern_68, Pattern_69, Pattern_6A, Pattern_6B ; $68
    dw Pattern_6C, Pattern_6D, Pattern_6E, Pattern_6F ; $6c
    dw Pattern_70, Pattern_71, Pattern_72, Pattern_73 ; $70
    dw Pattern_74, Pattern_75, Pattern_76, Pattern_77 ; $74
    dw Pattern_78, Pattern_79, Pattern_7A, Pattern_7B ; $78
    dw Pattern_7C, Pattern_7D, Pattern_7E, Pattern_7F ; $7c

; Not in the instrument tables.
InstrumentPointers:
    dw Instrument_00, Instrument_01, Instrument_02, Instrument_03 ; $00
    dw Instrument_04, Instrument_05, Instrument_06, Instrument_07 ; $04
    dw Instrument_08, Instrument_09, Instrument_0A, Instrument_0B ; $08
    dw Instrument_0C, Instrument_0D, Instrument_0E, Instrument_0F ; $0c
    dw Instrument_10, Instrument_11, Instrument_12, Instrument_13 ; $10
    dw Instrument_14, Instrument_15, Instrument_16, Instrument_17 ; $14
    dw Instrument_18, Instrument_19, Instrument_1A, Instrument_1B ; $18
    dw Instrument_1C, Instrument_1D, Instrument_1E, Instrument_1F ; $1c
    dw Instrument_20, Instrument_21, Instrument_22, Instrument_23 ; $20
    dw Instrument_22, Instrument_25, Instrument_26, Instrument_27 ; $24
    dw Instrument_28, Instrument_0E, Instrument_2A, Instrument_2B ; $28
    dw Instrument_2C, Instrument_2D, Instrument_2E, Instrument_2F ; $2c
    dw Instrument_30, Instrument_31, Instrument_32, Instrument_33 ; $30
    dw Instrument_34, Instrument_35, Instrument_36, Instrument_37 ; $34
    dw Instrument_38, Instrument_39, Instrument_3A, Instrument_3B ; $38
    dw Instrument_3C ; $3c

NoiseInstrumentPointers:
    dw NoiseInstrument_00, NoiseInstrument_01, NoiseInstrument_02, NoiseInstrument_03 ; $00
    dw NoiseInstrument_04, NoiseInstrument_00, NoiseInstrument_00, NoiseInstrument_00 ; $04
    dw NoiseInstrument_00, NoiseInstrument_00, NoiseInstrument_0A, NoiseInstrument_0B ; $08
    dw NoiseInstrument_0C, NoiseInstrument_0D, NoiseInstrument_0E, NoiseInstrument_0F ; $0c
    dw NoiseInstrument_10, NoiseInstrument_11, NoiseInstrument_12, NoiseInstrument_13 ; $10
    dw NoiseInstrument_14, NoiseInstrument_15 ; $14

Song_Title_Ch1:
    db $00, $01
    db $00, $01
    db $00, $01
    db $00, $01
    db $03, $01
    db $03, $01
    db $03, $01
    db $03, $01
    db $00, $01
    db $00, $01
    db $00, $01
    db $00, $01
    db $03, $01
    db $03, $01
    db $03, $01
    db $03, $01
    db $00, $04
    db $00, $04
    db $00, $04
    db $00, $04
    db $03, $04
    db $03, $04
    db $03, $04
    db $03, $04
    db $00, $04
    db $00, $04
    db $00, $04
    db $00, $04
    db $03, $04
    db $03, $04
    db $03, $04
    db $03, $04
    db $00, $0a
    db $00, $0a
    db $00, $0a
    db $00, $0a
    db $fe, $0b
    db $fe, $0b
    db $fe, $0b
    db $fe, $0e

Song_Title_Ch2:
    db $00, $02
    db $00, $02
    db $00, $02
    db $00, $02
    db $03, $02
    db $03, $02
    db $03, $02
    db $03, $02
    db $00, $02
    db $00, $02
    db $00, $02
    db $00, $02
    db $03, $02
    db $03, $02
    db $03, $02
    db $03, $02
    db $00, $05
    db $00, $05
    db $00, $05
    db $00, $06
    db $fe, $07
    db $fe, $07
    db $fe, $07
    db $fe, $08
    db $00, $05
    db $00, $05
    db $00, $05
    db $00, $06
    db $fe, $07
    db $fe, $07
    db $fe, $07
    db $fe, $08
    db $00, $05
    db $00, $05
    db $00, $05
    db $00, $06
    db $fe, $07
    db $fe, $07
    db $fe, $07
    db $fe, $0f

Song_Title_Ch3:
    db $00, $11
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $0c
    db $00, $00
    db $00, $00
    db $00, $00
    db $fe, $03
    db $fe, $00
    db $fe, $00
    db $fe, $00
    db $00, $0c
    db $00, $00
    db $00, $00
    db $00, $00
    db $fe, $03
    db $fe, $00
    db $fe, $00
    db $fe, $00
    db $00, $09
    db $00, $09
    db $00, $09
    db $00, $09
    db $03, $09
    db $03, $09
    db $03, $09
    db $03, $09
    db $00, $09
    db $00, $09
    db $00, $09
    db $00, $09
    db $03, $09
    db $03, $09
    db $03, $09
    db $03, $10

Song_Title_Ch4:
    db $00, $0d

Song_Level1_Ch1:
    db $00, $12
    db $00, $13
    db $00, $12
    db $00, $14
    db $00, $12
    db $00, $13
    db $00, $12
    db $00, $14
    db $00, $12
    db $00, $13
    db $00, $12
    db $00, $14
    db $03, $12
    db $03, $13
    db $03, $12
    db $03, $14
    db $03, $12
    db $03, $13
    db $03, $12
    db $03, $14
    db $00, $1e
    db $00, $1f
    db $07, $1e
    db $00, $26
    db $02, $12
    db $02, $13
    db $02, $12
    db $02, $14
    db $02, $12
    db $02, $13
    db $02, $12
    db $02, $14
    db $02, $12
    db $02, $13
    db $02, $12
    db $02, $14
    db $05, $12
    db $05, $13
    db $05, $12
    db $05, $14
    db $05, $12
    db $05, $13
    db $05, $12
    db $05, $14
    db $02, $1e
    db $02, $1f
    db $09, $1e
    db $02, $28

Song_Level1_Ch2:
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $1d
    db $00, $1d
    db $00, $1d
    db $00, $1d
    db $00, $1d
    db $00, $1d
    db $00, $1d
    db $00, $1d
    db $03, $1d
    db $03, $1d
    db $03, $1d
    db $03, $1d
    db $03, $1d
    db $03, $1d
    db $03, $1d
    db $03, $1d
    db $05, $1d
    db $05, $1d
    db $07, $1d
    db $07, $1d
    db $02, $00
    db $02, $00
    db $02, $00
    db $02, $00
    db $02, $1d
    db $02, $1d
    db $02, $1d
    db $02, $1d
    db $02, $1d
    db $02, $1d
    db $02, $1d
    db $02, $1d
    db $05, $1d
    db $05, $1d
    db $05, $1d
    db $05, $1d
    db $05, $1d
    db $05, $1d
    db $05, $1d
    db $05, $1d
    db $07, $1d
    db $07, $1d
    db $09, $1d
    db $09, $29

Song_Level1_Ch3:
    db $00, $2b
    db $00, $2b
    db $00, $2b
    db $00, $2b
    db $00, $15
    db $00, $16
    db $00, $15
    db $00, $17
    db $00, $15
    db $00, $16
    db $00, $15
    db $00, $17
    db $03, $15
    db $03, $16
    db $03, $15
    db $03, $17
    db $03, $15
    db $03, $16
    db $03, $15
    db $03, $17
    db $00, $20
    db $00, $21
    db $00, $22
    db $00, $23
    db $00, $2b
    db $02, $00
    db $02, $00
    db $02, $00
    db $02, $15
    db $02, $16
    db $02, $15
    db $02, $17
    db $02, $15
    db $02, $16
    db $02, $15
    db $02, $17
    db $05, $15
    db $05, $16
    db $05, $15
    db $05, $17
    db $05, $15
    db $05, $16
    db $05, $15
    db $05, $17
    db $02, $20
    db $02, $21
    db $02, $22
    db $02, $2a

Song_Level1_Ch4:
    db $00, $27

Song_Level2_Ch1:
    db $00, $2d
    db $00, $2d
    db $00, $2d
    db $00, $2d
    db $00, $2d
    db $00, $2d
    db $00, $2d
    db $00, $2d
    db $00, $2f
    db $00, $30
    db $fe, $2f
    db $fe, $31
    db $00, $2f
    db $00, $30
    db $fe, $2f
    db $fe, $31
    db $00, $32
    db $00, $32
    db $fe, $32
    db $fe, $33
    db $00, $32
    db $00, $32
    db $05, $32
    db $05, $33
    db $03, $2d
    db $03, $2d
    db $03, $2d
    db $03, $2d
    db $03, $2d
    db $03, $2d
    db $03, $2d
    db $03, $2d
    db $03, $2f
    db $03, $30
    db $01, $2f
    db $01, $31
    db $03, $2f
    db $03, $30
    db $01, $2f
    db $01, $31
    db $03, $32
    db $03, $32
    db $01, $32
    db $01, $33
    db $03, $32
    db $03, $32
    db $08, $32
    db $08, $34

Song_Level2_Ch2:
    db $00, $2e
    db $00, $2e
    db $fe, $2e
    db $fe, $2e
    db $00, $2e
    db $00, $2e
    db $fc, $2e
    db $fc, $2e
    db $02, $2e
    db $02, $2e
    db $02, $2e
    db $02, $2e
    db $02, $2e
    db $02, $2e
    db $00, $2e
    db $00, $2e
    db $00, $2e
    db $00, $2e
    db $fe, $2e
    db $fe, $2e
    db $00, $2e
    db $00, $2e
    db $05, $2e
    db $05, $2e
    db $03, $2e
    db $03, $2e
    db $01, $2e
    db $01, $2e
    db $03, $2e
    db $03, $2e
    db $ff, $2e
    db $ff, $2e
    db $05, $2e
    db $05, $2e
    db $05, $2e
    db $05, $2e
    db $05, $2e
    db $05, $2e
    db $03, $2e
    db $03, $2e
    db $03, $2e
    db $03, $2e
    db $01, $2e
    db $01, $2e
    db $03, $2e
    db $03, $2e
    db $08, $2e
    db $08, $35

Song_Level2_Ch3:
    db $00, $2c
    db $00, $2c
    db $fe, $2c
    db $fe, $2c
    db $00, $2c
    db $00, $2c
    db $fc, $2c
    db $fc, $2c
    db $02, $2c
    db $02, $2c
    db $00, $2c
    db $00, $2c
    db $02, $2c
    db $02, $2c
    db $00, $2c
    db $00, $2c
    db $00, $2c
    db $00, $2c
    db $fe, $2c
    db $fe, $2c
    db $00, $2c
    db $00, $2c
    db $05, $2c
    db $05, $2c
    db $03, $2c
    db $03, $2c
    db $01, $2c
    db $01, $2c
    db $03, $2c
    db $03, $2c
    db $ff, $2c
    db $ff, $2c
    db $05, $2c
    db $05, $2c
    db $03, $2c
    db $03, $2c
    db $05, $2c
    db $05, $2c
    db $03, $2c
    db $03, $2c
    db $03, $2c
    db $03, $2c
    db $01, $2c
    db $01, $2c
    db $03, $2c
    db $03, $2c
    db $08, $2c
    db $08, $36

Song_Level2_Ch4:
    db $00, $27

Song_Level3_Ch1:
    db $00, $37
    db $00, $37
    db $00, $37
    db $00, $37
    db $00, $38
    db $00, $38
    db $00, $38
    db $00, $39
    db $00, $3a
    db $00, $3a
    db $00, $3a
    db $00, $3a
    db $00, $3b
    db $00, $3b
    db $00, $3b
    db $00, $3c
    db $00, $3f
    db $00, $40
    db $00, $3f
    db $00, $41
    db $00, $3f
    db $00, $40
    db $00, $3f
    db $00, $4b

Song_Level3_Ch2:
    db $00, $3e
    db $00, $00
    db $00, $3e
    db $00, $00
    db $00, $3e
    db $00, $00
    db $00, $3e
    db $00, $00
    db $05, $3e
    db $00, $00
    db $05, $3e
    db $00, $00
    db $00, $3e
    db $00, $00
    db $00, $3e
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $4c

Song_Level3_Ch3:
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $11, $3d
    db $11, $3d
    db $11, $3d
    db $11, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $3d
    db $0c, $4d

Song_Level3_Ch4:
    db $00, $42
    db $00, $42
    db $00, $42
    db $00, $42
    db $00, $43
    db $00, $43
    db $00, $43
    db $00, $44
    db $00, $45
    db $00, $45
    db $00, $45
    db $00, $45
    db $00, $46
    db $00, $46
    db $00, $46
    db $00, $47
    db $00, $48
    db $00, $49
    db $00, $48
    db $00, $4a
    db $00, $48
    db $00, $49
    db $00, $48
    db $00, $4e

Song_MainMenu_Ch1:
    db $00, $51
    db $00, $51
    db $07, $51
    db $07, $51
    db $03, $51
    db $03, $51
    db $07, $51
    db $07, $51
    db $03, $51
    db $03, $51
    db $07, $51
    db $07, $51
    db $06, $51
    db $06, $51
    db $08, $51
    db $08, $53

Song_MainMenu_Ch2:
    db $00, $52
    db $00, $52
    db $fb, $52
    db $fb, $52
    db $03, $52
    db $03, $52
    db $07, $52
    db $07, $52
    db $03, $52
    db $03, $52
    db $05, $52
    db $05, $52
    db $06, $52
    db $06, $52
    db $08, $52
    db $08, $54

Song_MainMenu_Ch3:
    db $00, $4f
    db $00, $4f
    db $00, $50
    db $00, $50
    db $03, $4f
    db $03, $4f
    db $00, $50
    db $00, $50
    db $03, $4f
    db $03, $4f
    db $03, $50
    db $03, $50
    db $06, $4f
    db $06, $4f
    db $08, $4f
    db $08, $55

Song_MainMenu_Ch4:
    db $00, $27

Song_HighScores_Ch2:
    db $00, $56
    db $00, $57
    db $00, $58
    db $00, $59
    db $00, $5a
    db $00, $5b
    db $00, $5c
    db $00, $5d
    db $00, $5e
    db $00, $5f
    db $00, $60
    db $00, $61
    db $00, $62
    db $00, $63
    db $00, $64
    db $00, $65

Song_GameOver_Ch1:
    db $07, $66

Song_GameOver_Ch2:
    db $07, $67
    db $07, $66

Song_GameOver_Ch3:
    db $00, $19

Song_GameOver_Ch4:
    db $00, $1a

Song_Ending_Ch1:
    db $00, $68
    db $00, $68
    db $07, $68
    db $07, $68
    db $05, $68
    db $05, $68
    db $00, $68
    db $07, $68
    db $fb, $68
    db $fb, $68
    db $fe, $68
    db $fe, $76

Song_Ending_Ch2:
    db $00, $6b
    db $00, $6c
    db $00, $6d
    db $00, $6e
    db $00, $6f
    db $00, $70
    db $00, $71
    db $00, $72
    db $00, $73
    db $00, $74
    db $03, $73
    db $03, $77

Song_Ending_Ch3:
    db $00, $69
    db $00, $6a
    db $fb, $69
    db $fb, $6a
    db $05, $75
    db $05, $6a
    db $00, $69
    db $fb, $6a
    db $fb, $69
    db $fb, $6a
    db $fe, $69
    db $fe, $78

; Nothing points here.
Order_Unused_507b:
    db $00, $1a

Song_Credits_Ch1:
    db $00, $7b
    db $00, $7b
    db $07, $7b
    db $07, $7b
    db $00, $7b
    db $00, $7b
    db $07, $7b
    db $07, $7b
    db $05, $7b
    db $05, $7b
    db $0a, $7b
    db $0a, $7b
    db $05, $7b
    db $05, $7b
    db $0a, $7b
    db $0a, $7d

Song_Credits_Ch2:
    db $00, $7c
    db $00, $7c
    db $fb, $7c
    db $fb, $7c
    db $00, $7c
    db $00, $7c
    db $fb, $7c
    db $fb, $7c
    db $05, $7c
    db $05, $7c
    db $fe, $7c
    db $fe, $7c
    db $05, $7c
    db $05, $7c
    db $fe, $7c
    db $fe, $7e

Song_Credits_Ch3:
    db $00, $79
    db $00, $7a
    db $fb, $79
    db $fb, $7a
    db $00, $79
    db $00, $7a
    db $fb, $79
    db $fb, $7a
    db $05, $79
    db $05, $7a
    db $fe, $79
    db $fe, $7a
    db $05, $79
    db $05, $7a
    db $fe, $79
    db $fe, $7f

; Pattern_1B jumps back here, so it repeats for ever. Songs that play once end this way.
Order_Silence:
    db $00, $1b

Song_Silence_Ch1:
    db $00, $18

Song_Silence_Ch2:
    db $00, $18

Song_Silence_Ch3:
    db $00, $19

Song_Silence_Ch4:
    db $00, $1a

; Channel 2, 3.
Pattern_00:
    db $10, ROW_HOLD
    db PATTERN_END

; Channel 1.
Pattern_01:
    db $04, $0c, $13
    db $04, $18, $13
    db $04, $16, $13
    db $04, $13, $13
    db PATTERN_END

; Channel 2.
Pattern_02:
    db $02, ROW_HOLD
    db $04, $0c, $13
    db $04, $13, $13
    db $04, $15, $13
    db $02, $0f, $13
    db PATTERN_END

; Channel 3.
Pattern_03:
    db $10, $24, $02
    db PATTERN_END

; Channel 1.
Pattern_04:
    db $02, $0c, $13
    db $02, $0c, $13
    db $02, $18, $13
    db $02, $13, $13
    db $02, $16, $13
    db $02, $15, $13
    db $02, $13, $13
    db $02, $0f, $13
    db PATTERN_END

; Channel 2.
Pattern_05:
    db $02, $07, $1e
    db $01, $24, $03
    db $01, $24, $03
    db $02, $1a, $06
    db $02, $24, $03
    db $02, $07, $1e
    db $02, $24, $03
    db $02, $1a, $06
    db $02, $24, $03
    db PATTERN_END

; Channel 2.
Pattern_06:
    db $02, $07, $1e
    db $01, $24, $03
    db $01, $24, $03
    db $01, $1c, $06
    db $01, $1c, $06
    db $02, $24, $03
    db $02, $07, $1e
    db $02, $24, $03
    db $01, $1a, $06
    db $01, $1a, $06
    db $01, $1a, $06
    db $01, $1a, $06
    db PATTERN_END

; Channel 2.
Pattern_07:
    db $02, $07, $1e
    db $01, $24, $04
    db $01, $24, $04
    db $02, $1a, $06
    db $02, $24, $04
    db $02, $07, $1e
    db $02, $24, $04
    db $02, $1a, $06
    db $02, $24, $04
    db PATTERN_END

; Channel 2.
Pattern_08:
    db $02, $07, $1e
    db $01, $24, $04
    db $01, $24, $04
    db $01, $1c, $06
    db $01, $1c, $06
    db $02, $24, $04
    db $02, $07, $1e
    db $02, $24, $04
    db $01, $1a, $06
    db $01, $1a, $06
    db $01, $1a, $06
    db $01, $1a, $06
    db PATTERN_END

; Channel 3.
Pattern_09:
    db $02, $18, $02
    db $02, $24, $02
    db $02, $18, $02
    db $02, $24, $02
    db $02, $22, $02
    db $02, $21, $02
    db $02, $1f, $02
    db $02, $1b, $02
    db PATTERN_END

; Channel 1.
Pattern_0A:
    db $02, $24, $03
    db $01, $24, $03
    db $01, $24, $03
    db $01, $24, $03
    db $01, $24, $03
    db $02, $24, $03
    db $01, $24, $03
    db $02, $24, $03
    db $02, $24, $03
    db $01, $24, $03
    db $01, $24, $03
    db $01, $24, $03
    db PATTERN_END

; Channel 1.
Pattern_0B:
    db $02, $24, $04
    db $01, $24, $04
    db $01, $24, $04
    db $01, $24, $04
    db $01, $24, $04
    db $02, $24, $04
    db $01, $24, $04
    db $02, $24, $04
    db $02, $24, $04
    db $01, $24, $04
    db $01, $24, $04
    db $01, $24, $04
    db PATTERN_END

; Channel 3.
Pattern_0C:
    db $10, $24, $0e
    db PATTERN_END

; Channel 4.
Pattern_0D:
    db $04, $07, $02
    db $04, $07, $01
    db $04, $07, $02
    db $04, $1a, $01
    db $04, $07, $02
    db $04, $07, $01
    db $04, $07, $02
    db $04, $1a, $01
    db $04, $07, $02
    db $04, $07, $01
    db $04, $07, $02
    db $04, $1a, $01
    db $04, $00, $02
    db $01, $1c, $01
    db $03, $1c, $01
    db $04, $07, $02
    db $01, $1a, $01
    db $01, $1a, $01
    db $01, $1a, $01
    db $01, $1a, $01
    db PATTERN_JUMP
    dw Song_Title_Ch4

; Channel 1.
Pattern_0E:
    db $02, $24, $04
    db $01, $24, $04
    db $01, $24, $04
    db $01, $24, $04
    db $01, $24, $04
    db $02, $24, $04
    db $01, $24, $04
    db $02, $24, $04
    db $02, $24, $04
    db $01, $24, $04
    db $01, $24, $04
    db $01, $24, $04
    db PATTERN_JUMP
    dw Song_Title_Ch1

; Channel 2.
Pattern_0F:
    db $02, $07, $1e
    db $01, $24, $04
    db $01, $24, $04
    db $01, $1c, $06
    db $01, $1c, $06
    db $02, $24, $04
    db $02, $07, $1e
    db $02, $24, $04
    db $01, $1a, $06
    db $01, $1a, $06
    db $01, $1a, $06
    db $01, $1a, $06
    db PATTERN_JUMP
    dw Song_Title_Ch2

; Channel 3.
Pattern_10:
    db $02, $18, $02
    db $02, $24, $02
    db $02, $18, $02
    db $02, $24, $02
    db $02, $22, $02
    db $02, $21, $02
    db $02, $1f, $02
    db $02, $1b, $02
    db PATTERN_JUMP
    dw Song_Title_Ch3

; Channel 3.
Pattern_11:
    db $10, $00, $11
    db PATTERN_END

; Channel 1.
Pattern_12:
    db $01, $0c, $01
    db $01, $29, $19
    db $01, $2b, $19
    db $01, $0c, $01
    db $02, $1c, $06
    db $02, $0c, $01
    db $02, $16, $01
    db $01, $2b, $19
    db $01, $29, $19
    db $02, $1c, $06
    db $02, $11, $01
    db PATTERN_END

; Channel 1.
Pattern_13:
    db $01, $0c, $01
    db $01, $29, $19
    db $01, $2b, $19
    db $01, $0c, $01
    db $02, $1c, $06
    db $02, $0c, $01
    db $02, $16, $01
    db $01, $2b, $19
    db $01, $15, $01
    db $02, $1c, $06
    db $02, $11, $01
    db PATTERN_END

; Channel 1.
Pattern_14:
    db $01, $0c, $01
    db $01, $29, $19
    db $01, $2b, $19
    db $01, $0c, $01
    db $02, $1c, $06
    db $02, $0c, $01
    db $02, $16, $01
    db $01, $2b, $19
    db $01, $15, $01
    db $02, $1c, $06
    db $01, $0a, $01
    db $01, $11, $01
    db PATTERN_END

; Channel 3.
Pattern_15:
    db $03, $34, $07
    db $03, $34, $07
    db $02, $35, $08
    db $03, $35, $09
    db $03, $35, $08
    db $02, $32, $07
    db PATTERN_END

; Channel 3.
Pattern_16:
    db $03, $34, $07
    db $03, $30, $08
    db $02, $2b, $09
    db $03, $2e, $08
    db $05, $29, $09
    db PATTERN_END

; Channel 3.
Pattern_17:
    db $03, $34, $07
    db $03, $30, $08
    db $02, $2b, $09
    db $08, $2e, $08
    db PATTERN_END

; Channel 2.
Pattern_1D:
    db $02, ROW_HOLD
    db $04, $24, $14
    db $03, $24, $14
    db $01, $24, $14
    db $04, $24, $14
    db $02, $24, $14
    db PATTERN_END

; Channel 2.
Pattern_29:
    db $02, ROW_HOLD
    db $04, $24, $14
    db $03, $24, $14
    db $01, $24, $14
    db $04, $24, $14
    db $02, $24, $14
    db PATTERN_JUMP
    dw Song_Level1_Ch2

; Channel 1.
Pattern_1E:
    db $03, $05, $01
    db $01, $05, $01
    db $02, $1f, $06
    db $02, $05, $01
    db $03, $07, $01
    db $01, $07, $01
    db $02, $1f, $06
    db $02, $07, $01
    db PATTERN_END

; Channel 1.
Pattern_1F:
    db $03, $08, $01
    db $01, $08, $01
    db $02, $1f, $06
    db $02, $08, $01
    db $03, $0a, $01
    db $01, $0a, $01
    db $02, $1f, $06
    db $01, $1f, $06
    db $01, $1f, $06
    db PATTERN_END

; Channel 3.
Pattern_20:
    db $03, $2d, $0c
    db $03, $2d, $0c
    db $02, $2d, $0c
    db $03, $2b, $0c
    db $03, $2b, $0c
    db $02, $2b, $0c
    db PATTERN_END

; Channel 3.
Pattern_21:
    db $03, $27, $0d
    db $03, $27, $0d
    db $02, $27, $0d
    db $03, $25, $0d
    db $03, $29, $0c
    db $02, $29, $0c
    db PATTERN_END

; Channel 3.
Pattern_22:
    db $03, $2b, $09
    db $03, $2b, $09
    db $02, $2b, $09
    db $03, $2b, $0b
    db $03, $2b, $0b
    db $02, $2b, $0b
    db PATTERN_END

; Channel 3.
Pattern_23:
    db $03, $2b, $0c
    db $03, $2b, $0c
    db $02, $2b, $0c
    db $03, $2b, $0d
    db $03, $2b, $0d
    db $02, $2b, $0d
    db PATTERN_END

; Channel 3.
Pattern_2A:
    db $03, $2b, $0c
    db $03, $2b, $0c
    db $02, $2b, $0c
    db $03, $2b, $0d
    db $03, $2b, $0d
    db $02, $2b, $0d
    db PATTERN_JUMP
    dw Song_Level1_Ch3

; Channel 3.
Pattern_2B:
    db $02, ROW_HOLD
    db $02, $30, $08
    db $02, ROW_HOLD
    db $02, $30, $08
    db $02, ROW_HOLD
    db $02, $2e, $08
    db $02, ROW_HOLD
    db $02, $2e, $08
    db PATTERN_END

; Not used by any song.
Pattern_24:
    db $03, $0c, $01
    db $03, $0c, $01
    db $02, $0c, $01
    db $03, $0e, $01
    db $03, $0e, $01
    db $02, $0e, $01
    db PATTERN_END

; Not used by any song.
Pattern_25:
    db $03, $0e, $01
    db $03, $14, $01
    db $02, $14, $01
    db $03, $13, $01
    db $03, $10, $01
    db $02, $10, $01
    db PATTERN_END

; Channel 1.
Pattern_26:
    db $03, $0d, $01
    db $01, $0d, $01
    db $02, $1f, $06
    db $02, $0d, $01
    db $03, $0c, $01
    db $01, $0c, $01
    db $02, $1f, $06
    db $02, $0c, $01
    db PATTERN_END

; Channel 1.
Pattern_28:
    db $03, $0d, $01
    db $01, $0d, $01
    db $02, $1f, $06
    db $02, $0d, $01
    db $03, $0c, $01
    db $01, $0c, $01
    db $02, $1f, $06
    db $02, $0c, $01
    db PATTERN_JUMP
    dw Song_Level1_Ch1

; Channel 4.
Pattern_27:
    db $04, $24, $03
    db $04, $24, $01
    db $04, $24, $03
    db $04, $24, $01
    db PATTERN_JUMP
    dw Song_Level1_Ch4

; Channel 1, 2.
Pattern_18:
    db $10, $00, $10
    db PATTERN_JUMP
    dw Order_Silence

; Channel 3.
Pattern_19:
    db $10, $00, $11
    db PATTERN_JUMP
    dw Order_Silence

; Channel 4.
Pattern_1A:
    db $10, $00, $00
    db PATTERN_JUMP
    dw Order_Silence

; Channel 1, 2, 3, 4.
Pattern_1B:
    db $10, ROW_HOLD
    db PATTERN_JUMP
    dw Order_Silence

; Not used by any song.
Pattern_1C:
    db $04, $24, $02
    db $02, $24, $03
    db $02, $24, $01
    db PATTERN_JUMP
    dw Song_Title_Ch4

; Channel 3.
Pattern_2C:
    db $02, $18, $15
    db $02, $30, $08
    db $02, $13, $15
    db $02, $30, $08
    db $02, $14, $15
    db $02, $30, $07
    db $02, $0f, $15
    db $02, $30, $07
    db PATTERN_END

; Channel 1.
Pattern_2D:
    db $04, $0c, $1e
    db $04, $1f, $06
    db $04, $0c, $1e
    db $02, $1f, $06
    db $02, $0c, $1e
    db PATTERN_END

; Channel 2.
Pattern_2E:
    db $01, $1c, $19
    db $01, $1a, $19
    db $02, $18, $19
    db $01, $1c, $19
    db $01, $1a, $19
    db $02, $18, $19
    db $01, $18, $19
    db $01, $1a, $19
    db $02, $1b, $19
    db $01, $18, $19
    db $01, $1a, $19
    db $02, $1b, $19
    db PATTERN_END

; Channel 1.
Pattern_2F:
    db $01, $29, $18
    db $01, $2a, $18
    db $02, $26, $18
    db $04, $28, $06
    db $01, $22, $18
    db $01, $24, $18
    db $02, $26, $18
    db $04, $28, $06
    db PATTERN_END

; Channel 1.
Pattern_30:
    db $01, $29, $18
    db $01, $2a, $18
    db $02, $26, $18
    db $04, $28, $06
    db $01, $29, $18
    db $01, $28, $18
    db $02, $26, $18
    db $04, $28, $06
    db PATTERN_END

; Channel 1.
Pattern_31:
    db $01, $29, $18
    db $01, $2a, $18
    db $02, $26, $18
    db $02, $28, $06
    db $02, $21, $18
    db $04, $22, $18
    db $04, $28, $06
    db PATTERN_END

; Channel 1.
Pattern_32:
    db $01, $28, $18
    db $01, $26, $18
    db $01, $24, $18
    db $01, $1f, $18
    db $01, $28, $18
    db $01, $26, $18
    db $01, $24, $18
    db $01, $1f, $18
    db $01, $27, $18
    db $01, $26, $18
    db $01, $24, $18
    db $01, $20, $18
    db $01, $27, $18
    db $01, $26, $18
    db $01, $24, $18
    db $01, $20, $18
    db PATTERN_END

; Channel 1.
Pattern_33:
    db $01, $28, $18
    db $01, $26, $18
    db $01, $24, $18
    db $01, $1f, $18
    db $01, $28, $18
    db $01, $26, $18
    db $01, $24, $18
    db $01, $1f, $18
    db $08, $27, $18
    db PATTERN_END

; Channel 1.
Pattern_34:
    db $01, $28, $18
    db $01, $26, $18
    db $01, $24, $18
    db $01, $1f, $18
    db $01, $28, $18
    db $01, $26, $18
    db $01, $24, $18
    db $01, $1f, $18
    db $08, $27, $18
    db PATTERN_JUMP
    dw Song_Level2_Ch1

; Channel 2.
Pattern_35:
    db $01, $1c, $19
    db $01, $1a, $19
    db $02, $18, $19
    db $01, $1c, $19
    db $01, $1a, $19
    db $02, $18, $19
    db $01, $18, $19
    db $01, $1a, $19
    db $02, $1b, $19
    db $01, $18, $19
    db $01, $1a, $19
    db $02, $1b, $19
    db PATTERN_JUMP
    dw Song_Level2_Ch2

; Channel 3.
Pattern_36:
    db $02, $18, $15
    db $02, $30, $08
    db $02, $13, $15
    db $02, $30, $08
    db $02, $14, $15
    db $02, $30, $07
    db $02, $0f, $15
    db $02, $30, $07
    db PATTERN_JUMP
    dw Song_Level2_Ch3

; Channel 1.
Pattern_37:
    db $04, $0c, $1e
    db $04, $1c, $06
    db $04, $0c, $1e
    db $03, $1c, $06
    db $01, $0c, $1e
    db PATTERN_END

; Channel 1.
Pattern_38:
    db $02, $0c, $1e
    db $02, $0c, $1e
    db $03, $1c, $06
    db $01, $0c, $1e
    db $04, $0c, $1e
    db $03, $1c, $06
    db $01, $0c, $1e
    db PATTERN_END

; Channel 1.
Pattern_39:
    db $02, $0c, $1e
    db $02, $0c, $1e
    db $03, $1c, $06
    db $01, $0c, $1e
    db $04, $0c, $1e
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db PATTERN_END

; Channel 1.
Pattern_3A:
    db $02, $0c, $1e
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $1c, $06
    db $02, $0c, $1e
    db $02, $0c, $1e
    db $01, $0c, $1e
    db $02, $0c, $1e
    db $03, $1c, $06
    db $01, $0c, $1e
    db PATTERN_END

; Channel 1.
Pattern_3B:
    db $02, $0c, $1e
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $1c, $06
    db $02, $0c, $1e
    db $02, $0c, $1e
    db $01, $0c, $1e
    db $02, $0c, $1e
    db $01, $1c, $06
    db $01, $1c, $06
    db $02, $1c, $06
    db PATTERN_END

; Channel 1.
Pattern_3C:
    db $02, $0c, $1e
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $1c, $06
    db $02, $0c, $1e
    db $01, $0c, $1e
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db PATTERN_END

; Channel 3.
Pattern_3D:
    db $01, $0b, $15
    db $01, ROW_RELEASE
    db $01, $0b, $15
    db $01, ROW_RELEASE
    db $02, $0e, $15
    db $01, ROW_RELEASE
    db $02, $11, $15
    db $01, ROW_RELEASE
    db $01, $0e, $15
    db $05, ROW_RELEASE
    db PATTERN_END

; Channel 3.
Pattern_4D:
    db $01, $0b, $15
    db $01, ROW_RELEASE
    db $01, $0b, $15
    db $01, ROW_RELEASE
    db $02, $0e, $15
    db $01, ROW_RELEASE
    db $02, $11, $15
    db $01, ROW_RELEASE
    db $01, $0e, $15
    db $05, ROW_RELEASE
    db PATTERN_JUMP
    dw Song_Level3_Ch3

; Channel 2.
Pattern_3E:
    db $01, $1e, $19
    db $01, $1d, $19
    db $07, $23, $19
    db $01, $1d, $19
    db $01, $1e, $19
    db $02, $23, $19
    db $01, $1d, $19
    db $01, $1e, $19
    db $01, $23, $19
    db PATTERN_END

; Channel 1.
Pattern_3F:
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $02, $0c, $1e
    db $01, $1c, $06
    db $01, $1c, $06
    db $02, $1c, $06
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $02, $1c, $06
    db $01, $0c, $1e
    db $01, $1c, $06
    db $01, $1c, $06
    db PATTERN_END

; Channel 1.
Pattern_40:
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $02, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $02, $1c, $06
    db $01, $0c, $1e
    db $01, $1c, $06
    db $01, $1c, $06
    db PATTERN_END

; Channel 1.
Pattern_41:
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $02, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db PATTERN_END

; Channel 1.
Pattern_4B:
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $02, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $0c, $1e
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db $01, $1c, $06
    db PATTERN_JUMP
    dw Song_Level3_Ch1

; Channel 4.
Pattern_42:
    db $04, $0c, $02
    db $04, $1c, $01
    db $04, $0c, $02
    db $03, $1c, $01
    db $01, $0c, $02
    db PATTERN_END

; Channel 4.
Pattern_43:
    db $02, $0c, $02
    db $02, $0c, $02
    db $03, $1c, $01
    db $01, $0c, $02
    db $04, $0c, $02
    db $03, $1c, $01
    db $01, $0c, $02
    db PATTERN_END

; Channel 4.
Pattern_44:
    db $02, $0c, $02
    db $02, $0c, $02
    db $03, $1c, $01
    db $01, $0c, $02
    db $04, $0c, $02
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db PATTERN_END

; Channel 4.
Pattern_45:
    db $02, $0c, $02
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $1c, $01
    db $02, $0c, $02
    db $02, $0c, $02
    db $01, $0c, $02
    db $02, $0c, $02
    db $03, $1c, $01
    db $01, $0c, $02
    db PATTERN_END

; Channel 4.
Pattern_46:
    db $02, $0c, $02
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $1c, $01
    db $02, $0c, $02
    db $02, $0c, $02
    db $01, $0c, $02
    db $02, $0c, $02
    db $01, $1c, $01
    db $01, $1c, $01
    db $02, $1c, $01
    db PATTERN_END

; Channel 4.
Pattern_47:
    db $02, $0c, $02
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $1c, $01
    db $02, $0c, $02
    db $01, $0c, $02
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db PATTERN_END

; Channel 4.
Pattern_48:
    db $01, $0c, $02
    db $01, $0c, $02
    db $02, $0c, $02
    db $01, $1c, $01
    db $01, $1c, $01
    db $02, $1c, $01
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $0c, $02
    db $02, $1c, $01
    db $01, $0c, $02
    db $01, $1c, $01
    db $01, $1c, $01
    db PATTERN_END

; Channel 4.
Pattern_49:
    db $01, $0c, $02
    db $01, $0c, $02
    db $02, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $0c, $02
    db $02, $1c, $01
    db $01, $0c, $02
    db $01, $1c, $01
    db $01, $1c, $01
    db PATTERN_END

; Channel 4.
Pattern_4A:
    db $01, $0c, $02
    db $01, $0c, $02
    db $02, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db PATTERN_END

; Channel 4.
Pattern_4E:
    db $01, $0c, $02
    db $01, $0c, $02
    db $02, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $0c, $02
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db $01, $1c, $01
    db PATTERN_JUMP
    dw Song_Level3_Ch4

; Channel 2.
Pattern_4C:
    db $10, ROW_HOLD
    db PATTERN_JUMP
    dw Song_Level3_Ch2

; Channel 3.
Pattern_4F:
    db $01, $30, $07
    db $03, $30, $07
    db $03, $30, $07
    db $02, $30, $07
    db $01, $30, $07
    db $02, $30, $07
    db $02, $30, $07
    db $02, $30, $07
    db PATTERN_END

; Channel 3.
Pattern_50:
    db $01, $33, $08
    db $03, $33, $08
    db $03, $33, $08
    db $02, $33, $08
    db $01, $33, $08
    db $02, $33, $08
    db $02, $33, $08
    db $02, $33, $08
    db PATTERN_END

; Channel 1.
Pattern_51:
    db $03, $08, $01
    db $01, $08, $01
    db $02, $1c, $06
    db $03, $08, $01
    db $03, $08, $01
    db $02, $1c, $06
    db $02, $03, $01
    db PATTERN_END

; Channel 2.
Pattern_52:
    db $01, $24, $19
    db $01, $24, $19
    db $01, $25, $19
    db $01, $27, $19
    db $01, $24, $19
    db $01, $25, $19
    db $01, $27, $19
    db $01, $24, $19
    db $01, $25, $19
    db $01, $27, $19
    db $01, $24, $19
    db $01, $25, $19
    db $01, $27, $19
    db $01, $24, $19
    db $01, $25, $19
    db $01, $27, $19
    db PATTERN_END

; Channel 1.
Pattern_53:
    db $03, $08, $01
    db $01, $08, $01
    db $02, $1c, $06
    db $03, $08, $01
    db $03, $08, $01
    db $02, $1c, $06
    db $02, $03, $01
    db PATTERN_JUMP
    dw Song_MainMenu_Ch1

; Channel 2.
Pattern_54:
    db $01, $24, $19
    db $01, $24, $19
    db $01, $25, $19
    db $01, $27, $19
    db $01, $24, $19
    db $01, $25, $19
    db $01, $27, $19
    db $01, $24, $19
    db $01, $25, $19
    db $01, $27, $19
    db $01, $24, $19
    db $01, $25, $19
    db $01, $27, $19
    db $01, $24, $19
    db $01, $25, $19
    db $01, $27, $19
    db PATTERN_JUMP
    dw Song_MainMenu_Ch2

; Channel 3.
Pattern_55:
    db $01, $30, $07
    db $03, $30, $07
    db $03, $30, $07
    db $02, $30, $07
    db $01, $30, $07
    db $02, $30, $07
    db $02, $30, $07
    db $02, $30, $07
    db PATTERN_JUMP
    dw Song_MainMenu_Ch3

; Channel 2.
Pattern_56:
    db $10, $20, $23
    db PATTERN_END

; Channel 2.
Pattern_57:
    db $04, ROW_HOLD
    db $02, ROW_RELEASE
    db $02, $1b, $23
    db $02, $20, $23
    db $02, $22, $23
    db $04, $24, $23
    db PATTERN_END

; Channel 2.
Pattern_58:
    db $04, $22, $23
    db $01, $1b, $23
    db $01, $1d, $23
    db $0a, $1b, $23
    db PATTERN_END

; Channel 2.
Pattern_59:
    db $04, ROW_HOLD
    db $02, ROW_RELEASE
    db $02, $1f, $23
    db $02, $1f, $24
    db $02, $1d, $23
    db $02, $1b, $23
    db $02, $1e, $23
    db PATTERN_END

; Channel 2.
Pattern_5A:
    db $0c, ROW_HOLD
    db $04, ROW_RELEASE
    db PATTERN_END

; Channel 2.
Pattern_5B:
    db $06, $1e, $23
    db $01, $1d, $23
    db $01, $1b, $23
    db $04, $17, $23
    db $04, $1e, $23
    db PATTERN_END

; Channel 2.
Pattern_5C:
    db $10, $1f, $24
    db PATTERN_END

; Channel 2.
Pattern_5D:
    db $10, ROW_RELEASE
    db PATTERN_END

; Channel 2.
Pattern_5E:
    db $04, $23, $23
    db $02, ROW_RELEASE
    db $02, $1e, $23
    db $08, $27, $23
    db PATTERN_END

; Channel 2.
Pattern_5F:
    db $04, ROW_HOLD
    db $04, $23, $23
    db $04, $2a, $23
    db $04, $2f, $24
    db PATTERN_END

; Channel 2.
Pattern_60:
    db $01, $2e, $23
    db $01, $2a, $23
    db $01, $29, $23
    db $0d, $27, $23
    db PATTERN_END

; Channel 2.
Pattern_61:
    db $04, ROW_RELEASE
    db $04, $22, $24
    db $04, $20, $23
    db $04, $1e, $23
    db PATTERN_END

; Channel 2.
Pattern_62:
    db $0e, $1e, $23
    db $02, ROW_RELEASE
    db PATTERN_END

; Channel 2.
Pattern_63:
    db $01, $21, $23
    db $01, $20, $23
    db $04, $1e, $23
    db $02, ROW_RELEASE
    db $03, $21, $23
    db $01, ROW_RELEASE
    db $03, $2a, $23
    db $01, ROW_RELEASE
    db PATTERN_END

; Channel 2.
Pattern_64:
    db $10, $28, $24
    db PATTERN_END

; Channel 2.
Pattern_65:
    db $0c, ROW_HOLD
    db $04, ROW_RELEASE
    db PATTERN_JUMP
    dw Song_HighScores_Ch2

; Channel 1, 2.
Pattern_66:
    db $01, $24, $25
    db $01, $23, $25
    db $01, $22, $25
    db $01, $21, $25
    db $01, $20, $25
    db $01, $1f, $25
    db $01, $1e, $25
    db $01, $1d, $25
    db $01, $1c, $25
    db $01, $1b, $25
    db $01, $1a, $25
    db $01, $19, $25
    db $01, $18, $25
    db $01, $17, $25
    db $01, $16, $25
    db $01, $15, $25
    db $01, $14, $25
    db $01, $13, $25
    db $01, $12, $25
    db $01, $11, $25
    db $01, $10, $25
    db $01, $0f, $25
    db $01, $0e, $25
    db $01, $0d, $25
    db $10, $0c, $25
    db $0c, ROW_RELEASE
    db PATTERN_JUMP
    dw Song_Silence_Ch2

; Channel 2.
Pattern_67:
    db $01, ROW_HOLD
    db PATTERN_END

; Channel 1.
Pattern_68:
    db $02, $1f, $05
    db $02, ROW_RETRIGGER
    db $02, ROW_RETRIGGER
    db $02, ROW_RETRIGGER
    db $02, ROW_RETRIGGER
    db $02, ROW_RETRIGGER
    db $02, ROW_RETRIGGER
    db $02, ROW_RETRIGGER
    db PATTERN_END

; Channel 1.
Pattern_76:
    db $02, $1f, $05
    db $02, ROW_RETRIGGER
    db $02, ROW_RETRIGGER
    db $02, ROW_RETRIGGER
    db $02, ROW_RETRIGGER
    db $02, ROW_RETRIGGER
    db $02, ROW_RETRIGGER
    db $02, ROW_RETRIGGER
    db PATTERN_JUMP
    dw Song_Ending_Ch1

; Channel 3.
Pattern_69:
    db $02, $28, $02
    db $02, $18, $15
    db $02, $29, $02
    db $02, $18, $15
    db $02, $2b, $02
    db $02, $18, $15
    db $02, $28, $02
    db $02, $18, $15
    db PATTERN_END

; Channel 3.
Pattern_6A:
    db $02, $2b, $02
    db $02, $18, $15
    db $02, $29, $02
    db $02, $18, $15
    db $02, $28, $02
    db $02, $18, $15
    db $02, $2b, $02
    db $02, $18, $15
    db PATTERN_END

; Channel 2.
Pattern_6B:
    db $04, $1c, $24
    db $02, ROW_RELEASE
    db $02, $18, $23
    db $08, $1f, $23
    db PATTERN_END

; Channel 2.
Pattern_6C:
    db $04, ROW_HOLD
    db $02, ROW_RELEASE
    db $01, $1c, $23
    db $01, $1d, $23
    db $02, $1f, $23
    db $02, $1d, $23
    db $02, $1c, $23
    db $02, $1a, $23
    db PATTERN_END

; Channel 2.
Pattern_6D:
    db $06, ROW_HOLD
    db $02, ROW_RELEASE
    db $08, $1f, $23
    db PATTERN_END

; Channel 2.
Pattern_6E:
    db $04, ROW_HOLD
    db $04, $1f, $24
    db $04, $21, $23
    db $04, $23, $23
    db PATTERN_END

; Channel 2.
Pattern_6F:
    db $06, $24, $24
    db $01, $23, $23
    db $01, $24, $23
    db $08, $21, $23
    db PATTERN_END

; Channel 2.
Pattern_70:
    db $06, ROW_HOLD
    db $02, ROW_RELEASE
    db $08, $1d, $23
    db PATTERN_END

; Channel 2.
Pattern_71:
    db $01, $1c, $23
    db $01, $1d, $23
    db $0a, $1f, $23
    db $02, ROW_RELEASE
    db $01, $1d, $23
    db $01, $1c, $23
    db PATTERN_END

; Channel 2.
Pattern_72:
    db $0c, $1a, $23
    db $04, ROW_RELEASE
    db PATTERN_END

; Channel 2.
Pattern_73:
    db $04, $17, $23
    db $04, $18, $23
    db $04, $1a, $23
    db $04, $1f, $24
    db PATTERN_END

; Channel 2.
Pattern_74:
    db $01, $2b, $23
    db $01, $26, $23
    db $02, $23, $23
    db $01, $26, $23
    db $01, $23, $23
    db $02, $1f, $23
    db $01, $23, $23
    db $01, $1f, $23
    db $02, $1a, $23
    db $01, $1f, $23
    db $01, $1a, $23
    db $02, $17, $23
    db PATTERN_END

; Channel 2.
Pattern_77:
    db $01, $2b, $23
    db $01, $26, $23
    db $02, $23, $23
    db $01, $26, $23
    db $01, $23, $23
    db $02, $1f, $23
    db $01, $23, $23
    db $01, $1f, $23
    db $02, $1a, $23
    db $01, $1f, $23
    db $01, $1a, $23
    db $02, $17, $23
    db PATTERN_JUMP
    dw Song_Ending_Ch2

; Channel 3.
Pattern_75:
    db $02, $24, $02
    db $02, $18, $15
    db $02, $1f, $02
    db $02, $18, $15
    db $02, $1c, $02
    db $02, $18, $15
    db $02, $18, $02
    db $02, $18, $15
    db PATTERN_END

; Channel 3.
Pattern_78:
    db $02, $2b, $02
    db $02, $18, $15
    db $02, $29, $02
    db $02, $18, $15
    db $02, $28, $02
    db $02, $18, $15
    db $02, $2b, $02
    db $02, $18, $15
    db PATTERN_JUMP
    dw Song_Ending_Ch3

; Channel 3.
Pattern_79:
    db $02, $30, $08
    db $02, $30, $08
    db $02, $30, $09
    db $02, $30, $09
    db $02, $30, $0a
    db $02, $30, $0a
    db $02, $30, $0b
    db $02, $30, $0b
    db PATTERN_END

; Channel 3.
Pattern_7A:
    db $02, $30, $0a
    db $02, $30, $0a
    db $02, $30, $09
    db $02, $30, $09
    db $02, $30, $08
    db $02, $30, $08
    db $02, $30, $07
    db $02, $30, $07
    db PATTERN_END

; Channel 1.
Pattern_7B:
    db $02, $0c, $01
    db $01, $0c, $01
    db $01, ROW_RELEASE
    db $02, $1c, $06
    db $02, $0c, $01
    db $02, $0b, $01
    db $01, $0c, $01
    db $01, ROW_RELEASE
    db $02, $1c, $06
    db $02, $00, $01
    db PATTERN_END

; Channel 2.
Pattern_7C:
    db $01, $18, $23
    db $03, ROW_RELEASE
    db $04, $24, $23
    db $01, $16, $23
    db $01, $17, $23
    db $02, $18, $23
    db $02, $13, $23
    db $02, $0c, $23
    db PATTERN_END

; Channel 1.
Pattern_7D:
    db $02, $0c, $01
    db $01, $0c, $01
    db $01, ROW_RELEASE
    db $02, $1c, $06
    db $02, $0c, $01
    db $02, $0b, $01
    db $01, $0c, $01
    db $01, ROW_RELEASE
    db $02, $1c, $06
    db $02, $00, $01
    db PATTERN_JUMP
    dw Song_Credits_Ch1

; Channel 2.
Pattern_7E:
    db $01, $18, $23
    db $03, ROW_RELEASE
    db $04, $24, $23
    db $01, $16, $23
    db $01, $17, $23
    db $02, $18, $23
    db $02, $13, $23
    db $02, $0c, $23
    db PATTERN_JUMP
    dw Song_Credits_Ch2

; Channel 3.
Pattern_7F:
    db $02, $30, $0a
    db $02, $30, $0a
    db $02, $30, $09
    db $02, $30, $09
    db $02, $30, $08
    db $02, $30, $08
    db $02, $30, $07
    db $02, $30, $07
    db PATTERN_JUMP
    dw Song_Credits_Ch3

; Nothing points here.
Sfx_Unused_5ce6:
    db $01, $24, $0a
    db $01, ROW_RELEASE
    db SFX_END, $00, $00

; Sound effect 1: priority 10, pulse channel 2.
Sfx_01:
    db $05, $24, $2a
    db SFX_END, $00, $00

; Sound effect 2: priority 10, pulse channel 2.
Sfx_02:
    db $07, $2b, $2b
    db SFX_END, $00, $00

; Sound effect 3: priority 10, pulse channel 2.
Sfx_03:
    db $05, $2b, $2c
    db SFX_END, $00, $00

; Sound effect 4: priority 10, pulse channel 2.
Sfx_04:
    db $04, $24, $2d
    db SFX_END, $00, $00

; Sound effect 5: priority 20, pulse channel 2.
Sfx_05:
    db $03, $24, $2e
    db $03, ROW_RELEASE
    db SFX_END, $00, $00

; Sound effect 6: priority 50, pulse channel 2.
Sfx_06:
    db $08, $28, $2f
    db SFX_END, $00, $00

; Sound effect 7: priority 50, pulse channel 2.
Sfx_07:
    db $08, $28, $30
    db SFX_END, $00, $00

; Sound effect 11: priority 40, noise channel.
Sfx_11:
    db $0a, $24, $0b
    db SFX_END, $00, $00

; Sound effect 13: priority 20, noise channel.
Sfx_13:
    db $02, $24, $0c
    db $06, ROW_RELEASE
    db SFX_END, $00, $00

; Sound effect 8: priority 20, pulse channel 2.
Sfx_08:
    db $0c, $28, $31
    db SFX_END, $00, $00

; Sound effect 9: priority 30, pulse channel 2.
Sfx_09:
    db $02, $1f, $32
    db SFX_END, $00, $00

; Sound effect 12: priority 20, pulse channel 2.
Sfx_12:
    db $01, $30, $33
    db $01, ROW_RELEASE
    db SFX_END, $00, $00

; Sound effect 15: priority 21, pulse channel 2.
Sfx_15:
    db $03, $29, $34
    db SFX_END, $00, $00

; Sound effect 22: priority 50, pulse channel 2.
Sfx_22:
    db $01, $3c, $35
    db $01, ROW_HOLD
    db $01, $3c, $35
    db $01, ROW_HOLD
    db $01, $3c, $35
    db $01, ROW_HOLD
    db $01, $3c, $35
    db $01, ROW_HOLD
    db $01, $3c, $35
    db $01, ROW_HOLD
    db $01, $3c, $35
    db $01, ROW_HOLD
    db SFX_END, $00, $00

; Sound effect 16: priority 40, pulse channel 2.
Sfx_16:
    db $01, $2b, $36
    db $02, ROW_RELEASE
    db SFX_END, $00, $00

; Sound effect 10: priority 60, noise channel.
Sfx_10:
    db $0a, $24, $0d
    db SFX_END, $00, $00

; Sound effect 14: priority 20, noise channel.
Sfx_14:
    db $06, $24, $0e
    db SFX_END, $00, $00

; Sound effect 17: priority 40, noise channel.
Sfx_17:
    db $08, $24, $0f
    db SFX_END, $00, $00

; Sound effect 18: priority 40, noise channel.
Sfx_18:
    db $04, $18, $10
    db $02, ROW_RELEASE
    db SFX_END, $00, $00

; Sound effect 20: priority 40, noise channel.
Sfx_20:
    db $06, $24, $11
    db SFX_END, $00, $00

; Sound effect 21: priority 40, pulse channel 2.
Sfx_21:
    db $0a, $21, $37
    db SFX_END, $00, $00

; Sound effect 19: priority 40, pulse channel 2.
Sfx_19:
    db $05, $37, $38
    db SFX_END, $00, $00

; Sound effect 28: priority 100, noise channel.
Sfx_28:
    db $0d, $30, $12
    db SFX_END, $00, $00

; Sound effect 23: priority 50, pulse channel 2.
Sfx_23:
    db $06, $2d, $39
    db $05, ROW_RELEASE
    db SFX_END, $00, $00

; Sound effect 24: priority 50, pulse channel 2.
Sfx_24:
    db $06, $2b, $3a
    db $06, ROW_RELEASE
    db SFX_END, $00, $00

; Sound effect 25: priority 60, noise channel.
Sfx_25:
    db $01, $24, $13
    db SFX_END, $00, $00

; Sound effect 26: priority 100, pulse channel 2.
Sfx_26:
    db $0a, $29, $3b
    db SFX_END, $00, $00

; Sound effect 27: priority 100, noise channel.
Sfx_27:
    db $0a, $24, $14
    db $09, ROW_RELEASE
    db SFX_END, $00, $00

; Sound effect 0: priority 127, noise channel.
Sfx_00:
    db $01, $24, $00
    db SFX_END, $00, $00

; Sound effect 29: priority 80, pulse channel 2.
Sfx_29:
    db $03, $24, $3c
    db $01, ROW_RELEASE
    db $03, $25, $3c
    db $01, ROW_RELEASE
    db $03, $24, $3c
    db $01, ROW_RELEASE
    db $03, $25, $3c
    db $01, ROW_RELEASE
    db $03, $24, $3c
    db $01, ROW_RELEASE
    db $03, $25, $3c
    db $01, ROW_RELEASE
    db $03, $24, $3c
    db $01, ROW_RELEASE
    db $03, $25, $3c
    db $01, ROW_RELEASE
    db $03, $24, $3c
    db $01, ROW_RELEASE
    db $03, $25, $3c
    db $01, ROW_RELEASE
    db SFX_END, $00, $00

; Nothing points here.
Pattern_Unused_5dfc:
    db $10, ROW_RELEASE
    db PATTERN_JUMP
    dw Order_Silence

PitchMode_00:
    db $01, $01
    db $01, $00
    db TABLE_END
    dw PitchMode_00

PitchMode_01:
    db $ff, $00
    db TABLE_END
    dw PitchMode_01

PitchMode_02:
    db $ff, $01
    db TABLE_END
    dw PitchMode_02

PitchMode_03:
    db $ff, $02
    db TABLE_END
    dw PitchMode_03

Arpeggio_00:
    db $ff, $00
    db TABLE_END
    dw Arpeggio_00

PitchSlide_00:
    db $ff, $00, $00
    db TABLE_END
    dw PitchSlide_00

; Nothing points here.
Table_00:
    db $ff, $00
    db TABLE_END
    dw Table_00

; Nothing points here.
PitchSlide_01:
    db $14, $00, $00
.loop:
    db $02, $01, $00
    db $02, $ff, $ff
    db $02, $ff, $ff
    db $02, $01, $00
    db TABLE_END
    dw PitchSlide_01.loop

; Nothing points here.
PitchSlide_02:
    db $03, $0a, $00
    db $03, $f6, $ff
    db $03, $f6, $ff
    db $03, $0a, $00
    db TABLE_END
    dw PitchSlide_02

PitchSlide_03:
    db $03, $05, $00
    db $03, $fb, $ff
    db $03, $fb, $ff
    db $03, $05, $00
    db TABLE_END
    dw PitchSlide_03

PitchSlide_04:
    db $14, $00, $00
.loop:
    db $03, $02, $00
    db $03, $fe, $ff
    db $03, $fe, $ff
    db $03, $02, $00
    db TABLE_END
    dw PitchSlide_04.loop

PitchSlide_05:
    db $03, $01, $00
    db $03, $ff, $ff
    db $03, $ff, $ff
    db $03, $01, $00
    db TABLE_END
    dw PitchSlide_05

; Pulse instrument $00, not used.
Instrument_00:
    db $80, $01, $00
    dw Arpeggio_00 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

; Noise instrument $02.
NoiseInstrument_02:
    db $00, $51, $91
    dw NoiseShape_00 - 1, Arpeggio_00 - 1

NoiseShape_00:
    db $ff, $44
    db TABLE_END
    dw NoiseShape_00

; Noise instrument $04, not used.
NoiseInstrument_04:
    db $00, $47, $01
    dw NoiseShape_01 - 1, Arpeggio_00 - 1

; Noise instrument $03.
NoiseInstrument_03:
    db $20, $41, $01
    dw NoiseShape_01 - 1, NoiseShape_01 - 1

NoiseShape_01:
    db $ff, $13
    db TABLE_END
    dw NoiseShape_01

; Noise instrument $01.
NoiseInstrument_01:
    db $80, $44, $01
    dw NoiseShape_02 - 1, Arpeggio_00 - 1

NoiseShape_02:
    db $ff, $32
    db TABLE_END
    dw NoiseShape_02

; Wave instrument $02.
Instrument_02:
    dw WaveVolume_00 - 1, WaveVolume_Silent - 1
    dw Arpeggio_00 - 1, PitchSlide_16.entry - 2, PitchMode_03 - 1

WaveVolume_00:
    db $04, $20
    db $ff, $40
    db TABLE_END
    dw WaveVolume_00

; Wave instrument $0e, $29.
Instrument_0E:
Instrument_29:
    dw WaveVolume_02.loop - 1, WaveVolume_Silent - 1
    dw Arpeggio_00 - 1, PitchSlide_16 - 2, PitchMode_03 - 1

; Wave instrument $1f, not used.
Instrument_1F:
    dw WaveVolume_02.loop - 1, WaveVolume_Silent - 1
    dw Arpeggio_01 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

Arpeggio_01:
    db $01, $0c
    db $ff, $00
    db TABLE_END
    dw Arpeggio_01

; Wave instrument $1b, not used.
Instrument_1B:
    dw WaveVolume_02.loop - 1, WaveVolume_Silent - 1
    dw Arpeggio_00 - 1, PitchSlide_05 - 2, PitchMode_03 - 1

; Wave instrument $26, not used.
Instrument_26:
    dw WaveVolume_02.loop - 1, WaveVolume_Silent - 1
    dw Arpeggio_00 - 1, PitchSlide_06 - 2, PitchMode_03 - 1

PitchSlide_06:
    db $03, $02, $00
    db $03, $fe, $ff
    db $03, $fe, $ff
    db $03, $02, $00
    db $03, $02, $00
    db $03, $fe, $ff
    db $03, $fe, $ff
    db $03, $02, $00
    db $03, $02, $00
    db $03, $fe, $ff
    db $03, $fe, $ff
    db $03, $02, $00
    db $03, $02, $00
    db $03, $fe, $ff
    db $03, $fe, $ff
    db $03, $02, $00
    db $03, $02, $00
    db $03, $fe, $ff
    db $03, $fe, $ff
    db $03, $02, $00
    db $03, $02, $00
    db $03, $fe, $ff
    db $03, $fe, $ff
.loop:
    db $04, $fc, $ff
    db $04, $03, $00
    db TABLE_END
    dw PitchSlide_06.loop

; Wave instrument $1a, not used.
Instrument_1A:
    dw WaveVolume_01 - 1, WaveVolume_Silent - 1
    dw Arpeggio_00 - 1, PitchSlide_07 - 2, PitchMode_03 - 1

WaveVolume_01:
    db $28, $20
    db $64, $40
    db $ff, $60
    db TABLE_END
    dw WaveVolume_01

PitchSlide_07:
    db $1e, $00, $00
.loop:
    db $04, $01, $00
    db $04, $ff, $ff
    db TABLE_END
    dw PitchSlide_07.loop

; Wave instrument $17, not used.
Instrument_17:
    dw WaveVolume_02.loop - 1, WaveVolume_03 - 1
    dw Arpeggio_00 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

WaveVolume_02:
    db $03, $60
    db $03, $40
.loop:
    db $ff, $20
    db TABLE_END
    dw WaveVolume_02.loop

WaveVolume_03:
    db $04, $40
    db $ff, $60
    db TABLE_END
    dw WaveVolume_03

; Not in the instrument tables.
Instrument_Unused_5f73:
    dw WaveVolume_04 - 1, WaveVolume_Silent - 1
    dw Arpeggio_00 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

WaveVolume_04:
    db $06, $20
    db $ff, $40
    db TABLE_END
    dw WaveVolume_Silent

; Nothing points here.
WaveVolume_05:
    db $ff, $60
    db TABLE_END
    dw WaveVolume_05

; Nothing points here.
WaveVolume_06:
    db $02, $20
    db $ff, $40
    db TABLE_END
    dw WaveVolume_06

WaveVolume_07:
    db $02, $20
    db $08, $40
    db $ff, $60
    db TABLE_END
    dw WaveVolume_Silent

; Wave instrument $27, not used.
Instrument_27:
    dw WaveVolume_08 - 1, WaveVolume_09 - 1
    dw Arpeggio_02 - 1, PitchSlide_05 - 2, PitchMode_03 - 1

WaveVolume_08:
    db $0a, $60
    db $0a, $40
    db $ff, $20
    db TABLE_END
    dw WaveVolume_02.loop

WaveVolume_09:
    db $0a, $40
    db $ff, $60
    db TABLE_END
    dw WaveVolume_Silent

Arpeggio_02:
    db $01, $00
    db $01, $03
    db $01, $07
    db $01, $0c
    db $01, $07
    db $01, $03
    db TABLE_END
    dw Arpeggio_02

; Wave instrument $07.
Instrument_07:
    dw WaveVolume_07 - 1, WaveVolume_Silent - 1
    dw Arpeggio_03 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

; Wave instrument $08.
Instrument_08:
    dw WaveVolume_07 - 1, WaveVolume_Silent - 1
    dw Arpeggio_04 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

; Wave instrument $09.
Instrument_09:
    dw WaveVolume_07 - 1, WaveVolume_Silent - 1
    dw Arpeggio_05 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

; Wave instrument $0a.
Instrument_0A:
    dw WaveVolume_07 - 1, WaveVolume_Silent - 1
    dw Arpeggio_06 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

; Wave instrument $0b.
Instrument_0B:
    dw WaveVolume_07 - 1, WaveVolume_Silent - 1
    dw Arpeggio_07 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

; Wave instrument $0c.
Instrument_0C:
    dw WaveVolume_07 - 1, WaveVolume_Silent - 1
    dw Arpeggio_08 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

; Wave instrument $0d.
Instrument_0D:
    dw WaveVolume_07 - 1, WaveVolume_Silent - 1
    dw Arpeggio_09 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

; Wave instrument $12, not used.
Instrument_12:
    dw WaveVolume_07 - 1, WaveVolume_Silent - 1
    dw Arpeggio_10 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

Arpeggio_03:
    db $02, $fc
    db $02, $00
    db $02, $03
    db TABLE_END
    dw Arpeggio_03

Arpeggio_04:
    db $02, $fb
    db $02, $00
    db $02, $04
    db TABLE_END
    dw Arpeggio_04

Arpeggio_05:
    db $02, $00
    db $02, $05
    db TABLE_END
    dw Arpeggio_05

Arpeggio_06:
    db $02, $00
    db $02, $06
    db TABLE_END
    dw Arpeggio_06

Arpeggio_07:
    db $02, $00
    db $02, $07
    db TABLE_END
    dw Arpeggio_07

Arpeggio_08:
    db $02, $00
    db $02, $08
    db TABLE_END
    dw Arpeggio_08

Arpeggio_09:
    db $02, $00
    db $02, $09
    db TABLE_END
    dw Arpeggio_09

Arpeggio_10:
    db $02, $00
    db $02, $0a
    db TABLE_END
    dw Arpeggio_10

; Pulse instrument $1c, not used.
Instrument_1C:
    db $80, $38, $21
    dw Arpeggio_12 - 1, PitchSlide_08 - 2, PitchMode_03 - 1

; Nothing points here.
Table_01:
    db $01, $05
    db $01, $09
    db $01, $f4
    db $01, $0d
    db $01, $ec
    db $01, $28
    db $01, $14
    db $01, $fe
    db $01, $08
    db $01, $02
    db $01, $01
    db $01, $13
    db $01, $28
    db $01, $1e
    db $01, $05
    db $01, $07
    db $01, $02
    db $01, $ec
    db $01, $05
    db TABLE_END
    dw Table_01

PitchSlide_08:
    db $14, $05, $00
    db $14, $fa, $ff
    db TABLE_END
    dw PitchSlide_08

; Pulse instrument $04.
Instrument_04:
    db $80, $c1, $21
    dw Arpeggio_11 - 1, PitchSlide_05 - 2, PitchMode_03 - 1

Arpeggio_11:
    db $01, $0c
    db $01, $00
    db $01, $08
    db $01, $05
    db $01, $00
    db TABLE_END
    dw Arpeggio_11

Arpeggio_12:
    db $02, $00
    db $02, $03
    db $02, $08
    db TABLE_END
    dw Arpeggio_12

; Pulse instrument $28, not used.
Instrument_28:
    db $00, $1f, $f7
    dw Arpeggio_13 - 1, PitchSlide_05 - 2, PitchMode_03 - 1

Arpeggio_13:
    db $04, $00
    db $04, $03
    db $04, $06
    db $04, $09
    db $04, $0c
    db $04, $0f
    db TABLE_END
    dw Arpeggio_13

; Pulse instrument $20, not used.
Instrument_20:
    db $80, $b3, $21
    dw Arpeggio_14 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

Arpeggio_14:
    db $02, $00
    db $02, $05
    db $02, $0a
    db TABLE_END
    dw Arpeggio_14

; Pulse instrument $23.
Instrument_23:
    db $80, $a8, $a4
    dw Arpeggio_00 - 1, PitchSlide_04 - 2, PitchMode_03 - 1

PitchSlide_09:
    db $01, $ec, $ff
    db $05, $04, $00
    db TABLE_END
    dw PitchSlide_04

; Pulse instrument $22, $24.
Instrument_22:
Instrument_24:
    db $80, $a8, $a4
    dw Arpeggio_00 - 1, PitchSlide_09 - 2, PitchMode_03 - 1

; Not in the instrument tables.
Instrument_Unused_60ed:
    db $00, $f2, $21
    dw Arpeggio_03 - 1, PitchSlide_04.loop - 2, PitchMode_03 - 1

; Pulse instrument $25.
Instrument_25:
    db $40, $e8, $e7
    dw Arpeggio_07 - 1, PitchSlide_10 - 2, PitchMode_03 - 1

PitchSlide_10:
    db $03, $01, $00
    db $03, $ff, $ff
    db $03, $01, $00
    db $03, $ff, $ff
.loop:
    db $04, $02, $00
    db $04, $ec, $ff
    db TABLE_END
    dw PitchSlide_10.loop

; Pulse instrument $05.
Instrument_05:
    db $80, $c2, $21
    dw Arpeggio_15 - 1, PitchSlide_11 - 2, PitchMode_03 - 1

PitchSlide_11:
    db $5a, $00, $00
    db $ff, $ff, $ff
    db TABLE_END
    dw PitchSlide_11

Arpeggio_15:
    db $01, $00
    db $01, $05
    db $01, $09
    db TABLE_END
    dw Arpeggio_15

; Pulse instrument $1e.
Instrument_1E:
    db $80, $e1, $21
    dw Arpeggio_16 - 1, PitchSlide_12 - 2, PitchMode_01 - 1

PitchSlide_12:
    db $01, $4c, $04
    db $01, $64, $00
    db $ff, $b0, $ff
    db TABLE_END
    dw PitchSlide_12

; Pulse instrument $06.
Instrument_06:
    db $80, $f1, $21
    dw Arpeggio_16 - 1, PitchSlide_13 - 2, PitchMode_01 - 1

Arpeggio_16:
    db $01, $00
    db $01, $02
    db TABLE_END
    dw Arpeggio_16

PitchSlide_13:
    db $01, $72, $06
    db $ff, $c4, $ff
    db TABLE_END
    dw PitchSlide_13

; Pulse instrument $01.
Instrument_01:
    db $60, $c2, $11
    dw Arpeggio_17 - 1, PitchSlide_03 - 2, PitchMode_04 - 1

Arpeggio_17:
    db $01, $00
    db $01, $0c
    db $ff, $00
    db TABLE_END
    dw Arpeggio_17

; Pulse instrument $0f, not used.
Instrument_0F:
    db $60, $e1, $11
    dw Arpeggio_17 - 1, PitchSlide_14 - 2, PitchMode_04 - 1

PitchSlide_14:
    db $01, $4f, $07
    db TABLE_END
    dw PitchSlide_14

; Nothing points here.
PitchSlide_15:
    db $01, $39, $07
    db TABLE_END
    dw PitchSlide_15

PitchMode_04:
    db $01, $00
    db $ff, $01
    db TABLE_END
    dw PitchMode_04

; Pulse instrument $18.
Instrument_18:
    db $40, $83, $11
    dw Arpeggio_18 - 1, PitchSlide_04.loop - 2, PitchMode_03 - 1

Arpeggio_18:
    db $06, $00
    db $01, $0c
    db TABLE_END
    dw Arpeggio_18

; Pulse instrument $19.
Instrument_19:
    db $40, $72, $21
    dw Arpeggio_19 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

Arpeggio_19:
    db $01, $00
    db $01, $0c
    db TABLE_END
    dw Arpeggio_19

; Pulse instrument $03.
Instrument_03:
    db $80, $c1, $21
    dw Arpeggio_20 - 1, PitchSlide_05 - 2, PitchMode_03 - 1

Arpeggio_20:
    db $01, $0c
    db $01, $00
    db $01, $07
    db $01, $03
    db $01, $00
    db TABLE_END
    dw Arpeggio_20

; Not in the instrument tables.
Instrument_Unused_61c1:
    db $80, $c7, $01
    dw Arpeggio_21 - 1, PitchSlide_05 - 2, PitchMode_03 - 1

Arpeggio_21:
    db $01, $f4
    db $08, $00
    db TABLE_END
    dw Arpeggio_21

PitchSlide_16:
    db $01, $ce, $ff
    db $32, $01, $00
.entry:
    db $0c, $00, $00
.loop:
    db $03, $02, $00
    db $03, $fe, $ff
    db $03, $fe, $ff
    db $03, $02, $00
    db $03, $03, $00
    db $03, $fd, $ff
    db $03, $fd, $ff
    db $03, $03, $00
    db $03, $04, $00
    db $03, $fc, $ff
    db $03, $fc, $ff
    db $03, $04, $00
    db TABLE_END
    dw PitchSlide_16.loop

; Nothing points here.
WaveVolume_10:
    db $04, $20
    db $ff, $40
    db TABLE_END
    dw WaveVolume_10

; Nothing points here.
WaveVolume_11:
    db $ff, $60
    db TABLE_END
    dw WaveVolume_11

; Nothing points here.
WaveVolume_12:
    db $14, $20
    db $14, $40
    db $ff, $60
    db $ff, $60
    db TABLE_END
    dw WaveVolume_Silent

; Pulse instrument $14.
Instrument_14:
    db $80, $52, $21
    dw Arpeggio_22 - 1, PitchSlide_05 - 2, PitchMode_03 - 1

Arpeggio_22:
    db $01, $00
    db $01, $05
    db TABLE_END
    dw Arpeggio_22

; Pulse instrument $1d, not used.
Instrument_1D:
    db $c0, $0e, $f7
    dw Arpeggio_00 - 1, PitchSlide_03 - 2, PitchMode_03 - 1

; Wave instrument $15.
Instrument_15:
    dw WaveVolume_13 - 1, WaveVolume_Silent - 1
    dw Arpeggio_00 - 1, PitchSlide_04.loop - 2, PitchMode_03 - 1

WaveVolume_13:
    db $04, $20
    db $ff, $40
    db TABLE_END
    dw WaveVolume_13

; Nothing points here.
PitchSlide_17:
    db $05, $04, $00
    db $05, $fc, $ff
    db $05, $fc, $ff
    db $05, $04, $00
    db TABLE_END
    dw PitchSlide_17

; Pulse instrument $16, not used.
Instrument_16:
    db $80, $e1, $62
    dw Arpeggio_00 - 1, PitchSlide_18 - 2, PitchMode_03 - 1

PitchSlide_18:
    db $01, $00, $00
    db $01, $3c, $ff
    db $01, $20, $ff
    db $01, $18, $ff
    db $01, $77, $ff
    db $01, $b4, $ff
.loop:
    db $ff, $ec, $ff
    db TABLE_END
    dw PitchSlide_18.loop

; Pulse instrument $13.
Instrument_13:
    db $80, $d2, $a3
    dw Arpeggio_23 - 1, PitchSlide_19 - 2, PitchMode_03 - 1

Arpeggio_23:
    db $01, $0c
    db $05, $00
    db TABLE_END
    dw Arpeggio_23

; The end marker before the loop pointer is missing. After 257 frames the driver reads the pointer and the
; next instrument as slide steps.
PitchSlide_19:
    db $02, $00, $00
    db $ff, $02, $00
    dw PitchSlide_19

; Pulse instrument $21, not used.
Instrument_21:
    db $80, $a8, $a3
    dw Arpeggio_00 - 1, PitchSlide_20 - 2, PitchMode_03 - 1

PitchSlide_20:
    db $01, $f0, $ff
    db $04, $04, $00
    db TABLE_END
    dw PitchSlide_16.loop

; Nothing points here.
PitchSlide_21:
    db $0a, $00, $00
.loop:
    db $03, $02, $00
    db $03, $fe, $ff
    db TABLE_END
    dw PitchSlide_21.loop

; Pulse instrument $3c.
Instrument_3C:
    db $80, $f8, $61
    dw Arpeggio_24 - 1, PitchSlide_04.loop - 2, PitchMode_03 - 1

Arpeggio_24:
    db $01, $f4
    db $01, $00
    db $01, $0c
    db $01, $00
    db TABLE_END
    dw Arpeggio_24

; Pulse instrument $3b.
Instrument_3B:
    db $60, $f3, $e2
    dw Arpeggio_25 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

Arpeggio_25:
    db $04, $00
    db $04, $03
    db $04, $06
    db $04, $09
    db TABLE_END
    dw Arpeggio_25

; Nothing points here.
PitchSlide_22:
    db $05, $00, $00
    db $05, $0a, $00
    db $ff, $fe, $ff
    db TABLE_END
    dw PitchSlide_22

; Pulse instrument $2a.
Instrument_2A:
    db $60, $e2, $c1
    dw Arpeggio_26 - 1, PitchSlide_23 - 2, PitchMode_03 - 1

PitchSlide_23:
    db $01, $01, $00
    db $01, $ff, $ff
    db TABLE_END
    dw PitchSlide_23

Arpeggio_26:
    db $03, $00
    db $01, $0c
    db $01, $f4
    db TABLE_END
    dw Arpeggio_26

; Pulse instrument $2b.
Instrument_2B:
    db $60, $e3, $c1
    dw Arpeggio_26 - 1, PitchSlide_23 - 2, PitchMode_03 - 1

; Pulse instrument $2c.
Instrument_2C:
    db $80, $e2, $c1
    dw Arpeggio_27 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

Arpeggio_27:
    db $01, $f4
    db $02, $00
    db $06, $0c
    db TABLE_END
    dw Arpeggio_27

PitchSlide_24:
    db $01, $01, $00
    db $01, $ff, $ff
    db TABLE_END
    dw PitchSlide_24

; Pulse instrument $2d.
Instrument_2D:
    db $80, $c3, $c1
    dw Arpeggio_28 - 1, PitchSlide_24 - 2, PitchMode_03 - 1

Arpeggio_28:
    db $01, $00
    db $05, $f4
    db TABLE_END
    dw Arpeggio_28

; Pulse instrument $31.
Instrument_31:
    db $c0, $f4, $41
    dw Arpeggio_29 - 1, PitchSlide_25 - 2, PitchMode_03 - 1

Arpeggio_29:
    db $01, $00
    db $01, $03
    db $01, $06
    db $01, $09
    db $01, $0c
    db TABLE_END
    dw Arpeggio_29

PitchSlide_25:
    db $ff, $01, $00
    db TABLE_END
    dw PitchSlide_25

; Pulse instrument $36.
Instrument_36:
    db $80, $59, $c1
    dw Arpeggio_30 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

Arpeggio_30:
    db $01, $00
    db $01, $01
    db $01, $02
    db $01, $03
    db $01, $04
    db $01, $05
    db $01, $06
    db $01, $07
    db $01, $08
    db $01, $09
    db $01, $0a
    db $01, $0b
    db $01, $0c
    db $01, $0d
    db $01, $0e
    db $01, $0f
    db $01, $10
    db $01, $11
    db $01, $12
    db $01, $13
    db $01, $14
    db TABLE_END
    dw Arpeggio_30

; Nothing points here.
PitchSlide_26:
    db $01, $88, $13
    db $01, $fb, $ff
    db $01, $02, $00
    db TABLE_END
    dw PitchSlide_26

; Pulse instrument $37.
Instrument_37:
    db $00, $f4, $41
    dw Arpeggio_00 - 1, PitchSlide_27 - 2, PitchMode_03 - 1

PitchSlide_27:
    db $04, $08, $00
    db $04, $f6, $ff
    db TABLE_END
    dw PitchSlide_27

; Pulse instrument $38.
Instrument_38:
    db $80, $f2, $41
    dw Arpeggio_31 - 1, PitchSlide_28 - 2, PitchMode_03 - 1

Arpeggio_31:
    db $01, $f4
    db $ff, $00
    db TABLE_END
    dw Arpeggio_31

PitchSlide_28:
    db $01, $e2, $ff
    db $01, $1e, $00
    db $01, $e2, $ff
    db $01, $fe, $ff
    db $01, $fb, $ff
    db $01, $f6, $ff
    db $ff, $ec, $ff
    db TABLE_END
    dw PitchSlide_28

; Noise instrument $12.
NoiseInstrument_12:
    db $00, $c5, $41
    dw NoiseShape_03 - 1, Arpeggio_00 - 1

NoiseShape_03:
    db $04, $56
    db $ff, $54
    db TABLE_END
    dw NoiseShape_03

; Pulse instrument $39.
Instrument_39:
    db $80, $e8, $a3
    dw Arpeggio_32 - 1, PitchSlide_29 - 2, PitchMode_03 - 1

Arpeggio_32:
    db $04, $05
    db $0c, $00
    db TABLE_END
    dw Arpeggio_32

PitchSlide_29:
    db $04, $0a, $00
    db $01, $d8, $ff
    db TABLE_END
    dw PitchSlide_29

; Pulse instrument $3a.
Instrument_3A:
    db $40, $f8, $f3
    dw Arpeggio_00 - 1, PitchSlide_30 - 2, PitchMode_03 - 1

PitchSlide_30:
    db $0c, $06, $00
    db $01, $b8, $ff
    db TABLE_END
    dw PitchSlide_30

; Pulse instrument $34.
Instrument_34:
    db $80, $c2, $41
    dw Arpeggio_00 - 1, PitchSlide_31 - 2, PitchMode_03 - 1

PitchSlide_31:
    db $07, $05, $00
    db $07, $fb, $ff
    db TABLE_END
    dw PitchSlide_31

; Pulse instrument $35.
Instrument_35:
    db $80, $c1, $51
    dw Arpeggio_33 - 1, PitchSlide_00 - 2, PitchMode_02 - 1

Arpeggio_33:
    db $01, $0f
    db $ff, $05
    db TABLE_END
    dw Arpeggio_33

; Pulse instrument $32.
Instrument_32:
    db $80, $f1, $c1
    dw Arpeggio_34 - 1, PitchSlide_32 - 2, PitchMode_03 - 1

PitchSlide_32:
    db $ff, $0a, $00
    db TABLE_END
    dw PitchSlide_32

Arpeggio_34:
    db $01, $00
    db $01, $01
    db TABLE_END
    dw Arpeggio_34

; Pulse instrument $33.
Instrument_33:
    db $80, $a1, $11
    dw Arpeggio_35 - 1, PitchSlide_33 - 2, PitchMode_03 - 1

Arpeggio_35:
    db $01, $0c
.loop:
    db $01, $00
    db $01, $01
    db TABLE_END
    dw Arpeggio_35.loop

PitchSlide_33:
    db $ff, $01, $00
    db TABLE_END
    dw PitchSlide_33

; Pulse instrument $2e.
Instrument_2E:
    db $00, $f8, $f1
    dw Arpeggio_36 - 1, PitchSlide_00 - 2, PitchMode_02 - 1

Arpeggio_36:
    db $01, $00
    db $01, $02
    db $01, $04
    db $01, $06
    db $01, $08
    db TABLE_END
    dw Arpeggio_36

; Pulse instrument $2f.
Instrument_2F:
    db $80, $f3, $c1
    dw Arpeggio_37 - 1, PitchSlide_00 - 2, PitchMode_02 - 1

Arpeggio_37:
    db $01, $05
    db $01, $04
    db $01, $03
    db $01, $02
    db $01, $01
    db $01, $00
    db TABLE_END
    dw Arpeggio_37

; Pulse instrument $30.
Instrument_30:
    db $80, $f3, $a7
    dw Arpeggio_00 - 1, PitchSlide_34 - 2, PitchMode_00 - 1

PitchSlide_34:
    db $01, $dc, $05
    db $ff, $08, $00
    db TABLE_END
    dw PitchSlide_34

; Noise instrument $0a, not used.
NoiseInstrument_0A:
    db $80, $f1, $41
    dw NoiseShape_04 - 1, Arpeggio_00 - 1

NoiseShape_04:
    db $02, $44
    db $01, $34
    db $01, $25
    db $ff, $22
    db TABLE_END
    dw NoiseShape_04

; Noise instrument $14.
NoiseInstrument_14:
    db $00, $58, $87
    dw NoiseShape_05 - 1, Arpeggio_00 - 1

NoiseShape_05:
    db $03, $46
    db $03, $44
    db $03, $42
    db $03, $35
    db $03, $33
    db $03, $31
    db $02, $23
    db $02, $22
    db $02, $21
    db $02, $20
    db $ff, $20
    db TABLE_END
    dw NoiseShape_05

; Noise instrument $0e.
NoiseInstrument_0E:
    db $00, $c3, $a1
    dw NoiseShape_06 - 1, Arpeggio_00 - 1

NoiseShape_06:
    db $02, $33
    db $02, $34
    db $02, $35
    db $02, $36
    db $02, $37
    db $02, $43
    db $02, $44
    db $02, $45
    db $02, $46
    db $02, $47
    db $02, $53
    db $02, $54
    db $02, $55
    db $02, $56
    db $02, $57
    db $ff, $54
    db TABLE_END
    dw NoiseShape_06

; Noise instrument $0b.
NoiseInstrument_0B:
    db $00, $e4, $41
    dw NoiseShape_07 - 1, Arpeggio_00 - 1

NoiseShape_07:
    db $0a, $55
    db $0a, $54
    db $0a, $53
    db TABLE_END
    dw NoiseShape_07

; Noise instrument $11.
NoiseInstrument_11:
    db $00, $e2, $41
    dw NoiseShape_08 - 1, Arpeggio_00 - 1

NoiseShape_08:
    db $01, $1b
    db $01, $1c
    db $01, $1d
    db $01, $1e
    db $01, $1f
    db $01, $28
    db $01, $29
    db $01, $2a
    db $01, $2b
    db $01, $2c
    db $01, $2d
    db $01, $2e
    db $01, $2f
    db $01, $38
    db $01, $39
    db $01, $3a
    db $01, $3b
    db $01, $3c
    db $01, $3d
    db $01, $3e
    db $01, $3f
    db $02, $48
    db $02, $4a
    db $02, $48
    db $02, $4a
    db $02, $48
    db $02, $4a
    db $02, $48
    db $ff, $4a
    db TABLE_END
    dw NoiseShape_08

; Noise instrument $0f.
NoiseInstrument_0F:
    db $00, $e3, $41
    dw NoiseShape_09 - 1, Arpeggio_00 - 1

NoiseShape_09:
    db $02, $32
    db $02, $33
    db $02, $34
    db $02, $35
    db $02, $36
    db $02, $37
    db $02, $43
    db $02, $44
    db $02, $45
    db $02, $46
    db $02, $47
    db $02, $54
    db $02, $55
    db $02, $56
    db $ff, $57
    db TABLE_END
    dw NoiseShape_09

; Noise instrument $13.
NoiseInstrument_13:
    db $00, $e1, $e1
    dw NoiseShape_10 - 1, Arpeggio_00 - 1

NoiseShape_10:
    db $03, $2a
    db $03, $29
    db $03, $28
    db TABLE_END
    dw NoiseShape_10

; Noise instrument $15, not used.
NoiseInstrument_15:
    db $00, $78, $41
    dw NoiseShape_11 - 1, Arpeggio_00 - 1

NoiseShape_11:
    db $14, $34
    db TABLE_END
    dw NoiseShape_11

; Noise instrument $0c.
NoiseInstrument_0C:
    db $80, $69, $d2
    dw NoiseShape_12 - 1, Arpeggio_00 - 1

NoiseShape_12:
    db $02, $56
    db $02, $54
    db $02, $52
    db $02, $46
    db $02, $44
    db $02, $42
    db $02, $40
.loop:
    db $01, $36
    db $01, $34
    db $01, $32
    db $01, $30
    db $01, $32
    db $01, $34
    db TABLE_END
    dw NoiseShape_12.loop

; Noise instrument $0d.
NoiseInstrument_0D:
    db $80, $f4, $e5
    dw NoiseShape_13 - 1, Arpeggio_00 - 1

NoiseShape_13:
    db $03, $53
.loop:
    db $03, $46
    db $03, $45
    db $03, $44
    db TABLE_END
    dw NoiseShape_13.loop

; Noise instrument $10.
NoiseInstrument_10:
    db $00, $69, $b2
    dw NoiseShape_14 - 1, Arpeggio_00 - 1

NoiseShape_14:
    db $02, $66
    db $02, $64
    db $02, $56
    db $02, $54
    db $02, $46
    db $02, $44
    db $02, $36
    db $02, $34
    db $02, $26
    db $02, $24
    db $ff, $24
.loop:
    db $14, $66
    db TABLE_END
    dw NoiseShape_14.loop

; Pulse instrument $10.
Instrument_10:
    db $80, $01, $01
    dw Arpeggio_00 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

; Noise instrument $00, $05, $06, $07, $08, $09.
; The NR43 pointer is a pitch slide table, which has 3-byte steps. Read with 2-byte steps, its loop pointer
; is the end marker and the low byte of the real pointer: $1c00 in bank 0. The envelope is 0, so nothing is heard.
NoiseInstrument_00:
NoiseInstrument_05:
NoiseInstrument_06:
NoiseInstrument_07:
NoiseInstrument_08:
NoiseInstrument_09:
    db $00, $01, $01
    dw PitchSlide_00 - 1, Arpeggio_00 - 1

; Wave instrument $11.
Instrument_11:
    dw WaveVolume_Silent - 1, WaveVolume_Silent - 1
    dw Arpeggio_00 - 1, PitchSlide_00 - 2, PitchMode_03 - 1

Waveform_0:
    db $f0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

; Nothing points here.
Waveform_1:
    db $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

; Nothing points here.
Waveform_2:
    db $f0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

; Nothing points here.
Waveform_3:
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00

Waveform_4:
    db $00, $11, $22, $33, $44, $55, $66, $77, $88, $99, $aa, $bb, $cc, $dd, $ee, $ff

WaveAnim_00:
    db $06, $30, $ff
    db $06, $31, $ff
    db $06, $32, $00
    db $06, $33, $00
    db $06, $34, $00
    db $06, $35, $00
    db $06, $36, $00
    db $06, $37, $00
    db $06, $38, $00
    db $06, $39, $00
    db $06, $3a, $00
    db $06, $3b, $00
    db $06, $3c, $00
    db $06, $3d, $00
    db $06, $3e, $00
    db $06, $3f, $00
    db $06, $3f, $ff
    db $06, $3e, $ee
    db $06, $3d, $dd
    db $06, $3c, $cc
    db $06, $3b, $bb
    db $06, $3a, $aa
    db $06, $39, $99
    db $06, $38, $88
    db $06, $37, $77
    db $06, $36, $66
    db $06, $35, $55
    db $06, $34, $44
    db $06, $33, $33
    db $06, $32, $22
    db $06, $31, $11
    db $06, $30, $00
    db TABLE_END
    dw WaveAnim_00

; Nothing points here.
WaveAnim_01:
    db $90, $30, $9a
    db TABLE_END
    dw WaveAnim_01

; Nothing points here.
Waveform_5:
    db $9a, $87, $9b, $9b, $cd, $ff, $ca, $bc, $bb, $dc, $96, $96, $67, $65, $66, $21

; Nothing points here.
Waveform_6:
    db $ff, $ec, $a7, $53, $32, $22, $23, $23, $22, $21, $11, $25, $79, $bd, $ee, $ee

; Nothing points here.
WaveAnim_02:
    db $ff, $30, $ff
    db TABLE_END
    dw WaveAnim_02

WaveAnim_03:
    db $07, $30, $f0
    db $07, $30, $ff
    db $07, $31, $f0
    db $07, $31, $ff
    db $07, $32, $f0
    db $07, $32, $ff
    db $07, $33, $f0
    db $07, $33, $ff
    db $07, $34, $f0
    db $07, $34, $ff
    db $07, $35, $f0
    db $07, $35, $ff
    db $07, $36, $f0
    db $07, $36, $ff
    db $07, $37, $f0
    db $07, $37, $ff
    db $07, $38, $f0
    db $07, $38, $ff
    db $07, $39, $f0
    db $07, $39, $ff
    db $07, $3a, $f0
    db $07, $3a, $ff
    db $07, $3b, $f0
    db $07, $3b, $ff
    db $07, $3c, $f0
    db $07, $3c, $ff
    db $07, $3d, $f0
    db $07, $3d, $ff
    db $07, $3e, $f0
    db $07, $3e, $ff
    db $07, $3f, $f0
    db $07, $3f, $00
    db $07, $3e, $f0
    db $07, $3e, $00
    db $07, $3d, $f0
    db $07, $3d, $00
    db $07, $3c, $f0
    db $07, $3c, $00
    db $07, $3b, $f0
    db $07, $3b, $00
    db $07, $3a, $f0
    db $07, $3a, $00
    db $07, $39, $f0
    db $07, $39, $00
    db $07, $38, $f0
    db $07, $38, $00
    db $07, $37, $f0
    db $07, $37, $00
    db $07, $36, $f0
    db $07, $36, $00
    db $07, $35, $f0
    db $07, $35, $00
    db $07, $34, $f0
    db $07, $34, $00
    db $07, $33, $f0
    db $07, $33, $00
    db $07, $32, $f0
    db $07, $32, $00
    db $07, $31, $f0
    db $07, $31, $00
    db TABLE_END
    dw WaveAnim_03

; Nothing points here.
WaveAnim_04:
    db $03, $34, $f0
    db $03, $34, $ff
    db $03, $35, $f0
    db $03, $35, $ff
    db $03, $36, $f0
    db $03, $36, $ff
    db $03, $37, $f0
    db $03, $37, $ff
    db $03, $38, $f0
    db $03, $38, $ff
    db $03, $39, $f0
    db $03, $39, $ff
    db $03, $39, $f0
    db $03, $39, $00
    db $03, $38, $f0
    db $03, $38, $00
    db $03, $37, $f0
    db $03, $37, $00
    db $03, $36, $f0
    db $03, $36, $00
    db $03, $35, $f0
    db $03, $35, $00
    db $03, $34, $f0
    db $03, $34, $00
    db TABLE_END
    dw WaveAnim_04

; Leftover bytes from the build of the ROM: the text "-- THE END --", some graphics and some code.
; Nothing reads them.
LeftoverData_006_67d3:
    db $2d, $2d, $20, $54, $48, $45, $20, $45, $4e, $44, $20, $2d, $2d, $08, $0f, $08
    db $0f, $0b, $0f, $0b, $0e, $09, $0e, $08, $0f, $c0, $00, $1f, $ff, $c0, $ff, $e0
    db $9f, $90, $9f, $08, $07, $08, $07, $80, $9f, $03, $00, $ff, $ff, $00, $ff, $02
    db $ff, $26, $fc, $60, $cc, $09, $c6, $12, $ed, $40, $f0, $80, $f0, $00, $f0, $00
    db $f0, $00, $f0, $80, $70, $00, $f0, $80, $70, $08, $0f, $08, $0f, $08, $0f, $08
    db $0f, $08, $0f, $00, $0f, $04, $03, $01, $00, $60, $9f, $04, $ff, $0d, $f9, $00
    db $ff, $00, $ff, $00, $ff, $00, $ff, $80, $7f, $05, $fa, $8a, $f5, $85, $3a, $0a
    db $f5, $05, $fa, $02, $fd, $00, $ff, $01, $fe, $40, $b0, $a0, $50, $40, $b0, $a0
    db $50, $40, $b0, $80, $70, $20, $c0, $80, $00, $00, $00, $00, $00, $00, $00, $23
    db $18, $1b, $20, $0b, $20, $0b, $20, $1b, $20, $00, $00, $00, $00, $00, $00, $7f
    db $ff, $fd, $ff, $fa, $ff, $f5, $ff, $ea, $ff, $00, $00, $00, $00, $00, $00, $fe
    db $ff, $40, $ff, $80, $c7, $18, $c7, $1c, $c7, $00, $00, $00, $00, $00, $00, $00
    db $30, $78, $00, $7c, $00, $4c, $30, $4c, $30, $1b, $20, $1b, $20, $1b, $20, $19
    db $20, $1c, $20, $1f, $20, $1f, $20, $1f, $20, $d4, $ff, $a8, $ff, $50, $ff, $a0
    db $7f, $00, $00, $ff, $00, $ff, $00, $00, $ff, $1c, $c7, $1c, $c7, $1c, $c7, $0d
    db $fe, $00, $00, $ff, $00, $ff, $00, $00, $ff, $7c, $00, $7c, $00, $7c, $00, $7c
    db $00, $fc, $00, $fc, $00, $fc, $00, $7c, $80, $1e, $21, $1e, $21, $1e, $21, $1e
    db $21, $1e, $21, $1e, $21, $1e, $21, $1e, $21, $00, $ff, $6b, $94, $00, $ff, $5a
    db $a5, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $d4, $2b, $00, $ff, $00
    db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $3c, $c0, $3c, $c0, $3c, $c0, $3c
    db $c0, $3c, $c0, $3c, $c0, $3c, $c0, $3c, $c0, $06, $21, $02, $25, $36, $0d, $3e
    db $01, $1f, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00
    db $ff, $55, $aa, $00, $00, $00, $00, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00
    db $ff, $55, $aa, $00, $00, $00, $00, $00, $00, $24, $c0, $20, $c4, $30, $cc, $3c
    db $c0, $78, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $02, $01, $04, $03, $09, $07, $03, $0f, $00, $00, $00, $00, $20, $1f, $95
    db $7f, $7e, $ff, $ff, $ff, $ff, $ff, $e7, $c3, $00, $00, $00, $00, $04, $f8, $55
    db $fe, $ea, $ff, $55, $ff, $80, $ff, $a4, $c3, $00, $00, $00, $00, $00, $00, $00
    db $00, $40, $80, $20, $c0, $90, $e0, $00, $f0, $13, $0f, $07, $1f, $2b, $1f, $07
    db $3f, $0b, $3f, $15, $3f, $0e, $3f, $1f, $3f, $c3, $81, $81, $81, $81, $81, $81
    db $81, $81, $81, $80, $81, $00, $81, $00, $81, $c2, $81, $80, $81, $80, $81, $80
    db $81, $00, $81, $00, $81, $00, $81, $00, $81, $28, $d0, $50, $a8, $2c, $d0, $04
    db $f8, $88, $74, $54, $a8, $a8, $54, $44, $b8, $1f, $3f, $1c, $38, $08, $31, $02
    db $34, $29, $16, $02, $1f, $15, $0f, $02, $0f, $42, $81, $24, $c3, $82, $ff, $54
    db $ff, $08, $7f, $b0, $0f, $40, $80, $20, $c0, $42, $81, $24, $c3, $01, $fe, $2a
    db $d5, $40, $be, $0d, $f0, $02, $01, $04, $03, $08, $f4, $24, $18, $10, $8c, $40
    db $2c, $94, $68, $40, $b8, $a8, $50, $40, $b0, $09, $07, $04, $03, $02, $01, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $10, $e0, $04, $f8, $40, $ff, $a8
    db $7f, $20, $1f, $00, $00, $00, $00, $00, $00, $08, $07, $21, $1e, $0a, $f5, $51
    db $ae, $04, $f8, $00, $00, $00, $00, $00, $00, $90, $60, $20, $c0, $40, $80, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $18
    db $0f, $17, $18, $0f, $10, $0e, $10, $0e, $10, $00, $00, $00, $00, $00, $00, $10
    db $e0, $f8, $00, $78, $00, $38, $00, $38, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $18
    db $0f, $17, $18, $0f, $10, $0f, $10, $0c, $10, $0c, $10, $0c, $10, $0e, $11, $1f
    db $e0, $ff, $00, $fe, $00, $3c, $00, $19, $20, $18, $00, $08, $10, $18, $e0, $fc
    db $03, $ff, $00, $3f, $00, $fe, $00, $ee, $10, $00, $00, $00, $00, $00, $00, $50
    db $e0, $f8, $00, $f8, $00, $78, $00, $18, $00, $08, $10, $0c, $10, $0f, $10, $1f
    db $00, $0f, $00, $00, $00, $00, $00, $00, $00, $1b, $20, $1b, $20, $1f, $20, $be
    db $41, $ff, $00, $1f, $00, $0f, $10, $0c, $10, $fe, $10, $de, $30, $be, $60, $3f
    db $c0, $ff, $00, $f8, $00, $f8, $00, $18, $00, $08, $00, $18, $00, $48, $30, $38
    db $c0, $f0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $10, $1e, $10, $1e, $10, $0f
    db $10, $17, $08, $00, $00, $00, $00, $00, $00, $08, $10, $28, $10, $18, $20, $58
    db $20, $f0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $02, $01, $04, $03, $08, $07, $00, $00, $00, $00, $00, $00, $30
    db $0f, $80, $7f, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $4c
    db $b0, $a1, $5e, $53, $af, $23, $df, $47, $bf, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $40, $80, $a0, $c0, $d0, $e0, $00, $0f, $10, $0f, $00, $1f, $20
    db $1f, $30, $1f, $18, $3f, $3f, $3f, $00, $3f, $00, $ff, $00, $ff, $07, $ff, $1f
    db $ff, $1a, $fc, $30, $f8, $f8, $f0, $30, $f0, $27, $df, $4f, $bf, $ef, $ff, $fe
    db $ff, $58, $3f, $0c, $1f, $1f, $0f, $0c, $0f, $e0, $f0, $e8, $f0, $80, $f8, $04
    db $f8, $04, $f8, $00, $fc, $a8, $fc, $00, $fc, $2a, $15, $14, $2b, $00, $3f, $20
    db $1f, $20, $1f, $01, $1f, $17, $0f, $07, $0f, $b0, $70, $38, $f0, $30, $f8, $1a
    db $fc, $7f, $ff, $f7, $ff, $f2, $fd, $e4, $fb, $0c, $0f, $1c, $0f, $0c, $1f, $58
    db $3f, $f8, $ff, $e2, $fd, $0d, $f2, $0e, $f1, $00, $fc, $00, $fc, $00, $fc, $04
    db $f8, $04, $f8, $00, $f8, $08, $f0, $a0, $50, $0b, $07, $05, $03, $02, $01, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $e2, $fd, $c4, $fb, $c8, $f7, $84
    db $7b, $30, $0f, $00, $00, $00, $00, $00, $00, $07, $f8, $07, $f8, $03, $fc, $03
    db $fc, $0c, $f0, $00, $00, $00, $00, $00, $00, $50, $a0, $a0, $40, $c0, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0f
    db $1f, $10, $1f, $10, $1f, $01, $1e, $10, $1e, $00, $00, $00, $00, $00, $00, $ff
    db $ff, $00, $ff, $80, $00, $7f, $00, $95, $6a, $00, $00, $00, $00, $00, $00, $fe
    db $ff, $00, $ff, $0b, $00, $dd, $22, $ab, $54, $00, $00, $00, $00, $00, $00, $80
    db $00, $00, $80, $08, $f0, $80, $78, $88, $70, $01, $1e, $10, $1f, $10, $1f, $10
    db $1f, $11, $1e, $12, $1c, $01, $1c, $19, $04, $ff, $00, $ff, $00, $00, $ff, $00
    db $ff, $00, $00, $ff, $00, $3f, $ff, $3f, $e4, $ff, $00, $ff, $00, $ab, $ff, $00
    db $ff, $05, $00, $ff, $00, $fe, $ff, $fe, $93, $80, $78, $48, $f0, $80, $f8, $00
    db $f8, $80, $78, $c0, $38, $40, $b8, $58, $a0, $09, $1c, $19, $1c, $19, $1c, $19
    db $1c, $1b, $1c, $19, $1c, $1b, $1c, $19, $1e, $3f, $ff, $3f, $e4, $3f, $ff, $3f
    db $fb, $3f, $ff, $3f, $fc, $3f, $ff, $ff, $00, $fe, $ff, $fe, $93, $fe, $ff, $fe
    db $ff, $fe, $ff, $fe, $3f, $fe, $ff, $ff, $00, $40, $b0, $40, $b0, $40, $b0, $40
    db $b0, $40, $b0, $40, $b0, $40, $b0, $a0, $70, $18, $1f, $18, $1f, $08, $1f, $10
    db $0f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $01, $fe, $00, $ff, $00
    db $ff, $00, $00, $00, $00, $00, $00, $00, $00, $0a, $ff, $e0, $3f, $c0, $7f, $00
    db $ff, $00, $00, $00, $00, $00, $00, $00, $00, $c0, $f0, $00, $f0, $00, $f0, $10
    db $e0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08, $00, $00, $04, $06
    db $02, $02, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1c, $00, $5c
    db $3e, $d7, $e2, $03, $01, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $80, $00, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $03, $00, $05, $03, $00, $00, $bf
    db $7f, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $c0, $00, $20, $c0, $00, $00, $f9
    db $7e, $fe, $7f, $ff, $7f, $ff, $7f, $7f, $7f, $00, $00, $00, $00, $00, $00, $00
    db $00, $80, $00, $80, $00, $80, $00, $80, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00, $01, $00, $01, $98, $e0, $df, $3f, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $19, $07, $fb, $fc, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $80, $00, $80, $00, $80, $00, $80
    db $00, $80, $00, $80, $00, $00, $80, $00, $80, $01, $01, $01, $01, $00, $01, $00
    db $01, $01, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $3f
    db $ff, $00, $ff, $82, $7d, $20, $1f, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $fc
    db $ff, $05, $fa, $ab, $54, $54, $a8, $00, $00, $80, $80, $80, $80, $00, $80, $80
    db $00, $80, $00, $00, $00, $00, $00, $00, $00, $20, $00, $18, $00, $14, $08, $0e
    db $04, $04, $02, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $08, $07, $20
    db $1f, $58, $3f, $bc, $7f, $3c, $ff, $18, $ff, $00, $00, $00, $00, $20, $d0, $14
    db $e8, $0a, $f4, $07, $f8, $0b, $f4, $05, $fa, $02, $00, $0c, $00, $14, $08, $38
    db $10, $10, $20, $00, $00, $80, $00, $80, $00, $00, $01, $00, $01, $00, $01, $00
    db $01, $58, $3d, $00, $01, $01, $00, $00, $00, $40, $ff, $60, $ff, $40, $ff, $00
    db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $03, $fc, $05, $fa, $03, $fc, $05
    db $fa, $0b, $f4, $07, $f8, $0b, $f4, $17, $e8, $c0, $00, $c0, $00, $c0, $00, $c0
    db $00, $cd, $1e, $c0, $00, $80, $00, $80, $00, $00, $00, $00, $00, $00, $00, $04
    db $02, $0e, $04, $14, $08, $18, $00, $20, $00, $80, $7f, $40, $3f, $20, $1f, $08
    db $1f, $10, $0f, $14, $0f, $04, $0f, $00, $0f, $2f, $d0, $1e, $e0, $2c, $d0, $5c
    db $a0, $38, $c0, $78, $80, $b8, $40, $78, $80, $00, $00, $00, $00, $00, $00, $10
    db $20, $38, $10, $14, $08, $0c, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $0f, $00, $16, $0f, $0f, $00, $16
    db $0f, $0f, $00, $12, $0f, $07, $00, $06, $03, $c0, $00, $34, $c8, $c8, $00, $34
    db $c8, $c8, $00, $34, $c8, $f8, $00, $d0, $20, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $ff, $0c, $83, $19, $87, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $01, $fe, $b4, $fe, $68, $fe, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $ff, $0c, $83, $19, $87, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $01, $fe, $b4, $fe, $68, $fe, $32, $8f, $65, $9f, $4b, $bf, $16
    db $ff, $80, $00, $00, $01, $00, $01, $00, $01, $d2, $fc, $a6, $f8, $4c, $f0, $98
    db $e0, $00, $00, $00, $ff, $19, $07, $32, $0f, $32, $8f, $65, $9f, $4b, $bf, $16
    db $ff, $80, $00, $02, $fc, $68, $fc, $f0, $9c, $d2, $fc, $a6, $f8, $4c, $f0, $98
    db $e0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $00, $01, $00
    db $01, $01, $00, $00, $00, $00, $00, $00, $00, $65, $1f, $cb, $3f, $96, $7f, $2d
    db $ff, $00, $00, $00, $00, $00, $00, $00, $00, $94, $a8, $2c, $b0, $b0, $b8, $78
    db $bc, $3c, $3e, $3e, $3f, $3f, $3f, $3f, $3f, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $80, $80, $c0, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $3f, $3f, $3f, $3f, $2b, $37, $01
    db $03, $00, $01, $01, $00, $00, $00, $00, $00, $00, $80, $80, $00, $00, $80, $c0
    db $80, $80, $c0, $00, $c0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $01, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $80, $7f, $02, $fd, $05, $fa, $00, $04, $00, $0e, $00, $0e, $00
    db $0e, $0a, $04, $0d, $f2, $a0, $5f, $50, $af, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $80, $00, $00, $80, $00, $01, $00, $01, $00, $01, $00
    db $01, $00, $01, $00, $01, $00, $01, $00, $01, $02, $fd, $00, $ff, $80, $00, $1f
    db $40, $1f, $00, $1f, $00, $80, $00, $30, $c0, $a0, $5f, $00, $ff, $02, $01, $f1
    db $01, $f1, $01, $f1, $01, $03, $01, $1a, $07, $00, $80, $00, $80, $00, $80, $00
    db $80, $00, $80, $00, $80, $00, $80, $00, $80, $01, $00, $00, $01, $00, $01, $00
    db $01, $00, $01, $00, $01, $00, $01, $00, $01, $07, $ff, $00, $ff, $7b, $ff, $7f
    db $fb, $3d, $c2, $7b, $ff, $7f, $fb, $3d, $c2, $fc, $ff, $00, $ff, $de, $ff, $ff
    db $de, $ef, $10, $de, $ff, $ff, $de, $ef, $10, $80, $00, $00, $80, $00, $80, $00
    db $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $01, $00, $01, $00, $01, $00
    db $01, $00, $01, $00, $01, $01, $00, $00, $00, $7b, $ff, $7f, $fb, $3d, $c2, $7b
    db $ff, $7f, $fb, $3c, $c3, $02, $fc, $80, $7f, $de, $ff, $ff, $de, $ef, $10, $de
    db $ff, $ff, $de, $2f, $d0, $40, $3f, $01, $fe, $00, $80, $00, $80, $00, $80, $00
    db $80, $00, $80, $00, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $14, $14, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $08, $00, $1c, $08, $3e, $14, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $0c, $04, $0c, $08, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $18, $10, $18, $08, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $0a, $0a, $14, $14, $00, $00, $3e, $7f, $77, $63, $60
    db $60, $60, $60, $77, $63, $3e, $7f, $1c, $08, $18, $18, $18, $18, $18, $18, $18
    db $18, $18, $18, $00, $00, $18, $18, $18, $18, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $30, $30, $30, $30, $00, $00, $00, $00, $00, $00, $00
    db $00, $1c, $3e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $30, $10, $30, $20, $18, $18, $10, $18, $00, $10, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $bf, $00, $fa, $00, $48, $00, $25
    db $00, $90, $00, $44, $00, $28, $00, $41, $00, $14, $00, $81, $00, $4d, $00, $2b
    db $00, $8a, $00, $25, $00, $95, $00, $02, $00, $52, $00, $04, $00, $e8, $17, $e8
    db $17, $e4, $1b, $74, $0b, $ea, $15, $f4, $0b, $7d, $02, $b6, $09, $09, $ff, $00
    db $ff, $00, $ff, $01, $fe, $8b, $74, $25, $da, $17, $e8, $4b, $b4, $04, $fb, $12
    db $ed, $a0, $5f, $69, $96, $a9, $56, $d5, $2a, $ed, $12, $be, $41, $df, $20, $b7
    db $48, $af, $50, $5d, $a0, $7f, $80, $5f, $a0, $bf, $40, $ff, $00, $e0, $1f, $fd
    db $02, $7f, $00, $af, $00, $f7, $00, $5d, $00, $ff, $00, $bf, $00, $ff, $00, $7f
    db $80, $fb, $00, $ff, $00, $ef, $00, $bf, $00, $ff, $00, $3e, $c0, $a0, $5f, $d4
    db $2b, $f9, $06, $ed, $12, $fa, $05, $f7, $08, $ff, $00, $ff, $00, $38, $c7, $4e
    db $b1, $2b, $d4, $5f, $a0, $af, $50, $ff, $00, $ff, $00, $ff, $00, $20, $ff, $01
    db $fe, $80, $7f, $50, $bf, $81, $7e, $81, $7e, $c1, $3e, $81, $7e, $5d, $a0, $7c
    db $80, $ad, $50, $bc, $40, $7c, $80, $5a, $a0, $7d, $80, $b8, $40, $57, $00, $ba
    db $00, $17, $00, $ad, $00, $b6, $00, $5b, $00, $6a, $00, $ab, $00, $b5, $00, $eb
    db $00, $b3, $00, $d7, $00, $db, $00, $e3, $00, $aa, $00, $aa, $00, $e7, $1f, $f5
    db $0f, $f3, $0f, $59, $a7, $39, $c7, $1f, $e3, $3f, $c3, $db, $27, $ff, $ff, $7f
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $ff
    db $ff, $fe, $ff, $fe, $ff, $fa, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $bd, $00, $b7
    db $00, $bb, $00, $2b, $80, $6b, $80, $7b, $80, $95, $e0, $c8, $f0, $94, $00, $c2
    db $00, $c4, $00, $e2, $00, $61, $80, $c4, $00, $43, $00, $29, $00, $10, $00, $42
    db $00, $08, $00, $80, $00, $0a, $00, $a0, $00, $00, $00, $49, $00, $fd, $02, $3f
    db $00, $7f, $00, $3f, $00, $7f, $00, $1f, $00, $5f, $00, $0b, $00, $07, $f8, $8b
    db $74, $a7, $58, $85, $7a, $d3, $2c, $eb, $14, $d5, $2a, $fa, $05, $ff, $00, $ff
    db $00, $df, $00, $ad, $00, $ff, $00, $ff, $00, $fc, $03, $f0, $0f, $be, $40, $ff
    db $00, $ff, $00, $5f, $00, $be, $01, $dd, $02, $fc, $03, $2a, $d5, $ee, $01, $fe
    db $01, $fd, $02, $61, $9e, $08, $f7, $0a, $ff, $2e, $ff, $02, $ff, $bf, $40, $bf
    db $40, $56, $a9, $00, $ff, $95, $7f, $3a, $ff, $bb, $fc, $13, $fc, $7f, $00, $fc
    db $00, $da, $20, $3d, $c0, $1b, $e0, $3d, $c2, $d6, $29, $e9, $16, $7a, $00, $ff
    db $00, $ff, $00, $cf, $30, $a7, $58, $02, $fd, $43, $bc, $03, $fc, $d1, $3e, $85
    db $7a, $82, $7d, $03, $fc, $85, $7a, $15, $ea, $8b, $74, $55, $aa, $7d, $80, $d9
    db $20, $f4, $00, $75, $80, $f2, $00, $51, $80, $d4, $00, $ca, $00, $55, $00, $2a
    db $00, $a5, $00, $52, $00, $4a, $00, $55, $00, $aa, $00, $49, $00, $5d, $00, $be
    db $00, $1f, $00, $bb, $04, $9f, $00, $5d, $02, $4f, $00, $3d, $02, $65, $1f, $6f
    db $1f, $27, $1f, $f7, $0f, $db, $07, $fb, $07, $ef, $1f, $5f, $bf, $fa, $e0, $ef
    db $f0, $f7, $f8, $e1, $fe, $fc, $ff, $f9, $fe, $fc, $ff, $f9, $fe, $8a, $00, $10
    db $00, $54, $00, $89, $00, $e0, $00, $a5, $00, $d0, $00, $a0, $00, $20, $00, $84
    db $00, $11, $00, $40, $00, $01, $00, $24, $00, $00, $00, $11, $00, $2f, $00, $02
    db $00, $2a, $00, $02, $00, $25, $00, $41, $00, $08, $00, $22, $00, $fd, $02, $fe
    db $01, $fd, $02, $df, $00, $7f, $00, $5f, $00, $ef, $00, $37, $00, $54, $ab, $c0
    db $3f, $b0, $4f, $60, $9f, $d4, $2b, $f0, $0f, $d8, $27, $f4, $0b, $44, $bb, $05
    db $fa, $02, $fd, $a8, $57, $02, $fd, $10, $ef, $0a, $f5, $05, $fa, $01, $fe, $4d
    db $b2, $b5, $4a, $80, $7f, $50, $af, $a0, $5f, $16, $e9, $55, $aa, $05, $fa, $68
    db $97, $54, $ab, $00, $ff, $00, $ff, $00, $ff, $82, $7d, $69, $96, $2c, $d3, $52
    db $ad, $09, $f6, $aa, $55, $a1, $5e, $94, $6b, $52, $ad, $54, $ab, $05, $fa, $05
    db $fa, $0b, $f4, $0f, $f0, $45, $ba, $17, $e8, $57, $a8, $2b, $d4, $2f, $d0, $bf
    db $40, $2f, $d0, $5d, $a0, $be, $40, $fd, $00, $7e, $80, $fa, $00, $d2, $00, $a9
    db $00, $4a, $00, $51, $00, $aa, $00, $64, $00, $d2, $00, $a8, $00, $a5, $00, $14
    db $00, $52, $00, $25, $00, $4f, $00, $8e, $01, $5b, $07, $f5, $0f, $74, $0f, $2e
    db $1f, $ae, $1f, $77, $0f, $f1, $0f, $10, $ef, $c1, $fe, $e4, $ff, $9f, $7f, $3f
    db $ff, $bf, $ff, $df, $ff, $27, $ff, $05, $ff, $a7, $5f, $1b, $ff, $fc, $ff, $fc
    db $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $90, $00, $85
    db $00, $ef, $00, $78, $87, $43, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $04, $00, $c1
    db $00, $21, $c0, $80, $e0, $d9, $e0, $ec, $f0, $f2, $fc, $f9, $fe, $01, $00, $48
    db $00, $a2, $00, $c4, $00, $e0, $00, $d1, $00, $a0, $00, $04, $00, $5b, $00, $4d
    db $00, $26, $00, $95, $00, $55, $00, $35, $00, $54, $00, $35, $00, $fd, $02, $bd
    db $02, $de, $01, $7f, $00, $af, $00, $6f, $00, $b7, $00, $57, $00, $09, $f6, $05
    db $fa, $80, $7f, $01, $fe, $00, $ff, $80, $7f, $80, $7f, $a0, $5f, $56, $a9, $55
    db $aa, $ff, $00, $5b, $a4, $bf, $40, $5d, $a2, $2b, $d4, $08, $f7, $ae, $51, $bd
    db $42, $ef, $10, $7f, $80, $ff, $00, $ee, $11, $5a, $a5, $aa, $55, $fa, $05, $aa
    db $55, $f8, $07, $ac, $53, $d0, $2f, $a8, $57, $94, $6b, $00, $ff, $5f, $a0, $2f
    db $d0, $3f, $c0, $5e, $a0, $3e, $c0, $7d, $80, $7e, $80, $ba, $40, $fd, $00, $fa
    db $00, $dd, $00, $ea, $00, $b5, $00, $6d, $00, $d5, $00, $b7, $00, $e2, $00, $b4
    db $00, $68, $00, $f2, $00, $b1, $00, $e8, $00, $74, $00, $f1, $00, $6f, $1f, $cf
    db $3f, $ff, $0f, $59, $07, $2d, $02, $95, $00, $4a, $00, $20, $00, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $1f, $ff, $ff, $0f, $b0, $0f, $1e, $01, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $5f, $bf, $ff, $ff, $ff
    db $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $fd, $fe, $fd, $fe, $f3
    db $fc, $e4, $f8, $d8, $e0, $99, $e0, $20, $c0, $e2, $00, $88, $00, $10, $00, $04
    db $00, $20, $00, $02, $00, $10, $00, $01, $00, $48, $00, $00, $00, $58, $00, $2d
    db $00, $34, $00, $1e, $00, $55, $00, $1e, $00, $2e, $00, $17, $00, $ab, $00, $55
    db $00, $aa, $00, $15, $00, $a5, $00, $88, $00, $a5, $00, $a4, $00, $d0, $2f, $f0
    db $0f, $fd, $02, $7b, $04, $7e, $01, $af, $00, $5f, $00, $2b, $00, $12, $ed, $09
    db $f6, $6d, $92, $57, $a8, $fa, $05, $ef, $10, $ff, $00, $ff, $00, $51, $ae, $5c
    db $a3, $75, $8a, $bc, $43, $fe, $01, $fd, $02, $fe, $01, $ef, $00, $2a, $d5, $45
    db $ba, $37, $c8, $d5, $2a, $bf, $40, $7f, $80, $ff, $00, $7e, $80, $fd, $00, $f6
    db $00, $ea, $00, $da, $00, $69, $00, $aa, $00, $a9, $00, $d4, $00, $d5, $00, $af
    db $00, $ab, $00, $af, $00, $5f, $00, $af, $00, $5f, $00, $bf, $00, $f4, $00, $f9
    db $00, $f0, $00, $fa, $00, $f8, $00, $f9, $00, $fa, $00, $f8, $00, $8a, $00, $21
    db $00, $8a, $00, $04, $00, $91, $00, $04, $00, $11, $00, $84, $00, $ab, $00, $00
    db $00, $55, $00, $08, $00, $52, $00, $04, $00, $50, $00, $05, $00, $d7, $3f, $70
    db $0f, $36, $01, $83, $00, $59, $00, $84, $00, $2a, $00, $24, $00, $ff, $ff, $7f
    db $ff, $7f, $ff, $8f, $7f, $e7, $1f, $39, $07, $8d, $02, $2b, $00, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $fe, $ff, $f7, $fc, $f3
    db $fc, $e0, $f8, $c9, $f0, $90, $e0, $25, $c0, $d0, $00, $94, $00, $21, $00, $00
    db $00, $a2, $00, $00, $00, $40, $00, $12, $00, $80, $00, $00, $00, $02, $00, $10
    db $00, $00, $00, $40, $00, $02, $00, $10, $00, $40, $00, $00, $00, $4e, $00, $1f
    db $00, $0f, $00, $4f, $00, $17, $00, $1f, $00, $8f, $00, $17, $00, $d2, $00, $a5
    db $00, $d4, $00, $f2, $00, $da, $00, $f9, $00, $f5, $00, $fd, $00, $95, $00, $25
    db $00, $4a, $00, $91, $00, $44, $00, $29, $00, $40, $00, $2a, $00, $5f, $00, $5f
    db $00, $aa, $00, $56, $00, $52, $00, $14, $00, $a2, $00, $49, $00, $df, $00, $bf
    db $00, $eb, $00, $ad, $00, $aa, $00, $a5, $00, $a9, $00, $45, $00, $fb, $00, $ed
    db $00, $da, $00, $6d, $00, $a4, $00, $52, $00, $2a, $00, $49, $00, $4a, $00, $52
    db $00, $8d, $00, $55, $00, $2b, $00, $ad, $00, $97, $00, $55, $00, $df, $00, $bf
    db $00, $7e, $01, $df, $00, $7d, $02, $fe, $01, $fb, $04, $ff, $00, $7c, $80, $fa
    db $00, $bc, $40, $6a, $90, $bd, $40, $fe, $00, $7e, $80, $ee, $10, $28, $00, $42
    db $00, $10, $00, $45, $00, $10, $00, $41, $00, $08, $00, $a2, $00, $90, $00, $25
    db $00, $08, $00, $42, $00, $24, $00, $08, $00, $42, $00, $28, $00, $91, $00, $04
    db $00, $92, $00, $41, $00, $88, $00, $25, $00, $88, $00, $45, $00, $40, $00, $aa
    db $00, $09, $00, $52, $00, $04, $00, $51, $00, $8a, $00, $20, $00, $fd, $fe, $fe
    db $f8, $f6, $f8, $e9, $f0, $ca, $f0, $92, $e0, $65, $80, $4a, $80, $42, $00, $28
    db $00, $a0, $00, $44, $00, $10, $00, $82, $00, $24, $00, $08, $00, $40, $00, $08
    db $00, $80, $00, $00, $00, $12, $00, $00, $00, $40, $00, $08, $00, $00, $00, $92
    db $00, $00, $00, $09, $00, $20, $00, $00, $00, $00, $00, $84, $00, $4f, $00, $1f
    db $00, $4f, $00, $1f, $00, $2f, $00, $1f, $00, $97, $00, $2f, $00, $f5, $00, $fe
    db $00, $ff, $00, $ff, $00, $df, $20, $ff, $00, $df, $20, $f7, $08, $51, $00, $d4
    db $00, $55, $00, $aa, $00, $6b, $00, $b5, $00, $ea, $00, $f5, $00, $12, $00, $80
    db $00, $54, $00, $22, $00, $54, $00, $55, $00, $ad, $00, $d7, $00, $22, $00, $89
    db $00, $44, $00, $29, $00, $92, $00, $49, $00, $55, $00, $bf, $00, $24, $00, $55
    db $00, $95, $00, $2d, $00, $5e, $00, $b7, $00, $7d, $00, $d7, $00, $be, $00, $6b
    db $00, $bf, $00, $ef, $00, $bf, $00, $ff, $00, $ff, $00, $7f, $00, $ed, $12, $ff
    db $00, $ed, $12, $fe, $01, $ef, $10, $fa, $05, $55, $aa, $7a, $85, $7e, $80, $bf
    db $40, $ed, $10, $bf, $40, $ff, $00, $bf, $40, $ef, $10, $bf, $40, $10, $00, $42
    db $00, $28, $00, $81, $00, $2a, $00, $91, $00, $4a, $00, $d1, $00, $82, $00, $11
    db $00, $04, $00, $10, $00, $45, $00, $00, $00, $2a, $00, $40, $00, $20, $00, $14
    db $00, $a1, $00, $14, $00, $41, $00, $14, $00, $49, $00, $10, $00, $8a, $00, $21
    db $00, $44, $00, $12, $00, $49, $00, $24, $00, $09, $00, $a4, $00, $ff, $00, $55
    db $aa, $ff, $00, $aa, $55, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $00, $55
    db $aa, $ff, $00, $aa, $55, $ff, $09, $ae, $55, $f7, $08, $5a, $a5, $ff, $00, $55
    db $aa, $ff, $00, $aa, $55, $ff, $40, $aa, $77, $ff, $08, $5a, $b5, $ff, $00, $55
    db $ab, $ff, $02, $af, $75, $ff, $80, $ba, $57, $f7, $08, $5e, $b5, $ff, $12, $5d
    db $eb, $ff, $ac, $ba, $55, $ff, $20, $ea, $5d, $f7, $08, $fa, $a5, $ff, $48, $f5
    db $aa, $ff, $40, $ab, $55, $ff, $14, $aa, $d5, $f7, $08, $7a, $e5, $ff, $80, $55
    db $aa, $ff, $00, $aa, $55, $ff, $00, $aa, $57, $f7, $08, $5a, $a5, $ff, $00, $55
    db $ae, $ff, $00, $aa, $55, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $08, $57
    db $aa, $ff, $81, $ea, $7d, $ff, $15, $aa, $75, $f7, $4a, $5a, $a5, $ff, $20, $d5
    db $aa, $ff, $50, $ae, $55, $ff, $02, $aa, $f5, $f7, $58, $5e, $a5, $ff, $00, $55
    db $aa, $ff, $00, $aa, $d5, $ff, $80, $ea, $55, $ff, $28, $da, $b7, $ff, $00, $57
    db $aa, $ff, $00, $aa, $5d, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $10, $55
    db $aa, $ff, $00, $aa, $55, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $02, $55
    db $aa, $ff, $02, $ab, $55, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $00, $75
    db $ea, $ff, $08, $ea, $55, $ff, $20, $aa, $55, $f7, $08, $5a, $a5, $ff, $00, $55
    db $aa, $ff, $00, $ab, $55, $ff, $0b, $ff, $55, $ff, $2a, $5a, $ad, $ff, $01, $55
    db $aa, $ff, $d4, $ea, $75, $ff, $50, $ea, $55, $f7, $08, $5a, $a5, $ff, $10, $55
    db $ae, $ff, $01, $ae, $55, $ff, $10, $aa, $55, $ff, $28, $da, $a5, $ff, $30, $d5
    db $aa, $ff, $40, $ea, $55, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $38, $c0, $88
    db $f0, $e7, $c0, $9f, $00, $0f, $70, $ce, $f1, $00, $00, $0f, $00, $35, $0a, $c0
    db $3f, $8a, $71, $00, $c0, $5c, $8e, $b7, $1f, $00, $00, $00, $00, $c0, $00, $60
    db $80, $30, $c0, $98, $60, $48, $30, $04, $38, $01, $00, $01, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $29, $c6, $81, $66, $80, $73, $42
    db $39, $21, $1c, $3a, $04, $1d, $02, $3e, $01, $de, $01, $ad, $00, $de, $00, $ed
    db $02, $c6, $01, $e3, $00, $45, $00, $e2, $00, $18, $fd, $31, $f8, $a0, $40, $04
    db $03, $44, $bf, $01, $fe, $ff, $00, $f5, $00, $04, $f8, $04, $f9, $85, $79, $f0
    db $0d, $7a, $85, $d7, $00, $a2, $00, $01, $00, $33, $fc, $ab, $9c, $81, $8e, $83
    db $c0, $0d, $f0, $8f, $70, $ba, $00, $55, $00, $a1, $63, $80, $66, $94, $66, $de
    db $27, $f8, $07, $5e, $01, $af, $00, $05, $00, $cf, $f0, $ef, $70, $0d, $30, $1f
    db $00, $3a, $c0, $35, $c0, $e8, $00, $54, $00, $01, $bf, $a1, $1f, $d8, $07, $e6
    db $01, $a9, $00, $04, $00, $01, $00, $04, $00, $94, $18, $04, $98, $06, $98, $0c
    db $80, $14, $e8, $f8, $00, $34, $00, $a8, $00, $00, $00, $00, $00, $00, $00, $02
    db $00, $05, $00, $2b, $00, $45, $18, $1b, $00, $58, $07, $30, $0f, $64, $18, $c3
    db $30, $ce, $27, $a8, $4c, $9d, $4e, $84, $4e, $f0, $00, $68, $80, $b1, $40, $18
    db $60, $31, $c0, $5a, $20, $15, $60, $bb, $40, $6a, $00, $bf, $00, $7b, $04, $e4
    db $1b, $90, $60, $a4, $4c, $8d, $5c, $cc, $19, $80, $00, $40, $00, $82, $00, $d5
    db $00, $e3, $00, $57, $80, $6b, $80, $47, $80, $2a, $00, $7f, $00, $e3, $1c, $80
    db $7f, $41, $80, $00, $b6, $a6, $34, $65, $2c, $82, $00, $41, $00, $a2, $00, $c5
    db $00, $63, $80, $46, $81, $63, $80, $56, $81, $a8, $00, $5c, $00, $ee, $10, $81
    db $7e, $01, $c2, $22, $99, $01, $82, $99, $36, $01, $00, $02, $00, $81, $00, $42
    db $01, $86, $01, $cc, $02, $94, $03, $4c, $03, $50, $00, $a0, $00, $f0, $00, $7a
    db $80, $1d, $00, $46, $78, $05, $18, $0e, $d0, $00, $00, $00, $00, $00, $00, $00
    db $00, $40, $00, $80, $00, $00, $60, $e0, $00, $15, $00, $02, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $81, $60, $c8, $37, $33, $0c, $1e
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $71, $80, $6a, $80, $d1, $00, $80
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $41, $d1, $2e, $6f, $10, $1d
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $e3, $00, $c5, $00, $a2, $00, $41
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $40, $2d, $83, $7c, $ff, $00, $2a
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $e3, $00, $c5, $00, $82, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $86, $23, $dc, $de, $20, $35
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $96, $00, $0f, $00, $87, $00, $03
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $2d, $10, $9a, $60, $f0, $00, $c0
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01
    db $02, $03, $04, $05, $06, $07, $08, $09, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $0a, $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $15, $16, $17
    db $18, $19, $1a, $1b, $00, $00, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $25
    db $26, $27, $28, $29, $2a, $2b, $2c, $2d, $00, $00, $00, $2e, $2f, $30, $31, $32
    db $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $3f, $40, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $41, $42, $43, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $44, $45
    db $46, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $47, $48, $49, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $4a, $4b, $4c, $4d, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $4e, $4f, $50, $51, $52, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $53, $54, $55
    db $56, $57, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $58, $59
    db $5a, $00, $5b, $5c, $5d, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $5e, $5f, $60, $61, $62, $63, $64, $65, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $66, $67, $68, $69, $6a, $6b, $6c, $6d, $6e, $6f
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $70, $71, $72, $73, $74, $75
    db $76, $77, $78, $79, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $7a, $7b
    db $7c, $7d, $7e, $7f, $80, $81, $82, $83, $84, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01
    db $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $01, $01, $01, $00, $01, $01, $01, $01, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01
    db $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01
    db $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01
    db $01, $01, $01, $01, $00, $00, $00, $00, $00, $4f, $21, $cf, $73, $11, $00, $90
    db $01, $00, $08, $cd, $b0, $01, $21, $cf, $7b, $11, $00, $88, $01, $50, $01, $cd
    db $b0, $01, $3e, $09, $11, $00, $98, $21, $1f, $7d, $06, $14, $0e, $09, $cd, $d4
    db $01, $af, $11, $20, $99, $06, $14, $0e, $09, $cd, $d4, $01, $fa, $0d, $df, $6f
    db $fa, $0e, $df, $67, $cd, $84, $0e, $cd, $84, $0e, $cd, $84, $0e, $cd, $84, $0e
    db $cd, $84, $0e, $cd, $84, $0e, $3e, $01, $ea, $ac, $d8, $cd, $06, $02, $c9

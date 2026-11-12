; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

; Bank $3C is empty. Nothing reads it.

SECTION "ROM Bank $03c", ROMX[$4000], BANK[$3c]

BankFiller_03c:
    ds $4000, $00

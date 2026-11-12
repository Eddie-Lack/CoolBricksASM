; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

; Bank $33 is empty. Nothing reads it.

SECTION "ROM Bank $033", ROMX[$4000], BANK[$33]

BankFiller_033:
    ds $4000, $00

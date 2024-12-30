SECTION "ROM Header", ROM0[$0100]
Boot::
    nop
    jp ProgramStart

HeaderLogo::            ; Nintendo logo
    db $ce, $ed, $66, $66, $cc, $0d, $00, $0b, $03, $73, $00, $83, $00, $0c, $00, $0d
    db $00, $08, $11, $1f, $88, $89, $00, $0e, $dc, $cc, $6e, $e6, $dd, $dd, $d9, $99
    db $bb, $bb, $67, $63, $6e, $0e, $ec, $cc, $dd, $dc, $99, $9f, $bb, $b9, $33, $3e

HeaderTitle::
    db "COOLBRICKS", $00

HeaderManufacturerCode::
    db "BOGP"

HeaderCGBFlag::
    db $c0

HeaderNewLicenseeCode::
    db $37, $35

HeaderSGBFlag::
    db $00

HeaderCartridgeType::
    db $19

HeaderROMSize::
    db $05

HeaderRAMSize::
    db $00

HeaderDestinationCode::
    db $01

HeaderOldLicenseeCode::
    db $33

HeaderMaskROMVersion::
    db $00

HeaderComplementCheck::
    db $56

HeaderGlobalChecksum::
    db $65, $3d
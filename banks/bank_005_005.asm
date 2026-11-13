; Disassembly of "coolbricks_original.gbc"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $005", ROMX[$4000], BANK[$5]

; Level table: one entry per level.
; Background, level header, brick layout (bank 8), power-up map (bank $0C).
LevelTable:
    dw Background_48c0, LevelHeader_001, BrickLayout_Level001, PowerupMap_Level001
    dw Background_48de, LevelHeader_002, BrickLayout_Level002, PowerupMap_Level002
    dw Background_48e4, LevelHeader_003, BrickLayout_Level003, PowerupMap_Level003
    dw Background_48c0, LevelHeader_004, BrickLayout_Level004, PowerupMap_Level004
    dw Background_48de, LevelHeader_005, BrickLayout_Level005, PowerupMap_Level005
    dw Background_48e4, LevelHeader_006, BrickLayout_Level006, PowerupMap_Level006
    dw Background_48d8, LevelHeader_007, BrickLayout_Level007, PowerupMap_Level007
    dw Background_48c0, LevelHeader_008, BrickLayout_Level008, PowerupMap_Level008
    dw Background_48de, LevelHeader_009, BrickLayout_Level009, PowerupMap_Level009
    dw Background_48e4, LevelHeader_010, BrickLayout_Level010, PowerupMap_Level010
    dw Background_48c0, LevelHeader_011, BrickLayout_Level011, PowerupMap_Level011
    dw Background_48de, LevelHeader_012, BrickLayout_Level012, PowerupMap_Level012
    dw Background_48e4, LevelHeader_013, BrickLayout_Level013, PowerupMap_Level013
    dw Background_48c0, LevelHeader_014, BrickLayout_Level014, PowerupMap_Level014
    dw Background_48de, LevelHeader_015, BrickLayout_Level015, PowerupMap_Level015
    dw Background_48e4, LevelHeader_016, BrickLayout_Level016, PowerupMap_Level016
    dw Background_48c0, LevelHeader_017, BrickLayout_Level017, PowerupMap_Level017
    dw Background_48de, LevelHeader_018, BrickLayout_Level018, PowerupMap_Level018
    dw Background_48e4, LevelHeader_019, BrickLayout_Level019, PowerupMap_Level019
    dw Background_48c0, LevelHeader_020, BrickLayout_Level020, PowerupMap_Level020
    dw Background_48de, LevelHeader_021, BrickLayout_Level021, PowerupMap_Level021
    dw Background_48e4, LevelHeader_022, BrickLayout_Level022, PowerupMap_Level022
    dw Background_48c0, LevelHeader_023, BrickLayout_Level023, PowerupMap_Level023
    dw Background_48de, LevelHeader_024, BrickLayout_Level024, PowerupMap_Level024
    dw Background_48e4, LevelHeader_025, BrickLayout_Level025, PowerupMap_Level025
    dw Background_48c0, LevelHeader_026, BrickLayout_Level026, PowerupMap_Level026
    dw Background_48de, LevelHeader_027, BrickLayout_Level027, PowerupMap_Level027
    dw Background_48e4, LevelHeader_028, BrickLayout_Level028, PowerupMap_Level028
    dw Background_48c0, LevelHeader_029, BrickLayout_Level029, PowerupMap_Level029
    dw Background_48de, LevelHeader_030, BrickLayout_Level030, PowerupMap_Level030
    dw Background_48e4, LevelHeader_031, BrickLayout_Level031, PowerupMap_Level031
    dw Background_48c0, LevelHeader_032, BrickLayout_Level032, PowerupMap_Level032
    dw Background_48de, LevelHeader_033, BrickLayout_Level033, PowerupMap_Level033
    dw Background_48e4, LevelHeader_034, BrickLayout_Level034, PowerupMap_Level034
    dw Background_48c0, LevelHeader_035, BrickLayout_Level035, PowerupMap_Level035
    dw Background_48de, LevelHeader_036, BrickLayout_Level036, PowerupMap_Level036
    dw Background_48e4, LevelHeader_037, BrickLayout_Level037, PowerupMap_Level037
    dw Background_48c0, LevelHeader_038, BrickLayout_Level038, PowerupMap_Level038
    dw Background_48de, LevelHeader_039, BrickLayout_Level039, PowerupMap_Level039
    dw Background_48e4, LevelHeader_040, BrickLayout_Level040, PowerupMap_Level040
    dw Background_48c0, LevelHeader_041, BrickLayout_Level041, PowerupMap_Level041
    dw Background_48de, LevelHeader_042, BrickLayout_Level042, PowerupMap_Level042
    dw Background_48e4, LevelHeader_043, BrickLayout_Level043, PowerupMap_Level043
    dw Background_48c0, LevelHeader_044, BrickLayout_Level044, PowerupMap_Level044
    dw Background_48de, LevelHeader_045, BrickLayout_Level045, PowerupMap_Level045
    dw Background_48e4, LevelHeader_046, BrickLayout_Level046, PowerupMap_Level046
    dw Background_48c0, LevelHeader_047, BrickLayout_Level047, PowerupMap_Level047
    dw Background_48de, LevelHeader_048, BrickLayout_Level048, PowerupMap_Level048
    dw Background_48e4, LevelHeader_049, BrickLayout_Level049, PowerupMap_Level049
    dw Background_48c0, LevelHeader_050, BrickLayout_Level050, PowerupMap_Level050
    dw Background_48de, LevelHeader_051, BrickLayout_Level051, PowerupMap_Level051
    dw Background_48e4, LevelHeader_052, BrickLayout_Level052, PowerupMap_Level052
    dw Background_48c0, LevelHeader_053, BrickLayout_Level053, PowerupMap_Level053
    dw Background_48de, LevelHeader_054, BrickLayout_Level054, PowerupMap_Level054
    dw Background_48e4, LevelHeader_055, BrickLayout_Level055, PowerupMap_Level055
    dw Background_48c0, LevelHeader_056, BrickLayout_Level056, PowerupMap_Level056
    dw Background_48de, LevelHeader_057, BrickLayout_Level057, PowerupMap_Level057
    dw Background_48e4, LevelHeader_058, BrickLayout_Level058, PowerupMap_Level058
    dw Background_48c0, LevelHeader_059, BrickLayout_Level059, PowerupMap_Level059
    dw Background_48de, LevelHeader_060, BrickLayout_Level060, PowerupMap_Level060
    dw Background_48e4, LevelHeader_061, BrickLayout_Level061, PowerupMap_Level061
    dw Background_48c0, LevelHeader_062, BrickLayout_Level062, PowerupMap_Level062
    dw Background_48de, LevelHeader_063, BrickLayout_Level063, PowerupMap_Level063
    dw Background_48e4, LevelHeader_064, BrickLayout_Level064, PowerupMap_Level064
    dw Background_48c0, LevelHeader_065, BrickLayout_Level065, PowerupMap_Level065
    dw Background_48de, LevelHeader_066, BrickLayout_Level066, PowerupMap_Level066
    dw Background_48e4, LevelHeader_067, BrickLayout_Level067, PowerupMap_Level067
    dw Background_48c0, LevelHeader_068, BrickLayout_Level068, PowerupMap_Level068
    dw Background_48de, LevelHeader_069, BrickLayout_Level069, PowerupMap_Level069
    dw Background_48e4, LevelHeader_070, BrickLayout_Level070, PowerupMap_Level070
    dw Background_48c0, LevelHeader_071, BrickLayout_Level071, PowerupMap_Level071
    dw Background_48de, LevelHeader_072, BrickLayout_Level072, PowerupMap_Level072
    dw Background_48e4, LevelHeader_073, BrickLayout_Level073, PowerupMap_Level073
    dw Background_48c0, LevelHeader_074, BrickLayout_Level074, PowerupMap_Level074
    dw Background_48de, LevelHeader_075, BrickLayout_Level075, PowerupMap_Level075
    dw Background_48e4, LevelHeader_076, BrickLayout_Level076, PowerupMap_Level076
    dw Background_48c0, LevelHeader_077, BrickLayout_Level077, PowerupMap_Level077
    dw Background_48de, LevelHeader_078, BrickLayout_Level078, PowerupMap_Level078
    dw Background_48e4, LevelHeader_079, BrickLayout_Level079, PowerupMap_Level079
    dw Background_48c0, LevelHeader_080, BrickLayout_Level080, PowerupMap_Level080
    dw Background_48de, LevelHeader_081, BrickLayout_Level081, PowerupMap_Level081
    dw Background_48e4, LevelHeader_082, BrickLayout_Level082, PowerupMap_Level082
    dw Background_48c0, LevelHeader_083, BrickLayout_Level083, PowerupMap_Level083
    dw Background_48de, LevelHeader_084, BrickLayout_Level084, PowerupMap_Level084
    dw Background_48e4, LevelHeader_085, BrickLayout_Level085, PowerupMap_Level085
    dw Background_48c0, LevelHeader_086, BrickLayout_Level086, PowerupMap_Level086
    dw Background_48de, LevelHeader_087, BrickLayout_Level087, PowerupMap_Level087
    dw Background_48e4, LevelHeader_088, BrickLayout_Level088, PowerupMap_Level088
    dw Background_48c0, LevelHeader_089, BrickLayout_Level089, PowerupMap_Level089
    dw Background_48de, LevelHeader_090, BrickLayout_Level090, PowerupMap_Level090
    dw Background_48e4, LevelHeader_091, BrickLayout_Level091, PowerupMap_Level091
    dw Background_48c0, LevelHeader_092, BrickLayout_Level092, PowerupMap_Level092
    dw Background_48de, LevelHeader_093, BrickLayout_Level093, PowerupMap_Level093
    dw Background_48e4, LevelHeader_094, BrickLayout_Level094, PowerupMap_Level094
    dw Background_48c0, LevelHeader_095, BrickLayout_Level095, PowerupMap_Level095
    dw Background_48de, LevelHeader_096, BrickLayout_Level096, PowerupMap_Level096
    dw Background_48e4, LevelHeader_097, BrickLayout_Level097, PowerupMap_Level097
    dw Background_48c0, LevelHeader_098, BrickLayout_Level098, PowerupMap_Level098
    dw Background_48de, LevelHeader_099, BrickLayout_Level099, PowerupMap_Level099
    dw Background_48e4, LevelHeader_100, BrickLayout_Level100, PowerupMap_Level100
    dw Background_48c0, LevelHeader_101, BrickLayout_Level101, PowerupMap_Level101
    dw Background_48de, LevelHeader_102, BrickLayout_Level102, PowerupMap_Level102
    dw Background_48e4, LevelHeader_103, BrickLayout_Level103, PowerupMap_Level103
    dw Background_48c0, LevelHeader_104, BrickLayout_Level104, PowerupMap_Level104
    dw Background_48de, LevelHeader_105, BrickLayout_Level105, PowerupMap_Level105
    dw Background_48e4, LevelHeader_106, BrickLayout_Level106, PowerupMap_Level106
    dw Background_48c0, LevelHeader_107, BrickLayout_Level107, PowerupMap_Level107
    dw Background_48de, LevelHeader_108, BrickLayout_Level108, PowerupMap_Level108
    dw Background_48e4, LevelHeader_109, BrickLayout_Level109, PowerupMap_Level109
    dw Background_48c0, LevelHeader_110, BrickLayout_Level110, PowerupMap_Level110
    dw Background_48de, LevelHeader_111, BrickLayout_Level111, PowerupMap_Level111
    dw Background_48e4, LevelHeader_112, BrickLayout_Level112, PowerupMap_Level112
    dw Background_48c0, LevelHeader_113, BrickLayout_Level113, PowerupMap_Level113
    dw Background_48de, LevelHeader_114, BrickLayout_Level114, PowerupMap_Level114
    dw Background_48e4, LevelHeader_115, BrickLayout_Level115, PowerupMap_Level115
    dw Background_48c0, LevelHeader_116, BrickLayout_Level116, PowerupMap_Level116
    dw Background_48de, LevelHeader_117, BrickLayout_Level117, PowerupMap_Level117
    dw Background_48e4, LevelHeader_118, BrickLayout_Level118, PowerupMap_Level118
    dw Background_48c0, LevelHeader_119, BrickLayout_Level119, PowerupMap_Level119
    dw Background_48de, LevelHeader_120, BrickLayout_Level120, PowerupMap_Level120
    dw Background_48e4, LevelHeader_121, BrickLayout_Level121, PowerupMap_Level121
    dw Background_48c0, LevelHeader_122, BrickLayout_Level122, PowerupMap_Level122
    dw Background_48de, LevelHeader_123, BrickLayout_Level123, PowerupMap_Level123
    dw Background_48e4, LevelHeader_124, BrickLayout_Level124, PowerupMap_Level124
    dw Background_48c0, LevelHeader_125, BrickLayout_Level125, PowerupMap_Level125
    dw Background_48de, LevelHeader_126, BrickLayout_Level126, PowerupMap_Level126
    dw Background_48e4, LevelHeader_127, BrickLayout_Level127, PowerupMap_Level127
    dw Background_48c0, LevelHeader_128, BrickLayout_Level128, PowerupMap_Level128
    dw Background_48de, LevelHeader_129, BrickLayout_Level129, PowerupMap_Level129
    dw Background_48e4, LevelHeader_130, BrickLayout_Level130, PowerupMap_Level130
    dw Background_48c0, LevelHeader_131, BrickLayout_Level131, PowerupMap_Level131
    dw Background_48de, LevelHeader_132, BrickLayout_Level132, PowerupMap_Level132
    dw Background_48e4, LevelHeader_133, BrickLayout_Level133, PowerupMap_Level133
    dw Background_48c0, LevelHeader_134, BrickLayout_Level134, PowerupMap_Level134
    dw Background_48de, LevelHeader_135, BrickLayout_Level135, PowerupMap_Level135
    dw Background_48e4, LevelHeader_136, BrickLayout_Level136, PowerupMap_Level136
    dw Background_48c0, LevelHeader_137, BrickLayout_Level137, PowerupMap_Level137
    dw Background_48de, LevelHeader_138, BrickLayout_Level138, PowerupMap_Level138
    dw Background_48e4, LevelHeader_139, BrickLayout_Level139, PowerupMap_Level139
    dw Background_48c0, LevelHeader_140, BrickLayout_Level140, PowerupMap_Level140
    dw Background_48de, LevelHeader_141, BrickLayout_Level141, PowerupMap_Level141
    dw Background_48e4, LevelHeader_142, BrickLayout_Level142, PowerupMap_Level142
    dw Background_48c0, LevelHeader_143, BrickLayout_Level143, PowerupMap_Level143
    dw Background_48de, LevelHeader_144, BrickLayout_Level144, PowerupMap_Level144
    dw Background_48e4, LevelHeader_145, BrickLayout_Level145, PowerupMap_Level145
    dw Background_48c0, LevelHeader_146, BrickLayout_Level146, PowerupMap_Level146
    dw Background_48de, LevelHeader_147, BrickLayout_Level147, PowerupMap_Level147
    dw Background_48e4, LevelHeader_148, BrickLayout_Level148, PowerupMap_Level148
    dw Background_48c0, LevelHeader_149, BrickLayout_Level149, PowerupMap_Level149
    dw Background_48de, LevelHeader_150, BrickLayout_Level150, PowerupMap_Level150
    dw Background_48e4, LevelHeader_151, BrickLayout_Level151, PowerupMap_Level151
    dw Background_48c0, LevelHeader_152, BrickLayout_Level152, PowerupMap_Level152
    dw Background_48de, LevelHeader_153, BrickLayout_Level153, PowerupMap_Level153
    dw Background_48e4, LevelHeader_154, BrickLayout_Level154, PowerupMap_Level154
    dw Background_48c0, LevelHeader_155, BrickLayout_Level155, PowerupMap_Level155
    dw Background_48de, LevelHeader_156, BrickLayout_Level156, PowerupMap_Level156
    dw Background_48e4, LevelHeader_157, BrickLayout_Level157, PowerupMap_Level157
    dw Background_48c0, LevelHeader_158, BrickLayout_Level158, PowerupMap_Level158
    dw Background_48de, LevelHeader_159, BrickLayout_Level159, PowerupMap_Level159
    dw Background_48e4, LevelHeader_160, BrickLayout_Level160, PowerupMap_Level160

; Level headers: level palette and brick palette (both in bank 1), then
; the level type (low nibble: 1 = UFO, 2 = blob) and the UFO flight height.
LevelHeader_050:
    dw LevelPalette_4670, BrickPalette_48d0
    db $02, $00
LevelHeader_075:
    dw LevelPalette_4670, BrickPalette_48e0
    db $01, $38
LevelHeader_030:
    dw LevelPalette_4670, BrickPalette_48d0
    db $00, $00
LevelHeader_108:
    dw LevelPalette_4670, BrickPalette_48d0
    db $00, $00
LevelHeader_034:
    dw LevelPalette_4670, BrickPalette_4900
    db $02, $00
LevelHeader_096:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_005:
    dw LevelPalette_4670, BrickPalette_48d0
    db $00, $00
LevelHeader_066:
    dw LevelPalette_4670, BrickPalette_4900
    db $00, $00
LevelHeader_022:
    dw LevelPalette_4670, BrickPalette_4900
    db $02, $00
LevelHeader_033:
    dw LevelPalette_4670, BrickPalette_48f0
    db $01, $20
LevelHeader_004:
    dw LevelPalette_4670, BrickPalette_48c0
    db $00, $00
LevelHeader_147:
    dw LevelPalette_4670, BrickPalette_4860
    db $01, $20
LevelHeader_007:
    dw LevelPalette_4670, BrickPalette_49b0
    db $00, $00
LevelHeader_009:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_006:
    dw LevelPalette_4670, BrickPalette_4950
    db $02, $00
LevelHeader_012:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_114:
    dw LevelPalette_4670, BrickPalette_48c0
    db $72, $00
LevelHeader_059:
    dw LevelPalette_4670, BrickPalette_48a0
    db $00, $00
LevelHeader_023:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_103:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_010:
    dw LevelPalette_4670, BrickPalette_4890
    db $00, $00
LevelHeader_072:
    dw LevelPalette_4670, BrickPalette_48e0
    db $01, $20
LevelHeader_043:
    dw LevelPalette_4670, BrickPalette_4840
    db $01, $50
LevelHeader_146:
    dw LevelPalette_4670, BrickPalette_48e0
    db $00, $00
LevelHeader_018:
    dw LevelPalette_4670, BrickPalette_48f0
    db $00, $00
LevelHeader_063:
    dw LevelPalette_4670, BrickPalette_48d0
    db $00, $00
LevelHeader_045:
    dw LevelPalette_4670, BrickPalette_4890
    db $72, $00
LevelHeader_020:
    dw LevelPalette_4670, BrickPalette_4890
    db $00, $00
LevelHeader_035:
    dw LevelPalette_4670, BrickPalette_48f0
    db $01, $20
LevelHeader_042:
    dw LevelPalette_4670, BrickPalette_49a0
    db $00, $00
LevelHeader_060:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_098:
    dw LevelPalette_4670, BrickPalette_4890
    db $01, $38
LevelHeader_159:
    dw LevelPalette_4670, BrickPalette_4960
    db $00, $00
LevelHeader_160:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_016:
    dw LevelPalette_4670, BrickPalette_4920
    db $00, $00
LevelHeader_142:
    dw LevelPalette_4670, BrickPalette_4910
    db $01, $20
LevelHeader_105:
    dw LevelPalette_4670, BrickPalette_4960
    db $00, $00
LevelHeader_107:
    dw LevelPalette_4670, BrickPalette_4850
    db $00, $00
LevelHeader_038:
    dw LevelPalette_4670, BrickPalette_4880
    db $00, $00
LevelHeader_053:
    dw LevelPalette_4670, BrickPalette_4840
    db $00, $00
LevelHeader_061:
    dw LevelPalette_46b0, BrickPalette_4860
    db $00, $00
LevelHeader_087:
    dw LevelPalette_46b0, BrickPalette_4910
    db $00, $00
LevelHeader_149:
    dw LevelPalette_46b0, BrickPalette_48f0
    db $00, $00
LevelHeader_136:
    dw LevelPalette_46b0, BrickPalette_48c0
    db $00, $00
LevelHeader_083:
    dw LevelPalette_46b0, BrickPalette_49a0
    db $00, $00
LevelHeader_093:
    dw LevelPalette_46b0, BrickPalette_48d0
    db $00, $00
LevelHeader_073:
    dw LevelPalette_4670, BrickPalette_48c0
    db $72, $00
LevelHeader_120:
    dw LevelPalette_4670, BrickPalette_48c0
    db $01, $30
LevelHeader_151:
    dw LevelPalette_4670, BrickPalette_48d0
    db $00, $00
LevelHeader_132:
    dw LevelPalette_4670, BrickPalette_48f0
    db $01, $20
LevelHeader_156:
    dw LevelPalette_4670, BrickPalette_4910
    db $01, $30
LevelHeader_121:
    dw LevelPalette_4670, BrickPalette_4940
    db $01, $20
LevelHeader_084:
    dw LevelPalette_4670, BrickPalette_48c0
    db $00, $00
LevelHeader_021:
    dw LevelPalette_4670, BrickPalette_4950
    db $00, $00
LevelHeader_086:
    dw LevelPalette_4670, BrickPalette_48e0
    db $01, $38
LevelHeader_001:
    dw LevelPalette_4670, BrickPalette_48d0
    db $00, $00
LevelHeader_025:
    dw LevelPalette_4670, BrickPalette_4960
    db $00, $00
LevelHeader_112:
    dw LevelPalette_4670, BrickPalette_48c0
    db $01, $20
LevelHeader_126:
    dw LevelPalette_4670, BrickPalette_4890
    db $00, $00
LevelHeader_078:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_068:
    dw LevelPalette_4670, BrickPalette_48f0
    db $00, $00
LevelHeader_104:
    dw LevelPalette_4670, BrickPalette_48a0
    db $00, $00
LevelHeader_140:
    dw LevelPalette_4670, BrickPalette_48e0
    db $00, $00
LevelHeader_031:
    dw LevelPalette_4670, BrickPalette_49a0
    db $00, $00
LevelHeader_097:
    dw LevelPalette_4670, BrickPalette_4940
    db $72, $00
LevelHeader_117:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_134:
    dw LevelPalette_4670, BrickPalette_48f0
    db $72, $00
LevelHeader_124:
    dw LevelPalette_4670, BrickPalette_48c0
    db $00, $00
LevelHeader_113:
    dw LevelPalette_4670, BrickPalette_4880
    db $72, $00
LevelHeader_094:
    dw LevelPalette_4670, BrickPalette_48f0
    db $72, $00
LevelHeader_081:
    dw LevelPalette_4670, BrickPalette_4960
    db $00, $00
LevelHeader_101:
    dw LevelPalette_4670, BrickPalette_48f0
    db $00, $00
LevelHeader_079:
    dw LevelPalette_4670, BrickPalette_4900
    db $72, $00
LevelHeader_055:
    dw LevelPalette_4670, BrickPalette_4920
    db $00, $00
LevelHeader_058:
    dw LevelPalette_4670, BrickPalette_4920
    db $00, $00
LevelHeader_135:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_130:
    dw LevelPalette_4670, BrickPalette_4910
    db $72, $00
LevelHeader_089:
    dw LevelPalette_4670, BrickPalette_48f0
    db $12, $00
LevelHeader_090:
    dw LevelPalette_4670, BrickPalette_4990
    db $00, $00
LevelHeader_076:
    dw LevelPalette_4670, BrickPalette_48c0
    db $72, $00
LevelHeader_051:
    dw LevelPalette_4670, BrickPalette_48c0
    db $01, $20
LevelHeader_069:
    dw LevelPalette_4670, BrickPalette_48d0
    db $01, $20
LevelHeader_062:
    dw LevelPalette_46f0, BrickPalette_4950
    db $72, $00
LevelHeader_046:
    dw LevelPalette_46f0, BrickPalette_4970
    db $72, $00
LevelHeader_027:
    dw LevelPalette_46f0, BrickPalette_48c0
    db $00, $00
LevelHeader_036:
    dw LevelPalette_46f0, BrickPalette_4950
    db $00, $00
LevelHeader_048:
    dw LevelPalette_46f0, BrickPalette_4970
    db $00, $00
LevelHeader_037:
    dw LevelPalette_46f0, BrickPalette_48f0
    db $00, $00
LevelHeader_054:
    dw LevelPalette_4730, BrickPalette_4960
    db $00, $00
LevelHeader_028:
    dw LevelPalette_4730, BrickPalette_48d0
    db $00, $00
LevelHeader_115:
    dw LevelPalette_4730, BrickPalette_4970
    db $00, $00
LevelHeader_056:
    dw LevelPalette_4730, BrickPalette_48e0
    db $00, $00
LevelHeader_057:
    dw LevelPalette_4730, BrickPalette_4890
    db $72, $00
LevelHeader_153:
    dw LevelPalette_4730, BrickPalette_4920
    db $00, $00
LevelHeader_085:
    dw LevelPalette_4770, BrickPalette_4950
    db $00, $00
LevelHeader_077:
    dw LevelPalette_4770, BrickPalette_4950
    db $00, $00
LevelHeader_157:
    dw LevelPalette_4670, BrickPalette_4920
    db $00, $00
LevelHeader_155:
    dw LevelPalette_4670, BrickPalette_48e0
    db $00, $00
LevelHeader_158:
    dw LevelPalette_4670, BrickPalette_4860
    db $00, $00
LevelHeader_150:
    dw LevelPalette_4670, BrickPalette_4920
    db $00, $00
LevelHeader_133:
    dw LevelPalette_4670, BrickPalette_48d0
    db $72, $00
LevelHeader_152:
    dw LevelPalette_4670, BrickPalette_48c0
    db $00, $00
LevelHeader_154:
    dw LevelPalette_4670, BrickPalette_48d0
    db $00, $00
LevelHeader_145:
    dw LevelPalette_4670, BrickPalette_48f0
    db $00, $00
LevelHeader_047:
    dw LevelPalette_4670, BrickPalette_4860
    db $01, $20
LevelHeader_071:
    dw LevelPalette_4670, BrickPalette_48f0
    db $00, $00
LevelHeader_122:
    dw LevelPalette_4670, BrickPalette_48d0
    db $00, $00
LevelHeader_127:
    dw LevelPalette_4670, BrickPalette_4890
    db $00, $00
LevelHeader_144:
    dw LevelPalette_47b0, BrickPalette_4950
    db $00, $00
LevelHeader_148:
    dw LevelPalette_47b0, BrickPalette_4860
    db $00, $00
LevelHeader_138:
    dw LevelPalette_47b0, BrickPalette_48b0
    db $72, $00
LevelHeader_109:
    dw LevelPalette_47b0, BrickPalette_48f0
    db $00, $00
LevelHeader_118:
    dw LevelPalette_47f0, BrickPalette_48f0
    db $00, $00
LevelHeader_111:
    dw LevelPalette_47f0, BrickPalette_4900
    db $72, $00
LevelHeader_002:
    dw LevelPalette_4670, BrickPalette_48c0
    db $00, $00
LevelHeader_082:
    dw LevelPalette_4670, BrickPalette_48b0
    db $00, $00
LevelHeader_003:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_014:
    dw LevelPalette_4670, BrickPalette_4850
    db $00, $00
LevelHeader_011:
    dw LevelPalette_4670, BrickPalette_49a0
    db $00, $00
LevelHeader_026:
    dw LevelPalette_4670, BrickPalette_48b0
    db $00, $00
LevelHeader_044:
    dw LevelPalette_4670, BrickPalette_4930
    db $00, $00
LevelHeader_032:
    dw LevelPalette_4670, BrickPalette_4960
    db $00, $00
LevelHeader_024:
    dw LevelPalette_4670, BrickPalette_4920
    db $00, $00
LevelHeader_015:
    dw LevelPalette_4670, BrickPalette_48c0
    db $00, $00
LevelHeader_040:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_019:
    dw LevelPalette_4670, BrickPalette_4920
    db $00, $00
LevelHeader_017:
    dw LevelPalette_4670, BrickPalette_49a0
    db $00, $00
LevelHeader_128:
    dw LevelPalette_4670, BrickPalette_48f0
    db $00, $00
LevelHeader_070:
    dw LevelPalette_4670, BrickPalette_48b0
    db $00, $00
LevelHeader_092:
    dw LevelPalette_4670, BrickPalette_48f0
    db $00, $00
LevelHeader_064:
    dw LevelPalette_4670, BrickPalette_4960
    db $00, $00
LevelHeader_052:
    dw LevelPalette_4670, BrickPalette_48b0
    db $00, $00
LevelHeader_067:
    dw LevelPalette_4670, BrickPalette_4910
    db $00, $00
LevelHeader_116:
    dw LevelPalette_4670, BrickPalette_4950
    db $00, $00
LevelHeader_139:
    dw LevelPalette_4670, BrickPalette_48d0
    db $00, $00
LevelHeader_141:
    dw LevelPalette_4670, BrickPalette_4920
    db $00, $00
LevelHeader_125:
    dw LevelPalette_4670, BrickPalette_4980
    db $00, $00
LevelHeader_119:
    dw LevelPalette_4670, BrickPalette_49a0
    db $00, $00
LevelHeader_091:
    dw LevelPalette_4670, BrickPalette_49a0
    db $01, $20
LevelHeader_099:
    dw LevelPalette_4670, BrickPalette_48c0
    db $01, $30
LevelHeader_080:
    dw LevelPalette_4670, BrickPalette_4960
    db $01, $30
LevelHeader_013:
    dw LevelPalette_4670, BrickPalette_4990
    db $00, $00
LevelHeader_041:
    dw LevelPalette_4670, BrickPalette_48f0
    db $01, $20
LevelHeader_039:
    dw LevelPalette_4670, BrickPalette_4950
    db $72, $00
LevelHeader_065:
    dw LevelPalette_4670, BrickPalette_4850
    db $72, $00
LevelHeader_095:
    dw LevelPalette_4670, BrickPalette_4860
    db $00, $00
LevelHeader_110:
    dw LevelPalette_4670, BrickPalette_4920
    db $00, $00
LevelHeader_008:
    dw LevelPalette_4670, BrickPalette_48a0
    db $01, $20
LevelHeader_102:
    dw LevelPalette_4670, BrickPalette_48d0
    db $72, $00
LevelHeader_049:
    dw LevelPalette_4670, BrickPalette_4960
    db $01, $20
LevelHeader_106:
    dw LevelPalette_4670, BrickPalette_48f0
    db $00, $00
LevelHeader_029:
    dw LevelPalette_4670, BrickPalette_4990
    db $00, $00
LevelHeader_088:
    dw LevelPalette_4670, BrickPalette_48c0
    db $00, $00
LevelHeader_074:
    dw LevelPalette_4670, BrickPalette_48f0
    db $72, $00
LevelHeader_143:
    dw LevelPalette_4670, BrickPalette_4920
    db $00, $00
LevelHeader_137:
    dw LevelPalette_4670, BrickPalette_4920
    db $01, $20
LevelHeader_100:
    dw LevelPalette_47f0, BrickPalette_48d0
    db $00, $00
LevelHeader_129:
    dw LevelPalette_47f0, BrickPalette_4900
    db $00, $00
LevelHeader_131:
    dw LevelPalette_4670, BrickPalette_48e0
    db $00, $00
LevelHeader_123:
    dw LevelPalette_4670, BrickPalette_48f0
    db $00, $00

; Backgrounds. Each entry is: tile data pointer, its bank, tile map pointer, its bank.
; Background_48ea is the photo shown by the TNRZ cheat.
Background_48c0:
    dw BackgroundTiles_004_4000
    db BANK(BackgroundTiles_004_4000)
    dw BackgroundMap_003_4120
    db BANK(BackgroundMap_003_4120)
Background_48c6:
    dw BackgroundTiles_004_4000 + $f70
    db BANK(BackgroundTiles_004_4000)
    dw BackgroundMap_003_4240
    db BANK(BackgroundMap_003_4240)
Background_48cc:
    dw BackgroundTiles_004_5a10
    db BANK(BackgroundTiles_004_5a10)
    dw BackgroundMap_003_4360
    db BANK(BackgroundMap_003_4360)
Background_48d2:
    dw BackgroundTiles_004_69e0
    db BANK(BackgroundTiles_004_69e0)
    dw BackgroundMap_003_4480
    db BANK(BackgroundMap_003_4480)
Background_48d8:
    dw BackgroundTiles_004_7940
    db BANK(BackgroundTiles_004_7940)
    dw BackgroundMap_003_45a0
    db BANK(BackgroundMap_003_45a0)
Background_48de:
    dw BackgroundTiles_00a_4000
    db BANK(BackgroundTiles_00a_4000)
    dw BackgroundMap_003_46c0
    db BANK(BackgroundMap_003_46c0)
Background_48e4:
    dw BackgroundTiles_00a_4000 + $fd0
    db BANK(BackgroundTiles_00a_4000)
    dw BackgroundMap_003_47e0
    db BANK(BackgroundMap_003_47e0)
Background_48ea:
    dw BackgroundTiles_00a_5f00 + $b0
    db BANK(BackgroundTiles_00a_5f00)
    dw BackgroundMap_003_4900
    db BANK(BackgroundMap_003_4900)

Text_English_GameOver:
    dw $9900
    db $00, $02, "     GAME  OVER     ", $ff

Text_French_GameOver:
    dw $9900
    db $00, $02, "  PARTIE  TERMINEE  ", $ff

Text_Spanish_GameOver:
    dw $9900
    db $00, $02, "    FIN DEL JUEGO  ", $ff

Text_German_GameOver:
    dw $9900
    db $00, $02, "     GAME  OVER     ", $ff

Text_Italian_GameOver:
    dw $9900
    db $00, $02, "     FIN  GIOCO     ", $ff

Gfx_GameOver_005_496c:
    INCBIN "gfx/image_005_496c.2bpp"

    INCBIN "gfx/image_005_616c.2bpp"

Tilemap_GameOver_005_623c:
    db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13
    db $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $25, $26, $27
    db $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b
    db $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f
    db $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $5e, $5f, $60, $61, $62, $63
    db $64, $65, $66, $67, $68, $69, $6a, $6b, $6c, $6d, $6e, $6f, $70, $71, $72, $73, $74, $75, $76, $77
    db $78, $79, $7a, $7b, $7c, $7d, $7e, $7f, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a, $8b
    db $8c, $8d, $8e, $8f, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $9c, $9d, $9e, $9f
    db $a0, $a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $ae, $af, $b0, $b1, $b2, $b3
    db $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37, $38
    db $39, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c
    db $4d, $4e, $4f, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $5e, $5f, $60
    db $61, $62, $63, $64, $65, $66, $67, $68, $69, $6a, $6b, $6c, $6d, $6e, $6f, $70, $71, $72, $73, $74
    db $75, $76, $77, $78, $79, $7a, $7b, $7c, $7d, $7e, $7f, $80, $81, $82, $83, $84, $85, $86, $87, $88
    db $89, $8a, $8b, $8c, $8d, $8e, $8f, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $9c
    db $9d, $9e, $9f, $a0, $a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $ae, $af, $b0
    db $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8, $b9, $ba, $bb, $bc, $bd, $be, $bf, $c0, $c1, $c2, $c3, $c4
    db $c5, $c6, $c7, $c8, $c9, $ca, $cb, $cc, $cd, $ce, $cf, $d0, $d1, $d2, $d3, $d4, $d5, $d6, $d7, $d8

Tilemap_GameOver_005_63a4:
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Gfx_Credits_005_650c:
    INCBIN "gfx/image_005_650c.2bpp"

    db $bf, $00, $fa, $00, $48, $00, $25, $00, $90, $00, $44, $00, $28, $00
    db $41, $00, $14, $00, $81, $00, $4d, $00, $2b, $00, $8a, $00, $25, $00, $95, $00
    db $02, $00, $52, $00, $04, $00, $e8, $17, $e8, $17
    db $e4
    db $1b, $74, $0b, $ea, $15, $f4, $0b, $7d, $02, $b6, $09, $09, $ff, $00, $ff, $00
    db $ff, $01, $fe, $8b, $74, $25, $da, $17, $e8, $4b, $b4, $04, $fb, $12
    db $ed
    db $a0, $5f, $69, $96, $a9, $56, $d5, $2a
    db $ed
    db $12, $be, $41, $df, $20, $b7, $48, $af, $50, $5d, $a0, $7f
    db $80, $5f, $a0, $bf, $40, $ff, $00, $e0, $1f
    db $fd
    db $02, $7f, $00, $af, $00, $f7, $00, $5d, $00, $ff, $00, $bf, $00, $ff, $00, $7f
    db $80, $fb, $00, $ff, $00, $ef, $00, $bf, $00, $ff, $00, $3e, $c0, $a0, $5f, $d4
    db $2b, $f9, $06, $ed, $12, $fa, $05, $f7, $08, $ff, $00, $ff, $00, $38, $c7, $4e
    db $b1, $2b, $d4, $5f, $a0, $af, $50, $ff, $00, $ff, $00, $ff, $00, $20, $ff, $01
    db $fe, $80, $7f, $50, $bf, $81, $7e, $81, $7e, $c1, $3e, $81, $7e, $5d, $a0, $7c
    db $80, $ad, $50, $bc, $40, $7c, $80, $5a, $a0, $7d, $80, $b8, $40, $57, $00, $ba
    db $00, $17, $00, $ad, $00, $b6, $00, $5b, $00, $6a, $00, $ab, $00, $b5, $00
    db $eb
    db $00, $b3, $00, $d7, $00
    db $db
    db $00
    db $e3
    db $00, $aa, $00, $aa, $00, $e7, $1f, $f5, $0f, $f3, $0f, $59, $a7, $39, $c7, $1f
    db $e3
    db $3f, $c3, $db, $27, $ff, $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $fe, $ff, $ff, $ff, $fe, $ff, $fe, $ff, $fa, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $bd, $00, $b7, $00, $bb, $00, $2b, $80, $6b, $80, $7b, $80
    db $95, $e0, $c8, $f0, $94, $00, $c2, $00, $c4, $00, $e2, $00, $61, $80, $c4, $00
    db $43, $00, $29, $00, $10, $00, $42, $00, $08, $00, $80, $00, $0a, $00, $a0, $00
    db $00, $00, $49, $00
    db $fd
    db $02, $3f, $00, $7f, $00, $3f, $00, $7f, $00, $1f, $00, $5f, $00, $0b, $00, $07
    db $f8, $8b, $74, $a7, $58, $85, $7a
    db $d3
    db $2c
    db $eb
    db $14, $d5, $2a, $fa, $05, $ff, $00, $ff, $00, $df, $00, $ad, $00, $ff, $00, $ff
    db $00
    db $fc
    db $03, $f0, $0f, $be, $40, $ff, $00, $ff, $00, $5f, $00, $be, $01, $dd, $02
    db $fc
    db $03, $2a, $d5, $ee, $01, $fe, $01
    db $fd
    db $02, $61, $9e, $08, $f7, $0a, $ff, $2e, $ff, $02, $ff, $bf, $40, $bf, $40, $56
    db $a9, $00, $ff, $95, $7f, $3a, $ff, $bb
    db $fc
    db $13
    db $fc
    db $7f, $00
    db $fc
    db $00, $da, $20, $3d, $c0, $1b, $e0, $3d, $c2, $d6, $29, $e9, $16, $7a, $00, $ff
    db $00, $ff, $00, $cf, $30, $a7, $58, $02
    db $fd
    db $43, $bc, $03
    db $fc
    db $d1, $3e, $85, $7a, $82, $7d, $03
    db $fc
    db $85
    db $7a, $15, $ea, $8b, $74, $55, $aa, $7d, $80, $d9, $20, $f4, $00, $75, $80, $f2
    db $00, $51, $80, $d4, $00, $ca, $00, $55, $00, $2a, $00, $a5, $00, $52, $00, $4a
    db $00, $55, $00, $aa, $00, $49, $00, $5d, $00, $be, $00, $1f, $00, $bb, $04, $9f
    db $00, $5d, $02, $4f, $00, $3d, $02, $65, $1f, $6f, $1f, $27, $1f, $f7, $0f
    db $db
    db $07, $fb, $07, $ef, $1f, $5f, $bf, $fa, $e0, $ef, $f0, $f7, $f8, $e1, $fe, $fc
    db $ff, $f9, $fe, $fc, $ff, $f9, $fe, $8a, $00, $10, $00, $54, $00, $89, $00, $e0
    db $00, $a5, $00, $d0, $00, $a0, $00, $20, $00
    db $84, $00, $11, $00, $40, $00, $01, $00, $24, $00, $00, $00, $11, $00, $2f, $00
    db $02, $00, $2a, $00, $02, $00, $25, $00, $41, $00, $08, $00, $22, $00
    db $fd
    db $02, $fe, $01
    db $fd
    db $02, $df, $00, $7f, $00, $5f, $00, $ef, $00, $37, $00, $54, $ab, $c0, $3f, $b0
    db $4f, $60, $9f, $d4, $2b, $f0, $0f, $d8, $27
    db $f4
    db $0b, $44, $bb, $05, $fa, $02, $fd, $a8, $57, $02
    db $fd
    db $10
    db $ef, $0a, $f5, $05, $fa, $01, $fe, $4d, $b2, $b5, $4a, $80, $7f, $50, $af, $a0
    db $5f, $16, $e9, $55, $aa, $05, $fa, $68, $97, $54, $ab, $00, $ff, $00, $ff, $00
    db $ff, $82, $7d, $69, $96, $2c
    db $d3
    db $52, $ad, $09, $f6, $aa, $55, $a1, $5e, $94, $6b, $52, $ad, $54, $ab, $05, $fa
    db $05, $fa, $0b
    db $f4
    db $0f, $f0, $45, $ba, $17, $e8, $57, $a8, $2b, $d4, $2f, $d0, $bf, $40, $2f, $d0
    db $5d, $a0, $be, $40
    db $fd
    db $00, $7e, $80, $fa, $00, $d2, $00, $a9, $00, $4a, $00, $51, $00, $aa, $00, $64
    db $00, $d2, $00, $a8, $00, $a5, $00, $14, $00, $52, $00, $25, $00, $4f, $00, $8e
    db $01, $5b, $07, $f5, $0f, $74, $0f, $2e, $1f, $ae, $1f, $77, $0f, $f1, $0f
    db $10
    db $ef, $c1, $fe, $e4, $ff, $9f, $7f, $3f, $ff, $bf, $ff, $df, $ff, $27, $ff, $05
    db $ff, $a7, $5f, $1b, $ff
    db $fc
    db $ff
    db $fc
    db $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $90, $00, $85
    db $00, $ef, $00, $78, $87, $43, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $04, $00, $c1
    db $00, $21, $c0, $80, $e0, $d9, $e0, $ec, $f0, $f2
    db $fc
    db $f9, $fe, $01, $00, $48, $00, $a2, $00, $c4, $00, $e0, $00, $d1, $00, $a0, $00
    db $04, $00, $5b, $00, $4d, $00, $26, $00, $95, $00, $55, $00, $35, $00, $54, $00
    db $35, $00
    db $fd
    db $02, $bd, $02, $de, $01, $7f, $00, $af, $00, $6f, $00, $b7, $00, $57, $00, $09
    db $f6, $05, $fa, $80, $7f, $01, $fe, $00, $ff, $80, $7f, $80, $7f, $a0, $5f, $56
    db $a9, $55, $aa, $ff, $00, $5b, $a4, $bf, $40, $5d, $a2, $2b, $d4, $08, $f7, $ae
    db $51, $bd, $42, $ef
    db $10
    db $7f, $80, $ff, $00, $ee, $11, $5a, $a5, $aa, $55, $fa, $05, $aa, $55, $f8, $07
    db $ac, $53, $d0, $2f, $a8, $57, $94, $6b, $00, $ff, $5f, $a0, $2f, $d0, $3f, $c0
    db $5e, $a0, $3e, $c0, $7d, $80, $7e, $80, $ba, $40
    db $fd
    db $00, $fa, $00, $dd, $00, $ea, $00, $b5, $00, $6d, $00, $d5, $00, $b7, $00, $e2
    db $00, $b4, $00, $68, $00, $f2, $00, $b1, $00
    db $e8, $00, $74, $00, $f1, $00, $6f, $1f, $cf, $3f, $ff, $0f, $59, $07, $2d, $02
    db $95, $00, $4a, $00, $20, $00
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $1f, $ff, $ff, $0f, $b0, $0f, $1e, $01
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $5f, $bf
    db $ff, $ff, $ff, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff
    db $fd
    db $fe, $fd, $fe, $f3
    db $fc
    db $e4
    db $f8, $d8, $e0, $99, $e0, $20, $c0, $e2, $00, $88, $00, $10, $00, $04, $00, $20
    db $00
    db $02, $00, $10, $00, $01, $00, $48, $00, $00, $00, $58, $00, $2d, $00, $34, $00
    db $1e, $00, $55, $00, $1e, $00, $2e, $00, $17, $00, $ab, $00, $55, $00, $aa, $00
    db $15, $00, $a5, $00, $88, $00, $a5, $00, $a4, $00, $d0, $2f, $f0, $0f
    db $fd
    db $02, $7b, $04, $7e, $01, $af, $00, $5f, $00, $2b, $00, $12
    db $ed
    db $09, $f6, $6d, $92, $57, $a8, $fa, $05, $ef
    db $10
    db $ff, $00, $ff, $00, $51, $ae, $5c, $a3, $75, $8a, $bc, $43, $fe, $01
    db $fd
    db $02, $fe, $01, $ef, $00, $2a, $d5, $45, $ba, $37, $c8, $d5, $2a, $bf, $40, $7f
    db $80, $ff, $00, $7e, $80
    db $fd
    db $00, $f6, $00, $ea, $00, $da, $00, $69, $00, $aa, $00, $a9, $00, $d4, $00, $d5
    db $00, $af, $00, $ab, $00, $af, $00, $5f, $00, $af, $00, $5f, $00, $bf, $00
    db $f4
    db $00, $f9, $00, $f0, $00, $fa, $00, $f8, $00, $f9, $00, $fa, $00, $f8, $00, $8a
    db $00, $21, $00, $8a, $00, $04, $00, $91, $00, $04, $00, $11, $00, $84, $00, $ab
    db $00, $00, $00, $55, $00, $08, $00, $52, $00, $04, $00, $50, $00, $05, $00, $d7
    db $3f, $70, $0f, $36, $01, $83, $00, $59, $00, $84, $00, $2a, $00, $24, $00, $ff
    db $ff, $7f, $ff, $7f, $ff, $8f, $7f, $e7, $1f, $39, $07, $8d, $02, $2b, $00, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $fe, $ff, $f7
    db $fc
    db $f3
    db $fc
    db $e0, $f8, $c9, $f0, $90, $e0, $25, $c0, $d0, $00, $94, $00, $21, $00, $00, $00
    db $a2, $00, $00, $00, $40, $00, $12, $00, $80, $00, $00, $00, $02, $00, $10, $00
    db $00, $00, $40, $00, $02, $00, $10, $00, $40, $00, $00, $00, $4e, $00, $1f, $00
    db $0f, $00, $4f, $00, $17, $00, $1f, $00, $8f, $00, $17, $00, $d2, $00, $a5, $00
    db $d4, $00, $f2, $00, $da, $00, $f9, $00, $f5, $00
    db $fd
    db $00, $95, $00, $25, $00, $4a, $00, $91, $00, $44, $00, $29, $00, $40, $00, $2a
    db $00, $5f, $00, $5f, $00, $aa, $00, $56, $00, $52, $00, $14, $00, $a2, $00, $49
    db $00, $df, $00, $bf, $00
    db $eb
    db $00, $ad, $00, $aa, $00, $a5, $00, $a9, $00, $45, $00, $fb, $00
    db $ed
    db $00, $da, $00, $6d, $00, $a4, $00, $52, $00, $2a, $00, $49, $00, $4a, $00, $52
    db $00, $8d, $00, $55, $00, $2b, $00, $ad, $00, $97, $00, $55, $00, $df, $00, $bf
    db $00, $7e, $01, $df, $00, $7d, $02, $fe, $01, $fb, $04, $ff, $00, $7c, $80, $fa
    db $00, $bc, $40, $6a, $90, $bd, $40, $fe, $00, $7e, $80, $ee, $10, $28, $00
    db $42, $00, $10, $00, $45, $00, $10, $00, $41, $00, $08, $00, $a2, $00, $90, $00
    db $25, $00, $08, $00, $42, $00, $24, $00, $08, $00, $42, $00, $28, $00
    db $91, $00, $04, $00, $92, $00, $41, $00, $88, $00, $25, $00, $88, $00, $45, $00
    db $40, $00, $aa, $00, $09, $00, $52, $00, $04, $00, $51, $00, $8a, $00, $20, $00
    db $fd
    db $fe, $fe, $f8, $f6, $f8, $e9, $f0, $ca, $f0, $92, $e0, $65, $80, $4a, $80, $42
    db $00, $28, $00
    db $a0, $00, $44, $00, $10, $00, $82, $00, $24, $00, $08, $00, $40, $00, $08, $00
    db $80, $00, $00, $00, $12, $00, $00, $00, $40, $00, $08, $00, $00, $00, $92, $00
    db $00, $00, $09, $00, $20, $00
    db $00, $00, $00, $00, $84, $00, $4f, $00, $1f, $00, $4f, $00, $1f, $00, $2f, $00
    db $1f, $00, $97, $00, $2f, $00, $f5, $00, $fe, $00, $ff, $00
    db $ff, $00, $df, $20, $ff, $00, $df, $20, $f7, $08, $51, $00, $d4, $00, $55, $00
    db $aa, $00, $6b, $00, $b5, $00, $ea, $00, $f5, $00, $12, $00, $80, $00, $54, $00
    db $22, $00, $54, $00, $55, $00, $ad, $00, $d7, $00, $22, $00, $89, $00, $44, $00
    db $29, $00, $92, $00, $49, $00, $55, $00, $bf, $00, $24, $00, $55, $00, $95, $00
    db $2d, $00, $5e, $00, $b7, $00, $7d, $00, $d7, $00, $be, $00, $6b, $00, $bf, $00
    db $ef, $00, $bf, $00, $ff, $00, $ff, $00, $7f, $00
    db $ed
    db $12, $ff, $00
    db $ed
    db $12, $fe, $01, $ef
    db $10
    db $fa, $05, $55, $aa, $7a, $85, $7e, $80, $bf, $40
    db $ed
    db $10
    db $bf, $40, $ff, $00, $bf, $40, $ef
    db $10
    db $bf, $40, $10, $00, $42, $00, $28, $00
    db $81, $00, $2a, $00, $91, $00, $4a, $00, $d1, $00, $82, $00, $11, $00, $04, $00
    db $10, $00, $45, $00, $00, $00, $2a, $00, $40, $00, $20, $00
    db $14, $00, $a1, $00, $14, $00, $41, $00, $14, $00, $49, $00, $10, $00, $8a, $00
    db $21, $00, $44, $00, $12, $00, $49, $00, $24, $00, $09, $00, $a4, $00, $ff, $00
    db $55, $aa, $ff, $00, $aa, $55, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $00
    db $55, $aa, $ff, $00, $aa, $55, $ff, $09, $ae, $55, $f7, $08, $5a, $a5, $ff, $00
    db $55, $aa, $ff, $00, $aa, $55, $ff, $40, $aa, $77, $ff, $08, $5a, $b5, $ff, $00
    db $55, $ab, $ff
    db $02, $af, $75, $ff, $80, $ba, $57, $f7, $08, $5e, $b5, $ff, $12, $5d
    db $eb
    db $ff, $ac, $ba, $55, $ff, $20, $ea, $5d, $f7, $08, $fa, $a5, $ff, $48, $f5, $aa
    db $ff, $40, $ab, $55, $ff, $14, $aa, $d5, $f7, $08, $7a, $e5, $ff, $80, $55, $aa
    db $ff, $00, $aa, $55
    db $ff, $00, $aa, $57, $f7, $08, $5a, $a5, $ff, $00, $55, $ae, $ff, $00, $aa, $55
    db $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $08, $57, $aa, $ff, $81, $ea, $7d
    db $ff
    db $15, $aa, $75, $f7, $4a, $5a, $a5, $ff, $20, $d5, $aa, $ff
    db $50, $ae, $55, $ff, $02, $aa, $f5, $f7, $58, $5e, $a5, $ff, $00, $55, $aa, $ff
    db $00, $aa, $d5, $ff, $80, $ea, $55, $ff, $28, $da, $b7, $ff, $00, $57, $aa, $ff
    db $00, $aa, $5d, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff
    db $10
    db $55, $aa, $ff, $00, $aa, $55, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $02
    db $55, $aa, $ff, $02, $ab, $55, $ff, $00, $aa, $55, $f7, $08, $5a, $a5, $ff, $00
    db $75, $ea, $ff, $08, $ea, $55, $ff, $20, $aa, $55, $f7, $08, $5a, $a5, $ff, $00
    db $55, $aa, $ff, $00, $ab, $55
    db $ff
    db $0b, $ff, $55, $ff, $2a, $5a, $ad, $ff, $01, $55, $aa, $ff, $d4, $ea, $75, $ff
    db $50, $ea, $55, $f7, $08, $5a, $a5, $ff
    db $10
    db $55, $ae, $ff, $01, $ae, $55, $ff
    db $10
    db $aa, $55, $ff, $28, $da, $a5, $ff, $30, $d5, $aa, $ff, $40, $ea, $55, $ff, $00
    db $aa, $55, $f7, $08, $5a, $a5, $38, $c0, $88, $f0, $e7, $c0, $9f, $00, $0f, $70
    db $ce, $f1, $00, $00, $0f, $00, $35, $0a, $c0, $3f, $8a, $71, $00, $c0, $5c, $8e
    db $b7, $1f, $00, $00, $00, $00, $c0, $00, $60, $80, $30, $c0, $98, $60, $48, $30
    db $04, $38, $01, $00
    db $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $29, $c6
    db $81, $66, $80, $73, $42, $39, $21, $1c, $3a, $04, $1d, $02, $3e, $01, $de, $01
    db $ad, $00, $de, $00
    db $ed
    db $02, $c6, $01
    db $e3
    db $00, $45, $00, $e2
    db $00, $18, $fd, $31, $f8, $a0, $40, $04, $03, $44, $bf, $01, $fe, $ff, $00, $f5
    db $00, $04, $f8, $04, $f9, $85, $79, $f0, $0d, $7a, $85, $d7, $00, $a2, $00, $01
    db $00, $33
    db $fc
    db $ab, $9c, $81, $8e, $83, $c0, $0d, $f0, $8f, $70, $ba, $00, $55, $00, $a1, $63
    db $80, $66, $94, $66, $de, $27, $f8, $07, $5e, $01, $af, $00, $05, $00, $cf, $f0
    db $ef, $70, $0d, $30, $1f, $00, $3a, $c0
    db $35, $c0, $e8, $00, $54, $00, $01, $bf, $a1, $1f, $d8, $07, $e6, $01, $a9, $00
    db $04, $00, $01, $00, $04, $00, $94, $18, $04, $98, $06, $98
    db $0c
    db $80, $14, $e8, $f8, $00, $34, $00, $a8, $00, $00, $00, $00, $00, $00, $00, $02
    db $00, $05, $00, $2b, $00, $45, $18, $1b, $00, $58, $07, $30, $0f, $64, $18, $c3
    db $30, $ce, $27, $a8, $4c, $9d, $4e, $84, $4e, $f0, $00, $68
    db $80, $b1, $40, $18, $60, $31, $c0, $5a, $20, $15, $60, $bb, $40, $6a, $00, $bf
    db $00, $7b, $04
    db $e4
    db $1b, $90, $60, $a4, $4c, $8d, $5c, $cc, $19, $80, $00
    db $40, $00, $82, $00, $d5, $00
    db $e3
    db $00, $57, $80, $6b, $80, $47, $80, $2a, $00, $7f, $00
    db $e3
    db $1c, $80, $7f, $41, $80, $00, $b6, $a6, $34, $65, $2c, $82, $00, $41, $00, $a2
    db $00, $c5, $00, $63, $80, $46, $81, $63, $80, $56, $81, $a8, $00, $5c, $00, $ee
    db $10, $81, $7e, $01, $c2, $22, $99, $01, $82, $99, $36, $01, $00, $02, $00, $81
    db $00, $42, $01, $86, $01, $cc, $02, $94, $03, $4c, $03, $50, $00, $a0, $00, $f0
    db $00, $7a, $80, $1d, $00, $46, $78, $05, $18, $0e, $d0, $00, $00, $00, $00, $00
    db $00, $00, $00, $40, $00, $80, $00, $00
    db $60, $e0, $00, $15, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $81, $60, $c8, $37, $33, $0c, $1e, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $71, $80, $6a, $80, $d1, $00, $80, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $80, $41, $d1, $2e, $6f
    db $10
    db $1d, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $e3
    db $00, $c5, $00, $a2, $00, $41, $00, $00, $00, $00, $00, $00, $00, $00, $00, $40
    db $2d, $83, $7c, $ff, $00, $2a, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $e3
    db $00, $c5, $00, $82, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01
    db $86, $23, $dc, $de, $20, $35, $00, $00, $00, $00, $00, $00, $00, $00, $00, $96
    db $00, $0f, $00, $87, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $2d
    db $10
    db $9a, $60, $f0, $00, $c0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $0a, $0b, $0c, $0d, $0e, $0f
    db $10
    db $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $00, $00, $1c, $1d, $1e
    db $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $00
    db $00, $00
    db $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d
    db $3e, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $3f, $40, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $41, $42, $43
    db $00, $00, $00
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
    db $76
    db $77, $78, $79, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $7a, $7b, $7c
    db $7d, $7e, $7f, $80, $81, $82, $83, $84, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $00, $00, $00, $00, $00
    ds 169, $00
    db $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $00
    db $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01
    db $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01
    db $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00

; Stale copy of the last 164 bytes of bank 0. Nothing reads it.
; The five zero bytes before it are the end of the data above, not filler.
BankFiller_005:
    db $4f, $21, $cf, $73, $11, $00, $90, $01, $00, $08, $cd, $b0, $01, $21, $cf, $7b
    db $11, $00, $88, $01, $50, $01, $cd, $b0, $01, $3e, $09, $11, $00, $98, $21, $1f
    db $7d, $06, $14, $0e, $09, $cd, $d4, $01, $af, $11, $20, $99, $06, $14, $0e, $09
    db $cd, $d4, $01, $fa, $0d, $df, $6f, $fa, $0e, $df, $67, $cd, $84, $0e, $cd, $84
    db $0e, $cd, $84, $0e, $cd, $84, $0e, $cd, $84, $0e, $cd, $84, $0e, $3e, $01, $ea
    db $ac, $d8, $cd, $06, $02, $c9
    ds 78, $00

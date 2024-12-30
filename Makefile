IMAGE_DEPS = gfx\image_002_416c.2bpp gfx\image_002_4a6c.2bpp gfx\image_002_603c.2bpp gfx\image_002_6b3c.2bpp gfx\image_002_6b6c.2bpp gfx\image_002_6edc.2bpp gfx\image_002_7bdc.2bpp gfx\image_003_4a20.2bpp gfx\image_003_5220.2bpp gfx\image_003_5580.2bpp gfx\image_003_5c80.2bpp gfx\image_004_4000.2bpp gfx\image_004_7940.2bpp gfx\image_004_7f40.2bpp gfx\image_005_496c.2bpp gfx\image_005_616c.2bpp gfx\image_005_650c.2bpp gfx\image_007_4000.2bpp gfx\image_007_5c00.2bpp gfx\image_007_5f28.2bpp gfx\image_007_6528.2bpp gfx\image_007_6628.2bpp gfx\image_007_6678.2bpp gfx\image_007_6778.2bpp gfx\image_007_67b8.2bpp gfx\image_007_68b8.2bpp gfx\image_007_68f8.2bpp gfx\image_007_69f8.2bpp gfx\image_00a_4000.2bpp gfx\image_00a_5f00.2bpp gfx\image_00a_6f00.2bpp gfx\image_00b_7d2c.2bpp gfx\image_00b_7e2c.2bpp gfx\image_00c_4de4.2bpp gfx\image_00c_55e4.2bpp gfx\image_00d_49b8.2bpp gfx\image_00d_4fb8.2bpp gfx\image_00e_48c1.2bpp gfx\image_00e_60c1.2bpp gfx\image_00e_674f.2bpp gfx\image_00e_7c4f.2bpp

all: game.gbc

%.2bpp: %.png
	rgbgfx -o $@ $<

%.1bpp: %.png
	rgbgfx -d 1 -o $@ $<

game.o: game.asm banks/bank_*.asm $(IMAGE_DEPS)
	rgbasm -o game.o game.asm

game.gbc: game.o
	echo off
	rgblink -n game.sym -m game.map -o $@ $<
	rgbfix -v -p 255 $@
	CertUtil -hashfile game.gbc MD5
	del game.o

clear:
	del game.o game.gbc game.sym game.map game.sav
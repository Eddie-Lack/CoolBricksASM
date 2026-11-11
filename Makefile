# Builds game.gbc with RGBDS 0.8.0 and checks it against the original ROM.
# Works with GNU make on Linux, macOS, WSL and MSYS2. Makefile.windows is the
# original Windows cmd version.

ROM := game.gbc
MD5 := 5a7673f1e61cd707bdc880ff76396a3d

SOURCES := game.asm $(wildcard banks/*.asm) $(wildcard src/*.asm) $(wildcard include/*.inc)
PNGS    := $(wildcard gfx/*.png)
IMAGES  := $(PNGS:.png=.2bpp)

.PHONY: all compare check clean

all: $(ROM) compare

%.2bpp: %.png
	rgbgfx -o $@ $<

game.o: $(SOURCES) $(IMAGES)
	rgbasm -o $@ game.asm

$(ROM): game.o
	rgblink -n game.sym -m game.map -o $@ $<
	rgbfix -v -p 255 $@

# Compare the built ROM with the original.
compare: $(ROM)
	@python3 -c "import hashlib,sys; d=hashlib.md5(open('$(ROM)','rb').read()).hexdigest(); print('md5', d); sys.exit(d != '$(MD5)')"

# Build and compare without RGBDS, using the checking assembler.
check:
	python3 tools/gbasm.py game.asm $(ROM) $(MD5)

clean:
	rm -f game.o $(ROM) game.sym game.map

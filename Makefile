.PHONY: all clean
all: smolnes deobfuscated

WARN=		 -Wall \
     -Wno-parentheses \
		 -Wno-misleading-indentation \
		 -Wno-bool-operation \
		 -Wno-discarded-qualifiers \
		 -Wno-incompatible-pointer-types-discards-qualifiers \
		 -Wno-unknown-warning-option \
		 -Wno-switch-outside-range \
		 -Wno-unused-value \
		 -Wno-char-subscripts \
		 -Wno-switch

smolnes: smolnes.c
	mkdir -p build
	emcc -O2 -s USE_SDL=2 -o build/$@.html $< -lSDL2 -g ${WARN}

deobfuscated: deobfuscated.c
	mkdir -p build
	emcc -O2 -s USE_SDL=2 -s EXPORTED_FUNCTIONS=_file_handler -o build/$@.html $< -lSDL2 -g ${WARN}

clean:
	rm -f smolnes deobfuscated

CC      = cc
CFLAGS  = -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os `pkg-config --cflags x11`
LDFLAGS = `pkg-config --libs x11`

SRC = src/dwmblocks.c
OBJ = ${SRC:.c=.o}

all: dwmblocks

.c.o:
	${CC} -c ${CFLAGS} $< -o ${<:.c=.o}

${OBJ}: src/blocks.h

dwmblocks: ${OBJ}
	mkdir -p bin
	${CC} -o bin/$@ ${OBJ} ${LDFLAGS}

clean:
	rm -f bin/dwmblocks ${OBJ}

install: all
	mkdir -p /usr/bin
	cp -f bin/dwmblocks /usr/bin
	chmod 755 /usr/bin/dwmblocks

uninstall:
	rm -f /usr/bin/dwmblocks

.PHONY: all clean install uninstall

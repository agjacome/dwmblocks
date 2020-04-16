include config.mk

SRC = src/dwmblocks.c
OBJ = ${SRC:.c=.o}

all: dwmblocks scripts

.c.o:
	${CC} -c ${CFLAGS} $< -o ${<:.c=.o}

${OBJ}: src/blocks.h config.mk

dwmblocks: ${OBJ}
	mkdir -p bin
	${CC} -o bin/$@ src/dwmblocks.o ${LDFLAGS}

scripts:
	mkdir -p bin/scripts/
	$(foreach script,$(wildcard src/*.sh),cp -f ${script} bin/scripts/${script:src/%.sh=%};)
	chmod +x bin/scripts/*

clean:
	rm -rf bin/* src/*.o

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin ${DESTDIR}${OPTPREFIX}/dwmblocks
	cp -f bin/dwmblocks ${DESTDIR}${PREFIX}/bin
	cp -f bin/scripts/* ${DESTDIR}${OPTPREFIX}/dwmblocks/
	chmod 755 ${DESTDIR}${PREFIX}/bin/dwmblocks ${DESTDIR}${OPTPREFIX}/dwmblocks/*

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/dwmblocks
	rm -rf ${DESTDIR}${OPTPREFIX}/dwmblocks

.PHONY: all clean install uninstall

CC      = cc
CFLAGS  = -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os `pkg-config --cflags x11`
LDFLAGS = `pkg-config --libs x11`

all: dwmblocks scripts

.c.o:
	${CC} -c ${CFLAGS} $< -o ${<:.c=.o}

dwmblocks: src/dwmblocks.o
	mkdir -p bin
	${CC} -o bin/$@ src/dwmblocks.o ${LDFLAGS}

scripts:
	mkdir -p bin/scripts/
	$(foreach script,$(wildcard src/*.sh),cp -f ${script} bin/scripts/${script:src/%.sh=%};)
	chmod +x bin/scripts/*

clean:
	rm -rf bin/* src/*.o

install: all
	mkdir -p /usr/bin /opt/dwmblocks
	cp -f bin/dwmblocks /usr/bin
	cp -f bin/scripts/* /opt/dwmblocks/
	chmod 755 /usr/bin/dwmblocks /opt/dwmblocks/*

uninstall:
	rm -f /usr/bin/dwmblocks
	rm -rf /opt/dwmblocks

.PHONY: all clean install uninstall

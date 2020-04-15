VERSION = 1.0

PREFIX    = /usr
OPTPREFIX = /opt

CFLAGS  = -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os `pkg-config --cflags x11`
LDFLAGS = `pkg-config --libs x11`

CC = cc

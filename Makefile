CC=cc
CFLAGS=-std=c2x -O3 -Wall -Wextra -fPIC

all: string-utils buffer-utils collections
	$(CC) $(CFLAGS) -shared build/*.o -o libcmhcommon.so

string-utils: prepare
	$(CC) $(CFLAGS) -c src/string-utils.c -o build/string-utils.o

buffer-utils: prepare
	$(CC) $(CFLAGS) -c src/buffer-utils.c -o build/buffer-utils.o

collections: prepare
	$(CC) $(CFLAGS) -c src/collections.c -o build/collections.o

install: all
	cp include/* /usr/include
	cp libcmhcommon.so /usr/lib

prepare: clean
	mkdir build

clean:
	rm -rf build
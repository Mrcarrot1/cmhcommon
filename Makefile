CC=cc
CFLAGS=-std=c2x -O3 -Wall -Wextra -fPIC

all: build/string-utils.o build/buffer-utils.o build/collections.o
	$(CC) $(CFLAGS) -shared build/*.o -o libcmhcommon.so

build/string-utils.o: src/string-utils.c prepare
	$(CC) $(CFLAGS) -c src/string-utils.c -o build/string-utils.o

build/buffer-utils.o: src/buffer-utils.c prepare
	$(CC) $(CFLAGS) -c src/buffer-utils.c -o build/buffer-utils.o

build/collections.o: src/collections.c prepare
	$(CC) $(CFLAGS) -c src/collections.c -o build/collections.o

install: all
	cp include/* /usr/include
	cp libcmhcommon.so /usr/lib

prepare: 
	if [ ! -d build ]; then mkdir build; fi

clean:
	rm -rf build

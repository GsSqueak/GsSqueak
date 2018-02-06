libmygraphics.so: myGraphics.c
	gcc -shared -Wall -fPIC -o libmygraphics.so myGraphics.c `sdl2-config --cflags --libs`
all: libmygraphics.so
install: libmygraphics.so
	cp libmygraphics.so /opt/

libmygraphics.so: myGraphics.c
	gcc -shared -Wall -fPIC -o libmygraphics.so myGraphics.c `sdl2-config --cflags --libs`
install: libmygraphics.so
	cp libmygraphics.so /opt/

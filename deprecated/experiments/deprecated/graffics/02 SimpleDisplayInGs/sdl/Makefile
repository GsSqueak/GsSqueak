libmygraphics.so: myGraphics.c
	gcc -shared -Wall -fPIC -o libmygraphics.so myGraphics.c `sdl2-config --cflags --libs`
test.o: test.c libmygraphics.so
	gcc test.c -L /home/jakob/Studium/bp/BP2017RH1/experiments/graffics/02\ SimpleDisplayInGs/sdl/ -l mygraphics

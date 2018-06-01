libmyprinter.so: myPrinter.c
	gcc -shared -Wall -fPIC -o libmyprinter.so myPrinter.c
test.o: test.c libmyprinter.so
	gcc test.c -L /home/jakob/Studium/bp/BP2017RH1/experiments/ffi/02\ bitmapTest/ -l myprinter

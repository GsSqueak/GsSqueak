#! /usr/bin/make -f

CFLAGS=`sdl2-config --cflags` -fPIC
LDLIBS=`sdl2-config --libs`
LDFLAGS=-fPIC

.PHONY: all install clean

all: libgraFFIcs.so

lib%.so: %.o
	$(LINK.o) -shared $^ $(LOADLIBES) $(LDLIBS) -o $@

libgraFFIcs.so: graFFIcs.o


install: libgraFFIcs.so
	if test -z "$(GEMSTONE)"; then echo 'PLEASE SET $$GEMSTONE'; exit 1; else \
	chmod +w $(GEMSTONE)/lib; \
	cp $^ $(GEMSTONE)/lib; \
	chmod -w $(GEMSTONE)/lib; \
	fi

clean:
	rm -f *.o
	rm -f *.so

#! /usr/bin/make -f

CFLAGS=`sdl2-config --cflags` -fPIC
LDLIBS=`sdl2-config --libs`
LDFLAGS=-fPIC

SRCS=$(shell find -name '*.c')
OBJS=$(addsuffix .o, $(basename $(SRCS)))

.PHONY: all install clean

all: libgraFFIcs.so

libgraFFIcs.so: $(OBJS)
	$(LINK.o) -shared $^ $(LOADLIBES) $(LDLIBS) -o $@

install: libgraFFIcs.so
	if test -z "$(GEMSTONE)"; then echo 'PLEASE SET $$GEMSTONE'; exit 1; else \
	chmod +w $(GEMSTONE)/lib; \
	cp $^ $(GEMSTONE)/lib; \
	chmod -w $(GEMSTONE)/lib; \
	fi

clean:
	rm -f $(OBJS)
	rm -f libgraFFIcs.so

C code generator
emitHeaderFilesOn: aStream
	"Write a header files onto the given stream. A special hack allows use of 
	#ifdef THING
	#include <blah.h>
	#endif
	constructs"

	"Additional header files"
	headerFiles do:[:hdr|
		hdr first ~= $# ifTrue:
			[aStream nextPutAll: '#include '].
		aStream nextPutAll: hdr; cr].

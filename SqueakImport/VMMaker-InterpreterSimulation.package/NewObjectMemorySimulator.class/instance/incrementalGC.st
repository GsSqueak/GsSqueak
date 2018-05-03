debug support
incrementalGC
	coInterpreter transcript cr; nextPutAll: 'incrementalGC ('; print: coInterpreter byteCount; nextPut: $); flush.
	^super incrementalGC
debug support
tenuringIncrementalGC
	coInterpreter transcript cr; nextPutAll: 'tenuringIncrementalGC ('; print: coInterpreter byteCount; nextPut: $); flush.
	^super tenuringIncrementalGC
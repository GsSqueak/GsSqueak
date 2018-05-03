common selector sends
bytecodePrimClass
	| rcvr |
	rcvr := self internalStackTop.
	self internalPop: 1 thenPush: (objectMemory fetchClassOf: rcvr).
	self fetchNextBytecode.

common selector sends
bytecodePrimPointY
	| _gsSqueakTemp_rcvr |
	self initPrimCall.
	_gsSqueakTemp_rcvr := self internalStackTop.
	self
		assertClassOf: _gsSqueakTemp_rcvr
		is: (objectMemory splObj: ClassPoint).
	self successful
		ifTrue: [self
				internalStackTopPut: (objectMemory fetchPointer: YIndex ofObject: _gsSqueakTemp_rcvr).
			^ self fetchNextBytecode"success"].
	primFailCode := 0.
	messageSelector := self specialSelector: 31.
	argumentCount := 0.
	self normalSend
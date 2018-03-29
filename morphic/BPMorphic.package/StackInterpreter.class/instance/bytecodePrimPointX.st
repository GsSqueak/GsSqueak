common selector sends
bytecodePrimPointX
	| _gsSqueakTemp_rcvr |
	self initPrimCall.
	_gsSqueakTemp_rcvr := self internalStackTop.
	self
		assertClassOf: _gsSqueakTemp_rcvr
		is: (objectMemory splObj: ClassPoint).
	self successful
		ifTrue: [self
				internalStackTopPut: (objectMemory fetchPointer: XIndex ofObject: _gsSqueakTemp_rcvr).
			^ self fetchNextBytecode"success"].
	primFailCode := 0.
	messageSelector := self specialSelector: 30.
	argumentCount := 0.
	self normalSend
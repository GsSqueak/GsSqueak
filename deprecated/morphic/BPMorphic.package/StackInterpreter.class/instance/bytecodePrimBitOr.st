common selector sends
bytecodePrimBitOr
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg |
	_gsSqueakTemp_arg := self internalStackTop.
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	((objectMemory isIntegerObject: _gsSqueakTemp_arg)
			and: [objectMemory isIntegerObject: _gsSqueakTemp_rcvr])
		ifTrue: [self
				internalPop: 2
				thenPush: (_gsSqueakTemp_arg bitOr: _gsSqueakTemp_rcvr).
			^ self fetchNextBytecode"success"].
	self initPrimCall.
	self externalizeIPandSP.
	self primitiveBitOr.
	self internalizeIPandSP.
	self successful
		ifTrue: [^ self fetchNextBytecode"success"].
	messageSelector := self specialSelector: 15.
	argumentCount := 1.
	self normalSend
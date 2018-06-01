common selector sends
bytecodePrimDiv
	| _gsSqueakTemp_quotient |
	self initPrimCall.
	_gsSqueakTemp_quotient := self
				doPrimitiveDiv: (self internalStackValue: 1)
				by: (self internalStackValue: 0).
	self successful
		ifTrue: [self
				internalPop: 2
				thenPush: (objectMemory integerObjectOf: _gsSqueakTemp_quotient).
			^ self fetchNextBytecode"success"].
	messageSelector := self specialSelector: 13.
	argumentCount := 1.
	self normalSend
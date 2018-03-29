common selector sends
bytecodePrimMod
	| _gsSqueakTemp_mod |
	self initPrimCall.
	_gsSqueakTemp_mod := self
				doPrimitiveMod: (self internalStackValue: 1)
				by: (self internalStackValue: 0).
	self successful
		ifTrue: [self
				internalPop: 2
				thenPush: (objectMemory integerObjectOf: _gsSqueakTemp_mod).
			^ self fetchNextBytecode"success"].
	messageSelector := self specialSelector: 10.
	argumentCount := 1.
	self normalSend
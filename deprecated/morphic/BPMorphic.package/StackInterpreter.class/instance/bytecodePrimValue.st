common selector sends
bytecodePrimValue
	| _gsSqueakTemp_rcvr _gsSqueakTemp_isBlock |
	_gsSqueakTemp_rcvr := self internalStackTop.
	argumentCount := 0.
	_gsSqueakTemp_isBlock := self isInstanceOfClassBlockClosure: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_isBlock
		ifTrue: [self externalizeIPandSP.
			self initPrimCall.
			self primitiveClosureValue.
			self internalizeIPandSP.
			self successful
				ifTrue: [^ self fetchNextBytecode].
			primFailCode := 0].
	messageSelector := self specialSelector: 25.
	self normalSend
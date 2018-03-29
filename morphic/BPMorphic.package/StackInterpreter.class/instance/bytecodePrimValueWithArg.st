common selector sends
bytecodePrimValueWithArg
	| _gsSqueakTemp_rcvr _gsSqueakTemp_isBlock |
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	argumentCount := 1.
	_gsSqueakTemp_isBlock := self isInstanceOfClassBlockClosure: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_isBlock
		ifTrue: [self externalizeIPandSP.
			self initPrimCall.
			self primitiveClosureValue.
			self internalizeIPandSP.
			self successful
				ifTrue: [^ self fetchNextBytecode].
			primFailCode := 0].
	messageSelector := self specialSelector: 26.
	self normalSend
common selector sends
bytecodePrimSubtract
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg _gsSqueakTemp_result |
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	_gsSqueakTemp_arg := self internalStackValue: 0.
	(objectMemory areIntegers: _gsSqueakTemp_rcvr and: _gsSqueakTemp_arg)
		ifTrue: [_gsSqueakTemp_result := (objectMemory integerValueOf: _gsSqueakTemp_rcvr)
						- (objectMemory integerValueOf: _gsSqueakTemp_arg).
			(objectMemory isIntegerValue: _gsSqueakTemp_result)
				ifTrue: [self
						internalPop: 2
						thenPush: (objectMemory integerObjectOf: _gsSqueakTemp_result).
					^ self fetchNextBytecode"success"]]
		ifFalse: [self initPrimCall.
			self externalizeIPandSP.
			self primitiveFloatSubtract: _gsSqueakTemp_rcvr fromArg: _gsSqueakTemp_arg.
			self internalizeIPandSP.
			self successful
				ifTrue: [^ self fetchNextBytecode"success"]].
	messageSelector := self specialSelector: 1.
	argumentCount := 1.
	self normalSend
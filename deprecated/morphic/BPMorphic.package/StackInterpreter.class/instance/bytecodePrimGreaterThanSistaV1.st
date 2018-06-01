common selector sends
bytecodePrimGreaterThanSistaV1
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg _gsSqueakTemp_aBool |
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	_gsSqueakTemp_arg := self internalStackValue: 0.
	(objectMemory areIntegers: _gsSqueakTemp_rcvr and: _gsSqueakTemp_arg)
		ifTrue: ["The C code can avoid detagging since tagged integers are still
			signed. But this means the simulator must override to do
			detagging. "
			^ self
				cCode: [self booleanCheatSistaV1: _gsSqueakTemp_rcvr > _gsSqueakTemp_arg]
				inSmalltalk: [self booleanCheatSistaV1: (objectMemory integerValueOf: _gsSqueakTemp_rcvr)
							> (objectMemory integerValueOf: _gsSqueakTemp_arg)]].
	self initPrimCall.
	_gsSqueakTemp_aBool := self primitiveFloatGreater: _gsSqueakTemp_rcvr thanArg: _gsSqueakTemp_arg.
	self successful
		ifTrue: [^ self booleanCheatSistaV1: _gsSqueakTemp_aBool].
	messageSelector := self specialSelector: 3.
	argumentCount := 1.
	self normalSend
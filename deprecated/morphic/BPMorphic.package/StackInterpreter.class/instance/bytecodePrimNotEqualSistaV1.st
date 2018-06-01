common selector sends
bytecodePrimNotEqualSistaV1
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg _gsSqueakTemp_aBool |
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	_gsSqueakTemp_arg := self internalStackValue: 0.
	(objectMemory areIntegers: _gsSqueakTemp_rcvr and: _gsSqueakTemp_arg)
		ifTrue: [^ self booleanCheatSistaV1: _gsSqueakTemp_rcvr ~= _gsSqueakTemp_arg].
	self initPrimCall.
	_gsSqueakTemp_aBool := self primitiveFloatEqual: _gsSqueakTemp_rcvr toArg: _gsSqueakTemp_arg.
	self successful
		ifTrue: [^ self booleanCheatSistaV1: _gsSqueakTemp_aBool not].
	messageSelector := self specialSelector: 7.
	argumentCount := 1.
	self normalSend
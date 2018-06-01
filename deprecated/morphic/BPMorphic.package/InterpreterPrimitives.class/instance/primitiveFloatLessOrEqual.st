arithmetic float primitives
primitiveFloatLessOrEqual
	| _gsSqueakTemp_aBool |
	_gsSqueakTemp_aBool := self
				primitiveFloatLessOrEqual: (self stackValue: 1)
				toArg: self stackTop.
	self successful
		ifTrue: [self pop: 2 thenPushBool: _gsSqueakTemp_aBool]
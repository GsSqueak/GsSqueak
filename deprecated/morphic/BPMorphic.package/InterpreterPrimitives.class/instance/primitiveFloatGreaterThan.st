arithmetic float primitives
primitiveFloatGreaterThan
	| _gsSqueakTemp_aBool |
	_gsSqueakTemp_aBool := self
				primitiveFloatGreater: (self stackValue: 1)
				thanArg: self stackTop.
	self successful
		ifTrue: [self pop: 2 thenPushBool: _gsSqueakTemp_aBool]
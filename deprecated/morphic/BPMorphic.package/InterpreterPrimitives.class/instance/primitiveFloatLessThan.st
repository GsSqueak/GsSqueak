arithmetic float primitives
primitiveFloatLessThan
	| _gsSqueakTemp_aBool |
	_gsSqueakTemp_aBool := self
				primitiveFloatLess: (self stackValue: 1)
				thanArg: self stackTop.
	self successful
		ifTrue: [self pop: 2 thenPushBool: _gsSqueakTemp_aBool]
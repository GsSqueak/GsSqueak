arithmetic float primitives
primitiveFloatNotEqual
	| _gsSqueakTemp_aBool |
	_gsSqueakTemp_aBool := self
				primitiveFloatEqual: (self stackValue: 1)
				toArg: self stackTop.
	self successful
		ifTrue: [self pop: 2 thenPushBool: _gsSqueakTemp_aBool not]
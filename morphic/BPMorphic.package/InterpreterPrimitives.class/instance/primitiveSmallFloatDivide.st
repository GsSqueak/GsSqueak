arithmetic float primitives
primitiveSmallFloatDivide
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg |
	_gsSqueakTemp_rcvr := objectMemory
				smallFloatValueOf: (self stackValue: 1).
	_gsSqueakTemp_arg := objectMemory loadFloatOrIntFrom: self stackTop.
	_gsSqueakTemp_arg = 0.0
		ifTrue: [self primitiveFail].
	self successful
		ifTrue: [self pop: 2 thenPushFloat: _gsSqueakTemp_rcvr / _gsSqueakTemp_arg]
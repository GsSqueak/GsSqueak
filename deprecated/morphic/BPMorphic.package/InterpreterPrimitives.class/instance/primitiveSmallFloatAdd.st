arithmetic float primitives
primitiveSmallFloatAdd
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg |
	_gsSqueakTemp_rcvr := objectMemory
				smallFloatValueOf: (self stackValue: 1).
	_gsSqueakTemp_arg := objectMemory loadFloatOrIntFrom: self stackTop.
	self successful
		ifTrue: [self pop: 2 thenPushFloat: _gsSqueakTemp_rcvr + _gsSqueakTemp_arg]
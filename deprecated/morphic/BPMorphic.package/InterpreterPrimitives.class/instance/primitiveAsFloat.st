arithmetic float primitives
primitiveAsFloat
	"N.B. This will answer inexact results for integers with > 53 bits of
	magnitude. "
	| _gsSqueakTemp_rcvr |
	_gsSqueakTemp_rcvr := self stackTop.
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_rcvr).
	self pop: 1 thenPushFloat: (objectMemory integerValueOf: _gsSqueakTemp_rcvr) asFloat
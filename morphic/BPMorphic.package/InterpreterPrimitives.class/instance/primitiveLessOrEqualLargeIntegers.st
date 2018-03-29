arithmetic largeint primitives
primitiveLessOrEqualLargeIntegers
	"Primitive comparison operations for large integers in 64 bit range"
	| _gsSqueakTemp_integerRcvr _gsSqueakTemp_integerArg |
	_gsSqueakTemp_integerArg := self
				signed64BitValueOf: (self stackValue: 0).
	_gsSqueakTemp_integerRcvr := self
				signed64BitValueOf: (self stackValue: 1).
	self successful
		ifTrue: [self pop: 2 thenPushBool: _gsSqueakTemp_integerRcvr <= _gsSqueakTemp_integerArg]
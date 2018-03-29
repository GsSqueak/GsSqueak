arithmetic largeint primitives
primitiveBitXorLargeIntegers
	"Primitive logical operations for large integers in 64 bit range"
	| _gsSqueakTemp_integerRcvr _gsSqueakTemp_integerArg _gsSqueakTemp_oopResult |
	_gsSqueakTemp_integerArg := self
				positive64BitValueOf: (self stackValue: 0).
	_gsSqueakTemp_integerRcvr := self
				positive64BitValueOf: (self stackValue: 1).
	self successful
		ifFalse: [^ nil].
	_gsSqueakTemp_oopResult := self
				positive64BitIntegerFor: (_gsSqueakTemp_integerRcvr bitXor: _gsSqueakTemp_integerArg).
	self successful
		ifTrue: [self pop: 2 thenPush: _gsSqueakTemp_oopResult]
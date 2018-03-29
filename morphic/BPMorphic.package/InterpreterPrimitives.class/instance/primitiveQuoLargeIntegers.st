arithmetic largeint primitives
primitiveQuoLargeIntegers
	"Primitive arithmetic operations for large integers in 64 bit range"
	| _gsSqueakTemp_result _gsSqueakTemp_oopResult _gsSqueakTemp_a _gsSqueakTemp_aIsNegative _gsSqueakTemp_b _gsSqueakTemp_bIsNegative _gsSqueakTemp_oopArg _gsSqueakTemp_oopRcvr |
	_gsSqueakTemp_oopArg := self stackValue: 0.
	_gsSqueakTemp_oopRcvr := self stackValue: 1.
	_gsSqueakTemp_aIsNegative := self isNegativeIntegerValueOf: _gsSqueakTemp_oopRcvr.
	_gsSqueakTemp_bIsNegative := self isNegativeIntegerValueOf: _gsSqueakTemp_oopArg.
	_gsSqueakTemp_a := self magnitude64BitValueOf: _gsSqueakTemp_oopRcvr.
	_gsSqueakTemp_b := self magnitude64BitValueOf: _gsSqueakTemp_oopArg.
	_gsSqueakTemp_b = 0
		ifTrue: [self primitiveFail].
	self successful
		ifFalse: [^ nil].
	_gsSqueakTemp_result := _gsSqueakTemp_a // _gsSqueakTemp_b.
	_gsSqueakTemp_oopResult := self magnitude64BitIntegerFor: _gsSqueakTemp_result neg: _gsSqueakTemp_bIsNegative ~= _gsSqueakTemp_aIsNegative.
	self successful
		ifTrue: [self pop: 2 thenPush: _gsSqueakTemp_oopResult]
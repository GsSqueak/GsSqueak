arithmetic largeint primitives
primitiveSubtractLargeIntegers
	"Primitive arithmetic operations for large integers in 64 bit range"
	| _gsSqueakTemp_a _gsSqueakTemp_b _gsSqueakTemp_result _gsSqueakTemp_oopResult _gsSqueakTemp_aIsNegative _gsSqueakTemp_bIsNegative _gsSqueakTemp_resultIsNegative _gsSqueakTemp_oopArg _gsSqueakTemp_oopRcvr |
	_gsSqueakTemp_oopArg := self stackValue: 0.
	_gsSqueakTemp_oopRcvr := self stackValue: 1.
	_gsSqueakTemp_aIsNegative := self isNegativeIntegerValueOf: _gsSqueakTemp_oopRcvr.
	_gsSqueakTemp_bIsNegative := self isNegativeIntegerValueOf: _gsSqueakTemp_oopArg.
	_gsSqueakTemp_a := self magnitude64BitValueOf: _gsSqueakTemp_oopRcvr.
	_gsSqueakTemp_b := self magnitude64BitValueOf: _gsSqueakTemp_oopArg.
	self successful
		ifFalse: [^ nil].
	_gsSqueakTemp_aIsNegative ~= _gsSqueakTemp_bIsNegative
		ifTrue: ["Protect against overflow"
			_gsSqueakTemp_a > (18446744073709551615 - _gsSqueakTemp_b)
				ifTrue: [self primitiveFail.
					^ nil].
			_gsSqueakTemp_result := _gsSqueakTemp_a + _gsSqueakTemp_b.
			_gsSqueakTemp_resultIsNegative := _gsSqueakTemp_aIsNegative]
		ifFalse: [_gsSqueakTemp_a >= _gsSqueakTemp_b
				ifTrue: [_gsSqueakTemp_result := _gsSqueakTemp_a - _gsSqueakTemp_b.
					_gsSqueakTemp_resultIsNegative := _gsSqueakTemp_aIsNegative]
				ifFalse: [_gsSqueakTemp_result := _gsSqueakTemp_b - _gsSqueakTemp_a.
					_gsSqueakTemp_resultIsNegative := _gsSqueakTemp_aIsNegative not]].
	_gsSqueakTemp_oopResult := self magnitude64BitIntegerFor: _gsSqueakTemp_result neg: _gsSqueakTemp_resultIsNegative.
	self successful
		ifTrue: [self pop: 2 thenPush: _gsSqueakTemp_oopResult]
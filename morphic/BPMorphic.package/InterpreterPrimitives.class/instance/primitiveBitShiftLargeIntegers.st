arithmetic largeint primitives
primitiveBitShiftLargeIntegers
	"Primitive arithmetic operations for large integers in 64 bit range"
	| _gsSqueakTemp_a _gsSqueakTemp_shift _gsSqueakTemp_result _gsSqueakTemp_oopResult _gsSqueakTemp_aIsNegative _gsSqueakTemp_oopRcvr |
	_gsSqueakTemp_shift := self stackIntegerValue: 0.
	_gsSqueakTemp_oopRcvr := self stackValue: 1.
	_gsSqueakTemp_aIsNegative := self isNegativeIntegerValueOf: _gsSqueakTemp_oopRcvr.
	_gsSqueakTemp_a := self magnitude64BitValueOf: _gsSqueakTemp_oopRcvr.
	self successful
		ifFalse: [^ nil].
	_gsSqueakTemp_shift >= 0
		ifTrue: ["Protect against overflow"
			_gsSqueakTemp_result := 18446744073709551615.
			"This is to avoid undue (usqInt) cast"
			(_gsSqueakTemp_shift >= 64
					or: [_gsSqueakTemp_a > (_gsSqueakTemp_result >> _gsSqueakTemp_shift)])
				ifTrue: [self primitiveFail.
					^ nil].
			_gsSqueakTemp_result := _gsSqueakTemp_a << _gsSqueakTemp_shift]
		ifFalse: [_gsSqueakTemp_shift := 0 - _gsSqueakTemp_shift.
			_gsSqueakTemp_shift >= 64
				ifTrue: [_gsSqueakTemp_result := 0]
				ifFalse: [_gsSqueakTemp_result := _gsSqueakTemp_a >> _gsSqueakTemp_shift].
			"Fake 2 complement for negative values"
			(_gsSqueakTemp_aIsNegative
					and: [_gsSqueakTemp_result << _gsSqueakTemp_shift ~= _gsSqueakTemp_a])
				ifTrue: [_gsSqueakTemp_result := _gsSqueakTemp_result + 1]].
	_gsSqueakTemp_oopResult := self magnitude64BitIntegerFor: _gsSqueakTemp_result neg: _gsSqueakTemp_aIsNegative.
	self successful
		ifTrue: [self pop: 2 thenPush: _gsSqueakTemp_oopResult]
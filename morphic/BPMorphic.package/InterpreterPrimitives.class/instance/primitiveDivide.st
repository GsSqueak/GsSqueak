arithmetic integer primitives
primitiveDivide
	| _gsSqueakTemp_integerReceiver _gsSqueakTemp_integerArgument |
	_gsSqueakTemp_integerReceiver := self stackIntegerValue: 1.
	_gsSqueakTemp_integerArgument := self stackIntegerValue: 0.
	(_gsSqueakTemp_integerArgument ~= 0
			and: [_gsSqueakTemp_integerReceiver \\ _gsSqueakTemp_integerArgument = 0])
		ifTrue: [self pop2AndPushIntegerIfOK: _gsSqueakTemp_integerReceiver // _gsSqueakTemp_integerArgument]
		ifFalse: [self primitiveFail]
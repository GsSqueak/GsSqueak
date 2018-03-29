arithmetic integer primitives
primitiveGreaterThan
	| _gsSqueakTemp_integerReceiver _gsSqueakTemp_integerArgument |
	_gsSqueakTemp_integerArgument := self stackTop.
	_gsSqueakTemp_integerReceiver := self stackValue: 1.
	(objectMemory areIntegers: _gsSqueakTemp_integerReceiver and: _gsSqueakTemp_integerArgument)
		ifTrue: [self
				cCode: ''
				inSmalltalk: [_gsSqueakTemp_integerReceiver := objectMemory integerValueOf: _gsSqueakTemp_integerReceiver.
					_gsSqueakTemp_integerArgument := objectMemory integerValueOf: _gsSqueakTemp_integerArgument].
			self pop: 2 thenPushBool: _gsSqueakTemp_integerReceiver > _gsSqueakTemp_integerArgument]
		ifFalse: [self primitiveFail]
arithmetic integer primitives
primitiveEqual
	| _gsSqueakTemp_integerReceiver _gsSqueakTemp_integerArgument _gsSqueakTemp_result |
	_gsSqueakTemp_integerArgument := self stackTop.
	_gsSqueakTemp_integerReceiver := self stackValue: 1.
	(objectMemory areIntegers: _gsSqueakTemp_integerReceiver and: _gsSqueakTemp_integerArgument)
		ifTrue: [self pop: 2 thenPushBool: _gsSqueakTemp_integerReceiver = _gsSqueakTemp_integerArgument]
		ifFalse: [_gsSqueakTemp_result := objectMemory hasSixtyFourBitImmediates
						ifTrue: [(self signed64BitValueOf: _gsSqueakTemp_integerReceiver)
								= (self signed64BitValueOf: _gsSqueakTemp_integerArgument)]
						ifFalse: [(self positiveMachineIntegerValueOf: _gsSqueakTemp_integerReceiver)
								= (self positiveMachineIntegerValueOf: _gsSqueakTemp_integerArgument)].
			self successful
				ifTrue: [self pop: 2 thenPushBool: _gsSqueakTemp_result]]
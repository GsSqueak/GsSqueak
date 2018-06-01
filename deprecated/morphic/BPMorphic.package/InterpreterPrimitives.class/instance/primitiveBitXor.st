arithmetic integer primitives
primitiveBitXor
	| _gsSqueakTemp_integerReceiver _gsSqueakTemp_integerArgument _gsSqueakTemp_integerArgumentValue _gsSqueakTemp_integerReceiverValue |
	_gsSqueakTemp_integerArgument := self stackTop.
	_gsSqueakTemp_integerReceiver := self stackValue: 1.
	((objectMemory isIntegerObject: _gsSqueakTemp_integerArgument)
			and: [objectMemory isIntegerObject: _gsSqueakTemp_integerReceiver])
		ifTrue: ["xoring will leave the tag bits zero, whether the tag is 1 or
			zero, so add it back in."
			self pop: 2 thenPush: (_gsSqueakTemp_integerArgument bitXor: _gsSqueakTemp_integerReceiver)
					+ objectMemory smallIntegerTag]
		ifFalse: [_gsSqueakTemp_integerArgumentValue := self positiveMachineIntegerValueOf: _gsSqueakTemp_integerArgument.
			_gsSqueakTemp_integerReceiverValue := self positiveMachineIntegerValueOf: _gsSqueakTemp_integerReceiver.
			self successful
				ifTrue: [self
						pop: 2
						thenPush: (self
								positiveMachineIntegerFor: (_gsSqueakTemp_integerArgumentValue bitXor: _gsSqueakTemp_integerReceiverValue))]]
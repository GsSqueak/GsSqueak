arithmetic integer primitives
primitiveBitAnd
	"Note no short-cut for SmallIntegers. Either the inline interpreter
	bytecode or the JIT primitive will handle this case."
	| _gsSqueakTemp_integerArgumentValue _gsSqueakTemp_integerReceiverValue |
	_gsSqueakTemp_integerArgumentValue := self positiveMachineIntegerValueOf: self stackTop.
	_gsSqueakTemp_integerReceiverValue := self
				positiveMachineIntegerValueOf: (self stackValue: 1).
	self successful
		ifTrue: [self
				pop: 2
				thenPush: (self
						positiveMachineIntegerFor: (_gsSqueakTemp_integerArgumentValue bitAnd: _gsSqueakTemp_integerReceiverValue))]
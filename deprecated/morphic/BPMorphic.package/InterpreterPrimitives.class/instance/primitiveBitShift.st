arithmetic integer primitives
primitiveBitShift
	"Perform a bitShift. In 32-bits deal only with non-negative 32-bit
	integers. In 64-bits deal with signed 64-bit quantities (max (2^63)-1)."
	| _gsSqueakTemp_integerReceiver _gsSqueakTemp_integerArgument _gsSqueakTemp_shifted |
	_gsSqueakTemp_integerArgument := self stackTop.
	(objectMemory isIntegerObject: _gsSqueakTemp_integerArgument)
		ifFalse: [^ self primitiveFail].
	_gsSqueakTemp_integerReceiver := self stackValue: 1.
	objectMemory wordSize = 4
		ifTrue: [_gsSqueakTemp_integerReceiver := self positive32BitValueOf: _gsSqueakTemp_integerReceiver]
		ifFalse: [_gsSqueakTemp_integerReceiver := self signed64BitValueOf: _gsSqueakTemp_integerReceiver].
	self successful
		ifTrue: [(_gsSqueakTemp_integerArgument := objectMemory integerValueOf: _gsSqueakTemp_integerArgument) >= 0
				ifTrue: ["Left shift -- must fail bits would be lost"
					_gsSqueakTemp_integerArgument <= objectMemory numSmallIntegerBits
						ifFalse: [^ self primitiveFail].
					_gsSqueakTemp_shifted := _gsSqueakTemp_integerReceiver << _gsSqueakTemp_integerArgument.
					self
						cCode: ''
						inSmalltalk: [_gsSqueakTemp_shifted := objectMemory wordSize = 4
										ifTrue: [_gsSqueakTemp_shifted signedIntFromLong]
										ifFalse: [_gsSqueakTemp_shifted signedIntFromLong64]].
					_gsSqueakTemp_integerReceiver
							= (objectMemory wordSize = 4
									ifTrue: [_gsSqueakTemp_shifted >> _gsSqueakTemp_integerArgument]
									ifFalse: [_gsSqueakTemp_shifted >>> _gsSqueakTemp_integerArgument])
						ifFalse: [^ self primitiveFail]]
				ifFalse: ["Right shift -- OK to lose bits"
					_gsSqueakTemp_integerArgument >= objectMemory numSmallIntegerBits negated
						ifFalse: [^ self primitiveFail].
					_gsSqueakTemp_shifted := objectMemory wordSize = 4
								ifTrue: [_gsSqueakTemp_integerReceiver >> (0 - _gsSqueakTemp_integerArgument)]
								ifFalse: [_gsSqueakTemp_integerReceiver >>> (0 - _gsSqueakTemp_integerArgument)]].
			_gsSqueakTemp_shifted := objectMemory wordSize = 4
						ifTrue: [self positive32BitIntegerFor: _gsSqueakTemp_shifted]
						ifFalse: [(objectMemory isIntegerValue: _gsSqueakTemp_shifted)
								ifTrue: [objectMemory integerObjectOf: _gsSqueakTemp_shifted]
								ifFalse: [self signed64BitIntegerFor: _gsSqueakTemp_shifted]].
			self pop: 2 thenPush: _gsSqueakTemp_shifted]
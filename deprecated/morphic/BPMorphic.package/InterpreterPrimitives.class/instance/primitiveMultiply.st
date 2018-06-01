arithmetic integer primitives
primitiveMultiply
	| _gsSqueakTemp_integerRcvr _gsSqueakTemp_integerArg _gsSqueakTemp_integerResult _gsSqueakTemp_overflow |
	_gsSqueakTemp_integerRcvr := self stackIntegerValue: 1.
	_gsSqueakTemp_integerArg := self stackIntegerValue: 0.
	self successful
		ifTrue: [_gsSqueakTemp_overflow := _gsSqueakTemp_integerRcvr > 0
						ifTrue: [_gsSqueakTemp_integerArg > 0
								ifTrue: [_gsSqueakTemp_integerRcvr > (objectMemory maxSmallInteger / _gsSqueakTemp_integerArg)]
								ifFalse: [_gsSqueakTemp_integerArg < (objectMemory minSmallInteger / _gsSqueakTemp_integerRcvr)]]
						ifFalse: [_gsSqueakTemp_integerArg > 0
								ifTrue: [_gsSqueakTemp_integerRcvr < (objectMemory minSmallInteger / _gsSqueakTemp_integerArg)]
								ifFalse: [_gsSqueakTemp_integerRcvr < 0
										and: [_gsSqueakTemp_integerArg < (objectMemory maxSmallInteger / _gsSqueakTemp_integerRcvr)]]].
			_gsSqueakTemp_overflow
				ifTrue: [self primitiveFail]
				ifFalse: [_gsSqueakTemp_integerResult := _gsSqueakTemp_integerRcvr * _gsSqueakTemp_integerArg.
					self
						pop: 2
						thenPush: (objectMemory integerObjectOf: _gsSqueakTemp_integerResult)]]
common selector sends
bytecodePrimMultiply
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg _gsSqueakTemp_result _gsSqueakTemp_overflow _gsSqueakTemp_oop |
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	_gsSqueakTemp_arg := self internalStackValue: 0.
	(objectMemory areIntegers: _gsSqueakTemp_rcvr and: _gsSqueakTemp_arg)
		ifTrue: [_gsSqueakTemp_rcvr := objectMemory integerValueOf: _gsSqueakTemp_rcvr.
			_gsSqueakTemp_arg := objectMemory integerValueOf: _gsSqueakTemp_arg.
			_gsSqueakTemp_overflow := _gsSqueakTemp_rcvr > 0
						ifTrue: [_gsSqueakTemp_arg > 0
								ifTrue: [_gsSqueakTemp_rcvr > (objectMemory maxSmallInteger / _gsSqueakTemp_arg)]
								ifFalse: [_gsSqueakTemp_arg < (objectMemory minSmallInteger / _gsSqueakTemp_rcvr)]]
						ifFalse: [_gsSqueakTemp_arg > 0
								ifTrue: [_gsSqueakTemp_rcvr < (objectMemory minSmallInteger / _gsSqueakTemp_arg)]
								ifFalse: [_gsSqueakTemp_rcvr < 0
										and: [_gsSqueakTemp_arg < (objectMemory maxSmallInteger / _gsSqueakTemp_rcvr)]]].
			_gsSqueakTemp_overflow
				ifFalse: [_gsSqueakTemp_result := _gsSqueakTemp_rcvr * _gsSqueakTemp_arg.
					_gsSqueakTemp_oop := objectMemory integerObjectOf: _gsSqueakTemp_result.
					self internalPop: 2 thenPush: _gsSqueakTemp_oop.
					^ self fetchNextBytecode"success"]]
		ifFalse: [self initPrimCall.
			self externalizeIPandSP.
			self primitiveFloatMultiply: _gsSqueakTemp_rcvr byArg: _gsSqueakTemp_arg.
			self internalizeIPandSP.
			self successful
				ifTrue: [^ self fetchNextBytecode"success"]].
	messageSelector := self specialSelector: 8.
	argumentCount := 1.
	self normalSend
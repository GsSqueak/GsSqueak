arithmetic float primitives
primitiveSmallFloatTimesTwoPower
	"Multiply the receiver by the power of the argument."
	| _gsSqueakTemp_rcvr _gsSqueakTemp_result _gsSqueakTemp_arg _gsSqueakTemp_twiceMaxExponent |
	_gsSqueakTemp_arg := self stackTop.
	(objectMemory isIntegerObject: _gsSqueakTemp_arg)
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_rcvr := self stackValue: 1.
	"N.B. SmallFloats are finite. NaN and Infinity overflow into boxed floats.
	This is doing range checking work that is done in ldexp, but we
	include it explicitly to exemplify bit manipulation of SmallFloats."
	(objectMemory isSmallFloatZero: _gsSqueakTemp_rcvr)
		ifTrue: [_gsSqueakTemp_result := _gsSqueakTemp_rcvr]
		ifFalse: [_gsSqueakTemp_arg := objectMemory integerValueOf: _gsSqueakTemp_arg.
			_gsSqueakTemp_twiceMaxExponent := 2 * (1 << self floatExponentBits).
			_gsSqueakTemp_arg < _gsSqueakTemp_twiceMaxExponent negated
				ifTrue: [_gsSqueakTemp_result := objectMemory mapSignedSmallFloatToSignedSmallFloatZero: _gsSqueakTemp_rcvr]
				ifFalse: ["clip arg to at most int range; ldexp's last arg is of type
					int "
					_gsSqueakTemp_arg > _gsSqueakTemp_twiceMaxExponent
						ifTrue: [_gsSqueakTemp_arg := _gsSqueakTemp_twiceMaxExponent].
					_gsSqueakTemp_result := objectMemory
								floatObjectOf: (self
										cCode: [self
												ld: (objectMemory smallFloatValueOf: _gsSqueakTemp_rcvr)
												exp: (self cCoerceSimple: _gsSqueakTemp_arg to: #int)]
										inSmalltalk: [(objectMemory smallFloatValueOf: _gsSqueakTemp_rcvr)
												timesTwoPower: _gsSqueakTemp_arg])]].
	self pop: 2 thenPush: _gsSqueakTemp_result
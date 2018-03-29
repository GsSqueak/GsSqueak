arithmetic float primitives
primitiveTimesTwoPower
	"Multiply the receiver by the power of the argument."
	| _gsSqueakTemp_rcvr _gsSqueakTemp_result _gsSqueakTemp_arg |
	_gsSqueakTemp_arg := self stackTop.
	(objectMemory isIntegerObject: _gsSqueakTemp_arg)
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_arg := objectMemory integerValueOf: _gsSqueakTemp_arg.
	objectMemory bytesPerOop > 4
		ifTrue: [| twiceMaxExponent |
			"clip arg to at most int range; ldexp's last arg is of type int"
			twiceMaxExponent := 2 * (1 << self floatExponentBits).
			_gsSqueakTemp_arg < twiceMaxExponent negated
				ifTrue: [_gsSqueakTemp_arg := twiceMaxExponent negated]
				ifFalse: [_gsSqueakTemp_arg > twiceMaxExponent
						ifTrue: [_gsSqueakTemp_arg := twiceMaxExponent]]].
	_gsSqueakTemp_rcvr := objectMemory
				floatValueOf: (self stackValue: 1).
	_gsSqueakTemp_result := self
				cCode: [self
						ld: _gsSqueakTemp_rcvr
						exp: (self cCoerceSimple: _gsSqueakTemp_arg to: #int)]
				inSmalltalk: [_gsSqueakTemp_rcvr timesTwoPower: _gsSqueakTemp_arg].
	self pop: 2 thenPushFloat: _gsSqueakTemp_result
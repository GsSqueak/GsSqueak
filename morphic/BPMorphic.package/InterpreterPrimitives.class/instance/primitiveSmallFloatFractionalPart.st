arithmetic float primitives
primitiveSmallFloatFractionalPart
	| _gsSqueakTemp_rcvr _gsSqueakTemp_frac _gsSqueakTemp_trunc |
	_gsSqueakTemp_rcvr := objectMemory smallFloatValueOf: self stackTop.
	_gsSqueakTemp_frac := self
				cCode: [self
						mod: _gsSqueakTemp_rcvr
						f: (self addressOf: _gsSqueakTemp_trunc)]
				inSmalltalk: [_gsSqueakTemp_rcvr fractionPart].
	self
		stackTopPut: (objectMemory floatObjectOf: _gsSqueakTemp_frac)
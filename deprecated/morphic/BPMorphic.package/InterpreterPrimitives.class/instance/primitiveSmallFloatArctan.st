arithmetic float primitives
primitiveSmallFloatArctan
	| _gsSqueakTemp_rcvr |
	_gsSqueakTemp_rcvr := objectMemory smallFloatValueOf: self stackTop.
	self
		stackTopPut: (objectMemory
				floatObjectOf: (self
						cCode: [_gsSqueakTemp_rcvr atan]
						inSmalltalk: [_gsSqueakTemp_rcvr arcTan]))
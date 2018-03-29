arithmetic float primitives
primitiveSmallFloatLogN
	"Natural log."
	| _gsSqueakTemp_rcvr |
	_gsSqueakTemp_rcvr := objectMemory smallFloatValueOf: self stackTop.
	self
		stackTopPut: (objectMemory
				floatObjectOf: (self
						cCode: [_gsSqueakTemp_rcvr log]
						inSmalltalk: [_gsSqueakTemp_rcvr ln]))
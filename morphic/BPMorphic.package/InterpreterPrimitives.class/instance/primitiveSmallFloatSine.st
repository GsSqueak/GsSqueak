arithmetic float primitives
primitiveSmallFloatSine
	| _gsSqueakTemp_rcvr |
	_gsSqueakTemp_rcvr := objectMemory smallFloatValueOf: self stackTop.
	self
		stackTopPut: (objectMemory floatObjectOf: _gsSqueakTemp_rcvr sin)
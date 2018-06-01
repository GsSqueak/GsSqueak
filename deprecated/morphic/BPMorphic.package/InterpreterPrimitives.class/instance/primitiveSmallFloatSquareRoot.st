arithmetic float primitives
primitiveSmallFloatSquareRoot
	| _gsSqueakTemp_rcvr |
	_gsSqueakTemp_rcvr := objectMemory smallFloatValueOf: self stackTop.
	_gsSqueakTemp_rcvr >= 0.0
		ifTrue: [self
				stackTopPut: (objectMemory floatObjectOf: _gsSqueakTemp_rcvr sqrt)]
		ifFalse: [self primitiveFail]
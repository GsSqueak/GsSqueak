memory space primitives
primitiveGrowMemoryByAtLeast
	| _gsSqueakTemp_ammount |
	_gsSqueakTemp_ammount := self stackTop.
	(objectMemory isIntegerObject: _gsSqueakTemp_ammount)
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	(objectMemory
		growOldSpaceByAtLeast: (objectMemory integerValueOf: _gsSqueakTemp_ammount))
		ifNil: [self primitiveFailFor: PrimErrNoMemory]
		ifNotNil: [:segSize | self pop: 2 thenPushInteger: segSize]
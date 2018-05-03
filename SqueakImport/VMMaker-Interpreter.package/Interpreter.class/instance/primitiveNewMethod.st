compiled methods
primitiveNewMethod
	| header bytecodeCount class size theMethod literalCount |
	header := self popStack.
	bytecodeCount := self popInteger.
	self success: (objectMemory isIntegerObject: header).
	self successful ifFalse:
		[self unPop: 2. ^nil].
	class := self popStack.
	size := (self literalCountOfHeader: header) + 1 * objectMemory bytesPerWord + bytecodeCount.
	theMethod := objectMemory instantiateClass: class indexableSize: size.
	objectMemory storePointerUnchecked: HeaderIndex ofObject: theMethod withValue: header.
	literalCount := self literalCountOfHeader: header.
	1 to: literalCount do:
		[:i | objectMemory storePointer: i ofObject: theMethod withValue: objectMemory getNilObj].
	self push: theMethod
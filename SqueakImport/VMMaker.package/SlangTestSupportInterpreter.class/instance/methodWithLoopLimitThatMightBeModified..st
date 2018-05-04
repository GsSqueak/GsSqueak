loop limits
methodWithLoopLimitThatMightBeModified: arrayObj

	0 to: (objectMemory lengthOf: arrayObj) do:
	[:i | self storePointerUnchecked: i ofObject: arrayObj withValue: nilObj]

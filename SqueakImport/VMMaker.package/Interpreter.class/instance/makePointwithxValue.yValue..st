utilities
makePointwithxValue: xValue yValue: yValue
"make a Point xValue@yValue.
We know both will be integers so no value nor root checking is needed"
	| pointResult |
	pointResult := objectMemory instantiateSmallClass: (objectMemory splObj: ClassPoint) sizeInBytes: 3 * objectMemory bytesPerWord.
	objectMemory storePointerUnchecked: XIndex ofObject: pointResult withValue: (objectMemory integerObjectOf: xValue).
	objectMemory storePointerUnchecked: YIndex ofObject: pointResult withValue: (objectMemory integerObjectOf: yValue).
	^ pointResult
sourcePointer conversion
fileIndexAndPositionFromSourcePointer: sourcePointer do: aBlock

	^aBlock
		value: (self fileIndexFromSourcePointer: sourcePointer)
		value: (self filePositionFromSourcePointer: sourcePointer)
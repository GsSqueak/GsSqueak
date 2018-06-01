contexts
stackIntegerValue: offset
	| integerPointer |
	integerPointer := objectMemory longAt: stackPointer - (offset * objectMemory bytesPerWord).
	^self checkedIntegerValueOf: integerPointer
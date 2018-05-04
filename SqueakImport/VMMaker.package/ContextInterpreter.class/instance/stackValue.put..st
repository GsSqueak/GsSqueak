contexts
stackValue: offset put: oop
	^objectMemory longAt: stackPointer - (offset * objectMemory bytesPerWord)
		put: oop
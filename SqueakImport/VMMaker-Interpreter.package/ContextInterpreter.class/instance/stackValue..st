contexts
stackValue: offset
	^ objectMemory longAt: stackPointer - (offset * objectMemory bytesPerWord)
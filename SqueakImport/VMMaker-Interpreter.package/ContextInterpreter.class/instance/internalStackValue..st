contexts
internalStackValue: offset

	^ objectMemory longAtPointer: localSP - (offset * objectMemory bytesPerWord)
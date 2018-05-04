contexts
internalPop: nItems thenPush: oop

	objectMemory longAtPointer: (localSP := localSP - ((nItems - 1) * objectMemory bytesPerWord)) put: oop.

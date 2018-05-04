contexts
pop: nItems thenPush: oop

	| sp |
	objectMemory longAt: (sp := stackPointer - ((nItems - 1) * objectMemory bytesPerWord)) put: oop.
	stackPointer := sp.

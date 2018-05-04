contexts
push: object

	| sp |
	objectMemory longAt: (sp := stackPointer + objectMemory bytesPerWord) put: object.
	stackPointer := sp.
contexts
popStack

	| top |
	top := objectMemory longAt: stackPointer.
	stackPointer := stackPointer - objectMemory bytesPerWord.
	^ top
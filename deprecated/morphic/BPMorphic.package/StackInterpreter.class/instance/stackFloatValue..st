stack access
stackFloatValue: offset 
	"In the StackInterpreter stacks grow down."
	^ objectMemory
		floatValueOf: (stackPages longAt: stackPointer + (offset * objectMemory wordSize))
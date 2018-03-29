internal interpreter access
pop: nItems 
	"In the StackInterpreter stacks grow down."
	stackPointer := stackPointer + (nItems * objectMemory wordSize).
	^ nil
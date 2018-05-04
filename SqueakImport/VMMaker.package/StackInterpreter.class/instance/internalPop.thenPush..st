internal interpreter access
internalPop: nItems thenPush: oop
	"In the StackInterpreter stacks grow down."
	stackPages longAtPointer: (localSP := localSP + ((nItems - 1) * objectMemory bytesPerWord)) put: oop
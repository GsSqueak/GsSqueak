contexts
pop: nItems thenPushInteger: integerVal
"lots of places pop a few items off the stack and then push an integer. MAke it convenient"
	| sp |
	objectMemory longAt: (sp := stackPointer - ((nItems - 1) * objectMemory bytesPerWord)) put:(objectMemory integerObjectOf: integerVal).
	stackPointer := sp.

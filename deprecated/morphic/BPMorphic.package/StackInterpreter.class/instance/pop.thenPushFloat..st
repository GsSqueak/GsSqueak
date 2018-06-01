internal interpreter access
pop: nItems thenPushFloat: f 
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_sp |
	stackPages
		longAt: (_gsSqueakTemp_sp := stackPointer + (nItems - 1 * objectMemory wordSize))
		put: (objectMemory floatObjectOf: f).
	stackPointer := _gsSqueakTemp_sp
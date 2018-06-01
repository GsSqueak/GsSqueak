internal interpreter access
pop: nItems thenPushBool: trueOrFalse 
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_sp |
	stackPages
		longAt: (_gsSqueakTemp_sp := stackPointer + (nItems - 1 * objectMemory wordSize))
		put: (objectMemory booleanObjectOf: trueOrFalse).
	stackPointer := _gsSqueakTemp_sp
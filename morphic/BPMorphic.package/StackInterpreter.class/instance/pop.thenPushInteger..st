internal interpreter access
pop: nItems thenPushInteger: integerVal 
	"lots of places pop a few items off the stack and then push an integer.
	Make it convenient.
	In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_sp |
	stackPages
		longAt: (_gsSqueakTemp_sp := stackPointer + (nItems - 1 * objectMemory wordSize))
		put: (objectMemory integerObjectOf: integerVal).
	stackPointer := _gsSqueakTemp_sp
internal interpreter access
pop: nItems thenPush: oop 
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_sp |
	stackPages longAt: (_gsSqueakTemp_sp := stackPointer + (nItems - 1 * objectMemory wordSize)) put: oop.
	stackPointer := _gsSqueakTemp_sp
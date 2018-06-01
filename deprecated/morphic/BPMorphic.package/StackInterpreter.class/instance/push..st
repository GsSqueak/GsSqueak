internal interpreter access
push: object 
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_sp |
	stackPages longAt: (_gsSqueakTemp_sp := stackPointer - objectMemory wordSize) put: object.
	stackPointer := _gsSqueakTemp_sp
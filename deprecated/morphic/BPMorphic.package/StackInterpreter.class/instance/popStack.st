internal interpreter access
popStack
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_top |
	_gsSqueakTemp_top := stackPages longAt: stackPointer.
	stackPointer := stackPointer + objectMemory wordSize.
	^ _gsSqueakTemp_top
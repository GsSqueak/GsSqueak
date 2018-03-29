stack access
stackIntegerValue: offset 
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_integerPointer |
	_gsSqueakTemp_integerPointer := stackPages longAt: stackPointer + (offset * objectMemory wordSize).
	^ self checkedIntegerValueOf: _gsSqueakTemp_integerPointer
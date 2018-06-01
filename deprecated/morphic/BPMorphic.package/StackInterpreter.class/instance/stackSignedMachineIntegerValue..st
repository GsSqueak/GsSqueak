stack access
stackSignedMachineIntegerValue: offset 
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_integerPointer |
	_gsSqueakTemp_integerPointer := stackPages longAt: stackPointer + (offset * objectMemory wordSize).
	^ self signedMachineIntegerValueOf: _gsSqueakTemp_integerPointer
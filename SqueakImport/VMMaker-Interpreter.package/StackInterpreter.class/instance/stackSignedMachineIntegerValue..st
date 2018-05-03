stack access
stackSignedMachineIntegerValue: offset
	<api>
	<returnTypeC: #'long'>
	"In the StackInterpreter stacks grow down."
	| integerPointer |
	integerPointer := stackPages longAt: stackPointer + (offset*objectMemory wordSize).
	^self signedMachineIntegerValueOf: integerPointer
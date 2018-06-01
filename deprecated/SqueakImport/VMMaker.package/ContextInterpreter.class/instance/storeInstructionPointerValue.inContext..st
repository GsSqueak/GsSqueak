contexts
storeInstructionPointerValue: value inContext: contextPointer
	"Assume: value is an integerValue"

	objectMemory storePointerUnchecked: InstructionPointerIndex ofObject: contextPointer withValue: (objectMemory integerObjectOf: value).
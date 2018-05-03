utilities
internalizeIPandSP
	"Copy the local instruction and stack pointer to local variables for rapid access within the interpret loop."

	localIP := objectMemory pointerForOop: instructionPointer.
	localSP := objectMemory pointerForOop: stackPointer.
	localHomeContext := theHomeContext.

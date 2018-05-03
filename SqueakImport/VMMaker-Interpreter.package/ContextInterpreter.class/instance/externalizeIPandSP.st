utilities
externalizeIPandSP
	"Copy the local instruction and stack pointer to global variables for use in primitives and other functions outside the interpret loop."

	instructionPointer := objectMemory oopForPointer: localIP.
	stackPointer := objectMemory oopForPointer: localSP.
	theHomeContext := localHomeContext.

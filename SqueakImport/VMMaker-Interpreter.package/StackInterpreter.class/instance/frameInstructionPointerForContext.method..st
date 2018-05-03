frame access
frameInstructionPointerForContext: aContext method: aMethod
	"Answer the instruction pointer for usage in a frame (a pointer to a bytecode)
	 from the index instructionPointer in the given context."
	^aMethod
	+ (self quickFetchInteger: InstructionPointerIndex ofObject: aContext)
	+ objectMemory baseHeaderSize
	- 2
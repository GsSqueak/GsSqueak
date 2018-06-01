scanning
abstractBytecodeMessageAt: t1 
	^ [(InstructionStream new method: self pc: t1)
		interpretNextInstructionFor: nil]
		on: MessageNotUnderstood
		do: [:t2 | t2 message]
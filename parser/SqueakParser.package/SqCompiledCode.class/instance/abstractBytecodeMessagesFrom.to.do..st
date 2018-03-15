scanning
abstractBytecodeMessagesFrom: t1 to: t2 do: t3 
	| t4 |
	t4 := InstructionStream new method: self pc: t1.
	[t4 pc <= t2]
		whileTrue: [[t4 interpretNextInstructionFor: nil]
				on: MessageNotUnderstood
				do: [:t5 | t3 value: t5 message]]
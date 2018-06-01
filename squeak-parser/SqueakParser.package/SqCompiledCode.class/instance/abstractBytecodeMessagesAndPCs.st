scanning
abstractBytecodeMessagesAndPCs
	| t1 t2 t3 t4 t5 |
	t4 := InstructionStream new method: self pc: (t2 := self initialPC).
	t1 := OrderedCollection new: (t3 := self endPC) - t2.
	[(t5 := t4 pc) <= t3]
		whileTrue: [[t4 interpretNextInstructionFor: nil]
				on: MessageNotUnderstood
				do: [:t7 | t1 addLast: {t7 message. t5}]].
	^ t1
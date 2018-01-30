scanning
scanFor: byteOrClosure
	"Answer whether the receiver contains the argument as a bytecode,
	 if it is a number, or evaluates to true if a block."
	^ (InstructionStream on: self) scanFor: (byteOrClosure isBlock
													ifTrue: [byteOrClosure]
													ifFalse: [[:instr | instr = byteOrClosure]])
"
Smalltalk browseAllSelect: [:m | m scanFor: 134]
"
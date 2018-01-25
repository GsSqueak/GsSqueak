decoding
interpretJumpIfCond
	"If the instruction at pc is a conditional jump, interpret it, advancing the pc,
	 and answering the jump distance. Otherwise answer nil."
	^self method encoderClass interpretJumpIfCondIn: self
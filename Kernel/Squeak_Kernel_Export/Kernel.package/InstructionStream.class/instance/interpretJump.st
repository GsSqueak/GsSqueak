decoding
interpretJump
	"If the instruction at pc is an unconditional jump, interpret it, advancing the pc,
	 and answering the jump distance. Otherwise answer nil."
	^self method encoderClass interpretJumpIn: self
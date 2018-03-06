instruction stream support
interpretJumpIn: anInstructionStream 
	"Double-dispatch through the encoder to select the correct jump
	decoder for the instruction set."
	self subclassResponsibility
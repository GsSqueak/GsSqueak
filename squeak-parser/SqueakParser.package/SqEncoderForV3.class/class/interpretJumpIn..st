instruction stream support
interpretJumpIn: anInstructionStream 
	"Double-dispatch through the encoder to select the correct jump
	interpreter for the instruction set."
	^ anInstructionStream interpretV3Jump
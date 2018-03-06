instruction stream support
interpretNextInstructionFor: aClient in: anInstructionStream 
	"Double-dispatch instruction interpretation through the encoder
	to select the correct instruction set decoder."
	self subclassResponsibility
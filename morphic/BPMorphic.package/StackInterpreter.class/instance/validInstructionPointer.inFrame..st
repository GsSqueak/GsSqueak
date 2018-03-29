debug support
validInstructionPointer: anInstrPointer inFrame: fp 
	"Note that we accept anInstrPointer pointing to a callPrimitiveBytecode
	at the start of a method that contains a primitive. This because
	methods like
	Context(Part)>>reset have to be updated to skip the callPrimtiive
	bytecode otherwise."
	^ self
		validInstructionPointer: anInstrPointer
		inMethod: (self frameMethodObject: fp)
		framePointer: fp
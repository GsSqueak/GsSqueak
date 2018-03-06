bytecode decoding
createClosureCode
	"Answer the create closure bytecode, if it exists in the encoder's
	bytecode set, or nil if not.
	Actually this code is that for a closure whose bytecodes are nested
	within its home method's."
	^ 143
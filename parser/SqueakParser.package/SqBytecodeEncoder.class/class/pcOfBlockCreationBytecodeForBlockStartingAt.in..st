bytecode decoding
pcOfBlockCreationBytecodeForBlockStartingAt: startpc in: method 
	"Answer the pc of the push closure bytecode whose block starts at
	startpc in method."
	^ self subclassResponsibility
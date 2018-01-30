instruction decoding
pushClosureCopyNumCopiedValues: numCopied numArgs: numArgs blockSize: blockSize
	"Create a BlockClosure corresponding to the closure bytecode
	 and execute the action block with it. The created BlockClosure is only a pseudo value,
	 it is not populated with meaningful context and argument information."
	| block |
	block := BlockClosure
				outerContext: currentContext
				startpc: scanner pc
				numArgs: numArgs
				copiedValues: (Array new: numCopied)..
	currentContext := block asContextWithSender: currentContext.
	action value: block
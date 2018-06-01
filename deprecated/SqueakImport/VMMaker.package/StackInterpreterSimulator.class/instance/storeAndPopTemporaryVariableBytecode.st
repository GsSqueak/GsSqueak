bytecode routines
storeAndPopTemporaryVariableBytecode
	"Interpreter version has fetchNextBytecode out of order"
	self temporary: (currentBytecode bitAnd: 7) in: localFP put: self internalStackTop.
	self fetchNextBytecode.
	self internalPop: 1
bytecode routines
pushTemporaryVariableBytecode

	"Interpreter version has fetchNextBytecode out of order"
	self pushTemporaryVariable: (currentBytecode bitAnd: 16rF).
	self fetchNextBytecode.

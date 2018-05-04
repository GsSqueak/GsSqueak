bytecode routines
pushReceiverVariableBytecode

	"Interpreter version has fetchNextBytecode out of order"
	self pushReceiverVariable: (currentBytecode bitAnd: 16rF).
	self fetchNextBytecode.

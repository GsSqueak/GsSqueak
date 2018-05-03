bytecode routines
pushLiteralVariableBytecode

	"Interpreter version has fetchNextBytecode out of order"
	self pushLiteralVariable: (currentBytecode bitAnd: 16r1F).
	self fetchNextBytecode.

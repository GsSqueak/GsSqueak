bytecode routines
pushLiteralConstantBytecode

	"Interpreter version has fetchNextBytecode out of order"
	self pushLiteralConstant: (currentBytecode bitAnd: 16r1F).
	self fetchNextBytecode.

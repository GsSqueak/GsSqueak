stack bytecodes
pushLiteralConstantBytecode

	self flag: #'requires currentBytecode to be expanded to a constant'.
	self fetchNextBytecode.
	"this bytecode will be expanded so that refs to currentBytecode below will be constant"
	self pushLiteralConstant: (currentBytecode bitAnd: 16r1F).

stack bytecodes
pushTemporaryVariableBytecode

	self flag: #'requires currentBytecode to be expanded to a constant'.
	self fetchNextBytecode.
	"this bytecode will be expanded so that refs to currentBytecode below will be constant"
	self pushTemporaryVariable: (currentBytecode bitAnd: 16rF).

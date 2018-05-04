stack bytecodes
pushReceiverVariableBytecode

	self flag: #'requires currentBytecode to be expanded to a constant'.
	self fetchNextBytecode.
	"this bytecode will be expanded so that refs to currentBytecode below will be constant"
	self pushReceiverVariable: (currentBytecode bitAnd: 16rF).

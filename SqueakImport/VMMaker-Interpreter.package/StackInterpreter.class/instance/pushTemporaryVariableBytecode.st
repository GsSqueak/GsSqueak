stack bytecodes
pushTemporaryVariableBytecode
	<expandCases>
	self fetchNextBytecode.
	"this bytecode will be expanded so that refs to currentBytecode below will be constant"
	self pushTemporaryVariable: (currentBytecode bitAnd: 16rF)
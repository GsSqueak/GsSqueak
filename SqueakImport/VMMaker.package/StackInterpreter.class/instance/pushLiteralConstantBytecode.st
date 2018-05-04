stack bytecodes
pushLiteralConstantBytecode
	<expandCases>
	self fetchNextBytecode.
	"this bytecode will be expanded so that refs to currentBytecode below will be constant"
	self pushLiteralConstant: (currentBytecode bitAnd: 16r1F)
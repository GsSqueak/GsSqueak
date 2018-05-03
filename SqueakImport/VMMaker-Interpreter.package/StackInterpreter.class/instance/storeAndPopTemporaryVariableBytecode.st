stack bytecodes
storeAndPopTemporaryVariableBytecode
	<expandCases>
	"this bytecode will be expanded so that refs to currentBytecode below will be constant"
	self fetchNextBytecode.
	self temporary: (currentBytecode bitAnd: 7) in: localFP put: self internalStackTop.
	self internalPop: 1
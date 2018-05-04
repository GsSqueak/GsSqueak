stack bytecodes
storeAndPopTemporaryVariableBytecode

	self flag: #'requires currentBytecode to be expanded to a constant'.
	self fetchNextBytecode.
	"this bytecode will be expanded so that refs to currentBytecode below will be constant"
	objectMemory storePointerUnchecked: (currentBytecode bitAnd: 7) + TempFrameStart
		ofObject: localHomeContext
		withValue: self internalStackTop.
	self internalPop: 1.

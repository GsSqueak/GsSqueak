stack bytecodes
pushConstantFalseBytecode

	self fetchNextBytecode.
	self internalPush: objectMemory getFalseObj.

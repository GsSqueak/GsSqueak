stack bytecodes
pushLiteralConstantBytecode
	self
		cCode: ["this bytecode will be expanded so that refs to
			currentBytecode below will be constant"
			self fetchNextBytecode.
			self
				pushLiteralConstant: (currentBytecode bitAnd: 31)]
		inSmalltalk: ["Interpreter version has fetchNextBytecode out of order"
			self
				pushLiteralConstant: (currentBytecode bitAnd: 31).
			self fetchNextBytecode]
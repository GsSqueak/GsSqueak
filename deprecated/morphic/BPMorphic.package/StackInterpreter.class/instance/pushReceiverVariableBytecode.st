stack bytecodes
pushReceiverVariableBytecode
	self
		cCode: ["this bytecode will be expanded so that refs to
			currentBytecode below will be constant"
			self fetchNextBytecode.
			self
				pushReceiverVariable: (currentBytecode bitAnd: 15)]
		inSmalltalk: ["Interpreter version has fetchNextBytecode out of order"
			self
				pushReceiverVariable: (currentBytecode bitAnd: 15).
			self fetchNextBytecode]
jump bytecodes
shortUnconditionalJump
	self jump: (currentBytecode bitAnd: 7)
			+ 1
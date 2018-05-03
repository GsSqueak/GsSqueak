testing - conversion
testFractionIsAnExactFloat
	self assert: (1/2) isAnExactFloat.
	self assert: (1<<Float precision - 1 / (1 << 8)) isAnExactFloat.
	self assert: (Float fmin asFraction * 3) isAnExactFloat.
	self assert: Float fmin asFraction isAnExactFloat.
	self deny: (Float fmin asFraction / 2) isAnExactFloat.
	self deny: (Float fmin asFraction * 3 / 2) isAnExactFloat.
	self deny: (1 / 3) isAnExactFloat.
	self deny: (1<<Float precision + 1 / 2) isAnExactFloat.
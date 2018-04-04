testing - conversion
testLargeIntegerIsAnExactFloat
	self assert: Float fmax asInteger isAnExactFloat.
	self deny: (Float fmax asInteger + (Float fmax ulp / 2) asInteger) isAnExactFloat.
	self deny: (Float fmax asInteger * 2) isAnExactFloat
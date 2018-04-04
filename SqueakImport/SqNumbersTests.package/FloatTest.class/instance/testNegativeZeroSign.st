zero behavior
testNegativeZeroSign
	self assert: Float negativeZero sign = 0.
	self assert: Float negativeZero signBit = 1 "That's how we can distinguish from positive zero"
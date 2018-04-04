zero behavior
testNegativeZeroAbs
	self assert: Float negativeZero abs signBit = 0 description: 'the absolute value of a negative zero is zero'
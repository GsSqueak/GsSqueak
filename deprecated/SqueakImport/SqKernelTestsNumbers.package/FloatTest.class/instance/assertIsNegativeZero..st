accessing
assertIsNegativeZero: aFloat
	"Assert that aFloat is Float negativeZero"
	self assert: aFloat = 0.0.
	self assert: aFloat signBit = 1
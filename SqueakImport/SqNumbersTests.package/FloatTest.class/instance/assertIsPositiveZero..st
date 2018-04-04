accessing
assertIsPositiveZero: aFloat
	"Assert that aFloat is Float zero (the positive one)"
	self assert: aFloat = 0.0.
	self assert: aFloat signBit = 0
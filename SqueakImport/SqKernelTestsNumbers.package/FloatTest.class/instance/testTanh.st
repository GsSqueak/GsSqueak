tests - mathematical functions
testTanh
	self assertIsPositiveZero: 0.0 tanh.
	self assertIsNegativeZero: Float negativeZero tanh.
	self assert: (Float infinity tanh closeTo: 1).
	self assert: (2.0 cosh squared - 2.0 sinh squared closeTo: 1).
	self assert: (2.0 tanh negated closeTo: 2.0 negated tanh).
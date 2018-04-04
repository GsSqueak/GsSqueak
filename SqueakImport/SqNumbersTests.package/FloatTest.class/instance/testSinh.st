tests - mathematical functions
testSinh
	self assertIsPositiveZero: 0.0 sinh.
	self assertIsNegativeZero: Float negativeZero sinh.
	self deny: Float infinity sinh isFinite.
	self assert: (2.0 cosh squared - 2.0 sinh squared closeTo: 1).
	self assert: (2.0 sinh negated closeTo: 2.0 negated sinh).
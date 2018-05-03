tests - mathematical functions
testArTanh
	self assertIsPositiveZero: 0.0 arTanh.
	self assertIsNegativeZero: Float negativeZero arTanh.
	self deny: 1 arTanh isFinite.
	self assert: (0.5 arTanh negated closeTo: 0.5 negated arTanh).
	self assert: (0.5 arTanh tanh closeTo: 0.5).
	self assert: (-0.5 arTanh tanh closeTo: -0.5).
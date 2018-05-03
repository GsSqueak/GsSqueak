tests - mathematical functions
testArSinh
	self assertIsPositiveZero: 0.0 arSinh.
	self assertIsNegativeZero: Float negativeZero arSinh.
	self deny: Float infinity arSinh isFinite.
	self assert: (0.5 arSinh negated closeTo: 0.5 negated arSinh).
	self assert: (0.5 arSinh sinh closeTo: 0.5).
	self assert: (-2.5 arSinh sinh closeTo: -2.5).
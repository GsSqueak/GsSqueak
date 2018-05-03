tests - mathematical functions
testCosh
	self assert: (0.0 cosh closeTo: 1).
	self deny: Float infinity cosh isFinite.
	self assert: (2.0 cosh squared - 2.0 sinh squared closeTo: 1).
	self assert: (2.0 cosh closeTo: 2.0 negated cosh).
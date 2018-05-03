tests - mathematical functions
testLn
	self assert: (100.0s1 ln closeTo: 10 ln*2).
	self assert: ((2 raisedTo: Float emax + 3) asScaledDecimal ln closeTo: 2 ln*(Float emax + 3)) description: 'ScaledDecimal>>ln should not overflow'
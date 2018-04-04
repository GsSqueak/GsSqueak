characterization
testUlp

	{Float pi predecessor. Float pi. Float pi successor} do:
		[:f |
		self assert: (f * 2) ulp = (f ulp * 2).
		self assert: (f / 2) ulp = (f ulp / 2).
		self deny: f + f ulp = f.
		self deny: f - f ulp = f.
		"Tests below are valid as long as default rounding mode (to nearest even) is used"
		self assert: f significandAsInteger odd ==> (f ulp / 2.0 + f = f successor).
		self assert: f significandAsInteger even ==> (f ulp / 2.0 + f = f)].
	
	self assert: 0.0 ulp = Float fmin.
	self assert: 1.0 ulp = Float epsilon.
	self assert: Float nan ulp isNaN.
	self assert: Float infinity ulp = Float infinity.
	self assert: Float negativeInfinity ulp = Float infinity.

	self assert: ((0 to: Float precision - 1) allSatisfy: [:each | (Float fmin timesTwoPower: each) ulp = Float fmin]).	
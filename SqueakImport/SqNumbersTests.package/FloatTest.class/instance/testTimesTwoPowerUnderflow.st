testing - arithmetic
testTimesTwoPowerUnderflow
	self assert: ((2.0 raisedTo: Float emax) timesTwoPower: Float emin - Float emax) equals: Float fminNormalized.
	self assert: (Float infinity timesTwoPower: SmallInteger minVal * SmallInteger maxVal) equals: Float infinity.

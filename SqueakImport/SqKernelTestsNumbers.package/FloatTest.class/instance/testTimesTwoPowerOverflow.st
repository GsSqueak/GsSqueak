testing - arithmetic
testTimesTwoPowerOverflow
	self assert: (Float fminNormalized timesTwoPower: Float emax - Float emin) equals: (2.0 raisedTo: Float emax).
	self assert: (Float zero timesTwoPower: SmallInteger maxVal squared) equals: Float zero.

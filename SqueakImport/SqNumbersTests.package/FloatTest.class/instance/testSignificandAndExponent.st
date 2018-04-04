characterization
testSignificandAndExponent
	| denormals exceptionals normals |
	
	normals := {Float pi. Float pi * 100.0. Float pi/ -100.0. Float fmax. Float fminNormalized}.
	denormals := {0.0. Float negativeZero. Float fminNormalized predecessor. Float fmin negated}.
	exceptionals := {Float nan. Float infinity. Float negativeInfinity.}.
	
	normals , denormals , exceptionals do: [:aFloat |
		"Any Float can be decomposed into its significand and exponent, and the significand holds the sign"
		aFloat isNaN
			ifTrue: [self assert: (aFloat significand timesTwoPower: aFloat exponent) isNaN]
			ifFalse: [self
				assert: (aFloat significand timesTwoPower: aFloat exponent)
				equals: aFloat]].
	
	normals , denormals do: [:aFloat |
		"The significand magnitude is in interval [1.0,2.0( "
		aFloat = 0.0
			ifTrue: [self assert: aFloat significand equals: 0]
			ifFalse: [self
				assert: aFloat significand abs >= 1.0;
				assert: aFloat significand abs < 2.0]]
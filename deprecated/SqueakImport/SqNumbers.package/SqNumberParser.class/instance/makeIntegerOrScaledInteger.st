parsing-private
makeIntegerOrScaledInteger
	"At this point, there is no digit, nor fractionPart.
	 Maybe it can be a scaled decimal with fraction omitted...
	 Maybe it can be a Float with a negative exponent"
	
	neg ifTrue:
		[integerPart := integerPart negated].
	self readExponent ifTrue:
		["Check that the result is an integer, otherwise answer a Float.  Fractions are /not/ valid literals."
		 (exponent >= 0 or: [(integerPart * (base raisedToInteger: exponent)) isInteger]) ifFalse:
			[base := base asFloat].
		^integerPart * (base raisedToInteger: exponent)].
	(self readScaleWithDefaultNumberOfDigits: 0) ifTrue:
		[^integerPart asScaledDecimal: scale].
	^ integerPart
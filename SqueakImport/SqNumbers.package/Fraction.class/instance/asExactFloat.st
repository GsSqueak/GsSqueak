converting
asExactFloat
	"When we know that this Fraction is an exact Float, this conversion is much faster than asFloat."

	^numerator asFloat timesTwoPower: 1 - denominator highBit
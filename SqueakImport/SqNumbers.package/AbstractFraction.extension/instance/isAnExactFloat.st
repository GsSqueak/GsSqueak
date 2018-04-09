*SqNumbers-testing
isAnExactFloat
	"Answer true if this Fraction can be converted exactly to a Float"
	^ denominator isPowerOfTwo
		and: ["I have a reasonable significand: not too big"
			numerator highBitOfMagnitude <= Float precision
				and: ["I have a reasonable exponent: not too small"
					Float emin + denominator highBitOfMagnitude <= Float precision]]

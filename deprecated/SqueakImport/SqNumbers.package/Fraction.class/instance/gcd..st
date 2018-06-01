arithmetic
gcd: aFraction
	| d |
	d := denominator gcd: aFraction denominator.
	^(numerator *(aFraction denominator//d) gcd: aFraction numerator*(denominator//d)) / (denominator//d*aFraction denominator)
comparing
hash
	"Hash is reimplemented because = is implemented."
	
	"Care is taken that a Fraction equal to a Float also has an equal hash"
	self isAnExactFloat ifTrue: [^self asExactFloat hash].
	
	"Else, I cannot be exactly equal to a Float, use own hash algorithm."
	^numerator hash hashMultiply bitXor: denominator hash
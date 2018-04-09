*SqNumbers-mathematical functions
nthRoot: aPositiveInteger
	"Answer the nth root of the receiver.
	Answer an Integer if root is exactly this Integer, else answer the Float nearest the exact root."

	| guess excess scaled nBits |
	guess := self nthRootRounded: aPositiveInteger.
	excess := (guess raisedTo: aPositiveInteger) - self.
	excess = 0 ifTrue: [ ^ guess ].

	nBits := Float precision - guess highBitOfMagnitude.
	nBits <= 0 ifTrue: [ ^(Fraction numerator: guess * 4 - excess sign denominator: 4) asFloat].

	scaled := self << (nBits * aPositiveInteger).
	guess := scaled nthRootRounded: aPositiveInteger.
	excess := (guess raisedTo: aPositiveInteger) - scaled.
	^(Fraction numerator: guess * 4 - excess sign denominator: 1 << (nBits + 2)) asFloat
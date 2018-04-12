mathematical functions
nthRoot: aPositiveInteger
	"Answer the nth root of the receiver."

	| guess |
	guess := (numerator nthRootTruncated: aPositiveInteger) / (denominator nthRootTruncated: aPositiveInteger).
	(guess raisedTo: aPositiveInteger) = self ifTrue: [^guess].
	"There is no exact nth root, so answer a Float approximation"
	^(self abs ln / aPositiveInteger) exp * self sign
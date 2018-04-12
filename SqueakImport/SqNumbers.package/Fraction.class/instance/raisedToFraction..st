mathematical functions
raisedToFraction: aFraction
	| root |
	root := (self numerator nthRootTruncated: aFraction denominator) / (self denominator nthRootTruncated: aFraction denominator).
	(root raisedToInteger: aFraction denominator) = self ifTrue: [^root raisedToInteger: aFraction numerator].
	^super raisedToFraction: aFraction
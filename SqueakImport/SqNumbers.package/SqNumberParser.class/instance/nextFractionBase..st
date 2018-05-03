parsing-public
nextFractionBase: aRadix
	| numerator denominator |
	base := aRadix.
	neg := self peekSignIsMinus.
	(integerPart := self nextUnsignedIntegerOrNilBase: base)
		ifNil: [^self expected: 'a digit between 0 and ' , (Character digitValue: aRadix)].
	numerator := neg
		ifTrue: [integerPart negated]
		ifFalse: [integerPart].
	self readExponent ifTrue: [numerator := numerator * (base raisedToInteger: exponent)].
	(sourceStream peekFor: $/) ifFalse: [^numerator].
	(denominator := self nextUnsignedIntegerOrNilBase: base)
		ifNil:
			[sourceStream skip: -1. "Not a valid denominator, ungobble / and return numerator"
			^numerator].
	self readExponent ifTrue: [denominator := denominator * (base raisedToInteger: exponent)].
	^numerator / denominator
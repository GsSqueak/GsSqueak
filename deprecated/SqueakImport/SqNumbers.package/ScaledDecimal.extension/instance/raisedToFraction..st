*SqNumbers-mathematical functions
raisedToFraction: aFraction
	| result |
	result := self asFraction raisedToFraction: aFraction.
	^result isFloat
		ifTrue: [result]
		ifFalse: [result asScaledDecimal: scale]

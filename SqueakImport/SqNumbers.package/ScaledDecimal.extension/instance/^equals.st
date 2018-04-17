*SqNumbers-comparing
= comparand 
	"Implementation of Number 'comparing' method."
	comparand isNumber ifFalse: [^ false].
	(comparand isKindOf: ScaledDecimal) ifTrue: [^ fraction = comparand asFraction].
	^ comparand adaptToScaledDecimal: self andCompare: #=

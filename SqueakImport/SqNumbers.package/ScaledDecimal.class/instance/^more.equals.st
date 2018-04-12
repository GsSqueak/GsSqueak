comparing
>= operand 
	"Implementation of Number 'comparing' method."
	(operand isKindOf: ScaledDecimal) ifTrue: [^ fraction >= operand asFraction].
	^ operand adaptToScaledDecimal: self andCompare: #>=
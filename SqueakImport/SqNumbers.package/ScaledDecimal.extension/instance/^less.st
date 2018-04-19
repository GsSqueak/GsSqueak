*SqNumbers-comparing
< operand 
	"Implementation of Number 'comparing' method."
	(operand isKindOf: ScaledDecimal) ifTrue: [^ mantissa < operand asFraction].
	^ operand adaptToScaledDecimal: self andCompare: #<

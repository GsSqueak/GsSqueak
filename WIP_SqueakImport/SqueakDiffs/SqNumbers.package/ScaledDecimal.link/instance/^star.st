arithmetic
* operand 
	"Implementation of Number 'arithmetic' method."
	(operand isKindOf: ScaledDecimal) ifTrue: [^ ScaledDecimal newFromNumber: mantissa * operand asFraction scale: (scale max: operand scale)].
	^ operand adaptToScaledDecimal: self andSend: #*

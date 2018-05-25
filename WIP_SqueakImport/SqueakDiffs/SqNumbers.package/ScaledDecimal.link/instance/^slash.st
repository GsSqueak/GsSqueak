*SqNumbers-arithmetic
/ operand 
	"Implementation of Number 'arithmetic' method."
	#ScalDec.
	"Protocol: ANSI <number>."
	operand = 0 ifTrue: [^ (ZeroDivide dividend: self) signal].
	(operand isKindOf: ScaledDecimal) ifTrue: [^ ScaledDecimal newFromNumber: mantissa / operand asFraction scale: (scale max: operand scale)].
	^ operand adaptToScaledDecimal: self andSend: #/

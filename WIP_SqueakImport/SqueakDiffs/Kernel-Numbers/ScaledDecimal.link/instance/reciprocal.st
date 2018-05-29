arithmetic
reciprocal
	"Reimplementation of Number 'arithmetic' method."
	self = 0 ifTrue: [^ (ZeroDivide dividend: 1) signal].
	^ ScaledDecimal newFromNumber: mantissa reciprocal scale: scale

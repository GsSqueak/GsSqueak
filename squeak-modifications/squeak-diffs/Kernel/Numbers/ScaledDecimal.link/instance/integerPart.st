truncation and round off
integerPart
	"Answer the integer part of the receiver."
	^ ScaledDecimal newFromNumber: mantissa integerPart scale: scale

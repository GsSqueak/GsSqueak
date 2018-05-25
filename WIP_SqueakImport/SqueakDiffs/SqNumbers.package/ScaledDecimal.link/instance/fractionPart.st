*SqNumbers-truncation and round off
fractionPart
	"Answer the fractional part of the receiver."
	^ ScaledDecimal newFromNumber: mantissa fractionPart scale: scale

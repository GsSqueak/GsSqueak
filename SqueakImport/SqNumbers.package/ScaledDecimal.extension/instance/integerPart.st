*SqNumbers-truncation and round off
integerPart
	"Answer the integer part of the receiver."
	^ ScaledDecimal newFromNumber: fraction integerPart scale: scale

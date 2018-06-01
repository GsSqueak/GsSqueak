converting
asScaledDecimal: scale 
	"Answer a scaled decimal number, with a fractional precision of scale, 
	approximating the receiver."
	#Numeric.
	"add 200/01/19 For number protocol."
	^ ScaledDecimal newFromNumber: self scale: scale
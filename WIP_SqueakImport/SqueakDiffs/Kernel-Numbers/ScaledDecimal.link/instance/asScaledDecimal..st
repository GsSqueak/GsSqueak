converting
asScaledDecimal: scaleIn 
	"Reimplementation - Number 'converting' method."
	^ ScaledDecimal newFromNumber: mantissa scale: scaleIn

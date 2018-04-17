*SqNumbers-converting
asScaledDecimal: scaleIn 
	"Reimplementation - Number 'converting' method."
	^ ScaledDecimal newFromNumber: fraction scale: scaleIn

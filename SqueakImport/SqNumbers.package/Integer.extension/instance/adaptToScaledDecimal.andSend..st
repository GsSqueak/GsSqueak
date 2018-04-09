*SqNumbers-converting
adaptToScaledDecimal: receiverScaledDecimal andSend: arithmeticOpSelector 
	"Convert me to a ScaledDecimal and do the arithmetic. 
	receiverScaledDecimal arithmeticOpSelector self."
	#Numeric.
	"add 200/01/19 For ScaledDecimal support."
	^ receiverScaledDecimal perform: arithmeticOpSelector with: (self asScaledDecimal: 0)
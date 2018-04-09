*SqNumbers-converting
adaptToScaledDecimal: receiverScaledDecimal andSend: arithmeticOpSelector 
	"Convert self to a ScaledDecimal and do the arithmetic. 
	receiverScaledDecimal arithmeticOpSelector self."
	
	^ receiverScaledDecimal perform: arithmeticOpSelector with: (self asScaledDecimal: receiverScaledDecimal scale)

*SqNumbers-converting
adaptToScaledDecimal: receiverScaledDecimal andSend: arithmeticOpSelector 
	"Convert receiverScaledDecimal to a Float and do the arithmetic. 
	receiverScaledDecimal arithmeticOpSelector self."
	#Numeric.
	"add 200/01/19 For ScaledDecimal support."
	^ receiverScaledDecimal asFloat perform: arithmeticOpSelector with: self

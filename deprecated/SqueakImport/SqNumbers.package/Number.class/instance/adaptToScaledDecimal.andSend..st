converting
adaptToScaledDecimal: receiverScaledDecimal andSend: arithmeticOpSelector 
	"Do any required conversion and then the arithmetic. 
	receiverScaledDecimal arithmeticOpSelector self."
	#Numeric.
	"add 200/01/19 For ScaledDecimal support."
	^ self subclassResponsibility
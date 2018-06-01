initialization
listDirection: aListDirection quadList: quadList
	"Initialize the receiver to run horizontally or vertically, obtaining its elements from the list of tuples of the form:
		(<receiver> <selector> <label> <balloonHelp>)"

	^self listDirection: aListDirection quadList: quadList buttonClass: IconicButton
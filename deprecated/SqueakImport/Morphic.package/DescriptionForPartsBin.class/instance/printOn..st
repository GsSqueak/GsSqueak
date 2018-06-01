printing
printOn: aStream
	aStream nextPutAll: 'a DescriptionForPartsBin, with categoryList=', categoryList asString, ' docmentation=', documentation asString,  ' globalReceiverSymbol=', globalReceiverSymbol asString, ' nativitySelector=', nativitySelector asString 
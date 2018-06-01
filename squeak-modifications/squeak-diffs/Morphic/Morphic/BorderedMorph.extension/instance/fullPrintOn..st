*Morphic-MorphicExtras-printing
fullPrintOn: aStream
	aStream nextPutAll: '('.
	super fullPrintOn: aStream.
	aStream nextPutAll: ') setBorderWidth: '; print: borderWidth;
		nextPutAll: ' borderColor: ' , (self colorString: borderColor)
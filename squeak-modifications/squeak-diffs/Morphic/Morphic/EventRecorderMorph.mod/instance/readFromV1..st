fileIn/Out
readFromV1: aStream
	^Array streamContents:[:tStream |
		[aStream atEnd] whileFalse:[
			tStream nextPut: (MorphicEvent readFromString: aStream nextLine)]]
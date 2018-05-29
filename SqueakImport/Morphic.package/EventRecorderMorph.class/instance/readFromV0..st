fileIn/Out
readFromV0: aStream
	^Array streamContents:[:tStream | | evt line t lineStream |
		[aStream atEnd] whileFalse:
			[line := aStream nextLine.
			line isEmpty "Some MW tapes have an empty record at the end"
				ifFalse: [lineStream := ReadStream on: line.
						t := Integer readFrom: lineStream.
						[lineStream peek isLetter] whileFalse: [lineStream next].
						evt := MorphicEvent readFromObsolete: lineStream.
						tStream nextPut: t -> evt]]].
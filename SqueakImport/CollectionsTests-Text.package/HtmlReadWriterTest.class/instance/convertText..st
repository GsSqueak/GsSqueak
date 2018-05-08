running
convertText: aText

	text := aText.
	html := String streamContents: [:writeStream |
		(readWriter on: writeStream) nextPutText: text].
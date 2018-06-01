reading
readChars
	| strikeWidth ascent descent minAscii maxAscii maxWidth chars charsNum height form encoding bbx array width pointSize stream |
	form := encoding := bbx := nil.
	self readAttributes.
	height := Integer readFromString: ((properties at: #FONTBOUNDINGBOX) at: 2).
	ascent := Integer readFromString: (properties at: #'FONT_ASCENT') first.
	descent := Integer readFromString: (properties at: #'FONT_DESCENT') first.
	pointSize := (Integer readFromString: (properties at: #'POINT_SIZE') first) // 10.
	
	maxWidth := 0.
	minAscii := 9999.
	strikeWidth := 0.
	maxAscii := 0.

	charsNum := Integer readFromString: (properties at: #CHARS) first.
	chars := Set new: charsNum.

	1 to: charsNum do: [:i |
		array := self readOneCharacter.
		stream := ReadStream on: array.
		form := stream next.
		encoding := stream next.
		bbx := stream next.
		form ifNotNil: [
			width := bbx at: 1.
			maxWidth := maxWidth max: width.
			minAscii := minAscii min: encoding.
			maxAscii := maxAscii max: encoding.
			strikeWidth := strikeWidth + width.
			chars add: array.
		].
	].

	^chars sorted: [:x :y | (x at: 2) <= (y at: 2)]
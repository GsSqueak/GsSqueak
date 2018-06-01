multibyte character methods
hasGlyphForCode: aCharacterCode

	((aCharacterCode between: self minAscii and: self maxAscii) not) ifTrue: [
		^ false.
	].
	(xTable at: aCharacterCode + 1) < 0 ifTrue: [
		^ false.
	].
	^ true.

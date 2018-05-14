expression types
scanLitWord
	"Accumulate keywords and asSymbol the result."

	token := (String streamContents: [ :stream |
		stream nextPutAll: token.
		[ (self typeTableAt: hereChar) == #xLetter ] whileTrue: [
			self xLetter.
			stream nextPutAll: token ] ]) asSymbol
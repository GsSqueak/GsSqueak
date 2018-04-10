scanning
basicScanByteCharactersFrom: startIndex to: stopIndex in: sourceString rightX: rightX 
	"this is a scanning method for
	single byte characters in a ByteString
	a font that does not do character-pair kerning"
	| _gsSqueakTemp_ascii _gsSqueakTemp_nextDestX _gsSqueakTemp_char |
	lastIndex := startIndex.
	[lastIndex <= stopIndex]
		whileTrue: ["get the character value"
			_gsSqueakTemp_char := sourceString at: lastIndex.
			_gsSqueakTemp_ascii := _gsSqueakTemp_char asciiValue + 1.
			"if there is an entry in 'stops' for this value, return it"
			(stopConditions at: _gsSqueakTemp_ascii)
				ifNotNil: [^ stopConditions at: _gsSqueakTemp_ascii].
			"bump nextDestX by the width of the current character"
			_gsSqueakTemp_nextDestX := destX
						+ (font widthOf: _gsSqueakTemp_char).
			"if the next x is past the right edge, return crossedX"
			_gsSqueakTemp_nextDestX > rightX
				ifTrue: [^ #crossedX].
			"update destX and incorporate thr kernDelta"
			destX := _gsSqueakTemp_nextDestX + kern.
			lastIndex := lastIndex + 1].
	^ self handleEndOfRunAt: stopIndex
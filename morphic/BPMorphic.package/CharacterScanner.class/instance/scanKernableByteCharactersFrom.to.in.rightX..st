scanning
scanKernableByteCharactersFrom: startIndex to: stopIndex in: sourceString rightX: rightX 
	"this is a scanning method for
	single byte characters in a ByteString
	a font that does do character-pair kerning via
	widthAndKernedWidthOfLeft:right:into: "
	| _gsSqueakTemp_ascii _gsSqueakTemp_nextDestX _gsSqueakTemp_char _gsSqueakTemp_floatDestX _gsSqueakTemp_widthAndKernedWidth _gsSqueakTemp_nextCharOrNil _gsSqueakTemp_atEndOfRun |
	lastIndex := startIndex.
	_gsSqueakTemp_floatDestX := destX.
	_gsSqueakTemp_widthAndKernedWidth := Array new: 2.
	_gsSqueakTemp_atEndOfRun := false.
	[lastIndex <= stopIndex]
		whileTrue: ["get the character value"
			_gsSqueakTemp_char := sourceString at: lastIndex.
			_gsSqueakTemp_ascii := _gsSqueakTemp_char asciiValue + 1.
			"if there is an entry in 'stops' for this value, return it"
			(stopConditions at: _gsSqueakTemp_ascii)
				ifNotNil: [^ stopConditions at: _gsSqueakTemp_ascii].
			"get the next character..."
			_gsSqueakTemp_nextCharOrNil := lastIndex + 1 <= stopIndex
						ifTrue: [sourceString at: lastIndex + 1]
						ifFalse: ["if we're at or past the stopIndex, see if there is
							anything in the full string"
							_gsSqueakTemp_atEndOfRun := true.
							lastIndex + 1 <= sourceString size
								ifTrue: [sourceString at: lastIndex + 1]].
			"get the font's kerning info for the pair of current character
			and next character"
			"for almost all fonts in common use this is a waste of time since
			they don't support pair kerning and both values are
			#widthOf: char"
			font
				widthAndKernedWidthOfLeft: _gsSqueakTemp_char
				right: _gsSqueakTemp_nextCharOrNil
				into: _gsSqueakTemp_widthAndKernedWidth.
			"bump nextDestX by the width of the current character"
			_gsSqueakTemp_nextDestX := _gsSqueakTemp_floatDestX
						+ (_gsSqueakTemp_widthAndKernedWidth at: 1).
			"if the next x is past the right edge, return crossedX"
			_gsSqueakTemp_nextDestX > rightX
				ifTrue: [^ #crossedX].
			"bump floatDestX by the *kerned* width of the current
			character, which is where the *next* char will go"
			_gsSqueakTemp_floatDestX := _gsSqueakTemp_floatDestX + kern
						+ (_gsSqueakTemp_widthAndKernedWidth at: 2).
			"if we are at the end of this run we keep track of the
			character-kern-delta for possible later use and then rather
			insanely remove that character-kern-delta from floatDestX,
			making it equivalent to (old floatDestX) + kernDelta +
			width-of-character - no idea why"
			_gsSqueakTemp_atEndOfRun
				ifTrue: [pendingKernX := (_gsSqueakTemp_widthAndKernedWidth at: 2)
								- (_gsSqueakTemp_widthAndKernedWidth at: 1).
					_gsSqueakTemp_floatDestX := _gsSqueakTemp_floatDestX - pendingKernX].
			"save the next x for next time around the loop"
			destX := _gsSqueakTemp_floatDestX.
			lastIndex := lastIndex + 1].
	^ self handleEndOfRunAt: stopIndex
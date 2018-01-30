private
primDisplayString: aString from: startIndex to: stopIndex map: glyphMap xTable: xTable kern: kernDelta 
	| ascii |
	self halt. "primitiveDisplayString"
	startIndex
		to: stopIndex
		do: [:charIndex | 
			ascii := (aString at: charIndex) asciiValue.
			glyphMap
				ifNotNil: [ascii := glyphMap at: ascii + 1].
			sourceX := xTable at: ascii + 1.
			width := (xTable at: ascii + 2)
						- sourceX.
			self copyBits.
			destX := destX + width + kernDelta]
displaying
displayMultiString: aString on: aBitBlt from: startIndex to: stopIndex at: aPoint kern: kernDelta baselineY: baselineY
"display a multi-byte character string"
	| leftX rightX glyphInfo char destY form gfont destX destPt |
	destX := aPoint x.
	glyphInfo := Array new: 5.
	startIndex to: stopIndex do:[:charIndex|
		char := aString at: charIndex.
		(self hasGlyphOf: char) ifTrue: [
			"I have that character ok, so display it and move on"
			self glyphInfoOf: char into: glyphInfo.
			form := glyphInfo at: 1.
			leftX := glyphInfo at: 2.
			rightX := glyphInfo at: 3.
			destY := glyphInfo at: 4.
			gfont := glyphInfo at: 5.
			(gfont == aBitBlt lastFont) ifFalse: [gfont installOn: aBitBlt].
			destY := baselineY - destY. 
			aBitBlt displayGlyph: form at: destX @ destY left: leftX right: rightX font: self.
			destX := destX + (rightX - leftX + kernDelta).
		] ifFalse:[
			"I'm missing that character so pass the job off to my fallback font; if one wasn't previously setup a default fixedfacefont will get used and show question-mark char(s). We pass the entire job to the font since we must not expect it to be a StrikeFont"
			destPt := self fallbackFont displayString: aString on: aBitBlt from: charIndex to: charIndex at: destX @ aPoint y kern: kernDelta from: self baselineY: baselineY.
			destPt x = destX ifTrue:[
				"In some situations BitBlt doesn't return the advance width from the primitive.
				Work around the situation"
				destX := destX + (self widthOfString: aString from: charIndex to: charIndex) + kernDelta.
			] ifFalse:[destX := destPt x].
		].
	].
	^destX @ aPoint y

private
glyphInfoOf: aCharacter into: glyphInfoArray
"return glyph info for the character; it can get complicated."
	| index f code |
	"the leadingChar gives us an encoding. if that is outside the range of fonts in my fontArray, just return the default glyphInfo for a question-mark"
	index := aCharacter leadingChar + 1.
	fontArray size < index ifTrue: [^ self questionGlyphInfoInto: glyphInfoArray].
	(f := fontArray at: index) ifNil: [^ self questionGlyphInfoInto: glyphInfoArray].

	"if the actual character is not in the range supported by the chosen font, return that default question-mark info "
	code := aCharacter charCode.
	((code between: f minAscii and: f maxAscii) not) ifTrue: [
		^ self questionGlyphInfoInto: glyphInfoArray.
	].
	"finally, we have an ok font and character to return glyph info about - note that the font may have other ideas. "
	f glyphInfoOf: aCharacter into: glyphInfoArray.
	glyphInfoArray at: 5 put: self.
	^ glyphInfoArray.

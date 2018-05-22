accessing
glyphInfoOf: aCharacter into: glyphInfoArray 
	"return the glyph info for aCharacter; if I don't have such a character, try my fallback font, if I have one of those.
	Unlike some other implementors, the returned info for a missing character is not given for the question-mark but rather the zero-ascii char."
	| code |
	(self hasGlyphOf: aCharacter)
		ifTrue: [code := self codeForCharacter: aCharacter]
		ifFalse: [fallbackFont
				ifNotNil: [^ fallbackFont glyphInfoOf: aCharacter into: glyphInfoArray].
			code := 0].
	glyphInfoArray at: 1 put: glyphs;
		at: 2 put: (xTable at: code + 1);
		at: 3 put: (xTable at: code + 2);
		at: 4 put: (self ascentOf: aCharacter);
		 at: 5 put: self.
	^ glyphInfoArray
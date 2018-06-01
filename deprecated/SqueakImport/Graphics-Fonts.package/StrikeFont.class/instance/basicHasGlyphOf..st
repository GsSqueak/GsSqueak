multibyte character methods
basicHasGlyphOf: aCharacter

	^ self hasGlyphForCode: (self codeForCharacter: aCharacter)

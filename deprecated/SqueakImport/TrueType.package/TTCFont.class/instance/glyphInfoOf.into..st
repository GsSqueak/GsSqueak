private
glyphInfoOf: aCharacter into: glyphInfoArray
	"return the glyph info for aCharacter; if I don't have such a character, try my fallback font"

	| form |
	(self hasGlyphOf: aCharacter) ifFalse: [
		^ self fallbackFont glyphInfoOf: aCharacter into: glyphInfoArray.
	].
	form := self formOf: aCharacter.
	glyphInfoArray at: 1 put: form;
		at: 2 put: 0;
		at: 3 put: form width;
		at: 4 put: ascent "(self ascentOf: aCharacter)";
		at: 5 put: self.
	^ glyphInfoArray.

private
hasGlyphOf: aCharacter
	"Answer whether this font includes a glyph for the given character (or a fallback)"
	self flag: #topa. "formOf: never actually returns nil for ttcfonts..."
	^ aCharacter charCode <= self maxAscii
		and:[(self formOf: aCharacter) notNil]
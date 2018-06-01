glyphs
glyphAt: charOrCode
	"Answer the glyph with the given code point"
	| codePoint glyph |
	codePoint := charOrCode asCharacter charCode.
	self withFileDo:[:fontFile| | glyphIndex |
		glyphIndex := self readCmapTableAt: codePoint fromFile: fontFile.
		glyph := self readGlyphAt: glyphIndex fromFile: fontFile.
		self updateGlyphMetrics: glyph fromFile: fontFile.
	].
	^glyph
glyphs
readGlyphAt: glyphIndex
	| glyph |
	self withFileDo:[:fontFile|
		glyph := self readGlyphAt: glyphIndex fromFile: fontFile.
		self updateGlyphMetrics: glyph fromFile: fontFile.
	].
	^glyph
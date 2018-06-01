glyphs
readGlyphAt: glyphIndex 
	| _gsSqueakTemp_glyph |
	self
		withFileDo: [:fontFile | 
			_gsSqueakTemp_glyph := self readGlyphAt: glyphIndex fromFile: fontFile.
			self updateGlyphMetrics: _gsSqueakTemp_glyph fromFile: fontFile].
	^ _gsSqueakTemp_glyph
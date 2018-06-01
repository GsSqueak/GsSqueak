glyphs
glyphAt: charOrCode 
	"Answer the glyph with the given code point"
	| _gsSqueakTemp_codePoint _gsSqueakTemp_glyph |
	_gsSqueakTemp_codePoint := charOrCode asCharacter charCode.
	self
		withFileDo: [:fontFile | 
			| glyphIndex |
			glyphIndex := self readCmapTableAt: _gsSqueakTemp_codePoint fromFile: fontFile.
			_gsSqueakTemp_glyph := self readGlyphAt: glyphIndex fromFile: fontFile.
			self updateGlyphMetrics: _gsSqueakTemp_glyph fromFile: fontFile].
	^ _gsSqueakTemp_glyph
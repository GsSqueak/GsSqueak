glyphs
fallbackGlyph
	"Answer the fallback glyph, the first in the loca table"
	| _gsSqueakTemp_glyph |
	self
		withFileDo: [:fontFile | 
			_gsSqueakTemp_glyph := self readGlyphAt: 0 fromFile: fontFile.
			self updateGlyphMetrics: _gsSqueakTemp_glyph fromFile: fontFile].
	^ _gsSqueakTemp_glyph
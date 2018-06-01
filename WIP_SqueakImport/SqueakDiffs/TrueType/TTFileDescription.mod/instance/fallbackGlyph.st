glyphs
fallbackGlyph
	"Answer the fallback glyph, the first in the loca table "
	| glyph |
	self withFileDo:[:fontFile| 
		glyph := self readGlyphAt: 0 fromFile: fontFile.
		self updateGlyphMetrics: glyph fromFile: fontFile.
	].
	^glyph
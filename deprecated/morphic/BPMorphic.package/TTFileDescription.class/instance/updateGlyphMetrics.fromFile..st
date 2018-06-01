glyphs
updateGlyphMetrics: glyph fromFile: fontFile 
	"Update the horizontal metrics for the given glyph"
	| _gsSqueakTemp_glyphIndex |
	_gsSqueakTemp_glyphIndex := glyph glyphIndex.
	_gsSqueakTemp_glyphIndex <= numHMetrics
		ifTrue: [fontFile position: hmtxTableOffset + (_gsSqueakTemp_glyphIndex * 4).
			glyph
				advanceWidth: (fontFile nextNumber: 2).
			glyph
				leftSideBearing: (self
						short: (fontFile nextNumber: 2))]
		ifFalse: [fontFile position: hmtxTableOffset + (numHMetrics - 1 * 4).
			glyph
				advanceWidth: (fontFile nextNumber: 2).
			fontFile position: hmtxTableOffset + (numHMetrics * 4) + (_gsSqueakTemp_glyphIndex - numHMetrics * 2).
			glyph
				leftSideBearing: (self
						short: (fontFile nextNumber: 2))].
	glyph updateRightSideBearing
glyphs
updateGlyphMetrics: glyph fromFile: fontFile
	"Update the horizontal metrics for the given glyph"
	| glyphIndex |
	glyphIndex := glyph glyphIndex.
	glyphIndex <= numHMetrics ifTrue:[
		fontFile position: hmtxTableOffset + (glyphIndex*4).
		glyph advanceWidth: (fontFile nextNumber: 2).
		glyph leftSideBearing: (self short: (fontFile nextNumber: 2)).
	] ifFalse:[
		fontFile position: hmtxTableOffset + ((numHMetrics-1) *4).
		glyph advanceWidth: (fontFile nextNumber: 2).
		fontFile position: hmtxTableOffset + (numHMetrics * 4) + ((glyphIndex-numHMetrics)*2).
		glyph leftSideBearing: (self short: (fontFile nextNumber: 2)).
	].
	glyph updateRightSideBearing.
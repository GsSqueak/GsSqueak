emphasis
makeUnderlinedGlyphs
	"First check if we can use some OS support for this"
	(self class listFontNames includes: name) ifFalse:[^super makeUnderlinedGlyphs].
	"Now attempt a direct creation through the appropriate primitives"
	(self fontName: name size: pointSize emphasis: (emphasis bitOr: 4) rangesArray: ranges)
		ifNil:[^super makeUnderlinedGlyphs]. "nil means we failed"
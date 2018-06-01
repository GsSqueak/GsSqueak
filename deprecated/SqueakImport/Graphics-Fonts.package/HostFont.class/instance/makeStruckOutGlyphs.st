emphasis
makeStruckOutGlyphs
	"First check if we can use some OS support for this"
	(self class listFontNames includes: name) ifFalse:[^super makeStruckOutGlyphs].
	"Now attempt a direct creation through the appropriate primitives"
	(self fontName: name size: pointSize emphasis: (emphasis bitOr: 8) rangesArray: ranges)
		ifNil:[^super makeStruckOutGlyphs]. "nil means we failed"
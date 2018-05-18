emphasis
makeItalicGlyphs
	"First check if we can use some OS support for this"
	(self class listFontNames includes: name) ifFalse:[^super makeItalicGlyphs].
	"Now attempt a direct creation through the appropriate primitives"
	(self fontName: name size: pointSize emphasis: (emphasis bitOr: 2) rangesArray: ranges)
		ifNil:[^super makeItalicGlyphs]. "nil means we failed"
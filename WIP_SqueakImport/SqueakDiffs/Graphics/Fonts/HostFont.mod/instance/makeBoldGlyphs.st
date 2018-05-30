emphasis
makeBoldGlyphs
	"First check if we can use some OS support for this"
	(self class listFontNames includes: name) ifFalse:[^super makeBoldGlyphs].
	"Now attempt a direct creation through the appropriate primitives"
	(self fontName: name size: pointSize emphasis: (emphasis bitOr: 1) rangesArray: ranges) 
		ifNil:[^super makeBoldGlyphs]. "nil means we failed"
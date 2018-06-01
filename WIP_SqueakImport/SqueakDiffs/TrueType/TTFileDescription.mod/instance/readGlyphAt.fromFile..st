glyphs
readGlyphAt: glyphIndex fromFile: fontFile
	"Answer the glyph with the given glyph index"
	| glyphOffset nextOffset glyphLength glyph nContours left top right bottom |
	indexToLocFormat = 0 ifTrue:["Format0: offset/2 is stored"
		fontFile position: indexToLocOffset+(glyphIndex * 2).
		glyphOffset := (fontFile nextNumber: 2) * 2.
		nextOffset := (fontFile nextNumber: 2) * 2.
	] ifFalse:["Format1: store actual offset"
		fontFile position: indexToLocOffset+(glyphIndex * 4).
		glyphOffset := fontFile nextNumber: 4.
		nextOffset := fontFile nextNumber: 4.
	].
	glyphLength := nextOffset - glyphOffset.
	glyphLength = 0 ifTrue:[^TTGlyph new glyphIndex: glyphIndex].

	fontFile position: glyphTableOffset+glyphOffset.
	nContours := self short: (fontFile nextNumber: 2).
	left := self short: (fontFile nextNumber: 2).
	top := self short: (fontFile nextNumber: 2).
	right := self short: (fontFile nextNumber: 2).
	bottom := self short: (fontFile nextNumber: 2).
	nContours >= 0 ifTrue:[
		glyph := TTGlyph new glyphIndex: glyphIndex.
		self processSimpleGlyph: glyph contours: nContours from: fontFile.
	] ifFalse:[
		glyph := TTCompositeGlyph new glyphIndex: glyphIndex.
		self processCompositeGlyph: glyph contours: nContours from: fontFile.
	].
	glyph buildAllContours.
	glyph bounds: (left@top corner: right@bottom).
	^glyph

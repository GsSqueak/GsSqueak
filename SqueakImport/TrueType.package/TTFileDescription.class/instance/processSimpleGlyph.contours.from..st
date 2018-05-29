glyphs
processSimpleGlyph: glyph contours: nContours from: fontFile
	"Construct a simple glyph frm the font file"
	| endPts  nPts iLength flags |
	endPts := Array new: nContours.
	1 to: nContours do:[:i| endPts at: i put: (fontFile nextNumber: 2)].
	glyph initializeContours: nContours with: endPts.
	nContours = 0 ifTrue:[^self].
	nPts := endPts last + 1.
	iLength := fontFile nextNumber: 2. "instruction length"
	fontFile skip: iLength.
	flags := self getGlyphFlagsFrom: fontFile size: nPts.
	self readGlyphXCoords: fontFile glyph: glyph nContours: nContours flags: flags endPoints: endPts.
	self readGlyphYCoords: fontFile glyph: glyph nContours: nContours flags: flags endPoints: endPts.
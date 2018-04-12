glyphs
processSimpleGlyph: glyph contours: nContours from: fontFile 
	"Construct a simple glyph frm the font file"
	| _gsSqueakTemp_endPts _gsSqueakTemp_nPts _gsSqueakTemp_iLength _gsSqueakTemp_flags |
	_gsSqueakTemp_endPts := Array new: nContours.
	1
		to: nContours
		do: [:i | _gsSqueakTemp_endPts
				at: i
				put: (fontFile nextNumber: 2)].
	glyph initializeContours: nContours with: _gsSqueakTemp_endPts.
	nContours = 0
		ifTrue: [^ self].
	_gsSqueakTemp_nPts := _gsSqueakTemp_endPts last + 1.
	_gsSqueakTemp_iLength := fontFile nextNumber: 2.
	"instruction length"
	fontFile skip: _gsSqueakTemp_iLength.
	_gsSqueakTemp_flags := self getGlyphFlagsFrom: fontFile size: _gsSqueakTemp_nPts.
	self
		readGlyphXCoords: fontFile
		glyph: glyph
		nContours: nContours
		flags: _gsSqueakTemp_flags
		endPoints: _gsSqueakTemp_endPts.
	self
		readGlyphYCoords: fontFile
		glyph: glyph
		nContours: nContours
		flags: _gsSqueakTemp_flags
		endPoints: _gsSqueakTemp_endPts
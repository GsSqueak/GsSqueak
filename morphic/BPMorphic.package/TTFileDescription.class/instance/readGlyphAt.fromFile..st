glyphs
readGlyphAt: glyphIndex fromFile: fontFile 
	"Answer the glyph with the given glyph index"
	| _gsSqueakTemp_glyphOffset _gsSqueakTemp_nextOffset _gsSqueakTemp_glyphLength _gsSqueakTemp_glyph _gsSqueakTemp_nContours _gsSqueakTemp_left _gsSqueakTemp_top _gsSqueakTemp_right _gsSqueakTemp_bottom |
	indexToLocFormat = 0
		ifTrue: ["Format0: offset/2 is stored"
			fontFile position: indexToLocOffset + (glyphIndex * 2).
			_gsSqueakTemp_glyphOffset := (fontFile nextNumber: 2)
						* 2.
			_gsSqueakTemp_nextOffset := (fontFile nextNumber: 2)
						* 2]
		ifFalse: ["Format1: store actual offset"
			fontFile position: indexToLocOffset + (glyphIndex * 4).
			_gsSqueakTemp_glyphOffset := fontFile nextNumber: 4.
			_gsSqueakTemp_nextOffset := fontFile nextNumber: 4].
	_gsSqueakTemp_glyphLength := _gsSqueakTemp_nextOffset - _gsSqueakTemp_glyphOffset.
	_gsSqueakTemp_glyphLength = 0
		ifTrue: [^ TTGlyph new glyphIndex: glyphIndex].
	fontFile position: glyphTableOffset + _gsSqueakTemp_glyphOffset.
	_gsSqueakTemp_nContours := self
				short: (fontFile nextNumber: 2).
	_gsSqueakTemp_left := self
				short: (fontFile nextNumber: 2).
	_gsSqueakTemp_top := self
				short: (fontFile nextNumber: 2).
	_gsSqueakTemp_right := self
				short: (fontFile nextNumber: 2).
	_gsSqueakTemp_bottom := self
				short: (fontFile nextNumber: 2).
	_gsSqueakTemp_nContours >= 0
		ifTrue: [_gsSqueakTemp_glyph := TTGlyph new glyphIndex: glyphIndex.
			self
				processSimpleGlyph: _gsSqueakTemp_glyph
				contours: _gsSqueakTemp_nContours
				from: fontFile]
		ifFalse: [_gsSqueakTemp_glyph := TTCompositeGlyph new glyphIndex: glyphIndex.
			self
				processCompositeGlyph: _gsSqueakTemp_glyph
				contours: _gsSqueakTemp_nContours
				from: fontFile].
	_gsSqueakTemp_glyph buildAllContours.
	_gsSqueakTemp_glyph
		bounds: (_gsSqueakTemp_left @ _gsSqueakTemp_top corner: _gsSqueakTemp_right @ _gsSqueakTemp_bottom).
	^ _gsSqueakTemp_glyph
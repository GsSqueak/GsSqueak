glyphs
processCompositeGlyph: glyph contours: nContours from: fontFile 
	"Read a composite glyph from the font data. The glyph passed into
	this method contains some state variables that must be copied into
	the resulting composite glyph."
	| _gsSqueakTemp_flags _gsSqueakTemp_glyphIndex _gsSqueakTemp_hasInstr _gsSqueakTemp_ofsX _gsSqueakTemp_ofsY _gsSqueakTemp_iLen _gsSqueakTemp_a11 _gsSqueakTemp_a12 _gsSqueakTemp_a21 _gsSqueakTemp_a22 _gsSqueakTemp_m _gsSqueakTemp_glyphCache |
	_gsSqueakTemp_glyphCache := Dictionary new.
	_gsSqueakTemp_a11 := _gsSqueakTemp_a22 := 16384.
	"1.0 in F2Dot14"
	_gsSqueakTemp_a21 := _gsSqueakTemp_a12 := 0.
	"0.0 in F2Dot14"
	"Copy state"
	_gsSqueakTemp_hasInstr := false.
	[_gsSqueakTemp_flags := fontFile nextNumber: 2.
	_gsSqueakTemp_glyphIndex := fontFile nextNumber: 2.
	(_gsSqueakTemp_flags bitAnd: 1)
			= 1
		ifTrue: [_gsSqueakTemp_ofsX := self
						short: (fontFile nextNumber: 2).
			_gsSqueakTemp_ofsY := self
						short: (fontFile nextNumber: 2)]
		ifFalse: [(_gsSqueakTemp_ofsX := fontFile next) > 127
				ifTrue: [_gsSqueakTemp_ofsX := _gsSqueakTemp_ofsX - 256].
			(_gsSqueakTemp_ofsY := fontFile next) > 127
				ifTrue: [_gsSqueakTemp_ofsY := _gsSqueakTemp_ofsY - 256]].
	(_gsSqueakTemp_flags bitAnd: 2)
			= 2
		ifFalse: [| i1 i2 p1 p2 |
			(_gsSqueakTemp_flags bitAnd: 1)
					= 1
				ifTrue: [i1 := _gsSqueakTemp_ofsX + 65536 \\ 65536.
					i2 := _gsSqueakTemp_ofsY + 65536 \\ 65536]
				ifFalse: [i1 := _gsSqueakTemp_ofsX + 256 \\ 256.
					i2 := _gsSqueakTemp_ofsY + 256 \\ 256].
			p1 := glyph referenceVertexAt: i1 + 1.
			p2 := (self
						childGlyphAt: _gsSqueakTemp_glyphIndex
						in: _gsSqueakTemp_glyphCache
						fromFile: fontFile)
						referenceVertexAt: i2 + 1.
			_gsSqueakTemp_ofsX := p1 x - p2 x.
			_gsSqueakTemp_ofsY := p1 y - p2 y].
	(_gsSqueakTemp_flags bitAnd: 8)
			= 8
		ifTrue: [_gsSqueakTemp_a11 := _gsSqueakTemp_a22 := self
								short: (fontFile nextNumber: 2)].
	(_gsSqueakTemp_flags bitAnd: 64)
			= 64
		ifTrue: [_gsSqueakTemp_a11 := self
						short: (fontFile nextNumber: 2).
			_gsSqueakTemp_a22 := self
						short: (fontFile nextNumber: 2)].
	(_gsSqueakTemp_flags bitAnd: 128)
			= 128
		ifTrue: ["2x2 transformation"
			_gsSqueakTemp_a11 := self
						short: (fontFile nextNumber: 2).
			_gsSqueakTemp_a21 := self
						short: (fontFile nextNumber: 2).
			_gsSqueakTemp_a12 := self
						short: (fontFile nextNumber: 2).
			_gsSqueakTemp_a22 := self
						short: (fontFile nextNumber: 2)].
	_gsSqueakTemp_m := MatrixTransform2x3 new.
	"Convert entries from F2Dot14 to float"
	_gsSqueakTemp_m a11: _gsSqueakTemp_a11 asFloat / 16384.
	_gsSqueakTemp_m a12: _gsSqueakTemp_a12 asFloat / 16384.
	_gsSqueakTemp_m a21: _gsSqueakTemp_a21 asFloat / 16384.
	_gsSqueakTemp_m a22: _gsSqueakTemp_a22 asFloat / 16384.
	_gsSqueakTemp_m a13: _gsSqueakTemp_ofsX.
	_gsSqueakTemp_m a23: _gsSqueakTemp_ofsY.
	glyph
		addGlyph: (self
				childGlyphAt: _gsSqueakTemp_glyphIndex
				in: _gsSqueakTemp_glyphCache
				fromFile: fontFile)
		transformation: _gsSqueakTemp_m.
	_gsSqueakTemp_hasInstr := _gsSqueakTemp_hasInstr
				or: [(_gsSqueakTemp_flags bitAnd: 256)
						= 256].
	"Continue as long as the MORE:=COMPONENTS bit is set"
	(_gsSqueakTemp_flags bitAnd: 32)
		= 32] whileTrue.
	_gsSqueakTemp_hasInstr
		ifTrue: [_gsSqueakTemp_iLen := fontFile nextNumber: 2.
			fontFile skip: _gsSqueakTemp_iLen]
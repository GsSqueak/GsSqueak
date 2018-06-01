glyphs
processCompositeGlyph: glyph contours: nContours from: fontFile
	"Read a composite glyph from the font data. The glyph passed into this method contains some state variables that must be copied into the resulting composite glyph."
	| flags glyphIndex hasInstr ofsX ofsY iLen a11 a12 a21 a22 m glyphCache |
	glyphCache := Dictionary new.
	a11 := a22 := 16r4000.	"1.0 in F2Dot14"
	a21 := a12 := 0.			"0.0 in F2Dot14"
	"Copy state"
	hasInstr := false.
	[ flags := fontFile nextNumber: 2.
	glyphIndex := fontFile nextNumber: 2.
	(flags bitAnd: 1) = 1 ifTrue:[
		ofsX := self short: (fontFile nextNumber: 2).
		ofsY := self short: (fontFile nextNumber: 2).
	] ifFalse:[
		(ofsX := fontFile next) > 127 ifTrue:[ofsX := ofsX - 256].
		(ofsY := fontFile next) > 127 ifTrue:[ofsY := ofsY - 256].
	].
	((flags bitAnd: 2) = 2) ifFalse:[
		| i1 i2 p1 p2 |
		(flags bitAnd: 1) = 1 ifTrue: [
			i1 := ofsX + 65536 \\ 65536.
			i2 := ofsY + 65536 \\ 65536]
		 ifFalse: [
			i1 := ofsX + 256 \\ 256.
			i2 := ofsY + 256 \\ 256].
		p1 := glyph referenceVertexAt: i1+1.
		p2 := (self childGlyphAt: glyphIndex in: glyphCache fromFile: fontFile) referenceVertexAt: i2+1.
		ofsX := p1 x - p2 x.
		ofsY := p1 y - p2 y.
	].
	(flags bitAnd: 8) = 8 ifTrue:[
		a11 := a22 := self short: (fontFile nextNumber: 2)].
	(flags bitAnd: 64) = 64 ifTrue:[
		a11 := self short: (fontFile nextNumber: 2).
		a22 := self short: (fontFile nextNumber: 2).
	].
	(flags bitAnd: 128) = 128 ifTrue:[
		"2x2 transformation"
		a11 := self short: (fontFile nextNumber: 2).
		a21 := self short: (fontFile nextNumber: 2).
		a12 := self short: (fontFile nextNumber: 2).
		a22 := self short: (fontFile nextNumber: 2).
	].
	m := MatrixTransform2x3 new.
	"Convert entries from F2Dot14 to float"
	m a11: (a11 asFloat / 16r4000).
	m a12: (a12 asFloat / 16r4000).
	m a21: (a21 asFloat / 16r4000).
	m a22: (a22 asFloat / 16r4000).
	m a13: ofsX.
	m a23: ofsY.
	glyph addGlyph: (self childGlyphAt: glyphIndex in: glyphCache fromFile: fontFile) transformation: m.
	hasInstr := hasInstr or:[ (flags bitAnd: 256) = 256].
	"Continue as long as the MORE:=COMPONENTS bit is set"
	(flags bitAnd: 32) = 32] whileTrue.
	hasInstr ifTrue:[
		iLen := fontFile nextNumber: 2.
		fontFile skip: iLen].
accessing
font: aTTFontDescription
	| morph |
	font := aTTFontDescription.
	morph := (TTSampleStringMorph font: font).
	morph extent: morph extent * 2.
	morph color: Color magenta.
	self addMorphCentered: morph.
	morph position: morph position x @ (self bounds bottom + 10).
	self privateFullMoveBy: self fullBounds origin negated.
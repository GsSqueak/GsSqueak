*Morphic-MorphicExtras-drawing
paragraph2: para bounds: bounds color: c

	| scanner |
	scanner := CanvasCharacterScanner new.
	scanner
		 canvas: self;
		text: para text textStyle: para textStyle;
		textColor: c.

	para displayOn: self using: scanner at: bounds topLeft.

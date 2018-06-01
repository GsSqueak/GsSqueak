*Morphic-Balloon
firstColor: aColor forMorph: aMorph hand: aHand
	colorRamp first value: aColor.
	isTranslucent := nil.
	pixelRamp := nil.
	aMorph changed.
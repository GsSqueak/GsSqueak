*Morphic-Balloon
lastColor: aColor forMorph: aMorph hand: aHand
	colorRamp last value: aColor.
	isTranslucent := nil.
	pixelRamp := nil.
	aMorph changed.
*Morphic-Balloon
colorRamp: aColorRamp forMorph: aMorph 
	colorRamp :=aColorRamp.
	isTranslucent := nil.
	pixelRamp := nil. 
	aMorph changed.
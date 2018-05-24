*Morphic-Balloon
changeSecondColorIn: aMorph event: evt
	^self changeColorSelector: #lastColor:forMorph:hand: hand: evt hand morph: aMorph originalColor: colorRamp last value
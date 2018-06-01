stop conditions
endOfRun
	"Answer true if scanning has reached the end of the paragraph. 
	Otherwise step conditions (mostly install potential new font) and
	answer 
	false."
	| _gsSqueakTemp_runLength |
	lastIndex = text size
		ifTrue: [line stop: lastIndex.
			spaceX := destX.
			line paddingWidth: rightMargin - destX.
			^ true]
		ifFalse: [_gsSqueakTemp_runLength := text runLengthFor: (lastIndex := lastIndex + 1).
			runStopIndex := lastIndex + (_gsSqueakTemp_runLength - 1).
			self setStopConditions.
			^ false]
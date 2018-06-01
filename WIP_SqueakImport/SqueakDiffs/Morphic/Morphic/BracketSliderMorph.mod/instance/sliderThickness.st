geometry
sliderThickness
	"Answer the thickness of the slider."
	
	^((self orientation == #horizontal
		ifTrue: [self height]
		ifFalse: [self width]) // 2 max: 8) // 2 * 2 + 1
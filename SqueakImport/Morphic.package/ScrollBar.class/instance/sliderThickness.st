geometry
sliderThickness
	^ self orientation == #horizontal
		ifTrue: [self height]
		ifFalse: [self width]
geometry
minWidth
	^ self orientation == #horizontal
		ifTrue: [super minWidth max: self sliderThickness * 2]
		ifFalse: [super minWidth max: self borderWidth + 1]
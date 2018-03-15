geometry
minHeight
	^ self orientation == #horizontal
		ifTrue: [super minHeight max: self borderWidth + 1]
		ifFalse: [super minHeight max: self sliderThickness * 2]
geometry
sliderExtent
	^ self orientation == #horizontal
		ifTrue: [self sliderThickness @ self innerBounds height]
		ifFalse: [self innerBounds width @ self sliderThickness]
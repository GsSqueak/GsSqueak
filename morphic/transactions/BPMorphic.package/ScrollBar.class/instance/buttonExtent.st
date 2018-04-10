geometry
buttonExtent
	^ self orientation == #horizontal
		ifTrue: [self innerBounds height asPoint]
		ifFalse: [self innerBounds width asPoint]
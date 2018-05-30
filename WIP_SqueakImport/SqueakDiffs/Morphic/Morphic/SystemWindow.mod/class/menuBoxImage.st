initializing
menuBoxImage

	^ self gradientWindow
		ifTrue: [self menuBoxImageGradient]
		ifFalse: [self menuBoxImageFlat].

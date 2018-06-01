initializing
closeBoxImage

	^ self gradientWindow
		ifTrue: [self closeBoxImageGradient]
		ifFalse: [self closeBoxImageFlat].

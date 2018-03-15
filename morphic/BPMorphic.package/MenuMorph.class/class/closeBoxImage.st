images
closeBoxImage
	^ self gradientMenu
		ifTrue: [self closeBoxImageGradient]
		ifFalse: [self closeBoxImageFlat]
initializing
expandBoxImage
	^ self gradientWindow
		ifTrue: [self expandBoxImageGradient]
		ifFalse: [self expandBoxImageFlat]
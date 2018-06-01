initializing
collapseBoxImage

	^ self gradientWindow
		ifTrue: [self collapseBoxImageGradient]
		ifFalse: [self collapseBoxImageFlat].

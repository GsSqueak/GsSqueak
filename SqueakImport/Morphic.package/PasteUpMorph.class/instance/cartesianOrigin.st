misc
cartesianOrigin
	^ self originAtCenter
		ifFalse:
			[self bottomLeft]
		ifTrue:
			[self center]
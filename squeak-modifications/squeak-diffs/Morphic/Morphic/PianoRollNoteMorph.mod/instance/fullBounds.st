layout
fullBounds

	selected
		ifTrue: [^ bounds expandBy: 1]
		ifFalse: [^ bounds]
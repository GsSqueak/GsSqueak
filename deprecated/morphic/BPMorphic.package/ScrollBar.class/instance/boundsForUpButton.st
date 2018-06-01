geometry
boundsForUpButton
	^ (self menuButton visible
		ifTrue: [self orientation == #horizontal
				ifTrue: [self menuButton bounds topRight - (1 @ 0)]
				ifFalse: [self menuButton bounds bottomLeft - (0 @ 1)]]
		ifFalse: [self innerBounds topLeft])
		extent: self buttonExtent
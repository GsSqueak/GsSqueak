geometry
boundsForUpButton

	^ (self menuButton visible
		ifFalse: [self innerBounds topLeft]
		ifTrue: [self orientation == #horizontal
			ifTrue: [self menuButton bounds topRight - (1@0)]
			ifFalse: [self menuButton bounds bottomLeft - (0@1)]])
		extent: self buttonExtent
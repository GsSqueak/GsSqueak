dragging
doDragTarget: event

	self target
		setConstrainedPosition: (self target point: (event position - self positionOffset) from: self owner)
		hangOut: true.
		
	self bounds: self target worldBoundsForHalo.
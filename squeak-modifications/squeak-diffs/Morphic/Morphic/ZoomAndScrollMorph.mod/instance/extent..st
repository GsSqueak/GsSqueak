geometry
extent: extentPoint

	super extent: extentPoint.
	self myTransformMorph bounds: self innerBounds.

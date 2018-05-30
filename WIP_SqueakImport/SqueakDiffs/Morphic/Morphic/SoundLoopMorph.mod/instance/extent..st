geometry
extent: newExtent
	super extent: (newExtent truncateTo: 128@128) + (self borderWidth*2)
geometry
extent: newExtent
	super extent: (newExtent max: (self maxTime//10*3+50 max: 355) @ 284).
	self buildView
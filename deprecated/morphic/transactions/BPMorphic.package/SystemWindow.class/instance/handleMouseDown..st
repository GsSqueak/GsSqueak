events
handleMouseDown: evt 
	self beKeyWindowIfNeeded: evt.
	^ super handleMouseDown: evt
events
handleMouseUp: event 
	super handleMouseUp: event.
	self exclusive
		ifTrue: [event hand newMouseFocus: self]
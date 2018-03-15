event handling
mouseUp: evt 
	super mouseUp: evt.
	self stopSteppingSelector: #autoScrollView:.
	editView scrollSelectionIntoView: evt.
	self setCompositionWindow
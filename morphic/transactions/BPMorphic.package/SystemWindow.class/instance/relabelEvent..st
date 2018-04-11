label
relabelEvent: evt 
	"No longer used, but may be referred to by old eventHandlers"
	^ Preferences clickOnLabelToEdit
		ifTrue: [self relabel]
		ifFalse: [self mouseDown: evt]
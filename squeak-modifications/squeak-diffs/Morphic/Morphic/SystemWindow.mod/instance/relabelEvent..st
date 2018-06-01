label
relabelEvent: evt
	"No longer used, but may be referred to by old eventHandlers"

	^ Preferences clickOnLabelToEdit
		ifFalse:	[self mouseDown: evt]
		ifTrue:	[self relabel]
keystroke helpers
handleDownStroke: evt 
	evt keyValue = 31
		ifFalse: [^ false].
	self moveSelectionDown: 1 event: evt.
	^ true
keystroke helpers
handleUpStorke: evt 
	evt keyValue = 30
		ifFalse: [^ false].
	self moveSelectionDown: -1 event: evt.
	^ true
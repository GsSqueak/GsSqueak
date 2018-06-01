keystroke helpers
handlePageDownStroke: evt 
	evt keyValue = 12
		ifFalse: [^ false].
	self moveSelectionDown: 5 event: evt.
	^ true
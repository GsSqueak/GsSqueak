keystroke helpers
handlePageUpStroke: evt

	evt keyValue = 11 ifFalse: [ ^false ].
	self moveSelectionDown: -5 event: evt.
	^true
menu commands
renameEntry
	| reply curr |
	reply := UIManager default
		request: 'New key? '
		initialAnswer: (curr := entryNames at: currentIndex).
	(reply isEmptyOrNil or: [reply = curr]) ifTrue: [^ Beeper beep].
	(baseDictionary includesKey: reply) ifTrue:
		[^ self inform: 'sorry that conflicts with
the name of another
entry in this dictionary'].
	baseDictionary at: reply put: (baseDictionary at: curr).
	baseDictionary removeKey: curr.
	self baseDictionary: baseDictionary.
	self updateThumbnail
editing
cutSelection
	selection isNil ifTrue: [^self].
	self copySelection.
	self deleteSelection
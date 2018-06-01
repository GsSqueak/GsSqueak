accessing
handle: dropStream in: pasteUp dropEvent: anEvent
	| numArgs |
	numArgs := action numArgs.
	numArgs = 1
		ifTrue: [^action value: dropStream].
	numArgs = 2
		ifTrue: [^action value: dropStream value: pasteUp].
	numArgs = 3
		ifTrue: [^action value: dropStream value: pasteUp value: anEvent].
	self error: 'Wrong number of args for dop action.'
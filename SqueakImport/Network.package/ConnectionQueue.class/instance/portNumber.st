public
portNumber
	^ portNumber isCollection
		ifTrue: [portNumber first]
		ifFalse: [portNumber]
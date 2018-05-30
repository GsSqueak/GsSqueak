public
portNumbers
	^ portNumber isCollection
		ifTrue: [portNumber]
		ifFalse: [{portNumber}]
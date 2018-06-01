events
oldMouseFocus
	
	oldMouseFocus = self
		ifTrue: [ ^nil ]
		ifFalse: [ ^oldMouseFocus ]
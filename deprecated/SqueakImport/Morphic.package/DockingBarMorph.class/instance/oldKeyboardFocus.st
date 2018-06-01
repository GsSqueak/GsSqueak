events
oldKeyboardFocus
	
	oldKeyboardFocus = self
		ifTrue: [ ^nil ]
		ifFalse: [ ^oldKeyboardFocus ]
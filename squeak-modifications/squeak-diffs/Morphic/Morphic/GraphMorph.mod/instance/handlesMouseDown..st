event handling
handlesMouseDown: evt

	evt shiftPressed
		ifTrue: [^ super handlesMouseDown: evt]
		ifFalse: [^ true].

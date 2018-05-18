event handling
updateFromUserInputEvent: evt

	evt shiftPressed
		ifTrue: [self doCopy]
		ifFalse: [self doMove].
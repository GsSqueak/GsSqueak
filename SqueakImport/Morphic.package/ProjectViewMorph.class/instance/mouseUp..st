event handling
mouseUp: evt

	((self containsPoint: evt cursorPoint) and: 
				[(self hasProperty: #wasOpenedAsSubproject) not]) ifTrue:
		[^ self enter].
	self showMouseState: 3.

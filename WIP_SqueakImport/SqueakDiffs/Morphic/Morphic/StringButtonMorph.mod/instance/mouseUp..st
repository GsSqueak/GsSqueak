event handling
mouseUp: evt

	self color: oldColor.
	(actWhen == #buttonUp and: [self containsPoint: evt cursorPoint])
		ifTrue: [self doButtonAction].

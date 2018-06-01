event handling
mouseUp: evt

	lastAngle := self angle.
	autoCenter ifTrue: [self moveHandleToCenter].

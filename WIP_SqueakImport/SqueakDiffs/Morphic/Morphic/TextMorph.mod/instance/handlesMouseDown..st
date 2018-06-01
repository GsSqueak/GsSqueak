event handling
handlesMouseDown: evt
	self isPartsDonor ifTrue: [^ false].
	^ self innerBounds containsPoint: evt cursorPoint
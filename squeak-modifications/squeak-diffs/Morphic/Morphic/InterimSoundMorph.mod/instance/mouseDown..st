event handling
mouseDown: evt

	(graphic containsPoint: evt cursorPoint)
		ifTrue: [sound copy play]
		ifFalse: [super mouseDown: evt].

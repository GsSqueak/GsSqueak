event handling
handlesMouseDown: evt

	(graphic containsPoint: evt cursorPoint)
		ifTrue: [^ true]
		ifFalse: [^ super handlesMouseDown: evt].

event handling
mouseEnter: evt

	(self worldBounds containsPoint: evt cursorPoint) ifFalse: [^self].
	mouseInside := true.
	self positionVertically.
	
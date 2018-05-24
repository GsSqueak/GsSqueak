visual properties
updateVisualState: evt

	(self containsPoint: evt cursorPoint)
		ifTrue: [self darken]
		ifFalse: [self restoreImage].

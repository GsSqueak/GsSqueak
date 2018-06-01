event handling
mouseUp: evt

	| c |
	self stopStepping.
	sourceHand := nil.
	deleteOnMouseUp ifTrue: [self delete].
	c := self getColorFromKedamaWorldIfPossible: evt cursorPoint.
	c ifNotNil: [selectedColor := c].
	self updateTargetColor.

event handling
mouseDown: evt
	| localPt |
	localPt := evt cursorPoint - self topLeft.
	self deleteAllBalloons.
	clickedTranslucency := TransparentBox containsPoint: localPt.
	self inhibitDragging ifFalse: [
		(DragBox containsPoint: localPt)
			ifTrue: [^ evt hand grabMorph: self].
	].
	(RevertBox containsPoint: localPt)
		ifTrue: [^ self updateColor: originalColor feedbackColor: originalColor].
	self inhibitDragging ifFalse: [self comeToFront].
	sourceHand := evt hand.
	self startStepping.

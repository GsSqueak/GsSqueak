events
mouseMove: evt
	
	growingOrRotating
		ifTrue: [self doResizeTarget: evt]
		ifFalse: [self doDragTarget: evt].
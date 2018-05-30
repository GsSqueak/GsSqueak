events-processing
handleMouseDown: anEvent
	"System level event handling."
	anEvent wasHandled ifTrue:[^self]. "not interested"
	anEvent hand removePendingBalloonFor: self.
	anEvent hand removePendingHaloFor: self.
	anEvent wasHandled: true.

	"Make me modal during mouse transitions"
	anEvent hand newMouseFocus: self event: anEvent.
	
	"this mouse down could be the start of a gesture, or the end of a gesture focus"
	(self isGestureStart: anEvent)
		ifTrue: [^ self gestureStart: anEvent].

	self mouseDown: anEvent.

	(self handlesMouseStillDown: anEvent) ifTrue:[
		self startStepping: #handleMouseStillDown: 
			at: Time millisecondClockValue + self mouseStillDownThreshold
			arguments: {anEvent copy resetHandlerFields}
			stepTime: self mouseStillDownStepRate ].

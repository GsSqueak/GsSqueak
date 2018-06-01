events
mouseDown: event 
	self stopAutoTrigger.
	"Always bring me to the front since I am modal"
	self comeToFront.
	(self containsPoint: event position)
		ifFalse: [^ self autoCancel
				ifTrue: [self cancelDialog]
				ifFalse: [self flash]].
	event hand
		waitForClicksOrDrag: self
		event: event
		selectors: {nil. nil. nil. #startDrag:}
		threshold: HandMorph dragThreshold
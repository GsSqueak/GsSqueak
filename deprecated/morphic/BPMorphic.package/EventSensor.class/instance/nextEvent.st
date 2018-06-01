accessing
nextEvent
	"Return the next event from the receiver."
	^ self eventQueue
		ifNil: [self nextEventSynthesized]
		ifNotNil: [self nextEventFromQueue]
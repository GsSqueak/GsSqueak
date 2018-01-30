events-processing
sendFilterEventBubble: anEvent for: anObject 
	"Apply event bubbling filters."
	^ self
		sendFilterEventBubbleAgain: (self
				sendFilterEvent: anEvent
				for: anObject
				to: self eventBubbleFilters)
		for: anObject
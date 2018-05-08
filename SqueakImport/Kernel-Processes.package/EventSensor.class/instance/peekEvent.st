accessing
peekEvent
	"Look ahead at the next event. Try to fetch more events first."

	^ self eventQueue
		ifNil: [nil]
		ifNotNil: [:queue |
			self fetchMoreEvents.
			queue peek]
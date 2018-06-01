private
nextEventFromQueue
	"Return the next event from the receiver. If the queue is empty, try to
	fetch more events once."
	self eventQueue isEmpty
		ifTrue: [self fetchMoreEvents].
	^ self eventQueue isEmpty
		ifFalse: [self eventQueue next]
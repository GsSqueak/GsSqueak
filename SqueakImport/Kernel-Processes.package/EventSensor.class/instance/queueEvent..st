private-I/O
queueEvent: evt
	"Queue the given event in the event queue (if any).
	Note that the event buffer must be copied since it
	will be reused later on."
	
	self eventQueue ifNotNil: [:queue |
		queue nextPut: evt shallowCopy].
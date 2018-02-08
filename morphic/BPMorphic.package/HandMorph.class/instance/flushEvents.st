event handling
flushEvents
	"Flush any events that may be pending"
	self flag: #arNote.
	"Remove it and fix senders"
	Sensor flushEvents
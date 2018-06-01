private-I/O
fetchMoreEvents
	"Fetch more events from the VM"
	"Reset input semaphore so clients can wait for the next events after
	this one."
	| _gsSqueakTemp_eventBuffer _gsSqueakTemp_type |
	inputSemaphore isSignaled
		ifTrue: [hasInputSemaphore := true.
			inputSemaphore initSignals].
	"Remember the last time that I checked for events."
	lastEventPoll := Time millisecondClockValue.
	_gsSqueakTemp_eventBuffer := Array new: 8.
	[self primGetNextEvent: _gsSqueakTemp_eventBuffer.
	_gsSqueakTemp_type := _gsSqueakTemp_eventBuffer at: 1.
	_gsSqueakTemp_type = EventTypeNone]
		whileFalse: [self processEvent: _gsSqueakTemp_eventBuffer]
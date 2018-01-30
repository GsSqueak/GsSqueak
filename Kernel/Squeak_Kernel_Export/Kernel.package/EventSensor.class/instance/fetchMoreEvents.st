private-I/O
fetchMoreEvents
	"Fetch more events from the VM"
	| eventBuffer type |

	"Reset input semaphore so clients can wait for the next events after this one."
	inputSemaphore isSignaled
		ifTrue: [ hasInputSemaphore := true.
			inputSemaphore initSignals ].

	"Remember the last time that I checked for events."
	lastEventPoll := Time millisecondClockValue.

	eventBuffer := Array new: 8.
	[self primGetNextEvent: eventBuffer.
	type := eventBuffer at: 1.
	type = EventTypeNone]
		whileFalse: [self processEvent: eventBuffer].

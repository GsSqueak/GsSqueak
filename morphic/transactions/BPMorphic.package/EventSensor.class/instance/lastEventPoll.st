private
lastEventPoll
	"Answer the last clock value at which fetchMoreEvents was called."
	^ lastEventPoll
		ifNil: [lastEventPoll := Time millisecondClockValue]
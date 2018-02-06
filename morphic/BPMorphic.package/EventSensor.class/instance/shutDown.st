initialize
shutDown
	InterruptWatcherProcess
		ifNotNil: [InterruptWatcherProcess terminate.
			InterruptWatcherProcess := nil].
	EventTicklerProcess
		ifNotNil: [EventTicklerProcess terminate.
			EventTicklerProcess := nil].
	inputSemaphore
		ifNotNil: [Smalltalk unregisterExternalObject: inputSemaphore]
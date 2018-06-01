instance creation
forMilliseconds: anInteger
	"Return a new Delay for the given number of milliseconds. Sending 'wait' to this Delay will cause the sender's process to be suspended for approximately that length of time."

	anInteger < 0 ifTrue: [self error: 'delay times cannot be negative'].
	^ self new
		setDelay: anInteger asInteger
		forSemaphore: Semaphore new

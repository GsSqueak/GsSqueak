instance creation
forSeconds: aNumber
	"Return a new Delay for the given number of seconds. Sending 'wait' to this Delay will cause the sender's process to be suspended for approximately that length of time."

	aNumber < 0 ifTrue: [self error: 'delay times cannot be negative'].
	^ self new
		setDelay: (aNumber * 1000) asInteger
		forSemaphore: Semaphore new

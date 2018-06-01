waiting
waitForDataFor: timeout ifClosed: closedBlock ifTimedOut: timedOutBlock
	"Wait for the given nr of seconds for data to arrive."
	
	| deadline timeLeft |
	socketHandle ifNil: [ ^closedBlock value ].
	deadline := Time millisecondClockValue + (timeout * 1000) truncated.
	[
		(self primSocketReceiveDataAvailable: socketHandle) ifTrue: [ ^self ].
		self isConnected ifFalse: [ ^closedBlock value ].
		(timeLeft := deadline - Time millisecondClockValue) <= 0 ifTrue: [ ^timedOutBlock value ].
		"Providing a maximum for the time for waiting is a workaround for a VM bug which causes sockets waiting for data forever in some rare cases, because the semaphore doesn't get signaled. Remove the ""min: self class maximumReadSemaphoreWaitTimeout"" part when the bug is fixed."
		readSemaphore waitTimeoutMSecs: 
			(timeLeft min: self class maximumReadSemaphoreWaitTimeout) ] repeat
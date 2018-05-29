waiting
waitForDisconnectionFor: timeout
	"Wait for the given nr of seconds for the connection to be broken.
	Return true if it is broken by the deadline, false if not.
	The client should know the connection is really going to be closed
	(e.g., because he has called 'close' to send a close request to the other end)
	before calling this method."

	| deadline |
	deadline := Time millisecondClockValue + (timeout * 1000) truncated.
	[ self isConnected and: [ deadline - Time millisecondClockValue > 0 ] ]
		whileTrue: [
			self discardReceivedData.
			"Providing a maximum for the time for waiting is a workaround for a VM bug which causes sockets waiting for data forever in some rare cases, because the semaphore doesn't get signaled. Remove the ""min: self class maximumReadSemaphoreWaitTimeout"" part when the bug is fixed."
			readSemaphore waitTimeoutMSecs: 
				(deadline - Time millisecondClockValue min: self class maximumReadSemaphoreWaitTimeout) ].
	^self isConnected
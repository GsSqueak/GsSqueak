waiting
waitForDataIfClosed: closedBlock
	"Wait indefinitely for data to arrive.  This method will block until
	data is available or the socket is closed."

	socketHandle ifNil: [ ^closedBlock value ].
	[
		(self primSocketReceiveDataAvailable: socketHandle) ifTrue: [ ^self ].
		 self isConnected ifFalse: [ ^closedBlock value ].
		 "ul 8/13/2014 21:16
		  Providing a maximum for the time for waiting is a workaround for a VM bug which
		  causes sockets waiting for data forever in some rare cases, because the semaphore
		  doesn't get signaled. Replace the ""waitTimeoutMSecs: self class maximumReadSemaphoreWaitTimeout""
		  part with ""wait"" when the bug is fixed."
		 readSemaphore waitTimeoutMSecs: self class maximumReadSemaphoreWaitTimeout ] repeat
waiting
waitForSendDoneFor: timeout
	"Wait up until the given deadline for the current send operation to complete. Return true if it completes by the deadline, false if not."

	| deadline timeleft |
	deadline := Time millisecondClockValue + (timeout * 1000) truncated.
	[ 
		(self primSocketSendDone: socketHandle) ifTrue: [ ^true ].
		self isConnected ifFalse: [ ^false ].
		(timeleft := deadline - Time millisecondClockValue) <= 0 ifTrue: [ ^false ].
		writeSemaphore waitTimeoutMSecs: timeleft ] repeat
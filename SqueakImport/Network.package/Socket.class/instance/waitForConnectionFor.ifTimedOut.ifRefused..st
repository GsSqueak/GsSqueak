waiting
waitForConnectionFor: timeout ifTimedOut: timeoutBlock ifRefused: refusedBlock
	"Wait up until the given deadline for a connection to be established. Return true if it is established by the deadline, false if not."

	| deadline timeLeft status |
	deadline := Time millisecondClockValue + (timeout * 1000) truncated.
	(status := self primSocketConnectionStatus: socketHandle) == Connected ifTrue: [^true].
	[ (status == WaitingForConnection) and: [ (timeLeft := deadline - Time millisecondClockValue) > 0 ] ]
		whileTrue: [
			semaphore waitTimeoutMSecs: timeLeft.
			status := self primSocketConnectionStatus: socketHandle ].
	status == Connected ifTrue: [ ^true ].
	status == WaitingForConnection 
		ifTrue: [ timeoutBlock value ]
		ifFalse: [ refusedBlock value ].
	^false
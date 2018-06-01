waiting
waitForConnectionUntil: deadline
	"Wait up until the given deadline for a connection to be established. Return true if it is established by the deadline, false if not."

	| status timeLeft |
	[
		(status := self primSocketConnectionStatus: socketHandle) == Connected ifTrue: [ ^true ].
		status == WaitingForConnection ifFalse: [ ^false ].
		(timeLeft := deadline - Time millisecondClockValue) <= 0 ifTrue: [ ^false ].
		semaphore waitTimeoutMSecs: timeLeft ] repeat
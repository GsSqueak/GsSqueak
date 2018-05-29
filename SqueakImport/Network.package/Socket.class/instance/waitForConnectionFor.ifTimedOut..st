waiting
waitForConnectionFor: timeout ifTimedOut: timeoutBlock
	"Wait up until the given deadline for a connection to be established. Return true if it is established by the deadline, false if not."

	^ self waitForConnectionFor: timeout ifTimedOut: timeoutBlock ifRefused: timeoutBlock

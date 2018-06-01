accessing
localPort

	self isWaitingForConnection ifFalse: [
		self
			waitForConnectionFor: Socket standardTimeout
			ifTimedOut: [ ^0] ].
	^ self primSocketLocalPort: socketHandle
accessing
localAddress

	self isWaitingForConnection ifFalse: [
		self
			waitForConnectionFor: Socket standardTimeout
			ifTimedOut: [
				NetNameResolver useOldNetwork
					ifTrue: [^ByteArray new: 4]
					ifFalse: [^(ByteArray new: 4) asSocketAddress]]].
	NetNameResolver useOldNetwork
		ifTrue: [^self primSocketLocalAddress: socketHandle]
		ifFalse: [^(self primSocketLocalAddress: socketHandle) asSocketAddress]

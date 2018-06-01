accessing
remoteAddress

	NetNameResolver useOldNetwork
		ifTrue: [^self primSocketRemoteAddress: socketHandle]
		ifFalse: [^(self primSocketRemoteAddress: socketHandle) asSocketAddress]

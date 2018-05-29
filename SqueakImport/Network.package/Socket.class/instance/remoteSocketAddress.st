ipv6
remoteSocketAddress

	NetNameResolver useOldNetwork
		ifTrue: [ ^self primSocketRemoteAddress: socketHandle ]
		ifFalse: [
			| size addr |
			size := self primSocketRemoteAddressSize: socketHandle.
			addr := SocketAddress new: size.
			self primSocket: socketHandle remoteAddressResult: addr.
			^addr]
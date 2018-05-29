ipv6
localSocketAddress

	| size addr |
	size := self primSocketLocalAddressSize: socketHandle.
	addr := SocketAddress new: size.
	self primSocket: socketHandle localAddressResult: addr.
	^addr
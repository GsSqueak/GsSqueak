ipv6
bindTo: aSocketAddress

	| status |
	self initializeNetwork.
	status := self primSocketConnectionStatus: socketHandle.
	(status == Unconnected)
		ifFalse: [InvalidSocketStatusException signal: 'Socket status must Unconnected when binding it to an address'].

	self primSocket: socketHandle bindTo: aSocketAddress.

ipv6
listenWithBacklog: backlogSize

	| status |
	self initializeNetwork.
	status := self primSocketConnectionStatus: socketHandle.
	(status == Unconnected)
		ifFalse: [InvalidSocketStatusException signal: 'Socket status must Unconnected before it can listen for connections'].

	self primSocket: socketHandle listenWithBacklog: backlogSize.

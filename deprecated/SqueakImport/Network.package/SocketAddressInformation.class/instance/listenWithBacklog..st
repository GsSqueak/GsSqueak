circuit setup
listenWithBacklog: backlog

	| sock |
	(socketType == SocketTypeStream and: [protocol == ProtocolTCP]) ifFalse: [self error: 'cannot listen'].
	sock := Socket newTCP: addressFamily.
	sock bindTo: socketAddress.
	sock listenWithBacklog: 5.
	^sock
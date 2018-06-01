circuit setup
connect

	| sock |
	socketType == SocketTypeStream ifFalse: [^nil].
	sock := Socket newTCP: addressFamily.
	sock connectTo: socketAddress.
	sock waitForConnectionFor: Socket standardTimeout
		ifTimedOut: [ConnectionTimedOut signal: 'Cannot connect to ', self printString]
		ifRefused: [ConnectionRefused signal: 'Cannot connect to ', self printString].
	^sock
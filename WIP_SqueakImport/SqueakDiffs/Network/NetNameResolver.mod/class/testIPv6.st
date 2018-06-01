tests
testIPv6
	"NetNameResolver testIPv6"
	| world infos addr sock size host serverSocket listeningSocket clientSocket |
	world := Project current world.
	world findATranscript: world currentEvent.
	Transcript clear.
	"Transcript show: Smalltalk listLoadedModules; cr."
	self initializeNetwork.
	Transcript show: '---- host name ----'; cr.
	size := NetNameResolver primHostNameSize.
	host := String new: size.
	NetNameResolver primHostNameResult: host.
	Transcript show: host; cr.
	Transcript show: '---- address information ----'; cr.
	Transcript show: (infos := SocketAddressInformation
						forHost: 'localhost' service: 'echo' flags: 0
						addressFamily: 0 socketType: 0 protocol: 0) printString; cr.
	Transcript show: '---- port manipulation ----'; cr.
	addr := infos first socketAddress.
	Transcript show: addr port printString; cr.
	addr port: 1234.
	Transcript show: addr port printString; cr.
	Transcript show: addr printString; cr.
	Transcript show: '---- client socket ----'; cr.
	Transcript show: (infos := SocketAddressInformation
						forHost: 'localhost' service: 'echo' flags: 0
						addressFamily: 0
						socketType: SocketAddressInformation socketTypeStream
						protocol: SocketAddressInformation protocolTCP) printString; cr.
	infos do: [:info |
		Transcript show: 'Trying ', info printString, '... '.
		(sock := info connect) notNil
			ifTrue:
				[sock sendData: 'hello' count: 5.
				 Transcript show: sock receiveData printString.
				 sock close; destroy].
		Transcript cr].
	Transcript show: '---- localhost defaults: loopback and wildcard addresses ----'; cr.
	Transcript show: (SocketAddress loopbacks) printString; cr.
	Transcript show: (SocketAddress wildcards) printString; cr.
	Transcript show: (SocketAddress loopback4) printString; cr.
	Transcript show: (SocketAddress wildcard4) printString; cr.
	Transcript show: '---- impossible constraints ----'; cr.
	Transcript show: (SocketAddressInformation
						forHost: 'localhost' service: 'echo' flags: 0
						addressFamily:	0
						socketType:		SocketAddressInformation socketTypeDGram
						protocol:		SocketAddressInformation protocolTCP) printString; cr.
	Transcript show: '---- INET4 client-server ----'; cr.
	Transcript show: (infos := SocketAddressInformation
						forHost: '' service: '4242'
						flags:			SocketAddressInformation passiveFlag
						addressFamily:	SocketAddressInformation addressFamilyINET4
						socketType:		SocketAddressInformation socketTypeStream
						protocol:		SocketAddressInformation protocolTCP) printString; cr.
	listeningSocket := infos first listenWithBacklog: 5.
	Transcript show: (infos := SocketAddressInformation
						forHost: 'localhost' service: '4242'
						flags:			0
						addressFamily:	SocketAddressInformation addressFamilyINET4
						socketType:		SocketAddressInformation socketTypeStream
						protocol:		SocketAddressInformation protocolTCP) printString; cr.
	clientSocket := infos first connect.
	serverSocket := listeningSocket accept.
	serverSocket sendData: 'Hi there!' count: 9.
	Transcript show: clientSocket receiveData; cr.
	Transcript nextPutAll: 'client side local/remote: ';
		print: clientSocket localSocketAddress; space;
		print: clientSocket remoteSocketAddress; cr.
	Transcript nextPutAll: 'server side local/remote: ';
		print: serverSocket localSocketAddress; space;
		print: serverSocket remoteSocketAddress; cr;
		endEntry.
	clientSocket close; destroy.
	serverSocket close; destroy.
	listeningSocket close; destroy.
	Transcript show: '---- INET6 client-server ----'; cr.
	Transcript show: (infos := SocketAddressInformation
						forHost: '' service: '4242'
						flags:			SocketAddressInformation passiveFlag
						addressFamily:	SocketAddressInformation addressFamilyINET6
						socketType:		SocketAddressInformation socketTypeStream
						protocol:		SocketAddressInformation protocolTCP) printString; cr.
	infos isEmpty
		ifTrue: [Transcript show: 'FAIL -- CANNOT CREATE INET6 SERVER'; cr]
		ifFalse:
			[listeningSocket := infos first listenWithBacklog: 5.
			Transcript show: (infos := SocketAddressInformation
								forHost: 'localhost' service: '4242'
								flags:			0
								addressFamily:	SocketAddressInformation addressFamilyINET6
								socketType:		SocketAddressInformation socketTypeStream
								protocol:		SocketAddressInformation protocolTCP) printString; cr.
			clientSocket := infos first connect.
			serverSocket := listeningSocket accept.
			serverSocket sendData: 'Hi there!' count: 9.
			Transcript show: clientSocket receiveData; cr.
			Transcript nextPutAll: 'client side local/remote: ';
				print: clientSocket localSocketAddress; space;
				print: clientSocket remoteSocketAddress; cr.
			Transcript nextPutAll: 'server side local/remote: ';
				print: serverSocket localSocketAddress; space;
				print: serverSocket remoteSocketAddress; cr;
				endEntry.
			clientSocket close; destroy.
			serverSocket close; destroy.
			listeningSocket close; destroy].
	Transcript show: '---- trivial tests done ---'; cr.
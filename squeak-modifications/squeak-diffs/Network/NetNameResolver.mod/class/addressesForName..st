lookup
addressesForName: hostName
	"NetNameResolver addressesForName: 'impara.de' "
	
	| addresses |
	addresses := SocketAddressInformation
		forHost: hostName
		service: ''
		flags: 0
		addressFamily: 0
		socketType: SocketAddressInformation socketTypeStream
		protocol: SocketAddressInformation protocolTCP.
	^addresses
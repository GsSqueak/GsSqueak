instance creation
openConnectionToHostNamed: hostName port: portNumber
	
	NetNameResolver useOldNetwork
		ifTrue: [	| hostIP |
			hostIP := NetNameResolver addressForName: hostName timeout: 20.
			hostIP ifNil: [NetworkError signal: ('Cannot resolve {1}.' format: {hostName})].
			^self openConnectionToHost: hostIP port: portNumber]
		ifFalse: [| addressInformations lastError |
			addressInformations := SocketAddressInformation
				forHost: hostName
				service: portNumber asString
				flags: 0
				addressFamily: 0
				socketType: SocketAddressInformation socketTypeStream
				protocol: SocketAddressInformation protocolTCP.
			addressInformations do: [:addressInformation |
				[^ self on: addressInformation connect] on: NetworkError do: [:e | lastError := e]].
			^ lastError ifNotNil: [:e | e pass]]
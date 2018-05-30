instance creation
forHost: hostName service: servName flags: flags addressFamily: family socketType: type protocol: protocol

	| result addr |
	PrimitiveAccessProtect critical: [
		NetNameResolver initializeNetwork.
			NetNameResolver
				primGetAddressInfoHost: hostName
				service: servName
				flags: flags
				family: family
				type: type
				protocol: protocol.
			result := OrderedCollection new.
			[(addr := NetNameResolver nextSocketAddressInformation) notNil]
				whileTrue: [result add: addr]].
	^ result
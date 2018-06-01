private
registeredClients
	RegisteredClients ifNil: [RegisteredClients := Set new].
	^RegisteredClients
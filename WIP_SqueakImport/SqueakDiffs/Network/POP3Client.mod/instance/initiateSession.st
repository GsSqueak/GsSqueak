private protocol
initiateSession

	self sendCommand: 'CAPA'.
	self checkResponse.
	
	self parseCapabilities: self getMultilineResponse lines.
	
	(self tlsIsActive not and: [self serverSupportsStarttls] and: [self wantsStarttls])
		ifTrue: [self starttls]
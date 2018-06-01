system triggers
protocolAdded: aProtocol inClass: aClass 
	self trigger: (
		AddedEvent protocol: aProtocol class: aClass
	)
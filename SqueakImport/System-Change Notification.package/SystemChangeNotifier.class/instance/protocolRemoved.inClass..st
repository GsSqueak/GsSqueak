system triggers
protocolRemoved: aProtocol inClass: aClass 
	self trigger: (
		RemovedEvent protocol: aProtocol class: aClass
	)
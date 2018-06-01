system triggers
protocolRenamedFrom: anOldProtocol to: aNewProtocol inClass: aClass 
	self trigger: (
		(RenamedEvent protocol: anOldProtocol class: aClass)
			oldName: anOldProtocol;
			newName: aNewProtocol
	)
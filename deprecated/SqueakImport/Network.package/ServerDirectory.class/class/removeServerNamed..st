available servers
removeServerNamed: nameString
	self
		removeServerNamed: nameString
		ifAbsent: [self error: 'Server "' , nameString asString , '" not found']
available servers
serverNamed: nameString
	^self serverNamed: nameString ifAbsent: [self error: 'Server name not found']
testing
isValid

	^ self validPassword
		and: [self validUsername]
		and: [self validStoneName]
		and: [self validDevkitPath]
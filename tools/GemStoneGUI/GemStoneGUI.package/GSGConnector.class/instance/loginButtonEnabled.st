login button
loginButtonEnabled

	^ (self validPassword
		and: [self validUsername]
		and: [self validStoneName]
		and: [self validDevkitPath])
accessing
current
	^ CurrentEnvironment signal
		ifNil: [self default]
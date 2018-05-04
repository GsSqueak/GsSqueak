*EnvironmentsEnv7-accessing
current
	^ CurrentEnvironment signal
		ifNil: [self default]

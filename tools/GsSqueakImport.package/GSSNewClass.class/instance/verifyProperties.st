loading
verifyProperties

	super verifyProperties.
	self loadedSuperclass ifNil: [self error: 'Missing superclass']
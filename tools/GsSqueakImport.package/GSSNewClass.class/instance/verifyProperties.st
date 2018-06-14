loading
verifyProperties

	super verifyProperties.
	self isLinked
		ifFalse: [self loadedSuperclass ifNil: [self error: 'Missing superclass']]
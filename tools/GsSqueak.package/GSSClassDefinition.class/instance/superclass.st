accessing
superclass
	
	^ self loadedSuperclass ifNil: [self defaultSuperclass]
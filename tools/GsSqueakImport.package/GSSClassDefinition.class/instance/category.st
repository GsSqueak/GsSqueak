accessing
category
	
	^ self loadedCategory ifNil: [self defaultCategory]

accessing
name

	^ self loadedName ifNil: [self defaultName]
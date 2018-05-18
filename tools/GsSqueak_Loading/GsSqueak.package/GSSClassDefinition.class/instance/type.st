accessing
type
	
	^ self loadedType ifNil: [self defaultType]
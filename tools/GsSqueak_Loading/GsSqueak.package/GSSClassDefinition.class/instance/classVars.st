accessing
classVars
	
	^ self loadedClassVars ifNil: [self defaultClassVars]
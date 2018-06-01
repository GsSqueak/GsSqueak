accessing
classInstVars
	
	^ self loadedClassInstVars ifNil: [self defaultClassInstVars]

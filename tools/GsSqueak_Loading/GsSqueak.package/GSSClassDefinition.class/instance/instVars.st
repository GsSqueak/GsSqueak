accessing
instVars
	
	^ self loadedInstVars ifNil: [self defaultInstVars]
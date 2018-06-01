project parameters
projectParameters
	^ projectParameters ifNil: [self initializeProjectParameters]
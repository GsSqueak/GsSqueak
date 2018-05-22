accessing
default
	^ default ifNil: [self askForDefault]
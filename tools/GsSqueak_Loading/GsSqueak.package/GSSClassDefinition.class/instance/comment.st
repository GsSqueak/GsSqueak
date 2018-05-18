accessing
comment

	^ self loadedComment ifNil: [self defaultComment]
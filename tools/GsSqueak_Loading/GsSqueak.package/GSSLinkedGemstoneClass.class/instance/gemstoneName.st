accessing
gemstoneName

	^ self loadedGemstoneName ifNil: [self defaultGemstoneName]
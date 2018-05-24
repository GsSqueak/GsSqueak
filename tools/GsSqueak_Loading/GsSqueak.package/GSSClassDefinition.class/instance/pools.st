accessing
pools

	^ self loadedPools ifNil: [self defaultPools]
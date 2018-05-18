accessing
instanceMethods

	^ self loadedInstanceMethods ifNil: [self defaultInstanceMethods]
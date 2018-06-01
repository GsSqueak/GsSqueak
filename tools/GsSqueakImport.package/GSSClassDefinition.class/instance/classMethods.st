accessing
classMethods

	^ self loadedClassMethods ifNil: [self defaultClassMethods]
accessing
instanceMethods
	
	^ instanceMethods ifNil: [instanceMethods := OrderedCollection new]

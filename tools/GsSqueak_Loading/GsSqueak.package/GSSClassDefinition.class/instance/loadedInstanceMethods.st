accessing - loaded values
loadedInstanceMethods
	
	^ instanceMethods ifNil: [instanceMethods := OrderedCollection new]

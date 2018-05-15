accessing
classInstVars
	
	^ classInstVars ifNil: [classInstVars := OrderedCollection new]
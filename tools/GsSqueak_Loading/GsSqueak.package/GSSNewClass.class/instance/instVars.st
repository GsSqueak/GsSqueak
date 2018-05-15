accessing
instVars
	
	^ instVars ifNil: [instVars := OrderedCollection new]
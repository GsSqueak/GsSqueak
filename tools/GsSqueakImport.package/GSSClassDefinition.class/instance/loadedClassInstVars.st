accessing - loaded values
loadedClassInstVars
	
	^ self properties at: self keyForClassInstVars ifAbsent: [nil]

accessing - loaded values
loadedClassVars
	
	^ self properties at: self keyForClassVars ifAbsent: [nil]

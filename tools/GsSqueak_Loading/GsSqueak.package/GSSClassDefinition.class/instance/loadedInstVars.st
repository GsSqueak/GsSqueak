accessing - loaded values
loadedInstVars
	
	^ self properties at: self keyForInstVars ifAbsent: [nil]
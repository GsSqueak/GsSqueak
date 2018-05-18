accessing - loaded values
loadedCategory
	
	^ self properties at: self keyForCategory ifAbsent: [nil]

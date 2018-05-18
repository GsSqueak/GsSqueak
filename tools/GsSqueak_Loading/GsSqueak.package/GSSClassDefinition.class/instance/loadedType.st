accessing - loaded values
loadedType
	
	^ self properties at: self keyForType ifAbsent: [nil]
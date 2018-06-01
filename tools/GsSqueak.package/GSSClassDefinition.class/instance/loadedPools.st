accessing - loaded values
loadedPools
	
	^ self properties at: self keyForPools ifAbsent: [nil]

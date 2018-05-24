accessing - loaded values
loadedName

	^ self properties at: self keyForName ifAbsent: [nil]
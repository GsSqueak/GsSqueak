accessing
loadedGemstoneName

	^ self properties at: self keyForGemstoneName ifAbsent: [nil]
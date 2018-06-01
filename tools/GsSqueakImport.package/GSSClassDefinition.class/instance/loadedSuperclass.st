accessing - loaded values
loadedSuperclass

	^ self properties at: self keyForSuperclass ifAbsent: [nil]
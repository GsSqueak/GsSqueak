standard queries
showBoundsInHalo
	^ self
		valueOfFlag: #showBoundsInHalo
		ifAbsent: [true]
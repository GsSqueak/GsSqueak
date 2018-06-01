accessing
filterColor
	^ self
		valueOfProperty: #filterColor
		ifAbsent: [Color yellow]
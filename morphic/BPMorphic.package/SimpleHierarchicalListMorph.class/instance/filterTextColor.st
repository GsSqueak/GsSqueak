accessing
filterTextColor
	^ self
		valueOfProperty: #filterTextColor
		ifAbsent: [Color black]
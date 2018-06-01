accessing
caretColor
	^ self
		valueOfProperty: #caretColor
		ifAbsent: [Color red]
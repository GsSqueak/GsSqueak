accessing
wrapBorderColor
	^ self
		valueOfProperty: #wrapBorderColor
		ifAbsent: [Color gray alpha: 0.3]
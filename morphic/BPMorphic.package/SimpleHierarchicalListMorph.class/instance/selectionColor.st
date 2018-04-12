accessing
selectionColor
	^ self
		valueOfProperty: #selectionColor
		ifAbsent: [Color blue]
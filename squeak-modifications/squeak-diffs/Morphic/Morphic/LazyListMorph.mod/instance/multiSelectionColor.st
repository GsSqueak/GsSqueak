accessing
multiSelectionColor

	^ self valueOfProperty: #multiSelectionColor ifAbsent: [self selectionColor asColor]
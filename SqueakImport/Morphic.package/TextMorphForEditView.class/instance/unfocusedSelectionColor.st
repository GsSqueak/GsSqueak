accessing
unfocusedSelectionColor
	^ self valueOfProperty: #unfocusedSelectionColor ifAbsent: [Color blue muchLighter]
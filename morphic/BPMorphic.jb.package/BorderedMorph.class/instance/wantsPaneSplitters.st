resize handling
wantsPaneSplitters
	^ self
		valueOfProperty: #allowPaneSplitters
		ifAbsent: [false]
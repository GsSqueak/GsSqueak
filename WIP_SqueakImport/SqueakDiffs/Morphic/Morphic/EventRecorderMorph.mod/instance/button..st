accessing
button: label 
	^ self allMorphs
		detect: [:one | (one isKindOf: SimpleButtonMorph)
				and: [one label = label]]
		ifNone: []
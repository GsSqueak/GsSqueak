instance creation
position: aPoint label: shortDescription min: minValue max: maxValue 
	UniqueInstance ifNil: [ UniqueInstance := super new ].
	^ UniqueInstance
		position: aPoint
		label: (shortDescription contractTo: 100)
		min: minValue asFloat
		max: maxValue asFloat
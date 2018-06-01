naming
innocuousName
	^ morphRepresented isNil
		ifTrue: [super innocuousName]
		ifFalse: [morphRepresented innocuousName]
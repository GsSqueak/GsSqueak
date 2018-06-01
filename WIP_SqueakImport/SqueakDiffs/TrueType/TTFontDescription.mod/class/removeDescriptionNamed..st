instance creation
removeDescriptionNamed: descriptionName

	| tt |
	Descriptions ifNil: [^ self].
	[(tt :=  Descriptions detect: [:f | f first name = descriptionName] ifNone: [nil]) notNil] whileTrue:[
		 Descriptions remove: tt
	].

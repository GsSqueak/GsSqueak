instance creation
descriptionNamed: descriptionName

	^ Descriptions detect: [:f | f first name = descriptionName] ifNone: [Default].

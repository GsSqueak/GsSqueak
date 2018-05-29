instance creation
descriptionFullNamed: descriptionFullName 
	^ Descriptions
		detect: [:f | f first fullName = descriptionFullName]
		ifNone: [Default]
instance creation
forRepository: aRepository

	^ self requestUsername ifNotNil: [:username |
		(super forRepository: aRepository) ifNotNil: [:environment |
			environment
				username: username;
				yourself]]
	
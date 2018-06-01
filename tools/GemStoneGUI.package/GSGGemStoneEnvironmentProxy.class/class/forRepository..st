instance creation
forRepository: aRepository

	^ self chooseEnvironmentId ifNotNil: [:envId |
		(super forRepository: aRepository) ifNotNil: [:environment |
			environment
				environmentId: envId;
				yourself]]
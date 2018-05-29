repository management
openRepositories

	^ self availableRepositoryTypes gather: [:repository |
		repository instances]
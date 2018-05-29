user interface
openRepository

	^ self chooseRepositoryType
		ifNotNil: [:repositoryType | repositoryType open]
	
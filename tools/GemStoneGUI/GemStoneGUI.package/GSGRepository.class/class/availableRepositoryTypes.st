repository management
availableRepositoryTypes

	^ Array streamContents: [:stream |
		self allSubclassesDo: [:repositoryType |
			repositoryType isAbstract ifFalse: [
				stream nextPut: repositoryType]]]
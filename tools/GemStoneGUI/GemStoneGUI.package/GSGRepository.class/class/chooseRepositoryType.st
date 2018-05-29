user interface
chooseRepositoryType

	| repositoryTypes repositoryLabels |
	repositoryTypes := self availableRepositoryTypes.
	repositoryLabels := repositoryTypes collect: [:repository | repository label].
	^ UIManager default
		chooseFrom: repositoryLabels
		values: repositoryTypes
		title: 'Choose a Repository Type to Open'.
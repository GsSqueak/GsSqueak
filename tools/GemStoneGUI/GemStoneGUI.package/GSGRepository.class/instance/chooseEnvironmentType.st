environments
chooseEnvironmentType

	| environmentTypes environmentLabels |
	environmentTypes := self availableEnvironmentTypes ifEmpty: [^ nil].
	environmentTypes size = 1 ifTrue: [^ environmentTypes first].
	environmentLabels := environmentTypes collect: [:environmentType |
							(environmentType respondsTo: #label)
								ifTrue: [environmentType label]
								ifFalse: [environmentType printString]].
	^ UIManager default
		chooseFrom: environmentLabels
		values: environmentTypes
		title: 'What Kind of Environment?'
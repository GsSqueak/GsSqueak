user interface
chooseOrOpenRepository

	| openRepositories repositoryLabels choice |
	openRepositories := self openRepositories ifEmpty: [^ self openRepository].
	repositoryLabels := openRepositories collect: [:repository | repository label].
	choice := UIManager default
		chooseFrom: #('-- New Repository --') , repositoryLabels
		values: #(new) , openRepositories
		title: 'New or Already Open Repository?'.
	^ choice = #new
		ifTrue: [self openRepository]
		ifFalse: [choice]
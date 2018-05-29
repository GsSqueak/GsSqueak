all changes
allChangeTypes

	| chgs |
	(priorName ~~ nil and: [changeTypes includes: #rename]) ifTrue:
		[(chgs := changeTypes copy) add: 'oldName: ' , priorName.
		^ chgs].
	^ changeTypes
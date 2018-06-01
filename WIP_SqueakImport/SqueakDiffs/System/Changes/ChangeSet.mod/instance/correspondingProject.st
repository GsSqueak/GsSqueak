testing
correspondingProject
	"If the receiver is the current change set for any project, answer it, else answer nil"

	^Project allProjects 
		detect: [ :proj |
			proj projectChangeSet == self
		]
		ifNone: [nil]


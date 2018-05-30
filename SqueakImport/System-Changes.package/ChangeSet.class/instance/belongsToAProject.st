testing
belongsToAProject

	Smalltalk at: #Project ifPresent:
		[:projClass | projClass allProjects do:
			[:proj | proj projectChangeSet == self ifTrue: [^ true]]].
	^ false
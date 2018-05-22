utilities
allProjects

	^AllProjects ifNil: [
		Smalltalk garbageCollect.
		AllProjects := self allSubInstances select: [:p | p name notNil].
	].
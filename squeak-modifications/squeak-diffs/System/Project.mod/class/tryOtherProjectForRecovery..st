error recovery
tryOtherProjectForRecovery: errorMessage
	"Try entering the parent project if it uses a different user interface. We determine this by comparing the project's class."
	
	| safeProject nextProject |
	nextProject := Project current.
	safeProject := nil.
	"Search parent projects for one of a different type"
	[safeProject notNil or: [nextProject isTopProject]] whileFalse: [
		nextProject := nextProject parent.
		(Project current isKindOf: nextProject class)
			ifFalse: [safeProject := nextProject]].
	"No suitable parent project found, search all projects for any one of different type."
	safeProject ifNil: [Smalltalk garbageCollect.
		safeProject := Project allSubInstances
			detect: [:proj | (proj isKindOf: Project current class) not] ifNone: []].
	safeProject ifNotNil: [:p | 
		p enterForEmergencyRecovery.
		"Active process will usually suspend after this."].

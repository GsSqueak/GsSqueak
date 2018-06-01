utilities
ofWorld: anObject
	"Find the project of a world."

	"Usually it is the current project"
	CurrentProject world == anObject ifTrue: [^ CurrentProject].

	"Inefficient enumeration if it is not..."
	^ self allProjects detect: [:pr |
		pr world isInMemory 
			ifTrue: [pr world == anObject]
			ifFalse: [false]]
		ifNone: [nil]
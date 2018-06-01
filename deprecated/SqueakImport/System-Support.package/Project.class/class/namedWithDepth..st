utilities
namedWithDepth: projName
	"Answer the project with the given name, or nil if there is no project of that given name."
	"(Project named: 'New Changes') enter"

	^ self allProjects
		detect: [:proj | 
			  proj name = projName or:
				[proj nameAdjustedForDepth = projName]]
		ifNone: [nil]
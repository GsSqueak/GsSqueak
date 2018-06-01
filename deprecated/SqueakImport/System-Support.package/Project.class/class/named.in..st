utilities
named: projName in: aListOfProjects
	"Answer the project with the given name, or nil if there is no project of that given name."
	"Use given collection for speed until we get faster #allProjects"

	^ aListOfProjects
		detect: [:proj | proj name = projName]
		ifNone: [nil]

utilities
topProject
	"Answer the top project.  There is only one"

	^ self allProjects detect: [:p | p isTopProject]
utilities
allProjectsOrdered
	"Answer a list of all projects in hierarchical order, depth first"
	
	| allProjects  |
	allProjects := OrderedCollection new.
	Project topProject withChildrenDo:
		[:p | allProjects add: p].
	^ allProjects

"
Project allProjectsOrdered
"
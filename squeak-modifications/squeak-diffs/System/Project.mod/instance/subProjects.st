sub-projects & hierarchy
subProjects
	"Answer a list of all the subprojects of the receiver. By default, use the list of all projects and traverse the parent."
	
	^ Project allProjects select: [:p | p parent == self and: [p isTopProject not]]
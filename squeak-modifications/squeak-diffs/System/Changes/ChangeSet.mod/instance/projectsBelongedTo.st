testing
projectsBelongedTo
	"Answer a list of all the projects for which the receiver is the current change set"

	^ Project allProjects select: [:proj | proj projectChangeSet == self]

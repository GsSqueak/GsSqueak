sub-projects & hierarchy
isTopProject
	"Return true only if this is the top project (its own parent).
	Also include the test here for malformed project hierarchy."

	parentProject == self ifTrue: [^ true].
	parentProject == nil ifTrue: [self error: 'No project should have a nil parent'].
	^ false
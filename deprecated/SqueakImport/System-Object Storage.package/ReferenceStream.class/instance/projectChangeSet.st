writing
projectChangeSet
	| pr |
	"The changeSet of the project we are writing"
	(pr := self project) ifNil: [^ nil].
	^ pr projectChangeSet
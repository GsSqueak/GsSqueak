private
fileInMCVersion: member withBootstrap: mcBootstrap
	"This will use the MCBootstrapLoader to load a (non-compressed) Monticello file (.mc or .mcv)"
	| newCS |
	self class withCurrentChangeSetNamed: member localFileName
		do: [ :cs | 
			newCS := cs.
			mcBootstrap loadStream: member contentStream ascii ].

	newCS isEmpty ifTrue: [ ChangeSet removeChangeSet: newCS ].

	Project current world doOneCycle.

	self installed: member.
class initialization
initialize
	"ChangeSet initialize"
	AllChangeSets == nil ifTrue:
		[AllChangeSets := OrderedCollection new].
	
	"no instances should exist here suring GsSqueak bootstrap"
	"self gatherChangeSets."
	
	FileServices registerFileReader: self.

access
at: index
	"compatibility interface"
	self deprecated: 'old-style access to DirectoryEntry'.
	index = 1 ifTrue: [ ^self name ].
	index = 2 ifTrue: [ ^self creationTime ].
	index = 3 ifTrue: [ ^self modificationTime ].
	index = 4 ifTrue:[ ^self isDirectory ].
	index = 5 ifTrue:[ ^self fileSize ].
	self error: 'invalid index specified'.

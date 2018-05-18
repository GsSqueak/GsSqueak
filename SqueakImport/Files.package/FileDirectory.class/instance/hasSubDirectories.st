testing
hasSubDirectories
	"Return true if we find an entry that is a directory, false otherwise"
	"FileDirectory default hasSubDirectories"

	self entriesDo: [ :entry |entry isDirectory ifTrue: [^true] ] .
	^false
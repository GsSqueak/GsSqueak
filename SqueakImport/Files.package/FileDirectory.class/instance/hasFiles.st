testing
hasFiles
	"Return true if we find an entry that is a file, false otherwise"
	"FileDirectory default hasFiles"

	self entriesDo: [ :entry |entry isDirectory ifFalse: [^true] ] .
	^false
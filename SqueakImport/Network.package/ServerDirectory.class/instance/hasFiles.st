testing
hasFiles
	"Return true if we find an entry that is a file, false otherwise"
	"(ServerDirectory serverNamed: 'UIUCArchive') hasFiles"

	^ self entries anySatisfy: [:entry | entry isDirectory not]
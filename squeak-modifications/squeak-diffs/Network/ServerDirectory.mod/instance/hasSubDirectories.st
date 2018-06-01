testing
hasSubDirectories
	"Return true if we find an entry that is a directory, false otherwise"
	"(ServerDirectory serverNamed: 'UIUCArchive') hasSubDirectories"

	^ self entries anySatisfy: [:entry | entry isDirectory]
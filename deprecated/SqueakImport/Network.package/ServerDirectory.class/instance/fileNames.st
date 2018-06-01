file directory
fileNames
	"Return a collection of names for the files (but not directories) in this directory."
	"(ServerDirectory serverNamed: 'UIUCArchive') fileNames"

	^ self entries select: [:entry | entry isDirectory not]
		thenCollect: [:entry | entry name]

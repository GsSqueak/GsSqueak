file directory
directoryNames
	"Return a collection of names for the subdirectories of this directory."
	"(ServerDirectory serverNamed: 'UIUCArchive') directoryNames"

	^ (self entries select: [:entry | entry isDirectory and: [entry name ~= '.' and:[entry name ~= '..']]])
		collect: [:entry | entry name]

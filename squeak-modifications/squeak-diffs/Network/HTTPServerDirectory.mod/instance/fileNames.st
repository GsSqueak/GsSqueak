file directory
fileNames
	"Return a collection of names for the files (but not directories) in this directory."
	"(ServerDirectory serverNamed: 'UIUCArchive') fileNames"

	self dirListUrl
		ifNil: [^self error: 'No URL set for fetching the directory listing.'	].
	^(self entries select: [:entry | entry isDirectory not])
		collect: [:entry | entry name]

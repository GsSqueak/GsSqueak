testing
directoryExists: filenameOrPath
	"Answer true if a directory of the given name exists. The given name may be either a full path name or a local directory within this directory."
	"FileDirectory default directoryExists: FileDirectory default pathName"

	| fName dir |
	DirectoryClass
		splitName: filenameOrPath
		to: [:filePath :name |
			fName := name.
			dir := filePath isEmpty
					ifTrue: [self]
					ifFalse: [FileDirectory on: filePath]].

	^dir exists
	  and: [(dir directoryEntryForName: fName)
			ifNotNil: [:e| e isDirectory]
			ifNil: [false]]
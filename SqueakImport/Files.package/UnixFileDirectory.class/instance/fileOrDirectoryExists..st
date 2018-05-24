testing
fileOrDirectoryExists: filenameOrPath
	"Answer true if either a file or a directory file of the given name exists. The given name
	 may be either a full path name or a local name within this directory. Overrides to handle
	 the root directory / and relative paths."
	| fName dir |

	filenameOrPath = '/' ifTrue:
		[^true].

	DirectoryClass
		splitName: filenameOrPath
		to: [:filePath :name |
			fName := name.
			dir := filePath isEmpty
					ifTrue: [self]
					ifFalse:
						[FileDirectory on: (filePath first = $/
											ifTrue: [filePath]
											ifFalse: [self fullName, '/', filePath])]].

	^dir exists
	  and: [(dir includesKey: fName) or: [fName isEmpty and: [dir entries size > 1]]]
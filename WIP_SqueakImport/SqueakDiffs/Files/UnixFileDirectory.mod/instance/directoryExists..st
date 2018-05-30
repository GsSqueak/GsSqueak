testing
directoryExists: filenameOrPath
	"Answers true if the directory exists.  Overrides to handle the root directory /
	 and relative paths."
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
	  and: [(dir directoryEntryForName: fName)
			ifNotNil: [:e| e isDirectory]
			ifNil: [false]]
enumeration
directoryEntryFor: filenameOrPath
	"Answer the directory entry for the given file or path."
	^ DirectoryClass
		splitName: filenameOrPath
		to:
			[ : filePath : name | | filename directory |
			filename := name.
			directory := filePath isEmpty
				ifTrue: [ self ]
				ifFalse: [ FileDirectory on: filePath ].
			 directory
				entryAt: filename
				ifAbsent: [ nil ] ]
directory tree
hasMoreDirectories: aDirectory 
	(aDirectory isKindOf: FileDirectory)
		ifFalse: [^ true].
	"server directory; don't ask"
	^ directoryCache
		at: aDirectory
		ifAbsentPut: [[aDirectory directoryNames notEmpty]
				on: Error
				do: [:ex | true]]
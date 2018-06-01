directory tree
hasMoreDirectories: aDirectory
	"The directory tree morph needs to know if a specific directory has subdirectories; we cache the answer to speed up later visits to the same directory"

	^directoryCache at: aDirectory ifAbsentPut:[
		[aDirectory hasSubDirectories] on: Error do:[:ex| true].
	].
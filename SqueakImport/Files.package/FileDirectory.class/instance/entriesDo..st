enumeration
entriesDo: aBlock
	"Evaluate aBlock with DirectoryEntry's for the files and directories in this directory.  See primLookupEntryIn:index: for further details."
	
	^self directoryContentsFor: pathName do: aBlock

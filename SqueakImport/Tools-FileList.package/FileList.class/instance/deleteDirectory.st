volume list and pattern
deleteDirectory
	"Remove the currently selected directory"
	| localDirName |
	directory hasEntries ifTrue:[^self inform:'Directory must be empty' translated].
	localDirName := directory localName.
	(self confirm: ('Really delete {1}?' translated format: {localDirName})) ifFalse: [^ self].
	self volumeListIndex: self volumeListIndex-1.
	directory deleteDirectory: localDirName.
	self updateFileList.
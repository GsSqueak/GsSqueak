volume list and pattern
deleteDirectory
	"Remove the currently selected directory"
	| _gsSqueakTemp_localDirName |
	directory hasEntries
		ifTrue: [^ self inform: 'Directory must be empty' translated].
	_gsSqueakTemp_localDirName := directory localName.
	(self
			confirm: ('Really delete {1}?' translated format: {_gsSqueakTemp_localDirName}))
		ifFalse: [^ self].
	self volumeListIndex: self volumeListIndex - 1.
	directory deleteDirectory: _gsSqueakTemp_localDirName.
	self updateFileList
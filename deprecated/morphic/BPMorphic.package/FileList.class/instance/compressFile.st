file menu action
compressFile
	"Compress the currently selected file"
	| _gsSqueakTemp_f |
	_gsSqueakTemp_f := StandardFileStream
				readOnlyFileNamed: (directory fullNameFor: self fullName).
	_gsSqueakTemp_f compressFile.
	self updateFileList
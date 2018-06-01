file menu action
compressFile
	"Compress the currently selected file"

	| f |
	f := StandardFileStream
				readOnlyFileNamed: (directory fullNameFor: self fullName).
	f compressFile.
	self updateFileList
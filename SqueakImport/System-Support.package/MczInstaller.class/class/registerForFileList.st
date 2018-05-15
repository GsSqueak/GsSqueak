services
registerForFileList
	Smalltalk at: #MCReader ifAbsent: [FileServices registerFileReader: self]
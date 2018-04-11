volume list and pattern
veryDeepFixupWith: deepCopier 
	super veryDeepFixupWith: deepCopier.
	volListIndex := 1.
	self directory: FileDirectory default.
	self updateFileList
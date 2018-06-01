fileout
fileoutTo: aFileDirectory
	
	self assureFileDirectoryIn: aFileDirectory.
	self fileoutProperties.
	self fileoutComment.
	self fileoutMethods
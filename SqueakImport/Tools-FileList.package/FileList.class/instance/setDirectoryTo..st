directory tree
setDirectoryTo: dir
	"Set the current directory shown in the FileList. 
	Does not allow setting the directory to nil since this blows up in various places."
	dir ifNil:[^self].
	self directory: dir.
	brevityState := #FileList.
	self changed: #fileList.
	self changed: #contents.
	self changed: #pathAndPattern.
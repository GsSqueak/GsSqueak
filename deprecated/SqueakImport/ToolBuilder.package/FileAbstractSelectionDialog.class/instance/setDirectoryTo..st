directory tree
setDirectoryTo: dir
	"Set the current directory shown in the FileList. 
	Does not allow setting the directory to nil since this blows up in various places."

	dir ifNil:[^self].
"okToChange is probably redundant.
modelSleep/Wake is related to use of ServerDirectories, which are not yet hooked up"
	self okToChange ifFalse: [ ^ self ].
	self modelSleep.
	self directory: dir.
	self modelWakeUp.
	self changed: #directory.
	self updateFileList.
	self changed: #inputText
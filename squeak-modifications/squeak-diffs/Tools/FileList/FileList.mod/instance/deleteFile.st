file menu action
deleteFile
	"Delete the currently selected file"
	listIndex = 0 ifTrue: [^ self].
	(self confirm: ('Really delete {1}?' translated format:{fileName})) ifFalse: [^ self].
	directory deleteFileNamed: fileName.
	self updateFileList.
	brevityState := #FileList.
	self get
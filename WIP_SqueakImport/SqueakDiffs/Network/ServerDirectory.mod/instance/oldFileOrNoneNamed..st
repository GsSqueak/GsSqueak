file directory
oldFileOrNoneNamed: fullName
	"If the file exists, answer a read-only RemoteFileStream on it. If it doesn't, answer nil.  fullName is directory path, and does include name of the server.  Or just a simple fileName.  Do prefetch the data."
 
	
	^ Cursor wait showWhile:
		[ | file |
		file := self asServerFileNamed: fullName.
		file readOnly.
		"file exists ifFalse: [^ nil]."		"on the server"
		file isTypeFile
			ifTrue: [FileStream oldFileOrNoneNamed: (file fileNameRelativeTo: self)]
			ifFalse: [self streamOnBeginningOf: file]]
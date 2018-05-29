fileIn/Out
readTape: fileName 
	| file |
	self writeCheck.
	(FileStream isAFileNamed: fileName) ifFalse: [^ nil].
	file := FileStream oldFileNamed: fileName.
	tape := self readFrom: file.
	file close.
	saved := true  "Still exists on file"
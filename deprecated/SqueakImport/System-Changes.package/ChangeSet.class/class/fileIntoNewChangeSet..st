services
fileIntoNewChangeSet: fullName
	"File in all of the contents of the currently selected file, if any, into a new change set." 

	| fn ff |
	fullName ifNil: [^ Beeper beep].
	ff := FileStream readOnlyFileNamed: (fn := GZipReadStream uncompressedFileName: fullName).
	ChangeSet newChangesFromStream: ff named: (FileDirectory localNameFor: fn)
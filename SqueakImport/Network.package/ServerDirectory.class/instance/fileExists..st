up/download
fileExists: fileName
	"Does the file exist on this server directory?  fileName must be simple with no / or references to other directories."

	| stream |
	self isTypeFile ifTrue: [^ self fileNames includes: fileName].
	self isTypeHTTP ifTrue: [
		stream := self readOnlyFileNamed: fileName.
		^stream contents notEmpty].
	"ftp"
	^ self entries anySatisfy: [:entry | entry name = fileName]
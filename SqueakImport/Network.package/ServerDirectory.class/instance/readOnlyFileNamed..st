file directory
readOnlyFileNamed: aName
	"If the file exists, answer a read-only RemoteFileStream on it.  aName is directory path, and does include name of the server.  Or it can just be a fileName.  For now, pre-read the file."

	| rFile |

	rFile := self asServerFileNamed: aName.
	rFile readOnly.
	rFile isTypeFile ifTrue: [
		^ FileStream oldFileNamed: (rFile fileNameRelativeTo: self)].

	^self streamOnBeginningOf: rFile
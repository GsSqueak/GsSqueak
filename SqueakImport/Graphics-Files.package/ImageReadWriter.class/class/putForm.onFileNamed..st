image reading/writing
putForm: aForm onFileNamed: fileName
	"Store the given form on a file of the given name."

	| writer theFile |
	theFile := FileStream newFileNamed: fileName.
	writer := self on: theFile binary.
	Cursor write showWhile: [writer nextPutImage: aForm].
	writer close.
	theFile directory setMacFileNamed: theFile localName type: '    ' creator: '    '.
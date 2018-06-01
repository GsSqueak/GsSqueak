image reading/writing
putForm: aForm quality: quality progressiveJPEG: progressiveFlag onFileNamed: fileName
	"Store the given Form as a JPEG file of the given name, overwriting any existing file of that name. Quality goes from 0 (low) to 100 (high), where -1 means default. If progressiveFlag is true, encode as a progressive JPEG."

	| writer theFile |
	FileDirectory deleteFilePath: fileName.
	theFile := FileStream newFileNamed: fileName.
	writer := self on: theFile binary.
	Cursor write showWhile: [
		writer nextPutImage: aForm quality: quality progressiveJPEG: progressiveFlag].
	writer close.
	theFile directory setMacFileNamed: theFile localName type: '    ' creator: '    '.
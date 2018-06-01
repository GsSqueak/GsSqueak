utilities
compressFileNamed: aFileName in: aDirectory
	"Compress the currently selected file"
	| zipped buffer unzipped zipFileName |
	unzipped := aDirectory readOnlyFileNamed: (aDirectory fullNameFor: aFileName).
	unzipped binary.
	zipFileName := aFileName copyUpToLast: $. .
	zipped := aDirectory newFileNamed: (zipFileName, FileDirectory dot, ImageSegment compressedFileExtension).
	zipped binary.
	zipped := GZipWriteStream on: zipped.
	buffer := ByteArray new: 50000.
	'Compressing ', zipFileName
		displayProgressFrom: 0 to: unzipped size
		during:[:bar|
			[unzipped atEnd] whileFalse:[
				bar value: unzipped position.
				zipped nextPutAll: (unzipped nextInto: buffer)].
			zipped close.
			unzipped close].

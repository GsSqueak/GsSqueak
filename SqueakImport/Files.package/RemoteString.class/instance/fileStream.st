accessing
fileStream 
	"Answer the file stream with position set at the beginning of my string"

	| theFile |
	(sourceFileNumber == nil or: [(SourceFiles at: sourceFileNumber) == nil]) ifTrue: [^ nil].
	theFile := SourceFiles at: sourceFileNumber.
	theFile position: filePositionHi.
	^ theFile
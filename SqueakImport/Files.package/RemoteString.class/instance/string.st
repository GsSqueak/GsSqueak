accessing
string 
	"Answer the receiver's string if remote files are enabled."
	| theFile |
	(sourceFileNumber == nil or: [(SourceFiles at: sourceFileNumber) == nil]) ifTrue: [^''].
	theFile := SourceFiles at: sourceFileNumber.
	theFile position: filePositionHi.
	^ theFile nextChunk
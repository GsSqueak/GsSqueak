accessing
text 
	"Answer the receiver's string asText if remote files are enabled."

	| theFile |
	theFile := (CurrentReadOnlySourceFiles at: (sourceFileNumber ifNil: [ ^nil ])) ifNil: [ ^nil ].
	theFile size <= filePositionHi ifTrue: [ 
		 "SourceFiles might have been appended to since theFile was opened. Flush the written data and reopen theFile to make it see the changes."
		(SourceFiles at: sourceFileNumber) flush.
		theFile reopen. "Currently the only way to re-read the size field of a read-only file on unix..." ].
	theFile size < filePositionHi ifTrue: [
		self error: 'RemoteString past end of file' ].
	^theFile
		position: filePositionHi;
		nextChunkText
instance creation
onFileNamed: fileName headerStart: anInteger
	"Answer an instance of me for playing audio data starting at the given position in the file with the given name."

	| f |
	f := FileDirectory default readOnlyFileNamed: fileName.
	f ifNil: [^ self error: 'could not open ', fileName].
	^ self new initStream: f headerStart: anInteger

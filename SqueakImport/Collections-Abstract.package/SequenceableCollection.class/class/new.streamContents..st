stream creation
new: newSize streamContents: blockWithArg

	| stream originalContents |
	stream := WriteStream on: (self new: newSize).
	blockWithArg value: stream.
	originalContents := stream originalContents.
	originalContents size =  stream position
		ifTrue: [ ^originalContents ]
		ifFalse: [ ^stream contents ]
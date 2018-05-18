read, write, position
nextPut: element
	"Write the given element (character or integer) to this file."

	rwmode ifFalse: [^ self error: 'Cannot write a read-only file'].
	collection ifNotNil:
		[position < readLimit ifTrue: [ self flushReadBuffer ] ].
	buffer1 at: 1 put: element.
	self primWrite: fileID from: buffer1 startingAt: 1 count: 1.
	lastWritten := element.
	^ element

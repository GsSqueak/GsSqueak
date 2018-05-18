read, write, position
nextPutAll: aCollection
	"Write all the elements of the given collection (a String or IntegerArray of some kind) to this file."
	| size |
	rwmode ifFalse: [^ self error: 'Cannot write a read-only file'].
	collection ifNotNil:
		[position < readLimit ifTrue: [ self flushReadBuffer]].
	(size := aCollection basicSize) > 0 ifTrue:
		[self primWrite: fileID from: aCollection startingAt: 1 count: size.
		 lastWritten := aCollection at: size].
	^ aCollection
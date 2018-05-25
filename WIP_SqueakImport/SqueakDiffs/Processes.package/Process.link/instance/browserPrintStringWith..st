printing
browserPrintStringWith: anObject 
	| stream |
	stream := WriteStream
				on: (String new: 100).
	stream nextPut: $(.
	priority printOn: stream.
	self isSuspended
		ifTrue: [stream nextPut: $s].
	stream nextPutAll: ') '.
	stream nextPutAll: self name.
	stream nextPut: $:.
	stream space.
	stream nextPutAll: anObject asString.
	^ stream contents
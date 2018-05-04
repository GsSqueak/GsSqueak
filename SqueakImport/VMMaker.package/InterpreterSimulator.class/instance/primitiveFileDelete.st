file primitives
primitiveFileDelete 

	| namePointer |
	namePointer := self stackTop.
	self success: (objectMemory isBytes: namePointer).
	self success: (StandardFileStream isAFileNamed: (self stringOf: namePointer)).
	self successful ifTrue: [FileDirectory deleteFilePath: (self stringOf: namePointer)].
	self successful ifTrue: [self pop: 1].  "pop fileName; leave rcvr on stack"

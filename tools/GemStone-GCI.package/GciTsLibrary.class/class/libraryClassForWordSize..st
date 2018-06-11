instance creation
libraryClassForWordSize: bytes

	bytes = 8 ifTrue: [^ Gci64bit].
	bytes = 4 ifTrue: [^ Gci32bit61].
	self error: ('{1}bit is not a recognized word size' format: {bytes})
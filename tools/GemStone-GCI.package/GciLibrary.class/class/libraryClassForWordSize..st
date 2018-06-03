instance creation
libraryClassForWordSize: bits

	bits = 64 ifTrue: [^ Gci64bit].
	bits = 32 ifTrue: [^ Gci32bit61].
	self error: ('{1}bit is not a recognized word size' format: {bits})
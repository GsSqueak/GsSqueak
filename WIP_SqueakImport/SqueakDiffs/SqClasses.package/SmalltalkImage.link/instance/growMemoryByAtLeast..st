*SqClasses-*SqClasses-*SqClasses-memory space
growMemoryByAtLeast: numBytes
	"Grow memory by at least the requested number of bytes.
	 Primitive.  Fail if no memory is available.  Essential.
	 N.B. In Spur, the heap is composed of segments. Growing memory adds a new
	 segment; it does not extend existing segments. Growth is by at least that
	 established by SmalltalkImage current vmParameterAt: 25, which defaults to 16Mb."
	
	^(numBytes isInteger and: [numBytes > 0])
		ifTrue: [OutOfMemory signal]
		ifFalse: [self primitiveFailed]

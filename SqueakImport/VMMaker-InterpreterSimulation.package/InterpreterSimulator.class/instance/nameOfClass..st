debug support
nameOfClass: classOop
	(objectMemory sizeBitsOf: classOop) = (Metaclass instSize + 1 * bytesPerWord) ifTrue:
		[^ (self nameOfClass:
				(objectMemory fetchPointer: 5 "thisClass" ofObject: classOop)) , ' class'].
	^ self stringOf: (objectMemory fetchPointer: 6 "name" ofObject: classOop)
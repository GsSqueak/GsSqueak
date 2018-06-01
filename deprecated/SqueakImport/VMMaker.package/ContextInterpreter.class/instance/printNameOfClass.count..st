debug printing
printNameOfClass: classOop count: cnt
	"Details: The count argument is used to avoid a possible infinite recursion if classOop is a corrupted object."

	cnt <= 0 ifTrue: [ ^ self print: 'bad class' ].
	(objectMemory sizeBitsOf: classOop) = (7 * objectMemory bytesPerWord)	"(Metaclass instSize+1 * 4)"
		ifTrue: [self printNameOfClass: (objectMemory fetchPointer: 5 "thisClass" ofObject: classOop) 
					count: cnt - 1.
				self print: ' class']
	ifFalse: [self printStringOf: (objectMemory fetchPointer: 6 "name" ofObject: classOop)]
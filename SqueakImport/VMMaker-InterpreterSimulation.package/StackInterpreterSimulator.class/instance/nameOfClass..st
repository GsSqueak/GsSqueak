debug support
nameOfClass: classOop
	(objectMemory sizeBitsOf: classOop) = metaclassSizeBytes ifTrue:
		[^(self nameOfClass:
				(objectMemory fetchPointer: thisClassIndex ofObject: classOop)) , ' class'].
	^self stringOf: (objectMemory fetchPointer: classNameIndex ofObject: classOop)
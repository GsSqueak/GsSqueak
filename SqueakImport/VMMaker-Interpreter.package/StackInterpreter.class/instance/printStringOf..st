debug printing
printStringOf: oop
	| fmt cnt i |
	<inline: false>
	(objectMemory isIntegerObject: oop) ifTrue:
		[^nil].
	(oop between: objectMemory startOfMemory and: objectMemory freeStart) ifFalse:
		[^nil].
	(oop bitAnd: (objectMemory bytesPerWord - 1)) ~= 0 ifTrue:
		[^nil].
	fmt := objectMemory formatOf: oop.
	fmt < 8 ifTrue: [ ^nil ].

	cnt := 100 min: (objectMemory lengthOf: oop).
	i := 0.

	((objectMemory is: oop
		  instanceOf: (objectMemory splObj: ClassByteArray)
		  compactClassIndex: classByteArrayCompactIndex)
	or: [(objectMemory is: oop
			instanceOf: (objectMemory splObj: ClassLargePositiveInteger)
			compactClassIndex: ClassLargePositiveIntegerCompactIndex)
	or: [(objectMemory is: oop
			instanceOf: (objectMemory splObj: ClassLargeNegativeInteger)
			compactClassIndex: ClassLargeNegativeIntegerCompactIndex)]])
		ifTrue:
			[[i < cnt] whileTrue: [
				self printHex: (objectMemory fetchByte: i ofObject: oop).
				i := i + 1]]
		ifFalse:
			[[i < cnt] whileTrue: [
				self printChar: (objectMemory fetchByte: i ofObject: oop).
				i := i + 1]].
	self flush
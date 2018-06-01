debug printing
printStringOf: oop

	| fmt cnt i |
	(objectMemory isIntegerObject: oop) ifTrue:[^nil].
	fmt := objectMemory formatOf: oop.
	fmt < 8 ifTrue: [ ^nil ].

	cnt := 100 min: (objectMemory lengthOf: oop).
	i := 0.
	[i < cnt] whileTrue: [
		self printChar: (objectMemory fetchByte: i ofObject: oop).
		i := i + 1.
	].
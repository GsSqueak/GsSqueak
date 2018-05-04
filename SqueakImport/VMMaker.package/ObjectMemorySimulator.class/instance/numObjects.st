debug support
numObjects

	| count oop |
	count := 0.
	oop := self firstObject.
	[oop < self getEndOfMemory] whileTrue:
			[(self isFreeObject: oop)
				ifFalse: [count := count + 1].
			oop := self objectAfter: oop].
	^count

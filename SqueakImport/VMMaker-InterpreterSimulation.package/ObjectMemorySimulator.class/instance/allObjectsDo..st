debug support
allObjectsDo: objBlock

	| oop |
	oop := self firstObject.
	[oop < self getEndOfMemory] whileTrue:
			[(self isFreeObject: oop)
				ifFalse: [objBlock value: oop].
			oop := self objectAfter: oop].

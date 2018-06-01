debug support
allObjectsDo: objBlock

	| oop |
	oop := objectMemory firstObject.
	[oop < objectMemory getEndOfMemory] whileTrue:
			[(objectMemory isFreeObject: oop)
				ifFalse: [objBlock value: oop].
			oop := objectMemory objectAfter: oop].

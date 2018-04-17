*SqKernel-comparing
= aClosure
	self == aClosure ifTrue: [^true].
	aClosure class = self class ifFalse: [^false].
	(self method == aClosure method and: [startpc = aClosure startpc and: [self isClean]])
		ifTrue: [^true].
	^outerContext = aClosure outerContext and: [startpc = aClosure startpc]


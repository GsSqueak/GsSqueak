printing
printOn: aStream
	self == Smalltalk globals
		ifTrue: [aStream nextPutAll: 'Smalltalk globals'.
			aStream nextPutAll:' "a SystemDictionary with lots of globals"']
		ifFalse: [super printOn: aStream]
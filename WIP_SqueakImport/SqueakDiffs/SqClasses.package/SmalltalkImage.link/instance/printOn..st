*SqClasses-*SqClasses-*SqClasses-miscellaneous
printOn: aStream
	self == Smalltalk
		ifTrue: [aStream nextPutAll: #Smalltalk]
		ifFalse: [super printOn: aStream]

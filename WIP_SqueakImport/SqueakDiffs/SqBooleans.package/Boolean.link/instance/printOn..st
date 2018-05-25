printing
printOn: aStream 

	aStream nextPutAll: (self ifTrue: ['true' ] ifFalse: ['false'])

printing
printOn: aStream 
	| aName |
	super printOn: aStream.
	(aName := self knownName) notNil 
		ifTrue: [aStream nextPutAll: '<' , aName , '>'].
	aStream nextPutAll: '('.
	aStream
		print: self identityHash;
		nextPutAll: ')'
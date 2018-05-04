translating builtins
generateIsMemberOf: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->isMemberOf('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ','''.
	self emitCExpression: aNode args first on: aStream.
	aStream nextPutAll: ''')'.
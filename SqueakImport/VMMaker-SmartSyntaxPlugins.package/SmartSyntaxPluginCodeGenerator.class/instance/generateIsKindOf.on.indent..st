translating builtins
generateIsKindOf: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->isKindOf('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ','''.
	self emitCExpression: aNode args first on: aStream.
	aStream nextPutAll: ''')'.
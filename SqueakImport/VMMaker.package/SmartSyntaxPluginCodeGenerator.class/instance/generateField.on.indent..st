translating builtins
generateField: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->fetchPointerofObject('.
	self emitCExpression: aNode args first on: aStream.
	aStream nextPutAll: ','.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ')'.
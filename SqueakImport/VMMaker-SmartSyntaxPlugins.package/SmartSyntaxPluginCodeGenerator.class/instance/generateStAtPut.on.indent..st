translating builtins
generateStAtPut: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->stObjectatput('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ','.
	self emitCExpression: aNode args first on: aStream.
	aStream nextPutAll: ','.
	self emitCExpression: aNode args second on: aStream.
	aStream nextPutAll: ')'

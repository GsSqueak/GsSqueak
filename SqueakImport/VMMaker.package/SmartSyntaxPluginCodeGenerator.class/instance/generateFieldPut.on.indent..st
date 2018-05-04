translating builtins
generateFieldPut: aNode on: aStream indent: anInteger
		
	aStream nextPutAll: 'interpreterProxy->storePointerofObjectwithValue('.
	self emitCExpression: aNode args first on: aStream.
	aStream nextPutAll: ','.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ','.
	self emitCExpression: aNode args second on: aStream.
	aStream nextPutAll: ')'.
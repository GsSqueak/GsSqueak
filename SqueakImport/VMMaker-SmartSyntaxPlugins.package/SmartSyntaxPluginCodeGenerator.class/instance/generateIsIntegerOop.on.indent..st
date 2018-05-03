translating builtins
generateIsIntegerOop: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->isIntegerObject('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ')'.
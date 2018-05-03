translating builtins
generateAsCDouble: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->floatValueOf('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ')'.
asOop:/asValue:
generateCoerceToUnsignedObjectFrom: aNode on: aStream

	aStream nextPutAll: 'interpreterProxy->positive32BitIntegerFor('.
	self emitCExpression: aNode on: aStream.
	aStream nextPutAll: ')'
asOop:/asValue:
generateCoerceToUnsignedValueFrom: aNode on: aStream

	aStream nextPutAll: 'interpreterProxy->positive32BitValueOf('.
	self emitCExpression: aNode on: aStream.
	aStream nextPutAll: ')'
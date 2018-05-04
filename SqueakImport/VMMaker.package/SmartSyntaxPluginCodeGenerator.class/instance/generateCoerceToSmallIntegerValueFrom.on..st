asOop:/asValue:
generateCoerceToSmallIntegerValueFrom: aNode on: aStream

	aStream nextPutAll: 'interpreterProxy->integerValueOf('.
	self emitCExpression: aNode on: aStream.
	aStream nextPutAll: ')'
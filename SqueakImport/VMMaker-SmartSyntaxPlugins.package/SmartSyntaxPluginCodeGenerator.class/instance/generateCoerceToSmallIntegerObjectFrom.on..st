asOop:/asValue:
generateCoerceToSmallIntegerObjectFrom: aNode on: aStream

	aStream nextPutAll: 'interpreterProxy->integerObjectOf('.
	self emitCExpression: aNode on: aStream.
	aStream nextPutAll: ')'
asOop:/asValue:
generateCoerceToObjectFromPtr: aNode on: aStream
	"This code assumes no named instance variables"

	aStream nextPutAll: 'oopForPointer('.
	self emitCExpression: aNode on: aStream.
	aStream nextPutAll: ') - BASE_HEADER_SIZE'
asOop:/asValue:
generateCoerceToPtr: aString fromObject: aNode on: aStream
	"This code assumes no named instance variables"

	aStream 
		nextPutAll: '((';
		nextPutAll: aString;
		nextPutAll: ') interpreterProxy->firstIndexableField('.
	self emitCExpression: aNode on: aStream.
	aStream nextPutAll: '))'
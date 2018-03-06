printing
printOn: aStream 
	aStream nextPut: $<;
		 print: self message;
		 nextPutAll: ' "in '.
	method
		ifNil: [aStream nextPutAll: '???']
		ifNotNil: [method printReferenceOn: aStream].
	aStream nextPutAll: '">'
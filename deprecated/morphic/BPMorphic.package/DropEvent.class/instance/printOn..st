printing
printOn: aStream 
	aStream nextPut: $[.
	aStream nextPutAll: self position printString;
		 space.
	aStream nextPutAll: self type.
	aStream nextPut: $]
printing
printOn: aStream 
	"Print the receiver on a stream"
	aStream nextPut: $[.
	aStream nextPutAll: self cursorPoint printString;
		 space.
	aStream nextPutAll: type;
		 nextPutAll: ' '''.
	self printKeyStringOn: aStream.
	aStream nextPut: $';
		 space.
	aStream nextPut: $(.
	aStream nextPutAll: keyValue printString.
	aStream nextPut: $);
		 space.
	aStream nextPutAll: timeStamp printString.
	aStream nextPut: $]
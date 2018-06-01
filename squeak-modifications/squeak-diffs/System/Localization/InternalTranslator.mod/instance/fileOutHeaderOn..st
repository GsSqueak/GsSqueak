user interface
fileOutHeaderOn: aStream 
	aStream binary.
	UTF8TextConverter writeBOMOn: aStream.
	aStream text.
	aStream nextChunkPut: self fileOutHeader;
		 cr.
	aStream timeStamp; cr.
	aStream nextPut: $!.
	aStream nextChunkPut: '(' , self class name , ' localeID: ' , id storeString , ')'.
	aStream cr
fileIn/fileOut
fileOutHeaderOn: aStream 
	aStream nextChunkPut: self fileOutHeader;
		 cr.
	aStream timeStamp; cr.
	aStream nextPut: $!.
	aStream nextChunkPut: '(' , self class name , ' localeID: ' , id storeString , ')'.
	aStream cr
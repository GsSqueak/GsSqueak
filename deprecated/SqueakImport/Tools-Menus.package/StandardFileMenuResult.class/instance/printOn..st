accessing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: ' with directory: '.
	directory printOn: aStream.
	aStream nextPutAll: ' name: '.
	name printOn: aStream

"StandardFileMenu oldFile"
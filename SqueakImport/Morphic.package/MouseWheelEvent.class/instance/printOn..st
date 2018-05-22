printing
printOn: aStream

	aStream nextPut: $[.
	aStream nextPutAll: self cursorPoint printString; space.
	aStream nextPutAll: type; space.
	aStream nextPutAll: self wheelString.
	aStream nextPutAll: self wheelDelta printString; space.
	aStream nextPutAll: self modifierString.
	aStream nextPutAll: self buttonString.
	aStream nextPutAll: timeStamp printString; space.
	aStream nextPut: $].
printing
printOn: aStream
	"Append a textual representation of the receiver to aStream"

	super printOn: aStream.
	aStream nextPutAll: ' "', self wording, '"'
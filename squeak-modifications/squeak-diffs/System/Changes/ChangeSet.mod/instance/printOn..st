accessing
printOn: aStream
	"2/7/96 sw: provide the receiver's name in the printout"
	super printOn: aStream.
	aStream nextPutAll: ' named ', self name
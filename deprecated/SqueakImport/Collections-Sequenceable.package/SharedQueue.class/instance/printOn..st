private
printOn: aStream
	super printOn: aStream.
	"Print a guesstimate of the size of the queue without aquiring the lock properly"
	aStream nextPut: $(.
	aStream print: writePosition - readPosition.
	aStream nextPut: $).
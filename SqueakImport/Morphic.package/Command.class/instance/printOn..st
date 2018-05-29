printing
printOn: aStream
	"Provide more detailed info about the receiver, put in for debugging, maybe should be removed"

	super printOn: aStream.
	aStream nextPutAll: ' phase: ', phase printString.
	cmdWording ifNotNil: [aStream nextPutAll: '; ', cmdWording asString].
	parameters ifNotNil:
		[parameters associationsDo:
			[:assoc | aStream nextPutAll: ': ', assoc printString]]
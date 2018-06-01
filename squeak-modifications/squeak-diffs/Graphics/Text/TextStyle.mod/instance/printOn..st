accessing
printOn: aStream

	super printOn: aStream.
	self defaultFont printShortDescriptionOn: aStream

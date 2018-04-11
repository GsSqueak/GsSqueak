*SqClasses-fileIn/Out
storeDataOn: aDataStream
	"I don't get stored.  Use a DiskProxy"

	(aDataStream insideASegment and: [self isSystemDefined not]) ifTrue: [
		^ super storeDataOn: aDataStream].	"do trace me"
	self error: 'use a DiskProxy to store a Class'

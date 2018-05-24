instance creation
on: aStream
	"Open a new ReferenceStream on a place to put the raw data."

	aStream class == ReadWriteStream ifTrue: [
		self inform: 'Please consider using a RWBinaryOrTextStream 
instead of a ReadWriteStream'].

	^ super on: aStream

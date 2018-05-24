stream extensions
show: anObject
	"TextCollector compatibility"
	
	[
		self nextPutAll: anObject asString.
		self endEntry
	] on: FileWriteError do: [self class redirectToStdOut: false].
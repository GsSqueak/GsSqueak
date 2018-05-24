stream extensions
showln: anObject
	"TextCollector compatibility. Ensure a new line before inserting a message."
	
	[
		self
			cr;
			nextPutAll: anObject asString.
		self endEntry.
	] on: FileWriteError do: [self class redirectToStdOut: false].
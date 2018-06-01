enumeration
directoryEntries
	"Return a collection of full entries for the subdirectories of this directory."
	"FileDirectory default directoryEntries"

	^Array streamContents: [ :stream |
		self entriesDo: [ :entry |
			entry isDirectory ifTrue: [
				stream nextPut: entry ]]]
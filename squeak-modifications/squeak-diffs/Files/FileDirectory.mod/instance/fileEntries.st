enumeration
fileEntries
	"Return a collection of the full entries for the files (but not directories) in this directory."
	"FileDirectory default fileEntries"

	^Array streamContents: [ :stream |
		self entriesDo: [ :entry |
			entry isDirectory ifFalse: [
				stream nextPut: entry ]]]
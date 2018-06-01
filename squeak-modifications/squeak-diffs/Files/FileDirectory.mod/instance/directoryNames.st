enumeration
directoryNames
	"Return a collection of names for the subdirectories of this directory."
	"FileDirectory default directoryNames"

	^Array streamContents: [ :stream |
		self entriesDo: [ :entry |
			entry isDirectory ifTrue: [
				stream nextPut: entry name ] ] ]
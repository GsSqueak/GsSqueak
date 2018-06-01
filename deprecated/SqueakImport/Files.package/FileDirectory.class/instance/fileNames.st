enumeration
fileNames
	"Return a collection of names for the files (but not directories) in this directory."
	"FileDirectory default fileNames"

	^Array streamContents: [ :stream |
		self entriesDo: [ :entry |
			entry isDirectory ifFalse: [
				stream nextPut: entry name ] ] ]
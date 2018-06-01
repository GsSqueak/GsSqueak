enumeration
fileAndDirectoryNames
	"FileDirectory default fileAndDirectoryNames"
	
	^Array streamContents: [ :stream |
		self entriesDo: [ :entry |
			stream nextPut: entry name ] ]